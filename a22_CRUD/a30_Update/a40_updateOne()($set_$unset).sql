
-- General

  + Can be used to create a new field with default value (or)
    replace the value of an existing field

-- Example 1.1 ($set)

use videos
db.movies.deleteMany({})
movie = {name: 'somemovie'}
db.movies.insertOne(movie)
db.movies.findOne()
{ "_id" : ObjectId("5b2e46a6db9084169d674fd7"), "name" : "somemovie" }

// 1st argument : A document that specifies the search criteria
// 2nd argument : A document (which contains any of the update operators) that specifies the modification 
db.movies.updateOne({name: 'somemovie'}, {$set: {'viewCount': 10}})
db.movies.findOne()
{
  "_id" : ObjectId("5b2e46a6db9084169d674fd7"),
  "name" : "somemovie",
  "viewCount" : 10
}

-- Example 1.2 (Modify the Type) (Here we have replaced the number type with subdocument)

db.movies.updateOne({name: 'somemovie'}, {$set: {'viewCount': {'US': 5, 'UK': 2}}})
db.movies.findOne()
{
  "_id" : ObjectId("5b2e46a6db9084169d674fd7"),
  "name" : "somemovie",
  "viewCount" : {
    "US" : 5,
    "UK" : 2
  }
}

-- Example 1.3 (Modify the value of embedded document)

db.movies.updateOne({name: 'somemovie'}, {$set: {'viewCount.US': 100}})
db.movies.findOne()
{
  "_id" : ObjectId("5b2e46a6db9084169d674fd7"),
  "name" : "somemovie",
  "viewCount" : {
    "US" : 100,
    "UK" : 2
  }
}


-- Error (This do not work. Always need to use an operator)

db.movies.updateOne({name: 'somemovie'}, {name: 'newmovie'})
2018-06-26T06:49:09.596-0500 E QUERY    [thread1] Error: the update operation document must contain atomic operators :
DBCollection.prototype.updateOne@src/mongo/shell/crud_api.js:542:1
@(shell):1:1


-- Example 2 : $unset

pending...





