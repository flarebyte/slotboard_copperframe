import 'package:slotboard_copperframe/src/slot_copperframe.dart';

class InfoMessageSlot extends CopperframeSlotBase {
  InfoMessageSlot({required super.tags});
}

class WarnMessageSlot extends CopperframeSlotBase {
  WarnMessageSlot({required super.tags});
}

class ErrorMessageSlot extends CopperframeSlotBase {
  ErrorMessageSlot({required super.tags});
}

class PreviewSlot extends CopperframeSlotBase {
  PreviewSlot({required super.tags});
}

class OutlineSlot extends CopperframeSlotBase {
  OutlineSlot({required super.tags});
}

class InputSlot extends CopperframeSlotBase {
  InputSlot({required super.tags});
}

class HistorySlot extends CopperframeSlotBase {
  HistorySlot({required super.tags});
}

class HelpSlot extends CopperframeSlotBase {
  HelpSlot({required super.tags});
}

class CopperframeSlots {
  static InfoMessageSlot infoMessage({required List<String> tags}) {
    return InfoMessageSlot(tags: tags);
  }

  static WarnMessageSlot warnMessage({required List<String> tags}) {
    return WarnMessageSlot(tags: tags);
  }

  static ErrorMessageSlot errorMessage({required List<String> tags}) {
    return ErrorMessageSlot(tags: tags);
  }

  static PreviewSlot preview({required List<String> tags}) {
    return PreviewSlot(tags: tags);
  }

  static OutlineSlot outline({required List<String> tags}) {
    return OutlineSlot(tags: tags);
  }

  static InputSlot input({required List<String> tags}) {
    return InputSlot(tags: tags);
  }

  static HistorySlot history({required List<String> tags}) {
    return HistorySlot(tags: tags);
  }

  static HelpSlot help({required List<String> tags}) {
    return HelpSlot(tags: tags);
  }
}
