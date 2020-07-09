array = [1, 2, 3]

module Enumerable

    def my_each
        return to_enum(__method__) unless block_given?
        
        length.times { |i| yield (to_a[i]) }
        self
    end


    def my_each_with_index
        return to_enum(__method__) unless block_given?

        length.times { |index| yield(to_a[index],index) }
        self

        # while index < self.length
        #     arr = yield(self[index],index)
        #     index += 1
        # end
        # arr
    end
      

    # def my_each_with_index
    #     index = 0
    #     arr = []
    #     while index < self.length
    #         arr = yield(self[index],index)
    #         index += 1
    #     end
    #     arr
    # end

    #---------------------------________#

 
      
end


