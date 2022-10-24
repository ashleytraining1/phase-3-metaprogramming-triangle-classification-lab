class Triangle

  class TriangleError < StandardError
    def message
      "This is not a valid triangle"
    end
  end

  attr_accessor :length_1, :length_2, :length_3

  def initialize(length_1, length_2, length_3)
    @length_1 = length_1
    @length_2 = length_2
    @length_3 = length_3    
  end

  # conditions
  def num_sides
    [length_1, length_2, length_3].all? { |length| length > 0 }
  end

  def sum_of_two_lengths
    length_1 + length_2 > length_3 && length_1 + length_3 > length_2 && length_2 + length_3 > length_1
  end

  def valid_triangle 
    raise TriangleError unless num_sides && sum_of_two_lengths
  end

  def kind
    valid_triangle

    if length_1==length_2 && length_2==length_3 && length_3==length_1
      :equilateral
    elsif length_1==length_2 || length_2==length_3 || length_3==length_1
      :isosceles
    else
      :scalene
    end
  end
end