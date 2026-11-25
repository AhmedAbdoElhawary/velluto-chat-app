# 02: Components

Reference: `design/Velluto Design System.dc.html` §05. ✅ = already in `VellutoKit`; 🔨 = build it in the app (suggested approach given).

## VBubble ✅
- Padding 14 horizontal, 9 vertical. Text `VType.message`, line height 22.
- Max width 78% of the container. Sent aligns trailing, received aligns leading.
- Sent: `vAccent` fill, `vOnAccent` text. Received: `vReceived` fill, `vTextPrimary` text.
- Corners 20. The tail corner is 6 on the **last bubble of a run** only (`tail: true`).
- Runs: 4pt gap within a run, 12pt between runs or senders.
- Reply quote inside the bubble: a 2pt bar (accent on received, onAccent on sent) + sender name in semibold 13 + one-line preview in 13.
- Reaction: `VReactionPill` overlaid at `.bottomTrailing`, offset about (6, 10), ringed 2pt in `vBackground`.

## VReceiptLine / VReceiptDot ✅
Shown only under the **last outgoing** bubble: "Sending" / "Delivered" / "Read 18:12" in mono 11 secondary, then the 6pt dot. Going from delivered to read fills the dot and pops it (see Motion moment 04).

## VUnreadBadge ✅
20pt tall capsule, minimum width 20, 6pt horizontal padding, 13 semibold. Unread is a pearl fill. Muted is an outline. A mention shows `@`. The count rolls with `VRollingText`.

## VAvatar ✅
Initials in New York at 0.375 × size on `vRaised`. Sizes: 56 (chat list), 40 (conversation header), 28 (group run avatar), 88 (profile/contact info), 112 (call screens). `online` adds a 1.5pt accent ring 4pt outside the avatar. `breathing` animates it (conversation header only).

## Story ring 🔨
`Circle().trim` arcs around the avatar. There is one segment per story with a 7° gap between segments. Unseen segments are 2pt `vAccent`. Seen segments are 1pt `vTextSecondary`. The light sweep (a short `#F5F4F0` arc, 2s travel then 3s rest) appears on the first unseen ring of the Stories tab only. The "My story" avatar has a `+` badge.

## VTypingDots ✅
Three 6pt dots in a 16-radius `vReceived` capsule with 12/10 padding.

## Chat cell 🔨
- 76pt tall row, 16 side padding, 56 avatar, 12 gap.
- Line 1: name `VType.headline` + trailing timestamp mono 12 secondary.
- Line 2: preview `VType.subhead` secondary, 1 line, + trailing badge.
- Group previews prefix the sender ("You: …"). Typing replaces the preview with "typing…".
- Hairline inset 84.
- Swipe actions (`.swipeActions`): trailing Pin · Mute · Archive. Backgrounds are `vRaised`/`vSurface` with pearl icons, never coloured.
- Pressed: background `vSurface`.

## Composer 🔨
- Sits in `.safeAreaInset(edge: .bottom)` on `vBackground` with a top hairline.
- Left: `plus` (attachments). Centre: capsule `TextField(axis: .vertical)` on `vSurface`, placeholder "Message", 1–5 lines. Right: `mic` when empty, which swaps to `arrow.up` in a 32pt pearl circle when there's text (`.symbolEffect(.replace)`).
- Recording state: see Screen 5.3 and Motion 08.

## VButton ✅
52pt tall, radius 14, full width.
- Primary: pearl fill.
- Secondary: `vRaised` fill.
- Outline: 0.5pt hairline stroke with Regular weight text. This style is used for destructive actions and always opens a confirmation.

Pressed state scales to 0.97 on the standard spring. Disabled state uses a `vRaised` fill with secondary text. When it enables, it crossfades to pearl (sign-in, 9+ digits).

## Navigation bar & tab bar 🔨
- Large title in `VType.largeTitle`, with the ambient glow behind it on Chats, Calls and Settings. Bar buttons are text ("Edit") or icons (`square.and.pencil`) in `vTextPrimary`.
- Tab bar: 4 tabs, icons 24 + caption 10. Active is a pearl filled symbol and label. Inactive is secondary. The unread total shows as a `VUnreadBadge` on Chats. Background `vBackground` with a top hairline. Use `TabView` and tint the active colour via `.tint(Color.vAccent)`.

## Controls 🔨
- **Toggle**: `VToggleStyle` ✅. On is a pearl track with an obsidian knob. Off is a hairline track with a grey knob.
- **Segmented** ("All · Unread · Groups", "All · Missed"): `Picker(.segmented)` restyled as a custom capsule. Selected is pearl with obsidian text, and the track is `vSurface`. The indicator slides on `.spring(0.4, 0.86)`.
- **Search field**: 36pt, radius 12, `vSurface`, `magnifyingglass` secondary, placeholder "Search".
- **Grouped list**: `vSurface` card, radius 14, rows 44pt min, 48 divider inset, icon tiles 28pt `vRaised` radius 7, chevron secondary.

## Sheets 🔨
`.sheet` with `.presentationBackground(Color.vSurface)`, `.presentationCornerRadius(28)` and a 36 × 5 grabber in the hairline colour. Detents vary per screen (see docs/04).

## Feedback states 🔨
- **Offline banner**: `vSurface` capsule under the nav bar with `wifi.slash` and "Waiting for network". It slides in from the top with a fade. The ambient glow pauses.
- **Skeleton**: `.redacted(reason: .placeholder)` on real rows. One opacity pulse 0.6↔1 over 1.6s. No shimmer.
- **Toast**: `vRaised` capsule at the bottom. It auto-dismisses after 5s and fires `VHaptic.error`.
- **Empty state**: `ContentUnavailableView` with a custom floating glyph group, title in `VType.display`, body footnote and a primary button.
