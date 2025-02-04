class Solution {
  int lengthOfLongestSubstring(String s) {
    int start = 0, end = 0, count = 0;
    Map<String, int> temp = {};
    for (int i = 0; i < s.length; i++) {
      temp[s[i]] = 0;
    }
    for (int i = 0; i < s.length; i++) {
      temp[s[i]] = temp[s[i]]! + 1;
      if (temp[s[i]]! > 1) {
        if (end - start > count) {
          count = end - start;
        }
        while (temp[s[i]]! > 1 && start <= end) {
          temp[s[start]] = temp[s[start]]! - 1;
          start++;
        }
      } else {}
      end++;
    }
    return end - start > count ? end - start : count;
  }
}

void main() {
  Solution sol = new Solution();
  print("Length of Longest Substring: ${sol.lengthOfLongestSubstring(' ')}");
}
