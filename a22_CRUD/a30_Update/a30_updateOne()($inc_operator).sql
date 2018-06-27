

-- General

  + Note:
    . When using operators, value of _id cannot be changed
    . Possible to change the value of uniquely indexed keys though
    
    
-- Example

use videos
movie = {name: 'somemovie', count: 0}
db.movies.deleteMany({})
db.movies.insertOne(movie)
db.movies.findOne()
{
  "_id" : ObjectId("5b2e43d4db9084169d674fd6"),
  "name" : "somemovie",
  "count" : 0
}

// 1st argument : A document that specifies the search criteria
// 2nd argument : A document (which contains any of the update operators) that specifies the modification 
db.movies.updateOne({name: 'somemovie'}, {$inc: {'count': 1}})
db.movies.findOne()
{
  "_id" : ObjectId("5b2e43d4db9084169d674fd6"),
  "name" : "somemovie",
  "count" : 1
}