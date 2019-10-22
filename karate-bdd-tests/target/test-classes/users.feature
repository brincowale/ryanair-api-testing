Feature: greeting end-point

  Background:
    * url 'http://127.0.0.1:8900'

  Scenario Outline: get custom user
    Given path '/user'
    And param id = get[0] user_list[*][?(@.name=='<name>')].id
    When method get
    Then status 200
    And match response.email == '<email>'

    Examples:
      | name | email |
      | Selie Davers | sdavers3@ow.ly.test |
      | Farrell Espadero | fespadero7@virginia.edu.test |
      | Shae Maïlis Eddins Klassman | choyte3@usnews.com |


  Scenario Outline: get custom user return an error
    Given path '/user'
    And param id = '<id>'
    When method get
    Then status 404

    Examples:
      | id                |
      | 1884222348494705 |
      | ñ´4e57ñb$%·UB$·%y |
      | @#~€¬9€~# |
      | union select * from users; |
      | fespadero7@virginia.edu.testfespadero7@virginia.edu.testfespadero7@virginia.edu.testfespadero7@virginia.edu.testfespadero7@virginia.edu.testfespadero7@virginia.edu.testfespadero7@virginia.edu.test |


  Scenario Outline: get custom user with booking
    Given path '/user'
    And param id = get[0] user_list[*][?(@.name=='<name>')].id
    When method get
    Then status 200
    * def data =
    """
    {
      'id':#string,
      "email":#regex^[\w.-]+@(?=[a-z\d][^.]*\.)[a-z\d.-]*[^.]$,
      'name':<name>,
      'bookings':
        [{
          'idBooking': '#regex ^([A-Z]{3}-){2}0\\.\\d{10,}$',
          'idUser': '#regex ^[\\w.-]+@(?=[a-z\\d][^.]*\\.)[a-z\\d.-]*[^.]-0\\.\\d{10,}$',
          'origin': '#regex ^[A-Z]{3}$',
          'destination': '#regex ^[A-Z]{3}$',
          'date': '#regex ^(2\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))$'
        }]
    }
    """
    And match response.email == '<email>'
    And match response.bookings[0].date == '<date>'
    And match response == data

    Examples:
      | name | email | date |
      | Hurleigh Farthing | hfarthing5@aol.com.test | 2019-02-17 |
      | Farrell Espadero | fespadero7@virginia.edu.test | 2019-10-19 |
