# Author: 
# jason.carney@anthropos.io

# Keywords Summary: 
#
# escalation values when creating new office, default office hours when creating new office,  
# 
# default alerts and insights to be sent by email, client admin / client administration, 
#
# click client admin tile / click client administration tile, edit client alerts and insights,
#
# set Alerts during office hours / set Alerts out of office hours

# This feature covers cases: 
# 4689, 6468, 5680

Feature: Check offices listed and navigate to each office 
  Checks each office is as expected, then navigates to each office, confirms visitation and navigation back to admin office 
  
  6468: Checks for default escalation details (taken from primary account), hours default to 9-5 mon-fri / closed sat-sun, 
 	and "forward alerts and insights via email" is set to Yes (others set to No) 
	
	5680: Forces an option to be selected for assigning a call centre when creating a new office (can be set to none).
	Confirms that the Anthropos Call Centre appears as an option to selection for 
	"Alerts during office hours" and "Alerts out of office hours".
	
   Scenario: Login
     Given Anthropos Support - login with admin.iotaa  
     
   Scenario: Navigate to Bristol office (covers case 4689)
   	 And 'Frequent Tasks' is visible on screen
   	 And 'Local Offices' is visible on screen   	 
     Then I click Bristol from the card row item list
     And 'you are visiting' is visible on screen
		 And 'Bristol office' is visible on screen		           
     And click home button and head back to home screen          

   Scenario: Navigate to Swindon office
		 And 'Local Offices' is visible on screen		 
     Then I click Swindon from the card row item list
     And 'you are visiting' is visible on screen
     And 'Swindon office' is visible on screen     
     And click home button and head back to home screen
     
   Scenario: Navigate to PrepairedEquipment office office   	 
   	 And 'Local Offices' is visible on screen   	 
     Then I click Prepaired Equipment from the card row item list    
     And 'you are visiting' is visible on screen
     And 'PrepairedEquipment office' is visible on screen     
     And click home button and head back to home screen 
     
		###############################################################################################
		## // !! JCARNEY 08/06/20: 
		## // Removed Kington Langley and Torbay as these consistently failed in headless mode !!
		###############################################################################################
        	     
   Scenario: Navigate to Prepaired Equipment office office
   	 And 'Local Offices' is visible on screen   	 
     Then I click Prepaired Equipment from the card row item list
     And 'PrepairedEquipment office' is visible on screen        
     And click home button and head back to home screen      

		Scenario: Navigate to Offices Administration appflow
			Given click on sidebar Apps button
			And 'planner' is visible on screen
			And click the tile entitled Admin						
			And 'Select task' is visible on screen
			And I select Offices Administration from the Select task drop down list
			
		Scenario: Select customer
			And I click next			
			And 'Home Instead' is visible on screen
			And I select Home Instead in the Customer multi select list
			
		Scenario: Select create New Office
			And I click next			
			And '+ Create New Office' is visible on screen
			And select row Create New Office from single select appflow panel				
			
		## // Case 6468: default values for escalation contacts, alert preferences, 
		## // and office hours when creating a new office - START
		####################################################################################################
		
		Scenario: Create New Office
			Given 'email' is visible on screen			
			And Add Top Gear Studios to input field whose ancestor element contains attribute name and value fn
						
			## Checks for default escalation details
			And I confirm the content [PRIMARY ACCOUNT] is present within the input, whose ancestor element contains attribute name and value esc_email
			And I confirm the content [PRIMARY ACCOUNT] is present within the input, whose ancestor element contains attribute name and value esc_oohEmail
			And I confirm the content [PRIMARY ACCOUNT] is present within the input, whose ancestor element contains attribute name and value esc_mobile
			And I confirm the content [PRIMARY ACCOUNT] is present within the input, whose ancestor element contains attribute name and value esc_oohMobile

			## Check hours default to 9-5 mon-fri, closed sat-sun
			And confirm instance '1' of element 'button' whose ancestor element has attribute 'name' and value 'officeHoursTable_row02_mon' with css selector 'background-color' set to 'rgba(33, 150, 243, 1)'
			And confirm instance '1' of element 'button' whose ancestor element has attribute 'name' and value 'officeHoursTable_row02_tue' with css selector 'background-color' set to 'rgba(33, 150, 243, 1)'
			And confirm instance '1' of element 'button' whose ancestor element has attribute 'name' and value 'officeHoursTable_row02_wed' with css selector 'background-color' set to 'rgba(33, 150, 243, 1)'
			And confirm instance '1' of element 'button' whose ancestor element has attribute 'name' and value 'officeHoursTable_row02_thu' with css selector 'background-color' set to 'rgba(33, 150, 243, 1)'
			And confirm instance '1' of element 'button' whose ancestor element has attribute 'name' and value 'officeHoursTable_row02_fri' with css selector 'background-color' set to 'rgba(33, 150, 243, 1)'
			And confirm instance '1' of element 'button' whose ancestor element has attribute 'name' and value 'officeHoursTable_row01_sat' with css selector 'background-color' set to 'rgba(33, 150, 243, 1)'
			And confirm instance '1' of element 'button' whose ancestor element has attribute 'name' and value 'officeHoursTable_row01_sun' with css selector 'background-color' set to 'rgba(33, 150, 243, 1)'

			And Add Top Gear to input field whose ancestor element contains attribute name and value forename			
			And Add Office Admin to input field whose ancestor element contains attribute name and value surname
			And Add topgear.user@topgear.com to input field whose ancestor element contains attribute class and value form-element form-email form-textValue
			
			## confirm Forward alerts & insights via email is set to Yes
			And I confirm Yes is selected from the dropdown, whose ancestor element contains attribute name and value alerts_row00_emailAlerts
			And I confirm No is selected from the dropdown, whose ancestor element contains attribute name and value alerts_row00_emailServiceIssues
			And I confirm No is selected from the dropdown, whose ancestor element contains attribute name and value alerts_row00_emailResolvedServiceIssues
			And I confirm No is selected from the dropdown, whose ancestor element contains attribute name and value alerts_row00_smsAlerts
			And I confirm No is selected from the dropdown, whose ancestor element contains attribute name and value alerts_row00_smsServiceIssues
			And I confirm No is selected from the dropdown, whose ancestor element contains attribute name and value alerts_row00_smsResolvedServiceIssues
						
			## Case 5680 (1st block of scenarios): Assigning call centre to office done on office set up - START
			Then I select the item, with the text partially containing: .*Anthropos Call Centre*. , from the drop down list with the attribute name and value cc
			## Case 5680 (1st block of scenarios): Assigning call centre to office done on office set up - END
			And I click next
			
		## // Case 6468: default values for escalation contacts, alert preferences, 
		## //and office hours when creating a new office - END
		####################################################################################################			
			
		Scenario: confirm offices has been created	
			Given 'Created Office: Top Gear Studio' is visible on screen
			
		# >> JC 12/7/20: test now does not rely on automatic display of office, browser refreshes instead. 
   	Scenario: Login again to view the new office on the dashboards
     Given Anthropos Support - login with admin.iotaa  
			
  	Scenario: Navigate to Top Gear office   	 
   		And click home button and head back to home screen
 	 		And 'Local Offices' is visible on screen   	   	  
     	Then I click Top Gear from the card row item list    
     	And 'you are visiting' is visible on screen
     	And 'Top Gear Office' is visible on screen     
  
	## // Case 5680 (2nd block of scenarios): Assigning call centre to office done on office set up - START
	##
	## // Description:
	## Select Anthropos Call Centre from the  "Alerts during office hours" 
	## and "Alerts out of office hours" dropdown
	####################################################################################################
	
  Scenario: Login to the Office
		Given Office - login with bristol.office
    Then 'Frequent Tasks' is visible on screen
    
  Scenario: Click Admin tasks button
  	Given I click the dashboard container button Admin tasks
  	
	Scenario: Click tile: Client Administration
  	Then I confirm 'Client Administration' is visible within the screen whose ancestor contains attribute 'name' and value 'Iotaa.localOfficeAdminSpace'  	
  	And click the tile entitled Client Admin
  	
	Scenario: Select client from Clients list: John Jenkins
  	Then I confirm 'John Jenkins' is visible within the screen whose ancestor contains attribute 'name' and value 'users'  	
  	Then select row John Jenkins from single select appflow panel
  	
	Scenario: Click edit link for: Alerts and Insights 
  	And 'Third-party IDs' is visible on screen
  	And Click the link with html name attribute editAlertAndInsights
  	
	Scenario: Confirm Anthropos Call Centre is an option to select from "Who will receive alerts and actionable insights" screen
  	And I select the item, with the text partially containing: .*Anthropos Call Centre.* , from the drop down list with the attribute name and value alertDayRecipient
		And I select the item, with the text partially containing: .*Anthropos Call Centre.* , from the drop down list with the attribute name and value alertOohRecipient
   	
 	## // Case 5680 (2nd block of scenarios): Assigning call centre to office done on office set up - END
	####################################################################################################
		