extends TextureButton
class_name SpellButton

@onready var progress_bar = $TextureProgressBar
@onready var timer = $Timer
@onready var time_label = $Time
@onready var key = $Key

@export var cooldown_timer: float = 1.5;

# questions?
# what does set_process() do?
# what is this format string? time_label.text = "%3.1f" % timer.time_left
# what is a shortcut?
# how do I remember all the UI stuff?

func _ready() -> void:
    # set a default key
    change_key = "3"
    
    # connect the pressed signal of the button to a function
    pressed.connect(_on_pressed)
    
    # set the cooldown timer
    timer.wait_time = cooldown_timer;
    
    # connect the timeout signal on the timer to a function
    timer.timeout.connect(_on_timer_timeout)
    
    # set the max on the progress bar to whatever the max timer is
    progress_bar.max_value = timer.wait_time
    
    # not sure why we do this if we have a process function?
    set_process(false);
    
func _process(delta):
    # set the text of the label to time remaining, the format string is unknown to me
    time_label.text = "%3.1f" % timer.time_left
    
    # update the progress bar position
    progress_bar.value = timer.time_left
    
var change_key = "":
    set(value):
        change_key = value
        key.text = value
        
        # what is a shortcut in godot?
        shortcut = Shortcut.new()
        var input_key = InputEventKey.new()
        input_key.keycode = value.unicode_at(0)
        shortcut.events = [input_key]
        
func _on_pressed():
    timer.start();
    disabled = true
    set_process(true)
    GlobalEventBus.action_bar_key_pressed.emit(key.text)
    
func _on_timer_timeout():
    disabled = false
    time_label.text = ""
    set_process(false)
    
