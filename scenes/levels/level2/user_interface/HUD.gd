extends CanvasLayer

# Notifies level2 node that the button has been pressed
signal start_game
@onready var message = $Message
@onready var message_timer = $MessageTimer
@onready var start_button = $Start_Button
@onready var score_label = $ScoreLabel

func show_message(text):
	message.text = text
	message.show()
	message_timer.start()

func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await message_timer.timeout

	message.text = "Avoid the knifes for thirty seconds!"
	message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	start_button.show()

func update_score(score):
	score_label.text = str(score)
	
func _on_start_button_pressed():
	start_button.hide()
	start_game.emit()

func _on_message_timer_timeout():
	message.hide()
