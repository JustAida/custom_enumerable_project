module Enumerable
  # Your code goes here
  def my_each_with_index
    length.times { |i| yield(self[i], i) } if block_given?

    self
  end

  def my_select
    array = []
    my_each { |item| array << item if yield(item) }
    array
  end

  def my_all?(&block)
    return true unless block_given?

    array = my_select(&block)
    length == array.length
  end

  def my_any?(&block)
    return size.zero? ? false : true unless block_given?

    array = my_select(&block)
    array.size.zero? ? false : true
  end

  def my_none?(&block)
    return size.zero? ? true : false unless block_given?

    array = my_select(&block)
    array.size.zero? ? true : false
  end

  def my_count(&block)
    return size unless block_given?

    my_select(&block).size
  end

  def my_map(proc = nil)
    array = []
    size.times { |i| array << (block_given? ? yield(self[i]) : proc.call(self[i])) }
    array
  end

  def my_inject(initial_value)
    my_each { |value| initial_value = yield(initial_value, value) }
    initial_value
  end

  # Old assignments
  def multiply_els
    my_inject(1) { |product, number| product * number }
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    size.times { |i| yield(self[i]) } if block_given?

    self
  end
end
