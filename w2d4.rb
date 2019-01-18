require 'byebug'
def my_min(arr)  # O(n^2)
  min = arr[0]
  arr.each_with_index do |ele, idx|
    arr.each_with_index do |ele2, idx2|
      if idx2 > idx
        min = ele if ele < ele2 && ele < min
      end 
    end 
  end
  min
end 

# 0 1 2 3 4 5 6 7 
# 1 2 3 4 5 6 7 
# 2 3 4 5 6 7 
# 3 4 5 6 7 
# 4 5 6 7 
# 5 6 7 
# 6 7 
# 7 

def faster_my_min(arr)  # O(n)
  min = arr[0]
  arr.each do |ele|
    min = ele if ele < min
  end
  min
end 

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)        # =>  -5
# p faster_my_min(list) # =>  -5
# puts 

def largest_contiguous_sum(arr)
  largest_sum = nil
  p_tations = subsets(arr)

  p_tations.each do |tation|
    if largest_sum == nil
      largest_sum = tation.sum 
    elsif tation.sum > largest_sum
      largest_sum = tation.sum 
    end
  end 

  largest_sum
end 

def subsets(arr)
  subs = []
  # debugger
  arr.each_with_index do |e1, i1|
    holder = [e1]  
    subs << holder.dup
    arr.each_with_index do |e2, i2|
      if i2 > i1
        holder << e2 
        subs << holder.dup
      end
    end
  end
  subs
end

# p permutations(list)
# list = [5, 3, -7]
list = [2, 3, -6, 7, -6, 7]
# list = [-5, -1, -3]
# p subsets(list)
# p largest_contiguous_sum(list)

def faster_cont_sum(arr)
  # debugger
  sum = arr[0]
  bool = true
  run_tot = arr[0]
  arr[1..-1].each do |e|
    if bool == false && e > sum
      sum = e
      bool = true
      run_tot = e
    elsif bool == true && e + sum > sum
      sum += e
      run_tot += e
    elsif bool == true && e > sum
      sum = e
    else 
      bool = false
      run_tot += e
    end 
  end 
  sum >= run_tot ? sum : run_tot
end

# list = [10, -1, -2, 5]
p faster_cont_sum(list)
