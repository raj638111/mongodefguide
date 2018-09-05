
-- General

  + $push operator can be used to create an array of values
  + Multiple values can be added to array using the ***$each Modifier along
    with the $inc operator

-- Example (Push single value to array)

use videos
db.movies.deleteMany({})
db.movies.insertOne({dir: 'somedir'})
db.movies.findOne()
{ "_id" : ObjectId("5b322be4a53a7db3ef1b153f"), "dir" : "somedir" }

db.movies.updateOne({dir: 'somedir'}, {$push: {hismovies: 'm1'}})
db.movies.findOne()
{
  "_id" : ObjectId("5b322d55a53a7db3ef1b1540"),
  "dir" : "somedir",
  "hismovies" : [
    "m1"
  ]
}

db.movies.updateOne({dir: 'somedir'}, {$push: {hismovies: 'm2'}})
{
  "_id" : ObjectId("5b322d55a53a7db3ef1b1540"),
  "dir" : "somedir",
  "hismovies" : [
    "m1",
    "m2"
  ]
}

-- Example (Push multiple value to array using **$each modifier)

db.movies.updateOne({dir: 'somedir'}, {$push: {hismovies: {$each: ['m3', 'm4']}}})
db.movies.findOne()
{
  "_id" : ObjectId("5b322d55a53a7db3ef1b1540"),
  "dir" : "somedir",
  "hismovies" : [
    "m1",
    "m2",
    "m3",
    "m4"
  ]
}




