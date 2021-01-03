extends Panel

# constants
const MaxAssessments = 20

# onready variables
onready var assessment_scene = preload("res://Scenes/Assessment.tscn")
onready var add_assessment_button = get_node("CourseInfo/Assessments/AssessmentsContainer/AddAssessment")
onready var assessments_container = get_node("CourseInfo/Assessments/AssessmentsContainer")
onready var edit_assessment_panel = get_node("EditAssessmentPanel")

onready var confirm_button = get_node("EditAssessmentPanel/ConfirmButton")
onready var close_button = get_node("EditAssessmentPanel/CloseButton")

onready var assessment_name = get_node("EditAssessmentPanel/VBoxContainer/NameEdit")
onready var assessment_mark = get_node("EditAssessmentPanel/VBoxContainer/MarkContainer/MarkEdit")
onready var assessment_weight = get_node("EditAssessmentPanel/VBoxContainer/Weight Container/WeightEdit")

# variables
var assessment_count = 0
var latest_assessment = false
var current_assessment_index = 0


# Initializes buttons
func _ready():
	add_assessment_button.connect("pressed", self, "_on_AddAssessment_pressed")
	confirm_button.connect("pressed", self, "_on_ConfirmButton_pressed")
	close_button.connect("pressed", self, "_on_CloseButton_pressed")


# Sets the current assessment index
func set_current_asessment_index(_index):
	current_assessment_index = _index


# Adds an assessment to the list
func _on_AddAssessment_pressed():
	if assessment_count < MaxAssessments:
		var new_assessment = assessment_scene.instance()
		assessments_container.add_child(new_assessment)
		assessments_container.move_child(new_assessment, assessment_count)
		new_assessment.set_index(assessment_count)
		assessment_count += 1
		edit_assessment_panel.show()
		latest_assessment = true
	else:
		print("Too many assessments")


# Confirms the edits for the assessment
func _on_ConfirmButton_pressed():
	var _current_assessment = null
	
	if latest_assessment:
		_current_assessment = assessments_container.get_child(assessment_count - 1)
	else:
		_current_assessment = assessments_container.get_child(current_assessment_index)
	
	if assessment_mark.text.is_valid_float() and assessment_weight.text.is_valid_float():
		_current_assessment.set_assessment_info(assessment_name.text, assessment_mark.text, assessment_weight.text)
		edit_assessment_panel.hide()
		latest_assessment = false
	else:
		print("Invalid mark and/or weight")


# Closes the edit assessment panel
func _on_CloseButton_pressed():
	edit_assessment_panel.hide()
