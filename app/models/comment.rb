class Comment < ActiveRecord::Base
  attr_accessible :content, :title, :author, :captcha, :post_id
  attr_accessor :captcha

  validates :content, :author, :captcha, presence: true

  belongs_to :post
end
