{id: ch02}
# 2. The EVENTful Architecture (Ronnie)

*(15 pgs)*

## Highlights
TK

{id: ch02-eventful}
## What is EVENTful?
As a bit of review, let's talk about just what we mean when we use the word *EVENTful*, especially when juxtaposed with the more common term, *RESTful*. 

While RESTful systems focused on resources, EVENTful solutions focus on actions. And, more importantly, EVENTful solutions rely on asynchronous interactions. This opens up many more possibilities for building responsive, real-time solutions. That means an EVENTful design offers services the ability to request and respond in real time and to do it in a way that provides more flexibility in the way the data is shared, displayed, and mixed across devices and platforms. 

Even though EVENTful architecture is ideal for cases where real-time responses are needed, they do not result in actual "real time" systems. Especially in large, complex implememtations, publishing thousands of messages to possibly hundreds or thousands of subscribers takes time. This can result in inconsistencies in various parts of the running system. 

This temporary inconsistency is a *feature* not a bug. Technically, this aspect of EVENTful systems is called *eventual consistency*. While delivering messages in an EVENTful system may take time, eventually these multiple storage centers will be consistent with each other. Eventual consistency is a feature of asynchronous systems that helps them scale better as your system and volume grows.

There are many patterns that fall under the EVENTful umbrella. In the sections to follow we'll focus on the most-used patterns here. That includes:

 * Webhooks and Pub-Sub
 * Event Notification (EN)
 * Event-Carried State (ECS)
 * Event Sourcing or Event Streaming (ES)
 * Command / Query Responsibility Separation (CQRS)

{class: discussion}
B> Technically, CQRS is not an event-based pattern but it is very often used in the same place as other EVENTful patterns and can be a very handy way to manage the transition from a RESTful to an EVENTful architecture model. 

### Web Hooks and Pub-Sub 
Before diving into the three classic event-driven patterns of EN, ECS, and ES, there are two patterns that have been around for decades worth mentioning: 1) webhooks [^ch02-hooks] and 2) publish-subscribe [^ch02-pubsub]. *Webhooks* have been around since 2007. It was Jeff Lindsey who is credited with first using the term in his blog post "Web hooks to revolutionize the web" [^ch02-lindsey] where he writes: "Web hooks are essentially user defined callbacks made with HTTP POST." 
   
[^ch02-hooks]: <https://en.wikipedia.org/wiki/Webhook>
[^ch02-pubsub]: <https://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern>
[^ch02-lindsey]: <https://web.archive.org/web/20180630220036/http://progrium.com/blog/2007/05/03/web-hooks-to-revolutionize-the-web/>

The ideas behind the *publish-subscribe* pattern can be traced back to a paper published in 1987 entitled "Exploiting virtual synchrony in distributed systems". In that paper, the authors state their aim is to "... provide a toolkit for distributed programming" and, to that end, describe the process of publishing a set of messages, subsribing to receive those messages, and broadcasting the puyblished messages to the list of subscribers. This should sound familiar since this is the list of operating elements of most all EVENTful systems: 1) a collection of published messages, a list of subscreibers for those messages, and a means to deliver those messages to subscribers. 

[^ch02-synchrony]: <https://dl.acm.org/doi/10.1145/37499.37515>

Both pub-sub and webhooks sare examples of early reactive, asynchronous patterns that influenced the kinds event-driven architecture (EDA) we have today. In the next sections we'll cover the three you'll most commonly see and use in your own IT shop: Event Notification, Event-Carried State, and Event Sourcing (or Event Streaming).

### Event Notification (EN)
The simplest is event notification — getting a “ping” when something happens (e.g. “a user updated their record”). 

Martin Fowler describes EN as something that happens "when a system sends event messages to notify other systems of a change in its domain."[^ch02-fowler]. He also points out an important aspect of the EN pattern is that it is primarily a "one-way" messaging system. Messages get sent to subscrtibers when soemthing happens and the sender does not expect any reply.  This one-way approach makes it a very de-coupled pattern that is relatively easy to implement in existing systems.

EN messages are usually quite small, too. They typically have just as few fields to identify the event title, it's name (or tag), some data items related to the event such as date/time or a link to , and possibly a link that the receiver can follow if more info is needed. Below is an example of a typical EN message. This one comes from Google's Firebase platform [ch02-firebase]:

{caption: "A typical event notification message"}
```javascript
{
  "message":{
    "token":"bk3RNwTe3H0:CI2k_HHwgIpoDKCIZvvDMExUdFQ3P1...",
    "notification":{
      "title":"Portugal vs. Denmark",
      "body":"great match!"
    },
    "data" : {
      "Nick" : "Mario",
      "Room" : "PortugalVSDenmark"
    }
  }
}
```
[^ch02-fowler]: <https://www.martinfowler.com/articles/201701-event-driven.html>
[^ch02-firebase]: <https://firebase.google.com/docs/cloud-messaging/concept-options>

Event notifications are helpful when you want to publish brief "alerts" about what is going on in a component or service. They are usually one-way messsges that don't require a reply and can be easy to add to an existing RESTful system.

The downside of the EN pattern is that they usually don't carry enough information to allow a receiver to get the full picture of waht happened. For that, you need to actually carry additional data in the message. For that you need to level-up in your EVENTful patterns and employ the Event-Carried State or ECS pattern.

### Event-Carried State (ECS)
A similar pattern is event-carried state or ECS. In this approach, the actual related data is “carried” along with the alert (e.g. “a user updated their record. here is the user object…”). 

**TK more goes here...**


### Event Streaming/Sourcing (ES)
The pattern most people associated with EVENTful design today is sometimes called event sourcing or event streaming (ES). In the ES world, every event is expressed as a transaction that is shipped to anyone interested and is also recorded in a kind of “ledger” that holds all the event transactions. In the case of the user information we’ve been discussing, there would be a transaction that indicates the change of the data in each of the user record fields. This might actually be expressed as multiple transactions. One of the unique aspects of ES is that most all transactions that change state can be “reversed” with another transaction. This is often equated with basic accounting ledgers where debits can cancel out credits in the ledger.

**TK clean up, expand**

### CQRS
There are other EVENTful approaches like web hooks, publish-subscribe, and command-query responsibility separation (CQRS). The most common element in all these patterns is the reliance on asynchronous interactions — the decoupling of the requests and responses — that leads to another common expression: Eventual consistency. 

**TK clean up, expand, (re)move eventual consistency stuff**

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
 * If you want to dig deeper into the world of Webhooks, we recommend you check out "Webhooks -- The Definitive Guide" at <https://requestbin.com/blog/working-with-webhooks/>.


