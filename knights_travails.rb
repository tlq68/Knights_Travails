class Knight
    attr_accessor :position

    def initialize(position)
        @position = position
    end

    def knight_moves(start, finish)

    end
end

class Board
    attr_accessor :coordinate_set

    def initialize()
        @coordinate_set = connect_squares(create_board)
    end

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
        array
    end

    def connect_squares(array_of_coordinates)
        board = array_of_coordinates
        board_with_squares = board.each do |outer|
            outer.each do |inner|
                inner = Square.new(inner)
            end
        end

        board_with_squares
    end

    

end

class Square 
    # The starting position was chosen as the topmost right space that the knight could move and then the other attributes continue clockwise
    attr_accessor :coordinates, :up2_right1, :up1_right2, :down1_right2, :down2_right1, :down2_left1, :down1_left2, :up1_left2, :up2_left1

    def initialize(coordinates, up2_right1 = nil, up1_right2 = nil, down1_right2 = nil, down2_right1 = nil, down2_left1 = nil, down1_left2 = nil, up1_left2 = nil, up2_left1 = nil)
        @coordinates = coordinates
    end
end


#p Board.new.set_coordinates 




test = Board.new

p test


# Next step is to assign a coordinate to each square. Then we should try to assign all of the children nodes that can be accessed by a particular square. This should be done in a way that coincides with the MOVEMENT OF THE KNIGHT. So, any square could be connected to up to 8 other squares.

# After that, we should find a way to traverse the nodes so that we can see what is happening. We will do this in a standard way. 

# Finally, we will try to find a way to traverse with the knight movements and then we will try to go from point A to point B.