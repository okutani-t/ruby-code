require 'calc'

RSpec.describe Calc do
  subject(:calc) { Calc.new(double('logger')) }

  context "tax 5%" do
    let(:tax) { 0.05 }
    it { expect(calc.price(100, tax)).to eq(105) }
  end

  context "tax 8%" do
    let(:tax) { 0.08 }
    it { expect(calc.price(100, tax)).to eq(108) }
  end

  it "given 2 and 3, returns 5" do
    expect(calc.add(2, 3)).to eq(5)
    expect(calc.add(2, 3)).not_to eq(8)
    expect(calc.add(2, 3)).to be < 10
    expect(calc.add(2, 3)).to be_between(1, 10).inclusive
    expect(calc).to respond_to(:add)
    expect(calc.add(2, 3).integer?).to be true
    expect(calc.add(2, 3)).to be_integer
  end

  # test double
  it "given 5 and 2 and okutani, returns 7 by okutani" do
    user = double('user')
    allow(user).to receive(:name).and_return('okutani')
    # user.name -> okutani
    expect(calc.add_by_user(5, 2, user.name)).to eq('7 by okutani')
  end

  # message expectation
  it {
    logger = double('logger')
    expect(logger).to receive(:log)
    calc = Calc.new(logger)
    expect(calc.add_log(5, 2)).to eq(7)
  }
end
