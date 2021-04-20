# Author: 
# jason.carney@anthropos.io

# Keywords Summary:
#
# 8730 User permissions for Tasks that can be managed by Anthropos Support as an Admin task

# This feature covers cases: 
# 8730, 8704

Feature: Edit user permissions

	8730 User permissions for Tasks that can be managed by Anthropos Support as an Admin task
	
	8704 B2C user groups within an office
	
	## // Refixture
	################################################################################################################
	
	Scenario: Reset data
  	Given Normalise the dashboard  

	## // Clear mock email
	####################################################################################################
	
	Scenario: Navigate to Pump Admin home page
		Given I open the web browser
		Then Pump Admin: I go to Pump Admin		
		And 'Welcome To Pumphouse Administration' is visible on screen	
		
	Scenario: Clear mock email 
		Given Pump Admin: I select the main menu item Debug
		And Pump Admin: I click the element with the attribute name and value _action_clearEmail   	
  
	## // 8704 B2C user groups within an office - START
	##
	## Description 
	## 
	################################################################################################################
	
	## Run pumpadmin script	
	## ) Run the DefaultNewOfficeRolesScript > customer, Home Instead
	
 	Scenario: Run DefaultNewOfficeRolesScript so to create Sales and Customer Service roles
  	Given I navigate to PumpAdmin Scripts list
  	And I select com.pumpco.iotaa.DefaultNewOfficeRolesScript script
  	And Add Custom Script Parameter to Run Script within pumpadmin: value customer in field number 1
	  And Add Custom Script Parameter to Run Script within pumpadmin: value Home Instead in field number 2  
  	And I click the run button
		And I ensure that the AppFlow status is complete 	
	
 	Scenario: Run NewAnthroposOrderAndInstallScript to create new order
  	Given I navigate to PumpAdmin Scripts list
  	And I select com.pumpco.iotaa.NewAnthroposOrderAndInstallScript script			
  	And Add Custom Script Parameter to Run Script within pumpadmin: value fname in field number 1
  	And Add Custom Script Parameter to Run Script within pumpadmin: value Adam in field number 2
  	And Add Custom Script Parameter to Run Script within pumpadmin: value sname in field number 3
  	And Add Custom Script Parameter to Run Script within pumpadmin: value Apple in field number 4
  	And I click the run button
		And I ensure that the AppFlow status is complete 	
	
	## Change the Home Intead customer mdoel to B2C
	
 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen	
	
	Scenario: Run Configure Customer
		And I select Configure Customer from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 

	Scenario: I select PPP Taking Care from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
	
	Scenario: Change the Home Intead customer mdoel to B2C 
		Then 'What is the name of the product for this customer' is visible on screen
		Then I select the item, with the text partially containing: .*B2C.* , from the drop down list with the attribute name and value model
		And I click next	
	
	## // 8730 User permissions for Tasks that can be managed by Anthropos Support as an Admin task - START
	##
	## Description 
	## See 8730 in header
	################################################################################################################	  	    
  	
	## Add permission for HIA Admin to run the Client Administration task.
  ## -------------------------------------------------------------------------------------------------------------  	
  	
	## Run Configure Task Permissions task and select Client Administration task for HIA Admin. 
	################################################################################################################
	
 	Scenario: Confirm we are back on the home screen after updating customer model to B2C
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Configure Task Permissions
		And I select Configure Task Permissions from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow		

	Scenario: Select Global from "Select customer to manage permissions for" screen
		Given 'Select customer to manage permissions for' is visible on screen
		Then I select Global Anthropos Permissions from the Customer selectable items in the Select customer to manage permissions for appflow
		Then I click next	
		
	Scenario: Add permission for HIA Admin to run the Client Administration task
		Given 'Configure Anthropos Task Permissions' is visible on screen
		Then select grid check box item row tableData_row09 and column tableData_row09__hiaAdmin
		Then I click next 
		
		
	## Enable task for Customer Service role
	## ) reusing ## Run Configure Task Permissions task and select Client Administration task for HIA Admin." block
	## - Enable Assign Contact Centre to Local Office for Customer Service role		
	
 	Scenario: Confirm we are back on the home screen after updating customer model to B2C
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Configure Task Permissions
		And I select Configure Task Permissions from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow		

	Scenario: Select Home Instead from "Select customer to manage permissions for" screen
		Given 'Select customer to manage permissions for' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer to manage permissions for appflow
		Then I click next	
		
	Scenario: Add permission for Customer Service role for Assign Contact Centre to Local Office task
		Given 'Configure Customer Task Permissions' is visible on screen
		Then select grid check box item row tableData_row00 and column tableData_row00__OFFICEROLE_customerservice
		Then I click next 
		
	Scenario: confirm we are back on the home screen
		Then 'Frequent Tasks' is visible on screen		
		
	## Enable task for Sales role		
	################################################################################################################
		
	Scenario: Run Configure Task Permissions
		And I select Configure Task Permissions from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow		

	Scenario: Select Home Instead from "Select customer to manage permissions for" screen
		Given 'Select customer to manage permissions for' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer to manage permissions for appflow
		Then I click next	
		
	Scenario: Add permission for Sales role for Assign Contact Centre to Local Office task	
		Given 'Configure Customer Task Permissions' is visible on screen
		Then select grid check box item row tableData_row00 and column tableData_row00__OFFICEROLE_sales
		Then I click next 
		
	Scenario: confirm we are back on the home screen
		Then 'Frequent Tasks' is visible on screen		
			
	## Create new Customer Service role using Office User Administration
	## - Login as admin.iotaa > Home Instead > Bristol > Create New Office User > select Customer Service from User Type dropdown 
	## > forename: customer service > surname: user one > email: customerserviceuserone@test.com > click next 
	## > confirm "customer service user one" is displayed
	################################################################################################################
  	
  Scenario: Select and run Task: Office Users Administration  
    Given I select Office Users Administration from the drop down list in the sidebar appflow for All Available Tasks
    And I click Run Task in the All Available Tasks appflow   	
    
	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next	    

  Scenario: Select Create New Office user
  	Given 'Create New Office User' is visible on screen     
   	And select row + Create New Office User from single select appflow panel
  
  Scenario: Add details of the new Customer Service user
  	Given 'Create Office Account' is visible on screen
  	Then I select the item, with the text partially containing: .*Customer Service.* , from the drop down list with the attribute name and value userRole   
    And Add Customer Service to input field whose ancestor element contains attribute name and value forename
    And Add User One to input field whose ancestor element contains attribute name and value surname 
    And Add customerserviceuserone@test.com to input field whose ancestor element contains attribute name and value email    
    And I click next
    
  Scenario: Confirm Customer Service user 'Customer Service User One' is visible
  	Given 'Create New Office User' is visible on screen  
    And 'Customer Service User One' is visible on screen	
    And I click next
    
	Scenario: confirm we are back on the home screen after creating a Customer Service user
		Then 'Frequent Tasks' is visible on screen     
	
	## Create new Sales user using Office User Administration
	################################################################################################################
	
  Scenario: Select and run Task: Office Users Administration  
    Given I select Office Users Administration from the drop down list in the sidebar appflow for All Available Tasks
    And I click Run Task in the All Available Tasks appflow   	
    
	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next	    

  Scenario: Select Create New Office user
  	Given 'Create New Office User' is visible on screen     
   	And select row + Create New Office User from single select appflow panel
  
  Scenario: Add details of the new Sales user
  	Given 'Create Office Account' is visible on screen
  	Then I select the item, with the text partially containing: .*Sales.* , from the drop down list with the attribute name and value userRole   
    And Add Sales to input field whose ancestor element contains attribute name and value forename
    And Add User One to input field whose ancestor element contains attribute name and value surname 
    And Add salesuserone@test.com to input field whose ancestor element contains attribute name and value email    
    And I click next
    
  Scenario: Confirm Sales user 'Sales User One' is visible
  	Given 'Create New Office User' is visible on screen  
    And 'Sales User One' is visible on screen	
    And I click next

	Scenario: confirm we are back on the home screen after creating a Customer Service user
		Then 'Frequent Tasks' is visible on screen       
	
	## Scrape user credentials for Customer Service user
	## ) head to pumpadmin > mock email > locate customer.service.user.one and scrape password
	################################################################################################################
	
	Scenario: Scrape the auto-generated password for 'customer.service.user.one'
		Given I navigate to PumpAdmin Scripts list
		Given Pump Admin: I select the main menu item Debug
		And Pump Admin: I click the element with the attribute name and value _action_debugEmail
		And for the user 'customer.service.user.one' scrape the auto-generated password		
		
	Scenario: Login as 'customer.service.user.one'
		Given navigate to environment 'global site url'
		Given login as 'customer.service.user.one' with their randomly generated password

		## DEV COMMENT: Comment out on 1st run
		# Then Add one2Three to input field whose ancestor element contains attribute name and value password
		
		## DEV COMMENT: Comment out AFTER 1st run
		And Add to input field the platform default password whose ancestor element contains attribute name and value new
		And Add to input field the platform default password whose ancestor element contains attribute name and value repeat
		And I click the button html element, whose ancestor element contains attribute name and value rememberMe
		
		And I click the button html element, whose ancestor element contains attribute class and value footer btn-grp
		Then 'Frequent Tasks' is visible on screen
		
	## Login as new customer service user	
	## ) login as customer.service.user.one > run Assign Contact Centre to Local Office task
	################################################################################################################
	
	Scenario: Select task that has been assigned to 'customer.service.user.one' user
		And I select Assign Contact Centre to Local Office from the drop down list in the sidebar appflow for All Available Tasks		
		
	## Scrape user credentials for Sales user
	## ) head to pumpadmin > mock email > locate customer.service.user.one and scrape password
	################################################################################################################
	
	Scenario: Scrape the auto-generated password for 'sales.user.one'
		Given I navigate to PumpAdmin Scripts list
		Given Pump Admin: I select the main menu item Debug
		And Pump Admin: I click the element with the attribute name and value _action_debugEmail
		And for the user 'sales.user.one' scrape the auto-generated password		
		
	Scenario: Login as 'sales.user.one'
		Given navigate to environment 'global site url'
		Given login as 'sales.user.one' with their randomly generated password

		## DEV COMMENT: Comment out on 1st run
		# Then Add one2Three to input field whose ancestor element contains attribute name and value password
		
		## DEV COMMENT: Comment out AFTER 1st run
		And Add to input field the platform default password whose ancestor element contains attribute name and value new
		And Add to input field the platform default password whose ancestor element contains attribute name and value repeat
		And I click the button html element, whose ancestor element contains attribute name and value rememberMe
		
		And I click the button html element, whose ancestor element contains attribute class and value footer btn-grp
		Then 'Frequent Tasks' is visible on screen
		
	## Login as new customer service user	
	## ) login as customer.service.user.one > run Assign Contact Centre to Local Office task
	################################################################################################################
	
	Scenario: Select task that has been assigned to 'sales.user.one' user
		And I select Assign Contact Centre to Local Office from the drop down list in the sidebar appflow for All Available Tasks
		
	Scenario: Confirm client is available to select via Client Homepage dropdown 
		Given I select the item, with the text partially containing: .*Adam Apple.* , from the drop down list with the attribute data-ui-test and value aos.container.clients						
				
	## // 8704 B2C user groups within an office - END	
	
	## Confirm Client Administration is available to select for the HIA Admin 
	################################################################################################################
	
 	Scenario: Login as Home Instead HIA Admin
		Given Home Instead HIA Admin - login with henry.admin
		Then 'No install requests' is visible on screen
		
	Scenario: Select Client Administration from HIA Admin dashboard
		Then I select the item, with the text partially containing: .*Client Administration.* , from the drop down list with the attribute data-ui-test and value aos.container.tools
		
	## Remove permission for Anthropos Staff and confirm its disabled.
  ## -------------------------------------------------------------------------------------------------------------
  	
	## Add Assign Contact Centre to Local Office task to shortcuts then run the task
	################################################################################################################
	
 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Add Assign Contact Centre to Local Office to shortcuts
		And I select Assign Contact Centre to Local Office from the drop down list in the sidebar appflow for All Available Tasks
		And I click the button html element, number 2, whose ancestor element contains attribute class and value available-reports
		Then I confirm 'Assign Contact Centre to Local Office' is visible within the screen whose ancestor contains attribute 'class' and value 'sidebar-menu useful-tasks'
		
	Scenario: Run Configure Task Permissions task
		And I select Configure Task Permissions from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow		

	Scenario: Select Global from "Select customer to manage permissions for" screen
		Given 'Select customer to manage permissions for' is visible on screen
		Then I select Global Anthropos Permissions from the Customer selectable items in the Select customer to manage permissions for appflow
		Then I click next
		
	## Remove permission for Anthropos staff to run the Assign Contact Centre to Local Office task.
	################################################################################################################		
		
	Scenario: Remove permission for Anthropos staff to run the Create Anthropos Order task
		Given 'Configure Anthropos Task Permissions' is visible on screen
		Then select grid check box item row tableData_row06 and column tableData_row06__anthroposStaff
		Then I click next 
		
	Scenario: confirm we are back on the home screen
		Then 'Frequent Tasks' is visible on screen
		
	## Login again and confirm the task cannot be accessed
	################################################################################################################	

 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Click Assign Contact Centre to Local Office shortcut
		And I click the button html element, number 1, whose ancestor element contains attribute class and value sidebar-menu useful-tasks 
		
	Scenario: Confirm permission denied in accessing the Create Anthropos Order task
		Given 'Admin IoTAA permission denied' is visible on screen		
			
	## Add permission for Assign Contact Centre to Local Office for Home Instead Head office user, and NOT for Taking Care 
  ## -------------------------------------------------------------------------------------------------------------
  	
 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Configure Task Permissions
		And I select Configure Task Permissions from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow		

	Scenario: Select Home Instead from "Select customer to manage permissions for" screen
		Given 'Select customer to manage permissions for' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer to manage permissions for appflow
		Then I click next		
		
	Scenario: Add permission for Customer Staff (Head Office users) to run the tableData_row00__customerStaff task
		Given 'Configure Customer Task Permissions' is visible on screen
		Then select grid check box item row tableData_row00 and column tableData_row00__customerStaff
		Then I click next 
		
	Scenario: confirm we are back on the home screen
		Then 'Frequent Tasks' is visible on screen		
	
	#Customer: Confirm permission now available for Customer Staff/head office users	
	#- login as harry.hour (head office user) > confirm Configure Client Residences now in the Tasks dropdown.
	
 	Scenario: Login as Home Instead > head office user 'harry.hour'
		Given Home Instead Head office - login with harry.hour
		Then 'Frequent Tasks' is visible on screen	
		
	Scenario: Run Assign Contact Centre to Local Office task
		And I select Assign Contact Centre to Local Office from the drop down list in the sidebar appflow for All Available Tasks
		
	#Customer: Confirm different customer (Taking Care) NOT affected
	#- run Configure Task Permissions task > select PPP taking care > confirm "Configure Client Residences" is not checked	
	#- login as ppptc.headoffice > confirm "Configure Client Residences" NOT displayed	
	
 	Scenario: Login as Taking Care > head office user 'ppptc.headoffice' and confirm Assign Contact Centre to Local Office is NOT available
		Given Taking Care Head office - login with ppptc.headoffice
		Then 'Frequent Tasks' is visible on screen		
		And Confirm dropdown item 'Assign Contact Centre to Local Office' does not exist within the dropdown, whose ancestor element contains attribute 'class' and value 'available-reports'
	
	## // 8730 User permissions for Tasks that can be managed by Anthropos Support as an Admin task - END
		  	   	
	
				