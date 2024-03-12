---
extends: Resource
---
This is a parent class to all other upgrades
## methods:

Return Value Type|Name and arguments|Description
-|-|-
`void`|apply_upgrade()|Adds this upgrade to array of applied upgrades of a weapon. Override it in inheriting upgrades to add additional functionality
## fields:

Name|type|Description
-|-|-
`weapon_ref`|`Weapon`|Reference to a weapon this upgrade should be applied to when apply_upgrade() called
`weight`|`int`|Weight, or how likely this upgrade is to roll
`upgrade_tier`|`int`|What is the tier of this upgrade
`name`|`String`|Name of this upgrade
