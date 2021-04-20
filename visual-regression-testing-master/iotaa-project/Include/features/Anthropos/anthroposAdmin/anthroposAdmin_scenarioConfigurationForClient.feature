# Author: 
# jason.carney@anthropos.io

# Keywords Summary:
#
# check scenario configuration, configure settings for a clients scenarios, 
#
# Auto-Learning: The system will evaluate settings based on historic client behaviour,
#
# Default Values: The system will use default settings (any client-specific values entered will not be used),
# 
# Specific values for the client: The system will use the manually-specified settings,
#
# First Morning Activity - no activity alert,  
#
# Fridge door not opened frequently - AI, 
#
# Scenario configuration screen within Client Administration task
#
# 8533 Change minimum alert threshold to 8 minutes:
# minimum threshold for alerts, scenario config for alerts, alert threshold / minimum alert threshold

# This feature covers cases: 
# 6384, 8533, 8707s

Feature: "Config pages redraft": Scenario Configuration of devices for a client

  6384: Confirms default settings for a clients scenarios.
  NOTE: Currently, this tests against the default configuration for a pumpadmin scripted user.
  A manually created order (using Create Anthropos Order task) uses different configuration.

	8533 Change minimum alert threshold to 8 minutes:
	The requirement:
	As an office user, I want to be able to set the alert threshold to a minimum of 8 minutes, 
	in case a client is very vulnerable and I need to be alerted sooner.
	
	8707 Ability to change default scenario configuration at a customer level:

	## // Case 6384: Config pages redraft - START
	##
	## // Description 
	## Confirms default settings for a clients scenarios.
	####################################################################################################

	## // Refixture
	################################################################################################################
	
	Scenario: Reset data
  	Given Normalise the dashboard    
		
		#	## // Case 8707: Ability to change default scenario configuration at a customer level - START
		#	##
		#	## // Description 
		#	## 8707 PRE TEST GHERKIN
		#	####################################################################################################
		#
		#	## 1) Can Anthropos Support run a task called "Edit Default Scenario Configuration"?
		#	## 2) Can AS select a customer?
		#	####################################################################################################
		#	
		 #	Scenario: Login as Anthropos admin
		#		Given Anthropos admin - login with admin.iotaa
		#		Then 'Frequent Tasks' is visible on screen
		#		
		#	Scenario: Run Edit Default Scenario Configuration task
		#		And I select Edit Default Scenario Configuration from the drop down list in the sidebar appflow for All Available Tasks
		#		And I click Run Task in the All Available Tasks appflow	 
		#
		#	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		#		Then 'Select customer' is visible on screen
		#		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		#		And I click next	
		#		
		#	Scenario: PRE TEST GHERKIN: Confirm no option displayed
		#		Given 'First Morning Activity' is visible on screen
		#		And I confirm option is not visible
		#		
		#	## 3) Can AS change the default scenario configuration for the scenarios available to my customer?	
		#	####################################################################################################
		#	
		#	Scenario: Confirm default settings for First Morning Activity - no activity alert scenario
		#		Given 'Scenario Configuration' is visible on screen
		#
		#		## Alerts
		#		And 'First Morning Activity - no activity alert' is visible on screen
		#
		#		## Default values
		#		And I confirm table cell content 'non-csv: contains': Time to be out of bed by: 11:00, located by row number 2 and column 3, whose ancestor element contains attribute name and value alerts
		#
		#	  ## Client-Specific values
		#		And I confirm table cell content 'non-csv: contains': Time, located by row number 2 and column 3, whose ancestor element contains attribute name and value alerts
		#		And I confirm the content 09:45 is present within the input, whose ancestor element contains attribute name and value alerts
		#		
		#		
		#		## Change the time
		#		And I click the input html element, number 1, whose ancestor element contains attribute name and value alerts_row00_start
		#		And I click incrementHour to alter the time, where the ancestor element contains attribute class and value time-inline
		#		And I click the div html element, number 1, whose ancestor element contains attribute name and value iotaa.form.manage.client.config3.internal
		#				
		#	## // Case 8707: Ability to change default scenario configuration at a customer level - END
		#	####################################################################################################  	
  
	## // Create new installed order
	####################################################################################################
 	Scenario: Create configured order so we are ready for installation 
  	Given I navigate to PumpAdmin Scripts list
  	And I select com.pumpco.iotaa.NewAnthroposOrderAndInstallScript script 
  	And Add Custom Script Parameter to Run Script within pumpadmin: value fname in field number 1
	  And Add Custom Script Parameter to Run Script within pumpadmin: value Sandy in field number 2
	  And Add Custom Script Parameter to Run Script within pumpadmin: value sname in field number 3
	  And Add Custom Script Parameter to Run Script within pumpadmin: value Satchell in field number 4
	  And Add Custom Script Parameter to Run Script within pumpadmin: value broadband in field number 5
	  And Add Custom Script Parameter to Run Script within pumpadmin: value true in field number 6  
  	And I click the run button
		And I ensure that the AppFlow status is complete 	
		
	## // Run Manage Client Configuration task
	####################################################################################################	
 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Manage Client Configuration task
		And I select Manage Client Configuration from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next		
		
	Scenario: I select Sandy Satchell from the Client selectable items in the client who was installed appflow
		Then 'Please select client to configure' is visible on screen
		Then I select Sandy Satchell from the Client selectable items in the client who was installed appflow		
		And I click next	
		
	## // ALERTS
	## Confirm default settings for First Morning Activity - no activity alert scenario
	####################################################################################################
	Scenario: Confirm default settings for First Morning Activity - no activity alert scenario
		## Given 'Scenario Configuration' is visible on screen
		Given 'Please configure the settings for the client' is visible on screen
 
		## Alerts
		And 'First Morning Activity - no activity alert' is visible on screen
		
		## Option
		Then I select the item, with the text partially containing: .*Auto-Learning.* , from the drop down list with the attribute name and value alerts_row00_method
		Then I select the item, with the text partially containing: .*Default values.* , from the drop down list with the attribute name and value alerts_row00_method
		Then I select the item, with the text partially containing: .*Specific values for this client.* , from the drop down list with the attribute name and value alerts_row00_method
		
		## Default values
		And I confirm table cell content 'non-csv: contains': Time to be out of bed by: 11:00, located by row number 2 and column 3, whose ancestor element contains attribute name and value alerts

	## // Case 8533: Change minimum alert threshold to 8 minutes - START
	##
	## // Description 
	## Sets the alert threshold to 7 to trigger validation message, then sets to minimum value of 8.
	####################################################################################################
			
	Scenario: No movement: Confirm that a validation message appears when we enter a number below the threshold.
		Then Add 7 to input field whose ancestor element contains attribute name and value alerts_row01_mins
		And  I click next
		Then 'value of 7 is less than the minimum 8' is visible on screen
		
		## Enter the minimum threshold number.
		Then Add 8 to input field whose ancestor element contains attribute name and value alerts_row01_mins
		
	## // Case 8533: Change minimum alert threshold to 8 minutes - END
	####################################################################################################
		
	## // INSIGHTS
	## Confirm default settings for Fridge door not opened frequently - AI scenario
	####################################################################################################		
	Scenario: Confirm default settings for Fridge door not opened frequently - AI scenario
		## Alerts
		And 'Fridge door not opened frequently - AI' is visible on screen
		
		## Option
		Then I select the item, with the text partially containing: .*Auto-Learning.* , from the drop down list with the attribute name and value insights_row00_method
		Then I select the item, with the text partially containing: .*Default values.* , from the drop down list with the attribute name and value insights_row00_method
		Then I select the item, with the text partially containing: .*Specific values for this client.* , from the drop down list with the attribute name and value insights_row00_method
		
		## Default values
		And I confirm table cell content 'non-csv: contains': Appliance must be used 3 times per day, for 3 days in a row, located by row number 2 and column 3, whose ancestor element contains attribute name and value insights				
		
	  ## Client-Specific values: 
	  ## Times/Day
		And I confirm table cell content 'non-csv: contains': Times/Day, located by row number 2 and column 4, whose ancestor element contains attribute name and value insights
		And I confirm the content 1 is present within the input, whose ancestor element contains attribute name and value insights_row00_times		
		## Days
		And I confirm table cell content 'non-csv: contains': Days, located by row number 2 and column 6, whose ancestor element contains attribute name and value insights
		And I confirm the content 7 is present within the input, whose ancestor element contains attribute name and value insights_row00_days

	
	## // Case 6384: Config pages redraft - START - END
	####################################################################################################							