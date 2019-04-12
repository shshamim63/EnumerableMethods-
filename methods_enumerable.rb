module Enumerable

  def my_each
    for i in self
      yield i
    end
  end


  def my_each_with_index
    for i in self
      yield self[i],i
    end
  end


  def my_select
    arr=[]
    self.my_each{|x| arr << x if yield(x)}
  end


  def my_all?(pattern = nil)
    for i in self
      if block_given?
        if yield i
          next
        else
          return false
        end
      elsif pattern != nil
        if pattern.is_a?(Regexp)
          if pat =~ i
            next
          else
            return false
          end
        else
          if i.is_a?(pattern)
            next
          else
            return false
          end
        end
      else
        return self.my_all?{|x| x}
      end
    end
    return true
  end

  def my_any?(pat = nil)
    for i in self
      if block_given?
        if yield i
          return true
        else
          next
        end
      elsif pat != nil
        if pat.is_a?(Regexp)
          if pat =~ i
            return true
          else
            next
          end
        else
          if i.is_a?(pat)
            return true
          else
            next
          end
        end
      else
        return self.my_any?{|x| x}
      end
    end
    return false
  end

  def my_none?(pat = nil)
    if block_given?
      !self.my_any?{|x| yield x}
    else
      !self.my_any?(pat)
    end
  end

  def my_count(item = nil)
    count = 0
    for i in self
      if item != nil
        count += 1 if i == item
      elsif block_given?
        count += 1 if yield i
      else
        count += 1
      end
    end
    count
  end

  def my_map(procedure = nil)
    arr = []
    if procedure !=nil
      for i in self
        element = procedure.call(i)
        arr << element
      end
    else
      for i in self
        arr << yield i
      end
    end
    arr
  end

  def my_inject(arg = nil)
    if self.class == Array
      arr= self.clone
    elsif self.class == Range
      arr = self.to_a
    else
      self.my_map{|key,value| {key => value}}
    end
    if arg == nil
      result_memo = self[0]
      forward = self[1]
      start = 1
    else
      result_memo = arg
      forward = self[0]
      start = 0
    end
    for i in start...self.length
      result_memo = yeild(result_memo, forward)
      forward=self[i + 1]
    end
    result_memo
  end
  def multiply_els
    my_inject(1){|res,nxt| res * nxt}
end