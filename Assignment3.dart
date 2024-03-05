/*
1. 
Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
 
Example 1:
Input: nums = [-4,-1,0,3,10]
Output: [0,1,9,16,100]
Explanation: After squaring, the array becomes [16,1,0,9,100].
After sorting, it becomes [0,1,9,16,100].

*/

void sortAndSquare(List<int> array) {
  for (int indexOfArray = 0; indexOfArray < array.length; indexOfArray++) {
    array[indexOfArray] *= array[indexOfArray];
  }
  array.sort();
  print(array);
}

/*

2. 

Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
You can return the answer in any order.

 
Example 1:
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

Example 2:
Input: nums = [3,2,4], target = 6
Output: [1,2]

Example 3:
Input: nums = [3,3], target = 6
Output: [0,1]


*/
// brute force

List<int> twoSumBruteForce(List<int> nums, int target) {
  for (int outerLoopIndexOfNums = 0;
      outerLoopIndexOfNums < nums.length;
      outerLoopIndexOfNums++) {
    for (int innerLoopIndexOfNums = outerLoopIndexOfNums + 1;
        innerLoopIndexOfNums < nums.length;
        innerLoopIndexOfNums++) {
      if (nums[outerLoopIndexOfNums] + nums[innerLoopIndexOfNums] == target) {
        return [outerLoopIndexOfNums, innerLoopIndexOfNums];
      }
    }
  }
  return [];
}

// optimal

List<int> twoSumOptimal(List<int> nums, target) {
  Map<int, int> map = {};
  for (int indexOfNums = 0; indexOfNums < nums.length; indexOfNums++) {
    int result = target - nums[indexOfNums];
    if (map.containsKey(result)) {
      return [map[result]!, indexOfNums];
    }
    map[nums[indexOfNums]] = indexOfNums;
  }
  return [];
}

/*
5.
Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.
 
Example 1:
Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]

Example 2:
Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
Explanation: [9,4] is also accepted.


*/

List<int> intersectionOfArrays(List<int> array1, List<int> array2) {
  List<int> interSectionOfArraysElements = [];
  for (int indexOfArray = 0; indexOfArray < array1.length; indexOfArray++) {
    if (!interSectionOfArraysElements.contains(array1[indexOfArray])) {
      interSectionOfArraysElements.add(array1[indexOfArray]);
    }
  }

  for (int indexOfArray = 0; indexOfArray < array2.length; indexOfArray++) {
    if (!interSectionOfArraysElements.contains(array2[indexOfArray])) {
      interSectionOfArraysElements.add(array2[indexOfArray]);
    }
  }
  return interSectionOfArraysElements;
}

/*
6.
Given two strings s and t, return true if t is an anagram of s, and false otherwise.
An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 
Example 1:
Input: s = "anagram", t = "nagaram"
Output: true

Example 2:
Input: s = "rat", t = "car"
Output: false

*/

bool isStringsAreAnagram(String firstString, String secondString) {
  List<String> newString = firstString.toLowerCase().trim().split('');
  List<String> newestString = secondString.toLowerCase().trim().split('');
  // print(newString);
  // print(newestString);
  return newString == newestString;
}

/*

9.
 Given an input string s, reverse the order of the words.
A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
Return a string of the words in reverse order concatenated by a single space.
Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.
 
Example 1:
Input: s = "the sky is blue"
Output: "blue is sky the"

Example 2:
Input: s = "  hello world  "
Output: "world hello"
Explanation: Your reversed string should not contain leading or trailing spaces.

Example 3:
Input: s = "a good   example"
Output: "example good a"
Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
*/

String reverseTheOrderOfTheWords(String inputString) {
  List<String> stringsList = [];
  String s = '';

  for (int indexOfString = 0;
      indexOfString < inputString.length;
      indexOfString++) {
    if (inputString[indexOfString] == ' ') {
      stringsList.add(s);
      s = "";
    } else {
      s += inputString[indexOfString];
    }
  }
  stringsList.add(s);
  return stringsList.join(' ').trim().replaceAll(RegExp(r'\s+'), " ");
}

/*
10.
Given a string s, remove duplicate letters so that every letter appears once and only once. You must make sure your result is
the smallest in lexicographical order
among all possible results.
 
Example 1:
Input: s = "bcabc"
Output: "abc"

Example 2:
Input: s = "cbacdcbc"


*/

String removeDuplicateAndPrintInLexographicalOrder(String inputString) {
  List<String> newInputString = inputString.split('');
  newInputString.sort();
  Set<String> stringsSet = {};
  stringsSet.addAll(newInputString);
  return stringsSet.join();
}

/*
3. 
Write a function to find the longest common prefix string amongst an array of strings.
If there is no common prefix, return an empty string "".
 
Example 1:
Input: strs = ["flower","flow","flight"]
Output: "fl"

Example 2:
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.

*/

String longestCommonPrefix(List<String> inputList) {
  String prefix = inputList[0];

  for (int indexOfList = 1; indexOfList < inputList.length; indexOfList++) {
    String currentString = inputList[indexOfList];
    String newString = '';
    int indexOfWords = 0;

    while (indexOfWords < prefix.length &&
        indexOfWords < currentString.length &&
        prefix[indexOfWords] == currentString[indexOfWords]) {
      newString += prefix[indexOfWords];
      indexOfWords++;
    }

    prefix = newString;

    if (prefix.isEmpty) {
      return "There is no common prefix among the input strings.";
    }
  }

  return prefix;
}

/*
8. 
Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
I can be placed before V (5) and X (10) to make 4 and 9. 
X can be placed before L (50) and C (100) to make 40 and 90. 
C can be placed before D (500) and M (1000) to make 400 and 900.
Given an integer, convert it to a roman numeral.
 
Example 1:
Input: num = 3
Output: "III"
Explanation: 3 is represented as 3 ones.

Example 2:
Input: num = 58
Output: "LVIII"
Explanation: L = 50, V = 5, III = 3.

Example 3:
Input: num = 1994
Output: "MCMXCIV"
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

*/
String convertToRomanNumber(int number) {
  List<String> ones = [
    "",
    "I",
    "II",
    "III",
    "IV",
    "V",
    "VI",
    "VII",
    "VIII",
    "IX"
  ];
  List<String> tens = [
    "",
    "X",
    "XX",
    "XXX",
    "XL",
    "L",
    "LX",
    "LXX",
    "LXXX",
    "XC"
  ];
  List<String> hundereds = [
    "",
    "C",
    "CC",
    "CCC",
    "CD",
    "D",
    "DC",
    "DCC",
    "DCCC",
    "CM"
  ];
  List<String> thousands = ["", "M", "MM", "MMM"];
  String roman = thousands[(number ~/ 1000)] +
      hundereds[(number % 1000) ~/ 100] +
      tens[(number % 100) ~/ 10] +
      ones[number % 10];
  return roman;
}

void main() {
  List<int> nums = [-4, -1, 0, 3, 10];
  sortAndSquare(nums);

  List<int> newNums = twoSumOptimal([3, 2, 4], 6);
  print(newNums);

  bool stringAnagram = isStringsAreAnagram("rat", "car");
  print(stringAnagram);

  String reverseOrder = reverseTheOrderOfTheWords("a good   example");
  print(reverseOrder);

  String romanNumber = convertToRomanNumber(1994);
  print(romanNumber);

  List<int> itersectedElements =
      intersectionOfArrays([4, 9, 5], [9, 4, 9, 8, 4]);
  print(itersectedElements);

  String longPrefix = longestCommonPrefix(["flower", "flow", "flight"]);
  print(longPrefix);

  String stringInLexographicalOrder =
      removeDuplicateAndPrintInLexographicalOrder("bcabc");
  print(stringInLexographicalOrder);
}
