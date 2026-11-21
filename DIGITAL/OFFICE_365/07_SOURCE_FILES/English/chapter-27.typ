#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[PART 3: MICROSOFT POWERPOINT 365 MASTERCLASS · CHAPTER 27]
= Dynamic Object Animation Choreography, Triggers & Enterprise Media

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Slide animation should never be decorative theater; its sole purpose is to control the rate of audience information consumption (gating cognitive focus). Professional animation engineering synchronizes entrance cues, emphasis highlights, audio narration, and interactive click triggers.
]

#v(2pt)

== 27.1 The 4 Animation Archetypes & The Animation Pane

Opening the Animation Pane (`Animations` > `Animation Pane`):
- *Entrance (Green)*: Controls how an element enters the canvas (e.g. *Fade*, *Fly In*, *Zoom*).
- *Emphasis (Yellow)*: Draws attention to an already visible element (e.g. *Pulse*, *Grow/Shrink*, *Color Wave*).
- *Exit (Red)*: Removes an element from the canvas when its narrative phase concludes (e.g. *Fade Out*).
- *Motion Paths (Dotted Lines)*: Translates an object across custom linear, curved, or looped trajectories.

#v(2pt)
#ribbon-specimen(path: "Animations > Advanced Animation > Animation Pane", command: "Timing Choreography & Triggers", shortcut: "Alt + A > C")
#v(2pt)

== 27.2 The 3 Critical Timing Triggers: On Click vs. With Previous vs. After Previous

Mastery of corporate timing separates clumsy presentations from broadcast-quality demonstrations:
- *On Click*: Pauses execution until the presenter physically advances (click, spacebar, or presentation remote). Use this strictly for major discussion milestones where audience dialogue is expected.
- *With Previous*: Executes *simultaneously* with the animation preceding it. Essential for multi-element choreography (e.g. fading in an icon while sliding up its title card).
- *After Previous*: Executes *automatically* the moment the preceding animation completes. Ideal for cascading metric reveals without requiring repetitive clicks.
- *Delay & Duration Tuning*: Set entrance durations between `0.30s` and `0.50s`. Anything slower than `0.75s` feels sluggish and drains executive momentum.

#table(
  columns: (1.2fr, 2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Animation Tool*], [*Technical Function*], [*Production Slide Application*]),
  [Animation Painter], [Copies entire animation stack, timings, and delays to another shape.], [Replicating entrance timing across 6 KPI metric cards in 10 seconds.],
  [Interactive Trigger], [Binds an animation to fire only when a specific onscreen object is clicked.], [Building interactive software simulation popups and FAQ accordions.],
  [Smooth Start / End], [Adds cubic ease-in / ease-out deceleration to motion paths.], [Making flying cards stop with natural physical inertia instead of abrupt stops.],
  [Auto-Reverse], [Causes an emphasis pulse to return automatically to original state.], [Highlighting a critical risk node before returning to normal palette.]
)

#pagebreak()

== 27.3 Media Engineering: Video & Audio Integration

Video and audio must play reliably without codec errors during high-stakes board presentations:
- *Container Standards*: Use MP4 containers with H.264 video compression and AAC audio.
- *Video Tools*: Under `Video Format` and `Playback`:
  - *Trim Video*: Set precise In/Out markers inside PowerPoint without external video editing software.
  - *Fade In / Fade Out*: Apply a 0.5s audio/video fade to prevent abrupt audio blasts.
  - *Poster Frame*: Choose a crisp, branded frame to display before playback starts (prevents black screens).
- *Compress Media*: Run `File` > `Info` > `Compress Media` (`1080p` Full HD). This shrinks 500MB raw smartphone videos down to 25MB while preserving crystal-clear playback.

#v(2pt)

== 27.4 Interactive Software Demonstrations via Bookmark Triggers

PowerPoint allows syncing animation events directly to specific timestamp bookmarks in an embedded video:

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #callout-box("1. ADD VIDEO BOOKMARK", [
      Play the embedded software recording. At the exact second a key feature appears (e.g. `00:14`), click `Add Bookmark` under the Playback tab.
      - Places an amber marker pin directly on the video scrubber bar.
    ])
  ],
  [
    #callout-box("2. BIND CALLOUT TRIGGER", [
      Select an explanatory callout card on the slide. Set its Entrance animation to `Trigger` > `On Bookmark` > `Bookmark 1`.
      - As the video plays, the callout card pops up automatically the moment the scrubber hits `00:14`!
    ])
  ]
)

#pagebreak()

== 27.5 Production Blueprint: Sequential Staggered Card Entrance

Below is the standard Fortune 500 timing choreography for revealing 3 product feature pillars:

#table(
  columns: (1.2fr, 1.5fr, 1.5fr, 1.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 3pt),
  table.header([*Animated Element*], [*Animation Effect*], [*Start Condition*], [*Timing Parameters*]),
  [Pillar 01 (Cloud Core)], [Fade + Fly In (Up)], [Start: On Click], [Duration: `0.40s`, Smooth End: `0.20s`],
  [Pillar 02 (Zero Trust)], [Fade + Fly In (Up)], [Start: After Previous], [Duration: `0.40s`, Delay: `0.10s`],
  [Pillar 03 (AI Copilot)], [Fade + Fly In (Up)], [Start: After Previous], [Duration: `0.40s`, Delay: `0.10s`],
  [Feature Highlight Badge], [Grow / Shrink (105%)], [Start: After Previous], [Duration: `0.30s`, Auto-Reverse: `True`]
)

#v(3pt)

== 27.6 Evaluation Dashboard: Technical MCQs & Review Q&A

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which tool quickly copies animations from one object to multiple other objects?", ans: "Animation Painter.")
    #short-qa(num: 2, q: "What timing trigger allows two animations to play at the exact same instant?", ans: "Start: With Previous.")
    #short-qa(num: 3, q: "What is the recommended duration range for professional entrance animations?", ans: "0.30s to 0.50s.")
    #short-qa(num: 4, q: "How do you prevent a video from showing a blank black rectangle before playing?", ans: "Set a custom Poster Frame.")
  ],
  [
    #mcq(num: 1, q: "Which animation timing setting automatically triggers an effect immediately when the previous effect finishes?", a: "On Click", b: "With Previous", c: "After Previous", d: "On Double Click", ans: "C", expl: "After Previous chains animations sequentially without user intervention.")
    #mcq(num: 2, q: "What video format and codec is globally recommended for seamless PowerPoint 365 playback?", a: ".avi with DivX", b: ".mp4 with H.264 and AAC audio", c: ".wmv legacy", d: ".flv Flash", ans: "B", expl: "H.264 MP4 is the universal hardware-accelerated video standard.")
    #mcq(num: 3, q: "What happens when you compress media via File > Info > Compress Media in PowerPoint?", a: "The audio is muted", b: "PowerPoint transcodes embedded videos to standard 1080p/720p, drastically shrinking presentation file size", c: "The presentation converts to a zip file", d: "Animations are removed", ans: "B", expl: "Media Compression reduces file bloat while maintaining crisp playback resolution.")
  ]
)

#v(2pt)

#spotlight-box("2027 REAL-TIME EMBEDDED WEB RUNTIMES", [
  PowerPoint 365 Enterprise enables embedding live, interactive WebGL dashboards and power apps directly onto slides. Presenters can filter live operational databases without switching browser tabs.
])
