class Comment < ActiveRecord::Base
  attr_accessible :content, :author, :post_id, :avatar

  validates :content, :author, presence: true

  validates :author, length: { maximum: 30, minimum: 3 }
  validates :content, length: { maximum: 500, minimum: 3 }

  default_scope order("created_at DESC")

  belongs_to :post

  def avatar
    width = [*60..70].sample
    height = [*60..70].sample
    ["http://placedog.com/#{width}/#{height}", "http://placekitten.com/#{width}/#{height}"].sample
  end
end
