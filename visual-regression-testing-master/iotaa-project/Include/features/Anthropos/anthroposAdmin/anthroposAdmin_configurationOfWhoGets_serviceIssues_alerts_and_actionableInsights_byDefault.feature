# Author: 
# jason.carney@anthropos.io

# Keywords Summary:
#
# xx11 name of case: 
# various ways to describe the case, more ways, other ways, etc
#
# xx12 xxzy:
# various ways to describe the case, more ways, other ways, etc

# This feature covers cases: 
# 7873, 7872, 7874, 8591

Feature: Configuration of who gets service issues, alerts and actionable insights by default

	7873: Configuration of who gets service issues by default:
	Confirms Service Issues that are set at the customer level, are displayed in the family app
	when a service issue is genereated.
	
	7872: Configuration of who gets alerts by default:
	Confirms Alerts that are set at the customer level, are displayed in the  Office
	when an Alert issue is genereated.	
	
	7872: Configure who gets actionable insights by default
	
	8591: Options for fridge sensor device configurable at customer level, but selectable at order time
	
	## // Refixture
	################################################################################################################
	
	Scenario: Reset data
  	Given Normalise the dashboard	
	
	## // Case 8591: Options for fridge sensor device configurable at customer level, 
	## but selectable at order time - START
	##
	## // Description 
	## Select differennt options for the type of fridge sensor at the customer level.
	####################################################################################################	
 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Configure Customer task
		And I select Configure Customer from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
	
	## Scenario: Confirm Motion and Door can be selected as the Fridge Sensor Type	
	Scenario: Confirm Motion and Door can be selected as the Fridge sensor Type
		Then 'What type of device should be used for monitoring fridges?' is visible on screen
		Then I select the item, with the text partially containing: .*Motion Sensor.* , from the drop down list with the attribute name and value fridgeType
		Then I select the item, with the text partially containing: .*Door Sensor.* , from the drop down list with the attribute name and value fridgeType
		Then I select the item, with the text partially containing: .*Door sensor, but motion sensor selectable instead.* , from the drop down list with the attribute name and value fridgeType
		Then I select the item, with the text partially containing: .*Motion sensor, but door sensor selectable instead.* , from the drop down list with the attribute name and value fridgeType				
		And I click next
	## Case 8591: Options for fridge sensor device configurable at customer level, but selectable at order time - END

	## // Case 7872: Configuration of who gets alerts by default - START
	##
	## // Description 
	## xxx	
	####################################################################################################

	
	## 1) Can I set which options are possible at the Customer level?
	####################################################################################################

	## ) Login as admin.iotta >  Create a new order for user Adam Apple > when you reach the create new family member screen, 
	## ensure you create a member called Ant Apple > on the "Who will receive alerts and actionable insights" screen you will 
	## see that the Office is the default option, and are able to choose family and contact centre recipients.

  Scenario: Login to Anthropos dashboard
		Given Anthropos dashboard - login with admin.iotaa
    Then 'Frequent Tasks' is visible on screen

  Scenario: Select a new order
    Given I select Create Anthropos Order from the drop down list in the sidebar appflow for All Available Tasks     		
    And I click Run Task in the All Available Tasks appflow    		
  
	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next		
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next	  
  
  Scenario: Enter client details
  	Then 'Enter client details' is visible on screen
  	And Add Apple to input field whose ancestor element contains attribute name and value surname 	
  	And Add AA1 1AA to input field whose ancestor element contains attribute name and value postcode  	
  	And I click next
  	And _create new order if an order already exists
  	
	## Click next before filling in the mandatory fields, check that we get the error message, then proceed.
	Scenario: 1843 test mandatory fields
		Then 'Section 1: Client Information' is visible on screen		
		
	## // 
	####################################################################################################
	
	Scenario: Enter general details 	
  	And Add Adam to input field whose ancestor element contains attribute name and value forename			
	  And I select Male from the Gender drop down list	
		And I enter 01 jan 1945 in the Date of Birth datepicker drop down list		  
  	And Add 1 Top Gear Lane to input field whose ancestor element contains attribute name and value address1		     
  	And Add Test Town to input field whose ancestor element contains attribute name and value town    
	  And I select Yes from the Does the client have broadband? drop down list	    
  	And Add Ant Apple to input field whose ancestor element contains attribute name and value contactName	  	  
		And I add 01234 567890 number in the Contact phone number telephone field
  	And Add Daughter to input field whose ancestor element contains attribute name and value contactRelationship				  
	  And I enter additional information in the textarea, whose ancestor element contains attribute name and value notes	       		
		And I click next 
		
	Scenario: Enter broadband room details
		Given 'Please tell us below if it is not within 1 metre of the broadband router' is visible on screen	
  	And Add Hallway to input field whose ancestor element contains attribute name and value room	  
	  And Add Kitchen to input field whose ancestor element contains attribute name and value socketLocation	  
		And I check the Please tick the box to confirm acceptance checkbox
		And I check another instance of the Please tick the box to confirm acceptance checkbox - number 2
		And I click next

	Scenario: Alerts Management Service: Set alerts to be managed by Anthropos Call Centre / PPP TC
		Given 'Alerts Management Service' is visible on screen
		Then I select the item, with the text partially containing: No , from the drop down list with the attribute name and value alerts
		And I click next
				
	## // Case 6559 (1st block of scenarios): Vital Signs order form pages - START
	####################################################################################################				
		
	## Add the Vitals package to the order	
	Scenario: Select Packages
		Given 'Section 4: Anthropos Packages Required' is visible on screen
		
		## Add Hydration package.	
		Then Add Hydration to input field whose ancestor element contains attribute name and value packages			
		Then For the html element 'input' whose ancestor contains attribute 'name' and value 'packages', click the 'enter' key
		And 'Hydration & Nutrition' is visible on screen
		
		## Add Vulnerable package.	
		Then Add Vulnerable to input field whose ancestor element contains attribute name and value packages				
		Then For the html element 'input' whose ancestor contains attribute 'name' and value 'packages', click the 'enter' key
		And 'Vulnerable Client' is visible on screen		
		
		## Set monthly fee, Anthropos to do installation and one off fee for installation. 
		Then _choose Monthly fee from How will the client be dropdown
		And _choose Anthropos from Who will be performing the installation dropdown
		And _choose One-off charge from How will the client be charged dropdown
		And I click next
		
	Scenario: 1945 Enter sensors, this also tests validation case 4552
		Given 'Section 5: Standard Devices' is visible on screen	
		Then I click next
		And 'If not installed, a reason why must be specified' is visible on screen		
		And _choose Hallway from Front door sensor dropdown in Standard Devices appflow
	  And _choose Kitchen from Back door sensor dropdown in the Door Sensors appflow		
	 
	Scenario: Verify if alert required. Case 4318
		Given select grid check box item row devices1a_row00 and column devices1a_row00_alert
		And select grid check box item row devices1a_row00 and column devices1a_row00_alert
		And select grid check box item row devices1a_row01 and column devices1a_row01_alert
		And I click next
		
	## Case 6731: Switch Fridge sensor to PIR. 
	## Case 8591: Options for fridge sensor device configurable at customer level, but selectable at order time
	## Confirm Fridge is now a PIR in the Hydration and Nutrition screen.
	Scenario: Confirm we are on the Hydration and Nutrition screen
		Given 'Section 6: Hydration & Nutrition Devices' is visible on screen
		Then select grid check box item row devices3_row00 and column devices3_row00_power
		Then select grid check box item row devices3_row01 and column devices3_row01_power
		And 'Fridge sensor' is visible on screen
		Then I select the item, with the text partially containing: .*Door Sensor.* , from the drop down list with the attribute name and value devices3a_row00_type
		Then I select the item, with the text partially containing: .*Motion Sensor.* , from the drop down list with the attribute name and value devices3a_row00_type
		Then I click next
		
	## Case 6731: Switch Fridge sensor to PIR. 
	## Confirm Fridge is now a PIR in the Hydration and Nutrition screen.
	Scenario: Confirm we are on the Hydration and Nutrition screen
		Given 'Section 7: Vulnerable Client Devices' is visible on screen
		Then select grid check box item row devices4_row00 and column devices4_row00_power
		Then select grid check box item row devices4_row01 and column devices4_row01_power
		Then select grid check box item row devices5_row00 and column devices5_row00_power		
		Then I click next		
			
	## // Case 6559 (1st block of scenarios): Vital Signs order form pages - END
	####################################################################################################	  		
				
	Scenario: Additional devices
		Given 'Additional sensors required' is visible on screen
		Then I select Continue from the Option drop down list		
		And I click next
		
	Scenario: Complete order
		Given 'Do you wish to complete the survey and create new client' is visible on screen
		Then I select Complete survey and create client from the Choice drop down list	
		And I click next
		
	Scenario: Finished 2376
		Given 'Finished' is visible on screen		
		And I confirm 'Thank you for submitting your Anthropos order for Adam Apple, your reference number for this order is' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.preinstall.homeSurvey.internal'
		And I confirm 'Our scheduling team will contact you within 3 working days to arrange the installation appointment for your client.' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.preinstall.homeSurvey.internal'		
		And I confirm 'To check the status of your order at any time you can run the Order Status report from your dashboard.' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.preinstall.homeSurvey.internal'
		And I confirm 'Before the day of the installation appointment you will have to provide some additional set up data for this clients, please select next if you wish to do that now.' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.preinstall.homeSurvey.internal'
		And I click next
		 		
	Scenario: Create family app user 
		Given 'Current Family App Users' is visible on screen
		Then I select the item, with the text partially containing: Add new Family App User , from the drop down list with the attribute name and value option
		And I click next	

	Scenario: Add Family Member
		Given 'Enter details for new Family App user' is visible on screen  	
		And Add Ant to input field whose ancestor element contains attribute name and value fname
		And Add Apple to input field whose ancestor element contains attribute name and value sname
		And Add Ant.Apple@test.com to input field whose ancestor element contains attribute name and value email		
		And I add 01234 567890 number in the Mobile Number telephone field
		And I select No from the Receive alerts by text? drop down list
		And I select No from the Receive alerts by email? drop down list
		And I click next
	   
	Scenario: Continue to next screen 
		Given 'Current Family App Users' is visible on screen
		Then I select the item, with the text partially containing: Continue , from the drop down list with the attribute name and value option
		And I click next		   
	  
	## // Case 5627: Confirms ooh and oo default to Anthropos call centre / PPP TC 
	####################################################################################################
	
	
	## // Case 7872: (1st block of scenarios): Configuration of who gets alerts by default - START
	## // Confirm we can select the options set at the customer level		
	Scenario: Confirms ooh and oo default to Anthropos call centre / PPP TC
		Given 'Who will receive alerts and actionable insights' is visible on screen		
		Then I confirm Office Dashboard is selected from the dropdown, whose ancestor element contains attribute name and value alertDayRecipient

		## Custom level config drives options available.	
		Then I select the item, with the text partially containing: .*Call Centre.* , from the drop down list with the attribute name and value alertDayRecipient
		Then I select the item, with the text partially containing: .*Family App.* , from the drop down list with the attribute name and value alertDayRecipient
		Then I select the item, with the text partially containing: .*Office Dashboard.* , from the drop down list with the attribute name and value alertDayRecipient
		
		Then I select the item, with the text partially containing: .*Call Centre.* , from the drop down list with the attribute name and value alertOohRecipient
		Then I select the item, with the text partially containing: .*Family App.* , from the drop down list with the attribute name and value alertOohRecipient
		Then I select the item, with the text partially containing: .*Office Dashboard.* , from the drop down list with the attribute name and value alertOohRecipient
		
		And I confirm Office Dashboard is selected from the dropdown, whose ancestor element contains attribute name and value insightRecipient
		And I confirm Office Dashboard is selected from the dropdown, whose ancestor element contains attribute name and value serviceIssuesRecipient
		And I click next
	## // Case 7872: (1st block of scenarios): Configuration of who gets alerts by default - START
		
  Scenario: Office Accounts for Client
  	Given 'Office Accounts for Client' is visible on screen  	  	
    And I click next
    
	Scenario: Desired scenarios
		Given 'Desired Scenarios' is visible on screen		
		Then I click next
		
	Scenario: Standard scenarios		
		## Given 'Scenario Configuration' is visible on screen
		Given 'Please configure the settings for the client' is visible on screen
		And I click next
		
	Scenario: finish		
		Given 'Configuration Complete' is visible on screen
		And I click next
		
 	## // Create an Anthropos order - END
  ###################################################################################################		
	

	## - Generate an alert for Adam Apple: Run the NoMovementScript > log back into bristol office > confirm alert has been generated
	####################################################################################################
	
 	Scenario: Create configured order so we are ready for installation 
  	Given I navigate to PumpAdmin Scripts list
  	And I select com.pumpco.iotaa.NoMovementScript script 
  	And Add Custom Script Parameter to Run Script within pumpadmin: value username in field number 1
	  And Add Custom Script Parameter to Run Script within pumpadmin: value adam.apple in field number 2 
  	And I click the run button
		And I ensure that the AppFlow status is complete 
		
  Scenario: Login to the Office
		Given Office - login with bristol.office
    Then 'Frequent Tasks' is visible on screen
    And 'No movement detected' is visible on screen		
    
   ## ) Login as admin iotaa > Configure Customer task > uncheck Offices for Alerts > set alerts to "Contact Centre, then Family" >
	####################################################################################################
	
 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Configure Customer task
		And I select Configure Customer from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: I select freddie ford from the Client selectable items in the client who was installed appflow
		Then 'What is the name of the product for this customer?' is visible on screen
		And select grid check box item row allowedRecipients_row00 and column allowedRecipients_row00_office
		Then I select the item, with the text partially containing: Contact Centre, then Family , from the drop down list with the attribute name and value allowedRecipients_row00_defaults		
		And I click next  
		Then 'Frequent Tasks' is visible on screen
		
  	## // Clear mock email
	####################################################################################################
	
	Scenario: Navigate to Pump Admin home page
		Given I open the web browser
		Then Pump Admin: I go to Pump Admin		
		And 'Welcome To Pumphouse Administration' is visible on screen	
		
	Scenario: Clear mock email 
		Given Pump Admin: I select the main menu item Debug
		And Pump Admin: I click the element with the attribute name and value _action_clearEmail  	
 
 	## - Run the Assign Contact Centre to Local Office task > assign No Contact Centre to bristol office
	####################################################################################################
	
 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Assign Contact Centre to Local Office task
		And I select Assign Contact Centre to Local Office from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next		
		
	Scenario: Set No Contact Centre for Bristol office
		Then 'Select Contact Centre for Bristol to use' is visible on screen
		Then I select No Contact Centre from the Contact Centre selectable items in the Contact Centre appflow		
		And I click next	
		Then 'Frequent Tasks' is visible on screen

	## - Create a new order for user called Charlie Citrus > when you reach the create new family member screen, 
	## ensure you create a member Chaz Citrus > on the "Who will receive alerts and actionable insights" screen you will 
	## see the Alerts does not default to Contact Centre as the Office does not have one, it falls back to Family App.
	########################################################################################################
	
	## Create a 2nd anthropos order - START
	########################################################################################################
	
  Scenario: Select a new order
    Given I select Create Anthropos Order from the drop down list in the sidebar appflow for All Available Tasks     		
    And I click Run Task in the All Available Tasks appflow    		
  
	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next		
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next	  
  
  Scenario: Enter client details
  	Then 'Enter client details' is visible on screen
  	And Add Citrus to input field whose ancestor element contains attribute name and value surname 	
  	And Add AA1 1AA to input field whose ancestor element contains attribute name and value postcode  	
  	And I click next
  	And _create new order if an order already exists
  	
	## Click next before filling in the mandatory fields, check that we get the error message, then proceed.
	Scenario: 1843 test mandatory fields
		Then 'Section 1: Client Information' is visible on screen		
		
	## // 
	####################################################################################################
	
	Scenario: Enter general details 	
  	And Add Charlie to input field whose ancestor element contains attribute name and value forename			
	  And I select Male from the Gender drop down list	
		And I enter 01 jan 1945 in the Date of Birth datepicker drop down list		  
  	And Add 1 Top Gear Lane to input field whose ancestor element contains attribute name and value address1		     
  	And Add Test Town to input field whose ancestor element contains attribute name and value town    
	  And I select Yes from the Does the client have broadband? drop down list	    
  	And Add Chaz Citrus to input field whose ancestor element contains attribute name and value contactName	  	  
		And I add 01234 567890 number in the Contact phone number telephone field
  	And Add Daughter to input field whose ancestor element contains attribute name and value contactRelationship				  
	  And I enter additional information in the textarea, whose ancestor element contains attribute name and value notes	       		
		And I click next 
		
	Scenario: Enter broadband room details
		Given 'Please tell us below if it is not within 1 metre of the broadband router' is visible on screen	
  	And Add Hallway to input field whose ancestor element contains attribute name and value room	  
	  And Add Kitchen to input field whose ancestor element contains attribute name and value socketLocation	  
		And I check the Please tick the box to confirm acceptance checkbox
		And I check another instance of the Please tick the box to confirm acceptance checkbox - number 2
		And I click next

	Scenario: I confirm Alerts Management Service is not visible
		Given I confirm Alerts Management Service is not visible		
				
	## // Case 6559 (1st block of scenarios): Vital Signs order form pages - START
	####################################################################################################				
		
	## Add the Vitals package to the order	
	Scenario: Select Packages
		Given 'Section 4: Anthropos Packages Required' is visible on screen
		
		## Add Hydration package.	
		Then Add Hydration to input field whose ancestor element contains attribute name and value packages		
		Then For the html element 'input' whose ancestor contains attribute 'name' and value 'packages', click the 'enter' key
		
		## Add Vulnerable package.	
		Then Add Vulnerable to input field whose ancestor element contains attribute name and value packages		
		Then For the html element 'input' whose ancestor contains attribute 'name' and value 'packages', click the 'enter' key		
		
		## Set monthly fee, Anthropos to do installation and one off fee for installation. 
		Then _choose Monthly fee from How will the client be dropdown
		And _choose Anthropos from Who will be performing the installation dropdown
		And _choose One-off charge from How will the client be charged dropdown
		And I click next
		
	Scenario: 1945 Enter sensors, this also tests validation case 4552
		Given 'Section 5: Standard Devices' is visible on screen	
		Then I click next
		And 'If not installed, a reason why must be specified' is visible on screen		
		And _choose Hallway from Front door sensor dropdown in Standard Devices appflow
	  And _choose Kitchen from Back door sensor dropdown in the Door Sensors appflow		
	 
	Scenario: Verify if alert required. Case 4318
		Given select grid check box item row devices1a_row00 and column devices1a_row00_alert
		And select grid check box item row devices1a_row00 and column devices1a_row00_alert
		And select grid check box item row devices1a_row01 and column devices1a_row01_alert
		And I click next
		
	## Case 6731: Switch Fridge sensor to PIR. 
	## Confirm Fridge is now a PIR in the Hydration and Nutrition screen.
	Scenario: Confirm we are on the Hydration and Nutrition screen
		Given 'Section 6: Hydration & Nutrition Devices' is visible on screen
		Then select grid check box item row devices3_row00 and column devices3_row00_power
		Then select grid check box item row devices3_row01 and column devices3_row01_power
		And 'Fridge sensor' is visible on screen
		Then I click next
		
	## Case 6731: Switch Fridge sensor to PIR. 
	## Confirm Fridge is now a PIR in the Hydration and Nutrition screen.
	Scenario: Confirm we are on the Hydration and Nutrition screen
		Given 'Section 7: Vulnerable Client Devices' is visible on screen
		Then select grid check box item row devices4_row00 and column devices4_row00_power
		Then select grid check box item row devices4_row01 and column devices4_row01_power
		Then select grid check box item row devices5_row00 and column devices5_row00_power		
		Then I click next		
			
	## // Case 6559 (1st block of scenarios): Vital Signs order form pages - END
	####################################################################################################	  		
				
	Scenario: Additional devices
		Given 'Additional sensors required' is visible on screen
		Then I select Continue from the Option drop down list		
		And I click next
		
	Scenario: Complete order
		Given 'Do you wish to complete the survey and create new client' is visible on screen
		Then I select Complete survey and create client from the Choice drop down list	
		And I click next
		
	Scenario: Finished 2376
		Given 'Finished' is visible on screen		
		And I confirm 'Thank you for submitting your Anthropos order for Charlie Citrus, your reference number for this order is' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.preinstall.homeSurvey.internal'
		And I confirm 'Our scheduling team will contact you within 3 working days to arrange the installation appointment for your client.' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.preinstall.homeSurvey.internal'		
		And I confirm 'To check the status of your order at any time you can run the Order Status report from your dashboard.' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.preinstall.homeSurvey.internal'
		And I confirm 'Before the day of the installation appointment you will have to provide some additional set up data for this clients, please select next if you wish to do that now.' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.preinstall.homeSurvey.internal'
		And I click next
		 		
	Scenario: Create family app user 
		Given 'Current Family App Users' is visible on screen
		Then I select the item, with the text partially containing: Add new Family App User , from the drop down list with the attribute name and value option
		And I click next	

	Scenario: Add Family Member
		Given 'Enter details for new Family App user' is visible on screen  	
		And Add Chaz to input field whose ancestor element contains attribute name and value fname
		And Add Citrus to input field whose ancestor element contains attribute name and value sname
		And Add Chaz.Citrus@test.com to input field whose ancestor element contains attribute name and value email		
		And I add 01234 567890 number in the Mobile Number telephone field
		And I select No from the Receive alerts by text? drop down list
		And I select No from the Receive alerts by email? drop down list
		And I click next
	   
	Scenario: Continue to next screen 
		Given 'Current Family App Users' is visible on screen
		Then I select the item, with the text partially containing: Continue , from the drop down list with the attribute name and value option
		And I click next		   
	  
	## // Case 5627: Confirms ooh and oo default to Anthropos call centre / PPP TC 
	####################################################################################################
	
	
	## // Case 7872: (1st block of scenarios): Configuration of who gets alerts by default - START
	## // Confirm we can select the options set at the customer level		
	Scenario: Confirms ooh and oo default to Anthropos call centre / PPP TC
		Given 'Who will receive alerts and actionable insights' is visible on screen				

		## Custom level config drives options available.		
		Then I select the item, with the text partially containing: .*Family App.* , from the drop down list with the attribute name and value alertDayRecipient
		Then I select the item, with the text partially containing: .*Family App.* , from the drop down list with the attribute name and value alertOohRecipient
		
		Then I select the item, with the text partially containing: .*Family App.* , from the drop down list with the attribute name and value insightRecipient
		Then I select the item, with the text partially containing: .*Office Dashboard.* , from the drop down list with the attribute name and value insightRecipient
		
		Then I select the item, with the text partially containing: .*Family App.* , from the drop down list with the attribute name and value serviceIssuesRecipient
		Then I select the item, with the text partially containing: .*Office Dashboard.* , from the drop down list with the attribute name and value serviceIssuesRecipient
		And I click next
	## // Case 7872: (1st block of scenarios): Configuration of who gets alerts by default - START
	
#And I wait 500 seconds before moving to the next step
		
	Scenario: How to deal with alerts not acknowledged on the Family App - During Office Hours
		Given 'During Office Hours' is visible on screen
		Then I select the item, with the text partially containing: .*Chaz Citrus.* , from the drop down list with the attribute name and value escalationContact
		Then Add 5 to input field whose ancestor element contains attribute name and value escalationMins
		And I click next
	
	Scenario: How to deal with alerts not acknowledged on the Family App - Outside of Office Hours
		Given 'Outside of Office Hours' is visible on screen
		Then I select the item, with the text partially containing: .*Chaz Citrus.* , from the drop down list with the attribute name and value escalationContact
		Then Add 5 to input field whose ancestor element contains attribute name and value escalationMins
		And I click next
		
  Scenario: Office Accounts for Client
  	Given 'Office Accounts for Client' is visible on screen  	  	
    And I click next
    
	Scenario: Desired scenarios
		Given 'Desired Scenarios' is visible on screen		
		Then I click next
		
	Scenario: Standard scenarios		
		## Given 'Scenario Configuration' is visible on screen
		Given 'Please configure the settings for the client' is visible on screen
		And I click next
		
	Scenario: finish		
		Given 'Configuration Complete' is visible on screen
		And I click next		
		
 	## // Create a 2nd Anthropos order - END
  ###################################################################################################
  
  ## - Generate an alert for Charlie Citrus: Run the NoMovementScript 		
	###################################################################################################
	
 	Scenario: Trigger No Movement alert for Charlie Citrus 
  	Given I navigate to PumpAdmin Scripts list
  	And I select com.pumpco.iotaa.NoMovementScript script 
  	And Add Custom Script Parameter to Run Script within pumpadmin: value username in field number 1
	  And Add Custom Script Parameter to Run Script within pumpadmin: value charlie.citrus in field number 2  
  	And I click the run button
		And I ensure that the AppFlow status is complete 
	
	
	## - Run Send Login Details to Family App Users task  
	###################################################################################################
	
Scenario: Login to the Office
		Given Office - login with admin.iotaa
    Then 'Frequent Tasks' is visible on screen
	
	Scenario: I select Send Login Details to Family App Users from the drop down list in the sidebar appflow for All Available Tasks
		Given 'Frequent Tasks' is visible on screen
		And I select Send Login Details to Family App Users from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 			
		
	Scenario: I select Example Customer from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: I select Bristol Office from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next	
		
	Scenario: Select client Charlie Citrus
		Then 'Select client' is visible on screen
		Then I select Charlie Citrus from the Client selectable items in the client who was installed appflow			
		And I click next	
				
	Scenario: Click next on Family member screen
		Then I confirm 'Family member' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.family.login.email.internal'
		And I click next		
		Then 'Frequent Tasks' is visible on screen
		
	## scrape login details 
	###################################################################################################

	Scenario: Scrape the auto-generated password for 'chaz.citrus'
		Given I navigate to PumpAdmin Scripts list
		Given Pump Admin: I select the main menu item Debug
		And Pump Admin: I click the element with the attribute name and value _action_debugEmail
		And for the user 'chaz.citrus' scrape the auto-generated password		
		
	## > login as new family member > confirm alert has been generated
	###################################################################################################		
		
	Scenario: Login as 'chaz.citrus'
		Given navigate to environment 'global site url'
		Given login as 'chaz.citrus' with their randomly generated password

		## DEV COMMENT: Comment out on 1st run
		# Then Add one2Three to input field whose ancestor element contains attribute name and value password
		
		## DEV COMMENT: Comment out AFTER 1st run
		And Add to input field the platform default password whose ancestor element contains attribute name and value new
		And Add to input field the platform default password whose ancestor element contains attribute name and value repeat
		And I click the button html element, whose ancestor element contains attribute name and value rememberMe		
		And I click the button html element, whose ancestor element contains attribute class and value footer btn-grp
		
		## Confirm we have logged in and the alert is displayed
		And 'Hydration' is visible on screen	
		And 'Charlie Citrus: No movement detected' is visible on screen	
	
	## // Case 7872: Configuration of who gets alerts by default - END
	####################################################################################################
		
	## Actionable insights
	####################################################################################################

 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Configure Customer task
		And I select Configure Customer from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: Select Family, then Office for Service Insights
		Then 'What is the name of the product for this customer?' is visible on screen
		And select grid check box item row allowedRecipients_row01 and column allowedRecipients_row01_family
		Then I select the item, with the text partially containing: Office , from the drop down list with the attribute name and value allowedRecipients_row01_defaults		
		And I click next  
		Then 'Frequent Tasks' is visible on screen
		
	## Service Issues
	####################################################################################################
	
	Scenario: Run Configure Customer task
		And I select Configure Customer from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow	 

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: Select Family, then Office for Service Issues
		Then 'What is the name of the product for this customer?' is visible on screen
		And select grid check box item row allowedRecipients_row02 and column allowedRecipients_row02_family
		Then I select the item, with the text partially containing: Office , from the drop down list with the attribute name and value allowedRecipients_row02_defaults		
		And I click next  
		Then 'Frequent Tasks' is visible on screen