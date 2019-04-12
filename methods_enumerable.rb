module Enumerable
  def my_each
    for i in 0...size
      yield self[i]
    end
  end
end
arr=[3,4,6,8,7]
arr.my_each{|item| print "#{item} "}