require 'byebug'
def first_anagram?(string, target) #n, 2n
  string = string.split("")

  perms = string.permutation.to_a
  perms.each_with_index do |e,i|
    perms[i] = e.join("")
  end
  # debugger
  perms.each do |perm|
    return true if perm == target
  end

  false
end 


p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true
puts "__________________"

def second_anagram?(string, target) #T O(n) S O(1 n?) 
  string = string.split("")
  target = target.split("")

  string.each do |char|
    if target.index(char) == nil
      return false
    else
      left = target.take(target.index(char))
      right = target.drop(target.index(char))
      right.shift
      target = left + right
    end 
  end

  true
end

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
puts "__________________"


def third_anagram?(string, target)     # O(n^2)
  string = quick_sort(string.split(""))
  target = quick_sort(target.split(""))

  string == target
end

def quick_sort(arr)
  return arr if arr.length < 2

  pivot = arr.shift

  left = arr.select {|e| e < pivot}
  right = arr.select {|e| e >= pivot}

  quick_sort(left) + [pivot] + quick_sort(right)
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true
puts "__________________"

def fourth_anagram?(string, target)
  string_h = Hash.new(0)
  target_h = Hash.new(0)

  string.each_char do |char|
    string_h[char] += 1
  end 

  target.each_char do |char|
    target_h[char] += 1
  end 

  # keys = string_h.keys
  target_h.each do |k,v|
    return false unless string_h[k] >= v
  end

  true
end 

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
puts "__________________"