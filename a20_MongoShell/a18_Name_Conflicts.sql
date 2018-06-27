
-- Collection name conflict

> db.version()
3.6.3

db.getCollection("version");


-- Array access syntax to access subcollection

	+ Example 1
	
var collections = ["posts", "comments", "authors"];
for (var i in collections) {
    print(db.blog[collections[i]]);
}

instead of,

print(db.blog.posts);
print(db.blog.comments);
print(db.blog.authors);

  + Example 2 (Awkwardly named collection)
  
 var name = "@#&!"
 db[name].find()
  
  
  


