class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def remove_reviews(product)
       
        reviews = self.reviews.where("product_id = #{product.id}")
       reviews.map do |review|
        review.destroy
       end
    end 
    def favorite_product
       
        highest_rating = self.reviews.maximum(:star_rating)
        highest_review = Review.where("star_rating = #{highest_rating} and user_id=#{self.id}")
        highest_review.first
        favorite_product=Product.where("id =#{highest_review.first.product_id}")
        favorite_product
    end
end