# Figma Design Rules for Cursor AI Integration

This document outlines the design principles and conventions within Figma that Cursor AI should adhere to when generating code. Adhering to these rules ensures consistent and accurate translation of design into functional code.

## 1. Naming Conventions

-   **Layers and Frames:** Use clear, descriptive names for layers, frames, and components. Avoid generic names like "Rectangle 1" or "Group 2".
    -   **Example:** `Header`, `HeroSection`, `ProductCard`, `CallToActionBtn`.
-   **Text Styles:** Name text styles consistently and semantically.
    -   **Example:** `Heading/H1`, `Body/Medium`, `Button/Primary`.
-   **Color Styles:** Use meaningful names for color styles.
    -   **Example:** `Brand/Primary`, `Neutral/Gray500`, `Accent/Success`.

## 2. Component Usage

-   **Main Components:** Always use main components for reusable UI elements. Cursor can then interpret these as distinct, reusable code components.
-   **Variants:** Utilize Figma variants to define different states or configurations of a component (e.g., `Button/Primary/Hover`, `Input/Error`).
-   **Instance Overrides:** Be mindful of instance overrides. While useful for design, excessive overrides might require more specific instructions for Cursor to interpret correctly.

## 3. Layout and Spacing

-   **Auto Layout:** Employ Auto Layout consistently for responsive and predictable layouts. This helps Cursor understand spacing and alignment.
-   **Constraints:** Use constraints appropriately to define how elements resize and reposition within frames.
-   **Spacing Tokens:** If using design tokens for spacing, ensure they are clearly defined and consistently applied in Figma.

## 4. Styling and Assets

-   **Color Styles:** Always use defined color styles rather than local color values for consistency and easier theme management.
-   **Text Styles:** Apply defined text styles for all text elements.
-   **Image Assets:** Clearly name image layers and ensure they are appropriately sized and optimized within Figma.
-   **Design Tokens:** If a design token system is in place, ensure Figma elements are linked to these tokens where applicable.

## 5. Interaction and States

-   **Interactive Components:** For interactive elements (buttons, inputs), define all relevant states (default, hover, pressed, disabled) using variants.
-   **Prototype Links:** If prototypes define specific interactions, Cursor might leverage this information with appropriate prompting.

## 6. General Guidelines

-   **Cleanliness:** Keep Figma files organized and free from unnecessary layers or hidden elements.
-   **Clarity:** Strive for clear and unambiguous designs that minimize potential misinterpretations by the AI.
-   **Iterative Refinement:** Understand that initial code generation might require refinement. Use follow-up prompts in Cursor to address discrepancies or provide more specific instructions.