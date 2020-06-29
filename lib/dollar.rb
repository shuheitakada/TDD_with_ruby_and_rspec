require 'money'

class Dollar < Money
  def initialize(amount)
    @amount = amount
  end
end
