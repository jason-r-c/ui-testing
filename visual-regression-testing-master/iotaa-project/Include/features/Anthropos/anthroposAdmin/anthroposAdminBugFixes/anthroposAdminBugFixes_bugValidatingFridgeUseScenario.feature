# Author: 
# jason.carney@anthropos.io

# Keywords Summary:
# 
# fridge door not opened scenario, confirm fridge door scenario no longer crashes

# This feature covers cases: 
# 8014

Feature: Case - bug validating fridgeUse scenario
  
  8014 bug validating fridgeUse scenario: Confirm the platform no longer crashes when enabling the 
  Fridge door not opened frequently - AI sceanrio

	## // Case 8014 (BUG): bug validating fridgeUse scenario - START
	##
	## // Description 
	## Confirm the platform no longer crashes when enabling the 
  ## Fridge door not opened frequently - AI sceanrio
	####################################################################################################

 	Scenario: Create configured order so we are ready for installation 
  	Given I navigate to PumpAdmin Scripts list
  	And I select com.pumpco.iotaa.NewAnthroposOrderAndInstallScript script 
  	And Add Custom Script Parameter to Run Script within pumpadmin: value fname in field number 1
	  And Add Custom Script Parameter to Run Script within pumpadmin: value Faylor in field number 2
	  And Add Custom Script Parameter to Run Script within pumpadmin: value sname in field number 3
	  And Add Custom Script Parameter to Run Script within pumpadmin: value Fodd in field number 4	   
  	And I click the run button
		And I ensure that the AppFlow status is complete   
		
	## ) login as admin.iotaa > Run Manage Client Scenarios [Legacy] task > HI > bristol > select client Faylor Fodd 
	## > select Configure Fridge door not opened frequently - AI where name="nextAction"

 	Scenario: Login as admin.iotaa
		Given Admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Configure Manage Client Scenarios [Legacy] task 
		And I select Manage Client Scenarios [Legacy] from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next		
		
	Scenario: I select Faylor Fodd from the Client selectable items in the Select client appflow
		Then 'Select client' is visible on screen
		Then  I select Faylor Fodd from the Client selectable items in the Select client appflow		
		And I click next		
		
	## ) Confirm "Configuring Scenario: Fridge door not opened frequently - AI" is visible 
	## > select "Disable scenario" from dropdown where name="nextAction"
	
	Scenario: Disable Fridge door not opened frequently scenario
 		Given I confirm 'Managing scenarios for Faylor Fodd' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.service.packages.manage.internal'
		Then I select the item, with the text partially containing: .*Fridge door.* , from the drop down list with the attribute name and value nextAction
		And I click next
	
	Scenario: Disbled the Fridge door not opened frequently scenario
		Given I confirm 'Configuring Scenario: Fridge door not opened frequently - AI' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.service.packages.manage.internal'
		Then I select the item, with the text partially containing: .*Disable scenario.* , from the drop down list with the attribute name and value nextAction
		And I click next
		Then I confirm 'Managing scenarios for Faylor Fodd' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.service.packages.manage.internal'
		
	## ) head back to home screen > run Client Administration task > HI > Bristol 
	## > select client Faylor Fodd > click edit link where name="editScenarios" > select enabled from dropdown where name="scenarios_row08_client"
	
	Scenario: Head back to home screen
		Given click the header button: user avatar, whose ancestor element contains attribute class and value header-left-you
		Then 'Frequent Tasks' is visible on screen
	
	Scenario: Run Client Administration task 
		And I select Client Administration from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next		
				
	Scenario: I select Faylor Fodd from the Client selectable items in the client who was installed appflow
		Then I confirm 'Faylor Fodd' is visible within the screen whose ancestor contains attribute 'name' and value 'clientsTable'
		Then select row Faylor Fodd from single select appflow panel
		
	Scenario: Click edit link for: Alerts and Insights 
  	And 'Third-party IDs' is visible on screen
  	And Click the link with html name attribute editScenarios		

	Scenario: Enable Fridge door not opened frequently - AI
		Given 'Select which scenarios should be enabled' is visible on screen
		Then I select the item, with the text partially containing: .*enable.* , from the drop down list with the attribute name and value scenarios_row08_client
		And I click next
	
	## This screen confirms there is no bug as the platform did not crash.
	Scenario: Confirm we are back on client administration screen 
  	And 'Third-party IDs' is visible on screen
  	
	Scenario: Confirm Fridge door not opened frequently - AI is now enabled
		Then I confirm table cell content 'is exactly': enabled, located by row number 6 and column 2, whose ancestor element contains attribute name and value scenarios

	## // Case 8014 (BUG): bug validating fridgeUse scenario - END
	####################################################################################################	 
	