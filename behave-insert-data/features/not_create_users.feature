Feature: example feature to check that the user should not be created

  Background: create request client
    Given the client

  Scenario Outline: create basic users
     Given the name <name>
      And  the email <email>
      When I create a user
      Then the response code is 500
    Examples:
      | name   | email |
      | flightrr | test-err    |
      | QA       | helloemail |

  Scenario Outline: create a duplicated user generate another id (just because the server allow it)
     Given the name <name>
      And  the email <email>
      When I create a user
      Then the response code is 201
      And the user id is valid
    Examples:
      | name   | email |
      | pilot1 | pilot1@flight.com |
      | pilot1 | pilot1@flight.com |
      | pilot2 | pilot1@flight.com |
      | N0t @ pilot | pilot1@flight.com |
