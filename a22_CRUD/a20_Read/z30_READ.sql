
-- findOne()
  - Get one document from a collection

> db.blog.findOne()
{
  "_id" : ObjectId("5b1ae68fd4512757dd21a0cb"),
  "title" : "somemovie",
  "director" : "somedirector"
}

-- find()
  - Find all the documents from a collection

> db.blog.find()
{ "_id" : ObjectId("5b1ae68fd4512757dd21a0cb"), "title" : "somemovie", "director" : "somedirector" }  
  