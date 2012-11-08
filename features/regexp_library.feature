Feature: RegexpLibrary regular expressions
  Scenario Outline: Test matches and failures
    Given The regular expression "<regexp>" in "<submodule>"
    When is matched against "<string>"
    Then it should be "<match?>"
  Scenarios:
      | submodule | regexp | string          | match? |
      | IP        | V4     | 0.0.0.0         | true   |
      | IP        | V4     | 255.255.255.0   | true   |
      | IP        | V4     | 255.255.255.255 | true   |
      | IP        | V4     | 256.255.255.255 | false  |
      | IP        | V4     | 0.1.2.256       | false  |
      | IP        | V4     | 1               | false  |
      | IP        | V4HEX  | ff.ff.ff.ff     | true   |
      | IP        | V4HEX  | 1               | false  |
      | IP        | PORT   | 65535           | true   |
      | IP        | PORT   | 65536           | false  |
      | IP        | PORT   | 65545           | false  |
      | IP        | PORT   | 65635           | false  |
      | IP        | PORT   | 66535           | false  |
      | IP        | PORT   | 75535           | false  |
      | IP        | V6     | ::1             | true   |
      | IP        | V6     | fe80:0000:0000:0000:0204:61ff:fe9d:f156 | true  |
      | IP        | V6     | fe80:0:0:0:0204:61ff:fe9d:f156 | true  |
      | IP        | V6     | fe80::0204:61ff:fe9d:f156 | true  |
      | IP        | V6     | fe80::1::61ff:fe9d:f156 | false  |
      | IP        | V6     | fe80:0:0:0:0204:61ff:254.157.241.86 | true |
      | IP        | V6     | ::ffff:192.168.1.26 | true |
      | IP        | V6     | 2001:0000:1234: 0000:0000:C1C0:ABCD:0876 | false |
      | IP        | V6     | 2001:0db8:1234:: | true |
      | IP        | V6     | : | false |
      | IP        | V6     | :1111::5555 | false |
      | Color     | SHORT  | #123    | true  |
      | Color     | LONG   | #123456 | true  |
      | Color     | SHORT  | #FFF    | true  |
      | Color     | LONG   | #FFFFFF | true  |
      | Color     | SHORT  | #FFFF   | false |
      | Color     | LONG   | #FFFF   | false |
      # We do *not* test RFC822 extensively.
      # You should not use regex to validate email addresses
      | Email     | RFC822 | foo@example.com | true   |
      | Email     | RFC822 | foo+bar@baz.com | true   |

  Scenario Outline: test if a number is a prime with regular expression
    Given an integer <integer>
    Then we determine that it is <prime?> a prime
  Examples:
      | integer | prime? |
      | 1       | not    |
      | 2       |        |
      | 3       |        |
      | 4       | not    |
      | 5       |        |
      | 11      |        |
      | 99      | not    |
      | 1847    |        |

