class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
    
    def leave_review(user,star_rating,comment)
        Review.create(star_rating: star_rating, comment: comment, product_id: self.id , user_id:user.id)
    end

    def print_all_reviews
        self.reviews.map do |review|
            puts <<-PRODUCT
            Review for #{self.name} 
            by #{self.users.find(review.user_id).name}: #{review.star_rating}. 
            #{review.comment}
                PRODUCT
        end
      average_rating =self.reviews.pluck(:star_rating).sum / self.reviews.count.to_f
      average_rating
    end
end