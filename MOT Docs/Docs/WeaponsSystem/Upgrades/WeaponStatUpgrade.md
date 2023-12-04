---
extends: WeaponUpgrade
---
This class is used for upgrades that adds [[__Statistics outline__|stats]] to a weapon
## methods:

Return Value Type|Name and arguments|Description
-|-|-
`void`|apply_upgrade()|Used to apply specified stats to a weapon

## fields/variables/etc.:

Name|type|Description
-|-|-
`weapon_ref`|`Weapon`|Reference to a weapon this upgrade should be applied to when apply_upgrade() called
`stats`|`Array[Stat]`|This field specifies what stats will be added to weapon when apply_upgrade is called
