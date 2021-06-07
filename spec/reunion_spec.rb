require './lib/activity'
require './lib/reunion'

RSpec.describe Reunion do
  before :each do
    @reunion = Reunion.new("Brunch")
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
end
