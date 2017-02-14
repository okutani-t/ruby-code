require 'calc'

RSpec.describe Calc do
  before do
    @calc = Calc.new
  end

  it "given 2 and 3, returns 5" do
    expect(@calc.add(2, 3)).to eq(5)
    expect(@calc.add(2, 3)).not_to eq(8)
    expect(@calc.add(2, 3)).to be < 10
    expect(@calc.add(2, 3)).to be_between(1, 10).inclusive
    expect(@calc).to respond_to(:add)
    expect(@calc.add(2, 3).integer?).to be true
    expect(@calc.add(2, 3)).to be_integer
  end
end
