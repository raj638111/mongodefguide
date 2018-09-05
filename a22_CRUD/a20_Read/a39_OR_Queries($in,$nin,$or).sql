
** OR condition can be specified using `in` or `OR`

db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', rating: 4},   
  {title: 'movie2', director: 'dir2', rating: "good"},
  {title: 'movie3', director: 'dir3', rating: 6}]
db.views.insertMany(data)

-- `in` examples 

** (needs an array)
db.views.find({rating: {$in: ["good"]}})
{ "_id" : ObjectId("5b875f32facb9a2b4b0a4cc2"), "title" : "movie2", "director" : "dir2", "rating" : "good" }

** (different types can be used)
db.views.find({rating: {$in: ["good", 4]}})
{ "_id" : ObjectId("5b875f32facb9a2b4b0a4cc1"), "title" : "movie1", "director" : "dir1", "rating" : 4 }
{ "_id" : ObjectId("5b875f32facb9a2b4b0a4cc2"), "title" : "movie2", "director" : "dir2", "rating" : "good" }

-- `or` examples

** (simple example)
db.views.find({$or: [{rating:4}, {title: 'movie3'}]})
{ "_id" : ObjectId("5b875f32facb9a2b4b0a4cc1"), "title" : "movie1", "director" : "dir1", "rating" : 4 }
{ "_id" : ObjectId("5b875f32facb9a2b4b0a4cc3"), "title" : "movie3", "director" : "dir3", "rating" : 6 }

** (using `in` in `or`)
db.views.find({$or: [{rating: {$in: [4, "good"]}}, {title: 'movie3'}]})
{ "_id" : ObjectId("5b875f32facb9a2b4b0a4cc1"), "title" : "movie1", "director" : "dir1", "rating" : 4 }
{ "_id" : ObjectId("5b875f32facb9a2b4b0a4cc2"), "title" : "movie2", "director" : "dir2", "rating" : "good" }
{ "_id" : ObjectId("5b875f32facb9a2b4b0a4cc3"), "title" : "movie3", "director" : "dir3", "rating" : 6 }