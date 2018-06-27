
-- update()
  - Search for a document & update the same
  - $set **
    . Is the update operator
  
> db.blog.update({"title": "somemovie"}, {$set : {reviews: []}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
>
> db.blog.find()
{ "_id" : ObjectId("5b1ae68fd4512757dd21a0cb"), "title" : "somemovie", "director" : "somedirector", "reviews" : [ ] }