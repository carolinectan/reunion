require './lib/activity'
require './lib/reunion'

RSpec.describe Reunion do
  before :each do
    @reunion = Reunion.new("1406 BE")
  end

  it 'exists' do
    expect(@reunion = Reunion.new("1406 BE")).to be_a(Reunion)
  end

  it 'initializes with attributes' do
    expect(@reunion.name).to eq("1406 BE")
    expect(@reunion.activities).to eq([])
  end

  it 'can add an activity to the reunion' do
    @activity_1 = Activity.new("Brunch")

    @reunion.add_activity(@activity_1)

    expect(@reunion.activities).to eq([@activity_1])
  end

  it 'can breakout what each person owes for the reunions' do
    @activity_1 = Activity.new("Brunch")
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(activity_1)

    expect(@reunion.total_cost).to eq(60)

    @activity_2 = Activity.new("Drinks")
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)

    expect(@reunion.total_cost).to eq(180)

    expected = {
                  "Maria" => -10,
                  "Luther" => -30,
                  "Louis" => 40
                }
    expect(@reunion.breakout).to eq(expected)

    expect(@reunion.summary).to eq("Maria: -10\nLuther: -30\nLouis: 40")

    expect(puts @reunion.summary).to eq("Maria: -10
      Luther: -30
      Louis: 40")
  end
end
