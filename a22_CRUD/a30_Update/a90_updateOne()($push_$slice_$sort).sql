
-- General

  + $sort can be used to sort the list before pushing to the db
  
-- Example

use videos
db.movies.deleteMany({})
db.movies.insertOne({dir: 'dir1', movies: [{name: 'm1', rating: 3}, 
  {name: 'm2', rating: 1}, {name: 'm3', rating: 4}]})
db.movies.findOne({})  
{
  "_id" : ObjectId("5b33860a5865960d43b33553"),
  "dir" : "dir1",
  "movies" : [
    {
      "name" : "m1",
      "rating" : 3
    },
    {
      "name" : "m2",
      "rating" : 1
    },
    {
      "name" : "m3",
      "rating" : 4
    }
  ]
}

// Sort & keep the first 3
db.movies.updateOne({dir: 'dir1'}, {$push: {movies: 
  {$each: [{name: 'm4', rating: 2}, {name: 'm5', rating: 6}],
  $slice: -3, $sort: {rating: -1}}}})

db.movies.findOne({})  
{
  "_id" : ObjectId("5b3388205865960d43b33554"),
  "dir" : "dir1",
  "movies" : [
    {
      "name" : "m1",
      "rating" : 3
    },
    {
      "name" : "m4",
      "rating" : 2
    },
    {
      "name" : "m2",
      "rating" : 1
    }
  ]
}
