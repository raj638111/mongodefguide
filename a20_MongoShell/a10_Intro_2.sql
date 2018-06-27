
-- Connect to a remote database

	+ hostname:port/database

mongo some-host:30000/myDB

-- Do not connect to any database

mongo --nodb

-- Connect from inside shell

  conn = new Mongo("some-host:30000")
  db = conn.getDB("myDB")
  
-- Run command lines programs inside the shell

  + use `run()` command 
2018-06-11T14:49:31.463-0500 I -        [thread1] shell: started program (sh23982):  /bin/ls -l
sh23982| total 104
sh23982| -rw-------  1 rgunasekaran  WVRGROUP\Domain Users    403 Feb 14  2017 authorized_keys
sh23982| -rw-r--r--  1 rgunasekaran  WVRGROUP\Domain Users    301 Sep 20  2017 config  
  
  
  
