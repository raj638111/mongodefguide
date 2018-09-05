
-- Regex
  + Uses perl compatible regular expression (PCRE)

-- Data
  
db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', rating: null},   
  {title: 'movie2', director: 'dir2', rating: "good"},
  {title: 'somemovie', director: 'dir3', rating: 6}]
db.views.insertMany(data) 

-- Example 1 (Using $regex)

db.views.find({title: {$regex: /^movie1?/i}}) --Note: `i` is for ignore case
{ "_id" : ObjectId("5b8f43c2d12e40fd19807fc6"), "title" : "movie1", "director" : "dir1", "rating" : null }
{ "_id" : ObjectId("5b8f43c2d12e40fd19807fc7"), "title" : "movie2", "director" : "dir2", "rating" : "good" }

-- Example 2 (Without using $regex operator)

db.views.find({title: /^movie1?/i})
{ "_id" : ObjectId("5b8f43c2d12e40fd19807fc6"), "title" : "movie1", "director" : "dir1", "rating" : null }
{ "_id" : ObjectId("5b8f43c2d12e40fd19807fc7"), "title" : "movie2", "director" : "dir2", "rating" : "good" }

-- Example (Can also search a regular expression)

db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', rating: null, rgx: /1.*/},   
  {title: 'movie2', director: 'dir2', rating: "good", rgx: /7.*/i}]
db.views.insertMany(data)   
db.views.find({rgx: /7.*/i})
{ "_id" : ObjectId("5b8f4538d12e40fd19807fca"), "title" : "movie2", "director" : "dir2", "rating" : "good", "rgx" : /7.*/i }

