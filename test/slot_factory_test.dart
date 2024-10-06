import 'package:slotboard_copperframe/src/slot_factory.dart';
import 'package:test/test.dart';

void main() {
  group('CopperframeSlots Factory Tests', () {
    test('infoMessage should create InfoMessageSlot with correct parameters',
        () {
      var slot = CopperframeSlots.infoMessage(
        prominence: 'important',
        size: 'small',
        tags: ['main', 'urgent'],
      );

      expect(slot, isA<InfoMessageSlot>());
      expect(slot.prominence, 'important');
      expect(slot.size, 'small');
      expect(slot.tags, ['main', 'urgent']);
    });

    test('warnMessage should create WarnMessageSlot with correct parameters',
        () {
      var slot = CopperframeSlots.warnMessage(
        prominence: 'very-important',
        size: 'medium',
        tags: ['urgent'],
      );

      expect(slot, isA<WarnMessageSlot>());
      expect(slot.prominence, 'very-important');
      expect(slot.size, 'medium');
      expect(slot.tags, ['urgent']);
    });

    test('errorMessage should create ErrorMessageSlot with correct parameters',
        () {
      var slot = CopperframeSlots.errorMessage(
        prominence: 'critical',
        size: 'large',
        tags: ['error'],
      );

      expect(slot, isA<ErrorMessageSlot>());
      expect(slot.prominence, 'critical');
      expect(slot.size, 'large');
      expect(slot.tags, ['error']);
    });

    test('Creating slots with empty tags should work as expected', () {
      var infoSlot = CopperframeSlots.infoMessage(
        prominence: 'important',
        size: 'small',
        tags: [],
      );

      var warnSlot = CopperframeSlots.warnMessage(
        prominence: 'very-important',
        size: 'medium',
        tags: [],
      );

      expect(infoSlot.tags, isEmpty);
      expect(warnSlot.tags, isEmpty);
    });

    test('Slots should retain class-specific behavior', () {
      var infoSlot = CopperframeSlots.infoMessage(
        prominence: 'important',
        size: 'small',
        tags: ['main'],
      );

      var errorSlot = CopperframeSlots.errorMessage(
        prominence: 'critical',
        size: 'large',
        tags: ['error'],
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
        prominence: 'normal',
        size: 'medium',
        tags: ['preview'],
      );

      expect(slot, isA<PreviewSlot>());
      expect(slot.prominence, 'normal');
      expect(slot.size, 'medium');
      expect(slot.tags, ['preview']);
    });

    // Add tests for other slots like InputSlot, HistorySlot, ShortcutSlot, etc.
  });
}
