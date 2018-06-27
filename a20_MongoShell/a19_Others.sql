

-- Edit complex variables using external editor

  EDITOR="/usr/bin/emacs"
  var wap = db.books.findOne({title: "War and Peace"})
  edit wap
  
  + Can also be added to ~/.mongorc.js
  

