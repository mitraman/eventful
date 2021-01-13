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

TK need segue into this new section

## Dissecting the Eventful System

In Chapter 2, we explored a number of different Eventful architecture styles and patterns. As we saw, there are lots of different ways of implementing an Eventful, asynchronous messaging system. That complexity can make it difficult for us to come up with a good, overarching way of designing them. The good news is that there are some fundamental parts of an Eventful system that are consistent across all those variations. If we can understand those parts, we'll be able to use them to explore the factors of coupling, distance and latency universally.

{blurb}
The parts of the system that we'll be describing here actually apply to RESTful and synchronous interactions as well. We'll compare the Eventful version and synchronous version of each of them throughout this chapter.
{/blurb}

There are four universal parts of an Eventful system that are most important to consider: producers, consumers, the network and the message. Let's take a look at each of them in turn.

### Producers and Consumers

TK intro the concept of message producers and message consumers. 

Tk The REST/sync version

TK The async version and significance of this difference

### The Network 

TK intro the network - should be the same as synch, but may need support for special async char. (e.g. UDP)

### The Infrastructure

TK Messaging infra. compare and contrast sync and async
TK highlight how important this is for an async interaction

### The Message

TK the message. 

Tk segue into the three factors of coupling, distance and time.

## Coupling

In a software system, we say two components have a high degree of coupling when they are highly dependent on each other. High coupling means that a change to one software component will necessitate changes to another component that is dependent on it. This concept of coupling in software design has been with us for a long time. The term coupling comes from Larry Constantine and his work on structured design in the late 1960s and early 1970s. It's been a long time since Constantine first identified the costs of coupling, but years later software designers still find themselves battling to reduce coupling costs.

[TK sidenote - Larry Constantine, structured design]

That's because high degrees of coupling makes software changes more expensive and harder to execute. Coupling increases the amount of change work we need to do - a change to one component requires a team to change other dependent components to avoid breaking the system. In a complex software system, changes to a component with high coupling can create a massive wave of change, as each component's change triggers a corresponding change in another dependent module. In practice, this becomes a change coordination nightmare as changes need to be managed across multiple teams. In systems with high degrees of coupling, the pace of change can grind to a halt.

### In Pursuit of Looser Coupling

It's no wonder that software designers prioritise patterns, principles and technologies that make it easier to reduce software coupling. In fact, the goal of _looser coupling_ between components has heavily influenced the way we design and build software. This focus has lead to object oriented programming patterns like _Abstract Factory_, _Facade_, _Visitor_ and _Iterator_ to reduce the code changes we need to make within our applications. 

Similarly, there's been a long history of reducing coupling for API based software architectures. Corba, XML, SOAP, REST and microservices integrations have all been introduced and popularised largely because they offer the promise of "looser coupled" systems. Each new wave of an integration style brings the promise of finally solving the "coupling problem". When the circumstances are right, this leads to a wave of mass adoption and sadly it often results in discrediting of an existing integration style. This is almost always followed closely by a wave of discontentment as software designers realise that the coupling hasn't disappeared.

Within this narrative, its easy to feel like the situation is hopeless. But, don't be fooled! As an industry, we've made steady progress towards better architectural patterns that fit the technology of the day. Our ability to change software quickly has vastly improved thanks to the hard work and innovative ideas of many people. The real danger is in viewing coupling as a simple, binary property that is either "loose" or "tight". The reality is a bit more complex. In fact, in their paper on the facts of coupling, Erik Wilde and Cesare Pautasso list twelve different types of coupling that can exist, including discovery, binding, evolution and models.

As the event-driven, asynchronous style of integration gains popularity, we're hearing the refrain of a silver bullet for coupling again. Asynchronous communication is being held up as an example of an integration style that does "loose coupling" properly. There are in fact, some aspects of an Eventful style that reduce software coupling. But, if you're building an Eventful system it's important that you understand what aspects of loose coupling you get for free and which ones you'll need to work hard to get.

### The Loosely Coupled Eventful System

In an API interaction, coupling is natural and unavoidable. When one component is providing a service or producing an output, other components will naturally form a _dependency_ on it. But, the goal for most software designers is to reduce that dependency so that the components are _loosely coupled_. That means that a change to one of the components that provides a service or produces data should have as small an impact as possible on the other dependent components.

As we discussed in chapter [X] (Tk - callback to Mike's chapter on differint styles/patterns), Eventful architectures can take a number of different forms. We also learned that unlike synchronous interactions, Eventful communication goes in a single direction. 

is an issue when a change in 

////
Event-based architectures and asynchrounous APIs are often touted as being "loosely coupled". That's true to an extent, but be careful - it may not be de-coupled in a way that is useful to your needs. As we described earlier, de-coupling software components helps us reduce the amount of effort we need to spend on writing 
and maintianing code. So, does a decoupled asynchronous API help us do that?
////

(TK - this should back reference thee eventful API styles that Mike is writing)
As we described in chapter [x], an asynchronous API has some unique interaction characteristics. Instead of a request-reply model, asynchronous APIs often use a publish-subscribe model, in which multiple subscribers consume asynchronous event messages. We also described the important role of infrastructure and how it further separates the event publisher from the consumer.

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


