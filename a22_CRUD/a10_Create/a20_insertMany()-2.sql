
-- Ordering (insertMany())
      
	+ Can be specified as the second parameter
	+ true
	  - Documents are inserted in the same order
	  - Is the default
	  - On error,
      . No document beyond that error is inserted
	+ false
	  - Documents are inserted in random order
	  - This also increases the performance
	  - On error,
	    . Mongo will still attempt to insert all documents
  + Also read,
    - Bulk Write API... in Mongo documentation

-- Example (ordered)
	    
movies = [{_id: '1', title: 'movie1', director: 'dir1'}, 
  {_id: '1', title: 'movie2', director: 'dir2'},
  {_id: '2', title: 'movie3', director: 'dir3'}]	  
db.movies.insertMany(movies, {ordered: true})

	2018-06-13T12:28:42.822-0500 E QUERY    [thread1] BulkWriteError: write error at item 1 in bulk operation :
	BulkWriteError({
	  "writeErrors" : [
	    {
	      "index" : 1,
	      "code" : 11000,
	      "errmsg" : "E11000 duplicate key error collection: video.movies index: _id_ dup key: { : \"1\" }",
	      "op" : {
	        "_id" : "1",
	        "title" : "movie2",
	        "director" : "dir2"
	      }
	    }
	  ],
	  "writeConcernErrors" : [ ],
	  "nInserted" : 1,
	  "nUpserted" : 0,
	  "nMatched" : 0,
	  "nModified" : 0,
	  "nRemoved" : 0,
	  "upserted" : [ ]
	})
	BulkWriteError@src/mongo/shell/bulk_api.js:369:48
	BulkWriteResult/this.toError@src/mongo/shell/bulk_api.js:333:24
	Bulk/this.execute@src/mongo/shell/bulk_api.js:1177:1
	DBCollection.prototype.insertMany@src/mongo/shell/crud_api.js:314:5
	    
> db.movies.find()
{ "_id" : "1", "title" : "movie1", "director" : "dir1" }	  
      
    
-- Example (unordered)      

movies = [{_id: '1', title: 'movie1', director: 'dir1'}, 
  {_id: '1', title: 'movie2', director: 'dir2'},
  {_id: '2', title: 'movie3', director: 'dir3'}]   
  
db.movies.insertMany(movies, {ordered: false})

	2018-06-13T12:33:43.469-0500 E QUERY    [thread1] BulkWriteError: write error at item 1 in bulk operation :
	BulkWriteError({
	  "writeErrors" : [
	    {
	      "index" : 1,
	      "code" : 11000,
	      "errmsg" : "E11000 duplicate key error collection: video.movies index: _id_ dup key: { : \"1\" }",
	      "op" : {
	        "_id" : "1",
	        "title" : "movie2",
	        "director" : "dir2"
	      }
	    }
	  ],
	  "writeConcernErrors" : [ ],
	  "nInserted" : 2,
	  "nUpserted" : 0,
	  "nMatched" : 0,
	  "nModified" : 0,
	  "nRemoved" : 0,
	  "upserted" : [ ]
	})
	BulkWriteError@src/mongo/shell/bulk_api.js:369:48
	BulkWriteResult/this.toError@src/mongo/shell/bulk_api.js:333:24
	Bulk/this.execute@src/mongo/shell/bulk_api.js:1177:1
	DBCollection.prototype.insertMany@src/mongo/shell/crud_api.js:314:5

db.movies.find()

	{ "_id" : "1", "title" : "movie1", "director" : "dir1" }
	{ "_id" : "2", "title" : "movie3", "director" : "dir3" }