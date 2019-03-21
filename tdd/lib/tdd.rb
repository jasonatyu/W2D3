class Array

  def my_uniq
    hash = Hash.new(0)
    self.each { |ele| hash[ele] += 1 }
    hash.keys
  end

  def two_sum
    res = []
    (0...self.length).each do |i|
      (i+1...self.length).each do |j|
        res << [i,j] if self[i] + self[j] == 0
      end 
    end
    res
  end

  def my_transpose
    return self if all? { |el| el.empty? }
    res = Array.new(size) { [] }
    (0...length).each do |i|
      (0...length).each do |j|
        res[j][i] = self[i][j]
      end
    end
    res
  end

  def stock_picker
    buy_day = 0 
    sell_day = 0 
    low_price = first 
    max_profit = 0 
    self.each_with_index do |price, day|
      if price < low_price 
        buy_day = day 
        low_price = price 
      end
      if (price - low_price) > max_profit 
        sell_day = day
        max_profit = price - low_price
      end
    end
    [buy_day, sell_day]
  end

end

class Hanoi

  def initialize(n=3)
    @n = n 
    initial_stack = (1..n).to_a
    @towers = Array.new(n) { [] }
    @towers[0] = initial_stack
  end

  def valid_take?(pile)
    raise "Invalid pile to take from" if @towers[pile].empty?
    true
  end

  def valid_drop?(pile, val)
    raise "Invalid pile to drop on" if val >= @towers[pile][0]
    true
  end

  def move
    begin
      puts "Select a pile to take from (1-3): "
      take_pile = gets.chomp.to_i - 1
      valid_take?(take_pile)
    rescue 
      retry
    end
    
    begin
      puts "Select a pile to drop on (1-3): "
      drop_pile = gets.chomp.to_i - 1
      valid_drop?(drop_pile, @towers[take_pile][0])
    rescue
      retry
    end
    @towers[drop_pile].unshift(@towers[take_pile].shift)
  end

  def display 
    @towers.each do |pile|
      res = []
      pile.each do |disk|
        if disk.nil?
          res << " "
        else
        res << disk
        end
      end
      puts res.join(" ")
    end
  end

  def play 
    until won?
      display
      move
    end
    puts 'you won!' 
  end

  def won?
    @towers[1..-1].any? { |pile| pile.length == @n}
  end

end

h = Hanoi.new(3)
h.play