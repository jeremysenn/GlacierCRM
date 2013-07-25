class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :contact_id
      t.integer :user_id
      t.integer :mission_id
      t.boolean :completed
      t.datetime :due_at
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
