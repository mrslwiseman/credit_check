# In order to understand recursion, you must first understand recursion.

class InvalidInputError < StandardError
  def message
    'Please enter a number.'
  end
end

class InvalidLengthError < StandardError
  def message
    'Please enter a number with 15 or 16 digits.'
  end
end

class CreditCheck
  attr_reader :num

  def initialize(num = '')
    self.num = num
  end

  def valid?
    (check_sum(@num) % 10).zero?
  end

  private

  def num=(num)
    prep = prepare_string(num)
    @num = prep if check_string(prep)
  end

  def prepare_string(str)
    str.gsub(/\D/, '').reverse
  end

  def check_string(str)
    raise InvalidInputError if str.nil? || str.length.zero?
    raise InvalidLengthError  unless str.length == 16 ||  str.length == 15
    true
  end

  def check_sum(num_str, i = 0, sum = 0)
    return 0 if i >= num_str.length
    x = num_str[i].to_i
    sum = if (i.even?)
      x
    elsif (x * 2) > 9
      x * 2 - 9
    else
      x * 2
    end
    sum + check_sum(num_str, i + 1, sum)
  end

end
