# Author: 
# jason.carney@anthropos.io

# Keywords Summary:
#
# 7828 Engineering Alert options:
#

# This feature covers cases: 
# 7828

Feature: xxx
  
  7828 Engineering Alert options:
  
	## // Refixture
	################################################################################################################
	
	Scenario: Reset data
  	Given Normalise the dashboard    
   
	## ) run NewAnthroposOrderAndInstallScript for Daisy Decker

 	Scenario: Create and install an order 
  	Given I navigate to PumpAdmin Scripts list
  	And I select com.pumpco.iotaa.NewAnthroposOrderAndInstallScript script 
  	And Add Custom Script Parameter to Run Script within pumpadmin: value fname in field number 1
	  And Add Custom Script Parameter to Run Script within pumpadmin: value Daisy in field number 2
	  And Add Custom Script Parameter to Run Script within pumpadmin: value sname in field number 3
	  And Add Custom Script Parameter to Run Script within pumpadmin: value Decker in field number 4
	  And Add Custom Script Parameter to Run Script within pumpadmin: value broadband in field number 5
	  And Add Custom Script Parameter to Run Script within pumpadmin: value true in field number 6 
  	And I click the run button
		And I ensure that the AppFlow status is complete 	
		
	## put hub live so we can trigger alerts and service issues to display on dashboard
	## login as iotaa.tech > run Configure Client Residences > HI > brsitol > Daisy Decker > Edit device statues > in Status of hub 
	## dropdown set to LIVE > clck next > confim live LIVE displayed in hub row
 	
 	Scenario: Login as iotaa tech dashboard
		Given iotaa tech - login with iotaa.tech
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Configure Configure Client Residences task
		And I select Configure Client Residences from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next		
		
	Scenario: I select Daisy Decker from the Client selectable items in the client who was installed appflow
		Then 'select client whose residence needs to be configured' is visible on screen
		Then I select Daisy Decker from the select client whose residence needs to be configured selectable items in the select client appflow		
		And I click next	
		
	Scenario: 'Editing Residence: Daisy Decker's house
		Given 'Editing Residence: Daisy Decker' is visible on screen
		Then I select the item, with the text partially containing: .*Edit device Statuses.* , from the drop down list with the attribute name and value option
		And I click next
		
	Scenario: Set hub to LIVE
		Given 'Status of hub' is visible on screen
		Then I select the item, with the text partially containing: .*LIVE.* , from the drop down list with the attribute name and value hubStatus
		And I click next
		
	Scenario: Confirm Daisy Deckers hub is now online
		Given 'Editing Residence: Daisy Decker' is visible on screen
		Then I confirm table cell content 'contains': LIVE, located by row number 2 and column 10, whose ancestor element contains attribute name and value residence
		
	## ) head to pump iot > select Daisy Decker > remove iot data > device=hub, event=offline, time=0 
	## > heartbeats and zwave unchecked > run query > (in gherkin run template__generateHubOfflineEvent_withNoTimeDelay template)

	Scenario: Navigate to pump admin and select client Daisy Decker
		Given Pump IoT: I go to PumpHouse IoT Test Tool
		Then Pump IoT: I select Daisy Decker from the drop down list with the attribute id and value client
		And Pump IoT: I click button with the attribute id and value continue
		
	Scenario: Configure settings so to trigger event for hub offline 
		## Clear previous IOT data	
		Given Pump IoT: I check the checkbox with the attribute id and value cleardata
		
		## Select Device, Event, Day and Time
		And Pump IoT: I select Hub from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Hub Offline (alert) from the drop down list with the attribute id and value event_1
		And Pump IoT: I select Today from the drop down list with the attribute id and value day_1
		And Pump IoT: I enter 0 in the input field with the attribute id and value time_1		
	
		## Set time to 12pm so to avoid timeing issue
		# JC dont htink we need !... And Pump IoT: I enter 12:00 in the input field with the attribute id and value desiredTime
	
		## Clear heartbeats and Zwave activity (so we can actually trigger a hub offline event)
		And Pump IoT: I uncheck the checkbox with the attribute id and value heartbeat
		And Pump IoT: I uncheck the checkbox with the attribute id and value zwave
	
		## Check for Active Incidents
		And Pump IoT: I select Check for Active Incidents from the drop down list with the attribute id and value job	
	
		## Run the IOT query 
		And Pump IoT: I click run with the attribute id and value query		
		
	## Run ClientSystemStatus job to expedite the service issue to display on the Family app
	Scenario: Navigate to Pump Admin home page
		Given I open the web browser
		Then Pump Admin: I go to Pump Admin		
		And 'Welcome To Pumphouse Administration' is visible on screen	
		
	Scenario: Run ClientSystemStatus job 
		Given Pump Admin: I select the main menu item Jobs
		Then Pump Admin: I select ClientSystemStatus from the dropdown list, which contains attribute id and value job
		Then Pump Admin: I click the element with the attribute id and value query

	## ) login as iotaa.tech > Select the alert for Daisy Decker > select Acknowledge Incident for Daisy Decker 
	## > enter message "Acknowledging hub offline alert for Daisy Decker" > confirm the alert is no longer in the alerts container
	
  Scenario: Login to the iotaa.tech dashboard
		Given iotaa tech - login with iotaa.tech
    Then 'Frequent Tasks' is visible on screen
    Then I expand the dashboard container with the title heading Alerts
		And using the text 'Daisy Decker' as an anchor, click the link with attribute 'class' and value 'btn-expander', '2' levels above
		And using the text 'Daisy Decker' as an anchor, click the link with attribute 'data-bind' and value 'alerts-action', '2' levels above

  Scenario: Select acknowledge incident
  	Given 'Client incident for Daisy Decker' is visible on screen
  	Then I select the item, with the text partially containing: .*Acknowledge incident.* , from the drop down list with the attribute name and value action
    Then I click next
    
  Scenario: Enter acknowledgement message
  	Given 'Acknowledge incident & update status' is visible on screen
  	Then Add As an iotaa.tech user, i have Acknowledged the hub offline alert for Daisy Decker to input field whose ancestor element contains attribute name and value update
  	Then I click next
  
	Scenario: Click manage button in service issues table
		Given 'Frequent Tasks' is visible on screen
		And 'Decker' is visible on screen
  	  	
	## ) Select the service issue > select Daisy Decker hub offline > select update current action 
	## > enter the message "Updating service issue via service status issue" > confirm that message is displayed on the following screen
		
	Scenario: Run Configure Manage Service Issues task
		And I select Manage Service Issues from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 		
		
	Scenario: Select Daisy Deckers hub offline from issue to manage dropdown
		Given 'Issue to manage' is visible on screen
		Then I select the item, with the text partially containing: .*Daisy Decker Hub offline.* , from the drop down list with the attribute name and value option
		Then I click next
		
	Scenario: Selection Update current action from Choice dropdown
		Then I confirm 'Manage Issue: Daisy Decker Hub offline' is visible within the screen whose ancestor contains attribute 'name' and value 'anthropos.form.service.issues.manage'
		Then I select the item, with the text partially containing: .*Update Current Action.* , from the drop down list with the attribute name and value option
		Then I click next		
		
	Scenario: Update message for Daisy Decker Hub offline
		Then I confirm 'Update current action for Daisy Decker Hub offline' is visible within the screen whose ancestor contains attribute 'name' and value 'anthropos.form.service.issues.manage'
		Then Add As an iotaa.tech user, i have updated the service issue via Service Issues status table to input field whose ancestor element contains attribute name and value update
		Then I click next		
		
	Scenario: Confirm updated message appears
		Then 'As an iotaa.tech user, i have updated the service issue via Service Issues status table' is visible on screen
		
	## negative a/c: confirm service issue is displayed in the office dash
  Scenario: Login to the Office
		Given Office - login with bristol.office
    Then 'Frequent Tasks' is visible on screen    
    And I expand the dashboard container with the title heading Service Status
    And 'As an iotaa.tech user, i have updated the service issue via Service Issues status table' is visible on screen    	
  	
    