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

### // feature uses the following glue code classes
### // 1) glueCode.groovy
### // 2) appflows.groovy

@tag
Feature: Generate content for the dashboard and famly app 

	Scenario: Reset the platform so there is no content 
		Given Normalise the dashboard

 	Scenario: Generate some content 
		And Create Local Office data

	Scenario: Run pumpadmin scripts to create content	
		Given I navigate to PumpAdmin Scripts list
		And I select com.pumpco.iotaa.WanderingAtNightScript script
		And I click the run button
		And I ensure that the AppFlow status is complete
		Then Head back fixtures list
		And I select com.pumpco.iotaa.NoKettleForTimeScript script
		And I click the run button
		And I ensure that the AppFlow status is complete
		
	Scenario: Run 2nd round of Local Office content creation
		Given Create second lot of data
	  
	Scenario: Run 2nd round of pumpadmin scripts to more content	
		Given I navigate to PumpAdmin Scripts list
		And I select com.pumpco.iotaa.WanderingAtNightScript script
		And I click the run button
		And I ensure that the AppFlow status is complete	 

	Scenario: Create First morning activity card content using iot test tool
		Given navigate to iot test tool

  Scenario: Login to the Head Office to start Service Status card content creation process
    Given login to Head Office as admin.iotaa using onetwothree

	Scenario: Create Service Status card content
    And click on sidebar Apps button    
    And click on Iotaa.adminNav tile    
    And I select Manage Hub State from the drop down list in the Admin tasks appflow 
    And I click next in the Admin tasks appflow    
    And select Bristol in the main Select Local Office multi select form appflow    
    And I click next in the Select Local Office appflow    
    And select John in the secondary Client multi select form appflow    
    And I click next for the Client secondary appflow    
    And I select Pause hub in the drop down list in the Client John Jenkins secondary appflow    	 
    And I click next for the Client secondary appflow    
    And input some message text into Enter date & time to pause Hub appflow    
    And I click next in the Enter date & time to pause Hub appflow    
    And I click next in the Enter date & time to pause Hub appflow    
    Then click back in header console to head back to dashboard home screen
    
    

		
		