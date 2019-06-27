def fizz_buzz(n)
  return '数値を入力してください' unless n.kind_of?(Integer)

  return 'Fizz Buzz' if (n % 15).zero?
  return 'Fizz' if (n % 3).zero?
  return 'Buzz' if (n % 5).zero?

  n.to_s
end
