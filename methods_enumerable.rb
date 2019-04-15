module Enumerable
  def my_each
    for item in self
      yield item
    end
  end

  def my_each_with_index
    i = 0
    for item in self
      yield(item, i)
      i += 1
    end
  end
end

arr=[3,4,6,8,7]
hash={a: 1, b: 2}

# TEST

#arr.my_each{|item| puts item.to_s}
#hash.my_each{|item| puts item.to_s}

#arr.my_each_with_index { |v, i| puts "#{v} at index #{i}" }
#hash.my_each_with_index { |k, v, i| puts "#{k}: #{v} at index #{i}" }