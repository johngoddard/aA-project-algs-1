def bad_two_sum?(arr, target_sum)
  (0...arr.size).each do |start|
    (start+1...arr.size).each do |end_idx|
      return true if arr[start] + arr[end_idx] == target_sum
    end
  end

  false
end

def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  sorted.each do |el|
    return true if sorted.bsearch{|x| x == target_sum - el}
  end

  false
end

def pair_sum?(arr, target_sum)
  values = Hash.new(false)
  arr.each{|el| values[el] = true}

  arr.each{|el| return true if values[target_sum - el]}

  false
end

def four_sum?(arr, target_sum)


end



arr = [0, 1, 5, 7]

puts bad_two_sum?(arr, 6)
puts bad_two_sum?(arr, 99)

puts okay_two_sum?(arr, 6)
puts okay_two_sum?(arr, 99)

puts pair_sum?(arr, 6)
puts pair_sum?(arr, 99)
