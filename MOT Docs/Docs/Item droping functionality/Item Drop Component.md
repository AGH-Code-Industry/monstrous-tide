---
extends: Node
---

#code/utility/drop_items 
Description: `Node` component attached to enemy. This component is responsible for dropping randomly chosen item when character dies. 

### Variables:
- `@export var hit_box_component: Node` - reference to character's [[Hit Box]] which must be set, so [[Item Drop Component]] - could know when character dies.
- `@export var items_to_drop: Array[DropItem] = []` - an array that keeps all items which could be drop. [[Drop Item]] is a resource made of item's node and it's weight (Higher the weight means higher chance to drop).
### Methods:
- `_ready()` - connects [[Hit Box]]'s `on_death` signal to `on_death_drop_crystal()` method.
- `on_death_drop_crystal()` - calls method `pick_random_item()`
- `pick_random_item()` - Randomly picks one item from `items_to_drop`, using weighted average. When item is chosen, method `create_item()` is called.
- `create_item(item: PackedScene)` - creates object passed as argument and sets objects' position to it's owner position. Also adds freshly created item to `items_layer`.