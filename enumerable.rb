array = [1, 2, 3]

module Enumerable
    def my_each
        i = 0
        arr = []
        while i < self.length
           arr[i] = yield self[i]
            i += 1
        end
        arr
    end

    def my_each_with_index
        index = 0
        arr = []
        while index < self.length
            arr = yield(self[index],index)
            index += 1
        end
        arr
    end
end


