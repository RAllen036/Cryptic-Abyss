# Cryptic-Abyss

Game Description:
	A dungeon crawler game made in godot 4. 
	Details yet to be decided.
	

Credits:
	Godot Foundation - https://godotengine.org/ and github.com/godotengine/godot
	

Addons used:
	Jolt (Physics) Plugin - github.com/godot-jolt/godot-jolt
	Multiplayer Input Plugin - github.com/matjlars/godot-multiplayer-input
	Script-IDE - https://github.com/Maran23/script-ide
	

Gameplay:
	Doors / Portals / a Gate spawns around a predetermind map
	Gates can be entered and left anytime with the restriction of when you are in a boss fight
		Unsure of the method of blocking the player but either the gate looks like a door and closes or possible gets blocked
		Ulternativly the gate can just dissapear around the boss monster since they can't escape
	Gates, after a random amount of time, start to spawn a greater number of monsters only if there is a fraction of the starting or set value of monsters for that gate
	Gates that become overcrowded either:
		Stops the user from entering and spawns waves of monsters for x time then the boss appears
		Decrease the population in the gate but an increase in stats (Probably by 1 grade)
		Dissipates:
			Change in stats for nearby gates (Because of magical density)
		Relocates:
			Change in stats
			Explosion on relocation?
		Species evolves:
			Change in grade / stats
			Change in population size
	

References:
	Webtoon (To get a better idea of design desitions I implor you to read these if you can):
		Boundless Ascention
		Enrolling in the Trancendant Academy
		Auto Hunting With my Clones
		Surviving the Game as a Barbarian
			Leveling is complicated:
				You gain a small amount of xp per monster type that you kill (classes does count as type)
				You only gain the xp once per enemy type
			Really obscure or difficult boss and item locations / requirements:
				The witchs hut requires you to sacrefice 7 people in the fire pit before the insanly hard field boss apears
			Human nature:
				Lots of people try to murder the MC because they need to provide for there family etc
			Stats:
				
		I stole the First Ranker's Soul
			Reminded me about economy
	

Notes:
	Prebuilds and asset data will be contained within a compressed text file in user://Resources/Assets
		This is neccesary when using procedural generation either as:
			Wave function colapse
			Voxels
			Noise
			Erosion
		A compressed text file is used to reduce the size of the files
