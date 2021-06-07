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

  def split
    @total_cost / @participants.keys.length
  end

  def owed
    @participants.each do |key, value| #name, payment
      @participants[key] = self.split - value
    end
  end
end
