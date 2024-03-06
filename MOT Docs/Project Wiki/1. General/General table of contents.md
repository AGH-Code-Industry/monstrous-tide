---
tags: list
type: general
description: List of files providing general information about the project and our work.
---
___

*Below table is sorted in an alphabetical order:*

```dataview
TABLE description AS Description, type AS "Doc type"
FROM #general
SORT file.name asc
```