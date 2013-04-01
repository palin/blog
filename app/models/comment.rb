class Comment < ActiveRecord::Base
  attr_accessible :content, :title

  validates :content, :title, presence: true
  belongs_to :post
end
