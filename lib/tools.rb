require "tools/version"

module Tools
  class Error < StandardError; end
  # Your code goes here...
end
a = [2,3,4,1,4,5,6,7,8,1,2,3,5,7,2,9]

b = []
a.each_with_index do |i,index|
    if index.odd?
        b << i
    end
end

b.each_with_index do |i,index|
    b[index] += b[index]
    if b[index] > 9
        b[index] -= 9
    end
end
j = 0
a.each_with_index do |i,index|
    if index.odd?
        a[index] = b[j]
        j += 1
    end
end

sum = 0
a.each do |i|
    sum += i
end

puts sum%10 == 0 ? "Its valid" : "Its not"
