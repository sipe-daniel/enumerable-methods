array = [1, 2, 3]

module Enumerable
    def my_each
        i = 0
        arr = []
        while i < self.length
           arr[i] = yield self[i]
            i += 1
        end
        return arr
    end

    
end
