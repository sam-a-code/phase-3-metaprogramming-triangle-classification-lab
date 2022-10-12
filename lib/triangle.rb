class Triangle
  attr_accessor :side_one, :side_two, :side_three

  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
  end 

  def kind
    triangle_rules
    if side_one == side_two && side_two == side_three
      :equilateral
    elsif side_one == side_three || side_two == side_three || side_one == side_two
      :isosceles
    else
      :scalene
    end 
  end 

  def positive_side?
    side_one < 0 || side_two < 0 || side_three < 0
  end 

  def big_side?
    side_one + side_two < side_three && side_two + side_three < side_one && side_one + side_three < side_two
  end 

  def zero_side?
    side_one = 0 || side_two = 0 || side_three = 0
  end 

  def triangle_rules
    raise TriangleError unless positive_side? && big_side? && zero_side?
  end 

# def triangle_rules
#   if side_one + side_two < side_three
#     raise TriangleError
#   elsif side_one = 0 || side_two = 0 || side_three = 0
#     raise TriangleError
#   elsif side_one < 0 || side_two < 0 || side_three < 0
#     raise TriangleError
#   else 
#     nil 
#   end 
# end 

  class TriangleError < StandardError
  end 
end 
