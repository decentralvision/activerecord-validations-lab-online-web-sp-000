class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates :is_click_bait?


  CLICK_BAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_click_bait?
    if CLICK_BAIT.none? {|pattern| pattern.match title }
      errors.add(:title, "must be clickbait-y")
    end
  end
end
