require_relative "./structure.rb"

mta = MTA.new()

n_line = Line.new("N", ["8th", "Union Square", "23rd", "28th", "34th", "Times Square"])
l_line = Line.new("L", ["8th", "6th", "Union Square", "3rd", "1st"])
six_line = Line.new("6", ["Astor Place", "Union Square", "23rd", "28th", "33rd", "Grand Central"])
q_line = Line.new("Q", ["Times Square", "Herald Square", "Union Square", "Canal St"])
f_line = Line.new("F", ["Rockefeller Center", "42nd", "Herald Square", "23rd", "14th", "West 4th"])

mta.add_line(n_line)
mta.add_line(l_line)
mta.add_line(six_line)
mta.add_line(q_line)
mta.add_line(f_line)

if ARGV.empty?
  puts "please insert a command"
  puts "lines - list lines"
  puts "stops (line) - list stops on given line"
  puts "calculate (line1) (stop1) (line2) (stop2) - calculate number of stops away"
elsif ARGV[0] == "lines"
  mta.list_lines
elsif ARGV[0] == "stops"
  mta.list_stops(ARGV[1])
elsif ARGV[0] == "calculate"
  if ARGV.length < 5
    puts "please enter 'calculate (line1) (stop1) (line2) (stop2)'"
  elsif ARGV[1] == ARGV[3]
    mta.calc_stops_away(ARGV[1], ARGV[2], ARGV[3], ARGV[4])
  else
    mta.calc_transfer(ARGV[1], ARGV[2], ARGV[3], ARGV[4])
  end
end

