# Moving from RESTful to Eventful

## Foreword (???)
TK

## Preface (3)
 * Who Sould Read This Book
 * What's Covered
 * What's Not
 * Acknowledgements
 
## Why EVENTful? (10)
 * From RESTful to Eventful (what is Eventful intro)
 * Highlights
 * Why Businesses need Eventful Systems
   * Market forces (fragementation of services, rising consumer expectations, pressure on cost optimisation)
   * Adding Speed (both real-time, and build-time)
   * Increasing Connections (between components and businesses)
   * Expanding Reach (internal reach, and market expansion)
 * Why Now? Technology is changing
   * The Rise of Asynchronous and reactive programmes
   * The Growth of Microservices 
   * The Power of Serverless and Cloud native architecture
 * Where Events Fit In
   * Meeting Business Demands
   * Reducing Technical Challenges
 * Summary
 * References
 
## The EVENTFul Architecture (15)
 * Highlights
 * What is EVENTful?
   * Event Notification
   * Event-Carried State
   * CQRS
   * Event Streaming/Sourcing
 * The Eventful System (what are the important parts)
   * Infra
   * Messages
   * Consumers and Providers
 * EVENTful Infrastructure  
   * Data Storage
   * Message Brokers
   * Testing Platform
   * Security Tooling
   * Build Pipeline
 * EVENTful Mindset
   * Actors, Not Consumers
   * Publish-Subscribe, Not Client-Server
   * Events, Not Resources
   * Other Considerations   
 * Summary
 * References
 
## What You Need to Know (15)
 * Highlights
 * Coupling
   * The myth of loose coupling
   * Message coupling
 * Distance, Space and time
   * Eventful chattiness
   * Local vs Internet
 * Interacton Patterns (needed a third thing)
 * Summary
 
## Designing Evevntful systems (15)
 * Highlights
 * Common Patterns
   * Filtering
   * Parsing
   * Acting
   * Context
 * Design Process
   * Uncover the Story (output: Story Doc)
   * Identify the Actors (output: Persona List)
   * Describe the Interactions (output: workflow Diagram)
   * Document the Data/Events (output: Domain Vocabulary)
   * Define the Interface (output: AsyncAPI/proto3 Docs)
 * Summary
 * References
 
 (would prob. kill this or try to weave in)
## Customer Onboarding Example (15)
 * Highlights
 * Design
   * Story
   * Actors
   * Workflow
   * Vocabulary
   * Definition
 * Implementation   
   * Kafka Storage
   * MQTT Interface
   * Test/Build Pipeline
 * Summary 
 * References

## Parting Thoughts (5)
 * Where to Start
 * Dealing with "Correctness"
 * Sorting Out the Moving Parts
 * Reactive Architecture
 * Consumer-First Design
 * Real-World Constraints
 * Summary
 * References

## Appendix A: Onboarding Example Install/Setup (5)
 * Heroku
 * NodeJS/NPM
 * Jest Testing Tool 
 * Build Pipeline (???)
 
## Appendix B: Design Assets (10)
 * Onboarding Event Story
 * Onboarding Persona List
 * Onboarding Workflow Diagram
 * Onboarding Domain Vocabulary
 * Onboarding Interface Definitions
 
## Appendix C: Code Examples (???)
More on the code, choices made, where to go.

