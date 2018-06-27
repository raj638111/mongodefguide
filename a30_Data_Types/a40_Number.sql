

-- Floating Point numbers 

  - Mongo shell defaults to 64 Bit floating point numbers

> test = {"x": 3.14}
{ "x" : 3.14 }
>
> test = {"x": 3}
{ "x" : 3 }


-- Signed Integers

  - Use 'NumberInt'(4 Byte) or 'NumberLong'(8 Byte) classes
  
> test = {"x": NumberInt(3)}
{ "x" : NumberInt(3) }
>
> test = {"x": NumberLong(3)}
{ "x" : NumberLong(3) }  
  