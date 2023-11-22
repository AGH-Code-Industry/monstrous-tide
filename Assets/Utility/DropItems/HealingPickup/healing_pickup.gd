extends DropItemClass

@export var healing_amount : float = 5

func collect():
    %Player/HitBox.heal(healing_amount)