


-- insertMany()

  + Adds multiple documents to a collection
  + Can send hundres or thousands of document
  
movies = [{title: 'movie1', director: 'dir1'}, {title: 'movie2', director: 'dir2'}]
use video;
db.movies.insertMany(movies)
> db.movies.find()
{ "_id" : ObjectId("5b2150f1f4f43ad2f580f7e0"), "title" : "movie1", "director" : "dir1" }
{ "_id" : ObjectId("5b2150f1f4f43ad2f580f7e1"), "title" : "movie2", "director" : "dir2" }

  + LIMITS
    - In a single batch insert, only 48 MB of message can be inserted
    - If exceeds more than 48 MB, the driver might split 
      the mesage into multiple 48 MB batch inserts

