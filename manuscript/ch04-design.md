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
Like in all API design projects, the right place to start is with a *story*. We advocate a simple approach to documenting an **API Story** using a simple five-part template:

Purpose
: The *Purpose* is a one- or two-sentence statement that sums up the reason the API is needed. For example, the purpose of an API can be as simple as: _*"We keep track of companies for BigCo, Inc. "* The API Purpose will be used as the "guiding star" when deciding what functionality is included in the API. It can also be used to determine whether a requested change is made to the API once it has been placed into production.

Actions
: The *Actions* section lists all the operations that will be supported by the API. It can be written in a bullet list or sentence form. For example, *"Typical work on the company records include getting the list of company records, reading a single record, creating, updating, and deleting records. You can also update the status of a single record."* Note that the exact names of the actions do not need to be used here. They will be determined later in the process.

Data
: The *Data* section lists all the data properties used in the API. The data properties listed here are the ones that are part of the shared interface. No internal data properties are listed in this section. For example, _*"Data we include in a company record includes company name, street address, city, state/province, postal code, country, telephone, and email. Each record has a status value (pending, suspended, active, closed). We also track the date/time the record was created and the last date/time it was updated."* At this time, it is not important to indicate the data propertie types (string, number, etc.) or the internal storage details (e.g. what a database record might look like). 

Rules
: The *Rules* section includes any rules that govern the creation, updating, and/or filtering of the data properties. The section is usually written in list format, but may also be a series of short paragraphs. For example, *"We keep copies of the records, even after they have been deleted."* or *"You cannot edit a record that has the status value of 'closed'."* You do not need to include *how* the rules will be implemented here.

Behaviors
: The *Behaviors* section contains any internal processes or behaviors that the API will support. These are usually documented in list form using short sentences. For example. *"Each company has a unique identifier in the system. Right now that is a combination of the first four letters of their company name and date the company was added to the system (in the format YYYYMMDD. We add another digit if adding that does not result in a unique identifier in the system."* You do not need to provide details on how those behaviors work or how they are executed.

The first three items in the list (Purpose, Actions, & Data) are **required** elements for any API Story. The other two (Rules and Processes) are optional since they might always be needed in order to document the API that you will be designing.


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


