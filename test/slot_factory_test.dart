import 'package:slotboard_copperframe/src/slot_factory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CopperframeSlots Factory Tests', () {
    test('infoMessage should create InfoMessageSlot with correct parameters',
        () {
      var slot = CopperframeSlots.infoMessage(
        tags: ['main', 'urgent'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );

      expect(slot, isA<InfoMessageSlot>());
      expect(slot.prominence, 'important');
      expect(slot.size, 'small');
      expect(slot.tags, ['main', 'urgent']);
    });

    test('warnMessage should create WarnMessageSlot with correct parameters',
        () {
      var slot = CopperframeSlots.warnMessage(
        tags: ['urgent'],
      ).setValues(
        prominence: 'very-important',
        size: 'medium',
      );

      expect(slot, isA<WarnMessageSlot>());
      expect(slot.prominence, 'very-important');
      expect(slot.size, 'medium');
      expect(slot.tags, ['urgent']);
    });

    test('errorMessage should create ErrorMessageSlot with correct parameters',
        () {
      var slot = CopperframeSlots.errorMessage(
        tags: ['error'],
      ).setValues(
        prominence: 'critical',
        size: 'large',
      );

      expect(slot, isA<ErrorMessageSlot>());
      expect(slot.prominence, 'critical');
      expect(slot.size, 'large');
      expect(slot.tags, ['error']);
    });

    test('Creating slots with empty tags should work as expected', () {
      var infoSlot = CopperframeSlots.infoMessage(
        tags: [],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );

      var warnSlot = CopperframeSlots.warnMessage(
        tags: [],
      ).setValues(
        prominence: 'very-important',
        size: 'medium',
      );

      expect(infoSlot.tags, isEmpty);
      expect(warnSlot.tags, isEmpty);
    });

    test('Slots should retain class-specific behavior', () {
      var infoSlot = CopperframeSlots.infoMessage(
        tags: ['main'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );

      var errorSlot = CopperframeSlots.errorMessage(
        tags: ['error'],
      ).setValues(
        prominence: 'critical',
        size: 'large',
      );

      expect(
          infoSlot,
          isNot(same(
              errorSlot))); // Different slot types are not the same instance
      expect(infoSlot.runtimeType, InfoMessageSlot);
      expect(errorSlot.runtimeType, ErrorMessageSlot);
    });

    test(
        'PreviewSlot factory should create PreviewSlot with correct parameters',
        () {
      var slot = CopperframeSlots.preview(
        tags: ['preview'],
      ).setValues(
        prominence: 'normal',
        size: 'medium',
      );

      expect(slot, isA<PreviewSlot>());
      expect(slot.prominence, 'normal');
      expect(slot.size, 'medium');
      expect(slot.tags, ['preview']);
    });

    test('history should create HistorySlot with correct parameters', () {
      var slot = CopperframeSlots.history(
        tags: ['main', 'urgent'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );

      expect(slot, isA<HistorySlot>());
      expect(slot.prominence, 'important');
      expect(slot.size, 'small');
      expect(slot.tags, ['main', 'urgent']);
    });
    test('help should create HelpSlot with correct parameters', () {
      var slot = CopperframeSlots.help(
        tags: ['main', 'urgent'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );

      expect(slot, isA<HelpSlot>());
      expect(slot.prominence, 'important');
      expect(slot.size, 'small');
      expect(slot.tags, ['main', 'urgent']);
    });
    test('outline should create OutlineSlot with correct parameters', () {
      var slot = CopperframeSlots.outline(
        tags: ['main', 'urgent'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );

      expect(slot, isA<OutlineSlot>());
      expect(slot.prominence, 'important');
      expect(slot.size, 'small');
      expect(slot.tags, ['main', 'urgent']);
    });
    test('input should create InputSlot with correct parameters', () {
      var slot = CopperframeSlots.input(
        tags: ['main', 'urgent'],
      ).setValues(
        prominence: 'important',
        size: 'small',
      );

      expect(slot, isA<InputSlot>());
      expect(slot.prominence, 'important');
      expect(slot.size, 'small');
      expect(slot.tags, ['main', 'urgent']);
    });
  });
}
