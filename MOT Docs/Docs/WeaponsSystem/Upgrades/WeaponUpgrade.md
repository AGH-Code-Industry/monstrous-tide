---
extends: Resource
---
This is a parent class to all other upgrades
## functions/methods/etc.:

Return Value Type|Name and arguments|Description
-|-|-
`void`|apply_upgrade()|Abstract method ssed to apply this upgrade to a weapon. Here it's empty method
## fields/variables/etc.:

Name|type|Description
-|-|-
`weapon_ref`|`Weapon`|Reference to a weapon this upgrade should be applied to when apply_upgrade() called
