import Foundation

@main
struct D02 {
  static func main() {
    print("Advent of Code 2015 Day 02")
    let (part_one, part_two) = solution()
    print("Part One: \(part_one)")
    print("Part Two: \(part_two)")
  }
}

func solution() -> (Int, Int) {
    let data = read_data()
    var surface_area: Int = 0 // 2*l*w + 2*w*h + 2*h*l
    var l: Int = 0
    var w: Int = 0
    var h: Int = 0
    var s1: Int = 0
    var s2: Int = 0
    var s3: Int = 0
    var slack: Int = 0
    var total = 0
    var ribbon = 0
    //print(type(of: data))
    for line in data.split(whereSeparator: \.isNewline) { 
	  let split_line = line.split(separator: "x")
      l = Int(split_line[0]) ?? 0
      w = Int(split_line[1]) ?? 0
      h = Int(split_line[2]) ?? 0
      s1 = 2 * l * w
      s2 = 2 * w * h
      s3 = 2 * h * l
	  slack = min(min((l * w), (w * h)), (h * l))
      surface_area = s1 + s2 + s3 + slack
	  total += surface_area
	  ribbon += 2 * min((l+w), (w+h), (h+l)) + (l * w * h)
    }
    return (total, ribbon)
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
 return "error.localizedDescription"
}
