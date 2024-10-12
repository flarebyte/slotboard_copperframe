# slotboard\_copperframe

![Experimental](https://img.shields.io/badge/status-experimental-blue)

> Slot it sort it sit back and relax

Board with slots to produce a view that is both compact and detailed

![Hero image for slotboard\_copperframe](doc/slotboard_copperframe.jpeg)

Highlights:

-   The slot can be described by a title, description, prominence or status
-   Every time the slot is modified a notification is sent
-   A registry allow to modify multiple slots at once

A few examples:

Create a new slot class:

```dart
class InfoMessageSlot extends CopperframeSlotBase { InfoMessageSlot({
required super.tags,});}
```

Instanciate a slot:

```dart
var slot = InfoMessageSlot( tags: ['main'],);
```

Set the prominence for a slot:

```dart
slot.prominence = 'important';
```

Set the size for a slot:

```dart
slot.size = 'small';
```

Set the status for a slot:

```dart
slot.status = 'ok';
```

Set the secondary status for a slot:

```dart
slot.secondaryStatus = '5+';
```

Set the title for a slot:

```dart
slot.title = 'Hello World!';
```

Set the description for a slot:

```dart
slot.description = 'This is a description';
```

Create a registry for slots:

```dart
final registry = CopperframeSlotRegistry();
```

Register a slot in the registry:

```dart
registry.registerSlot(slot);
```

Changes the providence for all main slots:

```dart
registry.setProminenceWhereTags('critical', tags: ['main']);
```

## Documentation and links

-   [Code Maintenance :wrench:](MAINTENANCE.md)
-   [Code Of Conduct](CODE_OF_CONDUCT.md)
-   [Contributing :busts\_in\_silhouette: :construction:](CONTRIBUTING.md)
-   [Architectural Decision Records :memo:](DECISIONS.md)
-   [Contributors
    :busts\_in\_silhouette:](https://github.com/flarebyte/slotboard_copperframe/graphs/contributors)
-   [Dependencies](https://github.com/flarebyte/slotboard_copperframe/network/dependencies)
-   [Glossary
    :book:](https://github.com/flarebyte/overview/blob/main/GLOSSARY.md)
-   [Software engineering principles
    :gem:](https://github.com/flarebyte/overview/blob/main/PRINCIPLES.md)
-   [Overview of Flarebyte.com ecosystem
    :factory:](https://github.com/flarebyte/overview)
-   [Dart dependencies](DEPENDENCIES.md)
-   [Usage](USAGE.md)
-   [Example](example/example.dart)

## Related

-   [form\_validator](https://pub.dev/packages/form_validator)
