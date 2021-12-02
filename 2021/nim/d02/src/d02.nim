import strutils

proc read_data(): seq[string] =
  var data: seq[string] = @[]
  let f = open("puzzle.txt")
  defer: f.close()

  var line : string
  while f.read_line(line):
    data.add(line.split({' '})[0])
    data.add(line.split({' '})[1])

  return data

proc part_one(data: seq[string]): int =
  var horizontal: int = 0
  var depth: int = 0
  var i: int = 0

  while i < len(data):
    if data[i] == "forward":
      horizontal = horizontal + parse_int(data[i+1])
    if data[i] == "down":
      depth = depth + parse_int(data[i+1])
    if data[i] == "up":
      depth = depth - parse_int(data[i+1])
    i = i + 1

  return (horizontal * depth)

proc part_two(data: seq[string]): int =
  var horizontal: int = 0
  var depth: int = 0
  var aim: int = 0
  var i: int = 0

  while i < len(data):
    if data[i] == "forward":
      horizontal = horizontal + parse_int(data[i+1])
      depth = depth + (aim * parse_int(data[i+1]))
    if data[i] == "down":
      aim = aim + parse_int(data[i+1])
    if data[i] == "up":
      aim = aim - parse_int(data[i+1])
    i = i + 1

  return (horizontal * depth)

#
# Main Program
#
when is_main_module:
  let data = read_data()
  let answer_one: int = part_one(data)
  echo(answer_one)
  let answer_two: int = part_two(data)
  echo(answer_two)
