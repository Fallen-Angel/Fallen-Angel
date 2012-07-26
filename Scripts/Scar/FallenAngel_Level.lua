Squadrons = {}
Spheres = {}
Cameras = {}
Salvage = {}
Asteroids = {}
Nebulas = {}
SOBGroups = {}
AddSOBGroups = {}

function FA_DetermChunk()
	for i, k in Squadrons do
		addSquadron(k[1],k[2],k[3],k[4],k[5],k[6],k[7])
	end
	for i, k in Spheres do
		addSphere(k[1],k[2],k[3])
	end
	for i, k in Cameras do
		addCamera(k[1],k[2],k[3])
	end
	for i, k in Salvage do
		addSalvage(k[1],k[2], 100, 0, 0, 0, 0)
	end
	for i, k in Asteroids do
		addAsteroid(k[1],k[2], k[3], 5, 5, 10, 15)
	end
	for i, k in Nebulas do
		addNebula(k[1], k[2], k[3], k[4], 500, k[5])
	end
	for i, k in SOBGroups do
		createSOBGroup(k)
	end
	for i, k in AddSOBGroups do
		addToSOBGroup(k[1],k[2])
	end
end
 
Pebbles = {}

function FA_NonDetermChunk()
	for i, k in Pebbles do
		addPebble("Pebble_0", k, 0, 0, 0)
	end
end