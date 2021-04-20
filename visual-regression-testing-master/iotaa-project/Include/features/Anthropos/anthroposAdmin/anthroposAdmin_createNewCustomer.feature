# Author: 
# jason.carney@anthropos.io

# Keywords Summary:
#
# 7800 Ability to create new customer: 
# create new customer, add branding for customer, 
# create office, create client, run CAG / run client activity graph

# This feature covers cases: 
# 7800, 8601, 8458, 8458

# NOTE: 
# This test relies on the DNS entry nightlytestcustomer-nightly.test.anthropos.io existing, 
# and pointing to nightly.test.anthropos.io. Barney Parker added the DNS entry on 7/10/20.

Feature: Ability to create new customer
  
  7800 Ability to create new customer
  Creates a new customer adding Customer name, URL prefix, site title and branding/icons.
  The test then confirms we are able to create an office and client, then run the CAG to prove we can use
  the new office and client.
  Finally, we visit the new customer dashboard and login.
  
	8455 Customer logo shown in bottom left corner of dashboard:
	Confirm a new dashboard logo can be uploaded for new and existing customers.
	
	8601 Set branding colour as part of create customer:
	Sets the customer branding colours then confirms the colours display for the offce
	within the customer.  
	
	8458: Edit customer admin task:
	Confirms the Create New Customer now leads direct to Configure Customer, 
	to try & stop users creating customer & not configuring it.
	
	8458 Edit customer admin task:
	Edits a customer name, site title and icons

	## // Case 7800: Ability to create new customer - START
	##
	## // Description 
	## See "7800 Ability to create new customer" in header
	####################################################################################################

	## // Refixture
	####################################################################################################
	
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

	## Create a new Customer and enter name, url prefix and branding details
	####################################################################################################
		
	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Create New Customer task
		And I select Create New Customer from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 
		
	Scenario: Enter customer details: such as customer name, url and branding
		Given 'the new customer' is visible on screen
		
		## Customer name
		Then Add mytestcustomer to input field whose ancestor element contains attribute name and value name
		
		## URL prefix
		Then Add mytestcustomer to input field whose ancestor element contains attribute name and value urlPrefix
		
 		## Site title
		Then Add mytestcustomer site title to input field whose ancestor element contains attribute name and value siteTitle
		
 		## Upload site icon
		Then I upload test-icon-penguin.png, whose ancestor element contains attribute name and value icon
		
 		## Upload site login logo
		Then I upload test-icon-penguin.png, whose ancestor element contains attribute name and value loginLogo
		
 		## Upload site self service logo
		Then I upload test-icon-penguin.png, whose ancestor element contains attribute name and value selfServiceLoginLogo				
		Then I click next
	
	## // Case 8458: Edit customer admin task - START
	##
	## // Description 
	## Confirm we are on the configure customer screen
	####################################################################################################	
	Scenario: Confirm we are on the configure customer screen
		Given 'What is the name of the product for this customer' is visible on screen
		Then I click next  		
	## // Case 8458: Edit customer admin task - END

	Scenario: Confirm we are back on the home screen
		Given 'Frequent Tasks' is visible on screen 	

	## Create new office to prove we are able to under the new customer
	####################################################################################################
	
	Scenario: Select and run task: Offices Administration 
    Given I select Offices Administration from the drop down list in the sidebar appflow for All Available Tasks
    And I click Run Task in the All Available Tasks appflow
    
  Scenario: I select Example Customer from the Customer selectable items in the Select customer appflow
  	And 'Select customer' is visible on screen  	
    Then I select mytestcustomer from the Customer selectable items in the Select customer appflow
    And I click next       
    
  Scenario: select create new office
		Then I confirm 'Create New Office' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.admin.nationalAdmin.internal'
		Then select row Create New Office from single select appflow panel
		
	## Enter details for Example Customer office
	Scenario: Enter details for Example Customer office
	 	Given 'Order Installer Training for office' is visible on screen
	 	
	 	## Office name
	 	And Add mytestcustomer Office to input field whose ancestor element contains attribute name and value fn
	 	
	 	## Primary account details
	 	And Add mytestcustomer to input field whose ancestor element contains attribute name and value forename
	 	And Add Office to input field whose ancestor element contains attribute name and value surname
	 	And Add mytestcustomeroffice@test.com to input field whose ancestor element contains attribute class and value form-email
	 	
	 	## Alerts	 
	 	And I confirm Anthropos Installation is selected from the dropdown, whose ancestor element contains attribute name and value hia	 	
		Then I select the item, with the text partially containing: .*Anthropos Call Centre*. , from the drop down list with the attribute name and value cc
	 	And I click next
 		 	
 	Scenario: Confirm the Example Customer office has been created
 		Given 'Created Office: mytestcustomer Office' is visible on screen
 		Then click the header button: yourpicture, whose ancestor element contains attribute name and value yourpicture
			
	## Create a new client to prove we are able to under the new customer
	####################################################################################################
	
	Scenario: Select and run task: New Client [legacy] 
    Given I select Create New Client [legacy] from the drop down list in the sidebar appflow for All Available Tasks
    And I click Run Task in the All Available Tasks appflow
	
	Scenario: Select customer
		Given 'Select customer' is visible on screen 
		And I select mytestcustomer from the Customer selectable items in the Select customer appflow
		And I click next
		
	Scenario: Select office
		Given 'Select office' is visible on screen
		And I click next
	
	Scenario: Create the user
		Given 'Enter details of the user to add' is visible on screen
		Then Add mytestcustomer to input field whose ancestor element contains attribute name and value forename
		Then Add Client to input field whose ancestor element contains attribute name and value surname		
		And I click next

	Scenario: Accept defaults on 'please enter details of new user to create' screen
		Given 'please enter details of new user to create' is visible on screen
		Then I click next	
		
	Scenario: Enter primary contact details on 'Enter primary contact details' screen		
		Given I confirm 'Enter primary contact details for mytestcustomer Client' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.newClient.configure.internal'
		## Given 'primaryContact' is visible on screen
		Then Add mytestcustomer primary contact to input field whose ancestor element contains attribute name and value name
		And I add 12345 678910 number in the Contact mobile number telephone field
		And I click next
		
	Scenario: Skip 'Enter emergency contact details' screen
		Given 'Enter emergency contact details' is visible on screen
		Then I click next	 
		Then click the header button: yourpicture, whose ancestor element contains attribute name and value yourpicture

	## Run CAG to prove we can select office and client
	####################################################################################################
	
	Scenario: Run Client Activity Graph
		Given 'Frequent Tasks' is visible on screen
		And I select Client Activity Graph from the drop down list in the sidebar appflow for All Available Reports
		And I click Run Report in the All Available Reports appflow	 

	Scenario: I select Example Customer from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select mytestcustomer from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: I select Example Customer Office from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen		
		And I click next		
		
	Scenario: I select Ethan Example from the Client selectable items in the client who was installed appflow
		Then 'Generate Client Activity Graph' is visible on screen		
		And I click next
		And 'click here to download the graph' is visible on screen			
		Then click the header button: yourpicture, whose ancestor element contains attribute name and value yourpicture			
			
	## Navigate to and login to the new customer dashboard.
	#########################################################################################################		
	Scenario: Navigate to new customer site
		Given navigate to new customer url, where the prefix is 'mytestcustomer'
		Then Add admin.iotaa to input field whose ancestor element contains attribute name and value username
		Then Add one2Three to input field whose ancestor element contains attribute name and value password
		And I click the button html element, whose ancestor element contains attribute class and value footer btn-grp
		And 'Frequent Tasks' is visible on screen
	
	## // Case 7800: Ability to create new customer - END
	####################################################################################################
	
	
	
	
	
	## // Case 8455: Customer logo shown in bottom left corner of dashboard - START
	##
	## // Description 
	## See header info at top of feature.
	####################################################################################################
	
	## // Scrape the auto-generated password for 'mytestcustomer.office', login to 'mytestcustomer.office'
	## then confirm the Anthropos logo is displayed
	####################################################################################################
	
	Scenario: Scrape the auto-generated password for 'mytestcustomer.office'
		Given I navigate to PumpAdmin Scripts list
		Given Pump Admin: I select the main menu item Debug
		And Pump Admin: I click the element with the attribute name and value _action_debugEmail
		And for the user 'mytestcustomer.office' scrape the auto-generated password		
		
	Scenario: Login as 'mytestcustomer.office'
		Given navigate to environment 'global site url'
		Given login as 'mytestcustomer.office' with their randomly generated password

		## DEV COMMENT: Comment out on 1st run
		# Then Add one2Three to input field whose ancestor element contains attribute name and value password
		
		## DEV COMMENT: Comment out AFTER 1st run
		And Add to input field the platform default password whose ancestor element contains attribute name and value new
		And Add to input field the platform default password whose ancestor element contains attribute name and value repeat
		And I click the button html element, whose ancestor element contains attribute name and value rememberMe
		
		And I click the button html element, whose ancestor element contains attribute class and value footer btn-grp
		And confirm instance '12' of element 'div' whose ancestor element has attribute 'class' and value 'iotaa-sidebar ' with css selector 'background-image' set to 'anthropos-dash-logo.png'
		
	Scenario: Login as Bristol office
		Given Bristol office - login with bristol.office
		Then 'Frequent Tasks' is visible on screen		

	Scenario: Confirm the Bristol office logo remains the same
		And confirm instance '12' of element 'div' whose ancestor element has attribute 'class' and value 'iotaa-sidebar ' with css selector 'background-image' set to 'hi-dash-logo.png'
	
	## // Upload new Dashboard logo for mytestcustomer office
	####################################################################################################
	
	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
	
	Scenario: Select and run Configure Customer task
		Given I select Configure Customer from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow    
		
	Scenario: Select the Home Instead customer		
		Then 'Select customer' is visible on screen
		And I select mytestcustomer in the Customer multi select list
		And I click next	
		
	Scenario: Upload new dashboard logo
		Given  I upload hello-world-320x120.png, whose ancestor element contains attribute name and value dashboardLogo
		Then 'hello-world-320x120.png' is visible on screen
		
	## // Case 8601: Set branding colour as part of create customer - START
	##
	## Description Add custom colour scheme for the customer
	####################################################################################################
	Scenario: Add colour scheme
		Then Add EB4034 to input field whose ancestor element contains attribute name and value bgcolor1
		Then Add EB4034 to input field whose ancestor element contains attribute name and value bgcolor2
		Then Add 000000 to input field whose ancestor element contains attribute class and value form-element form-color2 form-textValue
		And I click next	
	
	## // Confirm the default Anthropos logo no longer exists (replaced with new logo), 
	## and the customer colour scheme is displayed
	####################################################################################################
	Scenario: Login as Bristol office
		Given mytestcustomer.office - login with mytestcustomer.office
		Then 'Frequent Tasks' is visible on screen	
		
	Scenario: Confirm the default Anthropos logo no longer exists (replaced with new logo), and the customer colour scheme is displayed
		Given confirm image containing filename 'anthropos-dash-logo.png' whose ancestor contains attribute 'class' and value 'iotaa-sidebar' does not exist
		And confirm instance '1' of element 'div' whose ancestor element has attribute 'class' and value 'os-background' with css selector 'background-color' set to 'rgba(235, 64, 52, 1)'
		And confirm instance '1' of element 'div' whose ancestor element has attribute 'class' and value 'cog-body' with css selector 'background-color' set to 'rgba(235, 64, 52, 1)'
		And confirm instance '1' of element 'p' whose ancestor element has attribute 'class' and value 'profile-info sidebar-section' with css selector 'color' set to 'rgba(0, 0, 0, 1)'		  			
	## Case 8455: Customer logo shown in bottom left corner of dashboard, 
	## Case 8601: Set branding colour as part of create customer - END

	## // Case 8458: Edit customer admin task - START
	##
	## Edit a newly created customer
	####################################################################################################
 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Edit Customer task
		And I select Edit Customer from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: Edit customer details
		Given 'Please enter the defails for the customer' is visible on screen
		
		## Change customer name
		Then Add Home Instead - test to input field whose ancestor element contains attribute name and value name
		
		## Site title
		Then Add Home Instead - test to input field whose ancestor element contains attribute name and value siteTitle
								
		## Upload customer icon
		Then I upload hello-world-320x120.png, whose ancestor element contains attribute name and value icon
		And 'hello-world-320x120.png' is visible on screen
		
		## Login image		
		Then I upload house-layout.jpg, whose ancestor element contains attribute name and value loginLogo
		And 'house-layout.jpg' is visible on screen
		
		## Self-Service image		
		Then I upload placeholder.png, whose ancestor element contains attribute name and value selfServiceLoginLogo
		And 'placeholder.png' is visible on screen		
		And I click next
		Then 'Frequent Tasks' is visible on screen
	## // Case 8458: Edit customer admin task - END	