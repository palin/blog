class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :login
      t.string :email
      t.string :date_of_birth
      t.string :password
      t.string :password_confirmation
      t.string :crypted_password
      t.string :persistence_token
      t.string :salt

      t.timestamps
    end
  end
end
