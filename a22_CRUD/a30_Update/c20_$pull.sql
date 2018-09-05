
-- General

  + Can be used to remove an element in array based on seaerch criteria

-- Example ($pull)

use videos
db.movies.deleteMany({})
db.movies.find({})
db.movies.insertOne({dir: 'dir1', movies: ['m1', 'm2']})
db.movies.find({})
{ "_id" : ObjectId("5b3397145865960d43b3355c"), "dir" : "dir1", "movies" : [ "m1", "m2" ] }

db.movies.updateOne({dir: 'dir1'},
{$pull: {movies: 'm1'}})
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }

db.movies.find({})
{ "_id" : ObjectId("5b3397145865960d43b3355c"), "dir" : "dir1", "movies" : [ "m2" ] }