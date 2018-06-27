

-- General

  + Can be done by using the index of the value in the array
  
-- Example (Using index ; ie 0 or 1 or 2 etc...)

use videos
db.movies.deleteMany({})
db.movies.insertOne({dir: 'dir1', moviesNrating: [{'movie': 'm1', 'rating': 2}, 
{'movie': 'm1', 'rating': 2}]})
db.movies.find({})
{ "_id" : ObjectId("5b339bee5865960d43b33560"), "dir" : "dir1", 
"moviesNrating" : [ { "movie" : "m1", "rating" : 2 }, { "movie" : "m1", "rating" : 2 } ] }

// Update the specific value in the array using index
db.movies.updateOne({dir: 'dir1'},
{$inc: {'moviesNrating.0.rating': 3}})
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }

db.movies.find({})
{ "_id" : ObjectId("5b339bee5865960d43b33560"), "dir" : "dir1", 
"moviesNrating" : [ { "movie" : "m1", "rating" : 5 }, { "movie" : "m1", "rating" : 2 } ] }