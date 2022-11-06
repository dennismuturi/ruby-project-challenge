class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user

    def print_review
        puts <<-REVIEW
        Review for #{self.product.name} 
        by #{self.user.name}: #{self.star_rating}. 
        #{self.comment}
            REVIEW
    end
end