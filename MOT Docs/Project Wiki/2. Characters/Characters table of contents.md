---
tags: list
type: characters
description: List of files providing general information about characters, their mechanics and other characteristics.
---
___
*Below table is sorted in an alphabetical order:*

```dataview
TABLE description AS Description, type AS "Doc type"
FROM #characters 
SORT file.name asc
```