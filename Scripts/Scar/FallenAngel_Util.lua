Objectives  = {}
function FA_AddObjective(obj, isSecondary)
	if  not isSecondary then
		Objectives[obj].Id = Objective_Add(Objectives[obj].Title, OT_Primary)
	else
		Objectives[obj].Id = Objective_Add(Objectives[obj].Title, OT_Secondary)
	end 

	if  Objectives[obj].Desc then
		Objective_AddDescription(Objectives[obj].Id, Objectives[obj].Desc)
	end 
end

function FA_CompleteObjective(obj)
	Objective_SetState(Objectives[obj].Id, OS_Complete)
end

function FA_RemovePing(ping)
	Ping_Remove(Pings[ping].Id)
end

function FA_CreatePointPing(ping, point)
	Pings[ping].Id = Ping_AddPoint(Pings[ping].Title, "anomaly", point)
	if  Pings[ping].Desc then
		Ping_LabelVisible(Pings[ping].Id, 1)
		Ping_AddDescription(Pings[ping].Id, 0, Pings[ping].Desc)
	end 
end

function FA_CreateSobGroupPing(ping, group)
	Pings[ping].Id = Ping_AddSobGroup(Pings[ping].Title, "anomaly", group)
	if  Pings[ping].Desc then
		Ping_LabelVisible(Pings[ping].Id, 1)
		Ping_AddDescription(Pings[ping].Id, 0, Pings[ping].Desc)
	end 
end