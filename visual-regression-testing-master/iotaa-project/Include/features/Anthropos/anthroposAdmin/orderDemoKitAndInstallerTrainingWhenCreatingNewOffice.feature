#Author: jason.carney@anthropos.io
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
# This feature covers cases: 5679

@tag
Feature: Automated demo kit order option and installer training option when creating new office
  - 5679: Confirm demo kit and installer training kit are automatically created when a new office is created.
  Also confirm the kits have the expected rules and devices. 
  Finally confirm the new office cannot accidently create second demo and installer training kits

	## // Create the office 'Kington Anthropos'
	################################################################################	
  Scenario: Login as: Anthropos admin
		Given Anthropos admin - login with admin.iotaa
    And 'Frequent Tasks' is visible on screen
    
	Scenario: Select and run task: Offices Administration 
    Given I select Offices Administration from the drop down list in the sidebar appflow for All Available Tasks
    And I click Run Task in the All Available Tasks appflow
    
  Scenario: I select Home Instead from the Customer selectable items in the Select customer appflow
  	# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
  	# Given I confirm Select customer is visible
  	And 'Select customer' is visible on screen
  	
    Then I select Home Instead from the Customer selectable items in the Select customer appflow
    And I click next   
    
	Scenario: select row Create New Office from single select appflow panel
		# JCARNEY 17/3/20: Replaced is visible with preferred is visible on screen gherkin
		# Given I confirm Offices is visible
		And 'Select customer' is visible on screen
		
		Then select row Create New Office from single select appflow panel	
	  
	Scenario: Add details, escalation, open hours, primary account and alerts for the office 
		# Details
		Given Add Kington Anthropos to input field whose ancestor element contains attribute name and value fn
		
		# Escalation
		And Add kington.anthropos.oo@test.io to input field whose ancestor element contains attribute name and value esc_email
		And Add kington.anthropos.ooh@test.io to input field whose ancestor element contains attribute name and value esc_oohEmail		
		
		#And I add 12345 678910 number in the Escalation Mobile (Office Hours) telephone field
		And Add 12345 678910 to input field whose ancestor element contains attribute name and value esc_mobile
		
		#And I add 12345 678911 number in the Escalation Mobile (OOH) telephone field
		And Add 12345 678911 to input field whose ancestor element contains attribute name and value esc_oohMobile
		
		# Open hours
		And select grid check box item row officeHoursTable_row02 and column officeHoursTable_row02_mon
		And select grid check box item row officeHoursTable_row02 and column officeHoursTable_row02_tue
		And select grid check box item row officeHoursTable_row02 and column officeHoursTable_row02_wed
		And select grid check box item row officeHoursTable_row02 and column officeHoursTable_row02_thu
		And select grid check box item row officeHoursTable_row02 and column officeHoursTable_row02_fri
		And select grid check box item row officeHoursTable_row01 and column officeHoursTable_row01_sat
		And select grid check box item row officeHoursTable_row01 and column officeHoursTable_row01_sun
		
		# Primary account
		And Add Kington to input field whose ancestor element contains attribute name and value forename
		And Add Anthropos to input field whose ancestor element contains attribute name and value surname
		# And Add  to input field whose ancestor element contains attribute name and value email
		
		And I enter kington.anthropos@test.io in the email field

		# Alerts
		And I check the Order Demo Kit for office checkbox
		And I check the Order Installer Training for office checkbox
		
		# Move onto next screen
		Then I click next
		
	Scenario: Confirm we are on Created Office screen
		And 'Created Office' is visible on screen
		Then I click next
		
	## // Confirm the orders have been made by observing them as 'visible' in the orders screen
	################################################################################
  Scenario: Login as: Configuration Admin
		Given Configuration Admin - login with pre.admin
    Then 'My Configurations' is visible on screen
    
	Scenario: Confirm Demo Kit and Installer Training are visible
		Then 'Demo Kit' is visible on screen

	## // Confirm the Demo Kit has the expected rules and devices setup by visiting running Configure Client Residences task
	################################################################################	
  Scenario: Login as: Anthropos admin
		Given Anthropos admin - login with admin.iotaa
    Then 'Frequent Tasks' is visible on screen
    
  Scenario: Select and run Task: Configure Client Residences
    Given I select Configure Client Residences from the drop down list in the sidebar appflow for All Available Tasks
    And I click Run Task in the All Available Tasks appflow     
		
  Scenario: I select Home Instead in the Customer multi select list
  	Then 'Select customer' is visible on screen
    Then I select Home Instead in the Customer multi select list
    And I click next  
    
  Scenario: I select Kington Anthropos in the Office multi select list
  	Then 'Select office' is visible on screen
    Then I select Kington Anthropos in the Office multi select list
    And I click next  
    
  Scenario: I select Kington Anthropos Demo Kit in the select client whose residence needs to be configured multi select list
  	Then 'select client whose residence needs to be configured' is visible on screen
    Then I select Kington Anthropos Demo Kit in the select client whose residence needs to be configured multi select list
    And I click next  

	## 3.1) Hallway              		
	Scenario: Confirm Editing Residence is visible		
		Then 'Editing Residence' is visible on screen
		
	Scenario: Confirm Hallway Door is visible			 
		Given I confirm table cell content 'is exactly': Fibaro.Door, located by row number 5 and column 9, whose ancestor element contains attribute name and value editResidence

	## 3.2) Kitchen
	Scenario: Confirm Kitchen rules and PIR is visible			 
		Given I confirm table cell content 'contains': First morning activity, located by row number 6 and column 7, whose ancestor element contains attribute name and value editResidence
	 	And I confirm table cell content 'contains': Temperature monitoring, located by row number 6 and column 7, whose ancestor element contains attribute name and value editResidence
		And I confirm table cell content 'contains': Night-time activity, located by row number 6 and column 7, whose ancestor element contains attribute name and value editResidence
		And I confirm table cell content 'contains': Fibaro.PIR, located by row number 6 and column 9, whose ancestor element contains attribute name and value editResidence

	## 3.3) Living room 			  
	Scenario: Confirm Living room rules and PIR is visible			 
		Given I confirm table cell content 'contains': First morning activity, located by row number 9 and column 7, whose ancestor element contains attribute name and value editResidence
	 	And I confirm table cell content 'contains': Temperature monitoring, located by row number 9 and column 7, whose ancestor element contains attribute name and value editResidence
		And I confirm table cell content 'contains': Night-time activity, located by row number 9 and column 7, whose ancestor element contains attribute name and value editResidence
		And I confirm table cell content 'is exactly': Fibaro.PIR, located by row number 9 and column 9, whose ancestor element contains attribute name and value editResidence  

	## 3.4) kitchen smartplugs	
	Scenario: Confirm Kitchen smartplugs is visible			 
		Given I confirm table cell content 'is exactly': Fibaro.Meter, located by row number 7 and column 9, whose ancestor element contains attribute name and value editResidence
	 	And I confirm table cell content 'is exactly': Fibaro.Meter, located by row number 8 and column 9, whose ancestor element contains attribute name and value editResidence
	 	
	## // Confirm the Installer training kit has the expected rules and devices setup by visiting running Configure Client Residences task
	################################################################################	
	Scenario: Head back to home screen
	 	Given click the header button: user icon, whose ancestor element contains attribute class and value header-left-you
    
  Scenario: Select and run Task: Configure Client Residences
    Given I select Configure Client Residences from the drop down list in the sidebar appflow for All Available Tasks
    And I click Run Task in the All Available Tasks appflow     
		
  Scenario: I select Home Instead in the Customer multi select list
  	Then 'Select customer' is visible on screen
    Then I select Home Instead in the Customer multi select list
    And I click next  
    
  Scenario: I select Kington Anthropos in the Office multi select list
  	Then 'Select office' is visible on screen
    Then I select Kington Anthropos in the Office multi select list
    And I click next  
    
  Scenario: I select Kington Anthropos Demo Kit in the select client whose residence needs to be configured multi select list
  	Then 'select client whose residence needs to be configured' is visible on screen
    Then I select Kington Anthropos Installer Training in the select client whose residence needs to be configured multi select list
    And I click next  	
    	
	Scenario: Confirm Editing Residence is visible
		Then 'Editing Residence' is visible on screen
	
	## 4.1) Hallway	
	Scenario: Confirm Hallway Door is visible			 
		Given I confirm table cell content 'is exactly': Fibaro.Door, located by row number 5 and column 9, whose ancestor element contains attribute name and value editResidence
    
	## 4.2) Kitchen
	Scenario: Confirm Kitchen rules and PIR is visible			 
		Given I confirm table cell content 'contains': First morning activity, located by row number 6 and column 7, whose ancestor element contains attribute name and value editResidence
	 	And I confirm table cell content 'contains': Temperature monitoring, located by row number 6 and column 7, whose ancestor element contains attribute name and value editResidence
		And I confirm table cell content 'contains': Night-time activity, located by row number 6 and column 7, whose ancestor element contains attribute name and value editResidence
		And I confirm table cell content 'contains': Fibaro.PIR, located by row number 6 and column 9, whose ancestor element contains attribute name and value editResidence    

	## 4.3) Living room 			  
	Scenario: Confirm Living room rules and PIR is visible			 
		Given I confirm table cell content 'contains': First morning activity, located by row number 9 and column 7, whose ancestor element contains attribute name and value editResidence
	 	And I confirm table cell content 'contains': Temperature monitoring, located by row number 9 and column 7, whose ancestor element contains attribute name and value editResidence
		And I confirm table cell content 'contains': Night-time activity, located by row number 9 and column 7, whose ancestor element contains attribute name and value editResidence
		And I confirm table cell content 'is exactly': Fibaro.PIR, located by row number 9 and column 9, whose ancestor element contains attribute name and value editResidence
		
	## 4.4) kitchen smartplugs	
	Scenario: Confirm Kitchen smartplugs is visible			 
		Given I confirm table cell content 'is exactly': Fibaro.Meter, located by row number 7 and column 9, whose ancestor element contains attribute name and value editResidence
	 	And I confirm table cell content 'is exactly': Fibaro.Meter, located by row number 8 and column 9, whose ancestor element contains attribute name and value editResidence
	 	
	## // Confirm the Demo Kit order already exists for the office Kington Anthropos 
	################################################################################
	Scenario: Head back to home screen
	 	Given click the header button: user icon, whose ancestor element contains attribute class and value header-left-you
	 	
  Scenario: Select and run Task: Order Demo Kit
    Given I select Order Demo Kit from the drop down list in the sidebar appflow for All Available Tasks
    And I click Run Task in the All Available Tasks appflow   	 	
	 	
  Scenario: I select Home Instead in the Customer multi select list
  	Then 'Select customer' is visible on screen
    Then I select Home Instead in the Customer multi select list
    And I click next  	 	

  Scenario: I select Kington Anthropos in the Office multi select list
  	Then 'Select office' is visible on screen
    Then I select Kington Anthropos in the Office multi select list
    And I click next  	 			
  
  Scenario: I check the Please confirm you wish to order a demo kit checkbox  
  	Then 'Order Demo Kit' is visible on screen
  	Then I check the Please confirm you wish to order a demo kit checkbox
  	And I click next  	 	
  	
	Scenario: Confirm we are on 'Kington Anthropos Demo Kit' already exists for office Kington Anthropos screen
		Then 'Kington Anthropos Demo Kit' is visible on screen
		Then 'already exists for office Kington Anthropos' is visible on screen
  	
	## // Confirm the Installer training kit order already exists for the office Kington Anthropos 
	################################################################################
	Scenario: Head back to home screen
	 	Given click the header button: user icon, whose ancestor element contains attribute class and value header-left-you
	 	
  Scenario: Select and run Task: Order Demo Kit
    Given I select Order Installer Training Kit from the drop down list in the sidebar appflow for All Available Tasks
    And I click Run Task in the All Available Tasks appflow   	 	
	 	
  Scenario: I select Home Instead in the Customer multi select list  	
  	Then 'Select customer' is visible on screen
    Then I select Home Instead in the Customer multi select list
    And I click next  	 	

  Scenario: I select Kington Anthropos in the Office multi select list
  	Then 'Select office' is visible on screen
    Then I select Kington Anthropos in the Office multi select list
    And I click next  	 			
  
  Scenario: I check the Please confirm you wish to order a demo kit checkbox  
  	Then 'Order Demo Kit' is visible on screen
  	Then I check the Please confirm you wish to order a installer training kit checkbox
  	And I click next  	 	
  	
	Scenario: Confirm we are on 'Kington Anthropos Demo Kit' already exists for office Kington Anthropos screen		
		Then 'Kington Anthropos Installer Training' is visible on screen  
		Then 'already exists for office Kington Anthropos' is visible on screen