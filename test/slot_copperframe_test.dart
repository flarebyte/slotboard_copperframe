import 'package:slotboard_copperframe/slotboard_copperframe.dart';
import 'package:flutter_test/flutter_test.dart';

class TestSlot extends CopperframeSlotBase {
  TestSlot({
    required super.tags,
  });
}

void main() {
  group('CopperframeSlotBase', () {
    test('toJson should correctly serialize to JSON', () {
      var slot = TestSlot(tags: ['main', 'urgent'])
          .setValues(prominence: 'important', size: 'small');
      var expectedJson = {
        'prominence': 'important',
        'size': 'small',
        'tags': ['main', 'urgent'],
      };

      expect(slot.toJson(), equals(expectedJson));
      expect(
          slot.toString(),
          equals(
              'TestSlot: prominence: important, size: small, tags: [main, urgent]'));
    });

    test('fromJson should correctly deserialize from JSON', () {
      var jsonData = {
        'prominence': 'important',
        'size': 'small',
        'tags': ['main', 'urgent'],
      };

      var slot = CopperframeSlotBase.fromJson(jsonData, (json) {
        return TestSlot(
          tags: List<String>.from(json['tags']),
        ).setValues(
          prominence: json['prominence'],
          size: json['size'],
        );
      });

      expect(slot.prominence, equals('important'));
      expect(slot.size, equals('small'));
      expect(slot.tags, equals(['main', 'urgent']));
    });
  });

  group('CopperframeSlotRegistry Tests', () {
    late CopperframeSlotRegistry registry;

    setUp(() {
      registry = CopperframeSlotRegistry();
    });

    test('registerSlot should add slot to the list', () {
      var slot = InfoMessageSlot(
        tags: ['main'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );
      registry.registerSlot(slot);

      expect(registry.list(), contains(slot));
    });

    test('setProminenceWhereTags should update correct slots', () {
      var slot1 = InfoMessageSlot(
        tags: ['main'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );
      var slot2 = WarnMessageSlot(
        tags: ['urgent'],
      ).setValues(
        prominence: 'very-important',
        size: 'medium',
      );
      registry.registerSlot(slot1);
      registry.registerSlot(slot2);

      registry.setProminenceWhereTags('critical', tags: ['main']);
      expect(slot1.prominence, 'critical');
      expect(slot2.prominence, 'very-important');
    });

    test('setSizeWhereTags should update correct slots', () {
      var slot1 = InfoMessageSlot(
        tags: ['main'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );
      var slot2 = WarnMessageSlot(
        tags: ['urgent'],
      ).setValues(
        prominence: 'very-important',
        size: 'medium',
      );
      registry.registerSlot(slot1);
      registry.registerSlot(slot2);

      registry.setSizeWhereTags('large', tags: ['main']);
      expect(slot1.size, 'large');
      expect(slot2.size, 'medium');
    });

    test('setProminenceExcludingTags should update only untagged slots', () {
      var slot1 = InfoMessageSlot(
        tags: ['main'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );
      var slot2 = WarnMessageSlot(
        tags: ['urgent'],
      ).setValues(
        prominence: 'very-important',
        size: 'medium',
      );
      registry.registerSlot(slot1);
      registry.registerSlot(slot2);

      registry.setProminenceExcludingTags('low', tags: ['urgent']);
      expect(slot1.prominence, 'low');
      expect(slot2.prominence, 'very-important');
    });

    test('setSizeExcludingTags should update only untagged slots', () {
      var slot1 = InfoMessageSlot(
        tags: ['main'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );
      var slot2 = WarnMessageSlot(
        tags: ['urgent'],
      ).setValues(
        prominence: 'very-important',
        size: 'medium',
      );
      registry.registerSlot(slot1);
      registry.registerSlot(slot2);

      registry.setSizeExcludingTags('large', tags: ['urgent']);
      expect(slot1.size, 'large');
      expect(slot2.size, 'medium');
    });

    test('setProminenceByClassname should update correct class slots', () {
      var slot1 = InfoMessageSlot(
        tags: ['main'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );
      var slot2 = WarnMessageSlot(
        tags: ['urgent'],
      ).setValues(
        prominence: 'very-important',
        size: 'medium',
      );
      registry.registerSlot(slot1);
      registry.registerSlot(slot2);

      registry.setProminenceByClassname('normal', InfoMessageSlot);
      expect(slot1.prominence, 'normal');
      expect(slot2.prominence, 'very-important');
    });

    test('setSizeByClassname should update correct class slots', () {
      var slot1 = InfoMessageSlot(
        tags: ['main'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );
      var slot2 = WarnMessageSlot(
        tags: ['urgent'],
      ).setValues(
        prominence: 'very-important',
        size: 'medium',
      );
      registry.registerSlot(slot1);
      registry.registerSlot(slot2);

      registry.setSizeByClassname('large', WarnMessageSlot);
      expect(slot1.size, 'small');
      expect(slot2.size, 'large');
    });

    test(
        'setProminenceWhereTags edge case with empty tags should update nothing',
        () {
      var slot = InfoMessageSlot(
        tags: ['main'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );
      registry.registerSlot(slot);

      registry.setProminenceWhereTags('critical', tags: []);
      expect(slot.prominence, 'important'); // No change because tags are empty
    });

    test(
        'setProminenceExcludingTags edge case with empty tags should update all slots',
        () {
      var slot = InfoMessageSlot(
        tags: ['main'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );
      registry.registerSlot(slot);

      registry.setProminenceExcludingTags('low', tags: []);
      expect(slot.prominence,
          'low'); // All slots should be updated as no tags are excluded
    });

    test('empty registry should return empty list', () {
      expect(registry.list(), isEmpty);
    });
  });
}
