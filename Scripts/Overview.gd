extends Control

# onready variables
onready var semester_scene = preload("res://Scenes/SemesterOverview.tscn")
onready var semester_container = get_node("VBoxContainer/Semesters/SemestersContainer")
onready var add_semester_button = get_node("AddSemester")

# variables
var semester_info = []
var semester_tree = []

func _ready():
	add_semester_button.connect("pressed", self, "_on_AddSemester_pressed")

func _on_AddSemester_pressed():
	var new_semester = semester_scene.instance()
	semester_container.add_child(new_semester)
