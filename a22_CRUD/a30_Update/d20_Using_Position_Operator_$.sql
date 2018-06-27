
-- General

  + There can be cases where we might not know the position of a
    value in the array. so using position update might not be possible
    
  + $ operator can be used to search for a specific position & update the value
  
  + Note:
    - Only updates the first match
  
-- Example

use videos
db.movies.deleteMany({})
db.movies.insertOne({dir: 'dir1', moviesNrating: [{'movie': 'm1', 'rating': 2}, 
{'movie': 'm1', 'rating': 2}]})
db.movies.find({})  
{ "_id" : ObjectId("5b339d3e5865960d43b33561"), "dir" : "dir1", 
"moviesNrating" : [ { "movie" : "m1", "rating" : 2 }, { "movie" : "m1", "rating" : 2 } ] }

// Update the specific value using position operator (ie $)
db.movies.updateOne({dir: 'dir1', 'moviesNrating.movie': 'm1'},
{$inc: {'moviesNrating.$.rating': 3}})
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }

db.movies.find({})
{ "_id" : ObjectId("5b339d3e5865960d43b33561"), "dir" : "dir1", 
"moviesNrating" : [ { "movie" : "m1", "rating" : 5 }, { "movie" : "m1", "rating" : 2 } ] }