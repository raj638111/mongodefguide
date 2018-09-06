
-- $slice
  + Can be used to extract subset of an array

-- Data
  
db.views.deleteMany({})
data = [{title: 'movie1', director: 'dir1', cities: ['Austin', 'Dallas', 'DC']},   
  {title: 'movie2', director: 'dir2', cities: ['Austin', 'SFO']},
  {title: 'movie2', director: 'dir2', cities: ['Dallas', 'SFO']}]
db.views.insertMany(data)

-- Return first 2 elements
db.views.find({cities: {$all: ['Austin', 'Dallas']}},
  {cities: {$slice: 2}})
{ "_id" : ObjectId("5b908e092e864198668e91f4"), "title" : "movie1", "director" : "dir1", "cities" : [ "Austin", "Dallas" ] }

-- Return last 2 elements
db.views.find({cities: {$all: ['Austin', 'Dallas']}},
  {cities: {$slice: -2}})
{ "_id" : ObjectId("5b908e092e864198668e91f4"), "title" : "movie1", "director" : "dir1", "cities" : [ "Dallas", "DC" ] }

-- Return N element from the offset

db.views.find({cities: {$all: ['Austin', 'Dallas']}},
  {cities: {$slice: [0, 2]}})
{ "_id" : ObjectId("5b908e092e864198668e91f4"), "title" : "movie1", "director" : "dir1", "cities" : [ "Austin", "Dallas" ] }

*** Note: As we have seen earlier 2nd argument to find is used to select specific keys
          to be returned. But when using $slice, unless other the fields are specified,
          all the keys are returned as seen in the above example
          
          
-- Return N element from the offset. But only return specific keys          

Note: In this case we are returning `title`(as specified by flag `1`) & `cities`
db.views.find({cities: {$all: ['Austin', 'Dallas']}},
  {title: 1, cities: {$slice: [0, 2]}})          
{ "_id" : ObjectId("5b908e092e864198668e91f4"), "title" : "movie1", "cities" : [ "Austin", "Dallas" ] }          

