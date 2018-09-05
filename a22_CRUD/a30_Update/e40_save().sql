
-- save()
  + Is a shell (Convenience) function which is similar to Upsert
  
-- Example

db.views.deleteMany({})
{ "acknowledged" : true, "deletedCount" : 2 }


movie = {title: 'somemovie', viewCount: 1}
{ "title" : "somemovie", "viewCount" : 1 }

db.views.insertOne(movie)
{
  "acknowledged" : true,
  "insertedId" : ObjectId("5b79d85331e4df2d153a0a7f")
}

db.views.findOne()
{ "_id" : ObjectId("5b79d85331e4df2d153a0a7f"), "title" : "somemovie", "viewCount" : 1 }

var x = db.views.findOne()
x
{
  "_id" : ObjectId("5b79d85331e4df2d153a0a7f"),
  "title" : "somemovie",
  "viewCount" : 1
}


x.viewCount = 3
3

** Note: This is an convenient alternative to ; db.views.updateOne({"_id" : x._id}, x)
db.views.save(x)
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })










