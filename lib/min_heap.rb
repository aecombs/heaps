require 'pry'

class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node

    heap_up(@store.length - 1) unless self.empty?
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def remove
    unless self.empty?
      swap(0, @store.length - 1)
      removed_node = @store.pop

      heap_down(0)

      return removed_node.value
    end
  end

  def remove_min
    unless self.empty?
      min_index = find_min_index
      
      swap(0, min_index) unless min_index == 0
      swap(min_index, @store.length - 1) if min_index == 0
      removed_node = @store.pop

      heap_down(0)

      return removed_node
    end
  end

  def find_min_index
    min_key = @store.first.key
    min_index = 0

    i = 0
    while i < @store.length
      if @store[i].key < min_key
        min_key = @store[i].key
        min_index = i
      end

      i += 1
    end

    return min_index
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    @store.first.nil?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(1)
  def heap_up(index)
    parent_index = (index - 1) / 2

    unless @store[parent_index].key < @store[index].key || index <= 0 
      swap(parent_index, index)
      heap_up(parent_index)
    end
  end

  # This helper method takes an index and 
  #  moves it down the heap if it's larger
  #  than its children nodes.
  def heap_down(index)
    left_index = 2 * index + 1
    right_index = 2 * index + 2

    return if left_index > @store.length - 1 || right_index > @store.length - 1

    child_index = (@store[left_index].key < @store[right_index].key ? left_index : right_index)

    unless @store[index].key < @store[child_index].key
      swap(child_index, index)

      heap_down(child_index)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end