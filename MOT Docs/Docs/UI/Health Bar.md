## Overview

The Health Bar is a user interface element in the game that visually represents the player’s or enemy’s health status. It is visible over the character it describes.

## Preview

Full bar:
![[hp-bar-golden-frame-fill.png]]
Empty bar:
![[hp-bar-golden-frame-back.png]]
## Location

The Health Bar is located in the directory `Assets/Utility/UI/Healthbar`.

## Files

The Health Bar consists of the following four files:

>`health_bar.gd`: This is the script file for the Health Bar. It contains the logic for updating and animating the bar based on the health points of the player or enemy.

>`health_bar.tscn`: This is the design file for the Health Bar. It defines the visual layout and appearance of the bar.

>`hp-golden-frame-back.png`: This is the texture file for the background of the Health Bar. It provides the golden frame for the bar.

>`hp-golden-frame-fill.png`: This is the texture file for the fill of the Health Bar. It provides the red color that represents the health points.


## Usage

To use the Health Bar, you need to add it to your game scene using the `health_bar.tscn` file. Then, you can control the bar’s progress by updating the health points in the `health_bar.gd` script. The Health Bar is displayed over the player and some enemies, providing a quick visual indicator of their health status.

Please note that any changes to the bar’s appearance should be made in the corresponding texture files (`hp-golden-frame-back.png` and `hp-golden-frame-fill.png`).