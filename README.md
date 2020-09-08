# Moving from RESTful to EVENTful


## Book Outline

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

## GUTTER

### How to build an EVENtful system?
 * The platform you'll need
 * Testing
 * Maintaining/Modifying
 * Migrating from a RESTful system

