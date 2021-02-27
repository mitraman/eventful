# Eventful Design Method

## Goal and Outputs

Events just describe things that have happened. Its pretty easy to produce events. You just need to write code that creates events and sends them somewhere. All you really need is the right infrastructure to accept all the events that you make. 

But event *consumption* is more difficult. Taking all the events that a system *spews* out and doing something actionable and interesting with them is the real goal of an eventful system. If the events you create aren't *usable* they aren't very useful.

The goal of this design method is to help you produce and communicate system events that can be easily acted upon either immediately or in the future. To do that, we need a design that makes the following consuption activities easier:

* Filtering - Events are cheap to produce, but how do we reduce the signal to noise ration for event consumers
* Parsing -  How can we reduce the amount of unique code that needs to be written to process event in the system?
* Acting -  What information can the event provide to make the work of action/reaction simpler for consumers?
* Contextualizing - How can we help an event consumer understand how this event fits in with the world as whole? (e.g in terms of time, workflow, location, etc)

The specific outputs you'll produce with this method are:
1. A catalogue of event types (initial)
2. An event message format
3. A set of event patterns that you want to support (what could this be called)
4. Specs for events?

## Method

### Build the "story"
highlevel understanding of the biz/system, etc
You should be able to identify:
1. the stories, journeys, use cases, processes, *whtevers* that your system plans to support or doeds support
2. The end users, partners and sponsors that have a part to play in the definition, design, build and run of the system
3. At least one overall system goal that you can use as a "northstar"

### Identify actors and boundaries
(callout to actor model?)

Who are the event producers and event consumers that matter?

For every system you are modelling for you should be able to identify:
* primary purposes/use cases it supports
* Types of information it needs to support its use cases
* its physical deployment location
* The people/groups/companies who are responsible for developing and maintaining the system

### Identify interaction patterns

In a REST system we assume that all interactions are client-server, req-reply. In an EVENTful system we need to being by establishing the interaction patterns we plan to support in the system and where they will be relevant. This may be a factor of the infra available and the physical constraints of the system that is being designed and built.

e.g. pub/sub locally, event streaming to remote client, req-reply queries

int. patterns should be tied to boundaries in the system

### Document and group key events

* start with a use case, journey or process - can be "as-is" or "to-be"
* create an inventory of events that are needed to support the story - you can use specific methods like event storming, or you can use an interview and analysis technique
* identify these key parts for each event:
  * producer
  * consumer
  * the event it captures
  * the goal it supports 
  
As you document the events you can start to form groups of them. Try to gropu events based on the type of action that they trigger (this is just a stab in the dfark for now... seems like a good start). For example, you could group events together that are used to form an audit trail for a paritcular use case.

-> Seems like helping the reader with a heuristic for grouping events would be a big value. Goal is to help them create event cat4egories or archetypes - almost like mediatypes that consumers can use to consume events generically.

### Create a set of event "archetypes"/groups/categories/whatevers

start to fomralize events into types that can be used for parsing

### Define the event message loop

Thinking of something like from your book here - you should be able to map parts of the ervent to a consumption loop. Designer chooses which things will come from the event and which things need to be done by the consumer. 

### Design an event message structure

Envelope structure, JSON scema, payload data, etc.

-> Details here are intersting and will draw out design for workflow type elements

