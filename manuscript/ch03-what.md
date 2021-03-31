{id: ch03}
# 3. What You Need to Know 

<!-- 
 Ronnie
 (15 pgs)
-->

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

There are five universal parts of an Eventful system that are most important to consider: producers & consumers, the network, the message, the infrastructure and the people. Let's take a look at each of them in turn.

### The Network 

A key characteristic for the kinds APIs we're talking about in this book is that they use a network to communicate. That probably feels obvious. But, its an important distinction for us to understand. We need to acknowledge that the network exists and that it has an impact on the way we are designing our software. With the modern tooling, systems and layers of abstrasction that we have today, its easy to forget that the network is there. 

A classic example of the importance of networks for API design are the [fallacies of distributed computing](https://en.wikipedia.org/wiki/Fallacies_of_distributed_computing):
1. The network is reliable
2. Latency is zero
3. Bandwidth is infinite
4. The network is secure
5. Topology doesn't change
6. There is one administrator
7. Transport cost is zero
8. The network is homogenous

{aside}
These fallacies have evolved and extended by different authors over the years. But, Peter Deutsch is usually credited as the primary author.
{/aside}

The fallacies listed above highlight the things that we often assume to be true when we design solutions, but actually aren't. For example, consider the software architecture diagram in [fig-1]:

TK fig-1: simple box and line arch diagram

On paper, this architecture paints a picture of a system that is neatly componentised into boxes that can pass event messages to each other. We could implement these components with identical messaging components and build a pretty good system. But, what if we mapped these components to a physical network architecture like [fig-2]?

TKf fig-2: box and line arch with network boundaries, some components at a great distance, others in a mobile app.

Suddenly, the realities of the network become apparent. Components that are physically far apart will need to account for latency in their design. Components that are deployed on mobile devices will need to account for a lack of network reliability and constantly changing geographic positions. Overall, the system is comprised of many different networks and sub-networks which each of their own characteristics and security profiles. 

The network has a big impact on how we think about the Eventful design in terms of messaging time and message size. We'll see examples of this when we dive in to the aspects of time and space later in this chapter. When you design an Eventful system it's crucial that you have an idea of how the system will be deployed and realised from a network perspective.

In a RESTful system we almost always use TCP/IP networks and the HTTP application protocol. These are both really well-suited for the synchronous, request-reply context of a RESTful interaction. But, as you start to build EVENTful systems you can start to consider other network options. For example, the UDP network protocol is optimised for broadcasting communications to many components. The MQTT application protocol is optimised for sending lots of small messages between physical devices. The 

{blurb}
Be careful of confusing the synchronicity of a network or application protocol with the synchronicity of your Eventful system. It's absolutely possible to deploy an event system over HTTP - just as its absolutely possible to deploy a request/reply system on an asynchronous network.
{/blurb}

The network has a big impact on how components communicate from a transport perspective. Now, let's take a look at that thing we are sending and receiving in the network - the message. 

### The Message

RESTful and Eventful systems have one very important thing in common: they are oriented around message based communication. Messages are units of communication. In the RESTful world, messages are categorised as requests and responses. When we use the HTTP protocol, a message contains a _representation_ of a server's resource. That representation may be an expression of the state of a resource at a certain point of time (e.g. the number of widgets) or a target state of a resource (e.g. a new label for a widget).

{blurb}
For more on representations and resources, take a look at.... TK
{/blurb}

Eventful systems also use messages as a form of communication. But, instead of requests and responses, the messages are *events*. Unlike requests and responses which are meant to be paired, event messages exist on their own as an island. While a request is a solicitation for something to happen (e.g. "what is the current time?") an event just communicates a fact without solicitation (e.g. "at the tone, the time will be 10:35").

In practice, the message turns out to be an incredibly important part of an EVENTful design. Just like in a RESTful system, an event message contains a representation of a time-bound state. Understanding how to create, parse and use these representations is a key element of an EVENTful system design. But, surprinsingly there is very little advice on how to do that in the industry. We'll address the importance of message design later in this chapter when we talk about coupling. Later, in the book we'll cover some design techniques and good practices to help you design better event messages.

With the importance of the message established, lets move on to understanding the components that create and use messages: the producers and consumers.

### Producers and Consumers

TK - getting a bit stuck here now. In a reuest-reply interaction, a requestor both produces request messages and consumes resopnse messages. But, don't want to make this so cmplicated. Need to think about it a bit more.

In  system there are two types of actors:  producers and message consumers. As you'd expect, message producers create (or produce) messages and message consumers use (or consumer) messages. The distinction between producers and consumers is a useful one because it denotes a dependency relationship. Message consumers will need to parse the messages that producers create. Therefore, there is a dependency on the producers to create messages that consumers will understand.

In a RESTful system, the consumer-provider relationship is fairly easy to understand. Systems that send requests are 

TK intro the concept of message producers and message consumers. 

Tk The REST/sync version

TK The async version and significance of this difference


### Messaging and Data Infrastructure

In the technology world, infrastructure serves as a platform to support the software that we need to build. For example, an infrastructure of computers, disk arrays and operating systems allows a team to focus on engineering software that depends on those components. An infrastructure of container registries, Cloud services and container orchestration allows a team to write and ship software as containers. We usually establish an infrastructure platform so that our teams can reduce the scope, effort and focus of their work by taking advantage of a shared set of tools and processes.

There is almost always some form of infrastructure in the message based integration world as well. When we design a system that connects software together, we take advantage of both hardware and software tools and systems to reduce the work we need to do to communicate in a message-based way. For example, in a RESTful system, we'd typically use the HTTP application protocol, the TCP/IP network protocol and a series of ethernet and fibre-optic cables to aid communication. A good example of this kind of model is the OSI model (TK link) which describes the layers of a network-based communication stack.

TK: following para needs to be simplified - too difficult to read
But, we often add additional message infrastructure within the "application" layer of the stack to make communication easier, more consistent and safer. For example, in a RESTful system, implementers often incorporate message-based routing, access control, threat protection and message translation as a core infrastructure component. This way, teams can deliver safer, dynamic API-enabled applications without implementing that logic themselves. Instead, they focus on application logic and deploy their applications behind a set of messaging infrastructure components that ensure a minimum set of entry criteria is met before a message consumer can request a response.

One of the biggest differences between an Eventful system and a RESTful system is that lifetime of a message. This turns out to have a big impact on the kind of infrastructure that we need to build. In the RESTful world, a client and server exchange messages over a network connection and the message exists within the lifetime of that network conversation. For example when a server responds to a client's HTTP GET request, that response dissapears once the client consumes it. Of course, the client or an intermediary could choose to retain that message and make it available to others to extend its life. But, there isn't anyting in the RESTful interaction itself that prescribes or guides implementers to do this.

In the Eventful world, most of the event-based patterns rely on durable messages. That's because in most of our event-based patterns we want messages to endure and stay available for multiple consumers to read and consume. In some patterns, like event sourcing, we want the event mesasages to last forever - forming a serialised history of everything that has ever taken place. This is a radical departure from the ephemereal or temporary nature of RESTFul system. 

To support this persistent state for messages, Eventful infrastructure designs need to address three areas of concern: data storage, data distribution and message discoverability.

(TK not sure what the markdown equivalent of this is yet.)

<!--
use this:

title
: para
title
: para

-->
Data Storage::
  Event messages will need to be stored, so you'll need to pay attention to the system qualities of the storage solution you choose. Particularly in terms of its "non-functional" qualities. How easily can the data storage system scale as the number of messages grows? How is performance impacted when multiple concurrent writes need to be performed? What is the mechanism for recovering from a failure? How is the storage solution backed up and archived securely? 

Data Distribution::
  Modern systems are often composed of code that runs in multiple geographic regions, data-centres or logical clustuers. This can pose a challenge for data storage when data needs to be synchronised across boundaries. For example, if we deploy an event messaging backbone for a globally distributed system, how can we ensure that event messages are transmitted in sequence in all regions? Are we willing to impact the performance of our event messaging system so that we can maintain the integrity of events? Or can we take an "eventual consistency" approach and sacrifice immediate integrity for the sake of performance? If you are building a non-trivial system, you'll likely need to address these questions of distributed data management and plan a solution accordingly.

Message Discoverability::
  Its one thing to store messages in an enduring way. Its another to be able to easily retrieve them and use them. Evenful systems need an infrastructure that makes it easy to find and consume mesasages. Traditionally, event-based systems have used addressable message spaces to make messages easier to find. For example, in MQ tooling, messages can be read from named "Message Queues" on a server. In JMS (Java Messaging Service), messages are published to "topics" for others to read from. In addition, most event-based systems also support text-based, property-based and pattern-based search methods to support finer-grained discovery of messages.  In an Eventful sytstem its a good idea to establish a shared understanding of the discoverability mechanism, naming standards and key words (or properties) that consumers and providers in your system should use. 

As you might guess, there is a very high level of complexity to deal with in an event-based infrastrucutre. But, just as we don't need to build our own TCP/IP socket layer when we implement RESTful APIs, most people don't build their own event infrastructure from scratch. But, unlike TCP/IP and HTTP, there isn't a definitive standard that we can apply to our Eventful infrastructure. Instead, you'll need to select from a set of tools and chooose the ones that best fit your needs. For example, at the time of writing, Kafka is a popular choice for event-streaming patterns because it comes with a topic-based discovery system, permanent message storage and a decentralised deployment model with a good performance profile. Its generally a safe choice for infrastructure, but beware - it comes with a complexity cost and requires specialist expertise to set it up and run it properly.

### People

Tk highilght that we need to design for people, not just systems. Catalog the types of people.


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

## Distance and Size

When we design systems on paper, its easy to forget about the physical realities (and constraints) of the systems that we are building. Physical distance turns out to be a big factor when it comes to asynchronous and event based designs. With today's technology, as the distance between a message producer and message consumer grows, the time it takes for messages to be communicated will grow as well. Another side-effect of distance is that the reliability of the network decreaes as well.

Our designs need to accomodate for the distance between components. A lot of the network protocols we use today already do that for us. For example, TCP/IP is designed to be optimised for reliability of transmission between two parties rather than for low-latency communications. The TCP/IP model of communication is actually pretty well-suited for the way HTTP and RESTful APIs work. That's not really an accident. [TK need to validate and extend this point - assume TBL/Fielding designed for TCP/IP comms]

But, out asynchronous interactions aren't really well suited for the TCP/IP interaction model. As we've mentinoned a few times, today's event based models are very often pub-sub based. That requires either a specialised protocol like UDP or requires specialised middleware or infrastructure that publishers and consumers can use.

There's also another challenge that comes from using asynchronous APIs - event messages tend to be smaller. Small messages drive a special type of messaging characteristic called "chattiness" that can turn out to be a problem.

### Eventful Chattiness

"Chattiness" is a collaquial way of describing the amount of messages that are needed to support a message based interaction. When a component is "chatty" it transmits lots of messages on the network. In a RESTful architecture chatiness manifested itself as multiple request-reply messages to achieve an interaction goal. In an EVENTful system, chattiness usually means that a components produces lots of messages within a short time frame.

It's difficult to avoid chattiness when you're designing an asynchronous API. That's because event-based design often means that you're publishing events as they happen. In most systems, there are lots of things happening. That means that you'll inevitably be publishing lots of events.

Normally, this isn't a big deal. In an eventful system, infrastructure is usually tuned to support lots of  producers publishing lots of messages. Consumers are designed to filter messages and only respond to what they need, so the having to wade through lots of messages isn't really an issue.

But, chattiness becomes a problem when we add the distance factor. That's because [tk ... wait a second. Not sure this is true. need to think about it]

### Boundaries

When it comes to APIs, boundaries are really important. The modules we develop and connect together are each defined by the boundaries they create.  A module has an _inside_ where its implementation lives and it has an _outside_ which it doesn’t own. The boundary defines what’s inside and what’s outside. Getting the boundaries of a module right turns out to be really important for a software architecture.

That’s because the boundaries dictate the size and complexity of a thing. If you create a module that is very big and complex, you’ll probably need a very big and complex team to work on it. There isn’t a requirement to build very small, bounded modules when you implement an Eventful architecture. But, in practice there turns out to be a nice relationship between smaller bounded services and Eventful messaging.

That’s because when you make the boundaries of your components smaller, you inevitably end up with more components. More components, often leads to more communication and chattiness. Eventful systems are pretty good at handling those kinds of chattiness requirements, so its a good fit.

But, we don’t just find boundaries at the component level. In most software architectures, components are grouped together into logical and physical collections. For example, you might group a collection of customer oriented services together and create a new boundary around them. In practice, we almost always need to define and understand a set of *nested* boundaries, rather than a flat structure.

One kind of boundary that is particularly important is the kind that denotes an organiasational, system or physical limit. For example, most companies make a distinction between the servers that they run and operate versus the servers that they just interact with on the Internet. Another example, is the boundnary of a home IOT network that integrates with a server based system.

These system level boudnaries are important to understand from an Eventful perspective. Thats because they often denote a security and physical requirement that shapes the types of interactions that they can support. In the case of an IOT system, we might use an EventFul architecture within the physical home environment, but use a RESTful architecture to communicate with a cloud based server. 

In order to design an EventFUl system that is practical, we need to acknowledge that the network exists.

### Circumventing the distance constraint

TK RPC story as build up?

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

## What does a good Event-System look like?

TK this section ties all the concepts together from a quality perspective. Can be inspred by Fielding's chapter 2 and chapter 3

TK (mamund) one thing I really like about Fielding's system properties narrative is that he calls out how his constraints promote the desired properties. wonder if we have the same oppty here? these are the properties. are there constraints we recommend somewhere, too? 

### Changeability

TK - descrive changeability (modifiability, evolveability, extensbility) in therms of concepts in this chapter

### Maintainability

TK - describe maintainability 

### Observability

### Reliability and Scalability

TK - describe reliability and scalability in terms of concepts in this chapter

### Usability

TK - describe usability in terms of concepts in this chapter

### Comparing the Eventful and REStful systems

TK aspirational
TK maybe transalte fielding's table and do the columns for eventful 

## Summary
TK

## Additional Reading
TK


