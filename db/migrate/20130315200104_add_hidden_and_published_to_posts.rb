class AddHiddenAndPublishedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :hidden, :boolean
    add_column :posts, :published, :datetime
  end
end
