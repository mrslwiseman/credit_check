class InvalidInputError < Exception;
  def message
    'Please enter a number.'
  end

end
class InvalidLengthError < Exception;
  def message
    'Please enter a number with 15 or 16 digits.'
  end
end

# In order to understand recursion, you must first understand recursion.

class CreditCheck
  attr_reader :num

  def initialize(num = "")
    self.num = num
  end

  def valid?
    check_sum(@num) % 10 == 0
  end

private

# checks input is valid before setting instance variable
  def num=(num)
    num = num.dup
    num = prepare_string(num)
    @num = num
  end


def prepare_string(str)

  str = str.dup
  clean_str = str.gsub(/\D/, '') #remove any non-digit characters

  raise InvalidInputError  if clean_str == nil || clean_str == ""
  raise InvalidLengthError  unless clean_str.length == 16 ||  clean_str.length == 15

  clean_str.reverse
end


  def check_sum(num_str, i = 0, sum = 0)

    return 0 if i >= num_str.length

    x = num_str[i].to_i

    if (i % 2 == 0)
      sum = x
    else

      if (x * 2) > 9
        sum = (x * 2 - 9)
      else
        sum = x * 2
      end
    end
    return sum += check_sum(num_str, i + 1, sum)
  end

end


require_relative "credit_check_test"
