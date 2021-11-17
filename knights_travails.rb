class Square
    attr_accessor :position, :parent, :knight_movements

    
    def initialize
       @position = nil
       @parent = nil
       
    end

    def knight_movements
        @knight_movements = [ [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2] ]
    end
    def possible_knight_move?(position)
        return false if (position.first <= 0 || position.first >= 8) || (position.last <= 0 || position.last >= 8) 
        return true
    end

    def make_board(start, finish)
        queue = [start]
        board = Array.new(8) { Array.new(8) { Square.new } }
        board[start.first][start.last].position = start


        until queue.empty?
            current_position = queue.shift

            break if current_position == finish

            (0...8).each do |move|

                next_square = [current_position.first + knight_movements[move].first, current_position.last + knight_movements[move].last]

                if possible_knight_move?(next_square) && !board[next_square.first][next_square.last].position

                    board[next_square.first][next_square.last].position = next_square
                    board[next_square.first][next_square.last].parent = board[current_position.first][current_position.last]
                    queue.push(next_square)

                end
            end
        end
        board 
    end

    def knight_moves(start, finish)
        board = make_board(start, finish)
        route = []
        current_square = board[finish.first][finish.last]
        until current_square.nil?
            route.unshift(current_square.position)
            current_square = current_square.parent
        end
        route.each { |position| p position }

    end
end

Square.new.knight_moves([1,2], [2,4])
p ''
Square.new.knight_moves([0,0], [6,7])
