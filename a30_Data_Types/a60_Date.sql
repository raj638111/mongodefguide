

-- Date

  - Stored as 64 Bit intergers. Represents milliseconds since Unix epoch (Jan 1 1970)
  - ** Timezone is not stored (IN shell local timezone is displayed)
  
> test = {"x": new Date()}
{ "x" : ISODate("2018-06-11T18:15:30.972Z") }
	
  - ** Always call new Date() instead of Date() (Date() is just a string representation of date)

  

