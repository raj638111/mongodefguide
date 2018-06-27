
-- Get help  
  
> help
  db.help()                    help on db methods
  db.mycoll.help()             help on collection methods
  sh.help()                    sharding helpers
  ...
  
  
-- Get help for db
  
> db.help()
DB methods:
  db.adminCommand(nameOrDocument) - switches to 'admin' db, and runs command [just calls db.runCommand(...)]
  db.aggregate([pipeline], {options}) - performs a collectionless aggregation on this database; returns a cursor
  db.auth(username, password)
  
-- Get help for collection

> db.foo.help()
DBCollection help
  db.foo.find().help() - show DBCursor help
  db.foo.bulkWrite( operations, <optional params> )
  ...
  
-- Get function source
  + Type without paranthesis
  
> db.foo.updateOne
function (filter, update, options) {
    var opts = Object.extend({}, options || {});