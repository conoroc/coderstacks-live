module ResourcesHelper

  def medium_texter(medium)
    case medium # a_variable is the variable we want to compare
      when 1    #compare to 1
        "Book"
      when 2    #compare to 2
        "Video"
      when 3    #compare to 2
       "Blog-Tutorial"
      when 4    #compare to 2
   "Article"
      when 5    #compare to 2
        "Video-Tutorial"
      when 6    #compare to 2
        "Tutorial-Exercises"
      else
        "Unknown Type"
    end
  end
end
