array = [1, 2, 3]

module Enumerable

    def my_each
        return to_enum(__method__) unless block_given?
        
        length.times { |i| yield (to_a[i]) }
        self
    end


    def my_each_with_index
        return to_enum(__method__) unless block_given?

        length.times { |index| yield(to_a[index],index) }
        self

    end

    def my_select 
        return to_enum(__method__) unless block_given?
        arr = []
        length.times do |i|

        arr << to_a[i] if yield(to_a[i])

        end
        arr

    end

  def my_all? (arg = nil)  
    if block_given?
      my_each{ |value| return false unless yield (value) }  
      true
    elsif arg.nil?
      my_each{ |value| return false unless value }  
      true
    else
      check = check_arg_all(arg)
      return check
    end
  end

  def my_any? (arg = nil)  
    if block_given?
      my_each{ |value| return true if yield (value) }  
      false
    elsif arg.nil?
      my_each{ |value| return true if value }  
      false
    else
      check = check_arg_any(arg)
      return check
    end
  end

  def my_none? (arg=nil)
    if block_given?
      my_each { |element| return false if yield(element) }
      true
    elsif arg.nil?
      my_each { |element| return false if element }
      true
    else
      return !check_arg_any(arg)
    end
  end
 

  def my_count(arg=nil)
    counter = 0
    if block_given?
      my_each { |element| counter += 1 if yield(element)}
    elsif arg.nil?
      return length
    else 
      my_each { |element| counter += 1 if element == arg}
    end
    counter
  end
  
  def my_inject(initial=nil, symbol=nil)
    if initial.is_a? Symbol
      symbol = initial
      initial = nil
    end
    array = self.to_a
    if initial.nil?
      result = array.shift
    else 
      result = initial
    end
    p array
    p result
    unless symbol.nil?
      array.each { |element| result = result.method(symbol).call(element) }
      return result
    end

    if block_given?
      array.each { |element| result = yield(result, element) }
      return result
    end
    


  end

  def check_arg_any(arg)
    if arg.is_a? (Regexp)
      my_each { |element| return true unless (element.to_s =~ arg).nil? }
      false
    elsif
      my_each { |element| return true if element.is_a?(arg) }
      false
    else 
      puts "regular expresion not recognized"
    end
  end
 
  def check_arg_all(arg)
    if arg.is_a? (Regexp)
      my_each { |element| return false if (element.to_s =~ arg).nil? }
    true
    elsif
      my_each { |element| return false unless element.is_a?(arg) }
      true
    else 
      puts "regular expresion not recognized"
    end
  end

  def my_map
    return to_enum(__method__) unless block_given?
    n_arr = []
    each { |element| n_arr << yield(element) }
    n_arr
  end

  def my_inject(initial=nil, symbol=nil)
    array = self.to_a
    if initial.is_a? Symbol
      symbol = initial
      initial = nil
    end
    
    initial.nil? ? result = array.shift : result = initial

    return nil if array.empty?
    return "undefined method '#{symbol}' :#{symbol}: Symbol" if block_given? && initial.nil? && !symbol.nil?
    return "No block given" if !block_given? && symbol.nil?

    unless symbol.nil?
      array.each { |element| result = result.method(symbol).call(element) }
      return result
    else 
      array.each { |element| result = yield(result, element) }
      return result
    end
  end

end


