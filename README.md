# Ryanair API testing
This project is intended for API testing in a localhost server. The server isn't attached to the project.

## Creating a dataset
As the server doesn't contain enough data for testing purposes, we need to insert before it.
For the random data I used the [Mockaroo](https://www.mockaroo.com/) website that allow a 
custom dataset creation. Due to it's not possible to add the data directly into the database, 
I used the POST endpoints to input one by one each user and booking.

The dataset has been inserted using Python 3.7, [requests](https://requests.kennethreitz.org/en/master/) 
for sending HTTP requests and [behave](https://github.com/behave/behave) for the BDD framework.

## Running the dataset
Before running the Karate tests, the testing data should inserted. 

From the main folder `ryanair-api-testing\behave-insert-data` with a terminal opened, the following command should be executed  
1. `behave features/create_users.feature`
1. `behave features/add_bookings_to_users.feature`
1. `behave features/not_create_users.feature`

## Creating the tests
For the tests I tried to implement as many options that I could using [Karate Framework](https://github.com/intuit/karate). Due to the no restriction on the endpoints, the tests that can be created are limited.

The `karate-config.js` file contain two configurations for the project.  
1. Use Fiddler as proxy to debug bad HTTP requests  
1. Use the `callSingle` feature to call the endpoint `/user/all` only the first time. This endpoint is used to get the users `id`  

## Running the tests
Once the data is inserted, the automatic tests are ready to be executed.

The following features should be executed  
1. `users.feature`
1. `bookings.feature`

# Problems and workarounds

**Problem**: The user ID o booking ID is generated randomly and not shared between the 2 feature files
**Solution**: Use the endpoint `/user/all` and iterate the response to get the specified ID

**Problem**: The same user or booking can be created twice or more  
**Solution**: Use the duplicated users to create a test that not duplicates are created

**Endpoints**:  
The endpoints aren't reliable in terms of constraints. This means that the tests implemented are quite basic
- GET /booking: accept any `id` as long isn't empty. The field date may be empty or a valid date
- POST /booking: accept any duplicated user, because the `id` is generated randomly. Destination and origin can be the same airport
- POST /user: accept any duplicated user (same email), as same as before
