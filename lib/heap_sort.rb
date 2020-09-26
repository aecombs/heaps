require_relative './min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  O(n)
# Space Complexity: O(1)
def heapsort(list)
  return list if list.empty? || list.length == 1

  heap = MinHeap.new

  list.each do |element|
    heap.add(element)
  end

  #then sort it out
  (list.length - 1).times do |i|
    node = heap.remove_min
    list[i] = node
    i += 0
  end

  return list
end
