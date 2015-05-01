Feature: Registration
  As a website visitor
  I can register
  In order to use services on this website

  Scenario: Visit homepage
    Given I am on homepage
    Then I should see "This is banner1"
	And I should see "Upcoming events"
	And I should see "Site sections"

  @ID-88281762
  Scenario: Check the verify email address not comes from unknown sender
    Given I am not logged in
	When I go to "/registration-page/"
	And I fill in "First Name" with "John"
	And I fill in "Surname" with "Smith"
	And I fill in "Email" with "john.smith@test.com"
	And I fill in "Phone" with "0211234567"
	And I fill in "Password" with "Passw0rd"
	And I fill in "Confirm Password" with "Passw0rd"
	And I press "Register"
    Then I should see "Thank you for Registering"
	And there should be an email from "no-reply@loveyourwater.org" titled "Your Love Your Water account verification, nearly done!"