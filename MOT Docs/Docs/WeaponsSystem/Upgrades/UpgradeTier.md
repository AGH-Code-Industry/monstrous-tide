---
extends: Resource
---
This is a resource that holds all the upgrades for given tier.
## methods:

Return Value Type|Name and arguments|Description
-|-|-
`void`|set_upgrades_weights(upgrade_weight: int)|Sets specified weight for all upgrades in this tier
`void`|set_weapons_refs(ref: [[Weapon]])|Sets weapon reference for all upgrades in this tier
`void`|set_upgrade_tier(tier: int)|Sets upgrade tier
`void`|set_max_upgrades(amount: int)|Sets maximum amount of upgrades from this tier

## fields:

Name|type|Description
-|-|-
`upgrades`|Array\[[[WeaponUpgrade]]\]|An array of all upgrades for this tier
`max_upgrades`|int|Specifies how many upgrades from this tier can be applied

