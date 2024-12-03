import Algorithms

struct Day02: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: " ").compactMap { Int($0) }
    }
  }

  private func isReportSafe(_ levels: [Int]) -> Bool {
    // Calculate all differences at once
    let diffs = zip(levels, levels.dropFirst()).map(-)
    guard let firstDiff = diffs.first else { return false }

    let isIncreasing = firstDiff > 0
    return diffs.allSatisfy { diff in
      diff != 0 && abs(diff) <= 3 && (isIncreasing ? diff > 0 : diff < 0)
    }
  }

  private func isReportSafeWithDampener(_ levels: [Int]) -> Bool {
    if isReportSafe(levels) { return true }
    return levels.combinations(ofCount: levels.count - 1).contains { isReportSafe($0) }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    // Count lines with safe reports using filter and count
    entities.filter { isReportSafe($0) }.count
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
    entities.filter { isReportSafeWithDampener($0) }.count
  }
}
