require_relative './min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(1)
def heapsort(list)
  return list if list.empty? || list.length == 1

  heap = MinHeap.new

  list.each do |element|
    heap.add(element)
  end
  
  i = 0

  while i < list.length
    node = heap.remove_min
    list[i] = node
    i += 1
  end

  return list
end
