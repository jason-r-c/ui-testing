const fs = require('fs');
require('log-timestamp');

// const buttonPressesLogFile = './button-presses.log';
const buttonPressesLogFile = '../../iotaa-project/Keywords/iotaaDashboardUtils/glueCode.groovy';

console.log(`Watching for file changes on ${buttonPressesLogFile}`);

fs.watchFile(buttonPressesLogFile, (curr, prev) => {
  console.log(`${buttonPressesLogFile} file Changed`);

  var sys = require('sys')
  var exec = require('child_process').exec;
  var child;

  child = exec("groovy /Users/jasoncarney/repository/katalon-testing/dictionary-doc/gherkin-doc.groovy", function (error, stdout, stderr) {
    sys.print('stdout: ' + stdout);
    sys.print('stderr: ' + stderr);
    if (error !== null) {
      console.log('exec error: ' + error);
    }
  });
});


