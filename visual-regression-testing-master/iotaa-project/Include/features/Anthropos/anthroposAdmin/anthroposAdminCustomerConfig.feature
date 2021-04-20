#Author: callum.patience@anthropos.io
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
#
# includes cases: 1836, 1838, 1839, 2437, 5366

Feature: Ensure customer configuration works
	Changes customer product name, Checks product name in order form and Change product name back to Anthropos
	
	## // Refixture
	################################################################################################################
	
#	Scenario: Reset data
  #	Given Normalise the dashboard  	

	Scenario: Change customer product name
		Given Admin IoTAA - login with admin.iotaa		
		And 'Frequent Tasks' is visible on screen
		
		And I select Configure Customer from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow
		
		And 'Home Instead' is visible on screen
		And I select Home Instead in the Customer multi select list
		And I click next
		
		And 'Product Name' is visible on screen
		
		# JC 24/8/20: using better input field gherkin
		# And I enter productnametest in the Product Name field
		Then Add productnametest to input field whose ancestor element contains attribute name and value product
		
	## Case 8389: Ability to upload family app logo when creating customer
	## 1) Prove a logo can added for the family app:	
	##  upload new image 	
	Scenario:  Prove a logo can added for the family app
		Then I upload placeholder.png, whose ancestor element contains attribute name and value familyAppLogo
		And I wait 2 seconds before moving to the next step
# And I wait 500 seconds before moving to the next step
		And I click next
		
		
		
	Scenario: Check product name in order form
		Given Bristol office - login with bristol.office
		And 'Frequent Tasks' is visible on screen
		
		And I select Create Anthropos Order from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow
		
		And 'Postcode' is visible on screen
		
		# JC 24/8/20: using better input field gherkin
		# And I enter Product Name Test in the Surname field
		Then Add Product Name Test to input field whose ancestor element contains attribute name and value surname
		
		
		# JC 24/8/20: using better input field gherkin
  	# And I enter AA1 1AA in the Postcode field
  	Then Add AA1 1AA to input field whose ancestor element contains attribute name and value postcode
  	
  	And I click next
  	
  	#And 'Select existing order to continue, or create new order' is visible on screen
  	And _create new order if an order already exists
  	
  	# JC 24/8/20: using better input field gherkin
  	#And I enter Automated in the Forename field
  	Then Add Automated to input field whose ancestor element contains attribute name and value forename
  		
	  And I select Male from the Gender drop down list	
		And I enter 01 jan 1945 in the Date of Birth datepicker drop down list
	
		# JC 24/8/20: using better input field gherkin
		# And I enter 1 Top Gear Lane in the Address Line 1 field
		Then Add 1 Top Gear Lane to input field whose ancestor element contains attribute name and value address1
		
		# JC 24/8/20: using better input field gherkin
   	# And I enter Test Town in the Town field
   	Then Add Test Town to input field whose ancestor element contains attribute name and value town
   	
	  And I select Yes from the Does the client have broadband? drop down list
	  
	  # JC 24/8/20: using better input field gherkin
	  # And I enter Jill Test in the Who do we contact to arrange installation? field
	  Then Add Jill to input field whose ancestor element contains attribute name and value contactName
	  	 
		And I add 01234 567890 number in the Contact phone number telephone field
		
		# JC 24/8/20: using better input field gherkin
		# And I enter Daughter in the Relationship to client field
		Then Add Jill to input field whose ancestor element contains attribute name and value contactName
		
	  And I enter Broadband additional information in the textarea, whose ancestor element contains attribute name and value notes
	  
	  And I click next
	  
	  # And I confirm productnametest is visible
	  And 'Where precisely is the spare power socket' is visible on screen
	  
	  And I confirm Home Aware is not visible	  
	  
	  And I click back
	  And 'Section 1: Client Information' is visible on screen
	  
	  And I select No from the Does the client have broadband? drop down list
	  And I click next
	  
	  # And I confirm productnametest is visible
	  And 'productnametest' is visible on screen
	  
	  And I confirm Home Aware is not visible
	  