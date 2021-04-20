# Author: jason.carney@anthropos.io

# Keywords Summary:
#
# 8188 Create a Device Slot tagging system:
# Pet sensitivity, PIR sensitvity, device sensitivity,
# Device rules, sensitivity tag
#
# 9663 Tag for switching off lights on smart plug:
# disable LED on Smartplugs, re-enable LED on Smartplugs, apply no light on Smartplug rule

# This feature covers: 5651, 8188

Feature: Limit low battery alerts, configure PIR sensitivity
  
  5651: Checks that alerts are not generated for non-live ie disabled devices.
	Checks that only 1 battery alert (when multiple battery alerts are sent) appears within a 24 hour period. 
	
	8188 Create a Device Slot tagging system:
	Assign a device different levels of sensitivity such as low, medium and high.
	This is useful for clients that have pets. Being able to change PIR sensitivity can help the system get
	better readings for the client, so to ignore activity triggered by a pet.	
	NOTE: This only applies to PIRS
	
	XXX NOTE:
	There is no gherkin to check the battery low message that should display in the service status table.
	This is because there has been many transient failures in the overnight tests.
		
	9663 Tag for switching off lights on smart plug:
	Disables the illumination on Smartplugs for clients who dont want the light lit up.
		
	## // Refixture
	################################################################################################################
	
  Scenario: Reset data
  	Given Normalise the dashboard  
  	
	## // Case 5651: limit low battery alerts - START
	##
	## // Description 
	## ...
	###############################################################################################################  	

	## Test for non repeating battery service status messages 
	################################################################################################################

 	Scenario: Head to Pumphouse IoT Testing and select client john jenkins 
 		Given Pump IoT: I go to PumpHouse IoT Test Tool
		And Pump IoT: I select John Jenkins from the drop down list with the attribute id and value client
		And Pump IoT: I click Continue with the attribute id and value continue

	Scenario: Clear iot data, set device as fridge, set low batery 
		Given Pump IoT: I check the checkbox with the attribute id and value cleardata	
		And Pump IoT: I select Fridge from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Low Battery from the drop down list with the attribute id and value event_1
		And Pump IoT: I enter 00:20 in the input field with the attribute id and value time_1
		And Pump IoT: I click Run with the attribute id and value query
		
  Scenario: Login to the admin.iotaa dashboard. 'Battery low' message should display in Service Status table.   
    Given Anthropos admin - login with admin.iotaa
    And 'Frequent Tasks' is visible on screen
  	
 	Scenario: Head to Pumphouse IoT Testing and select client john jenkins 
 		Given Pump IoT: I go to PumpHouse IoT Test Tool
		And Pump IoT: I select John Jenkins from the drop down list with the attribute id and value client
		And Pump IoT: I click Continue with the attribute id and value continue
			
	Scenario: set device as fridge, set low batery 	
		And Pump IoT: I select Fridge from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Low Battery from the drop down list with the attribute id and value event_1
		And Pump IoT: I enter 00:25 in the input field with the attribute id and value time_1
		And Pump IoT: I click Run with the attribute id and value query		
		
  Scenario: Login to the admin.iotaa dashboard. Confirm there is ONLY 1 fridge low battery message in the service status table.    
    Given Anthropos admin - login with admin.iotaa
    And 'Frequent Tasks' is visible on screen
	  	
	## test for no service status messages when device is disabled 
	################################################################################################################

  Scenario: Login to the admin.iotaa dashboard    
    Given Anthropos admin - login with admin.iotaa
    And 'Frequent Tasks' is visible on screen    			
  	And I select Configure Client Residences from the drop down list in the sidebar appflow for All Available Tasks
  	And I click Run Task in the All Available Tasks appflow
  	
	Scenario: Select customer - Home Instead
		Given 'Select customer' is visible on screen				
		And I select Home Instead in the Customer multi select list
		And I click next
		
	Scenario: Select office - Bristol
		Given 'Select office' is visible on screen		
		And I select Bristol in the Office multi select list
		And I click next	
		
	Scenario: Select client - John Jenkins
		Given 'select client whose residence needs to be configured' is visible on screen		
		##And I select John Jenkins in the select client whose residence needs to be configured multi select list
		And I click next	
		
	Scenario: Select Edit device statuses from Editing Residence screen
		Given 'Editing Residence' is visible on screen		
		And I select the item, with the text partially containing: Edit device Statuses , from the drop down list with the attribute name and value editResidence
		And I click next
		
	Scenario: Set Hallway motion sensor to disabled
		Given 'Status of hub' is visible on screen		
		And I select the item, with the text partially containing: DISABLED , from the drop down list with the attribute name and value deviceTable_row10
		And I click next

	Scenario: Go to pump iot tool and select john jenkins
		Given Pump IoT: I go to PumpHouse IoT Test Tool
		And Pump IoT: I select John Jenkins from the drop down list with the attribute id and value client
		And Pump IoT: I click Continue with the attribute name and value continue

	Scenario: Clear previous iot data > device=hallway > event=low battery > day=today > time=00:30 > run
		Given Pump IoT: I check the checkbox with the attribute id and value cleardata
		And Pump IoT: I select Hallway Motion Sensor from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Low Battery from the drop down list with the attribute id and value event_1
		And Pump IoT: I select Today from the drop down list with the attribute id and value day_1
		And Pump IoT: I enter 00:30 in the input field with the attribute id and value time_1
		
	Scenario: Run IoT query
		And Pump IoT: I click Run with the attribute name and value query

  Scenario: Login as admin.iotaa > confirm there is NO hallway low battery message in the service status table (covers case: 5651)
    Given Anthropos admin - login with admin.iotaa
    And I confirm battery low is not visible
    
	## // Case 5651: limit low battery alerts - END
	###############################################################################################################    

	## // Case 8188: Create a Device Slot tagging system, 
	## 9663: Tag for switching off lights on smart plug - START
	##
	## // Description 
	## 8188: Sets the medium sensitivity to the Living room PIR for John Jenkins. Triggers an event so that settings are
	## applied to the PIR, and confirms settings have been applied. Then, sets PIR sensitivity back to the default
	## level and confirms the default has been applied.
	##
	## 9663: Sets No illumination rule on the Kettle Smartplug, triggers an event so that settings are
	## applied to the Smartplug, and confirms settings have been applied. Then, sets Smartplug sensitivity back to the default
	## level and confirms the default has been applied.
	###############################################################################################################

	## Add Medium sensitivity rule to Living room PIR
	###############################################################################################################

  Scenario: Login to the admin.iotaa dashboard    
    Given Anthropos admin - login with admin.iotaa   
    And 'Frequent Tasks' is visible on screen
    
  Scenario: Run Configure Client Residences task
  	And I select Configure Client Residences from the drop down list in the sidebar appflow for All Available Tasks
  	And I click Run Task in the All Available Tasks appflow
  	
	Scenario: Select customer - Home Instead
		Given 'Select customer' is visible on screen				
		And I select Home Instead in the Customer multi select list
		And I click next
		
	Scenario: Select office - Bristol
		Given 'Select office' is visible on screen		
		And I select Bristol in the Office multi select list
		And I click next	

	Scenario: Select client - John Jenkins
		Given 'select client whose residence needs to be configured' is visible on screen		
		##And I select John Jenkins in the select client whose residence needs to be configured multi select list
		And I click next	
	
	Scenario: Confirm we are back on Editing Residence screen, then select Edit device rules
		Given 'Editing Residence' is visible on screen
		Then I select the item, with the text partially containing: .*Edit device Rules.* , from the drop down list with the attribute name and value option
		And I click next
		
	Scenario: Select Medium Sensitivity from the Living Room Motion Sensor dropdown list
		Given 'Device Slot' is visible on screen
		Then I select Medium Sensitivity from the aOS styled dropdown, whose ancestor element contains attribute name and value deviceTable_row01_rules

	Scenario: Select No Illumination from the Kettle dropdown list
		Then I select No Illumination from the aOS styled dropdown, whose ancestor element contains attribute name and value deviceTable_row04_rules
		And I click next
		
	Scenario: Confirm we are back on Editing Residence screen, after updating Living Room Motion Sensor PIR sensittivity
		Given 'Editing Residence' is visible on screen		

	## Run iot query to make sure default pir sensitivity takes affect immediately
	###############################################################################################################
			
	Scenario: Go to pump iot tool and select john jenkins
		Given Pump IoT: I go to PumpHouse IoT Test Tool
		And Pump IoT: I select John Jenkins from the drop down list with the attribute id and value client
		And Pump IoT: I click Continue with the attribute name and value continue
	
	Scenario: Select Living Room Motion Sensor and generate Configure Device (w/rules) event	
		And Pump IoT: I select Living Room Motion Sensor from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Configure Device (w/rules) from the drop down list with the attribute id and value event_1
		And Pump IoT: I enter 0 in the input field with the attribute id and value time_1
		
	Scenario: Select Kettle Smartplug and generate Configure Device (w/rules) event			
		And Pump IoT: I select Kettle Smartplug from the drop down list with the attribute id and value device_2
		And Pump IoT: I select Configure Device (w/rules) from the drop down list with the attribute id and value event_2
		And Pump IoT: I enter 0 in the input field with the attribute id and value time_2
		
	Scenario: Run IoT query
		And Pump IoT: I click Run with the attribute name and value query		
		
	## Confirm Sensitiviy rule for the Living room PIR has taken affect in the Device Configuration report
	###############################################################################################################		
		
  Scenario: Login to the admin.iotaa dashboard    
    Given Anthropos admin - login with admin.iotaa   
    And 'Frequent Tasks' is visible on screen		
		
	Scenario: Run Device Configuration Report
		And I select Device Configuration Report from the drop down list in the sidebar appflow for All Available Reports
		And I click Run Report in the All Available Reports appflow			
		
	Scenario: Select customer
		Given 'Select customer' is visible on screen	
  	Then select row Home Instead from single select appflow panel
  	And I click next
  	
	Scenario: I select Bristol office
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next	  	
		
	Scenario: Select PIRs so to examine configuration
		Given 'Type of Device to examine configuration for' is visible on screen
		Then I select the item, with the text partially containing: PIRs , from the drop down list with the attribute name and value details
		And I click next
		
	## Table row will now be green simulating that the settings would take affect in a production environment
	Scenario: Confirm Living is set to Medium sensitivity
		Given 'Motion detection - sensitivity' is visible on screen
		And '(Medium Sensitivity=45)' is visible on screen	
		Then I click back
		
	Scenario: Select Smartplugs so to examine configuration
		Given 'Type of Device to examine configuration for' is visible on screen
		Then I select the item, with the text partially containing: Smartplugs , from the drop down list with the attribute name and value details
		And I click next	
		
	## Table row will now be green simulating that the No illumination settings would take affect in a production environment
	Scenario: Confirm illumination has been turned off for Smartplugs
		Given 'Illumination turned off completely' is visible on screen
		And '(No Illumination=0)' is visible on screen	
		Then I click back
	
	## Remove sensitivity rule so to go back to default
	###############################################################################################################
		
  Scenario: Login to the admin.iotaa dashboard    
    Given Anthropos admin - login with admin.iotaa   
    And 'Frequent Tasks' is visible on screen
    
  Scenario: Run Configure Client Residences task
  	And I select Configure Client Residences from the drop down list in the sidebar appflow for All Available Tasks
  	And I click Run Task in the All Available Tasks appflow
  	
	Scenario: Select customer - Home Instead
		Given 'Select customer' is visible on screen				
		And I select Home Instead in the Customer multi select list
		And I click next
		
	Scenario: Select office - Bristol
		Given 'Select office' is visible on screen		
		And I select Bristol in the Office multi select list
		And I click next	
		
	Scenario: Select client - John Jenkins
		Given 'select client whose residence needs to be configured' is visible on screen		
		##And I select John Jenkins in the select client whose residence needs to be configured multi select list
		And I click next			

	Scenario: Confirm we are back on Editing Residence screen, then select Edit device rules
		Given 'Editing Residence' is visible on screen
		Then I select the item, with the text partially containing: .*Edit device Rules.* , from the drop down list with the attribute name and value option
		And I click next
		
	Scenario: Select Medium Sensitivity from the Living Room Motion Sensor dropdown list, then remove it
		Given 'Device Slot' is visible on screen
	 	And using the text 'Medium Sensitivity' as an anchor, click the link 'X' which is '1' levels above
	 	
	Scenario: Select No illumination from the Kettle dropdown list, then remove it		
	 	Then using the text 'No Illumination' as an anchor, click the link 'X' which is '1' levels above
	 	
		And I click next	
		
	## Run iot query to make sure default pir sensitivity takes affect immediately
	###############################################################################################################
			
	Scenario: Go to pump iot tool and select john jenkins
		Given Pump IoT: I go to PumpHouse IoT Test Tool
		And Pump IoT: I select John Jenkins from the drop down list with the attribute id and value client
		And Pump IoT: I click Continue with the attribute name and value continue
	
	Scenario: Clear previous iot data > device=hallway > event=low battery > day=today > time=00:30 > run			
		And Pump IoT: I select Living Room Motion Sensor from the drop down list with the attribute id and value device_1
		And Pump IoT: I select Configure Device (w/rules) from the drop down list with the attribute id and value event_1
		And Pump IoT: I enter 0 in the input field with the attribute id and value time_1
		
	Scenario: Select Kettle Smartplug and generate Configure Device (w/rules) event			
		And Pump IoT: I select Kettle Smartplug from the drop down list with the attribute id and value device_2
		And Pump IoT: I select Configure Device (w/rules) from the drop down list with the attribute id and value event_2
		And Pump IoT: I enter 0 in the input field with the attribute id and value time_2		
		
	Scenario: Run IoT query
		And Pump IoT: I click Run with the attribute name and value query

	## Confirm the Living room PIR has the default sensitivity
	###############################################################################################################
	
  Scenario: Login to the admin.iotaa dashboard    
    Given Anthropos admin - login with admin.iotaa   
    And 'Frequent Tasks' is visible on screen
		
	Scenario: Run Device Configuration Report
		And I select Device Configuration Report from the drop down list in the sidebar appflow for All Available Reports
		And I click Run Report in the All Available Reports appflow			
		
	Scenario: Select customer
		Given 'Select customer' is visible on screen	
  	Then select row Home Instead from single select appflow panel
  	And I click next
  	
	Scenario: I select Bristol office
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next	  	
		
	Scenario: Select PIRs so to examine configuration
		Given 'Type of Device to examine configuration for' is visible on screen
		Then I select the item, with the text partially containing: PIRs , from the drop down list with the attribute name and value details
		And I click next
		
	## Table row will still be green, simulating that the DEFAULT sensitivity would take affect in a production environment
	Scenario: Confirm Living is set to Medium sensitivity
		Given 'Motion detection - sensitivity' is visible on screen
		And I confirm (Medium Sensitivity=45) is not visible	
		Then I click back

	Scenario: Select Smartplugs so to examine configuration
		Given 'Type of Device to examine configuration for' is visible on screen
		Then I select the item, with the text partially containing: Smartplugs , from the drop down list with the attribute name and value details
		And I click next	
		
	## Table row will now be green simulating that the No illumination settings is no longer applied in a production environment
	Scenario: Confirm Illumination turned off completely
		Given I confirm Illumination turned off completely is not visible	
		Then I click back		
	
	## // Case 8188: Create a Device Slot tagging system
	## 9663: Tag for switching off lights on smart plug - END
	###############################################################################################################		