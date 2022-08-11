Tests cases : 
Product :
1 # is elastic indexing working fine?
Steps:
    1- Add product
    2- Search the same product with name and description must result actual value
Result : Fail

2 # removed record should not be available in the result?
Steps:
    1- Remove a record
    2- Test the record is not available
Result : Pass
    
3 # Create purchase order should trigger email to admin?
Steps :
    1- Make purchase order
    2- Receive email    

4 # Start app firsttime and search for some product
    1- start app with fresh database
    2- Register user
    3- Search for product
Result : Pass