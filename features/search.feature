Feature: Search locations

  So that I can find a specific location
  As a individual
  I want to see the location status that I am concerned about

  @wip
  Scenario: One result
    Given a location exists with an associated borough
    When I select a borough
    And I search for the location by address
    Then I should be taken to the location status details page

  Scenario: Multiple results

  Scenario: Zero results with no recommendations

  Scenario: Zero results with recommendations
