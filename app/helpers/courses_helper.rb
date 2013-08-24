module CoursesHelper

  #provides array of courses sorted by rank. Highest rank first
  def order_by_rank(courses)
    courses.sort_by{|course| course.rank}.reverse
  end

end
