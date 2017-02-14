require 'calc'

RSpec.describe "A calc" do
  it "given 2 and 3, return 5" do
    calc = Calc.new
    expect(calc.add(2, 3)).to eq(5)
  end
end
