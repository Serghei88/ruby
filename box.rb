
class BoxPrinter
  attr_accessor :box
  def initialize(box)
    @box = box
  end
  def render
    (0..@box.sizeY - 1).each do |_y|
      (0..@box.sizeX - 1).each do |_x|
        print @box.symbol.to_s
      end
      puts
    end
  end
end

class Box
  attr_reader :symbol, :sizeX, :sizeY

  def initialize(sizeX, sizeY, symbol)
    @symbol = symbol
    @sizeX = sizeX
    @sizeY = sizeY
  end

  def fill(symbol)
    Box.new(@sizeX,@sizeY,symbol)
  end

  def rotate
    Box.new(@sizeY,@sizeX,@symbol)
  end

  def resize(sizeX, sizeY)
    Box.new(sizeX,sizeY,@symbol)
  end

  def expand(n)
    @sizeX *= n
    @sizeY *= n

    self
  end
end

box = Box.new(3, 5, '$')
BoxPrinter.new(box.fill('%').rotate).render
puts 
box.expand(2)
BoxPrinter.new(box).render
