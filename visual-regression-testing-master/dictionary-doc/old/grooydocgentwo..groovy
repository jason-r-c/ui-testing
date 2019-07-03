import java.util.regex.Matcher;
import java.util.regex.Pattern;

String fileContents = new File('/Users/jasoncarney/repository/katalon-testing/iotaa-project/Keywords/iotaaDashboardUtils/Utilities.groovy').text

final String regex = ".*@anthropos-gherkin: (.*)";
final String string = "	/**\n"
	 + "	 * @anthropos-gherkin: drop the database -> resets the database\n"
	 + "	 */\n"
	 + "	@And(/^.*drop the database.*$/)\n"
	 + "	def dropDb() {\n"
	 + "		// Click the Drop Database radio button\n"
	 + "		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_drop'))\n\n"
	 + "		// Click submit\n"
	 + "		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))\n\n"
	 + "	} \n\n"
	 + "	/**\n"
	 + "	 * @anthropos-gherkin: confirm the password -> enter the password to refixture\n"
	 + "	 */\n"
	 + "	@And(/^.*confirm the password.*$/)\n"
	 + "	def confirmFixtureSavePassword() {\n"
	 + "		// Type password\n"
	 + "		WebUI.setText(findTestObject('IoTAA_PumpAdmin/input_password'), 'r353tFixture')\n"
	 + "	}\n\n"
	 + "	@Then(/^.*click submit to refixture.*$/)\n"
	 + "	def runRefixture() {\n"
	 + "		// Click the Submit button to save the fixture\n"
	 + "		WebUI.click(findTestObject('IoTAA_PumpAdmin/input_query'))\n\n"
	 + "		// Verify the iotaa fixture has been saved\n"
	 + "		WebUI.waitForElementPresent(findTestObject('IoTAA_PumpAdmin/div_Saved Iotaa'), 10)\n"
	 + "	}";

final Pattern pattern = Pattern.compile(regex);
final Matcher matcher = pattern.matcher(string);

while (matcher.find()) {
    System.out.println("Full match: " + matcher.group(0));
    for (int i = 1; i <= matcher.groupCount(); i++) {
        System.out.println("Group " + i + ": " + matcher.group(i));
    }
}
