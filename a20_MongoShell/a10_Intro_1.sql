
-- Is a fully functional *JavaScript interpreter

-- Command: 
mongo

MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017
MongoDB server version: 3.6.3
Welcome to the MongoDB shell.
For interactive help, type "help".
For more comprehensive documentation, see
  http://docs.mongodb.org/
Questions? Try the support group
  http://groups.google.com/group/mongodb-user
Server has startup warnings:
2018-06-01T09:50:21.045-0500 I CONTROL  [initandlisten]
2018-06-01T09:50:21.045-0500 I CONTROL  [initandlisten] ** WARNING: Access control is not enabled for the database.
2018-06-01T09:50:21.045-0500 I CONTROL  [initandlisten] **          Read and write access to data and configuration is unrestricted.
2018-06-01T09:50:21.045-0500 I CONTROL  [initandlisten]
>

-- Useful shell commands

  + `db` variable
    . Global variable to which a database connection is assigned. By default the client 
      connects to test db
> db
test
    
  + use <db>
    . Switches to a new database
  > use video
  switched to db video
  
  + typeof <variable name>
    . Identify the type of a variable
> typeof db
object  