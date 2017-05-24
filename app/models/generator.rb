class Generator < ApplicationRecord
  belongs_to :user

  MIN_LENGTH = 3
  MAX_LENGTH = 8

  def generate_table!(names)
    raise TypeError, "Argument must be an array of names" unless names.is_a?(Array)
    self.table = {}

    names.each do |name|
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

    self.save!
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

    names = []
    n.times { names.push(self.generate_name) }
    names
  end
end
