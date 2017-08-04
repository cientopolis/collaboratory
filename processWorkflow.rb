rawWorkflow = ARG.read

workflows = JSON.parse(rawWorkflow)

workflows["workflows"][0]["tasks"].each do |task,taskContent|
	if taskContent["type"] == "drawing"
		puts "dr"

	end
	taskContent["single"] == "drawing" ? puts "sg"
	end