
-- General

  + Can be used to remove last or first element in an array

-- Example ($pop)

use videos
db.movies.deleteMany({})
db.movies.find({})
db.movies.insertOne({dir: 'dir1', movies: ['m1', 'm2', 'm3', 'm4', 'm5']})
db.movies.find({})
{ "_id" : ObjectId("5b33987a5865960d43b3355e"), "dir" : "dir1", "movies" : [ "m1", "m2", "m3", "m4", "m5" ] }

// Remove last element
db.movies.updateOne({dir: 'dir1'}, {$pop: {movies: 1}})
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }

db.movies.find({})
{ "_id" : ObjectId("5b33987a5865960d43b3355e"), "dir" : "dir1", "movies" : [ "m1", "m2", "m3", "m4" ] }

// Remove first element
db.movies.updateOne({dir: 'dir1'}, {$pop: {movies: -1}})
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }

db.movies.find({})
{ "_id" : ObjectId("5b33987a5865960d43b3355e"), "dir" : "dir1", "movies" : [ "m2", "m3", "m4" ] }
