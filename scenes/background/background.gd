extends ParallaxBackground

@export var scroll_speed: int = 15

var textures: Array = [
    preload("res://assets/Blue.png"),
    preload("res://assets/Brown.png"),
    preload("res://assets/Pink.png"),
    preload("res://assets/Purple.png"),
    preload("res://assets/Yellow.png"),
];

@onready var sprite = $ParallaxLayer/Sprite2D

func _ready() -> void:
    # set the texture on the background
    sprite.texture = textures[0]
    
    GlobalEventBus.action_bar_key_pressed.connect(change_background_texture)

func _process(delta) -> void:
    sprite.region_rect.position += delta * Vector2(scroll_speed, scroll_speed)
    if sprite.region_rect.position >= Vector2(64, 64):
        sprite.region_rect.position = Vector2.ZERO
        
func change_background_texture(key):
    sprite.texture = textures[int(key) - 1]
