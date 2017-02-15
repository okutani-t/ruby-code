class Calc
  def initialize(logger)
    @logger = logger
  end

  def add(a, b)
    a + b
  end

  def add_log(a, b)
    @logger.log
    a + b
  end

  def add_by_user(a, b, name)
    (a + b).to_s + " by #{name}"
  end

  def price(x, tax)
    x * (1 + tax)
  end
end
