

-- Execute scripts using the shell & exit

mongo script1.js script2.js
  + Note
    - Script have access to all global variables of the shell 
      . Example: 'db' variable

-- Execute script inside the shell

  + load("<script name>")
  

-- Connect to a different Host & execute script


mongo --quiet hostname:port/db script1.js script2.js

  + --quite helps when we want to pipe the output of the scripts to another command
  
-- JavaScript equivalent for shell commands

  + use video         db.getSisterDB("video")
  + show dbs          db.getMongo().getDBs()
  + show collections  db.getCollectionNames()
  
-- Variable injection from Script to Shell

    + Is useful when we want to initalize the shell with some useful functions
    + Example
    
// example.js
var connectTo = function(port, db){...}
load('example.js')
