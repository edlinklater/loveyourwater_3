Feature: Registration
  As a website visitor
  I can register
  In order to use services on this website

  Scenario: Visit homepage
    Given I am on homepage
    Then I should see "This is banner1"
	And I should see "Upcoming events"
	And I should see "Site sections"