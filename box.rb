class Box 
    attr_accessor :symbol, :sizeX, :sizeY

    def initialize(sizeX, sizeY, symbol)
        @symbol =symbol
        @sizeX=sizeX
        @sizeY = sizeY
    end

    def fill(symbol)
        @symbol =symbol
    end

    def rotate()
        temp = @sizeY
        @sizeY = @sizeX
        @sizeX = temp

        [@sizeX, @sizeY, @symbol]
    end

    def resize(sizeX, sizeY)
        @sizeX = sizeX
        @sizeY = sizeY

        [@sizeX, @sizeY, @symbol]
    end

    def expand(n)
        @sizeX = @sizeX * n
        @sizeY = @sizeY * n

        [@sizeX, @sizeY, @symbol]
    end

    def printBox()
        (0..@sizeY-1).each do |y|
            (0..@sizeX-1).each do |x|
                print "#{@symbol}"
            end
            puts
        end
    end

end 

box =  Box.new(3,5,"$")
box.fill("%")
box.rotate()
box.expand(2)
box.printBox()