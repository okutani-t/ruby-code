require 'calc'

RSpec.describe "A calc" do
  it "given 2 and 3, return 5" do
    calc = Calc.new
    expect(calc.add(2, 3)).to eq(5)
  before do
    @calc = Calc.new
  end

  it "given 2 and 3, returns 5" do
    expect(@calc.add(2, 3)).to eq(5)
  end
end
