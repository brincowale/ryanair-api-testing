Feature: We need to create testing data each time the server is started

  Background: create request client
    Given the client bookings

  Scenario Outline: add booking to an user
     Given the user id from the <email>
      And  the flight date <date>
      And  the departure airport <from>
      And  the arrival airport <to>
      When I add the booking
      Then the response code is 201
    Examples:
    | date | email                                 | from | to |
    | 2020-10-10 | sfsaf@fasf.com                        | BCN | MAD |
    | 2018-10-10 | tselliman0@biglobe.ne.jp.test         | NRT | CDG |
    | 2019-12-04 | ksimonich1@topsy.com.test             | STN | FCO |
    | 2019-03-30 | kbeedie2@storify.com.test             | LTN | BIO |
    | 2020-02-04 | sdavers3@ow.ly.test                   | VLC | ART |
    | 2019-10-09 | mspowage4@smh.com.au.test             | APA | APW |
    | 2019-02-17 | hfarthing5@aol.com.test               | CTG | FLN |
    | 2019-07-27 | aschieferstein6@businessweek.com.test | DUB | GRO |
    | 2019-10-19 | fespadero7@virginia.edu.test          | HOV | KOA |
    | 2019-04-30 | adacre8@omniture.com.test             | BCB | ANR |
    | 2019-11-10 | sscougal9@ow.ly.test                  | DLA | SSF |
