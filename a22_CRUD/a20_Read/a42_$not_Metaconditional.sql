
** Metaconditional:
  + Can be applied on top of any other conditional operators
  
-- Example: $not

db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', rating: 4},   
  {title: 'movie2', director: 'dir2', rating: "good"},
  {title: 'movie3', director: 'dir3', rating: 6}]
db.views.insertMany(data)

** 
db.views.find({"title": {$not: {$in: ['movie1']}}})
{ "_id" : ObjectId("5b8f3a5dd12e40fd19807fb4"), "title" : "movie2", "director" : "dir2", "rating" : "good" }
{ "_id" : ObjectId("5b8f3a5dd12e40fd19807fb5"), "title" : "movie3", "director" : "dir3", "rating" : 6 }