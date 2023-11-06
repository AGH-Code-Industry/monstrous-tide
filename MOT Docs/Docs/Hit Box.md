---
aliases:
  - hitbox
  - hitboxa
  - Hitbox
  - Hitboxa
  - HitBoxa
  - Hit Boxa
extends: Area2D
---
#code/utility/hitbox

# Opis
Węzeł zajmujący się wykrywaniem i zarządzaniem *otrzymywaniem* obrażeń i leczenia. Silnie związany z [[Damage Box]]

# Parametry
Typ|Nazwa|Opis
-|-|-
`CollisionShape2D`|`collision`|Węzeł określający kształt [[Hit Box\|hitboxa]]
`Timer`|`disableTimer`|Węzeł dający "i-frames"
`float`|`max_health`|Maksymalna ilość zdrowia
`float`|`health`|Obecna ilość zdrowia
`bool`|`show_damage_taken_numbers`|Flaga określająca, czy renderować [[Floating Text\|numerki]] dla otrzymywania obrażeń
`bool`|`show_heal_numbers`|Flaga określająca, czy renderować [[Floating Text\|numerki]] dla otrzymywania leczenia

# Publiczne metody
Typ zwracanej zmiennej|Nazwa metody i argumenty|Opis
-|-|-
`void`|[[#take_damage]](dmg : [[Damage]])|Wywołaj tę metodę, żeby dany [[Hit Box\|hitbox]] otrzymał obrażenia
`void`|[[#heal]](heal_amount : float)|Wywołaj tę metodę, żeby wyleczyć danego [[Hit Box\|hitboxa]]

## take_damage
Ta metoda zajmuje się faktycznym odejmowaniem otrzymanych obrażeń od zdrowia, umieraniem, zarządzaniem *i-frames* i [[Floating Text Spawner|spawnowaniem numerków]]. Emituje sygnały `update_health`.

## heal
Zajmuje się dodawaniem leczenia do zdrowia, [[Floating Text Spawner|spawnuje numerki]]. Emituje sygnał `update_health`.

# Sygnały
Nazwa sygnału|Opis
-|-
update_health|==TODO==
on_death()|==TODO==

