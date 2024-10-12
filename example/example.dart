import 'package:slotboard_copperframe/slotboard_copperframe.dart';

class InfoMessageSlot extends CopperframeSlotBase {
  InfoMessageSlot({
    required super.tags,
  });
}

void main() {
  var slot = InfoMessageSlot(
    tags: ['main'],
  );
  slot.prominence = 'important';
  slot.size = 'small';
  slot.status = 'ok';
  slot.secondaryStatus = '5+';
  slot.title = 'Hello World!';
  slot.description = 'This is a description';
  final registry = CopperframeSlotRegistry();
  registry.registerSlot(slot);
  registry.setProminenceWhereTags('critical', tags: ['main']);
}
