## Overview

The Experience Bar is a user interface element in the game that visually represents a player’s progress of experience towards next level. It is located on the top of the game screen.

## Preview

Full bar:
![[s+g-xp-bar-fill.png]]
Empty bar:
![[s+g-xp-bar-back.png]]
## Asset location

The Experience Bar is located in the directory `Assets/Utility/UI/Progressbar`.

## Files

The Experience Bar consists of the following four files:

> `progress_bar.gd`: This is the script file for the Experience Bar. It contains the logic for updating and animating the bar based on the player’s experience points.

>`progress_bar.tscn`: This is the design file for the Experience Bar. It defines the visual layout and appearance of the bar.

>`s+g-xp-bar-back.png`: This is the texture file for the background of the Experience Bar. It provides the gray frame for the bar.

> `s+g-xp-bar-fill.png`: This is the texture file for the fill of the Experience Bar. It provides the green color that represents the player’s experience points.

## Methods and fields

| Field type | Field name | Description |
| ---- | ---- | ---- |
| `preloaded texture bar` | `experience_bar` | texture bar describing current experience state |
| `preloaded label` | `level_info` | label containing current level number |
Methods:
- `on_update_experience_bar()` - method responsible for calculating filling proportions of experience bar based on current experience and experience needed to level up. It updates current player level if needed. It is called from GameEvents.
## Theme

The experience bar is set as default progress bar in the [[__Main Theme__|Main Theme]].