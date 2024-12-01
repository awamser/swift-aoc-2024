import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: ([Int], [Int]) {
    let lines = data.split(separator: "\n")
    let columns = lines.map { line -> (Int, Int) in
      let parts = line.split(separator: " ")
      return (Int(parts[0])!, Int(parts[1])!)
    }
    return (columns.map { $0.0 }.sorted(), columns.map { $0.1 }.sorted())
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    // Calculate the difference between each pair and sum them
    let (col1, col2) = entities
    return zip(col1, col2).reduce(0) { sum, pair in
      sum + abs(pair.0 - pair.1)
    }
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the similarity score
    let (col1, col2) = entities

    // Create frequency map of col2 values
    var frequencyMap: [Int: Int] = [:]
    for num in col2 {
      frequencyMap[num, default: 0] += 1
    }

    // Calculate sum by looking up frequencies
    var sum = 0
    for num in col1 {
      if let count = frequencyMap[num] {
        sum += num * count
      }
    }

    return sum
  }
}
