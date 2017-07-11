require "minitest/autorun"

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

  def test_valid_amex
    valid_amex = "342804633855673"
    assert(
    CreditCheck.new(valid_amex).valid?,
    "Expected #{valid_amex} to be a valid amex card number."
    )
  end

  def test_invalid_amex
    invalid_card = "342801633855673"
    refute(
    CreditCheck.new(invalid_card).valid?,
    "Expected #{invalid_card} to be an invalid credit card number."
    )
  end

  def test_valid_number_with_spaces
  valid_card = "5541 8089 2379 5240"
    assert(
    CreditCheck.new(valid_card).valid?,
    "Expected #{valid_card} to be an valid credit card number."
    )
  end

  def test_invalid_number_with_spaces
    invalid_card = "5541 8019 2379 5240"
    refute(
    CreditCheck.new(invalid_card).valid?,
    "Expected #{invalid_card} to be an invalid credit card number."
    )
  end

  def test_valid_number_with_non_digits
  valid_card = "5541.808923Y!795240"
    assert(
    CreditCheck.new(valid_card).valid?,
    "Expected #{valid_card} to be an valid credit card number."
    )
  end

  def test_invalid_number_with_non_digits
    invalid_card = "5541. !80192x3795240"
    refute(
    CreditCheck.new(invalid_card).valid?,
    "Expected #{invalid_card} to be an invalid credit card number."
    )
  end

  def test_invalid_length_error
    exception = assert_raises InvalidLengthError do
      invalid_length = "111"
      CreditCheck.new(invalid_length)
    end
    assert_equal('Please enter a number with 15 or 16 digits.', exception.message)
  end

  def test_empty_input_error
    exception = assert_raises InvalidInputError do
      invalid_length = ""
      CreditCheck.new(invalid_length)
    end
    assert_equal('Please enter a number.', exception.message)
  end
end
