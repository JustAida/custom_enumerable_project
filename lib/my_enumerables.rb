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
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    length.times { |i| yield(self[i]) } if block_given?

    self
  end
end
