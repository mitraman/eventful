{mainmatter}

{id: ch01}
# 1. Why EVENTful? (Mike)

*(10 pgs)*

## Highlights
TK

{id: ch01_eventful}
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
You can read just about any business blog or article today and find some reference to the need for "real-time" information about your business. This focus on instant feedback is driving much of the push for digital transformation within organizations today. But getting more data faster is just a means to and end. And that "end" is the steady monitoring and improvement of your company's ability to deliver value to customers.

To meet this challenge, a big part of the digital transformation journey depends on making your IT operation more responsive to small changes in the health and welfare of systems running within the company. And it also means paying attention to customer and partner demands for more up-to-date information on project status and product shipments. There are a number of businsess-related motivations driving the increased reliance on EVENTful software systems at work here and we'll focus on four of them in this chapter:

Market Forces
: The changing market, consumer demand, and operational efficiencies are all key drivers in the increase of real-time or EVENTful APIs in all types of companies, large and small.

Adding Speed
: EVENTful APIs can add speed to your runtime products and to your internal processes.

Increasing Connections
: More connections means more data points and that means more opportunity to observe and improve data flows between internal systems and systems outside the company's network. 

Expanding Reach
: Adding EVENTful APIs can expand an organizations reach at both the public API and private API levels.

### Market Forces 
One of the reasons for the rise of EVENTful software systems can be attributed to forces in the API market itself. As more devices get added to the internet, there is bound to be a similar increase the number of APIs needed to keep them connected. And many of the recent devices that people want to connect are "headless" devices such as home alarm systems, heating and air conditioning platforms, and general building monitoring systems. And, with the increase in robots and other autonomous vehicles, there are a whole new set of APIs for monitoring and operating these devices. Finally, watches, exercise equipment, and even clothing are getting added to the API ecosystem and need to be connected, updated, and monitored. 

This growing market for API-connected devices is also driving consumer expectaions. It's a virtuous (or not, depending on your point of view) cycle that pushes device makers to API-enable their products and encourages consumers to connect them together at a higher and higher rate. 

Finally, in some cases, these devices may be costly to install, maintain, and operate. Or they may bew charged with monitoring costly machinery themselves. Waiting for hours or even minutes to check to see if a piece of equipment can be idled off or needs to be fired up can result in unwanted added costs or, even worse, lost revenue. The need for near real-time response and reaction to ever-chainging conditions is one of the key drivers for automation in general and these products need real-time APIs in order to meet customer demand as well as hold a lid on operating costs.

*The changing market, consumer demand, and operational efficiencies are all key drivers in the increase of real-time or EVENTful APIs in all types of companies, large and small.*

### Adding Speed 
EVENTful APIs also make it possible to add a new level of *spee* to your company's IT infrsstructure. By establishing real-time information flows, your organization and can consume and analyze information at a faster rate than traditional RESTful systems. In fact, a common problem for those adding EVENTful APIs to their API landscape is the challenge of what to do with all the new data your systems are generating. Ironically, trying to consume too much data can actually slow the organization's reaction time, too.

But the speed of information flow is just one of the benefits of adopting an EVENTful approach to APIs. Another one is the ability to monigtor and manage your own internal processes used to build and support existing APIs. Using real-time logging of the number of builds your company does, the number of tests you're running, etc. can give you a real time picture of your own company and how it is doing in meeting stated goals and guidelines. 

And, as we'll see in the [next section](#ch01-technology) on the technology aspects of adopting EVENTful APIs, implementing more real time APIs can lead to a more de-coupled and agile platform upon which you can build your IT solutions and products. By it's very nature, EVENTful API platforms rely on generalized message-passing through opaque routers. It is also relatively easy to add new messages and filters once a system is up and running. This, in turn, can lead to faster start-up times for MVP (minimum viable product) style projects that can adapt and grow over time based on consumption patterns learned from production use.

*EVENTful APIs can add speed to your runtime products and to your internal processes.*

### Increasing Connections 
Another force that is driving companies to add more EVENTful endpoints to their system is the need to _increase connections_ between both components within the organization's IT infrastucture and between customers and partners. While comes of this work to increase connections is strategic -- a way to expand and strengthen business relationships -- much of the focus on connections is part of the inevitable tide of more connected, more reactive internal systems.

One example of this drive for internal, reactive connections is the rising use of in-house status dashboards to monitor both business and infrastructure health. It is more and more common today to walk into the main lobby of a company and see a giant screen displaying the real-time count of connected customers, the location of shipped goods, and/or the number of completed business transactions within the last hour.  This display is a way for divisions to monitor their business in near real-time. No need for daily, weekly, and monthly printed reports delivered via in-person meetings. Instead, anyone in the organization can call up the company dashboard and view the latest stats on the business and compare that to the company's stated objects and key results (OKRs[^ch01-okrs]).

[^ch01-okrs]: <https://en.wikipedia.org/wiki/OKR>

But business monitoring is just part the real-time data story. As we'll see (below) when we talk about the technology side drivers for EVENTful systems, another reason for increased connections is the ever-growing number of 'connect-able' components inside the IT shop. Most platforms offer ways to automatically "plug-in" to monitoring endpoints and stream that internal performance data straight to the same kinds of dashboards that are displaying business metrics. But this time the screens are displaying the number of connected components around the world, the speed of transactions, error-rates, and more. These displays rely upon gigabites of real-time data streaming from every connected component and gateway within the company's network in order to present a "traffic report" on how data is moving through the system. This allows managers to essentially predict and correct network congestion and roadblocks the way transportation and logistics managers ensure the safe and timely delivery of their physical goods.

*More connections means more data points and that means more opportunity to observe and improve data flows between internal systems and systems outside the company's network.*

### Expanding Reach 
Another important element in all this is that many of the devices we've listed here depend upon a real-time interaction experience. As people jog, they want to see their steps increase in near real time. As vehicles become autonmous, they need to "see" and react to new information on the road in real time. For many product and organizatsions, real-time, EVENTul APIs are the "price of entry" into the markets they want to reach. 

There are also cases where an organization's internal systems can benefit greatly from EVENTful APIs. For some products a RESTful approach for public APIs is still more than adequate to serve the market, but within that same company's firewall, they may be able to take advantage of EVENTful APIs in order to react to partner and consumer demands more quickly, more smoothly, and more accurately.

EVENTful APIs can also improve a company's ability to reach across deparment boundaries and improve internal efficiencies betweewn off-the-shelf products as well as in-house built systems. 

*Adding EVENTful APIs can expand an organizations reach at both the public API and private API levels.*

{id: ch01-technology}
## Why Now? Technology is Changing
As we discuess at the start of [this chapter](#ch01_eventful), the need for real-time communications at the business level has been around in one form or another for over twenty years. What's different now is that the technology required to support real-time messaging has finally caught up and become widely available at low cost. Advances in hardware and software have played their role with the heavy lifting going to the software side. Architectural models that favor small-sized messages, asynchronous programming patterns, and virtualized servers have all had a major role in making it easier to design and build EVENTful systems.

Three key drivers on the technology side will be highlighted here including:

The Rise of Asynchronous and Reactive
: EVENTful systems both rely upon and are driven by the use of reactive data production and asynchronous data-consumption patterns.

The Growth of Microservices 
: EVENTful software architecture can make it easier to modify an exsiting system built from small, independently-deployable services.

The Power of Serverless and Cloud Native
: Both serverless and cloud native implementation rely on EVENTful patterns to successfully support services on the network.

### The Rise of Asynchronous and Reactive 
One of the key drivers in the inreasing demand for EVENTful systems is the rise in the use of asynchronous an reactive style programming models. One of the best-known web frameworks for reactive programming was initially created by Jordan Walke while at Facebook[^ch01-react]. Intially driven by the need to improve handheld drive user experiences, React and other similar frameworks rekindled an interest in EVENTful implementation patterns that date back to the mid-1980s when it was used to handle interactions with hardware-centric Supervisory Control and Data Acquisition (SCADA[^ch01-scada]) devices.

[^ch01-react]: <https://en.wikipedia.org/wiki/React_(web_framework)>
[^ch01-scada]: <https://en.wikipedia.org/wiki/Reactive_programming>

A key principle in reactive systems is that data changes flow through the system automatically -- in "real time". However, as more and more data flows through the system, the ability of components within that system to immediately consume, evaluate, and respond to changes dimishes. For that reason, a second pillar of EVENTful systems is that responses are *asynchronous* -- the time it takes for new data flows to result in system behavior changes can vary. 

Asynchronous programming[^ch01-async] is ideal for handling heavy input-output (I/O) operations, parallel processing of large amounts of data and processing long-running tasks like monitoring a package shipment or virtual project progress over time. This ability to deal with large amounts of data that might span a long period of time is the perfect match for the increased use of reactive interfaces.

[^ch01-async]: <https://en.wikipedia.org/wiki/Asynchrony_(computer_programming)>

*EVENTful systems both rely upon and are driven by the use of reactive data production and asynchronous data-consumption patterns.*

### The Growth of Microservices 
Another reason for the increase in EVENTful architecture is the continued success of the Microservice approach[^ch01-microservices] for desgining and building components. Similar to Service-Oriented Architecture (SOA[~ch01-soa]), microservices emphasizes creating small, independent components focused on a single business capability (search, data filtering, customer onboarding, etc.). Early versions of this model were introduced in the 2000s and around 2012 the name "microservices" was attached to this pattern.

[^ch01-microservices]: <https://en.wikipedia.org/wiki/Microservices>

Using small, independently-deployable components allows software teams to update and release their components more often and with less likelihood of internal errors. But it brings with it new challenges in the form of additional inter-component network traffic and the possibility of introducing breaking changes in the processing and data models share between components. It is these last two elements (processing and model changes) that EVENTful architecture can alleviate. In EVENTful systems, the process model can vary based on how components publish and subscribe to data flows (we'll talk more about this in [#ch03](Chapter 3)). 

*EVENTful software architecture can make it easier to modify an exsiting system built from small, independently-deployable services.*

### The Power of Serverless and Cloud Native
Finally, another key technology element that has given rise to increased use of EVENTful designs are the growing reliance on *serverless*[^ch01-serverless] and *cloud native*[^ch01-cloudnative] runtime platforms. The two phrases have similar histories and definitions and both focus not on the software architeture (microservices) or the message model (asynchronus and reactive) but, instead, focus on the way server infrastructure is implemented and managed at runtime.

[^ch01-serverless]: <https://en.wikipedia.org/wiki/Serverless_computing>
[^ch01-cloudnative]: <https://github.com/cncf/toc/blob/master/DEFINITION.md> 

Serverless platforms don't actually run without servers, of course. But serverless platforms greatly reduce the effort needed to mount a new server, scale that server up and down in response to traffic loads, and monitor and manage that server over time. In order to support these options, serverless platforms rely on real-time event services to handle control-channel messaging like monitoring the health of server instances, tracking parallel copies of a particular service, and allowing operations staff to spin up, modify, and take down running services without the need to stop and start network connections. In essence, serverless platforms are EVENTful platforms.

The same could be said for cloud native implementations. Like the name implies, cloud native services take advantage of widely distributed, independently operating server instances hosting code, data, and workflow services -- sometimes widely separated by time and distance.  While serverless platforms use EVENTful patterns to communicate control-channel information, cloud native platforms also relay in EVENTful messaging to accomplish the stated goals of the hosted microservices in the cloud including passing application data between services, emitting API and UI content on demand. It is difficult to imagine the success of cloud native services without the use of real-time EVENTful messaging.

*Both serverless and cloud native implementation rely on EVENTful patterns to successfully support services on the network.*

{id: ch01-events}
## Where Events Fit In
TK

### Meeting Business Demands
Inreasing your use of EVENTful services can help your organization meet the growing demaind for real-time inteactions. Employing EVENTful design patterns helps put information consumers up-front and center. Who is consuming our services and what data do they need to solve their problems? Answering these questions can result in well-targeted EVENTful APIs that help your partners, customers, and internal teams get the right data at the right time in order to do their work.

EVENTful implementations can also help your teams improve the overall observability of your API platform. By monitoring the various real-time feeds, tracking consumption, and analyzing usage, you can gain important insight into just which APIs are making a positive contribution to your company's OKRs and to the organization's bottom line.

Finally, using EVENTful APIs can make it easier to not only share information with partners and customers but also *consume* data from other sources and incorporate that information into your own products and services. As more organizations in your market space adopt EVENTful patterns, you and your teams can take advantage of the EVENTful opportunities around you. In some cases, your use of EVENTful APIs can give your teams the edge in competing for a share of the growing real-time market.

### Reducing Technical Challenges
increasing your reliance on EVENTful patterns can also help your teams overcome a handful of technical challenges on the road to digital transformation and agile implementation. This can result in a smoother on-boarding of new services, fewer disruptions when updating existing components, and greater resilience in consuming important data.

As you'll see in [Chapter 3](#ch03), you can take advantage of EVENTful patterns when designing your service interfaces and data messages. These patterns help you focus on small-grained changes and to express the design ways that reduces the chance of breaking existing interfaces. This small-grained, focused design approach can also lead to a programming patterns that encourage the use of small, indepedently-deployable data consumers and producers. This can not only speed the process of "getting from idea to install", it can also reduce the likelihood of breaking existing code.

Finally, the process of writing EVENTful data consumers can lead developers to writing more general and data-driven client applications that are both efficient and runtime but also resilient. They can be less prone to crashes when data models change and more able to survive minor model changes without experience additional downtime.

## Summary
TK

## References
 * For more on Objectives and Key Results (OKRs), check out John Doerr's ["Measure What Matters"](https://www.penguinrandomhouse.com/books/546304/measure-what-matters-by-john-doerr-foreword-by-larry-page/)
 * TK Reactive
 * Tk Async
 * See the book ["Microservice Architecture"](https://learning.oreilly.com/library/view/microservice-architecture/9781491956328/) for an overview of microservices in general. 
 * For a hands-on experience, we recommend ["Microserivces Up and Running"](https://learning.oreilly.com/library/view/microservices-up-and/9781492075448/).
 * The booklet ["What Is Serverless?"](https://learning.oreilly.com/library/view/what-is-serverless/9781492074915/) provides a quick overview.
 * TK Cloud Native



