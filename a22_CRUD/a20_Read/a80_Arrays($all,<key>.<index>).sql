
-- Querying Arrays
  + Can be queried similar to scalars
  
-- Example 1 (Search for the availability of One element)

db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', cities: ['Austin', 'Dallas']},   
  {title: 'movie2', director: 'dir2', cities: ['SFO']}]
db.views.insertMany(data)   

db.views.find({cities: 'Austin'})
{ "_id" : ObjectId("5b8f4662d12e40fd19807fcb"), "title" : "movie1", "director" : "dir1", "cities" : [ "Austin", "Dallas" ] }

-- Example 2 ($all: Search for the availability of Multiple elements)

db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', cities: ['Austin', 'Dallas']},   
  {title: 'movie2', director: 'dir2', cities: ['Austin', 'SFO']},
  {title: 'movie2', director: 'dir2', cities: ['Austin', 'Dallas', 'SFO']}]
db.views.insertMany(data)

db.views.find({cities: {$all: ['Austin', 'SFO']}})
{ "_id" : ObjectId("5b9087242e864198668e91e4"), "title" : "movie2", "director" : "dir2", "cities" : [ "Austin", "SFO" ] }
{ "_id" : ObjectId("5b9087242e864198668e91e5"), "title" : "movie2", "director" : "dir2", "cities" : [ "Austin", "Dallas", "SFO" ] }

** Note here order of elements do not matter

-- Example 3: Get same no of elements in exact order

db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', cities: ['Austin', 'Dallas', 'DC']},   
  {title: 'movie2', director: 'dir2', cities: ['Austin', 'SFO']},
  {title: 'movie2', director: 'dir2', cities: ['Dallas', 'SFO']}]
db.views.insertMany(data)
db.views.find({cities: ['Austin', 'Dallas']})
[Empty]
db.views.find({cities: ['Austin', 'Dallas', 'DC']})
{ "_id" : ObjectId("5b9087c12e864198668e91e6"), "title" : "movie1", "director" : "dir1", "cities" : [ "Austin", "Dallas", "DC" ] }

-- Example 4: Query by array index

db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', cities: ['Austin', 'Dallas', 'DC']},   
  {title: 'movie2', director: 'dir2', cities: ['Austin', 'SFO']},
  {title: 'movie2', director: 'dir2', cities: ['Dallas', 'SFO']}]
db.views.insertMany(data)  
db.views.find({'cities.1': 'Dallas'})
{ "_id" : ObjectId("5b9088992e864198668e91e9"), "title" : "movie1", "director" : "dir1", "cities" : [ "Austin", "Dallas", "DC" ] }


  
  


