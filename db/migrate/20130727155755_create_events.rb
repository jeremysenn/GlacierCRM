class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :contact_id
      t.integer :mission_id
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :where
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
