extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const mouse_sensitivity = 0.005

@onready var camera_3d: Camera3D = $Camera3D

@export_category("holding objects")
@onready var interact_ray: RayCast3D = $Camera3D/InteractRay
var heldObject: RigidBody3D
var followDistance = 1
var followSpeed = 9
var maxDistanceFromCamera = 5

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera_3d.rotate_x(-event.relative.y * mouse_sensitivity)
		camera_3d.rotation.x = clampf(camera_3d.rotation.x, deg_to_rad(-89.9), deg_to_rad(89.9))

func set_held_object(body: RigidBody3D):
	if body is RigidBody3D:
		heldObject = body

func drop_held_object():
	heldObject = null

func handle_holding_object():
	if (Input.is_action_just_pressed("interact")):
		if heldObject != null: drop_held_object()
		elif interact_ray.is_colliding(): set_held_object(interact_ray.get_collider())
	
	if heldObject != null:
		var targetPos = camera_3d.global_transform.origin + (camera_3d.global_basis * Vector3(0, 0, -followDistance))
		var objectPos = heldObject.global_transform.origin
		heldObject.linear_velocity = (targetPos - objectPos) * followSpeed

		if heldObject.global_position.distance_to(camera_3d.global_position) > maxDistanceFromCamera:
			drop_held_object()

func _physics_process(delta: float) -> void:
	handle_holding_object()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gamepladwadswdwdwdway actions.
	var input_dir := Input.get_vector("input_left", "input_right", "input_forward", "input_back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
