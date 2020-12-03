{mainmatter}

{id: ch01}
# 1. Why EVENTful? (Mike)

*(10 pgs)*

## Highlights
TK

## From RESTful to EVENTful 
A trend we have been noticing, as we talk to organizations large and small about software architecture and design, is that companies which previously worked to standardize on using only *RESTful* API patterns are now starting to incorporate another style of APIs; ones that we are calling *EVENTful* APIs. These are APIs that rely on interaction patterns different than REST's client-server and call-response model. Instead, EVENTful APIs support a publish-subscribe style interaction where any service can *publish* one or more channels (sometimes called *topics*) to which any number of other services or clients can *subscribe*. Subscribers receive data that is pushed to them any time a publisher has new data that matches the registered topic. Because new messages are sent as soon as publishers have new data, this type of API call is initiated by domain events (users logging, services writing, updating, or removing data, etc.) instead of being initiated by a client somewhere sending a request to a server.

{blurb, class: discussion}
We'll cover a more detailed definition of EVENTful and different ways you can implement event APIs in [Chapter 2](#ch02).
{/blurb}

For close to twenty years, the common standard of APIs on the web has been summed up in one word: "RESTful." This notion of how APIs should be designed and implemented stems from Roy Fielding's now (in)famous 2001 PhD dissertation[^ch01-fielding] which contained a single chapter devoted to his recommendations for softare that runs on a network. That chapter was titled "Representational State Transfer" or REST. For all sorts of reasons, Fielding's dissertation has been adopted, debated, and (to hear Fielding's own telling) miss-understood by thousands of software developers over the intervening years. 

[^ch01-fielding]: <https://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm>

It is important to point out that REST is not the only API style available to organizations. Among the more popular API patterns companies have used over the years are *remote procedure calls* such as Google's gRPC, *distributed objects* like the SOAP services, and *remote data services* like GraphQL. All these patterns can be implemented using the IETF's HTTP[^ch01-http] protocol. There has also been a very successful event-driven API pattern based another protocol called MQTT[^ch01-mqtt] that has been around just about as long as HTTP. 

[^ch01-http]: <https://tools.ietf.org/html/rfc7230>
[^ch01-mqtt]: <https://mqtt.org/>

This leads to a number of questions: If MQTT and the other options to REST have been around for so long and so many options exist, why are we seeing more EVENTful implementations now? What's changed? Are we seeing an increase in EVENTful services due to technological advancements? Changes in business? New market forces?  It turns out all of these factors have contributed to the rise in EVENTful APIs in companies larges and small. And, from what we've been seeing around the world, this increase of event-driven APIs is bringing with it both opportunities and challenges.

So, before we jump into the technical details of EVENTful APIs and how you can design and implement them, let's take a moment to review the technical and business aspects of this change in the API landscape.

## Why Businesses Need EVENTful Systems
TK

### Market Forces 
One of the reasons for the rise of EVENTful software systems can be attributed to forces in the API market itself. As more devices get added to the internet, there is bound to be a similar increase the number of APIs needed to keep them connected. And many of the recent devices that people want to connect are "headless" devices such as home alarm systems, heating and air conditioning platforms, and general building monitoring systems. And, with the increase in robots and other autonomous vehicles, there are a whole new set of APIs for monitoring and operating these devices. Finally, watches, exercise equipment, and even clothing are getting added to the API ecosystem and need to be connected, updated, and monitored. 

This growing market for API-connected devices is also driving consumer expectaions. It's a virtuous (or not, depending on your point of view) cycle that pushes device makers to API-enable their products and encourages consumers to connect them together at a higher and higher rate. 

Finally, in some cases, these devices may be costly to install, maintain, and operate. Or they may bew charged with monitoring costly machinery themselves. Waiting for hours or even minutes to check to see if a piece of equipment can be idled off or needs to be fired up can result in unwanted added costs or, even worse, lost revenue. The need for near real-time response and reaction to ever-chainging conditions is one of the key drivers for automation in general and these products need real-time APIs in order to meet customer demand as well as hold a lid on operating costs.

The changing market, consumer demand, and operational efficiencies are all key drivers in the increase of real-time or EVENTful APIs in all types of companies, large and small.

### Adding Speed 
EVENTful APIs also make it possible to add a new level of *spee* to your company's IT infrsstructure. By establishing real-time information flows, your organization and can consume and analyze information at a faster rate than traditional RESTful systems. In fact, a common problem for those adding EVENTful APIs to their API landscape is the challenge of what to do with all the new data your systems are generating. Ironically, trying to consume too much data can actually slow the organization's reaction time, too.

But the speed of information flow is just one of the benefits of adopting an EVENTful approach to APIs. Another one is the ability to monigtor and manage your own internal processes used to build and support existing APIs. Using real-time logging of the number of builds your company does, the number of tests you're running, etc. can give you a real time picture of your own company and how it is doing in meeting stated goals and guidelines. 

And, as we'll see in the [next section](#ch01-technology) on the technology aspects of adopting EVENTful APIs, implementing more real time APIs can lead to a more de-coupled and agile platform upon which you can build your IT solutions and products. By it's very nature, EVENTful API platforms rely on generalized message-passing through opaque routers. It is also relatively easy to add new messages and filters once a system is up and running. This, in turn, can lead to faster start-up times for MVP (minimum viable product) style projects that can adapt and grow over time based on consumption patterns learned from production use.

EVENTful APIs can add speed to your runtime products and to your internal processes.

### Increasing Connections 
TK

*(between components and businesses)*

### Expanding Reach 
Another important element in all this is that many of the devices we've listed here depend upon a real-time interaction experience. As people jog, they want to see their steps increase in near real time. As vehicles become autonmous, they need to "see" and react to new information on the road in real time. For many product and organizatsions, real-time, EVENTul APIs are the "price of entry" into the markets they want to reach. 

There are also cases where an organization's internal systems can benefit greatly from EVENTful APIs. For some products a RESTful approach for public APIs is still more than adequate to serve the market, but within that same company's firewall, they may be able to take advantage of EVENTful APIs in order to react to partner and consumer demands more quickly, more smoothly, and more accurately.

EVENTful APIs can also improve a company's ability to reach across deparment boundaries and improve internal efficiencies betweewn off-the-shelf products as well as in-house built systems. 

Adding EVENTful APIs can expand an organizations reach at both the public API and private API levels.

{id: ch01-technology}
## Why Now? Technology is Changing
TK

### The Rise of Asynchronous and Reactive 
TK

### The Growth of Microservices 
TK

### The Power of Serverless and Cloud Native
TK

## Where Events Fit In
TK

### Meeting Business Demands
TK

### Reducing Technical Challenges
TK

## Summary
TK

## References
TK



