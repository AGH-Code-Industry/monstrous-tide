UI element that displays upgrade cards.

|Field type|Field name|Description|
|---|---|---|
|`preloaded scene`|`level_up_card`|card scene|
|`preload HBoxContainer`|`h_box_container`|parent of cards|

Functions:
- `create_cards()` - creates 3 cards and displays them.
- `remove_caards()` - removes all cards from `h_box_container`.
- `level_up()` - called from `experience_manager`. This function is responsible for pausing, unpausing game, creating and removing cards in right moment.
