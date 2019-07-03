#Author: chris.covell@anthropos.io
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

# !! JCARNEY 14/6/19: needs to be revisited. glue code probably needs updating !!

Feature: Manage new Configuration requests 
  Manage new Configuration
  
  Scenario: Login as Configuration Admin
    Given Pre Admin - login with pre.admin
		Then I confirm Pending Setup Requests is visible

	Scenario: Select setup request		
		Given expand card containing 001-00001
		Given collapse card containing 001-00001	