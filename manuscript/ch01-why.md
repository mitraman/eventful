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
TK

*(fragmentation of services, rising consumer expectations, pressure on cost optimization)*

### Adding Speed 
TK

*(both real-time, and build-time)*

### Increasing Connections 
TK

*(between components and businesses)*

### Expanding Reach 
TK

*(internal reach, and market expansion)*

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



