class Money
  attr_reader :amount
  protected :amount

  def equals(other_money)
    amount == other_money.amount
  end
end
