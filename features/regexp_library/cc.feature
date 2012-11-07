Feature: RegexpLibrary::CC::Validator constants
  Scenario Outline: #valid? identifies valid CC numbers
    Given the validator <validator>
    When <cc_num> is given
    Then it returns <result>
  Scenarios:
    # numbers taken from
    # http://www.rimmkaufman.com/blog/credit-card-test-numbers/09112007/
      | validator            | cc_num              | result  |
      | AmericanExpress      | 378282246310005     | true    |
      | AmericanExpress      | 371449635398431     | true    |
      | AmericanExpress      | 378734493671000     | true    |
      | CarteBlanche         | 30569309025904      | true    |
      | Discover             | 6011111111111117    | true    |
      | Discover             | 6011000990139424    | true    |
      | JCB                  | 3530111333300000    | true    |
      | JCB                  | 3566002020360505    | true    |
      | MasterCard           | 5555555555554444    | true    |
      | MasterCard           | 5105105105105100    | true    |
      | Visa                 | 4111111111111111    | true    |
      | Visa                 | 4012888888881881    | true    |
      | Visa                 | 4222222222222       | true    |
      # variations on the above
      | AmericanExpress      | 388282246310005     | false   |
      | AmericanExpress      | 361449635398431     | false   |
      | AmericanExpress      | 388734493671000     | false   |
      | CarteBlanche         | 30662309025904      | false   |
      | Discover             | 6221111111111117    | false   |
      | Discover             | 6225000990139424    | false   |
      | JCB                  | 3533111333300000    | false   |
      | JCB                  | 3562302020360505    | false   |
      | MasterCard           | 5625555555554444    | false   |
      | MasterCard           | 5005105105105100    | false   |
      | Visa                 | 4211111111111111    | false   |
      | Visa                 | 40128888888818      | false   |
      | Visa                 | 4222222222223       | false   |
