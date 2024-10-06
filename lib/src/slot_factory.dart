import 'package:slotboard_copperframe/src/slot_copperframe.dart';

class InfoMessageSlot extends CopperframeSlotBase {
  InfoMessageSlot(
      {required String prominence,
      required String size,
      required List<String> tags})
      : super(prominence: prominence, size: size, tags: tags);
}

class WarnMessageSlot extends CopperframeSlotBase {
  WarnMessageSlot(
      {required String prominence,
      required String size,
      required List<String> tags})
      : super(prominence: prominence, size: size, tags: tags);
}

class ErrorMessageSlot extends CopperframeSlotBase {
  ErrorMessageSlot(
      {required String prominence,
      required String size,
      required List<String> tags})
      : super(prominence: prominence, size: size, tags: tags);
}

// Additional slot classes like InputSlot, OutlineSlot, etc.

class CopperframeSlots {
  static InfoMessageSlot infoMessage(
      {required String prominence,
      required String size,
      required List<String> tags}) {
    return InfoMessageSlot(prominence: prominence, size: size, tags: tags);
  }

  static WarnMessageSlot warnMessage(
      {required String prominence,
      required String size,
      required List<String> tags}) {
    return WarnMessageSlot(prominence: prominence, size: size, tags: tags);
  }

  static ErrorMessageSlot errorMessage(
      {required String prominence,
      required String size,
      required List<String> tags}) {
    return ErrorMessageSlot(prominence: prominence, size: size, tags: tags);
  }
}
