
--  replaceOne()

  + Replaces a matching document with a new one
  + 1st arg: Search filter
    2nd arg: The document that will be replaced
  
  + Best Practice
	  - Use _id as the search criteria in replaceOne
	  - Note 
	    . **Using _id is also efficient, as they form the basis of primary index of a column
  
    
-- Example

db.movies.deleteMany({})
db.movies.insertOne({name: 'm1', dir: 'd1', country: 'US'})
doc = db.movies.findOne() // *Note: db.movies.find() do not give the right result
> doc.name
m1
// Create a sub document
doc.meta = {dir: doc.dir, country: doc.dir}
> delete doc.dir
true
> delete doc.country
true
> doc
{
  "_id" : ObjectId("5b23ae70b8cb2081929c2fbe"),
  "name" : "m1",
  "meta" : {
    "dir" : "d1",
    "country" : "d1"
  }
}
> db.movies.replaceOne({name: 'm1'}, doc)
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
> db.movies.find()
{ "_id" : ObjectId("5b23ae70b8cb2081929c2fbe"), "name" : "m1", "meta" : { "dir" : "d1", "country" : "d1" } }

----------------------
-- id conflict
----------------------

-- Problem

> db.movies.deleteMany({})
> db.movies.insertMany([{name: 'm1', dir: 'd1', country: 'US'},
{name: 'm2', dir: 'd1', country: 'US'}])
{
  "acknowledged" : true,
  "insertedIds" : [
    ObjectId("5b23b109b8cb2081929c2fbf"),
    ObjectId("5b23b109b8cb2081929c2fc0")
  ]
}
doc = db.movies.findOne({name: 'm2'})
doc.meta = {dir: doc.dir, country: doc.dir}
delete doc.dir
delete doc.country
> doc
{
  "_id" : ObjectId("5b23b3bdb8cb2081929c2fc4"),
  "name" : "m2",
  "meta" : {
    "dir" : "d1",
    "country" : "d1"
  }
}
> db.movies.replaceOne({dir: 'd1'}, doc) -- This is because 'd1' matches 2 documents. Mongo is trying to update the
                                         -- first document(we actually want to upate the second document) which has 
                                         -- different _id than the _id in variable 'doc' 
2018-06-15T07:31:41.823-0500 E QUERY    [thread1] WriteError: After applying the update, the (immutable) field '_id' was found to have been altered to _id: ObjectId('5b23b109b8cb2081929c2fc0') :
WriteError({
  "index" : 0,
  "code" : 66,
  "errmsg" : "After applying the update, the (immutable) field '_id' was found to have been altered to _id: ObjectId('5b23b109b8cb2081929c2fc0')",
  "op" : {
    "q" : {
      "dir" : "d1"
    },
    "u" : {
      "_id" : ObjectId("5b23b109b8cb2081929c2fc0"),
      "name" : "m2",
      "dir" : "d1",
      "country" : "US",
      "meta" : {
        "dir" : "d1",
        "country" : "d1"
      }
    },
    "multi" : false,
    "upsert" : false
  }
})
WriteError@src/mongo/shell/bulk_api.js:466:48
Bulk/mergeBatchResults@src/mongo/shell/bulk_api.js:846:49
Bulk/executeBatch@src/mongo/shell/bulk_api.js:910:13
Bulk/this.execute@src/mongo/shell/bulk_api.js:1154:21
DBCollection.prototype.replaceOne@src/mongo/shell/crud_api.js:489:17
@(shell):1:1

-- Solution

  + Use _id as the search criteria
  
> db.movies.replaceOne({_id: doc._id}, doc)
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
> db.movies.find()
{ "_id" : ObjectId("5b23b3bdb8cb2081929c2fc3"), "name" : "m1", "dir" : "d1", "country" : "US" }
{ "_id" : ObjectId("5b23b3bdb8cb2081929c2fc4"), "name" : "m2", "meta" : { "dir" : "d1", "country" : "d1" } }




