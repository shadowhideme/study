module Exercise
  module Arrays
    class << self
      def replace(array)
        return array if array.count == 0
        max_el = find_max(array)
        array.map do |el|
           if el > 0
            max_el 
          else
            el
          end
        end
      end

      def search(array, query)
        index = bin_search(array, query, -1, array.count)
        if array[index] == query
	        return index
	      else
	        return -1 #if not found
	      end
      end

      def find_max(array) 
        max = array[0]
        array.each{| el| max = el if max < el }
        max
      end
      
      def bin_search(array, el, left_index, right_index)
        return right_index if (left_index >= right_index - 1)
        mid_index = (left_index + right_index) / 2
        if array[mid_index] < el
          left_index = mid_index
        else 
          right_index = mid_index
        end
        bin_search(array, el, left_index, right_index)
      end
    end
  end
end
