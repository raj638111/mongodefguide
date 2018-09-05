
-- Collection name conflict

> db.version()
3.6.3

> db
test
> db.getCollection("version");
test.version

