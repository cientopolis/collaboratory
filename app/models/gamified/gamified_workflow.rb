require 'json'
class GamifiedWorkflow < Workflow

  #after_create only: :create ,:update => calculatePoints
  #after_create :calculatePoints
  #after_update :calculatePoints
  after_find :calculatePoints#, if: -> {@pointValue = nil}

  #@pointValue

  #attr_accessor :pointValue


  def isDrawingTaskAndHasFollowUp(taskData)
    taskData["type"] == "drawing" and (taskData["tools"][0]["details"].size > 0)
  end

  def calculatePoints
    pointValues = {'single' => 10, 'drawing' => 15, 'extra' => 5}


    task = self.tasks.to_hash
    #puts workflow.class
    totalPoints = 0

    task.each do |taskName,taskData|
      totalPoints += pointValues[taskData["type"]]
      totalPoints += pointValues['extra'] if isDrawingTaskAndHasFollowUp(taskData)
    end

    #workflow['pointValue'] = totalPoints
    self.pointValue = totalPoints

    #puts workflow.to_json
  end

end