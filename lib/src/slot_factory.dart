import 'package:slotboard_copperframe/src/slot_copperframe.dart';

class InfoMessageSlot extends CopperframeSlotBase {
  InfoMessageSlot(
      {required super.prominence, required super.size, required super.tags});
}

class WarnMessageSlot extends CopperframeSlotBase {
  WarnMessageSlot(
      {required super.prominence, required super.size, required super.tags});
}

class ErrorMessageSlot extends CopperframeSlotBase {
  ErrorMessageSlot(
      {required super.prominence, required super.size, required super.tags});
}

class PreviewSlot extends CopperframeSlotBase {
  PreviewSlot(
      {required super.prominence, required super.size, required super.tags});
}

class OutlineSlot extends CopperframeSlotBase {
  OutlineSlot(
      {required super.prominence, required super.size, required super.tags});
}

class InputSlot extends CopperframeSlotBase {
  InputSlot(
      {required super.prominence, required super.size, required super.tags});
}

class HistorySlot extends CopperframeSlotBase {
  HistorySlot(
      {required super.prominence, required super.size, required super.tags});
}

class HelpSlot extends CopperframeSlotBase {
  HelpSlot(
      {required super.prominence, required super.size, required super.tags});
}

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

  static PreviewSlot preview(
      {required String prominence,
      required String size,
      required List<String> tags}) {
    return PreviewSlot(prominence: prominence, size: size, tags: tags);
  }

  static OutlineSlot outline(
      {required String prominence,
      required String size,
      required List<String> tags}) {
    return OutlineSlot(prominence: prominence, size: size, tags: tags);
  }

  static InputSlot input(
      {required String prominence,
      required String size,
      required List<String> tags}) {
    return InputSlot(prominence: prominence, size: size, tags: tags);
  }

  static HistorySlot history(
      {required String prominence,
      required String size,
      required List<String> tags}) {
    return HistorySlot(prominence: prominence, size: size, tags: tags);
  }

  static HelpSlot help(
      {required String prominence,
      required String size,
      required List<String> tags}) {
    return HelpSlot(prominence: prominence, size: size, tags: tags);
  }
}
