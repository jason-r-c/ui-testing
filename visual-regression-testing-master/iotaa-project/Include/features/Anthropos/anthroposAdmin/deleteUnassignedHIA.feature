# Author: jason.carney@anthropos.io

# Keywords Summary: delete HIA, delete unassigned HIA, unable to delete assigned HIA

# This feature covers cases: 6683

Feature: Delete unassigned HIA

	6683: Confirm that we can delete an unassigned HIA.
 	Confirm that you cannot delete an assigned HIA (which is being used by any office), and that a list of offices are displayed.
 	
	## // Refixture
	################################################################################################################
  Scenario: Reset data
  	Given Normalise the dashboard   
  	
	Scenario: Close browser
  	Then confirm feature is complete

 	## // Case 6683 (1st block of scenarios): Delete HIA Admin Task - START
 	## // Delete the Anthropos Installation HIA.
	################################################################################################################
		
 	Scenario: Login as admin.iotaa
		Given Admin - login with admin.iotaa
		Then 'Frequent Tasks' is visible on screen

	## // 2) Run Assign HIA to office task for Bristol: Set Anthropos Installation 
	################################################################################################################
   	
  Scenario: Select and run Task: Assign HIA to Office
    Given I select Assign HIA to Office from the drop down list in the sidebar appflow for All Available Tasks
    And I click Run Task in the All Available Tasks appflow 
       	
	Scenario: I select Home Instead from the Select customer selectable items in the Customer appflow
		Then 'Select customer' is visible on screen
		Then I select Anthropos Digital Care from the Customer selectable items in the Select customer appflow		
		And I click next
		
	Scenario: I select Bristol from the Office selectable items in the Select office appflow
		Then 'Select office' is visible on screen
		##Then I select Bristol from the Office selectable items in the Select office appflow		
		And I click next		
		
	Scenario: I select Anthropos Installation
		Then 'Select HIA for Kington Langley' is visible on screen
		Then I select Anthropos Installation from the HIA selectable items in the Select office appflow		
		And I click next		
		
 	Scenario: Confirm we are back on the home screen
		Then 'Frequent Tasks' is visible on screen			

	## Delete the HIA		
		
	Scenario: Run Delete HIA task
		And I select Delete HIA from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow
						
	Scenario: Select Anthropos Installation from the list of HIAs
		Given 'Select HIA' is visible on screen
		And I select Chippenham Installs from the HIA selectable items in the Select HIA appflow			
		And I click next	
		
	Scenario: Confirm we want delete the Anthropos Installation HIA and delete it
		Given 'Confirm Delete HIA' is visible on screen
		Then I select the item, with the text partially containing: .*Yes, delete HIA*. , from the drop down list with the attribute name and value confirm		
		And I click next			
	
	Scenario: Confirm we are back on the home screen
		Given 'Frequent Tasks' is visible on screen
		
 	## // Case 6683 (1st block of scenarios): Delete HIA Admin Task - END
	################################################################################################################
	
 	## // Case 6683 (2nd block of scenarios): Delete HIA Admin Task - START
 	## // Confirm we canot delete the Anthropos Installation HIA, as it is assigned to an office.
	################################################################################################################
		
	Scenario: Run Delete HIA task
		And I select Delete HIA from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow		
		
	Scenario: Select Anthropos Installation from the list of HIAs
		Given 'Select HIA' is visible on screen
		And I select Anthropos Installation from the HIA selectable items in the Select HIA appflow		
		And I click next	
		
	Scenario: Confirm we cannot delete the HIA, and the list of offices the HIA is assigned to is displayed
		Given 'Cannot Delete HIA' is visible on screen
		Then 'Cannot delete Anthropos Installation as it is currently assigned to: Bristol, Swindon, Prepaired Equipment' is visible on screen		
		And I click next					
	
	Scenario: Confirm we are back on the home screen
		Given 'Frequent Tasks' is visible on screen	
		
	Scenario: Run Delete HIA task
		And I select Delete HIA from the drop down list in the sidebar appflow for All Available Tasks
		And I click Run Task in the All Available Tasks appflow		

	Scenario: Confirm Anthropos Installation is still in the list of HIAs
		Given 'Anthropos Installation' is visible on screen
		
 	## // Case 6683 (2nd block of scenarios): Delete HIA Admin Task - END
	################################################################################################################		