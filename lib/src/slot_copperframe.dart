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

  /// Serializes the slot to JSON
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
    if (_prominence != prominence) {
      _prominence = prominence;
      notifyListeners();
    }
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
  set status(String newStatus) {
    if (newStatus != _status) {
      _status = newStatus;
      notifyListeners();
    }
  }

  /// The status of the slot (ok, ko, ...)
  String get status {
    return _status;
  }

  /// Set the secondary status of the slot (1, 2, 3+, ...)
  set secondaryStatus(String newSecondaryStatus) {
    if (_secondaryStatus != newSecondaryStatus) {
      _secondaryStatus = newSecondaryStatus;
      notifyListeners();
    }
  }

  /// The secondary status of the slot (1, 2, 3+, ...)
  String get secondaryStatus {
    return _secondaryStatus;
  }

  /// Set a title for the slot
  set title(String newTitle) {
    if (_title != newTitle) {
      _title = newTitle;
      notifyListeners();
    }
  }

  /// The title for the slot
  String get title {
    return _title;
  }

  /// Set a description or tooltip for the slot
  set description(String newDescription) {
    if (_description != newDescription) {
      _description = newDescription;
      notifyListeners();
    }
  }

  /// The description or tooltip for the slot
  String get description {
    return _description;
  }

  /// Sets the values for the slot
  /// Only if the values are different from the existing values
  setValues(
      {String? prominence,
      String? size,
      String? status,
      String? secondaryStatus,
      String? title,
      String? description}) {
    var hasChanged = false;

    if (prominence != null && _prominence != prominence) {
      _prominence = prominence;
      hasChanged = true;
    }

    if (size != null && _size != size) {
      _size = size;
      hasChanged = true;
    }
    if (status != null && _status != status) {
      _status = status;
      hasChanged = true;
    }
    if (secondaryStatus != null && _secondaryStatus != secondaryStatus) {
      _secondaryStatus = secondaryStatus;
      hasChanged = true;
    }
    if (title != null && _title != title) {
      _title = title;
      hasChanged = true;
    }
    if (description != null && _description != description) {
      _description = description;
      hasChanged = true;
    }

    if (hasChanged) {
      notifyListeners();
    }
    return this;
  }

  @override
  String toString() {
    return '$runtimeType:: tags: $tags, prominence: $_prominence, size: $_size, status: $_status, 2nd status: $_secondaryStatus';
  }

  /// Deserializes from JSON to a slot
  static CopperframeSlotBase fromJson(Map<String, dynamic> json,
      CopperframeSlotBase Function(Map<String, dynamic>) createSlot) {
    return createSlot(json);
  }
}

/// Registry for slots
class CopperframeSlotRegistry {
  final List<CopperframeSlotBase> _slots = [];

  /// Registers a slot
  void registerSlot(CopperframeSlotBase slot) {
    _slots.add(slot);
  }

  /// Lists all registered slots
  List<CopperframeSlotBase> list() {
    return _slots;
  }

  /// Sets prominence for all slots that match any of the provided tags
  void setProminenceWhereTags(String newProminence,
      {required List<String> tags}) {
    for (var slot in _slots) {
      if (slot.tags.any((tag) => tags.contains(tag))) {
        slot.prominence = newProminence;
      }
    }
  }

  /// Sets size for all slots that match any of the provided tags
  void setSizeWhereTags(String newSize, {required List<String> tags}) {
    for (var slot in _slots) {
      if (slot.tags.any((tag) => tags.contains(tag))) {
        slot.size = newSize;
      }
    }
  }

  /// Sets status for all slots that match any of the provided tags
  void setStatusWhereTags(String newStatus, {required List<String> tags}) {
    for (var slot in _slots) {
      if (slot.tags.any((tag) => tags.contains(tag))) {
        slot.status = newStatus;
      }
    }
  }

  /// Sets secondary status for all slots that match any of the provided tags
  void setSecondaryStatusWhereTags(String newSecondaryStatus,
      {required List<String> tags}) {
    for (var slot in _slots) {
      if (slot.tags.any((tag) => tags.contains(tag))) {
        slot.secondaryStatus = newSecondaryStatus;
      }
    }
  }

  /// Sets title for all slots that match any of the provided tags
  void setTitleWhereTags(String newTitle, {required List<String> tags}) {
    for (var slot in _slots) {
      if (slot.tags.any((tag) => tags.contains(tag))) {
        slot.title = newTitle;
      }
    }
  }

  /// Sets description for all slots that match any of the provided tags
  void setDescriptionWhereTags(String newDescription,
      {required List<String> tags}) {
    for (var slot in _slots) {
      if (slot.tags.any((tag) => tags.contains(tag))) {
        slot.description = newDescription;
      }
    }
  }

  /// Sets values for all slots that match any of the provided tags
  void setValuesWhereTags(
      {String? prominence,
      String? size,
      String? status,
      String? secondaryStatus,
      String? title,
      String? description,
      required List<String> tags}) {
    for (var slot in _slots) {
      if (slot.tags.any((tag) => tags.contains(tag))) {
        slot.setValues(
            prominence: prominence,
            size: size,
            status: status,
            secondaryStatus: secondaryStatus,
            title: title,
            description: description);
      }
    }
  }

  /// Sets prominence for all slots except those that match any of the provided tags
  void setProminenceExcludingTags(String newProminence,
      {required List<String> tags}) {
    for (var slot in _slots) {
      if (!slot.tags.any((tag) => tags.contains(tag))) {
        slot.prominence = newProminence;
      }
    }
  }

  /// Sets size for all slots except those that match any of the provided tags
  void setSizeExcludingTags(String newSize, {required List<String> tags}) {
    for (var slot in _slots) {
      if (!slot.tags.any((tag) => tags.contains(tag))) {
        slot.size = newSize;
      }
    }
  }

  /// Sets status for all slots except those that match any of the provided tags
  void setStatusExcludingTags(String newStatus, {required List<String> tags}) {
    for (var slot in _slots) {
      if (!slot.tags.any((tag) => tags.contains(tag))) {
        slot.status = newStatus;
      }
    }
  }

  /// Sets secondary status for all slots except those that match any of the provided tags
  void setSecondaryStatusExcludingTags(String newSecondaryStatus,
      {required List<String> tags}) {
    for (var slot in _slots) {
      if (!slot.tags.any((tag) => tags.contains(tag))) {
        slot.secondaryStatus = newSecondaryStatus;
      }
    }
  }

  /// Sets title for all slots except those that match any of the provided tags
  void setTitleExcludingTags(String newTitle, {required List<String> tags}) {
    for (var slot in _slots) {
      if (!slot.tags.any((tag) => tags.contains(tag))) {
        slot.title = newTitle;
      }
    }
  }

  /// Sets description for all slots except those that match any of the provided tags
  void setDescriptionExcludingTags(String newDescription,
      {required List<String> tags}) {
    for (var slot in _slots) {
      if (!slot.tags.any((tag) => tags.contains(tag))) {
        slot.description = newDescription;
      }
    }
  }

  /// Sets values for all slots except those that match any of the provided tags
  void setValuesExcludingTags(
      {String? prominence,
      String? size,
      String? status,
      String? secondaryStatus,
      String? title,
      String? description,
      required List<String> tags}) {
    for (var slot in _slots) {
      if (!slot.tags.any((tag) => tags.contains(tag))) {
        slot.setValues(
            prominence: prominence,
            size: size,
            status: status,
            secondaryStatus: secondaryStatus,
            title: title,
            description: description);
      }
    }
  }

  /// Sets prominence based on class name
  void setProminenceByClassname(String newProminence, Type className) {
    for (var slot in _slots.where((slot) => slot.runtimeType == className)) {
      slot.prominence = newProminence;
    }
  }

  /// Sets size based on class name
  void setSizeByClassname(String newSize, Type className) {
    for (var slot in _slots.where((slot) => slot.runtimeType == className)) {
      slot.size = newSize;
    }
  }

  /// Sets status based on class name
  void setStatusByClassname(String newStatus, Type className) {
    for (var slot in _slots.where((slot) => slot.runtimeType == className)) {
      slot.status = newStatus;
    }
  }

  /// Sets secondary status based on class name
  void setSecondaryStatusByClassname(
      String newSecondaryStatus, Type className) {
    for (var slot in _slots.where((slot) => slot.runtimeType == className)) {
      slot.secondaryStatus = newSecondaryStatus;
    }
  }

  /// Sets title based on class name
  void setTitleByClassname(String newTitle, Type className) {
    for (var slot in _slots.where((slot) => slot.runtimeType == className)) {
      slot.title = newTitle;
    }
  }

  /// Sets description based on class name
  void setDescriptionByClassname(String newDescription, Type className) {
    for (var slot in _slots.where((slot) => slot.runtimeType == className)) {
      slot.description = newDescription;
    }
  }

  /// Sets values based on class name
  void setValuesByClassname(
      {String? prominence,
      String? size,
      String? status,
      String? secondaryStatus,
      String? title,
      String? description,
      required className}) {
    for (var slot in _slots.where((slot) => slot.runtimeType == className)) {
      slot.setValues(
          prominence: prominence,
          size: size,
          status: status,
          secondaryStatus: secondaryStatus,
          title: title,
          description: description);
    }
  }
}
