---
tags: list, items
type: weapons
description: "A list of weapons to be implemented or already existing in our game."
---
___

*Below lists are sorted in an alphabetical order:*

# Base weapons

```dataview
TABLE description AS Description, type AS "Doc type"
FROM "Project Wiki/3. Items/Weapons/Weapons descriptions" 
WHERE upgrade = "base"
SORT file.name asc
```

# Legendary upgrade

```dataview
TABLE description AS Description, type AS "Doc type"
FROM "Project Wiki/3. Items/Weapons/Weapons descriptions" 
WHERE upgrade = "legendary"
SORT file.name asc
```


# Everything

```dataview
TABLE description AS Description, upgrade AS "Weapon type", type AS "Doc type"
FROM "Project Wiki/3. Items/Weapons/Weapons descriptions" 
SORT file.name asc
```