# Author: 
# jason.carney@anthropos.io

# Keywords Summary:
# 
# send system emails, confirm system email has been sent, confirm system email content, dispalyed system email info / dispalyed system email content,
#
# email report, email task, get emails sent by system

# This feature covers cases: 
# 3446, 7763

Feature: Ensure "from noreply@anthropos.io" when email is sent  
  Under Office Admin, create a new Torbay user and send email confirming account details. 
  
  7763 View emails sent by system: Confirms that emails sent by the system are sent out.
  NOTE: in test environments, these are converted to testing@anthropos.io

# Clear previous emails first
	Scenario: Confirm we are on the Pump Admin home page
		Given I navigate to PumpAdmin Scripts list
		# And I confirm Run Script is visible
		And 'Run Script' is visible on screen  
		
	Scenario: Clear previously sent emails
		Given Pump Admin: I select the main menu item Debug
		And Pump Admin: I click the element with the attribute name and value _action_clearEmail
		
	Scenario: Confirm emails are cleared		
		# Given I confirm cleared is visible		
		And 'cleared' is visible on screen

# Create user to trigger email
  Scenario: Log on as Admin 
  	Given Head Office - login with admin.iotaa
  	# And I confirm Admin IoTAA is visible
  	And 'Frequent Tasks' is visible on screen
  	
	Scenario: Select and Office Users Administration appflow 
  	Then I select Office Users Administration from the drop down list in the sidebar appflow for All Available Tasks
  	And I click Run Task in the All Available Tasks appflow 
  	
	Scenario: Select Torbay & South Devon NHS Trust from from the customer list
		# Given I confirm Select customer is visible
		And 'Select customer' is visible on screen
		And I select Torbay & South Devon NHS Trust in the Customer multi select list
		And I click next
		
	Scenario: Select Torbay office 
		# Given I confirm Select office is visible
		And 'Select office' is visible on screen
		And I select Torbay in the Office multi select list
		And I click next			
		
	Scenario: Select create admin option 
		# Given I confirm Office admins is visible
		And 'Office admins' is visible on screen
		And Click the link with html name attribute createAdmin		
		
	Scenario: Create Office Account	
		# Given I confirm Create Office Account is visible
		And 'Create Office Account' is visible on screen
		And Add Terry to input field whose ancestor element contains attribute name and value forename
		And Add Tesla to input field whose ancestor element contains attribute name and value surname
		And Add terry.tesla@test.com to input field whose ancestor element contains attribute name and value email
		And Add terry.tesla.ooh@test.com to input field whose ancestor element contains attribute name and value oohEmail
		And I add 12345 12345 number in the mobile phone telephone field
		And I add 12345 12345 number in the OOH Mobile telephone field
		And I click next

	Scenario: Confirm Office admins is visible
		# Given I confirm Office admins is visible
		And 'Office admins' is visible on screen
		
# Confirm contents of email
	Scenario: Confirm we are on the Pump Admin home page
		Given Pump Admin: I go to Pump Admin
		# And I confirm Welcome To Pumphouse Administration is visible
		And 'Welcome To Pumphouse Administration' is visible on screen
		
	Scenario: View mock email		
		Given Pump Admin: I select the main menu item Debug
		# And I confirm Debugging is visible
		And 'Debugging' is visible on screen
		And Pump Admin: I click the element with the attribute name and value _action_debugEmail
		
	Scenario: Confirm email sent correctly (covers case 3446)
		And 'noreply@anthropos.io' is visible on screen
		

	## // Case 7763: View emails sent by system - START
	##
	## // Description
	## Run the System Support Tasks task, search for emails sent by testing@anthropos.io, then 
	## confirm the email was sent, and confirm content of the email.
	####################################################################################################
	
	## Clear previous emails first
#	Scenario: Confirm we are on the Pump Admin home page
#		Given I navigate to PumpAdmin Scripts list
#		And 'Run Script' is visible on screen  
#		
#	Scenario: Clear previously sent emails
#		Given Pump Admin: I select the main menu item Debug
#		And Pump Admin: I click the element with the attribute name and value _action_clearEmail
#		
#	Scenario: Confirm emails are cleared				
#		And 'cleared' is visible on screen	
	
	## Begin process to check system emails
  Scenario: Login to the Anthropos admin dashboard
		Given Anthopos admin - login with admin.iotaa
    Then 'Frequent Tasks' is visible on screen
    
  Scenario: Select and run Task: System Support Tasks
    Given I select System Support Tasks from the drop down list in the sidebar appflow for All Available Tasks
    And I click Run Task in the All Available Tasks appflow	    
    
	Scenario: Select Search emails by Email Address from dropdown
		Given I confirm 'System Support tasks' is visible within the screen whose ancestor contains attribute 'name' and value 'iotaa.form.manage.system.support'
		Then I select the item, with the text partially containing: .*Search emails by Email Address.* , from the drop down list with the attribute name and value option
		And I click next
		
	## Search for 'testing@anthropos.io'. NOTE: In test, this email address is used (all emails are converted to this email address). 
	Scenario: Enter email address testing@anthropos.io which we want to search
		Given 'Search Emails' is visible on screen
		Then Add testing@anthropos.io to input field whose ancestor element contains attribute class and value form-email
		And I click next
		
	## Confirm information about the email is displayed within the table.
	Scenario: Confirm information about the email is visible
		Given 'View email' is visible on screen
		Given I confirm table cell content 'is exactly': noreply@anthropos.io, located by row number 2 and column 3, whose ancestor element contains attribute name and value showEmails
		Then I confirm table cell content 'is exactly': testing@anthropos.io, located by row number 2 and column 4, whose ancestor element contains attribute name and value showEmails
		Then I confirm table cell content 'is exactly': Welcome to Anthropos, located by row number 2 and column 5, whose ancestor element contains attribute name and value showEmails
	 
	Scenario: Select the 1st email from dropdown list
		Given 'View email' is visible on screen
		Then I select item '1' , from the drop down list with the attribute name and value email
		And I click next
		
	## ) Confirm there is email content displayed
	Scenario: Confirm email contents
		Given 'welcome to Anthropos.' is visible on screen
		And 'We have created an account for you on the Anthropos system.' is visible on screen
		And 'Your username is' is visible on screen
	
	## // Case 7763: View emails sent by system - END
	####################################################################################################
					