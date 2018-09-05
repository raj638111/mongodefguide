
-- Example  (update) #3.upsert

use movies
  switched to db movies

db.views.find()
	{ "_id" : ObjectId("5b5cb23dfd92e4cc0ee47850"), "title" : "somemovie", "viewed" : 1 }

db.views.updateOne(
  {"title": "somemovie"}, 
  {"$inc": {"viewed": 1}}, 
  {upsert: true})

  { "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
  
db.views.find()  

  { "_id" : ObjectId("5b5cb23dfd92e4cc0ee47850"), "title" : "somemovie", "viewed" : 2 }
  
  
-- Example  (insert)  
  
db.views.updateOne(
  {"title": "anothermovie"}, 
  {"$inc": {"viewed": 1}}, 
  {upsert: true})  
  
	{
	  "acknowledged" : true,
	  "matchedCount" : 0,
	  "modifiedCount" : 0,
	  "upsertedId" : ObjectId("5b5cb26bbbc4a44b39469217")
	}
	
db.views.find()

	{ "_id" : ObjectId("5b5cb23dfd92e4cc0ee47850"), "title" : "somemovie", "viewed" : 2 }
	{ "_id" : ObjectId("5b5cb26bbbc4a44b39469217"), "title" : "anothermovie", "viewed" : 1 }