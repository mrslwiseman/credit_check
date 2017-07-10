class CreditCheck
  attr_reader :num

  def initialize(num)
    @num = num.reverse
  end

  def valid?
    check_sum(@num) % 10 == 0
  end

  def check_sum(num_str, i = 0, sum = 0)

    if i >= num_str.length
      return 0
    end

    if (i % 2 == 0)
      sum = num_str[i].to_i
    else

      if (num_str[i].to_i * 2) > 9
        sum = (num_str[i].to_i * 2 - 9)
      else
        sum = num_str[i].to_i * 2
      end
    end
    return sum += check_sum(num_str, i + 1, sum)
  end

end
