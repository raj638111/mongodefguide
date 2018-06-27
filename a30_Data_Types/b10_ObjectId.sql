

-- Object ID

  + Is a 12 byte ID for a document stored in the key '_id'

> test = {"x": ObjectId()}
{ "x" : ObjectId("5b1ebdf1d4512757dd21a0cc") }  
  
  + Is unique for each document inside a collection
  + 12 byes = 24 hex digits
  + Object ID: Parts
    - 4 Bytes
      . Timestamp in which the object is created
      . Represents milliseconds since epoch
      . ObjectIds of documents sort *roughly in insertion order because of this
    - 3 Bytes
      . Unique identifier of a machine
    - 2 Bytes
      . Process ID of the ObjectId generating process
    - 3 Bytes
      . Is a couter responsible for uniqueness within a single process
      . Allow upto 256 unique ObjectIDs to be generated within a single process
      
  + Auto Generation
    - If no _id is present when a document is created, one will be automatically 
      added to the inserted document
    - Generally done by the Driver on client side, but can also be generated on the server
  

