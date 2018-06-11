class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.text :bio
      t.date :dob

      t.timestamps
    end
  end
end
