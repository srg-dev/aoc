import strutils
import sequtils
import typetraits

proc read_data(): seq[string] =
  var data: seq[string] = @[]
  let f = open("puzzle.txt")
  defer: f.close()

  var line: string
  while f.read_line(line):
    data.add(line)

  return data

proc part_one(data: seq[string]): uint64 =
  var power_consumption: uint64 = 0
  var gamma_rate: seq[char] = @[]
  var epsilon_rate: seq[char] = @[]

  var bit_depth: int = len(data)

  var count: int = 0
  for j in 0..<len(data[0]):
    for i in 0..<bit_depth:
      if data[i][j] == '1':
        count = count + 1

    if count > bit_depth div 2:
      gamma_rate.add('1')
      epsilon_rate.add('0')
    else:
      gamma_rate.add('0')
      epsilon_rate.add('1')

    count = 0

  var gamma = (gamma_rate.map_it($it).join).from_bin[:uint64]
  var epsilon = (epsilon_rate.map_it($it).join).from_bin[:uint64]
  power_consumption = gamma * epsilon
  return power_consumption

proc part_two(data: seq[string]): int =
  return 0

#
# Main Program
#
when is_main_module:
  let data = read_data()
  let answer_one: uint64 = part_one(data)
  echo(answer_one)
  let answer_two: int = part_two(data)
  echo(answer_two)
