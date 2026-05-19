extends CharacterBody2D
var  enemy_in_attack_range = false
var enemy_attack_cooldown = true
var player_alive = true
const speed = 200
var curr_dir = 'none'
var attack_ip=false
@onready var gunshot: AudioStreamPlayer2D = $gunshot
@onready var walk: AudioStreamPlayer2D = $walk
@onready var death: AudioStreamPlayer2D = $death
func _physics_process(delta):
	player_movement(delta)
	enemy_attack()
	attack()
	update_health()
	
	if global.phealth<=0:
		death.play()
		player_alive = false
		global.phealth=0
		$AnimatedSprite2D.play('death')
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
		global.phealth=100
		global.enemies_killed=0
		global.golems_killed=0
		print(global.enemies_killed)
		
		

func player_movement(delta):
	if Input.is_action_just_pressed('ui_right') or Input.is_key_pressed(KEY_D):
		curr_dir= 'right'
		play_anim(1)
		velocity.x=speed
		velocity.y=0
	elif Input.is_action_just_pressed('ui_left') or Input.is_key_pressed(KEY_A):
		curr_dir='left'
		play_anim(1)
		velocity.x= - speed
		velocity.y=0
	elif Input.is_action_just_pressed('ui_down') or Input.is_key_pressed(KEY_S):
		curr_dir='down'
		play_anim(1)
		velocity.x= 0
		velocity.y= speed
	elif Input.is_action_just_pressed('ui_up') or Input.is_key_pressed(KEY_W):
		curr_dir='up'
		play_anim(1)
		velocity.x=  0
		velocity.y= - speed
	else:
		play_anim(0)
		velocity.x=0
		velocity.y=0
		
	move_and_slide()
func play_anim(movement):
	var dir = curr_dir
	var anim = $AnimatedSprite2D
	if movement==1:
		walk.play()
	if dir == 'right' :
		anim.flip_h = false
		if movement ==1 :
			anim.play('side_walk')
		elif movement == 0:
			if attack_ip==false:
				anim.play('side_idle')
			
	elif dir == 'left' :
		anim.flip_h = true
		if movement ==1 :
			anim.play('side_walk')
		elif movement == 0:
			if attack_ip==false:
				anim.play('side_idle')
			
	elif dir == 'down':
		anim.flip_h = false
		if movement ==1 :
			anim.play('down_walk')
		elif movement == 0:
			if attack_ip==false:
				anim.play('down_idle')
	elif dir == 'up' :
		anim.flip_h = false
		if movement ==1 :
			anim.play('up_walk')
		elif movement == 0:
			if attack_ip==false:
				anim.play('up_idle')
		

func player():
	pass
	
	

	
func _on_player_hitbox_body_entered(body):
	if body.has_method('enemy'):
		enemy_in_attack_range=true

func _on_player_hitbox_body_exited(body):

	if body.has_method('enemy'):
		enemy_in_attack_range=false
		

func enemy_attack():
	if enemy_in_attack_range==true and enemy_attack_cooldown==true :
		
		global.phealth = global.phealth - 20
		enemy_attack_cooldown=false
		$attack_cooldown.start()
		print(global.phealth)
		

func attack():
	var dir = curr_dir
	if Input.is_action_just_pressed('attack'):
		global.player_current_attack=true
		attack_ip=true
		if dir =='right':
			$AnimatedSprite2D.flip_h=false
			$AnimatedSprite2D.play('side_attack')
			gunshot.play()
			$deal_attack_timer.start()
		if dir =='left':
			$AnimatedSprite2D.flip_h=true
			$AnimatedSprite2D.play('side_attack')
			gunshot.play()
			$deal_attack_timer.start()
		if dir =='down':
			$AnimatedSprite2D.play('down_attack')
			gunshot.play()
			$deal_attack_timer.start()
		if dir =='up':
			$AnimatedSprite2D.play('up_attack')
			gunshot.play()
			$deal_attack_timer.start()


func _on_attack_cooldown_timeout():
	enemy_attack_cooldown=true
	



func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
	global.player_current_attack=false
	attack_ip=false
	
		
	
var healthbar= null
func update_health():
	var healthbar= $healthbar
	healthbar.value =global.phealth
	
	if global.phealth>=200:
		healthbar.visible=false
	else:
		healthbar.visible=true
		

func _on_regen_timer_timeout() -> void:
	if global.phealth<200:
		global.phealth = global.phealth+40
		if global.phealth>200:
			global.phealth=200
	if global.phealth<=0:
		global.phealth=0
		


func _on_cliffside_transition_point_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
