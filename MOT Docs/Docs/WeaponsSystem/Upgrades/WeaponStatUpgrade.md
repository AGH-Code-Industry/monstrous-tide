
This is a child of [[WeaponUpgrade]]. It's used for upgrades that adds stats to a weapon
## functions/methods/etc.:

Return Value Type|Name and arguments|Description
-|-|-
`void`|apply_upgrade()|Used to apply this upgrade to a weapon. Here it's empty method to be overriden by inheriting scripts

## fields/variables/etc.:

Name|type|Description
-|-|-
`weapon_ref`|`Weapon`|Reference to a weapon this upgrade should be applied to when apply_upgrade() called
`stats`|`Array[Stat]`|This field specifies what stats will be added to weapon when apply_upgrade is called
