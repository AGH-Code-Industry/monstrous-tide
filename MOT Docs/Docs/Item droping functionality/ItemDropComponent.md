Description: `Node` component attached to enemy. This component is responsible for dropping randomly chosen item when character dies. 

### Variables:
- `@export var hit_box_component: Node` - reference to character's `hit_box_component` which must be set, so `ItemDropComponent` - could know when character dies.
- `@export var items_to_drop: Array[DropItem] = []` - an array that keeps all items which could be drop. `DropItem` is a resource made of item's node and it's weight (Higher the weight means higher chance to drop).
### Functions:
- `_ready()` - connects `hit_box_component`'s `on_death` signal to `on_death_drop_crystal()` function.
- `on_death_drop_crystal()` - calls function `pick_random_item()`
- `pick_random_item()` - Randomly picks one item from `items_to_drop`, using weighted average. When item is chosen, function `create_item()` is called.
- `create_item(item: PackedScene)` - creates object passed as argument and sets objects' position to it's owner position. Also adds freshly created item to `items_layer`.