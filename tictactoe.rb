# frozen_string_literal: true

class Square
  attr_accessor :x, :y, :checked_by

  def initialize(x, y)
    @x = x
    @y = y
    @checked_by = nil
  end
end

def create_square
  hash = {}
  x = ('a'..'c').to_a
  y = (1..3).to_a

  squares = x.map do |x|
    y.map do |y|
      square = Square.new(x, y)
      square
    end
  end
end

squares = create_square
