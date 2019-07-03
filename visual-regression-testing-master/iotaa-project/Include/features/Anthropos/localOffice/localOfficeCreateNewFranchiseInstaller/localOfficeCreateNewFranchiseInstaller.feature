#Author: chris.covell@anthropos.io
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

Feature: Create a new Franchise Installer
  Check that we can create a new Franchise Installer
  
  Scenario: Login to the Local Office
    Given login to Local Office as bristol.office using onetwothree
    
  Scenario: Select a new Franchise Installer
    Given I select Create new Franchise Installer from the drop down list in the All Available Tasks appflow
    #And I click Run Task  in the All Available Tasks appflow
    
  Scenario: User details
  	#Given I enter Fred in the forename field in the Enter details of the user to add appflow
  	#And I enter Ford in the surname field in the Enter details of the user to add appflow
  	#And I enter fred.ford@test.com in the email field in the Enter details of the user to add appflow
  	#And I enter 01234 567890 in the phone field in the Enter details of the user to add appflow
  	And I click next in the Enter details of the user to add appflow
  	
  Scenario: Add as new user
  	#Given I select Create new user from the User dropdown
  	And I click next in the If the user to add already exists on the system please select them, otherwise select Create New User appflow
  		
   Scenario: User details
   		Given I click next in the please enter details of new user to create appflow
   		
   		 
