class AddProjectIdToGamifiedWorkflow < ActiveRecord::Migration
  def change
    add_column :gamified_workflows, :project_id, :integer
  end
end
