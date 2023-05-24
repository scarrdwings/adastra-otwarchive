Feature: Various things on the homepage

  Scenario: Logged out

  When I am on the homepage
  Then I should see "A fan-created, fan-run, nonprofit, noncommercial archive for transformative fanworks, like fanfiction, fanart, fan videos, and podfic in the Star Trek fandom"

  Scenario: Diversity statement

  Given I am on the homepage
  When I follow "Diversity Statement"
  Then I should see "You are welcome at Ad Astra."

  Scenario: DMCA

  Given I am on the homepage
  When I follow "DMCA Policy"
  Then I should see "safe harbor"

  Scenario: Donate

  Given I am on the homepage
  When I follow "Site Map"
    And I follow "Kindness"
  Then I should see "There are two main ways to support Ad Astra - collaborate and be kind"
    And I should see the page title "Kindness"
