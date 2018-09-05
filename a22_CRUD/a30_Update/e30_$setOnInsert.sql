
-- $setOnInsert #3.Upserts 
  
  + Set a value only on insert (but not in update) when using `upsert` option
  + Is also user for
    - Padding, initializing counters
    - Collections that not use ObjectIds (Example: We can set a create timestamp for the Document)
  
-- Example

use movies
  switched to db movies

db.views.find()
  [Empty]
  
db.views.updateOne(
  {movie: 'M1'}, 
  {"$setOnInsert": {director: 'Dir1'}, "$inc": {views: 1}}, 
  {'upsert': true})  

	{
	  "acknowledged" : true,
	  "matchedCount" : 0,
	  "modifiedCount" : 0,
	  "upsertedId" : ObjectId("5b5cb6b5bbc4a44b39469253")
	}  

db.views.updateOne( -- Expected : The director name should not change as this is an update
  {movie: 'M1'}, 
  {"$setOnInsert": {director: 'Dir2'}, "$inc": {views: 1}}, 
  {'upsert': true})	
  
  { "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
  
 db.views.find() 
  { "_id" : ObjectId("5b5cb6b5bbc4a44b39469253"), "movie" : "M1", "director" : "Dir1", "views" : 2 }  
  
  