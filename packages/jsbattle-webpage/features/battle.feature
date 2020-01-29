Feature: Battle
  Simulates battles of tanks

  @smoke
  @integration
  Scenario: Play the battle
    Given JsBattle open in the browser
    And tanks [jamro, dummy] selected for the battle
    And "Battlefield" section open
    And battle quality set to "0"
    And battle speed set to "50"
    When press play battle button
    And battle view is displayed
    And battle is completed
    Then the winner tank is "Jamro"
    And tanks leaderboard is [jamro, dummy]

  Scenario: Exit in middle of battle
    Given JsBattle open in the browser
    And tanks [dummy, jamro] selected for the battle
    And "Battlefield" section open
    When press play battle button
    And battle view is displayed
    And press exit battle
    Then battle is not displayed
    And "Battlefield" section is selected in the navigation bar

  @integration
  Scenario: Generate share link
    Given JsBattle open in the browser
    And tanks [dummy, jamro] selected for the battle
    And "Battlefield" section open
    And battle quality set to "0"
    And battle speed set to "50"
    When press play battle button
    And battle view is displayed
    And battle is completed
    And click share battle
    Then share link contains replay URL

  Scenario: Replay from share link
    Given JsBattle replay for battle "12345678-1234-1234-1234-123456789012" open in the browser
    And battle view is displayed
    And battle quality set to "0"
    And battle speed set to "50"
    And battle is completed
    Then the winner tank is "Jamro"
    And tank "jamro #3" score is 232.4
    And tank "dodge #1" score is 84.16
    And tank "sniper #2" score is 18.60
