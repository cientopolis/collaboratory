class CreateGamifiedWorkflow < ActiveRecord::Migration
  def change
    create_table :gamified_workflows do |t|
      t.integer :pointValue
    end
  end
end
