class Board

    def initialize(size)
        @size = size
        @grid = Array.new(size) {Array.new(size)}
    end

    def size
        @size
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos,mark)
        @grid[pos[0]][pos[1]] = mark
    end

    def complete_row?(mark)
        @grid.each do |row|
            count = 0
            row.each do |x|
                if x == mark
                    count += 1
                end
            end
            if count == row.length
                return true
            end
        end
        return false
    end

    def complete_col?(mark)

        (0...@grid.length).each do |x|
            count = 0
            (0...@grid.length).each do |y|
               if @grid[y][x] == mark
                    count += 1
               end
            end
            if count == @grid.length
                return true
            end
        end
        return false
    end

    def complete_diag?(mark)
        count = 0
        (0...@grid.length).each do |x|
            if @grid[x][x] == mark
                count += 1
            end
        end
        if count == @grid.length
            return true
        end

        count = 0
        (0...@grid.length).each do |x|
            if @grid[x][@grid.length - 1 - x] == mark
                count += 1
            end
        end
        if count == @grid.length
            return true
        end
        return false
    end

    def winner?(mark)
        return complete_col?(mark) || complete_row?(mark) || complete_diag?(mark)
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
