Feature: autocomplete
  I enter a python buffer.
  I include re.
  The functions should autocomplete

  Background:
    Given I load the following:
    """
    (load "~/dotfiles/spacemacs/.spacemacs.d/init.el")
    """
    And I am in buffer "autocomplete.py"
    And the buffer is empty
    And I insert
    """
    import re
    """

  Scenario: autocomplete funcion
    When I place the cursor after "import re"
    And I turn on python-mode
    And I start an action chain
    And I press "RET"
    And I type "match = re.de"
    And I press "RET"
    And I execute the action chain
    Then I should see:
    """
    import re
    match = re.DEBUG
    """
