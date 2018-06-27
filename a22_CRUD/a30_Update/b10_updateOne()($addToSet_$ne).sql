
-- General

  + $ne & $addToSet can be used to treat array as a set
  
-- Example: $ne (** This does not work)

use videos
db.movies.deleteMany({})
db.movies.insertOne({dir: 'dir1', movies: [{name: 'm1'}, {name: 'm2'}, {name: 'm3'}]})  
db.movies.findOne({})
{
  "_id" : ObjectId("5b3389ff5865960d43b33556"),
  "dir" : "dir1",
  "movies" : [
    {
      "name" : "m1"
    },
    {
      "name" : "m2"
    },
    {
      "name" : "m3"
    }
  ]
}
...


-- Example: $addToSet

use videos
db.movies.deleteMany({})
db.movies.insertOne({dir: 'dir1', movies: [{name: 'm1'}, {name: 'm2'}, {name: 'm3'}]})  
db.movies.findOne({})
{
  "_id" : ObjectId("5b338bee5865960d43b33557"),
  "dir" : "dir1",
  "movies" : [
    {
      "name" : "m1"
    },
    {
      "name" : "m2"
    },
    {
      "name" : "m3"
    }
  ]
}

// Duplicate is not allowed
db.movies.updateOne({dir: 'dir1'}, 
{$addToSet: {'movies': {name: 'm3'}}})
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 0 }
db.movies.findOne({})
{
  "_id" : ObjectId("5b338d715865960d43b33558"),
  "dir" : "dir1",
  "movies" : [
    {
      "name" : "m1"
    },
    {
      "name" : "m2"
    },
    {
      "name" : "m3"
    }
  ]
}

// Adding new element
db.movies.updateOne({dir: 'dir1'}, 
{$addToSet: {'movies': {name: 'm4'}}})
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
db.movies.findOne({})
{
  "_id" : ObjectId("5b338d715865960d43b33558"),
  "dir" : "dir1",
  "movies" : [
    {
      "name" : "m1"
    },
    {
      "name" : "m2"
    },
    {
      "name" : "m3"
    },
    {
      "name" : "m4"
    }
  ]
}
