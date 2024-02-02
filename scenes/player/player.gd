extends CharacterBody2D

const SPEED = 300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
    velocity = Vector2(0, 0)
    
    # shitty movement, not the focus of this session
    if (Input.is_action_pressed("up")):
        velocity.y = -SPEED
    if (Input.is_action_pressed("down")):
        velocity.y = SPEED
    if (Input.is_action_pressed("left")):
        velocity.x = -SPEED
    if (Input.is_action_pressed("right")):
        velocity.x = SPEED
        
    move_and_slide()

    var screen_size = get_viewport_rect().size
    global_position = global_position.clamp(Vector2(0, 0), screen_size)
