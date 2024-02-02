extends Node2D

@onready var button_pressed_label = %ButtonPressedLabel

func _ready():
    GlobalEventBus.action_bar_key_pressed.connect(_action_bar_press)

func _action_bar_press(key):
    print("You pressed : " + key)
    button_pressed_label.text = "Button Pressed : " + key
