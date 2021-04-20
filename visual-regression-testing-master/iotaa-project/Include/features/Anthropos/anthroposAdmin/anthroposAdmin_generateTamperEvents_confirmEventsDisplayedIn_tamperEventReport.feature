# Author: 
# jason.carney@anthropos.io

# Keywords Summary:
# temper alert, trigger tamper alert, run tamper report

Feature: Title of your feature
	
	9558 Implement Tamper Reports:
	Generate Tamper events for the Living room and Front door.
	As an Anthropos user, run the Temper Event Report and confirm the Tamper events generated appear
	in the report.

	## // Case 9558: Implement Tamper Reports - START
	##
	##  
	## 
	####################################################################################################

	## Generate Tamper events for the Living room and Front door.
	####################################################################################################

	Scenario: Navigate to Pump IoT Tool and select client John Jenkins
		Given Pump IoT: I go to PumpHouse IoT Test Tool
		Then Pump IoT: I select John Jenkins from the drop down list with the attribute id and value client
		And Pump IoT: I click button with the attribute id and value continue
		
	Scenario: Configure settings so to trigger event Tamper
		## Clear previous IOT data	
		Given Pump IoT: I check the checkbox with the attribute id and value cleardata
	
		## Select Living room PIR, Event, Day and Time
		And Pump IoT: I select Living Room Motion Sensor from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Tamper Alert from the drop down list with the attribute id and value event_1
		And Pump IoT: I select Today from the drop down list with the attribute id and value day_1
		And Pump IoT: I enter 07:00 in the input field with the attribute id and value time_1
		
		## Select Front door sensor, Event, Day and Time
		And Pump IoT: I select Front Door Sensor from the drop down list with the attribute id and value device_2
		And Pump IoT: I select Tamper Alert from the drop down list with the attribute id and value event_2
		And Pump IoT: I select Today from the drop down list with the attribute id and value day_2
		And Pump IoT: I enter 11:00 in the input field with the attribute id and value time_2	
	
		## Run the IOT query 
		And Pump IoT: I click run with the attribute id and value query	

	## As an Anthropos user, run the Temper Event Report and confirm the Tamper events generated appear
	## in the report.
	####################################################################################################
	
 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Tamper Event Report
		And I select Tamper Event Report from the drop down list in the sidebar appflow for All Available Reports
		And I click Run Report in the All Available Reports appflow	 

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next		
		
	Scenario: I select John Jenkins from the Client selectable items in the client who was installed appflow
		Then 'View Event alerts for clients' is visible on screen
		##Then I select John Jenkins from the Client selectable items in the client who was installed appflow		
		And I click next	
		
	Scenario: Confirm client John Jenkins, the device names which generated the tamper events, and alert tamper message are displayed
		Given I confirm 'John Jenkins' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.reporting.tamper.internal'
		Given I confirm 'Living Room Motion Sensor' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.reporting.tamper.internal'
		Given I confirm 'Front Door Sensor' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.reporting.tamper.internal'
		Given I confirm 'Tampering' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.reporting.tamper.internal'
		Given I confirm 'Cover Removed' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.reporting.tamper.internal'
	
	## // Case 9558: Implement Tamper Reports - END
	####################################################################################################
	
	