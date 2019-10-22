Feature: We need to create testing data each time the server is started

  Background: create request client
    Given the client

  Scenario Outline: create basic users
     Given the name <name>
      And  the email <email>
      When I create a user
      Then the response code is 201
    Examples:
      | name   | email |
      | pepepe | sfsaf@fasf.com |
      | Tanya Selliman | tselliman0@biglobe.ne.jp.test |
      | Killy Simonich | ksimonich1@topsy.com.test |
      | Kris Beedie | kbeedie2@storify.com.test |
      | Selie Davers | sdavers3@ow.ly.test |
      | Misha Spowage | mspowage4@smh.com.au.test |
      | Hurleigh Farthing | hfarthing5@aol.com.test |
      | Adelbert Schieferstein | aschieferstein6@businessweek.com.test |
      | Farrell Espadero | fespadero7@virginia.edu.test |
      | Alec Dacre | adacre8@omniture.com.test |
      | Simeon Scougal | sscougal9@ow.ly.test |

  Scenario Outline: create users with special chars
     Given the name <name>
      And  the email <email>
      When I create a user
      Then the response code is 201
    Examples:
      | name   | email |
      | Jenaro Cantú | sfsaf@fasf.com |
      | Jana Hypšová | tsezl+liman0@biglobe.ne.jp |
      | Olga Šupová | ksimon.ich1@topsy.com.test |
      | Karel Kovář | kbeedie2@storify.com.test |
      | Sun Yü | sdav-ers3@ow.ly.test |
      | 崔忠記 | mspowagfe4@smh.com.au.test |
      | Šaban Lazović | hfart+hing5@aol.com |
      | 熊澤 和也 | aschiefersgtv.ein6@businessweek.com.org |
      | สุพัชรินทร์พร เหล่าฆ้อง | fespadero7@virginia.edu.test |
      | Đinh Tiến Ngộ | adacre8@omnitfakeure.com.test |
      | Nafi' Abdul-Waliy Srour | ssc.oug.al9@ow.ly.test |

  Scenario Outline: create users with middle name and two last name
     Given the name <name>
      And  the email <email>
      When I create a user
      Then the response code is 201
    Examples:
      | name   | email |
      | Claudelle Méng Leroy Shackleford | cjaquet0@cocolog-nifty.com.lan |
      | Marieann Laurène Garrood Krikorian | pshelper1@kickstarter.com |
      | Kristoforo Edmée Chessell Houldin | atomaszkiewicz2@geocities.jp.lan |
      | Shae Maïlis Eddins Klassman | choyte3@usnews.com                 |
      | Shanna Maëlann Rowling Godsal | gcuttler4@163.com.lan                |
      | Falito Anaëlle Capnerhurst Duling | clivingston5@artisteer.com   |
      | Marnie Laïla Simonett Domino | adesremedios6@gmpg.org.lan            |
      | Isidore Maéna Hurlin Balogh | rgozzard7@ebay.com.lan                 |
      | Janenna Frédérique Kilroy Koche | ehartley8@googlcreate_users.featuree.ca            |
      | Marilee Régine Loweth Bale | ajohnsey9@smugmug.com               |
      | Daron Mélissandre McArley Linacre | crippena@cpanel.net          |