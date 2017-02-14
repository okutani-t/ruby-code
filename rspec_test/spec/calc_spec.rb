require 'calc'

RSpec.describe Calc do
  before do
    @calc = Calc.new
  end

  it "given 2 and 3, returns 5" do
    expect(@calc.add(2, 3)).to eq(5)
  end
end
