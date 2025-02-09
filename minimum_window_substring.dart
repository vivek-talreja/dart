// class Solution {
//   String minWindow(String s, String t) {
//     Map<String, int> originalMap = {};

//     for (int i = 0; i < t.length; i++) {
//       originalMap[t[i]] =
//           originalMap[t[i]] != null ? originalMap[t[i]]! + 1 : 1;
//     }
//     print("originalMap: ${originalMap}");

//     int start = 0,
//         end = 0,
//         n = t.length,
//         beginPointer = 0,
//         endPointer = 0,
//         count = 0x7FFFFFFFFFFFFFFF;

//     while (start < s.length && !t.contains(s[start])) {
//       start++;
//     }

//     for (int i = 0; i < s.length; i++) {
//       if (originalMap.containsKey(s[i]) && originalMap[s[i]]! > 0) {
//         originalMap[s[i]] = originalMap[s[i]]! - 1;
//         n--;
//         end++;
//         print("1");
//         print("start: $start");
//         print("end: $end");
//         print("original: $originalMap");
//       } else {
//         if (t.contains(s[i]) &&
//             originalMap[s[i]] != null &&
//             originalMap[s[i]] == 0) {
//           while ((originalMap[s[start]] == null ||
//                   originalMap[s[start]]! >= 0 ||
//                   originalMap[s[i]] == originalMap[s[start]]) &&
//               (start < end)) {
//             if (originalMap[s[start]] != null) {
//               originalMap[s[start]] = originalMap[s[start]]! + 1;
//               n = n + 1;
//             }
//             start++;
//             print("2");
//           }
//           if (originalMap[s[i]]! > 0) {
//             originalMap[s[i]] = originalMap[s[i]]! - 1;
//             n = n - 1;
//           }
//           end++;
//         } else {
//           end++;
//         }
//         print("start: $start");
//         print("end: $end");
//       }
//       if (n == 0) {
//         if (end - start < count) {
//           count = end - start;
//           beginPointer = start;
//           endPointer = end;
//         }

//         originalMap[s[start]] = originalMap[s[start]]! + 1;
//         n = n + 1;
//         start++;

//         while (start < end && (!t.contains(s[start]))) {
//           start++;
//         }

//         // if (originalMap.containsKey(s[i])) {
//         //   originalMap[s[i]] = originalMap[s[i]]! - 1;
//         //   n--;
//         // }
//         //end++;
//       }
//     }
//     // print("begin pointer: $beginPointer");
//     // print("end pointer: $endPointer");
//     // print("string: ${s.substring(
//     //   beginPointer,
//     //   endPointer,
//     // )}");
//     // print("count: ${count < 0x7FFFFFFFFFFFFFFF ? count : 0}");

//     return s.substring(
//       beginPointer,
//       endPointer,
//     );
//   }
// }
class Solution {
  String minWindow(String s, String t) {
    Map<String, int> originalMap = {};

    for (int i = 0; i < t.length; i++) {
      originalMap[t[i]] =
          originalMap[t[i]] != null ? originalMap[t[i]]! + 1 : 1;
    }
    print("originalMap: ${originalMap}");

    int start = 0,
        end = 0,
        n = t.length,
        beginPointer = 0,
        endPointer = 0,
        count = 0x7FFFFFFFFFFFFFFF;

    while (end < s.length) {
      if (originalMap[s[end]] != null && originalMap[s[end]]! > 0) {
        originalMap[s[end]] = originalMap[s[end]]! - 1;
        n--;
      }
      end++;
      while (n == 0) {
        if (end - start < count) {
          count = end - start;
          beginPointer = start;
          endPointer = end;
        }
        if (originalMap[s[start]] != null && originalMap[s[start]] == 0) {
          print("start: $start");
          originalMap[s[start]] = originalMap[s[start]]! + 1;
          n++;
        }
        start++;
        // if (originalMap[s[start]] == null && start <= end) {
        //   start++;
        // }
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
