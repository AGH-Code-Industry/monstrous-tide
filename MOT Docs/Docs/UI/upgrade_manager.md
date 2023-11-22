Manager is a Node listening for `level_up_signal` signal. When signal happens, `CardPopupMenu.tscn` is being created.

|Field type|Field name|Description|
|---|---|---|
|`Node`|`experience_manager`|manager responsible for sending `level_up_signal`|
|`preloaded scene`|`level_up_menu`|menu scene which will be created in `on_level_up_signal` function|

Functions:
- `on_level_up_signal()` - creates menu for card display (void).