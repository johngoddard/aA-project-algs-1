def my_min(arr)
  arr.each do |el1|
    found_smaller = false
    arr.each do |el2|
      found_smaller = true if el2 < el1
    end

    return el1 unless found_smaller
  end
end

def my_min_2(arr)
  min = arr.first
  arr.each do |el|
    min = el if el < min
  end

  min
end

def largest_cont(arr)
  max = 0
  get_sub_arrs(arr).each do |sub_arr|
    cont_sum = sub_arr.inject(&:+)
    max = cont_sum if cont_sum > max
  end

  max
end

def get_sub_arrs(arr)
  subs = []
  (0...arr.size).each do |start|
    (start...arr.size).each do |end_idx|
      subs << arr[start..end_idx]
    end
  end

  subs
end


def largest_cont_1(arr)
  running_sum = 0
  max_sum = 0
  arr.each do |num|
    if num > 0
      running_sum += num
    else
      if num.abs < running_sum
        running_sum += num
      else
        running_sum = 0
      end
    end
    max_sum = running_sum if running_sum > max_sum
  end
  max_sum
  
end
