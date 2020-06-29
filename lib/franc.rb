require 'money'

class Franc < Money
  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Franc.new(amount * multiplier)
  end

  def equals(other_franc)
    amount == other_franc.amount
  end
end
