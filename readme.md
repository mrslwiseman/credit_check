# Luhn Credit Card Validator

The first piece of ruby code I have ever written, implementing the  [Luhn Formula](https://en.wikipedia.org/wiki/Luhn_algorithm) to check the validity of a supplied credit card number.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Usage

Clone the repo:

```
git clone https://github.com/mrslwiseman/credit_check.git
```

Navigate to directory you downloaded to
```
cd credit_check
```
Open Interactive Ruby Bash and load the program
```
irb -r './credit_check.rb'
```
Create your own instances and validate some numbers yourself:

```
trustworthy_tom = CreditCheck.new("5541808923795240")
trustworthy_tom.valid?
=> true
```
```
dubious_character = CreditCheck.new("5541801923795240")
trustworthy_tom.valid?
=> false
```

## Error handling

Raises an error if user enters invalid input.
```
credit_check = CreditCheck.new("")
=> Please enter a number. (InvalidInputError)

```
```
credit_check = CreditCheck.new("123")
=> Please enter a number with 15 or 16 digits. (InvalidLengthError)
```

## Running the tests

Tests using Minitest
```
ruby './credit_check_test.rb'
```


## License

This project is licensed under the MIT License
