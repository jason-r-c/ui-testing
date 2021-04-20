# Author: 
# jason.carney@anthropos.io

# Keywords Summary:
#
# 5607 Actionable insight for increased/decreased bathroom visits:
# Set scenario status to enabled after installation, set customer scenarios status to enabled, put scenario status to enabled when order is installed,
# Add "Change in bathroom visits - AI" to Standard package, modify Standard package,
# Set "Change in bathroom visits - AI" to enabled for national office, Set "Change in bathroom visits - AI" to enabled for local office,
# Set "Change in bathroom visits - AI" to enabled for client,
# Configure "Change in bathroom visits - AI" for client,
# Generate "Change in bathroom visits - AI" actionable insight / Generate dummy "Change in bathroom visits - AI" actionable insight  

# This feature covers cases: 
# 5607

Feature: Actionable insight for increased/decreased bathroom visits
	
	5607 Actionable insight for increased/decreased bathroom visits:
	Enable "Change in bathroom visits" scenario for National office, local office and client	
	NOTE: This generates a dummy actionable insight (no logic is behind its generation)
	This is because there is no way to test this 'properly' on a test environment

	Note: The alert has been seen to display on the dashboard late, therefore causing transient failures
	
	
	## // Case 5607 Actionable insight for increased/decreased bathroom visits - START
	##
	## // Description 
	## Enables  "Change in bathroom visits" scenario and generates dummy actionable insight. 
	####################################################################################################

	## // Refixture
	################################################################################################################
	
	Scenario: Reset data
  	Given Normalise the dashboard  
  	
	## Set customer Scenario Status to Enabled for "After installation, what status should desired scenarios be left in?"
	###################################################################################################### 	
		
 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
			
	Scenario: Run Configure Customer task
		And I select Configure Customer from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 			
				
	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next		
		
	Scenario: Set Scenario Status to enabled after installation
		Given I select the item, with the text partially containing: .*Enabled.* , from the drop down list with the attribute name and value scenarioStatus
		And I click next	  	

	## Generate an order then install it.	
	######################################################################################################

 	Scenario: Create configured order so we are ready for installation 
  	Given I navigate to PumpAdmin Scripts list
  	And I select com.pumpco.iotaa.NewAnthroposOrderAndInstallScript script 
  	And Add Custom Script Parameter to Run Script within pumpadmin: value fname in field number 1
	  And Add Custom Script Parameter to Run Script within pumpadmin: value Belinda in field number 2
	  And Add Custom Script Parameter to Run Script within pumpadmin: value sname in field number 3
	  And Add Custom Script Parameter to Run Script within pumpadmin: value BathroomVisitor in field number 4	  
  	And I click the run button
		And I ensure that the AppFlow status is complete
	
	## Enable "Change in bathroom visits" scenario for National Office.
	######################################################################################################

 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen	

	Scenario: Run Manage National Scenarios task
		And I select Manage National Scenarios from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next			
		
	Scenario: I select Change in bathroom visits from the "Managing scenarios for Home Instead" screen
		Then I confirm 'Managing scenarios for Home Instead' is visible within the screen whose ancestor contains attribute 'name' and value 'packages'
		Then I select the item, with the text partially containing: .*Configure Change in bathroom visits - AI.* , from the drop down list with the attribute name and value nextAction
		And I click next
		
	Scenario: Enable the "Change in bathroom visits" scenario
		Then I confirm 'Configuring Scenario: Change in bathroom visits - AI' is visible within the screen whose ancestor contains attribute 'name' and value 'package'
		Then I select the item, with the text partially containing: .*Enable scenario.* , from the drop down list with the attribute name and value nextAction
		And I click next		
		
	Scenario: Confirm the Change in bathroom visits scenario is now enabled
		Then I confirm 'Managing scenarios for Home Instead' is visible within the screen whose ancestor contains attribute 'name' and value 'packages'
		Then I confirm table cell content 'is exactly': enabled, located by row number 17 and column 2, whose ancestor element contains attribute name and value packages
		Given click the header button: user avatar, whose ancestor element contains attribute class and value header-left-you
		Then 'Frequent Tasks' is visible on screen
		
	## Enable "Change in bathroom visits" scenario for Local Office (Bristol).
	######################################################################################################		
	
	Scenario: Run Manage Office Scenarios task
		And I select Manage Office Scenarios from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 		

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next		

	Scenario: I select Change in bathroom visits from the "Managing scenarios for Bristol" screen
		Then I confirm 'Managing scenarios for Bristol' is visible within the screen whose ancestor contains attribute 'name' and value 'packages'
		Then I select the item, with the text partially containing: .*Configure Change in bathroom visits - AI.* , from the drop down list with the attribute name and value nextAction
		And I click next
		
	Scenario: Enable the Change in bathroom visits scenario
		Then I confirm 'Configuring Scenario: Change in bathroom visits - AI' is visible within the screen whose ancestor contains attribute 'name' and value 'package'
		Then I select the item, with the text partially containing: .*Enable scenario.* , from the drop down list with the attribute name and value nextAction
		And I click next		
		
	Scenario: Confirm the Change in bathroom visits scenario is now enabled
		Then I confirm 'Managing scenarios for Bristol' is visible within the screen whose ancestor contains attribute 'name' and value 'packages'
		Then I confirm table cell content 'is exactly': enabled, located by row number 17 and column 2, whose ancestor element contains attribute name and value packages
		Given click the header button: user avatar, whose ancestor element contains attribute class and value header-left-you
		Then 'Frequent Tasks' is visible on screen
		
	## Add "Change in bathroom visits" scenario to the Standard package.
	######################################################################################################	
	
	Scenario: Run Manage System Packages task
		And I select Manage System Packages from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow
		
	Scenario: Selecty Modify existing package from dropdown
		Given 'Current Packages Defined' is visible on screen
		Then I select the item, with the text partially containing: .*Modify existing package.* , from the drop down list with the attribute name and value configType	 		
		And I click next
	
	Scenario: Select Standard package from dropdown
		Given 'Select package to modify' is visible on screen
		Then I select the item, with the text partially containing: .*Standard.* , from the drop down list with the attribute name and value package
		And I click next
		
	Scenario: Select Change in bathroom visits - AI from Scenarios dropdown in Standard package management screen
		Then I confirm 'Select any scenarios to remove from Standard' is visible within the screen whose ancestor contains attribute 'name' and value 'delete'
		Then I select the item, with the text partially containing: .*Change in bathroom visits.* , from the drop down list with the attribute name and value scenarios
		And I click next		
		
	Scenario: Confirm "Change in bathroom visits - AI" has been added to the Standard package
		Given 'Current Packages Defined' is visible on screen
		Then I confirm 'Change in bathroom visits - AI' is visible within the screen whose ancestor contains attribute 'name' and value 'packages_row00_scenarios'
		Given click the header button: user avatar, whose ancestor element contains attribute class and value header-left-you
		Then 'Frequent Tasks' is visible on screen		
		
	## Enable "Change in bathroom visits - AI" for the client.
	######################################################################################################	

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

	Scenario: I select client Belinda BathroomVisitor
		Then I confirm 'Clients' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.admin.clientAdmin.internal'
		Then select row Belinda BathroomVisitor from single select appflow panel
		
	Scenario: Click edit link for: Scenarios
  	And 'Third-party IDs' is visible on screen
  	And Click the link with html name attribute editScenarios
  	
	Scenario: Select "Change in bathroom visits - AI" from Scenarios dropdown in "Standard" package management screen
		Then I confirm 'Select which scenarios should be enabled for Belinda BathroomVisitor, then continue save your changes' is visible within the screen whose ancestor contains attribute 'name' and value 'modify'
		Then I select the item, with the text partially containing: .*disabled.* , from the drop down list with the attribute name and value scenarios_row05
		Then I select the item, with the text partially containing: .*enabled.* , from the drop down list with the attribute name and value scenarios_row08
		And I click next	  
	
	Scenario: Confirm Change in bathroom visits - AI is now enabled for client Belinda BathroomVisitor
		And 'Account Details' is visible on screen
		Then I confirm table cell content 'is exactly': enabled, located by row number 17 and column 2, whose ancestor element contains attribute name and value scenarios
		
	## Confirm "Change in bathroom visits - AI" option is available, confirm default values for days, 
	## min and max times, then confirm we can edit those values
	######################################################################################################
		
	Scenario: Click edit link for: Configuration 
  	And 'Third-party IDs' is visible on screen
  	And Click the link with html name attribute editConfiguration
  	
	Scenario: Confirm Change in bathroom visits - AI is displayed in Scenario Configuration screen
		Given 'Change in bathroom visits - AI' is visible on screen				
		Then I confirm the content 3 is present within the input, whose ancestor element contains attribute name and value insights_row07_times
		Then I confirm the content 10 is present within the input, whose ancestor element contains attribute name and value insights_row07_maxTimes
		Then I confirm the content 2 is present within the input, whose ancestor element contains attribute name and value insights_row07_days
		
	Scenario: Confirm i can edit the amount of "days in a row"
		Given Add 4 to input field whose ancestor element contains attribute name and value insights_row07_days

	Scenario: Confirm i can edit the amount "Min Times/Day" and "Max Times/Day" of visits per day  
		Given Add 5 to input field whose ancestor element contains attribute name and value insights_row07_times
		Then Add 6 to input field whose ancestor element contains attribute name and value insights_row07_maxTimes
		And I click next	  
		
	Scenario: Confirm Configuration Complete
		Given 'Configuration Complete' is visible on screen
		And I click next	  
								
	## Set actionable insights to go to the office.
	######################################################################################################
	
	Scenario: Click edit link for: Alerts and Insights 
  	And 'Third-party IDs' is visible on screen
  	
  	## JC 28/2/21: Commented out as passes locally but fails in overnight tests.
  	## And Click the link with html name attribute editAlertAndInsights
  	And I click the button html element, whose ancestor element contains attribute name and value editAlertAndInsights
  	
	Scenario: Confirm Anthropos Call Centre is an option to select from "Who will receive alerts and actionable insights" screen
		## JC 28/2/21: Commented out as passes locally but fails in overnight tests.
		## Given 'Who will receive alerts and actionable insights' is visible on screen		
		Then I confirm 'Alerts during office hours' is visible within the screen whose ancestor contains attribute 'name' and value 'alerts'
		
  	And I select the item, with the text partially containing: .*Family App.* , from the drop down list with the attribute name and value alertDayRecipient
		And I select the item, with the text partially containing: .*Family App.* , from the drop down list with the attribute name and value alertOohRecipient
		And I select the item, with the text partially containing: .*Office Dashboard.* , from the drop down list with the attribute name and value insightRecipient
		And I select the item, with the text partially containing: .*Office Dashboard.* , from the drop down list with the attribute name and value serviceIssuesRecipient		
		And I click next
		
	Scenario: Set "Alerts not acknowledged on the Family App" During Office Hours, to Bristol
		Given 'How to deal with alerts not acknowledged on the Family App' is visible on screen
		Then I select the item, with the text partially containing: .*Bristol.* , from the drop down list with the attribute name and value escalationContact
		And I click next
		
	Scenario: Set "Alerts not acknowledged on the Family App" Outside of Office Hours, to Bristol
		Given 'How to deal with alerts not acknowledged on the Family App' is visible on screen
		Then I select the item, with the text partially containing: .*Bristol.* , from the drop down list with the attribute name and value escalationContact
		And I click next		
		
	Scenario: Click continue on Notification methods screen
		Given 'Notification methods' is visible on screen
		Then I click next
		
	Scenario: Confirm we are back on Client Administration screen 
  	And 'Third-party IDs' is visible on screen	

#	#	## The below transiently fails. 
#	#	######################################################################################################
	
#	#	## Generate dummy 'bathroom visits' actionable insight. 
#	#	######################################################################################################
#	#
#	#	Scenario: Create configured order so we are ready for installation 
#	  #	Given I navigate to PumpAdmin Scripts list
#	  #	And I select com.pumpco.iotaa.BathroomVisitsExampleInsightScript script 
#	  #	And Add Custom Script Parameter to Run Script within pumpadmin: value username in field number 1
#	#	  And Add Custom Script Parameter to Run Script within pumpadmin: value Belinda.BathroomVisitor in field number 2   
#	  #	And I click the run button
#	#		And I ensure that the AppFlow status is complete 
#	#
#	#	## Confirm the actionable insight has been generated, and is displayed on the Bristol office dashboard.
#	#	######################################################################################################
#	  #Scenario: Login to the Office
#	#		Given Office - login with bristol.office
#	    #Then 'Frequent Tasks' is visible on screen
#	    #
#	  #Scenario: confirm the actionable insight has been generated
#	#		Given 'Belinda BathroomVisitor has visited the bathroom a daily average of 12 times in the last 2 days, compared to a usual average of 7 times. Please contact client to discuss.' is visible on screen

	## // Case 5607 Actionable insight for increased/decreased bathroom visits - END
	####################################################################################################
 

		