# Moving from RESTful to EVENTful

 * [Book Outline](#Book-Outline)
 * [Greatest Outline Ever](#Greatest-Outline-Ever)
 * [Gutter](#Gutter)

## Book Outline
Here's our working outline

### Why EVENTful? Why now?
 * Asynchronous and reactive programming
 * Serverless and Cloud native architecture
 * Microservices

### What is EVENTful? 
 * Callout Fowler list - event streaming and CQRS
 * Eventful vs RESTful
 * History of EVENTful 
   * Actor model

### How to design an EVENTful architecture?
 * ???

### The EVENTful "brain" - like a functional programming paradigm shift.
 * forget everything you know about API design
 * focus on "actors" - not just consumers.  
 * shift your thinkinhg from client-server to publish-subscribe
 * Intermediaries are different (need to elaborate.. but the ideda of brokers)
 * events have already happened - different paradigm from the request-reply world
 * event style will not let you query state - there are ways to provie it but you'll need to design for it
 * there can be lots of different "truths" and "states"
 * persistence and record keeping becomes a design responsiblity - who keeps track of events?
 * lots of different patterns (e.g. UDP, pub/sub/ client-server queue, websocket, etc, etc)
 * the secret: focus on....
   * the message
   * the workflow/choregraphy
   * the actors
   * the system (archivers, .. what else?)
    
### Design factors/costs:
 * Build target (e.g. React, MS, serverless, cloud, kafka, blah, blah)
 * Team structure/size/shape
 *  Maintaining an event-driven system
    
### The [X] method 
 * Output of the method
 * Identifying the story
   * Outputs/deliverables
 * Identifying consumers and provider personas (actor)
   * Outputs/deliverables
 * Designing workflow
   * Outputs/deliverables
 * Designing messages
   * Outputs/deliverables
 * Designing storage and persitence
   * needs to happen
   * question is who is going to own the responsibility
     * the produer? 
     * the broker/tool/infra? 
     * An event store? 
     * the consumer?
   * Outputs/deliverables
 * Parts of the messages

### Other considerations
 * What about DDD, Event Storming, x?
 * What about testing and security?
 * What about observability and monitoring?
 * Gateways?

## Additional Notes
Some other angles to the story.

### Output/Assets
What kinds of assets should be produced in the process of designing EVENTful APIs?

 * API story (Markdown?)
 * List of events (pub'd and sub'd) (simple text list)
 * Service Vocabulary (data properties, event/action names) (text document)
 * Workflow Diagram (WSD?)
 * messages/structures 
 * machine-readable API defintion (AsyncAPI?, something else?)

Turn this over to developers

Note tha these assets need to exist for developers, but need not be "completed" before coding. Classic iterations and looping MUST be supported.

How is this different from RESTful assets? 

 * List of events is new (but similar to actions in vocabulary)
 * messages/structures (similar to media types for RESTful designs)
 * machine-readable is not OpenAPI but AsyncAPI instead

Adopt a consumer POV.

### Questions

 * do we need a canvas document?
 * do we need an ALPS description (to generate deinfition (asyncapi?)
 * do we need metrics (KPIs/OKRs)?


## Greatest Outline Ever
Riffing on the classic "Greatest Sales Deck I've Ever Seen" (https://medium.com/the-mission/the-greatest-sales-deck-ive-ever-seen-4f4ef3391ba0) idea.

 1. Name a Big, Relevant Change in the World
 2. Show There’ll Be Winners and Losers
 3. Tease the Promised Land
 4. Introduce Features as “Magic Gifts” for Overcoming Obstacles to the Promised Land
 5. Present Evidence that You Can Make the Story Come True

## Gutter

### How to build an EVENtful system?
 * The platform you'll need
 * Testing
 * Maintaining/Modifying
 * Migrating from a RESTful system

# Hard Parts

* Difficult to get started with an event design - which part of the ystem to attack
* Never feeling confident about correctness of the model/domain/events defined etc -> what can I do? vs what can I do with limited time?
* too many diff. infrastructures, protocols, tools, patterns - which parts do what?
* Thinking reactively is difficult
* thinking like an event consumer (most people don't think about this as a problem)
* Understanding who the event is for (most people don't think about this as a problem)
* Constraints of real world: time, security/governance, talent, etc...

The method gives you a starting point, gives you confidence in waht you are creating, helps you think reactively and as a consumer and works within your constraints.

