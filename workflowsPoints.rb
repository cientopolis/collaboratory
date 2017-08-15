require 'json'

def isDrawingTaskAndHasFollowUp(taskData)
	taskData["type"] == "drawing" and (taskData["tools"][0]["details"].size > 0)
end

pointValues = {'single' => 10, 'drawing' => 15, 'extra' => 5}

workflow = JSON.parse(ARGF.read)

totalPoints = 0

workflow['workflows'][0]['tasks'].each do |taskName,taskData|
	totalPoints += pointValues[taskData["type"]]
	totalPoints += pointValues['extra'] if isDrawingTaskAndHasFollowUp(taskData)
end

workflow['workflows'][0]['pointValue'] = totalPoints

puts workflow.to_json