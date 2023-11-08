---
extends: "[[Projectile]]"
---
#code/weapons/projectiles

# Fields
Field type|Field name|Description
-|-|-
`int`|`level`|Projectile's level
`Vector2`|`target`|Global position of the projectile's target
`Vector2`|`direction`|`Vector2` represantation of direction to the target
`float`|`speed`|Projectile's speed
`int`|`pierce_amount`|How many enemies can the projectile pierce before destruction
~~`int/float`~~|~~`knockback_amount`~~|**unused**
~~`float`~~|~~`attack_size`~~|**unused**


# Public Methods
Return type|Method name|Description
-|-|-
`void`|`config(dmg : float, spd : float, dir : Vector2, atkspd: float, prc : int, knbk : float)`|Setter for all necessary properties of a projectile. Called on spawn in [[Ice Spear]]
`override void`|`set_damage(val: float)`|Setter for the projectile's [[Damage Box\|DamageBox]]'s `damage` property
`override float`|`get_damage()`|Getter for the projectile's [[Damage Box\|DamageBox]]'s `damage` property
