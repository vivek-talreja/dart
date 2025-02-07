class Solution {
  String minWindow(String s, String t) {
    Map<String, int> originalMap = {};

    for (int i = 0; i < t.length; i++) {
      originalMap[t[i]] =
          originalMap[t[i]] != null ? originalMap[t[i]]! + 1 : 1;
    }
    //print("originalMap: ${originalMap}");

    int start = 0,
        end = 0,
        n = t.length,
        beginPointer = 0,
        endPointer = 0,
        count = 0x7FFFFFFFFFFFFFFF;

    for (int i = 0; i < s.length; i++) {
      if (originalMap.containsKey(s[i])) {
        originalMap[s[i]] = originalMap[s[i]]! - 1;
        n--;
        end++;
      } else {
        if (t.contains(s[i]) &&
            originalMap[s[i]] != null &&
            originalMap[s[i]] == 0) {
          while ((originalMap[s[start]] == null ||
                  originalMap[s[i]] == originalMap[s[start]]) &&
              (start <= end)) {
            if (originalMap[s[start]] != null) {
              originalMap[s[start]] = originalMap[s[start]]! + 1;
              n = n + 1;
            }
            start++;
          }
          if (originalMap[s[i]]! > 0) {
            originalMap[s[i]] = originalMap[s[i]]! - 1;
            n = n - 1;
          }
          end++;
        } else {
          end++;
        }
      }
      if (n == 0) {
        if (end - start < count) {
          count = end - start;
          beginPointer = start;
          endPointer = end;
        }
        originalMap[s[start]] = originalMap[s[start]]! + 1;
        n = n + 1;
        start++;

        while (start < end && (!t.contains(s[start]))) {
          start++;
        }

        // if (originalMap.containsKey(s[i])) {
        //   originalMap[s[i]] = originalMap[s[i]]! - 1;
        //   n--;
        // }
        //end++;
      }
    }
    // print("begin pointer: $beginPointer");
    // print("end pointer: $endPointer");
    // print("string: ${s.substring(
    //   beginPointer,
    //   endPointer,
    // )}");
    // print("count: ${count < 0x7FFFFFFFFFFFFFFF ? count : 0}");

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
