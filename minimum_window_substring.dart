class Solution {
  String minWindow(String s, String t) {
    Map<String, int> originalMap = {};

    for (int i = 0; i < 128; i++) {
      originalMap[String.fromCharCode(i)] = 0;
    }
    for (int i = 0; i < t.length; i++) {
      originalMap[t[i]] = originalMap[t[i]] != 0 ? originalMap[t[i]]! + 1 : 1;
    }

    int start = 0,
        end = 0,
        n = t.length,
        beginPointer = 0,
        endPointer = 0,
        count = 0x7FFFFFFFFFFFFFFF;

    while (end < s.length) {
      if (originalMap[s[end]]! > 0) {
        n--;
      }
      originalMap[s[end]] = originalMap[s[end]]! - 1;
      end++;
      while (n == 0) {
        if (end - start < count) {
          count = end - start;
          beginPointer = start;
          endPointer = end;
        }
        originalMap[s[start]] = originalMap[s[start]]! + 1;

        if (originalMap[s[start]]! > 0) {
          n++;
        }
        start++;
      }
    }

    return s.substring(
      beginPointer,
      endPointer,
    );
  }
}

void main() {
  Solution sol = new Solution();
  print(
    "Minimum Window String: ${sol.minWindow("ADOBECODEBANC", "ABC")}",
  );
}
