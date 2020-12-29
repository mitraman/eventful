{id: ch02}
# 2. The EVENTful Architecture (Ronnie)

*(15 pgs)*

## Highlights
TK

{id: ch02-eventful}
## What is EVENTful?
As a bit of review, let's talk about just what we mean when we use the work **EVENTful**, especially when juxtaposed with the more common term, **RESTful**. 

While RESTful systems focused on resources, EVENTful solutions focus on actions. And, more importantly, EVENTful solutions rely on asynchronous interactions. This opens up many more possibilities for building responsive, real-time solutions. That means an EVENTful design offers services the ability to request and respond in real time and to do it in a way that provides more flexibility in the way the data is shared, displayed, and mixed across devices and platforms. 

There are many implementation patterns that fall under the EVENTful umbrella. In the sections to follow we'll focus on the most-used patterns here. That includes:

 * Event Notification (EN)
 * Event-Carried State (ECS)
 * Command / Query Responsibility Separation (CQRS)
 * Event Sourcing or Event Streaming (ES)

NOTE:: Technically, CQRS is not an event-based pattern but it is very often used in the same place as other EVENTful patterns and can be a very handy way to manage the transition from a RESTful to an EVENTful architecture model. 

### Web Hooks and Pub-Sub 
Along with the four patterns we'll cover in thsi book there are two more work mentioning: 1) web hooks [^ch02-hooks] and 2) publish-subscribe [^ch02-pubsub]. Web hooks habe been around since 2007. It was Jeff Lindsey who is credited with first using the term in his blog post "....." [^ch02-lindsey].   

There are lots of implementation patterns that fall under the EVENTful umbrella. The simplest is event notification — getting a “ping” when something happens (e.g. “a user updated their record”). A similar pattern is event-carried state or ECS. In this approach, the actual related data is “carried” along with the alert (e.g. “a user updated their record. here is the user object…”). 

The pattern most people associated with EVENTful design today is commonly called event sourcing or ES. In the ES world, every event is expressed as a transaction that is shipped to anyone interested and is also recorded in a kind of “ledger” that holds all the event transactions. In the case of the user information we’ve been discussing, there would be a transaction that indicates the change of the data in each of the user record fields. This might actually be expressed as multiple transactions. One of the unique aspects of ES is that most all transactions that change state can be “reversed” with another transaction. This is often equated with basic accounting ledgers where debits can cancel out credits in the ledger.

There are other EVENTful approaches like web hooks, publish-subscribe, and command-query responsibility separation (CQRS). The most common element in all these patterns is the reliance on asynchronous interactions — the decoupling of the requests and responses — that leads to another common expression: Eventual consistency. 

The propagation of these transaction messages may take time and various “ledgers” may not be exact copies of each other at different points in time. However, eventually these multiple storage centers will be consistent with each other. Eventual consistency is a feature of asynchronous systems that helps them scale better as your system and volume grows.


TK

### Event Notification
TK

### Event-Carried State
TK

### CQRS
TK

### Event Streaming/Sourcing
TK

## EVENTful Infrastructure  
TK

### Data Storage
TK

### Message Brokers
TK

### Testing Platform
TK

### Security Tooling
TK

### Build Pipeline
TK

## EVENTful Mindset
TK

### Actors, Not Consumers
TK

### Publish-Subscribe, Not Client-Server
TK

### Events, Not Resources
TK

### Other Considerations   
TK

## Summary
TK

## Additional Reading
TK


