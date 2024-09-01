extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var page_id = 0
@export var custom_color = false
@export var custom_color_id = 0
var lines :Array = [
	[ #0 (test text)
		"hello",
		"this is a test thing :3",
	],[ #1
		"20XX-10-15_02-09-48:",
		"\"This is my final entry.\"",
		"\"I've been trapped in here for weeks now.\"",
		"\"I made these notes hoping...\"", 
		"\"that someone would find them.\"",
		"\"If someone is listening to this this…\"",
		"\"I am no longer here.\"",
	],[ #2
		"20XX-10-11_21-53-43:",
		"\"Food is running low.\"",
		"\"All my other companions have left me.\"",
		"\"I don't think I have much time left.\"",
		"\"I can feel my end getting closer and closer.\"",
		"\"I hope someone finds me here.\"",
	],[ #3
		"20XX-09-30_20-45-32:",
		"\"I tried to leave today.\"",
		"\"The door broke.\"",
		"\"I can’t leave this room anymore\"",
		"\"At least I have people with me\"",
		"\"Hopefully we'll be able to leave soon.\"",
	],[ #4
		"20XX-09-28_05-26-12:",
		"\"That thing found me.\"",
		"\"I tried to outrun it but it's too fast.\"",
		"\"I somehow managed to get inside a room.\"",
		"\"It's blast proof so I don't think it can get in.\"",
		"\"I found other people here.\"",
		"\"Hopefully we're safe.\""
	],[ #5
		"20XX-09-27_12-18-24:",
		"\"I've been scavenging around the lab…\"",
		"\"Trying to find supplies and food.\"",
		"\"I think I'm going to be able to survive here…\"",
		"\"At least until someone finds me.\"",
		"\"I still can’t believe what they wanted us to do.\"",
	],[ #6
		"20XX-09-26_23-24-08:",
		"\"Who thought this was a good idea?\"",
		"\"Why would they do this those people?\"",
		"\"We were supposed to save humanity!\"",
		"\"How is getting rid of it saving it?!\"",
		"\" ... \"",
		"\"I want to leave this place.\"",
	],[ #7
		"20XX-09-26_23-02-47:",
		"\"I found one of the main control rooms in here.\"",
		"\"There seems to be a bunch of papers on the tables…\"",
		"\"They detail plans for…\"",
		"\"No…\"",
		"\"How could this be…\"",
		"\"How did we not know this…\"",
		"\"This is inhuman.\"",
		"\"How did we do such things.\"",
		"\" ... \"",
		"\"I- I think I need a moment.\"",
	],[ #8
		"20XX-09-24_13-49-20:",
		"\"I found some other people.\"",
		"\"Looks like I’m not the only one that survived\"",
		"\"They went their own way however.\"",
		"\"I didn’t follow them...\"", 
		"\"They went the way I came here.\"",
		"\"Hopefully we see each other again soon.\"",
	],[ #9
		"20XX-09-23_12-28-37:",
		"\"I found some food in one of the vending machines.\"",
		"\"Most parts of the building are destroyed.\"",
		"\"Finding food is becoming really difficult.\"",
		"\"Hopefully this will last for a bit.\"",
	],[ #10
		"20XX-09-20_02-14-21:",
		"\"I don't know where to go anymore\"",
		"\"I crawled through a hole in the wall.\"",
		"\"I think I'm safe for now.\"",
		"\"Now my priority is finding something to eat.\"",
		"\"Hopefully something still works here.\"",
	],[ #11
		"20XX-09-18_19-59-08:",
		"\"They're dead.\"",
		"\"They're all dead!\"",
		"\"I saw it murder everyone…\"",
		"\"In front of my eyes.\"",
		"\" ... \"",
		"\"I need to get out of here.\"",
	],[ #12
		"20XX-09-18_19-36-45:",
		"\"We've been trying to contain the last experiment.\"",
		"\"It's proving to be harder that we thought.\"",
		"\"What was that noise?\"",
		"\" … \"",
		"\"It escaped.\"",
	],[ #13
		"Log #12034; Experiment 255 #7",
		"\"The experiment worked,\"",
		"\"Somehow.\"",
		"\"We still don't really know…\"",
		"\"Exactly what we're working with.\"",
		"\"We only know that it worked better than expected.\"",
		"\"We're going to have to contain what we created though.\"",
		"\"For the better of everyone.\"",
	],[ #14
		"Log #12033; Experiment 255 #6:",
		"\"This is probably one of our last attempts\"",
		"\"Our resources are running low.\"",
		"\"We might need to stop this soon.\"",
	],[ #15
		"Log #12030; Experiment 255 #3:",
		"\"As they say, third time's the charm!\"",
		"\"I really hope this works.\"",
		"\"They told us it will help humanity.\"",
		"\"So I'm looking forward to it.\"",
	],[ #16
		"Log #12028; Experiment 255 #1:",
		"\"We were commissioned for a secret operation\"",
		"\"We were told not to disclose information…\"",
		"\"With anyone.\"",
		"\"This is our first attempt.\"",
		"\"This is the start to humanity's saving...\"",
		"\"We'll save the world with this.\"",
		"\"At least that's what they told us.\"",
	]
]

var can_read = true

func _ready() -> void:
	if custom_color:
		sprite_2d.set_frame(custom_color_id)
	else:
		sprite_2d.set_frame(randi_range(0,5))

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.page_col = true
		Global.page_id = page_id
		if can_read:
			Global.page_show = true
			print("readed :3", lines[page_id])
			
			DialogueManager.start_dialogue(self.global_position, lines[page_id])
			
			
		print("page in :3")

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.page_col = false
		Global.page_id = 0
		print ("bye page :3")
		DialogueManager.stop_dialogue()
