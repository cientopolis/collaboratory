#require 'json'
class GamifiedWorkflow < Workflow

  #self.table_name = "gamified_workflows"
  #belongs_to :parent, :class_name => "Workflow"

  after_find :calculatePoints

  @pointValue

  attr_accessor :pointValue

  def isDrawingTaskAndHasFollowUp(taskData)
    taskData["type"] == "drawing" and (taskData["tools"][0]["details"].size > 0)
  end

  def calculatePoints
    pointValues = {'single' => 10, 'drawing' => 15, 'extra' => 5}

    tasks = self.tasks.to_hash
    totalPoints = 0

    tasks.each do |taskName,taskData|
      totalPoints += pointValues[taskData["type"]]
      totalPoints += pointValues['extra'] if isDrawingTaskAndHasFollowUp(taskData)
    end

    #update_column(:pointValue,totalPoints)
    @pointValue = totalPoints
  end

end