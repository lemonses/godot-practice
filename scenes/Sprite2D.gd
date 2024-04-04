extends Sprite2D

var pos: Vector2 = Vector2.ZERO
var test_scale:float = 1
const speed: int = 200

func _ready():
	pos = Vector2(300,200)
	#test_scale = 2
	position = pos
	scale = Vector2(test_scale,test_scale)

func _process(delta):
	pos.x += speed * delta
	position = pos
