# 01: Foundations

Reference: `design/Velluto Design System.dc.html`. Implemented in `starter/VellutoKit/Sources/Velluto/Tokens.swift` and `Typography.swift`, and available as an asset catalog in `assets/Colors.xcassets`.

## Colour: Obsidian & Pearl
Obsidian (dark) is the hero theme. Pearl (light) is the full inverse. Every role resolves automatically per `colorScheme`.

| Role (Swift) | Obsidian (dark) | Pearl (light) | Used for |
|---|---|---|---|
| `Color.vBackground` | `#0A0A0A` | `#F5F4F0` | Screen background |
| `Color.vSurface` | `#141414` | `#ECE9E2` | Search field, composer, sheets, grouped list cards |
| `Color.vRaised` | `#1E1E1E` | `#E3DDD0` | Avatars, pills, secondary buttons, settings icon tiles |
| `Color.vReceived` | `#1E1E1E` | `#E3DDD0` | Incoming bubble |
| `Color.vHairline` | `#262626` | `#DDD9D0` | 0.5pt dividers and outlines |
| `Color.vAccent` (Pearl) | `#E8E2D6` | `#0A0A0A` | Sent bubble, primary button, active tab/icon, unread badge, story ring, online ring |
| `Color.vOnAccent` | `#0A0A0A` | `#F5F4F0` | Text/icons on accent |
| `Color.vTextPrimary` | `#F5F4F0` | `#0A0A0A` | Primary text |
| `Color.vTextSecondary` | `#8A8A85` | `#6E6D68` | Timestamps, previews, inactive icons, muted badges |
| `Color.vGlow` | `#E8E2D6` | `#E8E2D6` | Ambient radial glow (the only gradient) |

Rules:
- No other hues anywhere, including errors, missed calls and destructive actions.
- No `#FFFFFF` or `#000000`.
- **The one gradient** is the ambient pearl radial glow behind large titles: dark opacity 0.14 (ceiling 0.16), light 0.9 (open decision).
- Story light sweep and send glint use `#F5F4F0` (25% opacity for the glint in Pearl).

### Status, without colour
| State | Treatment |
|---|---|
| Sending | Clock glyph + "Sending" in mono 11 secondary |
| Delivered | Outlined 6pt dot (1pt accent stroke) + "Delivered" |
| Read | Filled 6pt accent dot + "Read 21:04" |
| Unread | Pearl capsule badge, `vOnAccent` 13 semibold count |
| Muted | Outlined grey capsule badge (1pt `vTextSecondary`), no fill. `bell.slash` glyph after the name |
| Pinned | `pin` glyph in secondary grey |
| Typing | "typing…" in the preview line; `VTypingDots` in the conversation |
| Online | 1.5pt accent ring around the avatar; it breathes only in the conversation header |
| Missed call | Semibold name + "Missed" label. No red |
| Failed send | Bubble at 55% opacity + outlined `!!` badge + "Not delivered · Tap to retry" |
| Mention | `@` glyph inside the unread badge; mention runs are semibold pearl in the bubble |
| New divider | Hairline + "New" caption, centred |

## Typography
All system fonts, nothing to bundle (see `fonts/README.md`). Serif = **New York**, sans = **SF Pro**, mono = **SF Mono**.

| Token | Font | Size / line height | Weight | Tracking | Use |
|---|---|---|---|---|---|
| `VType.largeTitle` | New York | 34 / 41 | Medium | −0.4 | "Chats", "Calls", "Settings" titles |
| `VType.display` | New York | 28 / 34 | Regular | −0.3 | Onboarding headlines, profile names |
| `VType.headerName` | New York | 17 | Semibold | 0 | Conversation header name |
| `VType.storyCaption` | New York Italic | 22 / 28 | Regular | 0 | Story text overlay |
| `VType.headline` | SF Pro | 17 / 22 | Semibold | 0 | Chat cell names, row titles |
| `VType.message` | SF Pro | 16 / 22 | Regular | 0 | Bubble text |
| `VType.subhead` | SF Pro | 15 / 20 | Regular | 0 | Previews, secondary rows |
| `VType.footnote` | SF Pro | 13 / 18 | Regular | 0 | Helper text, section footers |
| `VType.caption` | SF Pro | 11 / 13 | Regular | +0.3 | Section headers (UPPERCASE), day separators |
| `VType.button` | SF Pro | 17 | Semibold | 0 | Buttons (outline buttons use Regular) |
| `VType.timestamp` | SF Mono | 12 | Regular | 0 | Times in cells and receipts (11 in receipts) |
| `VType.timer` | SF Mono | 17 | Regular | +1 | Call and recording timers |

All numbers use tabular figures (`.monospacedDigit()`). Use `relativeTo:` / Dynamic Type so text scales.

## Space: 8pt grid
| Token | pt | Use |
|---|---|---|
| `VSpace.xs` | 4 | Gap between stacked bubbles in a run |
| `VSpace.s` | 8 | Inline gaps, icon-to-label |
| `VSpace.m` | 16 | Screen side margin |
| `VSpace.l` | 24 | Separation between groups |
| `VSpace.xl` | 32 | Section separation |
| `VSpace.xxl` | 48 | Hero breathing room (onboarding) |
| `VSpace.listDividerInset` | 84 | Chat list hairline left inset (16 + 56 avatar + 12) |

Grouped settings rows use a 48pt divider inset.

## Shape: continuous corners
| Token | Radius | Use |
|---|---|---|
| `VRadius.bubble` | 20 | Bubbles |
| `VRadius.bubbleTail` | 6 | Tail corner: bottom-trailing on sent, bottom-leading on received, last bubble of a run only |
| `VRadius.card` | 16 | Media, link cards, typing bubble |
| `VRadius.button` | 14 | Buttons (52pt tall) |
| `VRadius.group` | 14 | Grouped list cards |
| `VRadius.field` | 12 | Text fields, search |
| `VRadius.segmented` | 10 | Segmented control |
| `VRadius.sheet` | 28 | Sheets (`.presentationCornerRadius(28)`) |
| Capsule | — | Badges, pills, chips, composer field |

Hairlines are 0.5pt. Shadows are used only on the lifted bubble during long-press (soft, black 40%, y 8, radius 24).

## Iconography
- **SF Symbols** at 22pt, regular weight, `.symbolRenderingMode(.monochrome)`.
- Active = `vAccent`, rest = `vTextSecondary`. Filled variants (`.fill`) mark active tab or selected state.
- State changes use `.contentTransition(.symbolEffect(.replace))`. Discrete events (reply threshold, trash on cancel) use `.symbolEffect(.bounce)`.
- Tab bar: `bubble.left.and.bubble.right` (Chats), `circle.dashed` (Stories), `phone` (Calls), `gearshape` (Settings).
- The full list of the 78 symbols used is in `assets/README.md`.
