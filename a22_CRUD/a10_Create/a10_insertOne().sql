
-- insertOne()

  - Adds a single document to a collection
  - Will also add _id key to the document
  
> movie = {title: 'somemovie', director: 'somedirector'}
> db
video
> db.blog.insertOne(movie)

> db.blog.find()
{ "_id" : ObjectId("5b1ae68fd4512757dd21a0cb"), "title" : "somemovie", "director" : "somedirector" }
