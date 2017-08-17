class AddParentIdToGamifiedWorkflow < ActiveRecord::Migration
  def change
    add_column :gamified_workflows, :parent_id, :integer
  end
end
