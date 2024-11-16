import Foundation

@main
struct D03 {
  static func main() {
    print("Advent of Code 2015 Day 03")
    let (part_one, part_two) = solution()
    print("Part One: \(part_one)")
    print("Part Two: \(part_two)")
  }
}

func solution() -> (Int, Int) {
    let data = read_data()
	print(data)
    return (0, 0)
}

func read_data() -> String {
  let filePath = "sample.txt"
  
  do {
      let text = try String(contentsOfFile: filePath, encoding: .utf8)
      return text
  } catch {
      print("Error reading file: \(error.localizedDescription)")
  }

  // could have better error handling and returns...
 return "error.localizedDescription"
}
