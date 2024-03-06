---
tags: list
type: stages_maps
description: "List of files providing general information about in-game structure, stages, maps, biomes, enemies, etc."
---
___
*Below lists are sorted in an alphabetical order:*

# Important lists

```dataview
TABLE description AS Description, type as "Doc type"
FROM #stages_maps AND #list 
SORT file.name asc
```

# Biomes-related

```dataview
TABLE description AS Description, type as "Doc type"
FROM #stages_maps
WHERE contains(type, "biomes")
SORT file.name asc
```

# Enemies-related

```dataview
TABLE description AS Description, type as "Doc type"
FROM #stages_maps
WHERE contains(type, "enemies")
SORT file.name asc
```

# Everything

```dataview
TABLE description AS Description, type as "Doc type"
FROM #stages_maps 
SORT file.name asc
```