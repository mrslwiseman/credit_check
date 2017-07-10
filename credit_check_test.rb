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
    "Expected #{invalid_card} to be an valid credit card number."
    )
  end


end
