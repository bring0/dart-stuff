import 'dart:convert';

void main() {
  //for (int i = 0; i < 5; i++) {
  //  print('hello ${i + 1}');
  // }

  var message = """
      I pledge allegiance to the Flag of the United States of America, 
 and to the Republic for which it stands, one Nation under God, 
indivisible, with liberty and justice for all, should be rendered  
by standing at attention facing the flag with the right hand over  
the heart. When not in uniform men should remove any non-religious  
headdress with their right hand and hold it at the left shoulder,  
the hand being over the heart. Persons in uniform should remain  
silent, face the flag, and render the military salute. 
      """;
  var listOfLines = const LineSplitter().convert(message);
  int lineCount = listOfLines.length;

  int matchCount = 0;
  int linesTested = 0;
  for (var x = 3; x < lineCount; x += 3) {
    if (x % 3 != 0) {
      continue;
    }
    linesTested++;
    matchCount += countVowelsInLine(listOfLines[x - 1]);
  }

  print("Lines: $linesTested Words: $matchCount");
}

int countVowelsInLine(String line) {
  int wordCount = 0;
  var splitString = line.trim().split(' ');

  splitString.forEach((String ee) {
    if (countVowelsInWord(ee) >= 3) {
      wordCount++;
    }
  });
  return wordCount;
}

int countVowelsInWord(String word) {
  List<String> vowels = ["A", "E", "I", "O", "U"];

  int vowelCount = 0;

  for (var x = 0; x < word.length; x++) {
    if (vowels.contains(word[x].toUpperCase())) {
      vowelCount++;
    }
  }
  return vowelCount;
}
