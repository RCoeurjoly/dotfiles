Feature: autocomplete
  I enter a python buffer.
  I include re.
  The functions should autocomplete

  Background:
    Given I am in buffer "autocomplete.py"
    And the buffer is empty
    And I insert
    """
    import re
    match = re
    """

  Scenario: autocomplete funcion
    When I place the cursor after "match = re"
    And I type ".de"
    And I press "RET"
    Then I should see:
    """
    import re
    match = re.DEBUG
    """
