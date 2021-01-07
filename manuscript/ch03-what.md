{id: ch03}
# 3. What You Need to Know (Ronnie)

*(15 pgs)*

## Highlights

Designing any API-enabled system takes a reasonable amount of technology "know-how". You need to understand at least the basics of networks, coding and integration tools to put together a solution that works with composable parts. But, in most cases its not enough for an API-enabled system to just "work". It also needs to work *well* - and that requires a special kind of design skill and experience.

Working well means that the software goes beyond doing what it's supposed to. It also needs to help your team or company with their strategic goals. For example, a business that wants to cut down on costs will want software that requires less people to maintain. A product team that wants to make lots of changes very fast will want software that is designed for fast and frequent release with low change costs. A company that wants to monetise data will want software that makes it easy to collect, tag and manage all the data in the system.

Professional software designers, developers and architects need to be good at making software that fits those kinds of needs. Just about anyone can learn how to implement a simple API - but, not everyone can make APIs that are highly maintainable, work easily together and don't break when the unexpected happens. That turns out to be the hard part. 

Thankfully, over the years the software architecture industry has developed a number of techniques, philosophies, patterns, methods and styles to make this job a little bit easier. The eventful system is one of those styles and it can help you build software that works well. But, like any software style there are trade-offs to consider.

An eventful system isn't the answer to every software integration problem that you'll face. It has a set of characteristics that make it well-suited for a broad number of scenarios, but it certainly isn't a silver bullet. You need to understand the characteristics of an eventful system and how they relate to the problems you are solving and the type of software that you want to build.

There are three factors that are the most important to consider for an eventful system: coupling, distance and latency. We'll explore each of these factors and how they impact eventful architectures.


## Coupling

One of the goals you'll often hear software archtiects talk about is less or looser coupling between systems. [Coupling is TK.] The advantage of a system with less coupling between components is that change can happen indepentally. That means if we change the code in one component we won't need to change the code in other components in the system.

[TK sidenote - Larry Constantine, structured design]

Loose coupling can enable a software team to realise great benefits. In a truly loosely coupled systems, the cost of changing code is reduced because the impact of a change is well bounded. For example, if two modules A and B are loosely coupled, I can run a project to change the code in module A without having to change, test or coordinate with module B at all. That can greatly in crease change velocity and cost. 

In realty, coupling isn't a binary characteristic that you can just turn off or on. It turns out to be a spectrum with many different facets (footnote - Eric's paper). You can get the benefits of loosely coupled systems if you can manage to actually de-couple the parts that matter. 

### The Loosely Coupled Event System

Event-based architectures and asynchrounous APIs are often touted as being "loosely coupled". That's true to an extent, but be careful - it may not be de-coupled in a way that is useful to your needs. As we described earlier, de-coupling software components helps us reduce the amount of effort we need to spend on writing and maintianing code. So, does a decoupled asynchronous API help us do that?

As we described in chapter [x], an asynchronous API has some unique interaction characteristics. Instead of a request-reply model, asynchronous APIs often use a publish-subsribe model, in which multiple subscribers consume asynchronous event messages. We also described the important role of infrastructure and how it further seperates the event publisher from the consumer.

It's this separation of the event message publisher from the event message consumer that people often focus on. By implementing components that can publish event messages to an eventing infrastructure, we can "de-couple" the event publisher form the consumer. The developers who write the event publishing component don't need to coordinate with event consumers in order for their messages to be picked up and received. They only need to know how to send event messages into the infrastructure - the rest is up to someone else to figure out.

This is quite different from the RESTful request-reply world. In that world, an API team needs to publish a network address so that consumers can transmit messages to them. The actual network address might be purely logical. That is, the address may point to a complicated nest of API gateways, network proxies, load balancers and content-delivery networks. But, from the client's perspective this network address represents the location of the API. The client and server become bound together by that network location.

But, it turns out that this kind of network address coupling (or de-coupling) has limited value. Its true that in an event-based system, components don't need to know each other's physical network addresses. However, that location detail has very little impact on the code that our teams write. There is another kind of coupling that still exists in an asynchronous API and it drives the vast majority of work, brittleness and costs: message coupling

### Message Coupling

Components need to bind at the network level in order to send messages to each other. when it comes to asynchronous APIs, that binding can often happen between a component and the infrastructure (e.g. the location of a local Kafka server). But, most of the code we write for transmission is pretty generic. So, changing the network location of a component isn't a big change burden.

However, the work of parsing, understanding and acting on the *contents* of a message is a much bigger challenge. The code we write to consume a message needs to understand the data structure of a message, the semantics (or meaning) of the data it finds and the actions it should take based on the data it has consumed. That's really the majority of the domain-specific code we end up writing. We call this _message coupling_ and its one of the most challenging parts of an integration to de-couple.

Reducing message coupling needs to be come a primary goal for your asynchronous solution design if you are trying to reduce change costs. In fact, this is true of any software integration - if you want faster and cheaper change in a message-based integration, you'll need to focus on de-coupling your components at the messaging level. We'll describe some techniques for doing that when we dive into design in chapter {y}.

## Distance

When we design systems on paper, its easy to forget about the physical realities (and constraints) of the systems that we are building. Physical distance turns out to be a big factor when it comes to asynchronous and event based designs. With today's technology, as the distance between a message producer and message consumer grows, the time it takes for messages to be communicated will grow as well. Another side-effect of distance is that the reliability of the network decreaes as well.

Our designs need to accomodate for the distance between components. A lot of the network protocols we use today already do that for us. For example, TCP/IP is designed to be optimised for reliability of transmission between two parties rather than for low-latency communications. The TCP/IP model of communication is actually pretty well-suited for the way HTTP and RESTful APIs work. That's not really an accident. [TK need to validate and extend this point - assume TBL/Fielding designed for TCP/IP comms]

But, out asynchronous interactions aren't really well suited for the TCP/IP interaction model. As we've mentinoned a few times, today's event based models are very often pub-sub based. That requires either a specialised protocol like UDP or requires specialised middleware or infrastructure that publishers and consumers can use.

There's also another challenge that comes from using asynchronous APIs - event messages tend to be smaller. Small messages drive a special type of messaging characteristic called "chattiness" that can turn out to be a problem.

### Eventful Chattiness

"Chattiness" is a collaquial way of describing the amount of messages that are needed to support a message based interaction. When a component is "chatty" it transmits lots of messages on the network. In a RESTful architecture chatiness manifested itself as multiple request-reply messages to achieve an interaction goal. In an EVENTful system, chattiness usually means that a components produces lots of messages within a short time frame.

It's difficult to avoid chattiness when you're designing an asynchronous API. That's because event-based design often means that you're publishing events as they happen. In most systems, there are lots of things happening. That means that you'll inevitably be publishing lots of events.

Normally, this isn't a big deal. In an eventful system, infrastructure is usually tuned to support lots of  producers publishing lots of messages. Consumers are designed to filter messages and only respond to what they need, so the having to wade through lots of messages isn't really an issue.

But, chattiness becomes a problem when we add the distance factor. That's because [tk ... wait a second. Not sure this is true. need to think about it]

### Local vs Internet
TK

### Hiding distance in the infrastructure

TK kafka model (and others)

## Latency (Time)

So far, we've looked at eventful systems through the lens of code changes (through coupling) and through the lens of message transmission as a factor of distance. These factors have helped us see how an eventful system impacts two software components that need to interact. But, the final characteristic we'll look at is a bit broader in nature - we need to consider how an integration architecture is impacted by the time it takes for work to be completed.

In software engineering, latency is a measure of how long something takes from the point of input to the point that output is received. For example, in a software application, 

### Message Latency

TK impacted by the distance and chattiness factors.

### Transaction Latency

TK long-running tasks

### Design Latency

TK need to remember what this is.

*(runtime latency, build-time latency, design-time latency?)*

## Something that ties all three factors together?
TK

## Summary
TK

## Additional Reading
TK


