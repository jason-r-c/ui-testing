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

Feature: Do install 
  Perform new Install
  
  Scenario: Login as Install Admin
    Given HIA Admin - login with henry.admin
		Then I confirm Installations is visible
		And I confirm My Installations is visible
		
		
	# JC 31/5/19
	Scenario: Assign order
		## Note, this is currently using the test data created by the com.pumpco.iotaa.NewAnthroposOrderAndPreInstallScript script
		# Given expand card containing 001-00001
		
		# And I click the New Installation Request card start link
		# And I click the Start link in the card containing 001-00001 
		
		# JC 30/5/19: Click manage button in csv-table
		And I click the manage button in the installations table 
		
		And I select Assign installation to installer from the Option drop down list
		And I click next
		
		And I select Ivan Install from the Installer drop down list
		And I click next
  
  Scenario: Login as Installer
    Given Installation Tool - login with ivan.install
		Then I confirm My Install Requests is visible		
		# JCARNEY 13/6/19: Updated gherkin so is less specific, ie we can check for text in any container containing the html attribute data-ui-test="aos.container" 
		# 14/6/19
		Given I confirm the text 001-00001 resides in container My Install Requests
		
		
	Scenario: Finish feature
		Then confirm feature is complete