# API Client Interface (ACI)

The ACI should provide at minimum the following functions in its Gateway to allow interaction with the client API in a standard way. These resources should descend from a common base that provides authentication and a request mechanism (via HTTP gem).
- batch
- contribution
- contribution_type
- fund
- person

The methods above return an object that should have the following methods:
- **find(id:)** - Finds a single record by id. Returns an entity or nil.
- **search(\*\*args)** - Potentially returns multiple records given various parameters. Returns an array of entities or empty array.
- **create(entity:)** - Create a new record. Returns entity or nil on failure.
- **update(entity:)** - Update an existing record. Returns boolean.
- **delete(id:)** - Remove an existing record. Returns boolean.
- **<nested_resource>(resource_id:)** - This is another resource which is nested under the current resource (e.g. /people/:person_id/emails/:email_id). The nested resource would be the same as if the it was at the top level in the Gateway. We would then call it with something like this to find emails on a specific person:
gateway.person.email(person_id: <id>).search(<param>: <param-value>)
Any method can raise an exception on failure.
