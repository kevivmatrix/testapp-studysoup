class Product < ActiveRecord::Base

  class << self

    def filter_enum
      %w{ Tablet Phone Laptop PC }
    end

    def search query
      where("name iLike ?", "%#{query}%")
    end

    def filter filters
      where("filter in (?)", filters)
    end

  end
  
end
