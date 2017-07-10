require "minitest/autorun"
require_relative "credit_check"



class Evaluate < Minitest::Test
  def setup

  end

  def test_valid_card
    valid_card = "5541808923795240"
    assert(
    CreditCheck.new(valid_card).valid?,
    "Expected #{valid_card} to be a valid credit card number."
    )
  end

  def test_invalid_card
    invalid_card = "5541801923795240"
    refute(
    CreditCheck.new(invalid_card).valid?,
    "Expected #{invalid_card} to be an invalid credit card number."
    )
  end


end
