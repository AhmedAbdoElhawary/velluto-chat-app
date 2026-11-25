# 04: Screens

All screens are drawn at **393 × 852 pt** (iPhone 15/16 Pro) in Obsidian unless noted. IDs match the numbered labels in `design/Velluto Screens 1–3.dc.html`. Each screen there carries its own SwiftUI notes. Copy below is verbatim from the designs.

Common chrome: status bar, then a large title or a custom header, then content on `vBackground` with 16pt side margins. The 4-tab bar (Chats · Stories · Calls · Settings) appears on the tab roots.

---
## 01 Onboarding (`Screens 1`)
**1.1 Splash.** Centred V monogram draws on (Motion 01) and dissolves into the chat list. Behind it, a faint preview conversation: "Dinner on Friday?" / "Only if it's Volta." / "Read".
**1.2 Welcome 1 of 3.** "Skip" top-right (secondary). Illustration: a stacked conversation. Headline `VType.display`: "Conversations, / kept close." Body subhead secondary: "Messages, voice and calls with the people who matter, in one quiet place." Capsule page indicator (active is a 20pt pearl capsule, inactive are 6pt grey dots). Primary button "Continue". Paging is `TabView(.page(indexDisplayMode: .never))` with a custom indicator; the ambient glow is the only mover.
**1.3 Welcome 2 of 3.** Story rings illustration (LR, EM, GF; centre ring gets the light sweep). "Moments that / fade by morning." / "Share a photo or a line of text with close friends. Stories disappear after 24 hours." / "Continue".
**1.4 Welcome 3 of 3.** Lock illustration. "Private, / without effort." / "Messages and calls are end-to-end encrypted. Only you and the people you talk to can read them." Button crossfades to "Get started".
**1.5 Phone sign-in.** "Your number" (display) / "We'll text a six-digit code to confirm it's you." Grouped field card: row 1 country "Italy" + chevron, row 2 "+39" | number "347 218 90". `.keyboardType(.phonePad)`. "Continue" is disabled (raised) until 9+ digits, then crossfades to pearl.
**1.6 Verification code.** "Enter the code" / "Sent to +39 347 218 9054." + "Edit" link. Six 48pt digit boxes (`vSurface`, radius 12; the filled one has a pearl outline). `.textContentType(.oneTimeCode)`. "Resend code in 0:24" counts down with rolling digits. Wrong code: the row shakes + `VHaptic.error`.
**1.7 Profile setup.** "Your profile" / "Your name and photo are visible to your contacts." 112pt avatar with a camera badge (`PhotosPicker`, circle clip). Fields: name "Sofia Conti", "About (optional)" with footnote "Up to 25 characters." "Done" fires `VHaptic.success`, then the launch transition.

## 02 Chats
**2.1 Chat list.** Nav: "Edit" leading, `square.and.pencil` trailing. Large title "Chats" with the ambient glow. Search field. Stories rail (horizontal `ScrollView`: "Your story" with +, then ringed avatars). "Archived" row with count 6. Chat cells (see Components) with pinned/muted/unread/typing variants. Tab bar with Chats badge 5. `.swipeActions` Pin · Mute · Archive.
**2.2 Archived.** Inline title "Archived", back "Chats", "Edit". Footer note: "Archived chats stay here when new messages arrive. Mentions still notify you." Muted badges are outlined.
**2.3 New chat (sheet).** `.sheet` large detent, `vSurface`, radius 28. "Cancel" · "New Chat". Search "Name or number". Action rows: New group, New contact, Scan code (icons in raised tiles). Section "ON VELLUTO" with alphabetical sections + an index scrubber on the right edge.
**2.4 New group · members.** Pushed inside the sheet's `NavigationStack`. "Add members" with "3 / 256" and "Next". Selected chips (GF Giulia, LR Luca, NV Nico) insert with scale+fade. Multi-select list with round checks that bounce + selection haptic.

## 03 Conversation
**3.1 Conversation 1:1.** Custom header: back chevron with unread count "4", 40pt avatar EM with the breathing online ring, name "Elena Marchetti" (`VType.headerName`) + "online", trailing `video` and `phone`. Day separators "YESTERDAY" / "TODAY" (caption, secondary). Messages: "The Rothko catalogue finally arrived." / "Heavier than I expected. Like a tombstone, but nicer." / sent "Ha. Keep it on the table for Sunday." / sent "Shall we go Thursday instead?" + "Read 18:12" / "New" divider / "Thursday works." / received bubble with a reply quote (You: "Shall we go Thursday instead?") "I'll book Volta for eight. Wear the grey coat." Typing dots. Composer at the bottom. `ScrollView` + `.defaultScrollAnchor(.bottom)`.
**3.2 Long-press · reactions.** Background blurred 6 + dimmed. The lifted bubble ("I'll book Volta for eight. Wear the grey coat.") at 1.03 with a shadow. Reaction bar above it (capsule `vRaised`): heart, hand.thumbsup, face.smiling, exclamationmark.2, questionmark, flame. Menu below (`vRaised`, radius 14): Reply, Copy, Forward, Star, Delete, each with a trailing icon. Delete is the same colour as the others.
**3.3 Swipe to reply.** The bubble is dragged right with the reply icon revealed at the left. The composer shows a reply preview (bar + "Elena Marchetti" + "Thursday works.") and placeholder "Reply…" with the keyboard up. Motion spec values win: offset = 80·(1 − 1/(dx/160 + 1)), threshold 56.

## 04 Group chat
**4.1 Group conversation.** Header SN "Studio Nero" / "Giulia, Luca, Nico, Marta, You". Sender names sit above the first bubble of a run in semibold 13 **secondary grey (never per-person hues)**. A 28pt avatar shows only on the last bubble of a run. Messages: Giulia "Client moved the review to Friday morning." / Luca "Then the boards need to be printed Thursday." / "@Sofia can you take the typography pass?" (mention semibold pearl) / sent "On it. I'll share by tonight." + "Read by 3" / Nico typing.
**4.2 Group info.** "Edit" trailing. 88pt avatar SN, "Studio Nero" display, "Group · 5 members". Action buttons row (Audio · Video · Search · Mute), 4 equal `vSurface` tiles radius 14. Description "Brand and print work for the autumn collection. Boards go out Thursdays." / "Created by Giulia · 12 Mar". Row "Media, links and docs" 214. Section "5 MEMBERS" with "Add members" + member rows. Outline "Leave group" button → `.confirmationDialog`.

## 05 Rich media (`Screens 2`)
**5.1 Photo, video, link, file, voice.** Header LR "Luca Rinaldi" · "last seen 14:02". Video bubble with a 0:14 duration pill. Photo with caption "From the site visit". Link card: image, "archdaily.com", "A courtyard house in Fiesole". Photo "This is the stair I meant". File card: doc icon, "Fiesole_sections_v3.pdf", "8.1 MB · PDF". Voice notes 0:17 and 0:09: play button + waveform (played bars pearl, rest grey). "Delivered". Media uses bubble radii; link previews use `LPMetadataProvider`; files open in QuickLook.
**5.2 Full-screen viewer.** `.fullScreenCover` zooming from the bubble. Top: "You" / "Today 14:06 · 1 of 2". Caption bottom "From the site visit". Pinch zoom; drag down dismisses (background fades with the offset). Tap toggles the chrome and hides the status bar.
**5.3 Voice note · recording.** Draft context "Can you explain the stair detail? Easier by voice." The composer becomes the recorder: red-free record dot + timer "0:07" (mono), live waveform, "‹ Slide to cancel". The mic grows to 64pt pearl with a level halo, and a lock affordance sits above it. See Motion 08.
**5.4 Attachment sheet.** Sheet with medium/large detents. Recents grid (3 columns, PHAsset) with a selection badge "1". Tile row: Gallery · File · Location · Contact. Primary button "Send 1 photo" (count rolls).

## 06 Contact info
**6.1 Contact info.** "Edit". 88pt avatar EM, "Elena Marchetti" display, "+39 335 704 1182 · online". Actions row: Message · Audio · Video · Search. Groups: About "Quietly busy" · "Shared media" 86 › with a 4-column thumbnail strip (`LazyVGrid`) · Mute "Off" (→ dialog: 8 hours · 1 week · Always) · Disappearing messages "Off" · Encryption. Outline button "Block Elena" + confirm.

## 07 Stories
**7.1 Stories tab.** Large title "Stories" (**no glow**; the sweep is this tab's mover). "My story" row (SC + `+`) "Add a photo or a line of text". Section "RECENT" with ringed rows, then "Viewed" (grey rings). The light sweep runs on the first unseen ring only.
**7.2 Story viewer.** Full-screen photo. Top: segmented progress bars (2pt, pearl fill on hairline), EM avatar "Elena Marchetti" "2h", close. Caption in `VType.storyCaption` "Last light over the Arno". Bottom: capsule "Reply to Elena" + heart. Tap left/right to skip, hold to pause, swipe down to close. Opens by zooming from the ring.
**7.3 Create story.** Camera preview (`AVCaptureSession`) / library (`PhotosPicker`). Text overlay "Last light over the Arno", draggable and pinchable. Style switcher Serif · Sans · Mono (selected is pearl). Bottom: audience "Close friends" | "My story" primary.
**7.4 Viewers list.** Swipe up on your own story: it scales to 0.5 at the top and a 50% sheet appears with "24 views" (rolling) and viewer rows.

## 08 Calls
**8.1 Call history.** "Edit", large title "Calls" + glow. Segmented "All · Missed". Rows: avatar, name, direction glyph (`phone.arrow.up.right` / `phone.arrow.down.left`) + "Outgoing/Incoming/Missed" + time, trailing `info.circle`. **Missed = semibold name + "Missed" label, no red.** Swipe to delete.
**8.2 Incoming call.** "Velluto audio" caption. 112pt avatar EM with 3 ripple rings. "Elena Marchetti" display. Small actions: "Remind me" · "Message". Big round buttons, 72pt: "Decline" (`vRaised`, `phone.down`) and "Accept" (pearl, `phone`). The system lock-screen version is CallKit.
**8.3 Outgoing · ringing.** "Luca Rinaldi" / "Ringing…" (the ellipsis pulses). Controls grid: Speaker · Video · Muted (toggled = pearl fill, inverted icon) · End (`vRaised` with pearl `phone.down`, never red).
**8.4 Active voice call.** "Elena Marchetti" / timer "04:27" (`VType.timer`, rolling). Ring follows the remote voice level. "End-to-end encrypted" with a lock glyph. Controls: Speaker · Video · Mute · End.
**8.5 Active video call.** Remote video full-bleed (WebRTC `RTCMTLVideoView`). Top: name + "12:08". PiP self-view 100 × 150, radius 16, draggable, snaps to the nearest corner. Chrome auto-hides after 4s; a tap reveals it.

## 09 Settings (`Screens 3`)
**9.1 Settings.** Large title + glow. Profile card: SC 56pt "Sofia Conti" / "Designing, slowly" + qrcode. Grouped lists (`vSurface`, radius 14) with 28pt raised icon tiles (never tinted): Account, Privacy, Chats, Notifications, Appearance, Storage, Help, Invite.
**9.2 Privacy.** Rows: Last seen, Profile photo, About (value + chevron), Read receipts (toggle), App lock (Face ID via `LocalAuthentication`), Blocked (count). Footers in footnote secondary.
**9.3 Notifications.** Message/group notifications, show previews, tone picker (push), in-app sounds, and a **Haptics** toggle that gates every `VHaptic`.
**9.4 Appearance.** "THEME": three preview cards Obsidian · Pearl · Automatic (selected = pearl outline + check). Switching crossfades the window over 0.35s (`.preferredColorScheme`). "TEXT SIZE": slider between small and large "A" with a live sample bubble "This is how messages will look." "APP ICON": Obsidian · Pearl · Graphite (`setAlternateIconName`; images in `assets/AppIcon`). Footer: "Motion follows Reduce Motion in iOS Settings → Accessibility."
**9.5 Storage.** "4.2 GB" (display) "used by Velluto". Stacked bar (Swift Charts `BarMark`, 4 greys + pearl) grows on appear. Legend: Photos · 1.9 GB, Videos · 1.0 GB, Files · 0.5 GB, Other · 0.8 GB. "LARGEST CHATS" rows. "AUTO-DOWNLOAD": Photos "Wi-Fi and cellular", Videos "Wi-Fi". Outline button "Clear cache · 380 MB".

## 10 States
**10.1 Empty · no chats.** Floating glyph group (replaces the glow). "No conversations yet" / "Start a chat with someone in your contacts, or invite them to Velluto." / "Start a chat".
**10.2 Empty · no calls.** Same float on a phone glyph group. "No calls yet" / "Voice and video calls you make or receive will appear here." / "Call a contact".
**10.3 Loading skeleton.** Real chat-cell layout redacted (`vRaised`/`vSurface` bars), one soft pulse, no shimmer.
**10.4 Offline banner.** "Waiting for network" / "Messages will send when you're back online." Pending messages show the clock receipt; the glow pauses. `NWPathMonitor`.
**10.5 Error · failed send.** GF "Giulia Ferri" "last seen today". Received "Send me the final logo files when you can?" / sent "Here they are, all formats." at 55% opacity + outlined `!!` badge + "Not delivered · Tap to retry". Toast: "Couldn't upload Logo_Final.zip. The file is larger than 2 GB." + "OK".

## 11 Pearl · light theme
The same views with the light colour sets; nothing is redesigned.
**11.1 Chat list · Pearl.** The glow is a tonal pearl `#E8E2D6` radial on `#F5F4F0`.
**11.2 Conversation · Pearl.** Sent bubbles are obsidian with pearl text, and the receipt dot inverts to obsidian. The send glint is `#F5F4F0` at 25%.
**11.3 Settings · Pearl.** `#ECE9E2` cards on `#F5F4F0`, tiles `#E3DDD0`.
