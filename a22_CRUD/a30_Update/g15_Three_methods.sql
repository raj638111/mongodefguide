
-- Three methods 

  + Follwing 3 methods return the specific document upon which an 
    action(Delete, replace, update) has taken place
    1. findOneAndDelete()
    2. findOneAndReplace()
    3. findOneAndUpdate()
    
  + returnNewDocument: true
    - By default these 3 methods returns old document(before the action took place)
    - New/updated document can be returned by setting this option
      . returnNewDocument: true
      
  + sort
    - This option can be used to sort the document before finding the right one to 
      update/replace/delete
      
-- Example

db.views.deleteMany({})      
{ "acknowledged" : true, "deletedCount" : 2 }

db.views.insertMany([
  {movie: 'm1', priority: 1, status: 'running'},
  {movie: 'm2', priority: 2, status: 'running'}
])

***
var x = db.views.findOneAndUpdate(
  {status: 'running'}, 
  {$set: {'status': 'not-running'}},
  {sort: {priority: -1}, returnNewDocument: true})
{
  "_id" : ObjectId("5b79e65631e4df2d153a0a86"),
  "movie" : "m2",
  "priority" : 2,
  "status" : "not-running"
}  

var x = db.views.findOneAndUpdate(
  {status: 'running'}, 
  {$set: {'status': 'not-running'}},
  {sort: {priority: -1}, returnNewDocument: true})
x
{
  "_id" : ObjectId("5b79e65631e4df2d153a0a85"),
  "movie" : "m1",
  "priority" : 1,
  "status" : "not-running"
}


  
  