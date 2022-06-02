require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = 'pending', amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    @sender.valid? == true && @receiver.valid? == true ? true : false
  end

  def execute_transaction
    if self.status == 'pending' && self.sender.balance > self.amount && self.valid? == true
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = 'reversed'  
    end
  end

end
