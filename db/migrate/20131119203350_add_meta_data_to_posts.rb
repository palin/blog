class AddMetaDataToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :meta_description, :string
    add_column :posts, :meta_keywords, :string
    add_column :posts, :meta_title, :string
  end
end
