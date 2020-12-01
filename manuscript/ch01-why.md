{mainmatter}

{id: ch01}
# 1. Why EVENTful? (Mike)

*(10 pgs)*

## Highlights
TK

## From RESTful to EVENTful 
A trend that both of us have been noticing, as we talk to organizations large and small about sofware arhtecture and design, is that companies that previously worked to standardize on using only _RESTful_ API patterns are now starting to incoporate another style of APIs; ones that we prefer to call _EVENTful_ APIs. These are APIs that rely on interaction patterns different thatn REST's client-server and call-response model. Instead, EVENTful APIs support a publish-subscribe style interaction where any service can _publish_ one or more channels (sometimes called _topics_) to which any number of other services or clients can _subscribe_. Subscribers receive data that is pushed to them any time a publisher has new data that matches the registered topic. Because new messages are sent as soon as publishers have new data, this type of API call is initiated by domain events (users logging, serices writing, updating, or removing data, etc.) instead of bein initiated by a client somewhere sending a request to a server.

{blurb, class: info}
We'll cover a more detailed definition of EVENTful and different ways you can implement event APIs in [Chapter 2](#ch02-eventful}.
{blurb}

For close to twenty years, the "common standard" of APIs on the web has been summed up in one word: "RESTful." This notion of how APIs should be designed and implemented stems from Roy Fielding's now (in)famous 2001 PhD dissertation[^ch01-fielding] which contained a single chapter devoted to his proposed architectural style "Representational State Transfer" or REST. For all sorts of reasons, Fielding's dissertation has been adopted, debated, and (to hear Fielding's own telling) mis-understood by thousands of software developers over the ensuing years. 

[^ch01-fielding]: <https://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm>

It is true that web service and API designers, developers, and software architects have promoted, debated, and derided the notion of RESTful APIs in successive waves over the years with all sorts of pundits declaring REST "dead" and offering some other current practice as “the new REST” or, even better, "the REST killer."  

As the REST debate goes on, another important approach has continued to grow more common and more relevant for APIs today — that of event-based or as we are calling them them, EVENTful API designs. In our visits with companies around the world, almost every one of them are working on adding EVENTful services to their API ecosystem. And there are quite a few variations on what EVENTful means. 


*(what is Eventful intro)*

## Why Businesses Need EVENTful Systems
TK

### Market Forces 
TK

*(fragementation of services, rising consumer expectations, pressure on cost optimisation)*

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



