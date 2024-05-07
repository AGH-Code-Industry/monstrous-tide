extends Control

@onready var setting_name_label = $HBoxContainer/SettingName as Label
@onready var volume_value_label = $HBoxContainer/VolumeValue as Label
@onready var slider = $HBoxContainer/HSlider as HSlider

@export_enum("Master", "Music", "SFX") var bus_name : String

var bus_index : int = 0

func _ready():
	slider.value_changed.connect(on_value_changed)
	set_setting_name_label()
	set_bus_index()
	set_slider_value()

func set_setting_name_label() -> void:
	setting_name_label.text = str(bus_name) + " volume"

func set_volume_value_label() -> void:
	volume_value_label.text = str(slider.value*100) + "%"

func set_bus_index() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)

func set_slider_value() -> void:
	slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	set_volume_value_label()

func on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	set_volume_value_label()
