class Post < ActiveRecord::Base
  attr_accessible :content, :title, :category_id, :slug, :hidden
  acts_as_url :title, :sync_url => true, :url_attribute => :slug

  validates :content, :title, presence: true

  has_many :comments
  belongs_to :tags
  belongs_to :category

  default_scope order("created_at DESC")

  scope :visible, where(:hidden => false)
  scope :published, where("posts.published IS NOT NULL")

  def to_param
    slug
  end

  def publish!
    update_attribute(:published, Time.now)
  end

  def hide!
    update_attribute(:hidden, true)
  end

  def visible!
    update_attribute(:hidden, false)
  end
end
