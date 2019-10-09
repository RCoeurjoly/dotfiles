Feature: init
  I insert the letter a in an empty buffer.
  I expect to see only the letter a

  Background:
    Given I am in buffer "*insert-letter*"
    And the buffer is empty
    And I insert "a"

  Scenario: Basic test
    Then I should see:
    """
    a
    """
