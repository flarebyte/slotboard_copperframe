abstract class CopperframeSlotBase {
  String _prominence = '';
  String _size = '';
  List<String> tags;

  CopperframeSlotBase({
    required this.tags,
  });

  // Serializes the slot to JSON
  Map<String, dynamic> toJson() {
    return {
      'prominence': _prominence,
      'size': _size,
      'tags': tags,
    };
  }

  /// The prominence of the slot (important, very-important, ...)
  String get prominence {
    return _prominence;
  }

  /// Set the prominence of the slot (important, very-important,...)
  set prominence(String prominence) {
    _prominence = prominence;
  }

  /// The size of the slot (small, medium, large...)
  String get size {
    return _size;
  }

  /// Set the size of the slot (small, medium, large...)
  set size(String size) {
    _size = size;
  }

  /// Sets the prominence and size of a slot
  setValues({String? prominence, String? size}) {
    if (prominence != null) {
      _prominence = prominence;
    }

    if (size != null) {
      _size = size;
    }
    return this;
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
