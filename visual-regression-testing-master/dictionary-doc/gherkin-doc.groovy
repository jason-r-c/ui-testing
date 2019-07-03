import java.io.*
import java.util.regex.*

// ====================================================================================================
// ====================================================================================================
// ====================================================================================================

def argOne = ''
try { 
   	argOne = args[0]
	argTwo = args[1]

	println '\nKeyword file to compile anthropos gherkin is: ../Keywords/' + argOne +'/'+ argTwo + '\n'
	
} catch(Exception e) {
   println "\n################################################################################ \n"
   println '''\nAnthropos gherkin: You must append 
   - The package name (argOne)
   - The Keyword name (argTwo)
   to the command \n
   Example usage: \n groovy /Users/jasoncarney/repository/visual-regression-testing/dictionary-doc/gherkin-doc.groovy "reusableGlueCode" "appflows" 
    \n################################################################################ \n'''
}

// ## https://stackoverflow.com/questions/7729302/how-to-read-a-file-in-groovy-into-a-string
def fileContents = new File('/Users/jasoncarney/repository/visual-regression-testing/iotaa-project/Keywords/'+argOne+'/'+argTwo+'.groovy').text 
// println fileContents

// ====================================================================================================
// ====================================================================================================
// ====================================================================================================

// def articleContent =  "<![CDATA[ Hellow World ]]>"

// def result = (articleContent =~ /<!\[CDATA\[(.+)]]>/)[0][1]
// println result

// ## http://groovy-lang.org/syntax.html#_triple_single_quoted_string
// Used initally before reading in the file. We need to use 3 single quotes.
def regexOne =  '''	
	/**
	 * @anthropos-gherkin: Step: drop the database. Description: Resets the database to its default state.
	 */
	@And(/^.*drop the database.*$/)
	def dropDb() {
		// Click the Drop Database radio button
		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_drop'))

		// Click submit
		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))
	}
	
	/**
	 * @anthropos-gherkin: Step: confirm the password. Description: Adds the password for refixturing.
	 */
	@And(/^.*confirm the password.*$/)
	def confirmFixtureSavePassword() {
		// Type password
		WebUI.setText(findTestObject('IoTAA_PumpAdmin/input_password'), 'r353tFixture')
	}

	/**
	 * @anthropos-gherkin: Step: click submit to refixture. Description: Runs the refixture in PumpHouse
	 */
	@Then(/^.*click submit to refixture.*$/)
	def runRefixture() {
		// Click the Submit button to save the fixture
		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))

		// Verify the iotaa fixture has been saved
		WebUI.waitForElementPresent(findTestObject('IoTAA_PumpAdmin/div_Saved Iotaa'), 10)
	}'''
// ====================================================================================================
// ====================================================================================================
// ====================================================================================================

// ## Regex Matcher object doc: http://docs.groovy-lang.org/latest/html/groovy-jdk/java/util/regex/Matcher.html
// ## extract substring using regex in groovy: https://stackoverflow.com/questions/17536921/extract-substring-using-regex-in-groovy
// ## reg exes
// 1) def resultOne = (fileContents =~ /.*@anthropos-gherkin:.*/)
// 2) break step, content, description, content: (Step: )(.*)(Description: )(.*)
def resultOne = (fileContents =~ /(Step: )(.*)(Description: )(.*)/)
// 3) 
// def resultOne = (fileContents =~ /(Step.*)\s(Description.*)/)

// ## Some useful Regex Matcher object methods
// println resultOne
// println resultOne.getCount()
// println resultOne.getAt([0])
// println resultOne.size()

File file = new File("/Users/jasoncarney/repository/visual-regression-testing/dictionary-doc/"+argTwo+".html")

// Clear down array
file.bytes = []

// ====================================================================================================

// 3) version 3: simple layout that uses nested loop
// file.append('<html><head><link rel = "stylesheet" type = "text/css" href = "documentation.css" /></head><body>')
// // Each item is nested which i dont quie know why, but this works!
// for(i=0; i < resultOne.size(); i++) {
// 	// println resultOne[0][1]
// 	// file.append( "<p>"+resultOne[i] + "</p>" )
// 	// println resultOne[i]

// 	file.append('<div class="gherkin-step">')
// 	for(j=1; j < resultOne[i].size(); j++) {
// 		//println resultOne[i][j]	
// 		if(j % 2 != 0) {
// 			println "is true"
// 			file.append( '<p class="gherkin-name">'+resultOne[i][j]+ '</p>' )
// 		} else {
// 			println "is false"			
// 			file.append( "<p class='gherkin-description'>"+resultOne[i][j]+ "</p>" )
// 		}	
// 	}
// 	file.append('</div>')
// }
// file.append('</body></html')

// ====================================================================================================

// JC 10/5/19: If we are using glueCode.groovy, then display Dashboards as the Gherkin doc title.
if(argOne ==  'iotaaDashboardUtils') {
	argTwo = 'Dashboards'
}

// 2) version 2: nice styled layout
file.append('''<html><head><link rel = "stylesheet" type = "text/css" href = "documentation.css" /></head><body>
<div id="header">
	<div id="logo-container">
		<img src="Anthropos_landscape_colour_RGB.png" />		
	</div>
	<div id="header-text">
		<h2>''' + argTwo + '''</h2>
		<p>This documentation describes the Gherkin Steps that can be used when writing Gherkin feature files. Each heading 'Step' is a step phrase that can be reused / copied into a Gherkin feature. A Gherkin Step is bound to its correpsponding Glue Code step.</p>
		<p>Each 'Description' heading should inform the reader of what that step does, enabling the user to select the appropriate choice.</p>
		<p><strong>Note:</strong> Where you see (.*) this represents any predefined value</p>
	</div>
</div>
<div class="gherkin-step-grid">''')

// Each item is nested which i dont quie know why, but this works!
for(i=0; i < resultOne.size(); i++) {
	// println resultOne.size()
	// file.append( "<p>"+resultOne[i] + "</p>" )
	// println resultOne[i]

	// Removes the trailing period from step names
	def xy = resultOne[i][2]
	def ab = /[.][*]/
	if(xy =~ ab) { 
		// Removes the trailing perioed only for steps with periods elsewhere
		xy = xy.substring(0, xy.length() - 2)		
	} else { 
		// Removes all instances of periods
		xy = xy.replaceAll('\\.',' ') 					
	}	

	file.append('<div class="gherkin-step">')
		file.append( '<h2 class="gherkin-name-title">'+resultOne[i][1]+ '</h2>' )		
		file.append( '<p class="gherkin-name">'+xy+ '</p>' )	

		file.append( '<h2 class="gherkin-desc-title">'+resultOne[i][3]+ '</h2>' )		
		file.append( '<p class="gherkin-desc">'+resultOne[i][4]+ '</p>' )		
	file.append('</div>')
}
file.append('</div></body></html')

println "The amount of Gherkin Steps documented: " + resultOne.size()