extends CharacterBody2D


var speed = 50
var player_chase = false
var player = null
var health =100
var player_in_attack_zone=false
var can_take_damage = true
var play_attack=false
var is_dead=false
@onready var gunshot: AudioStreamPlayer2D = $gunshot
@onready var death: AudioStreamPlayer2D = $death

func _ready():
	$AnimatedSprite2D.play('idle')

func _physics_process(delta):
	deal_with_damage()
	update_health()
	
	if is_dead:
		death.play()
		$AnimatedSprite2D.play('death')
	elif play_attack:
		gunshot.play()
		$AnimatedSprite2D.play('attack')
	elif player_chase:
		position=position+(player.position - position)/speed
		$AnimatedSprite2D.play('walk')
		if(player.position.x - position.x ) < 0:
			$AnimatedSprite2D.flip_h=true
		else:
			$AnimatedSprite2D.flip_h=false
			
	else:
		$AnimatedSprite2D.play('idle')
	

	
func _on_detection_area_body_entered(body):
	player = body
	player_chase=true
	




func _on_detection_area_body_exited(body):
	player=null
	player_chase = false

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method('player'):
		player_in_attack_zone=true
		play_attack=true
		

func _on_enemy_hitbox_body_exited(body):
	if body.has_method('player'):
		player_in_attack_zone=false
		play_attack=false
		
func deal_with_damage():
	if player_in_attack_zone==true  and global.player_current_attack==true:
		if can_take_damage:
			health = health -20
			$take_damage_cooldown.start()
			can_take_damage=false
			print('golem health :', health)
			if health<=0:
				global.golems_killed+=1
				is_dead=true
				await get_tree().create_timer(1).timeout
				self.queue_free()
			

		
		


func _on_take_damage_cooldown_timeout():
	can_take_damage=true
	
	
	
func update_health():
	var enemyhealthbar= $healthbar
	enemyhealthbar.value = health
	enemyhealthbar.visible=true
	
