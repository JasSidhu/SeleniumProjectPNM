
def pairSum(a,k)
  pairArr = Array.new
  pairArr = a.combination(2).to_a
  m = pairArr.length
  paircount = 0
  for j in 0..m
    total = pairArr[i].first + pairArr[i].last
    if total == k
      paircount += 1
    end
  end
  if paircount > 0
    puts "true"
  else
    puts "false"
  end
end

puts "Enter Array length"
  n = gets.to_i
  a = Array.new
puts "Enter #{n} Array elements"
  for i in 1..n
    a[i] = gets.to_i
  end
puts "Enter Sum to compare with pairs"
k = gets.to_i
ret = pairSum(a, k)


