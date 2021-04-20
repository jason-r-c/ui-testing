# Author: 
# jason.carney@anthropos.io

# Keywords Summary:
#
# 8277 Client norms report 
# see acivitiy for client over the last 5 weeks,
# see average, min and max values for a scenario

# This feature covers cases: 
# 8277

Feature: Client norms report

	8277 Client norms report:
	Requirement: As an office user, I want a report that tells me the average activity for a client, 
	so that I can see their usual behaviour.

	## // Case 8277 Client norms report - START
	##
	## // Description 
	## See description at top of feature
	####################################################################################################

 	Scenario: Login as Anthropos admin
		Given Anthropos admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen
		
	Scenario: Run Client Norms Report
		And I select Client Norms Report from the drop down list in the sidebar appflow for All Available Reports
		And I click Run Report in the All Available Reports appflow	 

	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Home Instead from the Customer selectable items in the Select customer appflow		
		And I click next	
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next		
		
	Scenario: I select John Jenkins from the Client selectable items in the client who was installed appflow
		Then 'Please select the client to view' is visible on screen
		Then I select John Jenkins from the Client selectable items in the client who was installed appflow		
		And I click next
		
	 Scenario: Confirm scenarios displayed in the Client Norms report
	 	Given 'Rise time' is visible on screen
	 	Then 'Bathroom Visits' is visible on screen
	 	Then 'Bed time' is visible on screen
	 	Then 'Time in bedroom per night' is visible on screen
	 	Then 'Times out of bedroom per night' is visible on screen
	 	Then 'Number of Front Door Sensor opens per day' is visible on screen
		
	Scenario: Confirm Client Norms Report screen is displayed
		Given 'Summary of Client Norms Scenarios Report' is visible on screen
		Then I click the a html element, whose ancestor element contains attribute name and value result
		And confirm the file 'Client Norms Report.xls' was downloaded
	
	Scenario: Open Client Norms graph
		Given 'Summary of Client Norms Scenarios Report' is visible on screen
		Then I click the a html element, whose ancestor element contains attribute name and value graph		
		
	## // Case 8277 Client norms report - END
	####################################################################################################
			