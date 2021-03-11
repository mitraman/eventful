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

{blurb, class: tip}
Web Hooks offer a quick way to use existing RESTful infrastructure to publish near real-time alerts to preconfigured subscribers. 
{/blurb}
   
[^ch02-hooks]: <https://en.wikipedia.org/wiki/Webhook>
[^ch02-pubsub]: <https://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern>
[^ch02-lindsey]: <https://web.archive.org/web/20180630220036/http://progrium.com/blog/2007/05/03/web-hooks-to-revolutionize-the-web/>

The ideas behind the *publish-subscribe* pattern can be traced back to a paper published in 1987 entitled "Exploiting virtual synchrony in distributed systems"[^ch02-synchrony]. In that paper, the authors state their aim is to "... provide a toolkit for distributed programming" and they describe the process of publishing a set of messages, subscribing to receive those messages, and broadcasting the published messages to the list of subscribers. This should sound familiar since this is the list of operating elements of most all EVENTful systems.

[^ch02-synchrony]: <https://dl.acm.org/doi/10.1145/37499.37515>

Both pub-sub and webhooks are examples of early reactive, asynchronous patterns that influenced the kinds event-driven architecture (EDA) we use today. In the next sections we'll cover the three patterns you'll most commonly see and use in your own IT shop: Event Notification, Event-Carried State, and Event Sourcing (or Event Streaming). We'll also round out our list of patterns by exploring the Command-Query Responsibility Separation (CQRS) pattern.

### Event Notification (EN)
The simplest EVENTful pattern is **event notification**. Martin Fowler describes EN as something that happens "when a system sends event messages to notify other systems of a change in its domain."[^ch02-fowler]. This is essentially like getting a “ping” when something happens (e.g. “a user updated their account”). 

<!--
optimizing design to be useful for consumers 
-->

{blurb, class: tip}
The Event Notification (EN) approach uses short, descriptive messages optimized for use by the message consumer.
{/blurb}

An important aspect of the EN pattern is that it is primarily a "one-way" messaging system. Messages get sent to subscribers when something happens and the sender does not expect any reply from message receivers.  This one-way approach makes EN a good de-coupled pattern that is relatively easy to implement in existing systems.

EN messages are usually quite small, too. They typically have just as few fields to identify the event title, it's name (or tag), some data items related to the event such as date/time or a link to , and possibly a link that the receiver can follow if more info is needed. Below is an example of a typical EN message. This one comes from Google's Firebase platform [^ch02-firebase]:

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

The downside of the EN pattern is that the message usually doesn't carry enough information to allow a receiver to get the full picture of what happened. For that, you need to actually carry additional data in the message. For that you need to level-up in your EVENTful patterns and employ the Event-Carried State or ECS pattern.

### Event-Carried State (ECS)
A similar pattern is event-carried state or ECS. In this approach, the actual related data is “carried” along with the alert (e.g. “a user updated their record. here is the user object ...”). with ECS messages, the message is more than just a notification. The message actually contains details about what was added or changed for a particular object or resource. 

<!-- 
optimizing for accuracy (object) comprehensivness)
-->

{blurb, class: tip}
The Event Carried State (ECS) approach uses complete, self-describing messages to optimize for data integrity and accuracy. 
{/blurb}

One of the key advantages of the ECS approach is that, by carrying details of the data that was added/changed, it can reduce traffic on the network. This is different than using the EN approach (see above). Of course, by adding more information in the message, you also increase the size of messages and run the risk of carrying around data that few recipients really want or need.

Below is an example of an ECS message. This one comes from Amazon'e AWS platform [^ch02-macie].

{caption: "A typical event carried state message"}
```javascript
{
  "id": "6f87d04b-9f74-4f04-a780-7acf4b0a9b38",
  "detail-type": "AWS Console Sign In via CloudTrail",
  "source": "aws.signin",
  "account": "123456789012",
  "time": "2016-01-05T18:21:27Z",
  "region": "us-east-1",
  "resources": [],
  "detail": { 
      "eventVersion": "1.02",
      "userIdentity": {
            "type": "Root",
            "principalId": "123456789012",
            "arn": "arn:aws:iam::123456789012:root",
            "accountId": "123456789012"
            },
      "eventTime": "2016-01-05T18:21:27Z",
      "eventSource": "signin.amazonaws.com",
      "eventName": "ConsoleLogin",
      "awsRegion": "us-east-1",
      "sourceIPAddress": "0.0.0.0",
      "userAgent": "...", 
      "requestParameters": null,
      "responseElements": {
            "ConsoleLogin": "Success"
            },
      "additionalEventData": {
            "LoginTo": "https://console.aws.amazon.com/...",
            "MobileVersion": "No",
            "MFAUsed": "No" },
      "eventID": "324731c0-64b3-4421-b552-dfc3c27df4f6",
      "eventType": "AwsConsoleSignIn"
      }
}
```

[^ch02-macie]: <https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/EventTypes.html#macie_event_type>

The ECS message pattern has some important implications for data storage services. First, when you are using ECS messages broadcast to multiple sources -- and each of those sources will be storing some or all the data in the message -- you introduce the possibility of inconsistency in data storage. This happens when Storage System A (SSA) processes and stores the information for the ECS message before Storage System B (SSB). When someone reads from SSA they may not get the same results as when they read from SSB. This inconsistency may only last for a few milliseconds but, in a high-traffic system that sends out thousands of ECS messages, the likelihood of an inconsistent read increases rapidly.

{id: ch02-eventual-consistency}
{aside}
### Eventual Consistency

The challenge of synchronizing data storage at multiple locations is common in all EVENTful systems and is called the **Eventual Consistency**[^ch02-eventual] problem. Most storage systems built for EVENTful use have conflict and consistency algorithms built into the platform so you rarely need to do anything special when you build your EVENTful data store. However, it is important to be aware of it and learn how to hangle cases where consistency may cause a problem (TK -- ronnie, will you deal with this in the data section below?)
{/aside}

[^ch02-eventual]: <https://en.wikipedia.org/wiki/Eventual_consistency>

Second, in systems that rely on a single source of truth or system of record (SOR) data storage pattern, the ECS record needs to have all the possibly relevant data in order to ensure the data storage is kept up-to-date. This might mean carrying the same data in subsequent update messages even if that data hasn't changed. Including this "unchanged data" can be important when the data storage system needs to validate the integrity of the information before saving and processing it for future use.

If you  want to continue to support data-writing in your EVENTful implementations and you also want to reduce the size of message payloads, you'd be better off using another pattern of EVENTful messaging: Event Streaming.

### Event Streaming/Sourcing (ES)
The pattern most people associated with EVENTful design today is sometimes called _event sourcing_ or _event streaming_ (ES). In the ES world, every event is expressed as a transaction that is shipped to anyone interested and is also recorded in a kind of “ledger” that holds all the event transactions. In the case of the user information we’ve been discussing, there would be a transaction that indicates the change of the data in each of the user record fields. This might actually be expressed as multiple transactions. One of the unique aspects of ES is that most all transactions that change state can be “reversed” with another transaction. This is often equated with basic accounting ledgers where debits can cancel out credits in the ledger.

{blurb, class: tip}
The Event Streaming (ES) pattern uses small, discreet messages designed to carry just the information that changed in order to optimize for near-realtime updates of the targeted data stores.
{/blurb}

In the ES approach, the primary goal is to design a message model is compact and yet still expressive. Both provider and subscriber applications are coded, or _bound_, to the message design itself. One of the challenges of creating a scalable and stable ES-style system is to carefully design the message(s) that will be sent back and forth within the system. A common tactic is to adopt a pattern where each objet your system ("product", "customer", "warehouse", etc.) becomes a message (see below).

{caption: "Object-centric event-sourcing customer message"}
```javascript
{
  // TK: make this better (mamund)
  "id":"CjYGiSipOE",
  "created_at":"2019-12-20T11:27:52-05:00",
  "updated_at":"2019-12-25T18:24:57-05:00",
  "givenName":"...",
  "familyName": "...",
  "email" : "...",
  "streetAddress1" : "...",
  "city":"...",
  "stateProvince":"...",
  "postalCode":"...",
  "countryCode:"..."
}
```

In each of the examples above, you can see the 'shape' of each object. While it is possible to design a "product message" and then design a "customer message" and then a "warehouse" message and so forth, this is not always the most effective way to implement an ES-style system. Instead, it can be better to design a single message that can be used by all parties to carry whatever information they wish.  The results in a more generic message that, while a bit harder for _humans_ to read, can be much more useful over time for _machines_ to deal with. 

Below is the same customer information displayed in a more generic event-source style message:

{caption: "Generic event-sourcing customer message"}
```javascript
{
  // TK: make this better (mamund)
  "id":"CjYGiSipOE",
  "created_at":"2019-12-20T11:27:52-05:00",
  "updated_at":"2019-12-25T18:24:57-05:00",
  "givenName":"...",
  "familyName": "...",
  "email" : "...",
  "streetAddress1" : "...",
  "city":"...",
  "stateProvince":"...",
  "postalCode":"...",
  "countryCode:"..."
}
```
Another thing to keep in mind when using the ES-style approach, is that small, flat messages are easier to turn into transactions than larger, deeply-nested messages. In fact, messages that only contain the data that was _changed_ (e.g. the familyName of a customer) are much easier to "reverse" with another transaction if that is ever needed.  This can be an advantage when you have large, complex records that change often.

As you might expoet, there is a downside to this fine-grained approach to tracking data changes. A system that just ships small bits of data around is not optimised for storing data in a way that is easy to query. Typically, ea small transaction needs to be written to a more strongly-typed data model. For example, changing the familyName of a customer may be one small transaction, but that transaction must be shipped to some system of reaord responsible for maintaining customer records and the one record's familyName needs to be written to durable storage (TK durable?).

{blurb, class: warning}
Optimizing ES-style systems for _writing_ data may mean you have a lot more work to do when you want to permanently _store_ and later _retreive_ that same data. Be sure you implement a system that can meet your SLA for _reading_ data, too!
{/blurb}

ES-style systems require you to carefully weigh the costs and advantages writing data quickly vs. reading data quickly. One way to tackle this problem is to adopt a hybrid approach to event-driven architecture by implementing a system that clearly separates querying data from writing data. 

### CQRS
Another approach to introducing EVENTful services into your ecosystem is to use the Command and Query Responsibility Segregation pattern or CQRS. Greg Young is credited with coining the term and describing the pattern. In a 2010 blog post, Young explained CQRS like this: "CQRS is a very simple pattern that enables many opportunities for architecture that may otherwise not exist." [^ch02-young]

[^ch02-young]:<http://codebetter.com/gregyoung/2010/02/16/cqrs-task-based-uis-event-sourcing-agh/>

In Young's blog post, he acknowledges that his CQRS pattern is rooted in another, older, pattern called "Command-Query Separation" first described by Bertrand Meyer in his 1988 book "Object-Oriented Software Construction" [^ch02-meyer]. There, Meyer points out that some functions in your application will modify/add/delete data (commands) and some functions are just for reading data (queries). It's easy to see how these two patterns are similar.

[^ch02-meyer]:<https://en.wikipedia.org/wiki/Object-Oriented_Software_Construction)>

{blurb, class: discussion}
If you'd like to learn more about Greg Young's thoughts on CRQS and how to use it, check out his eBook entitled "CQRS Documents By Greg Young". You can find a complete copy of the eBook online [^ch02-young-book]. 
{/blurb}

[^ch02-young-book]:<https://cqrs.files.wordpress.com/2010/11/cqrs_documents.pdf>

Strictly speaking, CQRS is not an EVENTful approach by itself -- Young points this out himself. However, by separating data reads from data writes, CQRS offers an excellent model for supporting EVENTful data streams. One of the key aspects of Young's CQRS is to take what was typically a single programming object - the `CustomerService` object - and divide that into two related objects - the `CustomerWriteService` and `CustomerReadService` objects.

Below is a coding example on this idea from Young's blog post:

{caption: "Example implementation of CQRS"}
```java
// CustomerService w/o CQRS
void MakeCustomerPreferred(CustomerId)
Customer GetCustomer(CustomerId)
CustomerSet GetCustomersWithName(Name)
CustomerSet GetPreferredCustomers()
void ChangeCustomerLocale(CustomerId, NewLocale)
void CreateCustomer(Customer)
void EditCustomerDetails(CustomerDetails)

/**************************************************
Applying CQRS on this would result in two services:
***************************************************/

// CustomerWriteService
void MakeCustomerPreferred(CustomerId)
void ChangeCustomerLocale(CustomerId, NewLocale)
void CreateCustomer(Customer)
void EditCustomerDetails(CustomerDetails)

// CustomerReadService
Customer GetCustomer(CustomerId)
CustomerSet GetCustomersWithName(Name)
CustomerSet GetPreferredCustomers()
```

{blurb, class: tip}
The CQRS pattern focuses on creating separate processing streams for reading data (the queries) and for writing data (the commands) and, for that reason, works well for organizations that want to continue to leverage their investment in relational data services while adding more EVENTful interactions to their overall architecture.
{/blurb}

Some of the advantages of the CQRS approach is that it allows you to optimize queries for speed and optimize command for safety and data consistency. However, there are drawbacks, too. By creating two data streams, you have the possibility of introducing data inconsistency between the two streams. WE discussed this challenge earlier in this chapter (TK see Eventual Consistency). Also, CQRS typically work well when the number of reads far outweighs the number of writes. If your implementation has the opposite profile (more writes than reads), you'll need to be sure CQRS is able to meet your service-level agreement (SLA) needs. 

**TK write a wrap up here**'

### Messages vs. Resources
Throughout this review of what it is that makes up EVENTful architecture you'll find a common theme: *messages*. One of the key elements of EVENTful architecture is the design, transport, and handling of the messages passed from producers to consumers. While RESTful architecture focuses a great deal on addressable *rsources* in order to power the system, EVENTful architecture places a great deal of emphsis on the messages themselves. 

This focus messages changes to leverage in the architecture. In EVENTful systems, addressable locations are *message brokers* and these brokers are known to producers and consumers. The brokers themsevles are really just 'switchboards' for recieving and delivering opaque messages as needed. That makes is relatively easy to change brokers without adversely affecting producers and consumers. That is in contrast to RESTful systems where changing the address of resources in the system can break an existing service or application.

At the same time, EVENTful systems depend a great deal on the ability of consumers to understand the messages reeived from brokers. Changing the shape and/or content of an EVENTful message runs the risk of breaking the services that depend upon the message consumers. When you consider that EVENTful solutions might continue to run for months or possibly years, managing the messages formats becomes very important for the long term health and stability of your EVENTful systems. 

This is one of the reasons that we focus on messages as an essential part of yuour EVENTful implementaton.
 
Now that we have a handle on the common message patterns for EVENTful systems and their importance in EVENTful systems, the next challenge is to outline the basic platform elements -- the infrastructure needed in order to implement and operate your EVENTful systems. 

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
 * The book "Software Architect's Handbook" by Joseph Ingeno has a nice section on the various EVENtful message patterns. You can find it here: <https://learning.oreilly.com/library/view/software-architects-handbook/9781788624060/>
 * Bertrand Meyer's 1988 book "Object-Oriented Software Construction" (<https://en.wikipedia.org/wiki/Object-Oriented_Software_Construction>) covers the origins and details of the concept of _Command-Query Separation_.
 * Greg Young published a PDF file entitled "CQRS Documents by Greg Young" in 2010 (<https://cqrs.files.wordpress.com/2010/11/cqrs_documents.pdf>). It is there that Young introduces CQRS and Event Sourcing.
 
<!--
 * https://www.confluent.io/blog/put-several-event-types-kafka-topic/
 -->

