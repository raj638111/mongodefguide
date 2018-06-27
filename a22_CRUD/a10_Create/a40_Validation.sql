
-- Insert Validation provided by MongoDB

  + Document size must be smaller than 16 MB
  
  + Check document size
  
> movies = [{_id: '1', title: 'movie1', director: 'dir1'},  
{_id: '1', title: 'movie2', director: 'dir2'},   
{_id: '2', title: 'movie3', director: 'dir3'}]

> Object.bsonsize(movies)
173  


-- Drivers
  
  + Most of the drivers provide additional validation before sending the data to MongoDB
  + Example
    . Large document size
    . Check for Non UTF strings
    . Unrecognized Types