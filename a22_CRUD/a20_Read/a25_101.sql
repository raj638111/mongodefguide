
-- Get ALL documents
** First argument document is used to specify search criteria

db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1'},   
  {title: 'movie1', director: 'dir2'}]
db.views.insertMany(data)

** (1) (Using NO argument)

db.views.find()
{ "_id" : ObjectId("5b87571afacb9a2b4b0a4cb9"), "title" : "movie1", "director" : "dir1" }
{ "_id" : ObjectId("5b87571afacb9a2b4b0a4cba"), "title" : "movie1", "director" : "dir2" }

** (2) (Using EMPTY document)

db.views.find({})
{ "_id" : ObjectId("5b87571afacb9a2b4b0a4cb9"), "title" : "movie1", "director" : "dir1" }
{ "_id" : ObjectId("5b87571afacb9a2b4b0a4cba"), "title" : "movie1", "director" : "dir2" }

-- Get documents that meet search criteria

db.views.find({title: 'movie1', director: 'dir1'})
{ "_id" : ObjectId("5b87571afacb9a2b4b0a4cb9"), "title" : "movie1", "director" : "dir1" }