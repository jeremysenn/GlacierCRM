class AddContactIdToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :contact_id, :integer
  end
end
