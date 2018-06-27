
-- General

  + $slice modifier can be used to limit the size of an array
  + Based on the value of N(ie +ve or -ve) resemble Queue or Stack

-- Example (with Negative N: **resembles Queue)

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
db.movies.updateOne({dir: 'somedir'}, {$push: {hismovies: {$each: ['m5', 'm6'], $slice: -4}}})
db.movies.findOne()
{
  "_id" : ObjectId("5b322d55a53a7db3ef1b1540"),
  "dir" : "somedir",
  "hismovies" : [
    "m3",
    "m4",
    "m5",
    "m6"
  ]
}

-- Example (with +ve N: **resembles Stack)

db.movies.updateOne({dir: 'somedir'}, {$push: {hismovies: {$each: ['m7', 'm8', 'm9'], $slice: 5}}})
db.movies.findOne()
{
  "_id" : ObjectId("5b322d55a53a7db3ef1b1540"),
  "dir" : "somedir",
  "hismovies" : [
    "m3",
    "m4",
    "m5",
    "m6",
    "m7"
  ]
}



