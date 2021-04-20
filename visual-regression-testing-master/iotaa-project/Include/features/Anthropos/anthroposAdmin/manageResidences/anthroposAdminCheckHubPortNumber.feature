#Author: your.email@your.domain.com
#Keywords Summary : port number, generate mac address using pumpadmin
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
# This feature cover cases: 5084, 6374

@tag
Feature: Check Hub port number
	5084: Check Hub port number for pre paired and un-configured Hubs
	
	## // Refixture
	################################################################################################################
	
	Scenario: Reset data
  	Given Normalise the dashboard   	
	
	#####################################################
	## // Check pre paired hub has correct port number
	#####################################################
	
	Scenario: Log on as Admin
		Given Head Office - login with admin.iotaa
  	And 'Frequent Tasks' is visible on screen
  		
	Scenario: Select Configure Client Residences task
  	Given I select Configure Client Residences from the drop down list in the sidebar appflow for All Available Tasks
  	And I click Run Task in the All Available Tasks appflow
  	
	Scenario: Select the customer
  	# Given I confirm Select customer is visible
  	And 'Select customer' is visible on screen
  	Then I select Home Instead in the Customer multi select list
  	And I click next
  	
	Scenario: Select the office
  	# Given I confirm Select office is visible
  	Given 'Select office' is visible on screen
  	Then I select Bristol in the Office multi select list
  	And I click next  	
  	
	Scenario: Select the client
  	# Given I confirm select client whose residence needs to be configured is visible
  	Given 'select client whose residence needs to be configured' is visible on screen
  	Then I select John Jenkins in the select client whose residence needs to be configured multi select list
  	And I click next  
	
	Scenario: Begin to edit the hub
		# Given I confirm Editing Residence is visible
		Given 'Editing Residence' is visible on screen
		And I select Edit hub from the Select action to perform drop down list
		And I click next
		
	Scenario: Add -1 to end of Hub MAC address
		# Given I confirm Editing Hub is visible
		Given 'Editing Hub' is visible on screen
		# And I enter b8:27:eb:45:fd:aa-1 in the Hub UUID field
		
		# JCARNEY 15/05/20: Updated to use more generic input field gherkin
		Then Add b8:27:eb:45:fd:aa-1 to input field whose ancestor element contains attribute name and value uuid

		
		
		And I click next
		
	Scenario: Confirm we are back on Editing Residence screen
		# Given I confirm Editing Residence is visible
		Given 'Editing Residence' is visible on screen

	Scenario: Head back to home screen
		Given click back in header console to head back to dashboard home screen
		# And I confirm admin iotaa is visible
		And 'Frequent Tasks' is visible on screen

	Scenario: Select Hub Status Report report
  	Given I select Hub Status Report from the drop down list in the sidebar appflow for All Available Reports
  	And I click Run Report in the All Available Reports appflow
  	
	Scenario: Select the customer
  	# Given I confirm Select customer is visible
  	And 'Select customer' is visible on screen
  	Then I select Home Instead in the Customer multi select list
  	And I click next
  	
 	Scenario: Select the office
  	# Given I confirm Select office is visible
  	Given 'Select office' is visible on screen
  	Then I select Bristol in the Office multi select list
  	And I click next 
  	
#And I wait 600 seconds before moving to the next step
  	
	Scenario: Accept default values on Generate Report of Hub Status for all Clients screen
		# Given I confirm Generate Report of Hub Status for all Clients is visible
		Given 'Generate Report of Hub Status for all Clients' is visible on screen
		Then I select John Jenkins in the Client multi select list
		And I click next
		
		
	Scenario: Confirm John Jenkins Hub port number is correct (covers case 5084)
		# Given I confirm Hub: b8:27:eb:45:fd:aa-1 [LIVE] ( 64938 ) is visible 	
		Given 'Hub: b8:27:eb:45:fd:aa-1 [LIVE] ( 64938 )' is visible on screen
		 
	################################################
	## // Generate Order to check for port number 0
	################################################

	Scenario: Generate order for Borris Bentley
		Given I navigate to PumpAdmin Scripts list
		And I select com.pumpco.iotaa.NewAnthroposOrderScript script
		And Add Custom Script Parameter to Run Script within pumpadmin: value fname in field number 1
		And Add Custom Script Parameter to Run Script within pumpadmin: value Borris in field number 2
		And Add Custom Script Parameter to Run Script within pumpadmin: value sname in field number 3
		And Add Custom Script Parameter to Run Script within pumpadmin: value Bentley in field number 4
		And Add Custom Script Parameter to Run Script within pumpadmin: value hub in field number 5
		And Add Custom Script Parameter to Run Script within pumpadmin: value 2326b483-7de0-45dd-bebf-a9fab260d11e in field number 6
		And I click the run button		 
		
	Scenario: Log on as Admin
		Given Head Office - login with admin.iotaa  		
  	And 'Frequent Tasks' is visible on screen
  	
	Scenario: Select Hub Status Report report
  	Given I select Hub Status Report from the drop down list in the sidebar appflow for All Available Reports
  	And I click Run Report in the All Available Reports appflow  	
		
	Scenario: Select the customer
  	And 'Select customer' is visible on screen
  	Then I select Home Instead in the Customer multi select list
  	And I click next
  	
 	Scenario: Select the office
  	And 'Select office' is visible on screen
  	Then I select Bristol in the Office multi select list
  	And I click next 		
  	
	Scenario: Accept default values on Generate Report of Hub Status for all Clients screen
		Given 'Generate Report of Hub Status for all Clients' is visible on screen
		Then I select Borris Bentley in the Client multi select list
		And I click next
		
	Scenario: Confirm Borris Bentleys port number is 0 (covers case 5084)
		Given I confirm [NEW] ( 0 ) is visible   	
		And '[NEW] ( 0 )' is visible on screen
		
	#############################################################################
	## // 6374: Search by Mac address / Search by Port number 
	#############################################################################
	
	Scenario: Generate order for Sian Sinner
		Given I navigate to PumpAdmin Scripts list
		And I select com.pumpco.iotaa.NewAnthroposOrderAndInstallScript script
		And Add Custom Script Parameter to Run Script within pumpadmin: value fname in field number 1
		And Add Custom Script Parameter to Run Script within pumpadmin: value Sian in field number 2
		And Add Custom Script Parameter to Run Script within pumpadmin: value sname in field number 3
		And Add Custom Script Parameter to Run Script within pumpadmin: value Sinner in field number 4
		And Add Custom Script Parameter to Run Script within pumpadmin: value hub in field number 5
		And Add Custom Script Parameter to Run Script within pumpadmin: value 37:4C:85:7B:98:14 in field number 6
		And I click the run button	
		
	Scenario: Log on as Anthropos Admin
		Given Anthropos Admin - login with admin.iotaa
  	And 'Frequent Tasks' is visible on screen		
  	
	Scenario: Select Client Activity Graph report
  	Given I select Client Activity Graph from the drop down list in the sidebar appflow for All Available Reports
  	And I click Run Report in the All Available Reports appflow   	
  	
	Scenario: Select the Search for user
  	Given 'Select customer' is visible on screen
  	Then I select Search for user in the Customer multi select list
  	And I click next  	
  	
	Scenario: Enter hub MAC addres
  	Given 'hub mac address or port number' is visible on screen
  	Then Add 37:4C:85:7B:98:14 to input field whose ancestor element contains attribute name and value search
  	And I click next    	
  	
	Scenario: Confirm client Sian Sinner has been found as result of search
  	Given 'Sian Sinner' is visible on screen
  	Then '37:4C:85:7B:98:14' is visible on screen
  	And '38932' is visible on screen
  	And I click back
  	
	Scenario: Enter hub Port number
  	Given 'hub mac address or port number' is visible on screen
  	Then Add 38932 to input field whose ancestor element contains attribute name and value search
  	And I click next  	
  	
	Scenario: Confirm client Sian Sinner has been found as result of search (covers case: 6374)
  	Given 'Sian Sinner' is visible on screen
  	Given '37:4C:85:7B:98:14' is visible on screen
  	Given '38932' is visible on screen  		
		