class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :nickname
      t.string :name
      t.string :email
      t.string :image_url
      t.string :token
      t.string :provider

      t.timestamps
    end
  end
end
