



---
date: 
featured_image: "https://cdn-images-1.medium.com/max/1024/0*nAxy3grlI480D1Nr"
tags: ["logistics","machine-learning","data-science","geospatial","supply-chain"]
title: "Setting Healthy Boundaries: Generating Geofences at Scale with Machine Learning (Part 1)"
disable_share: false
---
      

*Want to learn more about this project and how we implemented it? Join me at* 
[*MLOps Community Chicago on Nov 10, 2022*](https://www.meetup.com/mlops-chicago/events/289352930/)
*where I’ll be presenting this work with a special focus on the deployment and taking it through to production.* 




 At project44, we offer customers a whole assortment of data driven products that help them better understand their shipments and the movement of goods around the world. We build complex, intelligent tools that make logistics easier and more transparent. But all these products are based on a foundation of data objects and artifacts. For example, we have outstanding models that generate estimated arrival times for shipments in all manner of modes across shipping, but these models are only as good as the data you feed into them. We all know that Garbage In, Garbage Out is the reality of data science.




> 
>  At project44, we offer customers a whole assortment of data driven products that help them better understand their shipments and the movement of goods around the world.
> 



 The project I’m describing here was not a glamorous effort to train the hottest new model on top of our data — this project was about making the data itself better. In this case, specifically we wanted to more accurately understand where our customers’ stores, warehouses, distribution centers, and other facilities are located.
 **If we do that, we can generate more precise and accurate timestamps for movements of shipments, and that’s information our models use to do their work.** 




 In short, this project is about cleaning up the data.



### 
**Location Geofences**



 The specific thing we wanted to fix up in our data framework was what are called geofences, in our case geofences around spatial locations. When we identify a customer facility, this is usually provided in the form of a street address or possibly a latitude/longitude point.




 However, as much of our work involves snapping vehicle telemetry to such a location, we need to have a process for determining that a particular truck location update should (or should not) be tied to that location.






 The red points above are at Welles Park in Chicago, while the purple points are Horner Park. For this example, we’ll create a geofence that captures the correct points.
 


 It’s important to keep in mind that there is no third party source for this kind of data. We can’t just hit an API to find out that a location visit has occurred, because this information is not collected or reported by most customers. As a result, it’s hugely important for us to generate this information accurately and consistently using GPS telemetry.




 Location geofences, or virtual perimeter boundaries around a coordinate point, are a standard, easy to apply method for making this determination. If a telemetry point is located within the perimeter, then we can confidently argue it is related to the location represented.




 There are lots of ways to define these location geofences, many of which require little to no technical expertise. Draw a circle around the coordinate point, with a consistent radius all around, and you’ve got a geofence. In some cases, this might even be adequate. But for us, this was the bare minimum — not sufficient to produce the quality of data our customers demand, and our downstream data products require.




 Another way you can define a location geofence is by looking at a satellite image and drawing the perimeter you want by hand. Perhaps you include a parking lot, or a nearby roadway. This has some big flaws, however. For one thing, how do you know for sure what adjacent features you want to include? Are you sure that the parking lot north of the building is used by that facility, or is it the south one? Or both? What if one is used for an entirely different facility?






 You could draw the geofence to capture Welles Park, and not Horner Park, by looking at this map — but what if you don’t want to spend time doing it for every park in the city of Chicago?
 


 Secondly, as you might imagine, this is incredibly resource intensive. Assigning someone on your staff to look at all the locations (our customers routinely have hundreds or thousands of facilities) and draw the boundaries around them is a massive waste of that person’s time, and keeps them from doing other, more productive work.




**This brings us to the (patent pending) technique I’m talking about today.** 



### 
**The Idea**



 What else could we possibly do to define a good location geofence? The data scientist’s natural thought process is “find patterns in the past and use them to predict the future” — what if we did that?
 
 In the context of this problem, that means that we look at the data on behaviors or movements near the locations in question, and find ways to make predictions of where future behavior will occur based on these.




> 
> **The data scientist’s natural thought process is “find patterns in the past and use them to predict the future” — what if we did that?** 
> 



 Because we at p44 have large volumes of telemetry data from our customers’ histories, we can collect enough information to make a good sample — essentially a training set — from where trucks have gone near locations before. This is what we use as the basis for our location geofences. For our purposes, location geofences are just predictions of where trucks will go when they are visiting the location in the future, after all.




**So, how did we solve this? See Part 2 to find out!** 




*Want to learn more about this project and how we implemented it? Join me at* 
[*MLOps Community Chicago on Nov 10, 2022*](https://www.meetup.com/mlops-chicago/events/289352930/)
*where I’ll be presenting this work with a special focus on the deployment and taking it through to production.* 




 Stephanie Kirmer is a Staff Data Scientist at project44, the leading visibility and analytics platform provider for shipping and logistics. She has a decade of applied data science and data engineering experience in a number of industries, including hospitality/travel, IOT, software, and academia. In her current role, she is the technical lead for data science for the Over the Road sector, which includes trucking both in the US and globally. Before becoming a data scientist, she worked in academia and taught sociology and health policy at DePaul University. To learn more, visit
 [www.stephaniekirmer.com](http://www.stephaniekirmer.com/) 
 .






---



[Setting Healthy Boundaries: Generating Geofences at Scale with Machine Learning (Part 1)](https://medium.com/project44-techblog/setting-healthy-boundaries-generating-geofences-at-scale-with-machine-learning-part-1-c2067ef49777) 
 was originally published in
 [project44 TechBlog](https://medium.com/project44-techblog) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



