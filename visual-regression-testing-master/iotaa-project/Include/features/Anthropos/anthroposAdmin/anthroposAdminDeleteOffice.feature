#Author: callum.patience@anthropos.io
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
# This feature covers cases: 5685

@tag
Feature: Deleting a Franchise
	- 5685: Deletes the client Steve Swindon, deletes the Swindon office, then confirms the office has been deleted

	## // Refixture
	################################################################################################################
	
	Scenario: Reset data
  	Given Normalise the dashboard  

	Scenario: Log in as admin iotaa
		Given Admin IoTAA - login with admin.iotaa
		Then 'All Available Reports' is visible on screen
		And I select Delete Local Office from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow
		
	Scenario: Choose Swindon Office
		Given 'Select customer' is visible on screen
		Then I select Home Instead in the Customer multi select list
		And I click next
		
		Then 'Select office' is visible on screen
		And I select Swindon in the Office multi select list
		And I click next
		
		# And I confirm Not Empty is visible
		Then 'Not Empty' is visible on screen
		And I click next
		
		
	Scenario: Delete Steve Swindon
		Given 'All Available Reports' is visible on screen
		Then I select Delete Client from the drop down list in the sidebar appflow for All Available Tasks		
		And I click Run Task in the All Available Tasks appflow
		
		Then 'Select customer' is visible on screen
		And I select Home Instead in the Customer multi select list
		And I click next
		
		Then 'Select office' is visible on screen
		And I select Swindon in the Office multi select list
		And I click next
		
		Then 'Client to be deleted' is visible on screen
		And I select Steve Swindon in the Client to be deleted multi select list
		And I click next
		
		Then 'Client to be deleted' is visible on screen
		# And I select the item, with the text partially containing: Yes, delete client , from the drop down list with the attribute name and value confirm
		# Then I select Steve Swindon in the Client to be deleted multi select list
		And I click next
		
	Scenario: Confirm we want to delete client Steve Swindon
		Given 'Confirm that client is to be deleted' is visible on screen 
		Then I select the item, with the text partially containing: .*Yes, delete client.* , from the drop down list with the attribute name and value confirm
		And I click next
		
	Scenario: Delete Swindon Office
		Given 'All Available Reports' is visible on screen
		Then I select Delete Local Office from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow
		
		Then 'Select customer' is visible on screen
		And I select Home Instead in the Customer multi select list
		And I click next
		
		Then 'Select office' is visible on screen
		And I select Swindon in the Office multi select list
		And I click next
		
		Then 'Please confirm you wish to delete office' is visible on screen
		And I select the item, with the text partially containing: Yes, delete this office , from the drop down list with the attribute name and value confirm
		And I click next
		#And I wait 2 seconds before moving to the next step
		
	# >> JC 12/7/20: test now does not rely on automatic display of office, browser refreshes instead. 
 	Scenario: Login again to view the new office on the dashboards
		Given Anthropos Support - login with admin.iotaa		
		
	Scenario: Confirm Swindon office has been deleted
		Then 'All Available Reports' is visible on screen
		And I confirm Swindon is not visible