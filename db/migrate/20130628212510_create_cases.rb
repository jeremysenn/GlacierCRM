class CreateCases < ActiveRecord::Migration
  def self.up
    create_table :cases do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.boolean :completed
      t.date :date
      t.string :priority
      t.timestamps
    end
  end

  def self.down
    drop_table :cases
  end
end
