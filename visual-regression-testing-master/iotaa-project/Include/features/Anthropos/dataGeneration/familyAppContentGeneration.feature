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
Feature: Create content for the Family App
  This feature ensures adss content which the tests expect
  
  Scenario: Login to the Head Office
    Given login to Head Office as admin.iotaa using onetwothree  
  
  Scenario: Unpause the hub before testing the family app so we can see content 		
	  And click on sidebar Apps button    
	  And click on Iotaa.adminNav tile    
	  And I select Manage Hub State from the drop down list in the Admin tasks appflow 
	  And I click next in the Admin tasks appflow    
	  And select Bristol in the main Select Local Office multi select form appflow    
	  And I click next in the Select Local Office appflow    
	  And select John in the secondary Client multi select form appflow    
	  And I click next for the Client secondary appflow    
	  And I select Unpause hub in the drop down list in the Client John Jenkins secondary appflow    	 
	  And I click next for the Client secondary appflow       
	  Then click back in header console to head back to dashboard home screen

#### Only use the below when running between the hours of 6pm-8am so to generate additional family app data
 #	Scenario: Generate Family App content 
  #	Given Create third lot of data
  #	
#	Scenario: Run pumpadmin script to run wandering at night script (used for Famil App) 	
#		Given I navigate to PumpAdmin Scripts list
#		And I select com.pumpco.iotaa.WanderingAtNightScript script
#		And I click the run button
#		And I ensure that the AppFlow status is complete