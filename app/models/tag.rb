class Tag < ApplicationRecord
    has_many :taggings
    has_many :articles, through: :taggings

    # alternative (see article.rb)    
    def to_s
        name
    end
end
