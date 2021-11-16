class Knight
    attr_accessor :position

    def initialize(position)
        @position = position
    end

    def knight_moves(start, finish)

    end
end

class Board
    def create_board(size = 8)
        # With this, we can just change the array input to be inner and that will give us a different setup. But this way may be best for now. Using the coordinates with no intermediate step.
        array = []
        (1..size).each do |outer|
            inner_array = []
            (1..size).each do |inner|
                inner_array.push([outer, inner])
            end
            array.push(inner_array)
        end
        p array
    end
end

class Square 
    attr_accessor :coordinates, :top, :right, :bottom, :left

    def initialize(coordinates, top = nil, right = nil, bottom = nil, left = nil)
        @coordinates = coordinates
    end
end

test = Board.new.create_board


test.each do |outer|
    outer.each do |inner|
        p inner
    end
end
