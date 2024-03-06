---
tags: list
type: combat
description: "List of files providing general information about combat system, stats, related calculations and other, similar things."
---
___

*Below list is sorted in an alphabetical order:*

```dataview
TABLE description AS Description, type AS "Doc type"
FROM #combat
SORT file.name asc
```