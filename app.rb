
def last(arr)
  t1 = Time.now
  arr[arr.length - 1]
  t2 = Time.now
  puts t2 - t1
end

last([1,2,3,4,5])
