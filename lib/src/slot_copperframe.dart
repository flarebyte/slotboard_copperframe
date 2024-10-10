import 'package:flutter/foundation.dart';

abstract class CopperframeSlotBase with ChangeNotifier {
  String _prominence = '';
  String _size = '';
  String _status = '';
  String _secondaryStatus = '';
  String _title = '';
  String _description = '';
  List<String> tags;

  CopperframeSlotBase({
    required this.tags,
  });

  // Serializes the slot to JSON
  Map<String, dynamic> toJson() {
    return {
      'tags': tags,
      'prominence': _prominence,
      'size': _size,
      'status': _status,
      'secondaryStatus': _secondaryStatus,
      'title': _title,
      'description': _description,
    };
  }

  /// The prominence of the slot (important, very-important, ...)
  String get prominence {
    return _prominence;
  }

  /// Set the prominence of the slot (important, very-important,...)
  set prominence(String prominence) {
    _prominence = prominence;
    notifyListeners();
  }

  /// The size of the slot (small, medium, large...)
  String get size {
    return _size;
  }

  /// Set the size of the slot (small, medium, large...)
  set size(String size) {
    _size = size;
    notifyListeners();
  }

  /// Set the status of the slot (ok, ko, ...)
  set status(String status) {
    _status = status;
    notifyListeners();
  }

  /// The status of the slot (ok, ko, ...)
  String get status {
    return _status;
  }

  /// Set the secondary status of the slot (1, 2, 3+, ...)
  set secondaryStatus(String status) {
    _secondaryStatus = status;
    notifyListeners();
  }

  /// The secondary status of the slot (1, 2, 3+, ...)
  String get secondaryStatus {
    return _secondaryStatus;
  }

  /// Set a title for the slot
  set title(String title) {
    _title = title;
    notifyListeners();
  }

  /// The title for the slot
  String get title {
    return _title;
  }

  /// Set a description or tooltip for the slot
  set description(String description) {
    _description = description;
    notifyListeners();
  }

  /// The description or tooltip for the slot
  String get description {
    return _description;
  }

  /// Sets the values for the slot
  setValues(
      {String? prominence,
      String? size,
      String? status,
      String? secondaryStatus,
      String? title,
      String? description}) {
    if (prominence != null) {
      _prominence = prominence;
    }

    if (size != null) {
      _size = size;
    }
    if (status != null) {
      _status = status;
    }
    if (secondaryStatus != null) {
      _secondaryStatus = secondaryStatus;
    }
    if (title != null) {
      _title = title;
    }
    if (description != null) {
      _description = description;
    }

    notifyListeners();
    return this;
  }

  @override
  String toString() {
    return '$runtimeType:: tags: $tags, prominence: $_prominence, size: $_size, status: $_status, 2nd status: $_secondaryStatus';
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
