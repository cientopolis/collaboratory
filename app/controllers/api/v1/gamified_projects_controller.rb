class Api::V1::GamifiedProjectsController < Api::V1::ProjectsController

def self.action_params
  aux = Hash.new
  aux[:create] = ProjectCreateSchema.new
  aux[:update] = ProjectUpdateSchema.new
  aux
end

end