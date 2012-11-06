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
      | IP        | PORT   | 65535           | true   |
      | IP        | PORT   | 65536           | false  |
      | IP        | PORT   | 65545           | false  |
      | IP        | PORT   | 65635           | false  |
      | IP        | PORT   | 66535           | false  |
      | IP        | PORT   | 75535           | false  |

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

