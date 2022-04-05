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
