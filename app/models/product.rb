class Product < ActiveRecord::Base

  class << self

    def filter_enum
      %w{ Tablet Phone Laptop PC }
    end

    def search query=""
      where("name iLike ?", "%#{query}%")
    end

    def filter filters=self.filter_enum
      if filters.present?
        where("filter in (?)", filters)
      else
        self.all
      end
    end

  end
  
end
