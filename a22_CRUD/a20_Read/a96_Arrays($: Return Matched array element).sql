
-- $

  + `$` can be used to return only Matched array element. Unmatched array element sare not returned
  
-- Data

db.views.deleteMany({})
data = [
  {title: 'movie1', director: 'dir1', address: [{city: 'Austin', zip: 78721}, {city: 'Dallas', zip: 75001}]},
  {title: 'movie1', director: 'dir1', address: [{city: 'SFO', zip: 94016}, {city: 'Austin', zip: 78733}]}
  ]
db.views.insertMany(data)  

-- Return only matched array element
 (Here we are returning only elements which has `address.city` as `Austin`) 

db.views.find({'address.city': 'Austin'}, {'address.$': 1})
{ "_id" : ObjectId("5b90939a2e864198668e91fa"), "address" : [ { "city" : "Austin", "zip" : 78721 } ] }
{ "_id" : ObjectId("5b90939a2e864198668e91fb"), "address" : [ { "city" : "Austin", "zip" : 78733 } ] }

-- Return both matched & unmatched array element

db.views.find({'address.city': 'Austin'})
{ "_id" : ObjectId("5b90939a2e864198668e91fa"), "title" : "movie1", "director" : "dir1", "address" : [ { "city" : "Austin", "zip" : 78721 }, { "city" : "Dallas", "zip" : 75001 } ] }
{ "_id" : ObjectId("5b90939a2e864198668e91fb"), "title" : "movie1", "director" : "dir1", "address" : [ { "city" : "SFO", "zip" : 94016 }, { "city" : "Austin", "zip" : 78733 } ] }
