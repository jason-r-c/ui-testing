#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
@tag
Feature: Unpause the system feature
  This will test the unpausing of the system in the local office dashboard

	@tag1
	Scenario: Navigate to the home screen
  	Given I navigate to iotaa home  
  	And I then enter the username as bristol.office and password as password
  	And I click on iotaa login button
  	Then I should see the iotaa home
  	
  @tag3
  Scenario: Unpause the system scenario
  	And I then click on Admin tasks
  	And I then click on Manage Hub State
  	And I then click on John Jenkins
  	And I then select Unpause Hub
  	And I then check unpaused status on the dashboard
  	

   