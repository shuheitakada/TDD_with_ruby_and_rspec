class Dollar
  attr_reader :amount
  protected :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Dollar.new(amount * multiplier)
  end

  def equals(other_dollar)
    amount == other_dollar.amount
  end
end
