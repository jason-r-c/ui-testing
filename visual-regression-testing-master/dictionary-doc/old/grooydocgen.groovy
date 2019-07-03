import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import java.util.regex.Pattern
import java.util.regex.Matcher


// ## JCARNEY: groovy command line shell: http://www.groovy-lang.org/groovysh.html#GroovyShell-exit
// ## install groovy http://groovy-lang.org/install.html#SDKMAN

// ##################################################### //

//## https://www.webucator.com/how-to/how-write-basic-groovy-script.cfm
// Basic Groovy Script
// Console console=System.console();
// def name=console.readLine("What is your name? ")
// println "Welcome to Groovy, $name!"

// JCARENY: read in the utilities class contents
String fileContents = new File('/Users/jasoncarney/repository/katalon-testing/iotaa-project/Keywords/iotaaDashboardUtils/Utilities.groovy').text
// println fileContents


// ##################################################### //
// ## https://gist.github.com/kdabir/2762870
//
// JCARNEY: this string works so keep it for now.
def thepattern = /.*@anthropos-gherkin:(.*)/
s = fileContents =~ thepattern
// println s

// ## http://grails.asia/groovy-find
//println  s.find { it }   
def x = s.find { it } 

// ## https://stackoverflow.com/questions/2060427/groovy-grails-how-to-determine-a-data-type
// println x.getClass()

// ## http://grails.asia/groovy-array-length
for (i = 0; i < x.size(); i++) {
   println x[i]
}

// while (
//     s.find()    
// ) println s.group()
// ##################################################### //


// ##################################################### //
// ## https://code-maven.com/groovy-files
// ## http://grails.asia/groovy-file-examples
// ## https://stackoverflow.com/questions/7729302/how-to-read-a-file-in-groovy-into-a-string
File file = new File("/Users/jasoncarney/repository/katalon-testing/dictionary-doc/dictionary.txt")

// ## https://stackoverflow.com/questions/45549160/how-to-clear-a-text-file-without-deleting-it-using-groovy
file.bytes = []
for (i = 0; i < x.size(); i++) {
    // println x[i]
    // file.write x[i] + "\n"
    
    // ## https://stackoverflow.com/questions/23410973/how-to-append-text-to-a-file-on-a-new-line
    file.append( x[i] + "\n" )
    
    // file << "This is the second line\n"
}
// println file.text

// ##################################################### //

// should be a better way to do regexes as opposed to =~
// def anygood = Pattern.compile(/(?m).*@anthropos-gherkin:(.*)/).matcher(fileContents)
// def anygoodafter = anygood.find { it } 
// println anygoodafter
