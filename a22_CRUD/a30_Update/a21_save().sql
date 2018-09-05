
-- save() #3. the save shell helper

  + Is a shell function that creates a document if do not exist or else update
    if one exist
  + Is convenient function alternative to updateOne() when using Shell
  
-- Example

use movies
  switched to db movies
  
db.views.find()  
{ "_id" : ObjectId("5b5cbbc8fd92e4cc0ee47851"), "title" : "somemovie", "viewed" : 0 }

var viewval = db.views.findOne()

viewval.viewed
  0
  
viewval.viewed = 1  
  1
  
db.views.save(viewval)  
  WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
  
db.views.find()  
  { "_id" : ObjectId("5b5cbbc8fd92e4cc0ee47851"), "title" : "somemovie", "viewed" : 1 }      