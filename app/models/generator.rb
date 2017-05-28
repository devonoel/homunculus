class Generator < ApplicationRecord
  belongs_to :user

  MIN_LENGTH = 3
  MAX_LENGTH = 8

  before_create :generate_table!

  def generate_table!
    self.table = {}

    self.seed.each do |name|
      chars = name.downcase.chars
      chars.each_with_index do |c,i|
        nc = chars[i+1]
        if nc
          if self.table.has_key?(c)
            self.table[c].has_key?(nc) ? self.table[c][nc] += 1 : self.table[c][nc] = 1
          else
            self.table[c] = {}
            self.table[c][nc] = 1
          end
        end
      end
    end
  end

  def generate_name
    return nil if self.table.empty?

    length = rand(MIN_LENGTH..MAX_LENGTH)
    name = ""

    letter = self.table.keys.sample
    name << letter

    (length-1).times do
      raffle = []
      self.table[letter].map do |next_letter, weight|
        weight.times { raffle << next_letter }
      end
      rand_letter = raffle.sample
      letter = rand_letter if self.table[rand_letter]
      name << letter
    end

    return name.capitalize
  end

  def generate_names(n)
    return nil if self.table.empty?
    return nil unless n.to_i > 0

    names = []
    n.to_i.times { names.push(self.generate_name) }
    names
  end
end
