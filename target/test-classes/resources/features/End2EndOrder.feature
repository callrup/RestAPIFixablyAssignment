@RunEndToEndTest
Feature: Create new order and search order list


 @GetOrderList 
        Scenario Outline: 1:Returns list of Orders
        Given Testing environment
         When I pass headers
          |Content-Type    | multipart/form-data|
        And I set Authorisation token 
        And I pass queryParametres
          |page|<page>|
        And I perform Fetching OrderList based on pagination "<resourceName>"
        Then I should get response "<status>" 
        And response content Type is json
        And response Body contains
          |id|
          
        Examples:
         | scenario                           |status| resourceName |page|
         | Get Order List based on pagination | 200  | GetOrderList | 10 | 




@CreateNewOrder
 Scenario Outline: 1: Creates a new booking in the API
        Given Testing environment
        When I pass headers
          |Content-Type    | multipart/form-data|
        And I set Authorisation token        
        And I perform POST operation "<resourceName>"
        Then I should get response "<status>"
       
        Examples:
        | scenario                |status| resourceName      |jsonFileName     |
        |CreateOrder for Tablet   |200   |PostCreateOrder    |PostCreateBooking|
        |CreateOrder for Tablet   |200   |PostCreateOrder    |PostCreateBooking|
        
        
Scenario Outline: 3: Creates notes associated with the booking Id in the API
        Given Testing environment
        When I pass headers
          |Content-Type    | multipart/form-data|
        And I set Authorisation token      
        And I perform Note Creation operation "<resourceName>"
        Then I should get response "<status>"
       
        Examples:
        | scenario                |status| resourceName        | 
        |Create Note for damaged  |200   |PostCreateNewNote    | 
        |Create Note for diagnosis|200   |PostCreateNewNote    |
        
        
          
          
          @GetOrderBySpecificId
        Scenario Outline: 3)Returns a specific booking based upon the booking id provided
        Given Testing environment
        When I pass headers
          |Content-Type    | multipart/form-data|
        And I set Authorisation token 
        And I perform Order fetching based on specific Id "<resourceName>"
        Then I should get response "<status>" 
        And response content Type is json
        And response Body contains
          |deviceType        |
          |deviceBrand       |
          |id                | 

        Examples:
          |status| resourceName       |id       |
          | 200  | GetSpecificOrder   | 14516   |
          | 200  | GetSpecificOrder   | 14526   |
          
          
          
       
      