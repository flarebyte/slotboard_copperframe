# Architecture decision records

An [architecture
decision](https://cloud.google.com/architecture/architecture-decision-records)
is a software design choice that evaluates:

-   a functional requirement (features).
-   a non-functional requirement (technologies, methodologies, libraries).

The purpose is to understand the reasons behind the current architecture, so
they can be carried-on or re-visited in the future.

## Idea

### Problem Description:

We need a library in Dart to manage a flexible and adaptive UI view for an
app. The UI should consist of a **main panel** and a **side panel** that can
adjust layout based on device size or user preferences. The main panel and
side panel should be composed of dynamic sub-panels (slots) that render
differently based on the app's specific needs and the screen size. The
sub-panels in both panels should accommodate different content types, such as
forms, previews, help, document outlines, and messages. Additionally,
sub-panels can have distinct visual prominence and styles, and new sub-panels
should be easily integratable for different apps.

### Use Cases:

1.  **Responsive Layout**:

    -   On a large screen, the UI displays a two-column layout: the main panel
        on the left and the side panel on the right.
    -   On smaller screens or when the user prefers, the UI displays a
        one-column layout with panels stacked vertically.

2.  **Dynamic Content in Main Panel**:

    -   The main panel contains slots such as:
        -   A sub-panel for editing fields, which displays a form input.
        -   A sub-panel for document preview, showing a rendered preview of a
            document.
        -   Additional sub-panels as needed, such as a search bar or contextual
            tools.

3.  **Dynamic Content in Side Panel**:

    -   The side panel contains slots such as:
        -   A message panel for showing errors, warnings, or info messages.
        -   A document outline panel for easy navigation.
        -   A help panel that provides tips or documentation.
        -   A timeline panel for tracking changes made to the document.
        -   An info panel displaying keyboard shortcuts.
    -   Different apps may add additional panels (e.g., a live chat panel, a
        notification panel).

4.  **Adaptive Rendering**:

    -   Each sub-panel should adapt its rendering based on screen size:
        -   On a large screen, a full panel with title bar and detailed content.
        -   On a small screen, a condensed version like an icon or minimal title.

5.  **Prominent Sub-Panels**:

    -   Some sub-panels, like error messages, may need to stand out visually
        with different colors or styles to ensure they capture user attention.

6.  **Customizable Sub-Panels**:
    -   Different apps may want to customize or add new sub-panels that fit
        into the existing layout. The library should support easy integration
        of these custom sub-panels with consistent rendering behavior and
        styles.

### Edge Cases:

1.  **Screen size transition**:

    -   When the app is resized from large to small, the panels should smoothly
        adjust from two-column to one-column layout, without losing content or
        breaking the visual flow.

2.  **User Preference Conflict**:

    -   If a user prefers one-column view on a large screen, this preference
        should override the default two-column layout.

3.  **Sub-Panel Overlap**:

    -   Handling cases where too many sub-panels are added, leading to
        potential content overflow or screen clutter. The library should either
        handle this gracefully or provide guidance to the app developer.

4.  **Varying Sub-Panel Content**:

    -   Ensuring that sub-panels with minimal content (e.g., a simple icon)
        still render correctly when scaled up to fit a large screen or window.

5.  **Custom Sub-Panels**:
    -   Handling cases where new sub-panels introduced by different apps
        require unique rendering logic, but still need to integrate smoothly
        within the main and side panel layouts.

### Limits:

-   **No Specific Logic for Content**: The library should not define or
    manage the business logic behind the content of each sub-panel (e.g.,
    what the document outline or messages contain).
-   **No Persistence of User Preferences**: The library should not be
    responsible for persisting or managing user preferences (e.g.,
    preferred layout or panel arrangement); it should assume these are
    passed in as settings.
-   **No Handling of App-Specific Features**: The library should focus
    purely on layout and rendering of panels, and not include any
    app-specific features such as managing data, documents, or validation
    logic.
-   **No Animation or Complex Transitions**: While smooth layout changes
    are necessary, the library should avoid handling advanced animations or
    transitions between layouts.

### Examples:

-   **Do not** manage content validation or the logic behind what appears
    in the form panel (e.g., form field validation or data fetching).
-   **Do not** save user settings like "preferred layout" or handle
    multi-user configurations for different preferences across users.
-   **Do not** manage external app data sources or APIs used to populate
    sub-panels like the document preview or message panels.
