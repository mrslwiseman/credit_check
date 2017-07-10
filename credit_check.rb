class CreditCheck
  attr_reader :num

  def initialize(num)
    @num = num.reverse
  end

  def valid?
    check_sum(@num) % 10 == 0
  end

private

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
