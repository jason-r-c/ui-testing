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
# 
# This feature covers cases: 5041, 4609

Feature: Restart Hub Connect
  Restarts the Hub Connect service via the Manage Hub task
  
 	Scenario: Run NewAnthroposOrderScript in Pump Admin
  	Given I navigate to PumpAdmin Scripts list
  	And I select com.pumpco.iotaa.NewAnthroposOrderScript script
  	And Add Custom Script Parameter to Run Script within pumpadmin: value fname in field number 1
	  And Add Custom Script Parameter to Run Script within pumpadmin: value brad in field number 2
	  And Add Custom Script Parameter to Run Script within pumpadmin: value sname in field number 3
	  And Add Custom Script Parameter to Run Script within pumpadmin: value bentley in field number 4
  	And I click the run button
		And I ensure that the AppFlow status is complete  	 

  Scenario: Login to the admin.iotaa dashboard    
    Given Anthropos admin - login with admin.iotaa
    
    # JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
    # And I confirm admin iotaa is visible
    And 'Frequent Tasks' is visible on screen
    
	Scenario: Select and run Manage Hub
		Given I select Manage Hub from the drop down list in the sidebar appflow for All Available Tasks
		And click on sidebar Run Task button  
		
	Scenario: Select customer
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Select customer is visible
		And 'Select customer' is visible on screen
		
		And I select Home Instead in the Customer multi select list
		And I click next
		
	Scenario: Select office
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Select office is visible
		And 'Select office' is visible on screen
		
		And I select Bristol in the Office multi select list
		And I click next			  
		
	Scenario: Select client
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Select client is visible
		And 'Select client' is visible on screen
		
		And I select brad bentley in the Select client multi select list
		And I click next			
	
	Scenario: Select the Restart service option
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Outstanding actions is visible
		And 'Outstanding actions' is visible on screen
		
		And select column dropdown with name attribute task and set to Restart service
		And I click next
		
	Scenario: Carry out the Restart Service
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Restart Service on Hub is visible
		And 'Restart Service on Hub' is visible on screen
		
		Then select column dropdown with name attribute service and set to Hub Connect
		And select column dropdown with name attribute when and set to Now
		And I click next
		
	Scenario: Confirm the hub has rebooted (covers cases 5041)
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm reboot requested is visible
		And 'reboot requested' is visible on screen
		
		And I confirm table cell content 'is exactly': hub-connect2, located by row number 2 and column 3, whose ancestor element contains attribute name and value actionsTable

	Scenario: Calibrate BCG
		Given I select Calibrate BCG from the task drop down list
		And I click next
		And I select Bed from the BCG drop down list
		And I select Empty from the Calibration type drop down list
		And I click next
		
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# And I confirm BCG Calibration Failed is visible
		And 'BCG Calibration Failed' is visible on screen

		