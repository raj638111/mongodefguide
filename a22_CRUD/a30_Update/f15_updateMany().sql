
-- updateMany()

  + Used to update multiple documents matching certain criteria

-- Example

db.views.deleteMany({})  
{ "acknowledged" : true, "deletedCount" : 1 }

db.views.insertMany([
  {'movie': 'm1', day: '20180815'}, 
  {'movie': 'm2', day: '20180815'}])
{
  "acknowledged" : true,
  "insertedIds" : [
    ObjectId("5b79db8831e4df2d153a0a80"),
    ObjectId("5b79db8831e4df2d153a0a81")
  ]
}

db.views.updateMany({day: '20180815'}, {$set: {'special': 'Independence-India'}})
{ "acknowledged" : true, "matchedCount" : 2, "modifiedCount" : 2 }

db.views.find()
{ "_id" : ObjectId("5b79db8831e4df2d153a0a80"), "movie" : "m1", "day" : "20180815", "special" : "Independence-India" }
{ "_id" : ObjectId("5b79db8831e4df2d153a0a81"), "movie" : "m2", "day" : "20180815", "special" : "Independence-India" }