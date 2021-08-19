

class Triangle
  # write code here
  attr_reader :side_1, :side_2, :side_3

  def initialize(side_1, side_2, side_3)
    @side_1, @side_2, @side_3 = side_1, side_2, side_3
  end

  def kind
    if sides_triangle_valid? && sides_greater_than_zero?
      if @side_1 == @side_2 && @side_1 == @side_3
        :equilateral
      elsif @side_1 == @side_2 || @side_1 == @side_3 || @side_2 == @side_3
        :isosceles
      else
        :scalene
      end

    else
      raise TriangleError
    end

  end

  private

  def sides_greater_than_zero?
    [@side_1, @side_2, @side_3].all? {|side| side > 0}
  end

  def sides_triangle_valid?
    @side_1 + @side_2 > @side_3 && 
    @side_2 + @side_3 > @side_1 && 
    @side_1 + @side_3 > @side_2
  end


  class TriangleError < StandardError
    def message
      "you must input a valid triangle"
    end
  end
end
