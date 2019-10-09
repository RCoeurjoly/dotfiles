Feature: org
  I press C + RET.
  A new heading is created

  Background:
    Given I am in buffer "new_heading.org"
    And the buffer is empty

  Scenario: Create new heading
    When I press "C-return"
    And I type "New heading"
    Then I should see:
    """
    * New heading
    """
