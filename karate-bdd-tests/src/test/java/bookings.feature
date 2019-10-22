Feature: test the booking endpoint

  Background:
    * url 'http://127.0.0.1:8900'

  Scenario Outline: get booking by id
    Given path '/booking'
    And param id = '<id>'
    And param date = <date>
    When method get
    Then status <http_code>

    Examples:
    | id                      | date         | http_code |
    | hfarthing5@aol.com.test | '2019-32-17' | 500       |
    | gsdfgsdgdg@gsdfgf.com   | ''           | 200       |
