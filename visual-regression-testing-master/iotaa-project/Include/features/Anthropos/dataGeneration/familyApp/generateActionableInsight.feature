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
@tag
Feature: Create Local Office Actionable Insight
  Create Local Office Actionable Insight for the Local Office dashboard
  
	Scenario: Login to the Head Office to start Service Status card content creation process
		Given login to Head Office as admin.iotaa using onetwothree
		And click on sidebar Apps button
		And click the tile entitled Admin
		And I select Manage Alerts & Insights from the Select task drop down list
		And I click next
		And I select Home Instead in the Customer multi select list
		And I click next
		And I select Bristol in the Local Office multi select list
		And I click next
		And I select John Jenkins in the Select client to manage alert & insights for multi select list
		And I click next
		And I select Family App from the Alerts during office hours drop down list
		And I select Family App from the Alerts out of office hours drop down list
		And I select Family App from the Actionable Insights drop down list
		And I click next
		And I select Other from the Who to escalate to drop down list
		And I click next
		And I add 12345 678910 number in the Mobile Number telephone field
		And I click next
		And I select Other from the Who to escalate to drop down list
		And I click next
		And I add 12345 678910 number in the Mobile Number telephone field
		And I click next
		And I click next
		And I confirm finish is visible  

	Scenario: Create Local Office Actionable Insight	
		Given I navigate to PumpAdmin Scripts list
		And I select com.pumpco.iotaa.NoKettleForTimeScript script
		And I click the run button
		And I ensure that the AppFlow status is complete
			
	Scenario: Finish feature
		And confirm feature is complete