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

Feature: Create a new order 
  Check that we can create a new order
  
  Scenario: Login to the Local Office
    Given login to Local Office as bristol.office using onetwothree
    Then I confirm Bristol Office is visible
        
  Scenario: Select a new order
    Given I select Create Anthropos Order from the drop down list in the sidebar appflow for All Available Tasks     		
    And I click Run Task in the All Available Tasks appflow    		
  
  Scenario: Enter client details
  	Given I enter Ferrari in the Surname field
  	And I enter AA1 1AA in the Postcode field
  	And I click next in the Anthropos Order appflow
  	And _create new order if an order already exists
  	
	Scenario: Enter general details		
		Given I enter John in the Forename field	
	  And I select Male from the Gender drop down list	
		And I enter 01 jan 1945 in the Date of Birth datepicker drop down list
		And I enter 1 Top Gear Lane in the Address Line 1 field
   	And I enter Test Town in the Town field
	  And I select Yes from the Does the client have broadband? drop down list
	  And I enter Jill Ferrari in the Who do we contact to arrange installation? field
		And I enter 01234 567890 in the Contact number field
	  And I enter Daughter in the Relationship to client field
	  # JCARNEY 12/6/19:  
	  And I enter No preferences in the Preferences for installation date/time text area
	  
	  And I enter additional information in the Installation Day Notes text area	     		
		And I click next in the General Information appflow
		
	Scenario: Enter broadband room details		
	  Given I enter Hallway in the Which room is the broadband router in? field		
		And I check the Please tick the box to confirm acceptance checkbox
		And I click next in the Broadband appflow
		
	Scenario: Select Packages
		Given _choose Monthly fee from How will the client be dropdown
		And _choose Anthropos from Who will be performing the installation dropdown
		And _choose One-off charge from How will the client be charged dropdown
		And I click next in the Anthropos Setup appflow
		
	Scenario: Enter sensors
    Given _choose Hallway from Front door sensor dropdown in Standard Devices appflow
	  And _choose Kitchen from Back door sensor dropdown in the Door Sensors appflow		
		And I click next in the Standard Devices appflow
		
	Scenario: Additional devices
		Given I select Continue from the Option drop down list		
		And I click next in the Additional Devices appflow
			 
	Scenario: House information
	  Given I enter 1 floor new build bungalow in the Information text area
		And I click next in the House Information appflow
		
	Scenario: complete order
		Given I select Complete survey and create client from the Choice drop down list	
		And I click next in the Survey Complete appflow
		
	Scenario: Finished		
		Given I confirm Finished is visible
		And I click next in the Finished appflow
		
	Scenario: Family app
		Given _choose Add new Family App User from Choice dropdown in Current Family App Users appflow
		And I click next in the Current Family App Users appflow
		
	Scenario: Add Family Member
		 Given I enter Jill in the Forename field
		 And I enter Ferrari in the Surname field
		 And I enter jill.ferrari@test.com in the Email Address field
		 And I add 01234 567890 number in the Mobile Number telephone field
		 And I select Yes from the Receieve alerts by text? drop down list
	   And I select No from the Receive alerts by email? drop down list
	   And I click next in the Add Family Member appflow
	  
	Scenario: Finish
    Given _choose Continue from Choice dropdown in Current Family App Users appflow	  
	  And I click next in the Current Family App Users appflow
	  
	Scenario: alerts and insights
	  Given _choose Family App via Alerts during office hours droplist in the Who will receive alerts and actionable insights appflow
		And _choose Family App via Alerts out of office hours droplist in the Who will receive alerts and actionable insights appflow
		And _choose Family App via Actionable Insights droplist in the Who will receive alerts and actionable insights appflow
		And I click next in the Who will receive alerts and actionable insights appflow  
		
	Scenario: alerts during
		Given I select Bristol from the Who to escalate to drop down list		 		 
		And I click next in the How to deal with alerts not acknowledged on the Family App appflow
			
	Scenario: alerts outside
		And I select Bristol from the Who to escalate to drop down list
		And I click next in the How to deal with alerts not acknowledged on the Family App appflow
		
	Scenario: Desired scenarios
		# Given I click next in the Desired Scenarios appflow
		# JC 2/6/19: just click next in the appflow
		Given I click next
		And check checkbox for First Morning Activity - no activity alert
		Then I click next
				
		
