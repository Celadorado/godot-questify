class_name QuestStart extends QuestNode


@export var name: String
@export var description: String


var conditions: Array[QuestNode]:
	get:
		return _graph.get_previous_nodes(self, QuestEdge.EdgeType.CONDITIONAL)


var available: bool
var active: bool


func get_available() -> bool:
	return available


func get_active() -> bool:
	return active


func get_completed() -> bool:
	return active


func update() -> void:
	if get_active():
		for condition in conditions:
			condition.update()
			if not condition.get_completed():
				return
		available = true
	super()