class GamifiedProject < Project
  has_many :gamified_workflows

  #can_be_linked :gamified_workflow, :scope_for, :update, :user

end