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
Feature: Create local office and family content

	Scenario: Reset the platform so there is no content 
		Given Normalise the dashboard

	# 1) reset pumphouse time to 9am
	Scenario: Set the time in PumpHouse to 9am so we are using office hours 
		Given reset pumphouse time to 9 hundred hours
		
	# 1.1) Login to the head office 
	Scenario: Login to the Head Office dashboard
		Given login to Head Office as admin.iotaa using onetwothree

	# 2) select alert and insight recipients for Family App
	# - set Alerts during office hours to Office dashboard
	# - set Alerts outs of office hours to Office dashboard
	# - set Actionable Insights to Office dashboard
	Scenario: Set the in-office and out-of-office hours to Family App (config we need before running pumpadmin scripts)
		Given select alert and insight recipients for Family App

	# 3) run wandering at night script in pumpadmin
	# this creates the Local Office alerts content
	Scenario: run wandering at night script in pumpadmin (displays LO Notifications, FA Alerts and AI's)
		Given run WanderingAtNightScript in pumpadmin

	# 4) run no kettle for time script in pumpadmin
	# this creates Local Office Actionable Insights
	Scenario: run no kettle script in pumpadmin (dislays LO Alerts and AIs)
		Given run NoKettleForTimeScript in pumpadmin
	
	# 4.2) Login to the head office 
	Scenario: Login to the Head Office dashboard
		Given login to Head Office as admin.iotaa using onetwothree	
	
	# 5) set alerts and insights hours 
	# - set Alerts during office hours to Family App
	# - set Alerts outs of office hours to Family App
	# - set Actionable Insights to Family App
	Scenario: Set the in-office and out-of-office hours to Office Dashboard (config we need before running pumpadmin scripts)
		Given select alert and insight recipients for Office Dashboard
 
	# 6)  run wandering at night script in pumpadmin
	# this creates the Local Office Notifications AND Family App Alerts content
	Scenario: run wandering at night script in pumpadmin (dislays LO Alerts and AIs)
		Given run WanderingAtNightScript in pumpadmin	
	
	# 7) run no kettle for time script in pumpadmin
	# this creates Family App Actionable Insights content
	Scenario: run no kettle script in pumpadmin (dislays LO Alerts and AIs)
		Given run NoKettleForTimeScript in pumpadmin
		
#############################################################################################

	Scenario: Create First morning activity card content using iot test tool
		Given navigate to iot test tool

  Scenario: Login to the Head Office to start Service Status card content creation process
    Given login to Head Office as admin.iotaa using onetwothree

	Scenario: Create Service Status card content
    And click on sidebar Apps button    
    And click on Iotaa.adminNav tile    
    And I select Manage Hub State from the drop down list in the Admin tasks appflow 
    And I click next in the Admin tasks appflow    
    And I select Home Instead from the Customer selectable items in the Select customer appflow
    And I click next in the Select customer appflow 
    And select Bristol in the main Select local office multi select form appflow    
    And I click next in the Select local office appflow    
    And select John in the secondary Client multi select form appflow    
    And I click next for the Client secondary appflow    
    And I select Pause hub in the drop down list in the Client John Jenkins secondary appflow    	 
    And I click next for the Client secondary appflow    
    And input some message text into Enter date & time to pause Hub appflow    
    And I click next in the Enter date & time to pause Hub appflow    
    And I click next in the Enter date & time to pause Hub appflow    
    
	Scenario: Login to the Head Office to start Service Status card content creation process
    Given login to Head Office as admin.iotaa using onetwothree 
    
  Scenario: Unpause the hub before testing the family app so we can see content 		
	  And click on sidebar Apps button    
	  And click on Iotaa.adminNav tile    
	  And I select Manage Hub State from the drop down list in the Admin tasks appflow 
	  And I click next in the Admin tasks appflow
    And I select Home Instead from the Customer selectable items in the Select customer appflow
    And I click next in the Select customer appflow 	      
	  And select Bristol in the main Select local office multi select form appflow    
	  And I click next in the Select local office appflow    
	  And select John in the secondary Client multi select form appflow    
	  And I click next for the Client secondary appflow    
	  And I select Unpause hub in the drop down list in the Client John Jenkins secondary appflow    	 
	  And I click next for the Client secondary appflow       
	  Then click back in header console to head back to dashboard home screen    