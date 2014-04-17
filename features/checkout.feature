Feature: Checkout process

  After the adopter has selected the puppy to adopt and
  any additional products they are required to enter
  some information that is necessary to complete the
  adoption.

  Background:
    Given I want to adopt puppies

  Scenario: Name is required when checking out
    When I attempt to checkout without a name
    Then I should see the error message "Name can't be blank"

  # We need the address so we can deliver the puppy
  Scenario: Address is required when checking out
    When I attempt to checkout without an address
    Then I should see the error message "Address can't be blank"

  Scenario: Adopter should be prompted with valid payment options
    When I am checking out
    Then I should be prompted with the following payment options:
      | option         |
      | Credit card    |
      | Purchase order |
      | Check          |

  Scenario: Thank you message should be displayed when adoption complete
    When I complete the adoption of a puppy
    Then I should see the message "Thank you for adopting a puppy!"

