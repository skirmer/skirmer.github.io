import feedparser
from mdutils.mdutils import MdUtils
from bs4 import BeautifulSoup
import requests
from urllib.parse import urlparse
from markdownify import markdownify as md
import re
import string
import os
import hashlib

## get content from medium rss

## Generate page in hugo and save

rss_items = feedparser.parse('https://medium.com/feed/@s.kirmer')
website_title = rss_items.feed.title
entries = rss_items.entries
IMAGE_ROOT = "static/images"

def slugify(title):
    return title.replace(" ", "_").lower().translate(str.maketrans('', '', string.punctuation))


def download_image(img_url, slug):
    """Download an image to static/images/<slug>/<hash>.<ext> and return the
    local filesystem path plus the URL path Hugo should use to reference it."""
    folder = os.path.join(IMAGE_ROOT, slug)
    os.makedirs(folder, exist_ok=True)

    parsed = urlparse(img_url)
    ext = os.path.splitext(parsed.path)[1]
    if not ext or len(ext) > 5:
        ext = ".jpg"  # Medium image URLs often don't have a clean extension

    filename = hashlib.md5(img_url.encode()).hexdigest()[:12] + ext
    filepath = os.path.join(folder, filename)

    if not os.path.exists(filepath):
        try:
            headers = {
                "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
                               "AppleWebKit/537.36 (KHTML, like Gecko) "
                               "Chrome/120.0 Safari/537.36"
            }
            resp = requests.get(img_url, headers=headers, timeout=10)
            resp.raise_for_status()
            with open(filepath, "wb") as f:
                f.write(resp.content)
        except Exception as e:
            print(f"Failed to download {img_url}: {e}")
            return None, None

    site_path = f"/images/{slug}/{filename}"
    return filepath, site_path

def get_soup(base_item):
    soup = BeautifulSoup(base_item['content'][0]['value'], 'html.parser')
    return soup

def get_image(soup, slug):
    if soup.figure:
        img_link = soup.figure.img['src']
        img_caption = soup.figure.figcaption
        _, local_path = download_image(img_link, slug)
        return (local_path or img_link), img_caption
    else:
        print("No figure tag, skip")
        return "none", "none"

def get_date(soup):
    date = soup.published_parsed
    year = date[0]
    month = str(date[1]).zfill(2)
    day = str(date[2]).zfill(2)
    return year, month, day

def get_tags(base_item):
    tags = [j['term'] for j in base_item['tags']]
    return tags

def generate_yaml(img_link, tags, base_item, year, month, day, summary=""):
    yaml_str = f"""
---
date: {year}-{month}-{day}
featured_image: "{img_link}"
tags: ["{'","'.join(tags)}"]
title: "{base_item['title']}"
summary: "{summary}"
disable_share: false
---
    """
    return yaml_str

def get_body(base_item):
    body = md(base_item, strip=['figure', 'figcaption', 'title', 'img']) 
    return body
  
def get_subtitle(soup):
    subtitle = soup.find_all('h4')[0].text
    return subtitle  

def download_inline_images(soup, slug):
    """Find every <img> in the body, download it, and rewrite its src to the
    local path so markdownify picks up the local reference."""
    for img in soup.find_all('img'):
        src = img.get('src')
        if not src:
            continue
        _, local_path = download_image(src, slug)
        if local_path:
            img['src'] = local_path

def get_body2(soup, slug):
    download_inline_images(soup, slug)  
    replace_video_embeds(soup) 
    base_item = soup.prettify()
    body = md(base_item, strip=['figure', 'figcaption', 'title'])
    return body

def resolve_medium_media_link(media_url):
    """Medium's RSS wraps video embeds in a proxy URL like
    https://medium.com/media/<hash>/href, which redirects to the real
    source (e.g. YouTube). Follow the redirect to get the real URL."""
    try:
        resp = requests.head(media_url, allow_redirects=True, timeout=10)
        return resp.url
    except Exception as e:
        print(f"Failed to resolve {media_url}: {e}")
        return media_url  # fall back to the original link
    
def replace_video_embeds(soup):
    # iframes (embedly or medium's own proxy)
    for iframe in soup.find_all('iframe'):
        src = iframe.get('src', '')
        original_url = None
        if 'embedly.com' in src:
            qs = parse_qs(urlparse(src).query)
            if 'src' in qs:
                original_url = unquote(qs['src'][0])
        elif 'youtube.com' in src:
            original_url = src
        elif 'medium.com/media' in src:
            original_url = resolve_medium_media_link(src)

        if original_url:
            new_tag = soup.new_tag('a', href=original_url)
            new_tag.string = original_url
            iframe.replace_with(new_tag)

    # anchor tags pointing at medium.com/media proxy links
    for a in soup.find_all('a', href=True):
        if 'medium.com/media' in a['href']:
            real_url = resolve_medium_media_link(a['href'])
            a['href'] = real_url
            a.string = real_url

def get_summary(soup, max_words=40):
    """Grab the first real paragraph of body text, skipping headers like
    the title/subtitle, for use as an explicit Hugo summary."""
    for p in soup.find_all('p'):
        text = p.get_text(strip=True)
        if text:
            words = text.split()
            if len(words) > max_words:
                text = " ".join(words[:max_words]).rstrip(",.;:") + "…"
            return text
    return ""



for i in entries:
    print(i['title'])
    slug = slugify(i['title'])

    soup = get_soup(i)
    summary = get_summary(soup)
    img_link, img_caption = get_image(soup, slug)
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
    body = get_body2(soup, slug)
    yaml_str = generate_yaml(img_link, tags, i, year, month, day, summary=summary)

    mdFile = MdUtils(file_name=f"content/writing/{slug}")
    mdFile.write(f"{yaml_str}")
    mdFile.new_line()
    mdFile.write(f"{body}")
    mdFile.create_md_file()