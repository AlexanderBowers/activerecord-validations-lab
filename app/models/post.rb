class Post < ActiveRecord::Base
    validates_presence_of :title
    validates_uniqueness_of :title
    validate :title_is_clickbait
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    

    def title_is_clickbait
        clickbait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if title.present? && !clickbait.any? { |bait| self.title.include? bait }
            errors.add(:title, "isn't clickbait")
        end
    end
end
