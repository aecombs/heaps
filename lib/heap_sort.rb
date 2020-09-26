require_relative './min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  O(n)
# Space Complexity: O(1)
def heapsort(list)
  return list if list.empty? || list.length == 1

  #like insertion sort...hm!
  heap = MinHeap.new

  list.each do |element|
    heap.add(element.to_s)
  end

  return heap
end