

** Can be done by changing variable `prompt`

-- Add date

> prompt = function() {
...     return (new Date())+"> ";
... };
function () {
    return (new Date())+"> ";
}
Mon Jun 11 2018 15:14:33 GMT-0500 (CDT)>


-- Add current datatabase name

function () {
    if (typeof db == 'undefined') {
        return '(nodb)> ';
    }

    // Check the last db operation
    try {
        db.runCommand({getLastError:1});
    }
    catch (e) {
        print(e);
    }

    return db+"> ";
}
video>

  + PS: getLastError()  can reconnect automatically on writes if the shell gets disconnected
  
  