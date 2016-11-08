import 'dart:convert';
import 'package:args/args.dart';
import 'dart:io';

int vowelMinimum;
int skipWords;
int skipLines;
final List<String> vowels = ["A", "E", "I", "O", "U"];
void main(List<String> arguments) {
  //for (int i = 0; i < 5; i++) {
  //  print('hello ${i + 1}');
  // }
  var parser = new ArgParser();

  parser.addOption('vowels', abbr: 'v', defaultsTo: '3');
  parser.addOption('skip-words', abbr: 'w', defaultsTo: '1');
  parser.addOption('skip-lines', abbr: 'l', defaultsTo: '3');

  var results = parser.parse(arguments);

  vowelMinimum = int.parse(results['vowels']);
  skipWords = int.parse(results['skip-words']);
  skipLines = int.parse(results['skip-lines']);

  if (!(vowelMinimum > 0)) {
    vowelMinimum = 3;
    print("Minimum Number of Vowels must be greater than Zero\n");
  }

  if (!(skipWords > 0)) {
    skipWords = 1;
    print("Number of skip-words must be greater than Zero\n");
  }

  if (arguments.length < 3) {
    print("Using Default Arguments");
  }
  print("Minimum Number of Vowels: $vowelMinimum");
  print("Skiping every $skipWords Words");
  print("Skiping every $skipLines Lines");

  /*var message = """
      I pledge allegiance to the Flag of the United States of America, 
 and to the Republic for which it stands, one Nation under God, 
indivisible, with liberty and justice for all, should be rendered  
by standing at attention facing the flag with the right hand over  
the heart. When not in uniform men should remove any non-religious  
headdress with their right hand and hold it at the left shoulder,  
the hand being over the heart. Persons in uniform should remain  
silent, face the flag, and render the military salute. 
      """;*/

  var inputText = getMessageFromStdin();
  var listOfLines = const LineSplitter().convert(inputText.trim());
  int lineCount = listOfLines.length;

  int matchCount = 0;
  int linesTested = 0;
  for (var x = skipLines; x <= lineCount; x += skipLines) {
    if (x % skipLines != 0) {
      continue;
    }
    linesTested++;
    matchCount += countVowelsInLine(listOfLines[x - 1]);
  }

  print("\nResults: Lines: $linesTested, Words: $matchCount");
}

int countVowelsInLine(String line) {
  //print(line);
  int wordCount = 0;
  var splitString = line.trim().split(' ');
  for (int z = skipWords; z <= splitString.length; z += skipWords) {
    //print (splitString[z - 1]);
    if (z % skipWords != 0) {
      //print ("Skipping");
      continue;
    }
    if (countVowelsInWord(splitString[z - 1]) >= vowelMinimum) {
      //print ("Incrementing");
      wordCount++;
    }
  }
  //print("\n $wordCount \n");
  return wordCount;
}

int countVowelsInWord(String word) {
  int vowelCount = 0;

  for (var x = 0; x < word.length; x++) {
    if (vowels.contains(word[x].toUpperCase())) {
      vowelCount++;
    }
  }
  return vowelCount;
}

String getMessageFromStdin() {
  print("\nBegin Typing Text For Analysis, end with blank line \n");
  var message = "";
  bool messageComplete = false;
  while (!messageComplete) {
    String input = stdin.readLineSync();
    if (input.trim() != "") {
      message = message + input.trim() + "\n";
    } else {
      messageComplete = true;
    }
  }

  if (message == "") {
    message = """
      I pledge allegiance to the Flag of the United States of America, 
 and to the Republic for which it stands, one Nation under God, 
indivisible, with liberty and justice for all, should be rendered  
by standing at attention facing the flag with the right hand over  
the heart. When not in uniform men should remove any non-religious  
headdress with their right hand and hold it at the left shoulder,  
the hand being over the heart. Persons in uniform should remain  
silent, face the flag, and render the military salute. 
      """;
  }
  return message;
}
