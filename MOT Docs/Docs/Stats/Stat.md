___

*This is an object that holds data about single stat*

___
## Public methods:

Return value's type|Name and arguments|Description
-|-|-
`void`|add_value(value: int)|Call this method to increase the value of a stat

## Fields:

Field type|Field name|Description
-|-|-
`enum`|`Type`|This enum defines all possible stats
`Type`|`type`|Represents type of stat, like DMG or ARMOR
`int`|`value`|Actual value of a stat

## Links/relations:

- Used in StatSet as in an array to represent all stats for given component