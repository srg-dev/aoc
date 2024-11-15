import Foundation

@main
struct D01 {
  static func main() {
    print("Advent of Code 2015 Day 01")
    let (part_one, part_two) = solution()
    print("Part One: \(part_one)")
    print("Part Two: \(part_two)")
  }
}

func solution() -> (Int, Int) {
    let data = read_data()
    let d = data.trimmingCharacters(in: .whitespacesAndNewlines)
    var floor = 0
    var seen = 0
    var position = 0
    for (idx, f) in d.enumerated() {
      if f == "(" {
        floor += 1
      } else {
        floor -= 1
      }
      if floor == -1 && seen != 1 { 
        position = idx 
        seen = 1
      }
    }
    return (floor, position + 1)
}

func read_data() -> String {
  let filePath = "input.txt"
  
  do {
      let text = try String(contentsOfFile: filePath, encoding: .utf8)
      return text
  } catch {
      print("Error reading file: \(error.localizedDescription)")
  }

  // could have better error handling and returns...
  return "error"
}
