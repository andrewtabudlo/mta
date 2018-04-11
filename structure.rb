class MTA
  attr_accessor :lines, :transfer_points

  def initialize
    @lines = [] 
    @transfer_points = {}
  end

  def add_line(line)
    @lines << line
  end

  def list_stops(line)
    i = 0
    while i < @lines.length
      if @lines[i].name == line
        p @lines[i].stops
        i += 1
      else
        i += 1
      end
    end
  end

  def list_lines
    line_list = []
    i = 0
    while i < @lines.length
      line_list << @lines[i].name
      i += 1
    end
    p line_list
  end 

  def calc_stops_away(line1, stop1, line2, stop2)
    i = 0
    j = 0
    index1 = 0
    index2 = 0
    while i < @lines.length
      if @lines[i].name == line1
        index1 = @lines[i].stops.find_index{ |x| x == stop1 } + 1
        i += 1
      else
        i += 1
      end
    end
    while j < @lines.length
      if @lines[j].name == line2
        index2 = @lines[j].stops.find_index{ |x| x == stop2 } + 1
        j += 1
      else
        j += 1
      end
    end
    puts "#{((index1)-(index2)).abs} stops away"
  end

  # runs when calc stops away lines are different
  def calc_transfer(line1, stop1, line2, stop2)
    # line 1 get value of how many stops from union square
    # line 2 get value of how many stops from union square
    # add together and display total value
    i = 0
    j = 0
    index1 = 0
    xfer1 = 0
    index2 = 0
    xfer2 = 0
    while i < @lines.length
      if @lines[i].name == line1
        index1 = @lines[i].stops.find_index{ |x| x == stop1 } + 1
        xfer1 = @lines[i].stops.find_index{ |x| x == "Union Square" } + 1
        i += 1
      else
        i += 1
      end
    end
    while j < @lines.length
      if @lines[j].name == line2
        index2 = @lines[j].stops.find_index{ |x| x == stop2 } + 1
        xfer2 = @lines[j].stops.find_index{ |x| x == "Union Square" } + 1       
        j += 1
      else
        j += 1
      end
    end
    puts "#{((index1-xfer1).abs+(index2-xfer2)).abs} stops away"
  end
end

class Line
  attr_accessor :name, :stops

  def initialize(name, stops)
    @name = name
    @stops = stops 
  end
end
