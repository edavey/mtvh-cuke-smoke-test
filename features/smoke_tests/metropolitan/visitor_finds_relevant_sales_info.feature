@javascript
Feature: Visitor finds relevant sales information
  So that I can connect with the relevant sales team
  As a visitor
  I should be able to find information about home buying

  Background:
    Given I am on the Metropolitan homepage
    Then I should see options to find a home

  Scenario: Visitor finds information about Metropolitan sales
    When I look at information about buying a home
    Then I should see a link to private sales at Metropolitan
    And I should see a link to the Midlands Voluntary Right to Buy Pilot

  Scenario: Visitor finds information about SoResi
    When I look at information about buying a home
    Then I should see a link to shared ownership at SoResi
    And I should see contact details for SoResi
    And I should see a video about SoResi

  # Scenario: Visitor reads COVID 19 Update
  # this is a different feature


