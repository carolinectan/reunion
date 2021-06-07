class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
    @total_cost
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @total_cost = @activities.sum do |activity|
      activity.total_cost
    end
  end

  def breakout
    hash = Hash.new do |hash, key|
      hash[key] = []
    end

    arr_of_hashes = @activities.each do |activity|
      activity.participants.each do |participant|
        hash[participant] = activity.owed.values
        # require "pry"; binding.pry
      end
      # activity.owed #=> [{"Luther"=>-10, "Maria"=>10}, {"Louis"=>40, "Luther"=>-20, "Maria"=>-20}]
    end

    # arr_of_hashes = @activities.each do |activity|
    #   activity.owed #=> [{"Luther"=>-10, "Maria"=>10}, {"Louis"=>40, "Luther"=>-20, "Maria"=>-20}]
    # end
  end
end
