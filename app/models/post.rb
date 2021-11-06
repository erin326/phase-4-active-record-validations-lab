class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

    validate :clickbait?

    CLICKBAIT = [
        /Won't Believe/i,
         /Secret/i,
          /Top\d/i,
           /Guess/i
    ]
    def clickbait?
        if CLICKBAIT.none? { |name| name.match title }
            errors.add(:title, "must be clickbait")
        end
      
     
    end
end

# if title == "True Facts"
#     errors.add(:title, "invalid")
# end