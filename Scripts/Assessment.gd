extends Panel

# onready variables
onready var edit_assessment = get_node("EditAssessment")
onready var edit_assessment_panel = get_node("../../../../EditAssessmentPanel")
onready var assessment_name = get_node("AssessmentInfo/AssessmentName/Label")
onready var assessment_mark = get_node("AssessmentInfo/Mark/Label")
onready var assessment_weight = get_node("AssessmentInfo/Weight/Label")

# variables
var assessment_info = {"name": "", "mark": 0, "weight": 0}
var current_index = 0

# Initializes at the start
func _ready():
	edit_assessment.connect("pressed", self, "_on_EditAssessment_pressed")


# Sets the current index of the assessment in the tree
func set_index(_index):
	current_index = _index


# Brings up the edit assessment panel
func _on_EditAssessment_pressed():
	var _parent = edit_assessment_panel.get_parent()
	_parent.set_current_asessment_index(current_index)
	edit_assessment_panel.show()


# Sets the assessment panel's variables
func set_assessment_info(_name, _mark, _weight):
	# Stores the name, mark, and weight of the assessment
	assessment_info["name"] = _name
	assessment_info["mark"] = _mark
	assessment_info["weight"] = _weight
	
	# Sets the name, mark, and weight of the assessment
	assessment_name.text = _name
	assessment_mark.text = _mark
	assessment_weight.text = _weight
