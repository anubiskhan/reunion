class Activity
  attr_reader :name, :participants, :accounts
  def initialize(name, cost = 0)
    @name = name
    @participants = []
    @accounts = {}
    @cost = cost.to_f
  end

  def add_participants(person)
    @participants.push(person)
  end

  def cost?
    @cost
  end

  def cost_per_person?
    @cost / @participants.length
  end

  def make_payment(person, amount)
    @accounts[person] = amount.to_f
  end

  def who_owes?
    @accounts.map do |person, amount|
      {person => cost_per_person? - amount}
    end
  end
end
