import strutils

proc read_data(): seq[int] =
  var data: seq[int] = @[]
  let f = open("puzzle.txt")
  defer: f.close()
  var line : string
  while f.read_line(line):
    data.add(parse_int(line))

  return data

proc part_one(data: seq[int]): int =
  var increased: int = 0
  var i: int = 0
  while i < len(data) - 1:
    if data[i + 1] > data[i] and i != len(data):
      increased = increased + 1
    i = i + 1

  return increased

proc part_two(data: seq[int]): int =
  var increased: int = 0
  var i: int = 0
  while i < len(data)-3:
    let a = data[i] + data[i+1] + data[i+2]
    let b = data[i+1] + data[i+2] + data[i+3]
    i = i + 1
    if b > a:
      increased = increased + 1

  return increased

#
# Main Program
#
when is_main_module:
  let data = read_data()
  let answer_one: int = part_one(data)
  echo(answer_one)
  let answer_two: int = part_two(data)
  echo(answer_two)
