
-- deleteMany()

  - Delete many documents that match a specific filter permanently from the database
  
> db.movies.deleteMany({})
>movies = [{title: 'movie1', director: 'dir1'},   
  {title: 'movie1', director: 'dir2'}]
>db.movies.insertMany(movies)
>db.movies.find()
  { "_id" : ObjectId("5b215dd3f4f43ad2f580f7e2"), "title" : "movie1", "director" : "dir1" }
  { "_id" : ObjectId("5b215dd3f4f43ad2f580f7e3"), "title" : "movie2", "director" : "dir2" }
 
> db.movies.deleteOne({title: 'movie1'})
  { "acknowledged" : true, "deletedCount" : 1 }
> db.movies.find()
  { "_id" : ObjectId("5b215dd3f4f43ad2f580f7e3"), "title" : "movie2", "director" : "dir2" }