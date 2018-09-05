
-- Conditional Semantics

  + `Conditional` operators are always used in Inner document
  + `Update` operators are always user in Outer document
  + `meta-operators` go in Outer document
    - $and, $or, $nor
    - ** Note: Query optimizer do not optimize Meta operators
  
  
-- Data
db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', rating: 4},   
  {title: 'movie2', director: 'dir2', rating: "good"},
  {title: 'movie3', director: 'dir3', rating: 6}]
db.views.insertMany(data) 
  
-- Example (Conditional)

db.views.find({rating: {$in: ["good"]}})
{ "_id" : ObjectId("5b8f3bf0d12e40fd19807fb7"), "title" : "movie2", "director" : "dir2", "rating" : "good" }

-- Example (Update operator)

db.views.updateOne({title: 'movie1'}, {$inc: {rating: 2}})
db.views.find()
{ "_id" : ObjectId("5b8f3bf0d12e40fd19807fb6"), "title" : "movie1", "director" : "dir1", "rating" : 6 }
..

-- Example (Meta operator: $and)  

db.views.deleteMany({})
data = [
  {title: 'movie1', director: 'dir1', ratings: [0, 4]},   
  {title: 'movie2', director: 'dir2', ratings: [2, 3]}]
db.views.insertMany(data) 
db.views.find({$and: [{ratings: {$lt: 1}}, {ratings: 4}]})
{ "_id" : ObjectId("5b8f3eb1d12e40fd19807fbb"), "title" : "movie1", "director" : "dir1", "ratings" : [ 0, 4 ] }  

  
  