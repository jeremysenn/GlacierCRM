class RenameTodoProjectIdToMissionId < ActiveRecord::Migration
  def up
    rename_column :todos, :project_id, :mission_id
  end

  def down
    rename_column :todos, :mission_id, :project_id
  end
end
