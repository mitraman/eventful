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

The ideas behind the *publish-subscribe* pattern can be traced back to a paper published in 1987 entitled "Exploiting virtual synchrony in distributed systems"[^ch02-synchrony]. In that paper, the authors state their aim is to "... provide a toolkit for distributed programming" and they describe the process of publishing a set of messages, subscribing to receive those messages, and broadcasting the published messages to the list of subscribers. This should sound familiar since this is the list of operating elements of most all EVENTful systems.

[^ch02-synchrony]: <https://dl.acm.org/doi/10.1145/37499.37515>

Both pub-sub and webhooks are examples of early reactive, asynchronous patterns that influenced the kinds event-driven architecture (EDA) we use today. In the next sections we'll cover the three patterns you'll most commonly see and use in your own IT shop: Event Notification, Event-Carried State, and Event Sourcing (or Event Streaming). We'll also round out our list of patterns by exploring the Command-Query Responsibility Separation (CQRS) pattern.

### Event Notification (EN)
The simplest EVENTful pattern is **event notification**. Martin Fowler describes EN as something that happens "when a system sends event messages to notify other systems of a change in its domain."[^ch02-fowler]. This is essentially like getting a “ping” when something happens (e.g. “a user updated their account”). 

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

The downside of the EN pattern is that they usually don't carry enough information to allow a receiver to get the full picture of what happened. For that, you need to actually carry additional data in the message. For that you need to level-up in your EVENTful patterns and employ the Event-Carried State or ECS pattern.

### Event-Carried State (ECS)
A similar pattern is event-carried state or ECS. In this approach, the actual related data is “carried” along with the alert (e.g. “a user updated their record. here is the user object ...”). with ECS-style messages, the message is more than just a notification. The message actually contains details about what was added or changed for a particular object or resource. 

One of the key advantages of the ECS approach is that, by carrying details of the data that was added/dhanges, it can reduce traffic on the network. This is different than using the EN approach (see above). Of course, by adding more information in the message, you also increase the size of messages and run the risk of carrying around data that few recipients really want or need.

Below is an example of an ECS-style message. This one comes from Amazon'e AWS platform.

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
      "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36",
      "requestParameters": null,
      "responseElements": {
            "ConsoleLogin": "Success"
            },
      "additionalEventData": {
            "LoginTo": "https://console.aws.amazon.com/console/home?state=hashArgs%23&isauthcode=true",
            "MobileVersion": "No",
            "MFAUsed": "No" },
      "eventID": "324731c0-64b3-4421-b552-dfc3c27df4f6",
      "eventType": "AwsConsoleSignIn"
      }
}
```

The ECS message pattern has some imporant implications for data storage services. In systems that rely on a single source of truth or system of record (SOR) data storage pattern, the ECS record needs to have all the possibly relevant data in order to ensure the data storage is kept up-to-date. This might mean carrying the same data in subsequent update messages even if that data hasn't changed. Including this "unchanged data" can be important when the data storage system needs to validate the integrity of the information before saving and processing it for future use.




**TK more goes here...**


### Event Streaming/Sourcing (ES)
The pattern most people associated with EVENTful design today is sometimes called event sourcing or event streaming (ES). In the ES world, every event is expressed as a transaction that is shipped to anyone interested and is also recorded in a kind of “ledger” that holds all the event transactions. In the case of the user information we’ve been discussing, there would be a transaction that indicates the change of the data in each of the user record fields. This might actually be expressed as multiple transactions. One of the unique aspects of ES is that most all transactions that change state can be “reversed” with another transaction. This is often equated with basic accounting ledgers where debits can cancel out credits in the ledger.

**TK clean up, expand**

### CQRS
There are other EVENTful approaches like web hooks, publish-subscribe, and command-query responsibility separation (CQRS). The most common element in all these patterns is the reliance on asynchronous interactions — the decoupling of the requests and responses — that leads to another common expression: Eventual consistency. 

**TK Bertrand Meyer Command-Query Separation (https://en.wikipedia.org/wiki/Command%E2%80%93query_separation) **

**TK clean up, expand, (re)move eventual consistency stuff**

Now that we have a handle on the common message patterns for EVENTful systems, the next challenge is to outline the basic platform elements -- the infrastructure needed in order to implement and operate your EVENTful systems. 

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


