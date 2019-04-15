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

  def my_select
      res = []
      my_each { |v| res.push(v) if yield(v) }
      return res
  end


  def my_all?(pattern = nil)
    if block_given?
      my_each { |v| return false unless yield(v) }
    elsif !pattern.nil?
      if pattern.is_a?(Regexp)
        my_each { |v| return false unless pattern =~ v.to_s }
      else
        my_each { |v| return false unless v.is_a?(pattern) }
      end
    else
      my_each { |v| return false unless v }
    end
    true
  end

  def my_any?(pattern = nil)
    if block_given?
      my_each { |v| return true if yield(v) }
    elsif !pattern.nil?
      if pattern.is_a?(Regexp)
        my_each { |v| return true if pattern =~ v.to_s }
      else
        my_each { |v| return true if v.is_a?(pattern) }
      end
    else
      my_each { |v|  v != nil ?  return true : return false }
    end
    false
  end
end

arr=[3,4,6,8,7]
hash={a: 1, b: 2}

# TEST

#arr.my_each{|item| puts item.to_s}
#hash.my_each{|item| puts item.to_s}

#arr.my_each_with_index { |v, i| puts "#{v} at index #{i}" }
#hash.my_each_with_index { |k, v, i| puts "#{k}: #{v} at index #{i}" }


#print [1, 2, 2, 3, 5, 8, 9].my_select(&:odd?)
#print hash.my_select { |k, v| v > 1 }

# print arr.my_all?(/\D/)
# print arr.my_all?(String)
# print hash.my_all? { |k, v| v.is_a? Integer }
# print hash.my_all?(/\d/)

print [nil, false].my_any?