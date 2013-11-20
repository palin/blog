class Post < ActiveRecord::Base
  attr_accessible :content, :title, :category_id, :slug, :hidden, :tag_list, :meta_description, :meta_keywords, :meta_title
  acts_as_url :title, sync_url: true, url_attribute: :slug
  acts_as_taggable_on :tags

  validates :content, :title, presence: true

  has_many :comments
  belongs_to :category

  default_scope order("published DESC")

  scope :visible, -> { where(hidden: false) }
  scope :published, -> { where("published IS NOT NULL") }

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
