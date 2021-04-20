# Author: 
# jason.carney@anthropos.io

# Keywords Summary:
#
# 3088 User permissions for Reports that can be managed by Anthropos Support as an Admin task
# Enable report for user group, Disable report for user group

# This feature covers cases: 
# 3088

Feature: Edit report permissions

	3088 User permissions for Reports that can be managed by Anthropos Support as an Admin task:
	Confirms that reports can be enabled and disabled at the Global level for groups of users such as
	- Anthropos Staff, Configuration Admin and Engineers, HIA Admins and Installers
	
	Reports can also be ran at the Customer level for groups of users such as 
	- Head Office (Customer Staff), Local Office users, Customer HIA Admin/Installer, Contact Centre Admin and Contact Centre Agent
	
	## Refixture
	################################################################################################################
	
	Scenario: Reset data
  	Given Normalise the dashboard    
  	
	## // 3088 User permissions for Reports that can be managed by Anthropos Support as an Admin task - START
	##
	## Description 
	## See 3088 in header
	################################################################################################################	
  	  	
	## Add permission for HIA Admin to run the Actions Report
  ## -------------------------------------------------------------------------------------------------------------  	
  	
	## Run Configure Task Permissions task and select Actions Report for HIA Admin. 
	################################################################################################################
	
 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Configure Report Permissions task
		And I select Configure Report Permissions from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow		

	Scenario: Select Global from "Select customer to manage permissions for" screen
		Given 'Select customer to manage permissions for' is visible on screen
		Then I select Global Anthropos Permissions from the Customer selectable items in the Select customer to manage permissions for appflow
		Then I click next	
		
	Scenario: Add permission for HIA Admin to run the Actions Report
		Given 'Configure Anthropos Report Permissions' is visible on screen
		Then select grid check box item row tableData_row00 and column tableData_row00__hiaAdmin
		Then I click next 
		
	Scenario: Confirm we are back on the home screen
		Then 'Frequent Tasks' is visible on screen	
	
	## Confirm Client Administration is available to select for the HIA Admin 
	################################################################################################################
	
 	Scenario: Login as Home Instead HIA Admin
		Given Home Instead HIA Admin - login with henry.admin
		Then 'No install requests' is visible on screen
		
	Scenario: Select Actions Report from HIA Admin dashboard
		Then I select the item, with the text partially containing: .*Actions Report.* , from the drop down list number 2 with the attribute data-ui-test and value aos.container.tools
		
	## Remove permission for Anthropos Staff and confirm its disabled.
  ## -------------------------------------------------------------------------------------------------------------
  	
	## Add Audit Summary Report report to shortcuts then run the report
	################################################################################################################
	
 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Add Audit Summary Report to shortcuts
		And I select Audit Summary Report from the drop down list in the sidebar appflow for All Available Reports
		And I click the button html element, number 4, whose ancestor element contains attribute class and value available-reports
		Then I confirm 'Audit Summary Report' is visible within the screen whose ancestor contains attribute 'class' and value 'sidebar-menu useful-reports'		
		
	Scenario: Run Configure Report Permissions task
		And I select Configure Report Permissions from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow		

	Scenario: Select Global from "Select customer to manage permissions for" screen
		Given 'Select customer to manage permissions for' is visible on screen
		Then I select Global Anthropos Permissions from the Customer selectable items in the Select customer to manage permissions for appflow
		Then I click next
		
	## Remove permission for Anthropos staff to run the Audit Summary Report
	################################################################################################################		
		
	Scenario: Remove permission for Anthropos staff to run the Audit Summary Report task
		Given 'Configure Anthropos Report Permissions' is visible on screen
		Then select grid check box item row tableData_row02 and column tableData_row02__anthroposReporting
		Then I click next 
		
	Scenario: confirm we are back on the home screen
		Then 'Frequent Tasks' is visible on screen	
		
	## Login again and confirm the Audit Summary Report cannot be accessed
	################################################################################################################	

 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Click Audit Summary Report shortcut
		And I click the button html element, number 1, whose ancestor element contains attribute class and value sidebar-menu useful-reports 
		
	Scenario: Confirm permission denied in accessing the Audit Summary Report
		Given 'Admin IoTAA permission denied' is visible on screen	
		
	## Add permission for Audit Summary Report for Home Instead Head office user and NOT for Taking Care 
  ## -------------------------------------------------------------------------------------------------------------
  	
	## Login and enable the Audit Summary Report
	################################################################################################################	
	
 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Configure Report Permissions
		And I select Configure Report Permissions from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow		

	Scenario: Select Home Instead from "Select customer to manage permissions for" screen
		Given 'Select customer to manage permissions for' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer to manage permissions for appflow
		Then I click next		
		
	Scenario: Add permission for Customer Staff (Head Office users) to run the Battery Details Report
		Given 'Configure Customer Report Permissions' is visible on screen
		Then select grid check box item row tableData_row02 and column tableData_row02__customerStaff
		Then I click next 
		
	Scenario: confirm we are back on the home screen
		Then 'Frequent Tasks' is visible on screen		

	## Login as Home Instead Head Office user Harry Hour, and confirm the Audit Summary Report can be ran
	################################################################################################################
	
 	Scenario: Login as Home Instead > head office user 'harry.hour'
		Given Home Instead Head office - login with harry.hour
		Then 'Frequent Tasks' is visible on screen	
		
	Scenario: Run Audit Summary Report
		And I select Audit Summary Report from the drop down list in the sidebar appflow for All Available Reports
	
	## Login as Taking Care Head Office user Ppptc Headoffice, and confirm the Audit Summary Report can NOT be ran
	################################################################################################################
	
 	Scenario: Login as Taking Care > head office user 'ppptc.headoffice' and confirm Audit Summary Report is NOT available
		Given Taking Care Head office - login with ppptc.headoffice
		Then 'Frequent Tasks' is visible on screen		
		And Confirm dropdown item 'Audit Summary Report' does not exist within the dropdown, whose ancestor element contains attribute 'class' and value 'available-reports'					
	
	## // 3088 User permissions for Reports that can be managed by Anthropos Support as an Admin task - END
	################################################################################################################	
	
				