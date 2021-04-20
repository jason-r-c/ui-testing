# Author: 
# jason.carney@anthropos.io

# Keywords Summary:
#
# 4504 Create battery incident based on threshold:
# alerts when battery level low, service issue when battery level low, trigger alert based on battery threshold
# trigger service issue based on battery threshold

# This feature covers cases: 
# 4504, 8352

# ORIGINAL FEATURE:
# This feature should NOT have other tests / gherkin added to it, so to not cause confusion for the reader.

Feature: anthroposAdmin_singleBatteryEventNoAlert_doubleBatteryEventTriggersAlert_batteryEventGreaterThanThresholdNoAlert
  
  4504 Create battery incident based on threshold,
  8352 change low door battery threshold to 35%:  
  The test creates 'battery replace' alerts and service issues, based on a threshold.
  The thresholds are: 2 battery incidents under 70% for PIRs, and 35% for door sensors.
  These can be forwarded onto the franchises.
    
  ## // Case 4504: Create battery incident based on threshold,
  ## Case 8352 change low door battery threshold to 35%: - START
	##
	## // Description 
	## Generates battery events to prove alerts and service issues ARE NOT triggered and ARE triggered.
	####################################################################################################

	## // Refixture
	################################################################################################################
	
	Scenario: Reset data
  	Given Normalise the dashboard 
  	
	## // Confirm a single battery event does not generate alert or service issue
	####################################################################################################
	
	Scenario: Navigate to Pump IoT Tool and select client John Jenkins
		Given Pump IoT: I go to PumpHouse IoT Test Tool
		Then Pump IoT: I select John Jenkins from the drop down list with the attribute id and value client
		And Pump IoT: I click button with the attribute id and value continue
		
	Scenario: Configure settings so to trigger event x
		## Clear previous IOT data	
		Given Pump IoT: I check the checkbox with the attribute id and value cleardata
				
		## Living room motion sensor
		And Pump IoT: I select Living Room Motion Sensor from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Battery 25% from the drop down list with the attribute id and value event_1
		And Pump IoT: I select Today from the drop down list with the attribute id and value day_1
		And Pump IoT: I enter -2 in the input field with the attribute id and value time_1
	
		## Front door sensor
		And Pump IoT: I select Front Door Sensor from the drop down list with the attribute id and value device_2
		And Pump IoT: I select Battery 25% from the drop down list with the attribute id and value event_2
		And Pump IoT: I select Today from the drop down list with the attribute id and value day_2
		And Pump IoT: I enter -2 in the input field with the attribute id and value time_2
		
		## Set devices live to 10 days ago
		And Pump IoT: I enter 10 in the input field with the attribute name and value devicesLiveDays
	
		## Run the IOT query 
		And Pump IoT: I click run with the attribute id and value query	
				
	Scenario: Login to the Iotaa tech dashboard
		Given Iotaa tech - login with iotaa.tech
    Then 'Frequent Tasks' is visible on screen
  
  Scenario: Confirm alerts and servie issues not displayed
		And I confirm John Jenkins: Bedroom Motion Sensor battery is low (25%) and needs replacing is not visible 
		And I confirm John Jenkins: Front Door Sensor battery is low (25%) and needs replacing is not visible
		And I confirm battery low is not visible		
		
	## // Confirm alert and service issue displayed when at least 2 battery low events occur in a month
	####################################################################################################

	Scenario: Navigate to Pump IoT Tool and select client John Jenkins
		Given Pump IoT: I go to PumpHouse IoT Test Tool
		Then Pump IoT: I select John Jenkins from the drop down list with the attribute id and value client
		And Pump IoT: I click button with the attribute id and value continue
		
	Scenario: Run another event for living room and front door so to generate alers and service issues
		## Living room motion sensor
		And Pump IoT: I select Living Room Motion Sensor from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Battery 25% from the drop down list with the attribute id and value event_1
		And Pump IoT: I select Today from the drop down list with the attribute id and value day_1
		And Pump IoT: I enter 0 in the input field with the attribute id and value time_1		
		
		## Front door sensor
		And Pump IoT: I select Front Door Sensor from the drop down list with the attribute id and value device_2
		And Pump IoT: I select Battery 25% from the drop down list with the attribute id and value event_2
		And Pump IoT: I select Today from the drop down list with the attribute id and value day_2
		And Pump IoT: I enter 0 in the input field with the attribute id and value time_2
		
		## Set devices live to 10 days ago
		And Pump IoT: I enter 10 in the input field with the attribute name and value devicesLiveDays
	
		## Run the IOT query 
		And Pump IoT: I click run with the attribute id and value query		
	
	Scenario: Login to the Iotaa tech dashboard
		Given Iotaa tech - login with iotaa.tech
    Then 'Frequent Tasks' is visible on screen
		
	Scenario: confirm alerts and service issues
		Then 'John Jenkins: Living Room Motion Sensor battery is low (25%) and needs replacing' is visible on screen
		Then 'John Jenkins: Front Door Sensor battery is low (25%) and needs replacing' is visible on screen		
		Then I confirm 'Living Room Motion Sensor' is visible within the screen whose ancestor contains attribute 'params' and value 'data:$data.serviceStatus'
		Then I confirm 'Front Door Sensor' is visible within the screen whose ancestor contains attribute 'params' and value 'data:$data.serviceStatus'
			
	## // Confirm battery events of greater than 70% do not generate alert or service issue
	####################################################################################################

	Scenario: Navigate to Pump IoT Tool and select client John Jenkins
		Given Pump IoT: I go to PumpHouse IoT Test Tool
		Then Pump IoT: I select John Jenkins from the drop down list with the attribute id and value client
		And Pump IoT: I click button with the attribute id and value continue

	Scenario: Run another event for living room and front door so to generate alers and service issues
		## Clear previous IOT data	
		Given Pump IoT: I check the checkbox with the attribute id and value cleardata
				
		## Living room motion sensor
		And Pump IoT: I select Living Room Motion Sensor from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Battery 80% from the drop down list with the attribute id and value event_1
		And Pump IoT: I select Today from the drop down list with the attribute id and value day_1
		And Pump IoT: I enter -2 in the input field with the attribute id and value time_1
		
		## Living room motion sensor 2
		And Pump IoT: I select Living Room Motion Sensor from the drop down list with the attribute id and value device_2
		And Pump IoT: I select Battery 80% from the drop down list with the attribute id and value event_2
		And Pump IoT: I select Today from the drop down list with the attribute id and value day_2
		And Pump IoT: I enter 0 in the input field with the attribute id and value time_2
		
		## Front door sensor
		And Pump IoT: I select Front Door Sensor from the drop down list with the attribute id and value device_3
		And Pump IoT: I select Battery 80% from the drop down list with the attribute id and value event_3
		And Pump IoT: I select Today from the drop down list with the attribute id and value day_3
		And Pump IoT: I enter -2 in the input field with the attribute id and value time_3	
		
		## Front door sensor 2
		And Pump IoT: I select Front Door Sensor from the drop down list with the attribute id and value device_4
		And Pump IoT: I select Battery 80% from the drop down list with the attribute id and value event_4
		And Pump IoT: I select Today from the drop down list with the attribute id and value day_4
		And Pump IoT: I enter 0 in the input field with the attribute id and value time_4
		
		## Set devices live to 10 days ago
		And Pump IoT: I enter 10 in the input field with the attribute name and value devicesLiveDays
	
		## Run the IOT query 
		And Pump IoT: I click run with the attribute id and value query		
		
	Scenario: Login to the Iotaa tech dashboard
		Given Iotaa tech - login with iotaa.tech
    Then 'Frequent Tasks' is visible on screen
		
	Scenario: confirm alerts and service issues
		Then I confirm John Jenkins: Living Room Motion Sensor battery is low (25%) and needs replacing is not visible
		Then I confirm John Jenkins: Front Door Sensor battery is low (25%) and needs replacing is not visible		

	## // Case 4504: Create battery incident based on threshold,
	## Case 8352 change low door battery threshold to 35%: - END
	####################################################################################################