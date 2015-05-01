Feature: Event
  As a website visitor
  I can create events
  In order to publish events to public

  @ID-85736762
  Scenario: Check I can submit an event in forntend without any errors
    Given I am on homepage
	When I follow "Log In"
	And I fill in "Email" with "admin"
	And I fill in "Password" with "password"
	And I press "Log in"
    When I go to "/event-create-page/"
	Then I should see "You can create events here"
	When I fill in "Title" with "test event1"
	And I fill in "Enter start date" with "May 1, 2015"
	And I fill in "Enter start time" with "9:00"
	And I fill in "Enter end date" with "May 1, 2015"
	And I fill in "Enter end time" with "13:00"
	And I select "Wellington" from "Region"
	And I fill in "Details" with "This is test event1 details"
	And I press "Create"
    Then I should see "Calendar page"
	And I should see "1 May, 2015 test event1 9:00am - 1:00pm This is test event1 details"
	And I should not see "Error"
	When I follow "List View"
	Then I should see a link "test event1"

  @ID-85737798
  Scenario: Check the error message for invalid events input
    Given I am on homepage
	When I follow "Log In"
	And I fill in "Email" with "admin"
	And I fill in "Password" with "password"
	And I press "Log in"
    When I go to "/event-create-page/"
	Then I should see "You can create events here"
	When I press "Create"
	When I fill in "Title" with "test event1"
	And I press "Create"
    Then I should see "\"Start\" is required"
	When I click on the field "Enter start date"
	And I follow "12"
	And I press "Create"
    Then I should see "\"End\" is required"
	When I click on the field "Enter end date"
	And I follow "11"
	And I press "Create"
    Then I should see "Please review your dates! The end date must be after the start date"
	When I fill in "Title" with "test event1"
	And I fill in "Enter start date" with "May 2, 2015"
	And I fill in "Enter start time" with "9:00"
	And I fill in "Enter end date" with "May 10, 2015"
	And I fill in "Enter end time" with "13:00"
	And I fill in "Details" with "This is test event1 details"
	And I press "Create"
    Then I should see "Calendar page"
	And I should see "test event1"