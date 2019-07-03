#Author: your.email@your.domain.com
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

    
##############################

@tag
Feature: Configuration Tool
  I want this for the configuration engineer
  
	Scenario: Tool logon
		Given that I go to test server
#		And I enter username pre.install
#		And I enter password password
#		When I click sign in button
#		Then ensure that configuration dashboard is displayed
#
#
#	Scenario: Run PumpAdmin setup demo script
#		Given that I go to PumpAdmin
#		And I select SetupDemoScript
#		When I click the run button
#		Then ensure that the app flow status is complete (AppFlowService.STATUS_COMPLETE)
#
#
#	Scenario: Run PumpAdmin order script
#		Given that I go to PumpAdmin
#		And I select NewAnthroposOrderlScript
#		When I click the run button
#		Then ensure that the script is successfully run (executed script com.pumpco.iotaa.NewAnthroposOrderScript
#
#
#	Scenario: Show un-allocated configurations
#		Given that I go to test server
#		And I select drop down icon for top client in New Configuration Requests column
#		When I select start
#		Then ensure that the screen now shows options to Accept Hub Setup Request
#
#
#	Scenario: Pick order to configure 
#		Given that I select the hub setup request dropdown
#		And I select Accept Setup Request
#		When I select next
#		Then ensure that the client is moved from ’New Configuration Requests’ column to My Configuration Requests column
#
#
#	Scenario: Get device pick list
#		Given that I select drop down icon for top client in My Configuration Requests column
#		And I select open
#		When I select next 
#		Then ensure that a list of required devices is displayed in order of To be configured first
#		And that I can select a device to configure
#
#
#	Scenario: Configure WiFi extender
#		Given that the client does not require MiFi
#		When I select WiFi extender
#		Then ensure that I am shown instructions on how to configure WiFi extender
#		And that I can enter the WiFi extender default password into configuration tool
#		And that I am then able to move onto setting up the hub
#
#
#	Scenario: Configure MiFi device
#		Given that the client requires MiFi
#		When I select MiFi
#		Then ensure that I am shown instructions on how to configure MiFi
#		And that I can enter the MiFi default password into configuration tool
#		And that I am then able to move onto setting up the hub
#
#
#	Scenario: Set up hub
#		Given that I plug the hub into a router using an ethernet cable
#		And I follow the instructions displayed on the tool to set the hub up
#		When I enter the hub MAC address into the tool
#		Then ensure that I can proceed to configuring devices
#
#
#	Scenario: Configure BCG
#		Given that the client requires a BCG
#		When I select BCG from device pick list
#		Then ensure that I am shown instructions on how to configure BCG
#		And that I can select BCG configured to finish BCG configuration and proceed to the next step
#
#
#	Scenario: Configure Google Home
#		Given that the client requires a Google Home
#		When I select Google Home from device pick list
#		Then ensure that I am shown instructions on how to configure Google Home
#		And that I can select Google Home configured to finish Google Home configuration and proceed to the next step
#
#
#	Scenario: Pairing Devices
#		Given that the hub, and other required WiFi devices, have been configured
#		And I am shown instructions to pair each device
#		And I follow the instructions to pair each device
#		When I capture the Node IDs assigned to each device
#		Then ensure that I am prompted to write these Node IDs on each device and its corresponding box
#		And that I can select next to move on to registering and updating the hub
#
#
#	Scenario: Register and Update Hub
#		Given that all devices have been paired
#		And I am shown instructions to update the hub
#		When I select update hub
#		Then ensure that a progress bar is shown
#		And that I can select next to proceed once update is complete
#
#
#	Scenario: Finish Configuration
#		Given that the hub update has finished
#		And I am shown a list of all devices that are to be shipped
#		And the address of the HIA to ship the devices
#		When I select Finish
#		Then the client will be passed to the installation dashboard
#
#
#	Scenario: Client Passed to Installation Dashboard
#		Given that I have completed the client configuration 
#		When I log in to installer dashboard
#		Then ensure that the client is displayed in the New Installation Requests column