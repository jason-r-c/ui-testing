## Summary

This project focuses on functional UI and visual regression testing of the Dashboards and App. Below is a brief explanation of the repository contents.

## How to run the tests

The UI Functional Testing Jenkins View has environments with test suites within. The test suites contains test cases that are ran against the Dashboard / App.

The environments targeted:
- Nightly
- Integration
- Regression

The jenkins jobs ssh into the Katalon server (Windows 10 AWS Instance). Then a batch script is ran and carries out the following:
- Removes the previous project every night
- A Katalon test suite is executed which then runs the containing test cases 
- The JUnit test result is saved to the Workspace for that job
- The JUnit report is copied back into jenkins for display

## Project structure
Below details the contents of the git repository

**mac-shell-scripts, windows-batch-scripts and linux-batch-scripts**

These contain the shell and batch scripts for running the tests in Console mode ( no need to manually open Katalon Studio ).

The Mac shell scripts are used for development and the Windows batch scripts are used for running the test suites on the Katalon server.

**iotaa-project**

The parent folder to the folders listed below. Note: this is the folder to open when using the Katalon IDE.

**Object Repository**

Contains all the elements recorded by the Web Recorder and edited for custom use. These are used by test cases so that they can find html elements ( Xpath is used to find elements ).

**Reports folder**

Contains a log of test suites ran in each environment. Each Jenkins job takes the `JUnit_Report.xml` which is created when each test suite is executed.

Note: The test case Jenkins console output is the same info printed to the Katalon console outout.

**Screenshots folder (visual regression testing)**

This contains `groundtruth.png` and `current.png`. 'groundtruth' is the definitive screenshot of the dashboards, and is used to compare the 'current' screenshot against.

**Scripts folder**

The Scripts folder contains test cases. Currently the test cases are very basic, ie, logging into the Dashboard and Family App. In future, more complex test cases would be created, targeting things that Anthrpos is interested in testing.

- `Archived_test_cases` contains test cases that been previously used and act as a form of reference for code that been used. Of particular interest i the `dashboards` folder. 

- `Environments` contains all the environments the test cases should be ran in.

- `Iotaa_UtilityScripts` contains `RunCustomScenario` and `SaveIotaaFixture`: 'RunCustomScenario' takes care of running the scenarios in pumpAdmin. 'SaveIotaaFixture' takes care of re-fixturing the IoTAA fixture.

- `Testing_playground_test_case` is where tests are carried. Usuallly, when recording new things, this is the script to use.

**Test Cases**

References the Groovy scripts in the Scripts folder.

**Test Suites**

Contains the Groovy test suite files. The test suite files are used in the shell and batch files.

## Compiling gherkin doc

Ideally we should only be documenting reusable code, ie, gherkin that can be written in future and works with existing glue code.

To compile dictionary files, go to the root of the katalon-testing directory and run 

```
groovy ~/repository/visual-regression-testing/dictionary-doc/gherkin-doc.groovy "iotaaDashboardUtils" "glueCode"

```

## Approach
It appears that using lower level gherkin is better as you get more flexibility when writing features, ie, one gherkin step carries out one thing in the bound glue code function.

## Reusable vs Hard coded glue code
The approach to glue code creation should be something like 75% reusable code vs 25% hard coded. In essence, we should mainly aim to write reusable glue code for feature files, but where glue code is difficult to write, a hard coded version should be written so that the test in question can be progressed.

## Where should hard coded glue code reside
Hard coded glue code should reside in Keyword files named after their respective feature files. An example that may make things clearer is below:

```
localOfficeCreateNewOrder_regressionTest
```

This Keyword file should only contain specific glue code for local office new order.

## Where should reusable glue code reside
In any Keyword file that is deemed appropriate for the glue code to reside in, ie, not a specific file like `localOfficeCreateNewOrder_regressionTest`

## Guide to writing reusable gherkin
The gherkin writer should be able to refer to the Dictionary for copying and pasting into the appropriate features.

## Guide to writing reusable Glue Code
An example glue code function:

```
/** @anthropos-gherkin:
 * Step: I enter (.*) in the (.*) field in the (.*) appflow. Description: Use this step for entering values into input fields. <br><br><strong>Example usage:</strong><br>I enter Ferrari in the Surname field.
 */
@Given('I enter (.*) in the (.*) field')
def i_enter_x_in_the_x_field(String inputValue, String inputField) {   
    def xpathQuery = "//label[contains( text(), '"+inputField+"' ) ]/following-sibling::input"

    def inputFieldObject = new TestObject('inputFieldObject')
    inputFieldObject.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
    WebUI.setText(inputFieldObject, inputValue)
}
```

### Comment
- Step: Enables the reader to copy the Gherkin, and replace the varibles with the values they want.
- Description: Tells the reader how to use the Step.
- Example usage: Gives the reader a solid example of how to use the Step

### Function name and arguments
The function name should be the same as the gherkin keyword, where
- underscores replace spaces
- regular expressions are replaced with the letter 'x'

Function argument names should describe the 'thing' itself, in the example below we care about
- The input value
- The input field label 

```
def i_enter_x_in_the_x_field(String inputValue, String inputField) { ... }
```

### Xpath query
Create an `xpathQuery` variable that holds the xpath query such as below:

```
def xpathQuery = "//label[contains( text(), '"+inputField+"' ) ]/following-sibling::input"
```

### Test object
Create a new test object and add an xpath property. This will check if the xpath query is matched.
We should 
- Create an object that is named after the element with 'Object' appended to the name
- Use the xpathQuery variable as an argument
- The last true argument, i think, informs the test that the html element is present in the DOM

```
def inputFieldObject = new TestObject('inputFieldObject')
inputFieldObject.addProperty("xpath", ConditionType.EQUALS, xpathQuery, true)
```

### Katalon method calls
Use the Katalon API to operate on the element. In the example below, we add some text the input field html element. The code is fairly descriptive about what its doing:

```
WebUI.setText(inputFieldObject, inputValue)
```

## Guide to writing hard coded Gherkin
Hard coded glue code should have an underscore prefixed to the Gherkin step in question. The rest of the wordage in the Gherkin step should have some variation such as additional / removal of words (so to avoid Ambiguous Step Definition errors), however the Gherkin should still make sense to the reader.

An example:

```
_choose Hallway from Front door sensor dropdown in Standard Devices appflow
```

## Guide to writing hard coded Glue Code
Hard coded Glue Code functions should have an underscore prefix to denote that its hard coded. An example:

```
def _i_enter_x_in_the_x_field_in_the_x_appflow(String inputValue, String inputField, String appflowScreen) { ... }
```


## Anatomy of feature file
    - Feature / test goal: Describes only one product feature, ie, Login, Use installation tool. Is a file that contains Gherkin.

    - Scenarios: Are containers which should summarise the Gherkin Steps within, ie, Create a client, Select a client

    - Step Definitions: Prefixed by a Gherkin keyword like 'Given, And, Then'. There after, it contains the content business rules.

    - Glue Code: The code that is bound to a Step Definition. This will run code in a web browser.




