
db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', rating: null},   
  {title: 'movie2', director: 'dir2', rating: "good"},
  {title: 'movie3', director: 'dir3', rating: 6}]
db.views.insertMany(data) 

-- Example 1: Check for `null` directly (Case 1: Works as expected)

db.views.find({"rating": null})
{ "_id" : ObjectId("5b8f42a5d12e40fd19807fc3"), "title" : "movie1", "director" : "dir1", "rating" : null }

-- Example 2: Check for `null` directly (Case 2: Does not work as expected)

db.views.find({"city": null})

{ "_id" : ObjectId("5b8f42a5d12e40fd19807fc3"), "title" : "movie1", "director" : "dir1", "rating" : null }
{ "_id" : ObjectId("5b8f42a5d12e40fd19807fc4"), "title" : "movie2", "director" : "dir2", "rating" : "good" }
{ "_id" : ObjectId("5b8f42a5d12e40fd19807fc5"), "title" : "movie3", "director" : "dir3", "rating" : 6 }

-- Example 3: Better to use $eq, $exists

db.views.find({"city": {$eq: null, $exists: true}})
[Empty]

db.views.find({"city": {$eq: null, $exists: false}})
{ "_id" : ObjectId("5b8f42a5d12e40fd19807fc3"), "title" : "movie1", "director" : "dir1", "rating" : null }
{ "_id" : ObjectId("5b8f42a5d12e40fd19807fc4"), "title" : "movie2", "director" : "dir2", "rating" : "good" }
{ "_id" : ObjectId("5b8f42a5d12e40fd19807fc5"), "title" : "movie3", "director" : "dir3", "rating" : 6 }
