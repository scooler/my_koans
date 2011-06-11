# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#         if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  error_check(a, b, c)

  case uniq_sides(a, b, c).size
  when 1
    return :equilateral
  when 2
    return :isosceles
  else
    return :scalene
  end
end

def uniq_sides(a,b,c)
  [a, b, c].inject({}){ |h,s| h[s] ||= s; h}.values
end

def error_check(a, b, c)
  sorted_sides = [a, b, c].sort
  
  raise TriangleError if sorted_sides[0] <= 0
  
  raise TriangleError if sorted_sides[2] >= sorted_sides[0] + sorted_sides[1]
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
