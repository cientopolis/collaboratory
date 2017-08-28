class AddPointValueToWorkflow < ActiveRecord::Migration
  def change
    add_column :workflows, :pointValue, :integer
  end
end
