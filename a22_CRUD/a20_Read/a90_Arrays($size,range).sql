
-- Example 1: $size

db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', cities: ['Austin', 'Dallas', 'DC']},   
  {title: 'movie2', director: 'dir2', cities: ['Austin', 'SFO']},
  {title: 'movie2', director: 'dir2', cities: ['Dallas', 'SFO']}]
db.views.insertMany(data)  
db.views.find({cities: {$size: 3}})  
{ "_id" : ObjectId("5b9089602e864198668e91ec"), "title" : "movie1", "director" : "dir1", "cities" : [ "Austin", "Dallas", "DC" ] }

-- Example 2: Checking range of sizes (ie example: size > 0 & size <= 3)

** Note: 
  + Conditionals like $lt & $gt cannot be used on top of $size
  + Can be achived by adding a separate key for size and incrementing it every time we add element to array
  + Incrementing is extremely fast
  
db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', cities: ['Austin', 'Dallas', 'DC'], sz: 3},   
  {title: 'movie2', director: 'dir2', cities: ['Austin', 'SFO'], sz: 2}]
db.views.insertMany(data)  
db.views.update({}, {$push: {cities: 'LA'}, $inc: {sz: 1}})  
db.views.find({})         
{ "_id" : ObjectId("5b908cab2e864198668e91f2"), "title" : "movie1", "director" : "dir1", "cities" : [ "Austin", "Dallas", "DC", "LA" ], "sz" : 4 }
{ "_id" : ObjectId("5b908cab2e864198668e91f3"), "title" : "movie2", "director" : "dir2", "cities" : [ "Austin", "SFO" ], "sz" : 2 }

db.views.find({sz: {$gt: 3}})
{ "_id" : ObjectId("5b908cab2e864198668e91f2"), "title" : "movie1", "director" : "dir1", "cities" : [ "Austin", "Dallas", "DC", "LA" ], "sz" : 4 }



         







