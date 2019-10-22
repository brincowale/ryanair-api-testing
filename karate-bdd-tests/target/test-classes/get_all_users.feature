Feature: greeting end-point

  Background:
    * url 'http://127.0.0.1:8900'

  Scenario:  get all users
    Given path '/user/all'
    When method get
    Then status 200
    And match response[*] contains {'id':#string,"email":#string,'name':#string,'bookings':#ignore}
    * def user_list = response