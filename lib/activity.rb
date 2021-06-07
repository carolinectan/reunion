class Activity
  attr_reader :name, :participants, :total_cost

  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
  end

  def add_participant(name, payment)
    @participants[name] = payment

    @total_cost = @total_cost + payment
  end
end
