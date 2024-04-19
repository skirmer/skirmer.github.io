import feedparser
from mdutils.mdutils import MdUtils
from bs4 import BeautifulSoup
from urllib.request import urlretrieve
from markdownify import markdownify as md
import re
import string
## get content from medium rss

## Generate page in hugo and save

rss_items = feedparser.parse('https://medium.com/feed/@s.kirmer')
website_title = rss_items.feed.title
entries = rss_items.entries

def get_soup(base_item):
    soup = BeautifulSoup(base_item['content'][0]['value'], 'html.parser')
    return soup

def get_image(soup):
    image = soup.figure
    img_link = soup.figure.img['src']
    img_caption = soup.figure.figcaption
    return img_link, img_caption

def get_date(soup):
    date = soup.published_parsed
    year = date[0]
    month = str(date[1]).zfill(2)
    day = str(date[2]).zfill(2)
    return year, month, day

def get_tags(base_item):
    tags = [j['term'] for j in base_item['tags']]
    return tags

def generate_yaml(img_link, tags, base_item, year, month, day, subtitle=None):
    yaml_str = f"""
---
date: {year}-{month}-{day}
featured_image: "{img_link}"
tags: ["{'","'.join(tags)}"]
title: "{base_item['title']}"
disable_share: false
---
    """
    # summary: "{subtitle}"

    return yaml_str

def get_body(base_item):
    body = md(base_item, strip=['figure', 'figcaption', 'title', 'img']) 
    return body
  
def get_subtitle(soup):
    subtitle = soup.find_all('h4')[0].text
    return subtitle  

def get_body2(soup):
    i_tag = soup.figure
    i_tag.decompose()
    base_item = soup.prettify()

    body = md(base_item, strip=['figure', 'figcaption', 'title', 'img']) 
    return body
    

for i in entries:
    print(i['title'])
    soup = get_soup(i)
    img_link, img_caption = get_image(soup)
    tags = get_tags(i)  
    year, month, day = get_date(i)
    print(year, month, day)

    # Debating whether to make subtitles automatically the summary- not currently doing this but TBD
    # If I do want to do that, just need to add subtitle as argument to generate_yaml
    try:
        subtitle = get_subtitle(soup)
    except:
        subtitle = ""
    print(subtitle)
    body = get_body2(soup)
    yaml_str = generate_yaml(img_link, tags, i, year, month, day)

    mdFile = MdUtils(file_name=f"""content/writing/{i['title'].replace(" ", "_").lower().translate(str.maketrans('', '', string.punctuation))}""")
    mdFile.write(f"{yaml_str}")
    mdFile.new_line()
    mdFile.write(f"{body}")
    mdFile.create_md_file()