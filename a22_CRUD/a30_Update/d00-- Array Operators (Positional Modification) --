
-- General

  + Only works with type integer, long & double 

-- Example

use videos
db.movies.findOne({})

{
  "_id" : ObjectId("5b2e46a6db9084169d674fd7"),
  "name" : "somemovie",
  "viewCount" : {
    "US" : 100,
    "UK" : 2
  }
}

db.movies.updateOne({name: 'somemovie'}, {$inc: {'viewCount.US': 2}})
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }

db.movies.findOne({})
{
  "_id" : ObjectId("5b2e46a6db9084169d674fd7"),
  "name" : "somemovie",
  "viewCount" : {
    "US" : 102,
    "UK" : 2
  }
}
