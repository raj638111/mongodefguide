
db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', rating: 4},   
  {title: 'movie2', director: 'dir2', rating: 3},
  {title: 'movie3', director: 'dir3', rating: 6}]
db.views.insertMany(data)

** $lt

db.views.find({rating: {$lt: 4}})
{ "_id" : ObjectId("5b875b41facb9a2b4b0a4cbc"), "title" : "movie2", "director" : "dir2", "rating" : 3 }

** $lt, $gt

db.views.find({rating: {$lt: 6, $gt: 2}})
{ "_id" : ObjectId("5b875b41facb9a2b4b0a4cbb"), "title" : "movie1", "director" : "dir1", "rating" : 4 }
{ "_id" : ObjectId("5b875b41facb9a2b4b0a4cbc"), "title" : "movie2", "director" : "dir2", "rating" : 3 }

-- Is very useful when dealing with DATE

db.views.deleteMany({})
data = [
  {title: 'movie1', director: 'dir1', date: new Date("01/01/2007")},   
  {title: 'movie2', director: 'dir2', date: new Date("01/02/2007")},
  {title: 'movie3', director: 'dir3', date: new Date("01/03/2007")}]
db.views.insertMany(data)

db.views.find({date: {$gt: new Date("01/02/2007")}})
{ "_id" : ObjectId("5b875c93facb9a2b4b0a4cc0"), "title" : "movie3", "director" : "dir3", "date" : ISODate("2007-01-03T06:00:00Z") }
