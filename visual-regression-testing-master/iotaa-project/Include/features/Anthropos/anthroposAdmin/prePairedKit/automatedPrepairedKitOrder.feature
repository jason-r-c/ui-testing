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
# This feature covers cases: 5781

Feature: Automated prepared kit order
  Submits a number of prepaired kit orders. This Tasks speeds up the process of 
  submitting high volumes of orders for the config team.

  Scenario: Reset data
  	Given Normalise the dashboard  

	Scenario: Finish feature
  	Then confirm feature is complete

	## // Standard package //////////
	########################################################################
  Scenario: Login to the Head Office (covers case 5781)
		Given Head Office - login with admin.iotaa
    And 'Frequent Tasks' is visible on screen
    
	Scenario: Select and run Create Multiple Pre-paired Kits taks
		Given I select Create Multiple Pre-paired Kits from the drop down list in the sidebar appflow for All Available Tasks
		And click on sidebar Run Task button    
		
	Scenario: Select customer
		And 'Select customer' is visible on screen		
		And I select Home Instead in the Customer multi select list
		And I click next
		
	Scenario: Click Show Prepaired Equipment offices button
		And 'Show Prepaired Equipment offices' is visible on screen
		Then I click the button html element, whose ancestor element contains attribute name and value togglePrePaired
		And 'Hide Prepaired Equipment offices' is visible on screen
		
	Scenario: Select Prepaired Equipment office	
		And 'Select office' is visible on screen		
		And I select Prepaired Equipment in the Office multi select list
		And I click next	
		
	Scenario: Select Standard packge option from dropdown menu  
		Given within the screen -Create Multiple Pre-paired Kits- whose attribute is 'class' and value is 'iotaa-form-orders-bulkPrePaired-internal' confirm 'Create Multiple Pre-paired Kits' is visible
		And I select the item, with the text partially containing: .*Standard Order*. , from the drop down list with the attribute name and value selfInstall
		And I click next
		
	Scenario: Create 1 pre-paired kit with the Standard package  
		And 'Create multiple pre-paired kits' is visible on screen		
		And Add 1 to input field whose ancestor element contains attribute name and value quantity
		And I click next
		
	Scenario: Confirm pre paired kit 1 order is complete
	  ## And I wait 600 seconds before moving to the next step
		Then I confirm 'created 1 pre-paired orders' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.orders.bulkPrePaired.internal'
		
	Scenario: Click header to navigate back to home screen 
		Given click the header button: user avatar, whose ancestor element contains attribute class and value header-left-you

	## // Confirm 1 Standard package order has been created ////////		
  Scenario: Login to the Configuration dashboard
		Given configuration admin - login with henry.admin
		And 'All Available Reports' is visible on screen
		
	Scenario: Confirm 1st pre paired kit is visible
		And 'pre paired_1' is visible on screen		
		And i locate instance 1 of the content pre paired_1, then click the manage button within the same row
		
	Scenario: confirm the order is for the pre-paired office and the Standard package is to be installed
		And 'New Client Order' is visible on screen
		##And 'Standard, Hydration & Nutrition' is visible on screen		
	 	Then click the header button: user picture, whose ancestor element contains attribute class and value header-left-you

 	##// Hydration & Nutrition ////////// 
	############################################################################### 
  Scenario: Login to the Head Office
		Given Head Office - login with admin.iotaa
    And 'Frequent Tasks' is visible on screen
    
	Scenario: Select and run Create Multiple Pre-paired Kits taks
		Given I select Create Multiple Pre-paired Kits from the drop down list in the sidebar appflow for All Available Tasks
		And click on sidebar Run Task button    
		
	Scenario: Select customer
		And 'Select customer' is visible on screen		
		And I select Home Instead in the Customer multi select list
		And I click next
		
	Scenario: Click Show Prepaired Equipment offices button
		And 'Show Prepaired Equipment offices' is visible on screen
		Then I click the button html element, whose ancestor element contains attribute name and value togglePrePaired
		And 'Hide Prepaired Equipment offices' is visible on screen
		
	Scenario: Select Prepaired Equipment office
		And 'Select office' is visible on screen		
		And I select Prepaired Equipment in the Office multi select list
		And I click next	
		
	Scenario: Select Standard packge option from dropdown menu  
		Given within the screen -Create Multiple Pre-paired Kits- whose attribute is 'class' and value is 'iotaa-form-orders-bulkPrePaired-internal' confirm 'Create Multiple Pre-paired Kits' is visible
		And I select the item, with the text partially containing: .*Standard Order*. , from the drop down list with the attribute name and value selfInstall
		And I click next		
		
	Scenario: Create 2 pre-paired kits with the Hydration & Nutrition package
		And 'Create multiple pre-paired kits' is visible on screen		
		And I select Hydration & Nutrition from the aOS styled dropdown, whose ancestor element contains attribute name and value packages
		And Add 2 to input field whose ancestor element contains attribute name and value quantity		
		And I click next
		
	Scenario: Confirm 2 Hydration & Nutrition pre paired kit order is complete
	  # And I wait 600 seconds before moving to the next step
		Then I confirm 'created 2 pre-paired orders' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.orders.bulkPrePaired.internal' looping 6 times
		
	## // Confirm 2 Hydration & Nutrition package order have been created ////////		
  Scenario: Login to the Configuration dashboard
		Given configuration admin - login with henry.admin
		And 'All Available Reports' is visible on screen

	## Confirm 2nd order
	Scenario: Confirm 2nd pre paired kit is visible
		And 'pre paired_1' is visible on screen		
		And i locate instance 1 of the content pre paired_2, then click the manage button within the same row
		
	Scenario: confirm the order is for the pre-paired office and the Standard package is to be installed
		And 'New Client Order' is visible on screen
		And 'Standard, Hydration & Nutrition' is visible on screen		
	 	Then click the header button: user picture, whose ancestor element contains attribute class and value header-left-you

	## confirm 3rd order
	Scenario: Confirm 3rd pre paired kit is visible
		And 'pre paired_3' is visible on screen		
		And i locate instance 1 of the content pre paired_3, then click the manage button within the same row
		
	Scenario: confirm the order is for the pre-paired office and the Standard package is to be installed
		And 'New Client Order' is visible on screen
		And 'Standard, Hydration & Nutrition' is visible on screen
		
	 	Then click the header button: user picture, whose ancestor element contains attribute class and value header-left-you	 	

	## // Vulnerable Client //////////
	########################################################################
  Scenario: Login to the Head Office
		Given Head Office - login with admin.iotaa
    And 'Frequent Tasks' is visible on screen
    
	Scenario: Select and run Create Multiple Pre-paired Kits taks
		Given I select Create Multiple Pre-paired Kits from the drop down list in the sidebar appflow for All Available Tasks
		And click on sidebar Run Task button    
		
	Scenario: Select customer
		And 'Select customer' is visible on screen		
		And I select Home Instead in the Customer multi select list
		And I click next
		
	Scenario: Click Show Prepaired Equipment offices button
		And 'Show Prepaired Equipment offices' is visible on screen
		Then I click the button html element, whose ancestor element contains attribute name and value togglePrePaired
		And 'Hide Prepaired Equipment offices' is visible on screen		
		
	Scenario: Select Prepaired Equipment office
		And 'Select office' is visible on screen		
		And I select Prepaired Equipment in the Office multi select list
		And I click next	
		
	Scenario: Select Standard packge option from dropdown menu  
		Given within the screen -Create Multiple Pre-paired Kits- whose attribute is 'class' and value is 'iotaa-form-orders-bulkPrePaired-internal' confirm 'Create Multiple Pre-paired Kits' is visible 
		And I select the item, with the text partially containing: .*Standard Order*. , from the drop down list with the attribute name and value selfInstall
		And I click next		
		
	Scenario: Create 3 pre-paired kit with the Vulnerable Client package  
		And 'Create multiple pre-paired kits' is visible on screen		
		And I select Vulnerable Client from the aOS styled dropdown, whose ancestor element contains attribute name and value packages
		And Add 3 to input field whose ancestor element contains attribute name and value quantity
		And I click next

	Scenario: Confirm 3 Vulnerable Client pre paired kit orders are complete
	  # And I wait 600 seconds before moving to the next step
		Then I confirm 'created 3 pre-paired orders' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.orders.bulkPrePaired.internal' looping 6 times
		
	## // Confirm 3 Vulnerable Client packages order have been created ////////		
  Scenario: Login to the Configuration dashboard
		Given configuration admin - login with henry.admin
    And 'All Available Reports' is visible on screen

	## Confirm 4th order
	Scenario: Confirm 4th pre paired kit is visible
		And 'pre paired_4' is visible on screen		
		And i locate instance 1 of the content pre paired_4, then click the manage button within the same row
		
	Scenario: confirm the order is for the pre-paired office and the Standard package is to be installed
		And 'New Client Order' is visible on screen		
		And 'Vulnerable Client' is visible on screen		
	 	Then click the header button: user picture, whose ancestor element contains attribute class and value header-left-you
	 	
	## Confirm 5th order
	Scenario: Confirm 5th pre paired kit is visible
		And 'pre paired_5' is visible on screen		
		And i locate instance 1 of the content pre paired_5, then click the manage button within the same row
		
	Scenario: confirm the order is for the pre-paired office and the Standard package is to be installed
		And 'New Client Order' is visible on screen
		And 'Standard, Vulnerable Client' is visible on screen		
	 	Then click the header button: user picture, whose ancestor element contains attribute class and value header-left-you	 	
		
	## Confirm 6th order
	Scenario: Confirm 6th pre paired kit is visible
		And 'pre paired_6' is visible on screen		
		And i locate instance 1 of the content pre paired_6, then click the manage button within the same row
		
	Scenario: confirm the order is for the pre-paired office and the Standard package is to be installed
		And 'New Client Order' is visible on screen		
		And 'Standard, Vulnerable Client' is visible on screen
				
	# // Self Install package //////////
	########################################################################
  Scenario: Login to the Head Office (covers case 5781)
		Given Head Office - login with admin.iotaa
    And 'Frequent Tasks' is visible on screen
    
	Scenario: Select and run Create Multiple Pre-paired Kits taks
		Given I select Create Multiple Pre-paired Kits from the drop down list in the sidebar appflow for All Available Tasks
		And click on sidebar Run Task button    
		
	Scenario: Select customer
		And 'Select customer' is visible on screen		
		And I select Home Instead in the Customer multi select list
		And I click next
		
	Scenario: Click Show Prepaired Equipment offices button
		And 'Show Prepaired Equipment offices' is visible on screen
		Then I click the button html element, whose ancestor element contains attribute name and value togglePrePaired
		And 'Hide Prepaired Equipment offices' is visible on screen		
		
	Scenario: Select Prepaired Equipment office
		And 'Select office' is visible on screen		
		And I select Prepaired Equipment in the Office multi select list
		And I click next	
		
	Scenario: Select Self-Install package option from dropdown menu  
		Given within the screen -Create Multiple Pre-paired Kits- whose attribute is 'class' and value is 'iotaa-form-orders-bulkPrePaired-internal' confirm 'Create Multiple Pre-paired Kits' is visible
		And I select the item, with the text partially containing: .*Self-Install*. , from the drop down list with the attribute name and value selfInstall
		And I click next

	Scenario: Create 1 pre-paired kit with the mandatory Essentials package 
		Given within the screen -Mandatory packages: Essentials- whose attribute is 'class' and value is 'iotaa-form-orders-bulkPrePaired-internal' confirm 'Mandatory packages: Essentials' is visible		
		And Add 1 to input field whose ancestor element contains attribute name and value quantity
		And I click next
		
	Scenario: Confirm 1 Self Install pre paired kit orders are complete
	  # And I wait 600 seconds before moving to the next step
		Then I confirm 'created 1 pre-paired orders' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.orders.bulkPrePaired.internal' looping 6 times		
	
 	## // Confirm the 1 Standard package order have been created ////////
  Scenario: Login to the Configuration dashboard
		Given configuration admin - login with henry.admin
    And 'All Available Reports' is visible on screen

	Scenario: Confirm 7th pre paired kit (self install) is visible
		Given 'self paired_7' is visible on screen
		And i locate instance 1 of the content self paired_7, then click the manage button within the same row
		
	Scenario: Confirm the order is for the pre-paired office and the Self-Install package is to be installed
		Given 'New Client Order' is visible on screen
		And 'Packages' is visible on screen
		And 'Essentials' is visible on screen		
		