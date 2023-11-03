



---
date: 
featured_image: "https://cdn-images-1.medium.com/max/1024/0*FFBW8EVdXsgcQs_t"
tags: ["data-science","machine-learning","logistics"]
title: "Setting Healthy Boundaries: Generating Geofences at Scale with Machine Learning (Part 2)"
disable_share: false
---
      

 If you haven’t read it yet,
 [please start with Part 1](https://medium.com/p/c2067ef49777) 
 to understand the foundations of this project and why we did it!



### 
**Implementation**



 In part 1, we talked about applying a data science mindset to the problem of location accuracy. But how do we actually carry out this process? We used python and a combination of several tools (see table below) to make this idea a reality. The first thing we needed was a clustering technique.



<https://medium.com/media/7eb27d80d027815f033deffe82ab6bfb/href>

 DBSCAN, or “Density-based spatial clustering of applications with noise”, is a way of clustering points in two-dimensional space, so it’s useful for cases like ours where the points are actual places on a map. The short explanation is that we look at the points available, find regions with highest volume/most dense points, and group these together. If points are not associated with these groups, we mark them as outliers.




> 
>  DBSCAN, or “Density-based spatial clustering of applications with noise”, is a way of clustering points in two-dimensional space.
> 



 To go into more detail, this animation helps explain the procedure. (Please forgive my artistic ability.)






 Animated gif that walks through the steps of applying DBSCAN to points
 


 First, the algorithm will examine each point in turn, and count the other points in its immediate neighborhood, a space defined by the parameter ε (epsilon). We have a set lower bound of how many neighbors inside the space a point must have, and if it meets this criterion, it will be considered a “core” point.




 After each point is assessed, core points that are adjacent to each other are grouped into what are called connected components, and these comprise the essential bases of clusters. Some points will be adjacent to core points, and form their neighbors, but will not be core points themselves because they have too few neighbors (in practice this indicates that they fall on the outer edge of the cluster). These will be defined as non-core points falling into the relevant cluster.




 At this point, our clusters are complete, and we can mark all remaining points that are neither core or non-core cluster members as outliers.




 For our use case, we use telemetry pings from the historical movements of a customer’s trucks as the raw material for DBSCAN to work on. If a shipment involves a given location, as one of the scheduled stops, we’ll take the telemetry points that shipment contains and include them in our training set. This may contain points that are nowhere near the stop, or which we think are associated with some other stop on the trip, and that’s ok! We’re casting a wide net to start with, and we will rapidly narrow it down using the algorithm.




 This strategy has many customizable parameters, and allows us to tune the algorithm quite finely to meet the needs of different customers and business types. In addition to the DBSCAN parameters, we must decide the following:



* *How far around the location in question will we cast our net to find relevant points?* 
 This is also affected by having multiple stops from the same customer very near each other — we’ll shrink how far away we look for telemetry if there’s another facility nearby, to avoid conflating the two.
* *How many points do we need to find around the location in order for it to be an adequate candidate for geofencing?* 
 If there is too little traffic history nearby, the algorithm is more likely to produce incorrect results, and we’d rather have no smart geofence than a bad one.



 Once we have chosen our points and run DBSCAN, more decisions must be made, including:



* *How far away from our starting point can clusters be and still be included?* 
 Sometimes we’ll find clusters that are very spread out, and some quite distant from the true location. In our implementation, we take the closest cluster to the starting point (which need not actually be that close, given that sometimes addresses are wrong), and require all other clusters to be relatively near that. This gives us the necessary flexibility to manage when we get slightly wrong addresses or coordinates from the customer.



**After all that work is done, we have a set of clustered telemetry points that we feel confident are representative of traffic relevant to the location we care about.** 
 The last task is to draw the location geofence, which we do by applying a convex hull using GeoPandas to all the points in all the qualifying clusters. Then, if it’s desired (and it usually is), we apply some small amount of buffer space around all sides of the geofence, to accommodate any minor inaccuracies. This usually is less than 200 meters.



### 
**Evaluation**



 Once we’ve created location geofences with this technique, we need to test and validate our results before sending them out into the world. We can look at them on a map (we used Folium and GeoPandas to visualize geofences at large volumes with great results). We have a problem, though — we likely don’t have enough known accurate location geofences to compare with. Sometimes we do have a few hand drawn bespoke ones, and we can definitely overlay these with our new “smart” geofences to see how well they match, but that’s hard to scale.




 In our case, I tried to go back to first principles somewhat — what are these geofences for? Mainly they are to accurately capture when a truck visits a location, without creating false positives. So, first I took historical truck trip data and re-ran it in simulation using new location geofence boundaries. This was effective, but resource intensive. It provided enough robust results to let us proceed with confidence, however.




 In the next step, I conducted pilot studies with some key customers, and compared the shipment behaviors before and after. Two metrics came to be most useful, as they measure different aspects of what we look for in balanced trip evaluation.




**The first is stop recall, or the percent of stops scheduled that we recorded a visit to.** 
 This means that we’re looking at shipments and seeing how often we’re missing a stop, which might be too often if our location geofences are the wrong shape or are too small. If the truck comes nearby but doesn’t cross inside a geofence at the time of an update, a stop arrival could occur but not be captured. If this value doesn’t go down, we can say we are producing large enough location geofences. In practice, we have actually seen this metric go up for many customers, because smart geofences are not just smaller, but sometimes positioned more accurately than the alternatives.






 A too-small location. If we are trying to identify visits to Welles Park, then this will leave out a lot of them! The entire west side of the park is lost here.
 


**The second metric is out of order shipments, or shipments where we have recorded visits to stops not following the numerical order the schedule lists.** 
 Here we’re trying to measure when a driver “clips” a too large location geofence in passing — creating a record of an arrival where none actually occurred (a false positive). The result of this may be that we interpret that the shipment’s stops are being visited in a different order than they really are. This is a bigger problem than you might think, and we want to reduce cases where that happens.




 While sometimes drivers make stops in a different order than scheduled, for most of our customers that’s not very common. Therefore, if a shipment is recorded as happening out of order, at least some of the time that’s because we triggered an arrival by entering a location geofence accidentally — this means that we can use the total volume of out of order shipments as a rough proxy for the volume of geofences that are too large. Smaller, targeted geofences reduce the occurrence of this, and make our overall tracking of shipments much more accurate. If we see a drop in out of order shipments, then we can say we are producing small enough location geofences.






 This is a much too large geofence, for the same park! We’d get visits to Horner Park in this geofence, which is not at all what we would want.
 


 These two metrics let us pursue a “goldilocks” sort of fit- location geofences that are neither too small nor too large. Something like this!






 A simulation of what a smart geofence might produce.
 




 Our original (made-up) points for reference- we’ll get all the Welles Park stops and none of the Horner Park ones.
 

### 
**Deployment**



 So, we developed our technique and validated it against real-world conditions — we still had to determine how best to roll this out to customers. If we had only a few customers with a few locations served, this might be easy, but we actually have thousands of customers and millions of locations to handle.




 When we set out to deploy the feature, this led to some valid concerns around cost and practicality. One thing we recognized is that a lot of locations are relatively infrequently scheduled or visited. There’s a long tail for many of our customers of locations they ship to or from only once or twice in many years. Based on this, we made a choice to look first at locations that have been visited more than a few times in the past year, which helped to reduce our overall volume of locations needing to be processed at the start.




> 
>  If we had only a few customers with a few locations served, this might be easy, but we actually have thousands of customers and millions of locations to handle.
> 



 In addition, we worked with our Data Engineering team to optimize the Snowflake querying that we do in this process, to make it as fast as possible and reduce the warehouse uptime required to create the smart geofences. Part of this included implementing a limited amount of parallelization with Dask. We were originally parallelizing at 16 threads, but this was sending many queries to Snowflake in rapid succession and backing up the queue. In order to avoid overloading Snowflake, we limited it to four threads — still getting much of the parallelization speed advantage without getting our I/O bogged down. This way we cut significant costs related to Snowflake usage from the project.




 We also needed to determine how we’d run the task for different customers, and make this rerunnable from time to time when new historical data is collected and new location geofences need to be made. Our data scientists use Airflow for DAG scheduling already, so this was an easy choice.




 To pass customer specific parameters to the job, we use a config class that has defaults we can customize at initialization or afterward. We initialize the config and run the Airflow job, and the smart geofences are automatically generated and stored directly in Snowflake. When we’re producing geofences for lots and lots of customers at once, we pass a list of customers to the Airflow job, which creates a task for each and runs them serially (not parallel, because that would overload Snowflake as we discussed above). Slack hooks keep us informed about the progress of these tasks.




 Airflow uses Dask just the way our local machine uses it, so we are still able to gain parallelization performance improvements. We could have implemented parallelism inside the DAG in Airflow, but we didn’t want to necessarily tie the job permanently to Airflow, in case we want to use some other scheduler tool down the line. Dask’s versatility just means that we’re committed to python for the job, but nothing more specific than that.



### 
**Conclusion**



 This technique has turned out to be incredibly useful for us and for our customers. We started out mainly wanting to reduce “false positive” arrivals, but ended up with many other benefits. For example, when a customer’s address data for a location is off a bit, say they have written down 123 Main Street but the facility is at 127 Main Street, this algorithm is regularly able to correct this and places the location geofence at the correct position.




 We also now produce more precisely accurate arrival times, which matters a great deal when carriers can incur penalties for being late or early for appointments. Furthermore, we’ve saved customers hours and hours of manual work drawing location geofences, and will continue to save new customers time doing this drudgery.




 I think this project is a clear example of how data science can make meaningful improvements in how we do things in industry. Instead of doing just theoretical work, I enjoy crafting practical data driven solutions to real people’s problems and challenges. I’m fortunate to be at a company that prioritizes this very thing — solving customers’ problems to make logistics and supply chains more efficient and more transparent. This cascades down to benefit everyone, because it means all the goods transported around the world each day (even to your doorstep!) can be tracked accurately and transparently.




 Thanks for reading through to the end of this series — I hope our efforts have inspired you to apply the data scientist mindset to challenges in your own work!




 Stephanie Kirmer is a Staff Data Scientist at project44, the leading visibility and analytics platform provider for shipping and logistics. She has a decade of applied data science and data engineering experience in a number of industries, including hospitality/travel, IOT, software, and academia. In her current role, she is the technical lead for data science for the Over the Road sector, which includes trucking both in the US and globally. Before becoming a data scientist, she worked in academia and taught sociology and health policy at DePaul University. To learn more, visit
 [www.stephaniekirmer.com](http://www.stephaniekirmer.com/) 
 .






---



[Setting Healthy Boundaries: Generating Geofences at Scale with Machine Learning (Part 2)](https://medium.com/project44-techblog/setting-healthy-boundaries-generating-geofences-at-scale-with-machine-learning-part-2-eaa81b2d26d8) 
 was originally published in
 [project44 TechBlog](https://medium.com/project44-techblog) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



