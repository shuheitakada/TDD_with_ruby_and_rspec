require 'money'

class Franc < Money
  def initialize(amount)
    @amount = amount
  end
end
