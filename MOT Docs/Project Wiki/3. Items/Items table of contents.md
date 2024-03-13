---
tags: list
type: items
description: "List of files providing general information about items such as weapons, EXP points and other, related issues."
---
___

*Below tables are sorted in an alphabetical order:*

# Weapon-related

```dataview
TABLE description AS Description, type as "Doc type"
FROM #items 
WHERE contains(type, "weapons")
SORT file.name asc
```

# Non-weapon-related

```dataview
TABLE description AS Description, type as "Doc type"
FROM #items 
WHERE !contains(type, "weapons")
SORT file.name asc
```

# Everything

```dataview
TABLE description AS Description, type as "Doc type"
FROM #items
SORT file.name asc
```