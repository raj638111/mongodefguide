
-- Example #3.upsert


use video
  switched to db video

db.views.insertOne({title: 'somemovie', viewed: 0})
  {
    "acknowledged" : true,
    "insertedId" : ObjectId("5b5caa72fd92e4cc0ee4784f")
  }

viewval = db.views.findOne({title: 'somemovie'})

  {
    "_id" : ObjectId("5b5caa72fd92e4cc0ee4784f"),
    "title" : "somemovie",
    "viewed" : 0
  }


if(viewval) {
  viewval.viewed++;
  db.views.save(viewval)
}else {
  db.views.insertOne({title: 'somemovie', viewed: 1})
}

  WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

db.views.find()
  { "_id" : ObjectId("5b5caa72fd92e4cc0ee4784f"), "title" : "somemovie", "viewed" : 1 }
  
  
-- Disavdantage

  - Multiple calls to database
  - Race condition when multiple process acts on the same document in the collection
  
  
  
  
  
  