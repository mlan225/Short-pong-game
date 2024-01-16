extends Node2D

var paddleStartPosition: Vector2
var paddleLevel : int = 0
var allPaddles = [
	{
		"path": "res://scenes/Paddle_A.tscn",
		"level": 0,
		"default": true
	},
	{
		"path": "res://scenes/Paddle_B.tscn",
		"level": 0,
		"default": false
	},
	{
		"path": "res://scenes/Paddle_C.tscn",
		"level": 0,
		"default": false
	},
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	paddleStartPosition = $paddleStartPosition.position
	#get a paddle position for the start of the game
	CreatePaddleNode(true)
	#creating a temporary timer for testing paddle switch
	var paddleTimer : Timer = Timer.new()
	add_child(paddleTimer)
	paddleTimer.one_shot = false
	paddleTimer.autostart = true
	paddleTimer.wait_time = 5.0
	paddleTimer.timeout.connect(ChangePaddle)
	paddleTimer.start()
	
func ChangePaddle():
	RemoveCurrentPaddle()
	#FindNextPaddle()
	#CreatePaddleNode(false, 0)

func CreatePaddleNode(gameStart: bool = false, paddleLevel: int = 0) -> void:
	var paddleScenePath: String
	
	if(gameStart):
		paddleScenePath = allPaddles[0].path
		
	var paddle = load(paddleScenePath).instantiate()
	add_child(paddle)
	
	if(gameStart):
		paddle.position = paddleStartPosition
	else:
		paddle.position = $Paddle.position

func RemoveCurrentPaddle():
	print("removing current paddle")

func FindNextPaddle() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
