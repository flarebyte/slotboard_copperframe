abstract class CopperframeSlotBase {
  String prominence;
  String size;
  List<String> tags;

  CopperframeSlotBase({
    required this.prominence,
    required this.size,
    required this.tags,
  });

  // Serializes the slot to JSON
  Map<String, dynamic> toJson() {
    return {
      'prominence': prominence,
      'size': size,
      'tags': tags,
    };
  }

  // Deserializes from JSON to a slot
  static CopperframeSlotBase fromJson(Map<String, dynamic> json,
      CopperframeSlotBase Function(Map<String, dynamic>) createSlot) {
    return createSlot(json);
  }
}

class CopperframeSlotRegistry {
  final List<CopperframeSlotBase> _slots = [];

  // Registers a slot
  void registerSlot(CopperframeSlotBase slot) {
    _slots.add(slot);
  }

  // Lists all registered slots
  List<CopperframeSlotBase> list() {
    return _slots;
  }

  // Sets prominence for all slots that match any of the provided tags
  void setProminenceWhereTags(String newProminence,
      {required List<String> tags}) {
    for (var slot in _slots) {
      if (slot.tags.any((tag) => tags.contains(tag))) {
        slot.prominence = newProminence;
      }
    }
  }

  // Sets size for all slots that match any of the provided tags
  void setSizeWhereTags(String newSize, {required List<String> tags}) {
    for (var slot in _slots) {
      if (slot.tags.any((tag) => tags.contains(tag))) {
        slot.size = newSize;
      }
    }
  }

  // Sets prominence for all slots except those that match any of the provided tags
  void setProminenceExcludingTags(String newProminence,
      {required List<String> tags}) {
    for (var slot in _slots) {
      if (!slot.tags.any((tag) => tags.contains(tag))) {
        slot.prominence = newProminence;
      }
    }
  }

  // Sets size for all slots except those that match any of the provided tags
  void setSizeExcludingTags(String newSize, {required List<String> tags}) {
    for (var slot in _slots) {
      if (!slot.tags.any((tag) => tags.contains(tag))) {
        slot.size = newSize;
      }
    }
  }

  // Sets prominence based on class name
  void setProminenceByClassname(String newProminence, Type className) {
    for (var slot in _slots.where((slot) => slot.runtimeType == className)) {
      slot.prominence = newProminence;
    }
  }

  // Sets size based on class name
  void setSizeByClassname(String newSize, Type className) {
    for (var slot in _slots.where((slot) => slot.runtimeType == className)) {
      slot.size = newSize;
    }
  }
}
