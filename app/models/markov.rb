class Markov
  attr_reader :table

  def initialize(names)
    @table = {}
    @min = 3
    @max = 7
    names.each do |name|
      chars = name.downcase.chars
      chars.each_with_index do |c,i|
        nc = chars[i+1]
        if nc
          if @table.has_key?(c)
            @table[c].has_key?(nc) ? @table[c][nc] += 1 : @table[c][nc] = 1
          else
            @table[c] = {}
            @table[c][nc] = 1
          end
        end
      end
    end
  end

  def gen_name
    length = rand(@min..@max)
    name = ""

    letter = @table.keys.sample
    name << letter

    (length-1).times do
      raffle = []
      @table[letter].map do |next_letter, weight|
        weight.times { raffle << next_letter }
      end
      rand_letter = raffle.sample
      letter = rand_letter if @table[rand_letter]
      name << letter
    end

    return name.capitalize
  end

  def gen_names(n)
    names = []
    n.times { names.push(self.gen_name) }
    names
  end

end

