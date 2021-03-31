{id: ch04}
# 4. Designing EVENTful systems 

<!-- 
 Mike
 (20 pgs)
-->

## Highlights
TK

## Common Patterns
TK

### Filtering
TK

### Parsing
TK

### Acting
TK

### Context
TK

## Design Process
TK

### Uncover the Story 
Like in all API design projects, the right place to start is with a _story_. We advocate a simple approach to documenting an *API Story* using a simple five-part template:

Purpose
: The *Purpose* is a one- or two-sentence statement that sums up the reason the API is needed. For example _"The Customer API is used to onboard, manage, and produce reports on the company's customers."_ The API Purpose will be used as the "guiding star" when deciding what functionality is included in the API. It can also be used to determine whether a requested change is made to the API once it has been placed into production.

Actions
: The *Actions* section lists all the operations that will be supported by the API. It can be written in a bullet list or sentence form. For example, _"The Customer API supports adding new customers to the system, editing existing customers, and marking exsiting customers status (pending, active, suspended, closed). The API also supports querying the list of customers and producing lists based in the following filter values: companyName, dateApproved, postalCode, and customerID."_ The Actions section should list *all* the operations but may not list all the details of how to implement that operation. The details will come later in the design process.

Data
: The *Data* section lists all the data properties used in the API. The data properties listed here are the ones that are part of the shared interface. No internal data properties are listed in this section. For example, _"The Customer API Data properties includes the company, companyName, companyAddress (street, city, province, postalCode), companyEmail, companyPhone, status, dateCreated, & dateUpdated."_ At this time, it is not important to indicate the data propertie types (string, number, etc.) or the internal storage details (e.g. what a database record might look like). 

Rules
: The *Rules* section includes any rules that govern the creation, updating, and/or filtering of the data properties. The section is usually written in list format, but may also be a series of short paragraphs. For example, _"The companyID value MUST be globally unique."_ or _"If the company's statue field is set to 'closed', the company record CANNOT be edited."_ and so forth. You do not need to include _how_ the rules will be implemented here.

Behaviors
: The *Behaviors* section contains any internal processes or behaviors that the API will support. These are usually documented in list form using short sentences. For example. _"When a new customer is added to the system, the spendingLimit field will be updated to reflect our internal algorithm for new customers."_ This section MAY reference internal algorithms or code routines but does not need to provide details on how those behaviors work or how they are executed.

The first three items in the list (Purpose, Actions, & Data) are _required_ elements for any API Story. The other two (Rules and Processes) are optional since they might always be needed in order to document the API that you will be designing.

*(output: Story Doc)*

### Identify the Actors 
TK

*(output: Persona List)*

### Describe the Interactions 
TK

*(output: workflow Diagram)*

### Document the Data/Events 
TK

*(output: Domain Vocabulary)*

### Define the Interface 
TK

*(output: AsyncAPI/proto3 Docs)*

## Summary
TK

## Additional Reading 
TK


