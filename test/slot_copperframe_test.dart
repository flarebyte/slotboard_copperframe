import 'package:slotboard_copperframe/slotboard_copperframe.dart';
import 'package:test/test.dart';

class TestSlot extends CopperframeSlotBase {
  TestSlot({
    required String prominence,
    required String size,
    required List<String> tags,
  }) : super(prominence: prominence, size: size, tags: tags);
}

void main() {
  group('CopperframeSlotBase', () {
    test('toJson should correctly serialize to JSON', () {
      var slot = TestSlot(
          prominence: 'important', size: 'small', tags: ['main', 'urgent']);
      var expectedJson = {
        'prominence': 'important',
        'size': 'small',
        'tags': ['main', 'urgent'],
      };

      expect(slot.toJson(), equals(expectedJson));
    });

    test('fromJson should correctly deserialize from JSON', () {
      var jsonData = {
        'prominence': 'important',
        'size': 'small',
        'tags': ['main', 'urgent'],
      };

      var slot = CopperframeSlotBase.fromJson(jsonData, (json) {
        return TestSlot(
          prominence: json['prominence'],
          size: json['size'],
          tags: List<String>.from(json['tags']),
        );
      });

      expect(slot.prominence, equals('important'));
      expect(slot.size, equals('small'));
      expect(slot.tags, equals(['main', 'urgent']));
    });
  });
}
