#Author: chris.covell@anthropos.io
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
# Tests: Compounding devices
# Cases 4532, 4719

Feature: Manage residences
  Check that we can manage residences
  
  Scenario: Create order using Pump Admin
  	Given I navigate to PumpAdmin Scripts list
  	And I select com.pumpco.iotaa.NewAnthroposOrderAndInstallScript script
  	And Add Custom Script Parameter to Run Script within pumpadmin: value fname in field number 1
  	And Add Custom Script Parameter to Run Script within pumpadmin: value Robin in field number 2
  	And Add Custom Script Parameter to Run Script within pumpadmin: value sname in field number 3
  	And Add Custom Script Parameter to Run Script within pumpadmin: value Reliant in field number 4
  	And Add Custom Script Parameter to Run Script within pumpadmin: value broadband in field number 5
  	And Add Custom Script Parameter to Run Script within pumpadmin: value true in field number 6
  	And I click the run button
  	
  Scenario: Log on as Admin and edit the residence
  	Given Head Office - login with admin.iotaa
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Admin IoTAA is visible
  	And 'Frequent Tasks' is visible on screen
  	
  	Then I select Configure Client Residences from the drop down list in the sidebar appflow for All Available Tasks
  	And I click Run Task in the All Available Tasks appflow
  	
  Scenario: Select the residence
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Given I confirm Select customer is visible
  	And 'Select customer' is visible on screen
  	
  	Then I select Home Instead in the Customer multi select list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Select office is visible
  	And 'Select office' is visible on screen
  	
  	Then I select Bristol in the Office multi select list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm select client whose residence needs to be configured is visible
  	And 'select client whose residence needs to be configured' is visible on screen
  	
  	Then I select Robin Reliant in the select client whose residence needs to be configured multi select list
  	And I click next
  	
  Scenario: Edit the residence
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Given I confirm Editing Residence: Robin Reliant is visible
  	And 'Editing Residence: Robin Reliant' is visible on screen
  	
  	Then I select Edit location from the Select action to perform drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select Location to Edit is visible
  	And 'Select Location to Edit' is visible on screen
  	
  	And I select Kitchen from the Select Location drop down list
  	And I click next
  	
  Scenario: Compound kitchen door sensors
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Given I confirm Editing Kitchen is visible
  	And 'Editing Location' is visible on screen
  	
  	Then I select Edit device from the Action drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select device to edit is visible
  	And 'Select device to edit' is visible on screen
  	
  	And I select Back Door from the device drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Back Door is visible
  	And 'Editing device' is visible on screen
  	
  	And I select Add sub-device (compound devices) from the Option drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Add new sub-device is visible
  	And 'Add new sub-device' is visible on screen
  	
  	And I select Fibaro Fibaro.Door from the Type of device drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Back Door is visible
  	And 'Editing device' is visible on screen
  	
  	And I select Return to location from the Option drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing Kitchen is visible
  	And 'Editing Location' is visible on screen
  	
  	And I select Return to editing residence from the Action drop down list
  	And I click next
  	# The above (sort of) tests 4594. It exercises the screens but i can't tell if the row is not red
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Editing Residence: Robin Reliant is visible
  	And 'Editing Residence: Robin Reliant' is visible on screen
  	
 	Scenario: Remove compound device
 		Then I select Edit location from the Select action to perform drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select Location to Edit is visible
  	And 'Select Location to Edit' is visible on screen
  	
  	And I select Kitchen from the Select Location drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Given I confirm Editing Kitchen is visible
  	And 'Editing Location' is visible on screen
  	
  	Then I select Edit device from the Action drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select device to edit is visible
  	And 'Select device to edit' is visible on screen
  	
  	And I select Back Door from the device drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Back Door is visible
  	And 'Editing device' is visible on screen
  	
  	And I select Remove sub-device (compound devices) from the Option drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Remove sub-device is visible
  	And 'Remove sub-device' is visible on screen
  
  	# JCARNEY 6/1/20: Switched to layout independent gherkin
  	# And I string select Back Door node.* from the Device to remove drop down list  	
  	And I select the item, with the text partially containing: Back Door node.* , from the drop down list with the attribute name and value device  	
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Back Door is visible
  	And 'Editing device' is visible on screen
  	
  	And I select Return to location from the Option drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing Kitchen is visible
  	And 'Editing Location' is visible on screen
  	
  	And I select Return to editing residence from the Action drop down list
  	And I click next
  	
  Scenario: Check Bedroom and Bed rules are all correct per device, case 4532
  	Given 'Editing Residence: Robin Reliant' is visible on screen
  	Then I select Edit location from the Select action to perform drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select Location to Edit is visible
  	And 'Select Location to Edit' is visible on screen
  	
  	And I select Bedroom from the Select Location drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Given I confirm Editing Bedroom is visible
  	And 'Editing Location' is visible on screen
  	
  	Then I select Edit device from the Action drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select device to edit is visible
  	And 'Select device to edit' is visible on screen
  	
  	And I select Bedroom from the device drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Bedroom is visible
  	And 'Editing device' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Temperature monitoring is visible
  	And 'Temperature monitoring' is visible on screen
  	
  	Then I select Return to location from the Option drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Given I confirm Editing Bedroom is visible
  	And 'Editing Location' is visible on screen
  	
  	Then I select Edit device from the Action drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select device to edit is visible
  	And 'Select device to edit' is visible on screen
  	
  	And I select Bed from the device drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Bed is visible
  	And 'Editing device' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Bed usage is visible
  	And 'Bed usage' is visible on screen
  	
  	Then I select Return to location from the Option drop down list
  	And I click next
  	
  	And 'Editing Location' is visible on screen
  	And I select Return to editing residence from the Action drop down list
  	And I click next
  	
  Scenario: Check Kitchen rules are all correct per device, case 4532
  	Given 'Editing Residence: Robin Reliant' is visible on screen
  	Then I select Edit location from the Select action to perform drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select Location to Edit is visible
  	And 'Select Location to Edit' is visible on screen
  	
  	And I select Kitchen from the Select Location drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Given I confirm Editing Kitchen is visible
  	And 'Editing Location' is visible on screen
  	
  	Then I select Edit device from the Action drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select device to edit is visible
  	And 'Select device to edit' is visible on screen
  	
  	And I select Kitchen from the device drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Kitchen is visible
  	And 'Editing device' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm First morning activity is visible 
  	And 'First morning activity' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Temperature monitoring is visible
  	And 'Temperature monitoring' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Night-time activity is visible
  	And 'Night-time activity' is visible on screen
  	
  	Then I select Return to location from the Option drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Given I confirm Editing Kitchen is visible
  	And 'Editing Location' is visible on screen
  	
  	Then I select Edit device from the Action drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select device to edit is visible
  	#And 'Editing device' is visible on screen
  	
  #	And I select Back Door from the device drop down list
  #	And I click next
  #	
  #	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  #	# Then I confirm Select device to edit is visible
  	And 'Select device to edit' is visible on screen
  	Then I select Kitchen from the device drop down list
  	And I click next
  #	
  #	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  #	# Then I confirm Editing device Back Door is visible
  	And 'Editing device' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm wandering is visible
  	And 'Editing device' is visible on screen
  	
  	Then I select Return to location from the Option drop down list
  	And I click next
  	
  	And 'Editing Location' is visible on screen
  	Then I select Edit device from the Action drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select device to edit is visible
  	And 'Select device to edit' is visible on screen
  	
  	
  	And I select Kettle from the device drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Kettle is visible
  	And 'Editing device' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Kettle is visible
  	#And 'Editing devices' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm First morning activity is visible
  	And 'First morning activity' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Night-time activity is visible
  	And 'Night-time activity' is visible on screen
  	
  	Then I select Return to location from the Option drop down list
  	And I click next
  	
  	And 'Editing Location' is visible on screen
		Then I select Edit device from the Action drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select device to edit is visible
  	And 'Select device to edit' is visible on screen
  	
  	And I select Microwave from the device drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Microwave is visible
  	And 'Editing device' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Microwave usage is visible
  	And 'Microwave usage' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm First morning activity is visible
  	And 'First morning activity' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Night-time activity is visible
  	And 'Night-time activity' is visible on screen
  	
  	Then I select Return to location from the Option drop down list
  	And I click next
  	
  	And 'Editing Location' is visible on screen
  	Then I select Edit device from the Action drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select device to edit is visible
  	And 'Select device to edit' is visible on screen
  	
  	And I select Fridge from the device drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Fridge is visible
  	And 'Editing device' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Fridge opening is visible
  	And 'Fridge opening' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm First morning activity is visible
  	And 'First morning activity' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Night-time activity is visible
  	And 'Night-time activity' is visible on screen
  	
  	Then I select Return to location from the Option drop down list
  	And I click next  
  	
  	And 'Editing Location' is visible on screen	
  	And I select Return to editing residence from the Action drop down list
  	And I click next
  	
  Scenario: Check Bathroom rules are all correct per device, case 4532
  	Given 'Editing Residence: Robin Reliant' is visible on screen
  	Then I select Edit location from the Select action to perform drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select Location to Edit is visible
  	And 'Select Location to Edit' is visible on screen  	
  	
  	And I select Bathroom from the Select Location drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Given I confirm Editing Bathroom is visible
  	And 'Editing Location' is visible on screen
  	
  	Then I select Edit device from the Action drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select device to edit is visible
  	And 'Select device to edit' is visible on screen
  		
  	And I select Bathroom from the device drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Bathroom is visible
  	And 'Editing device' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm No Movement in High-Risk area is visible
  	And 'No Movement in High-Risk area' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Temperature monitoring is visible
  	And 'Temperature monitoring' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Night-time activity is visible
  	And 'Night-time activity' is visible on screen
  	
  	Then I select Return to location from the Option drop down list
  	And I click next  	
  	
  	And 'Editing Location' is visible on screen
  	And I select Return to editing residence from the Action drop down list
  	And I click next
  	
  Scenario: Check Hallway rules are all correct per device, case 4532
		Given 'Editing Residence: Robin Reliant' is visible on screen
  	Then I select Edit location from the Select action to perform drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select Location to Edit is visible
  	And 'Select Location to Edit' is visible on screen
  	
  	And I select Hallway from the Select Location drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Given I confirm Editing Hallway is visible
  	And 'Editing Location' is visible on screen
  	
  	Then I select Edit device from the Action drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select device to edit is visible
  	And 'Select device to edit' is visible on screen
  		
  	And I select Front Door from the device drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Front Door is visible
  	And 'Editing device' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Door left open is visible
  	And 'Door left open' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm wandering is visible
  	And 'Wandering' is visible on screen
  	
  	Then I select Return to location from the Option drop down list
  	And I click next
  	
  	And 'Editing Location' is visible on screen
  	And I select Return to editing residence from the Action drop down list
  	And I click next	
  	
  Scenario: Check Living Room rules are all correct per device, case 4532
  	Given 'Editing Residence: Robin Reliant' is visible on screen
  
  	Then I select Edit location from the Select action to perform drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select Location to Edit is visible
  	And 'Select Location to Edit' is visible on screen
  	
  	And I select Living Room from the Select Location drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Given I confirm Editing Living Room is visible
  	And 'Editing Location' is visible on screen
  	
  	Then I select Edit device from the Action drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select device to edit is visible
  	And 'Select device to edit' is visible on screen
  		
  	And I select Living Room from the device drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Living Room is visible
  	And 'Editing device' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm First morning activity is visible
  	And 'First morning activity' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Temperature monitoring is visible
  	And 'Temperature monitoring' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Night-time activity is visible
  	And 'Night-time activity' is visible on screen
  	
  	Then I select Return to location from the Option drop down list
  	And I click next
  	
  	And 'Editing Location' is visible on screen
  	Then I select Edit device from the Action drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Select device to edit is visible
  	And 'Select device to edit' is visible on screen
  		
  	And I select Chair from the device drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Editing device Chair is visible
  	And 'Editing device' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Chair usage is visible
  	And 'Chair usage' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Night-time activity is visible
  	And 'Night-time activity' is visible on screen
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm No movement in chair is visible
  	And 'No movement in chair' is visible on screen
  	
  	Then I select Return to location from the Option drop down list
  	And I click next
  	
  	And 'Editing Location' is visible on screen
  	And I select Return to editing residence from the Action drop down list
  	And I click next	
  	 	
  Scenario: Finish up	
  	Given 'Editing Residence: Robin Reliant' is visible on screen
  	Then I select Finish from the Select action to perform drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# And I confirm Admin IoTAA is visible
  	And 'Frequent Tasks' is visible on screen
  	
  Scenario: 4719 check I can place an Engineer revisit once the order is complete
  	Given I select Request Engineer Visit from the drop down list in the sidebar appflow for All Available Tasks     		
    And I click Run Task in the All Available Tasks appflow
   
  Scenario: Select Customer - only needed for Anthropos admin 
  	Given 'Select customer' is visible on screen	
  	Then I select Home Instead in the Customer multi select list
  	And I click next
  	
  Scenario: Select Office - anly needed for Anthropos Admin
  	Given 'Select office' is visible on screen
  	Then I select Bristol in the Office multi select list
  	And I click next
  	
  Scenario: Select Client
  	Given 'Please select the client who requires the engineer visit' is visible on screen
		Then I select Robin Reliant in the Client multi select list
		And I scroll to the next button at bottom of the screen
		And I click next
  
  Scenario: Revisit booking information
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Given I confirm Revisit Booking Information is visible
  	And 'Revisit Booking Information' is visible on screen
  	
  	Then I enter Test Reliant in the Who do we contact to arrange revisit? field
  	And I add 01234 56890 number in the Contact phone number telephone field
  	Then I enter Test in the Relationship to client field
  	
  	# 18/10/19: removed as was using deprecated gherkin, and failed on jenkins.
  	# And I enter Revisit notes in the Revisit notes text area
  	And I enter Revisit notes in the textarea, whose ancestor element contains attribute name and value notes  	
  	And I click next  	
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Please enter the reason why an engineer visit is required is visible
  	And 'Please enter the reason why an engineer visit is required' is visible on screen
  	
  	# 18/10/19: removed as was using deprecated gherkin, and failed on jenkins.
  	# And I enter Revisit reasons in the Reason for visit text area
  	Then I enter Revisit reasons in the textarea, whose ancestor element contains attribute name and value reason
  	  	
  	Then I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Revisit Request Complete is visible
  	And 'Revisit Request Complete' is visible on screen
  	
  	And I select Submit request from the Choice drop down list
  	And I click next
  	
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Then I confirm Engineer visit request for Robin Reliant submitted with reference is visible
  	And 'Engineer visit request' is visible on screen
  	
  	And I click next  	
  	