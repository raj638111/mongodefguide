
** Can be used to limit the no of fields we are returning which reduces the 
amount of data sent over wire as well as reduce memory to decode document on 
the client side

** Second argument document specify the fields we want to return from db

-- Example

db.views.find()

{ "_id" : ObjectId("5b87571afacb9a2b4b0a4cb9"), "title" : "movie1", "director" : "dir1" }
{ "_id" : ObjectId("5b87571afacb9a2b4b0a4cba"), "title" : "movie1", "director" : "dir2" }
 
** (Number `1` specifies that a given field needs to be retrieved
db.views.find({}, {title: 1})

{ "_id" : ObjectId("5b87571afacb9a2b4b0a4cb9"), "title" : "movie1" }
{ "_id" : ObjectId("5b87571afacb9a2b4b0a4cba"), "title" : "movie1" }

** (Number `0` specifies that a given field should not be retrieved
db.views.find({}, {title: 0})
{ "_id" : ObjectId("5b87571afacb9a2b4b0a4cb9"), "director" : "dir1" }
{ "_id" : ObjectId("5b87571afacb9a2b4b0a4cba"), "director" : "dir2" }