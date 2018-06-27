

--  Use '~/.mongorc.js'

  var no = function() {    print("Not on my watch.");};

  + Prevent dropping databases (** Change both db variable and DB prototype)  
    - db.dropDatabase = DB.prototype.dropDatabase = no;
    
  + Prevent dropping collections
    - DBCollection.prototype.drop = no;
    
  + Prevent dropping indexes
    - DBCollection.prototype.dropIndex = no;
    
    
-- Disable init script (ie ~/.mongorc.js)

  + mongo --norc      

    