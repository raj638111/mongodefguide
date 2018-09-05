
-- Querying Arrays
  + *** Can be queried similar to scalars
  
-- Example 1 (Search for the availability of One element)

db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', cities: ['Austin', 'Dallas']},   
  {title: 'movie2', director: 'dir2', cities: ['SFO']}]
db.views.insertMany(data)   

db.views.find({cities: 'Austin'})
{ "_id" : ObjectId("5b8f4662d12e40fd19807fcb"), "title" : "movie1", "director" : "dir1", "cities" : [ "Austin", "Dallas" ] }

-- Example 2 ($all: Search for the availability of Multiple elements)