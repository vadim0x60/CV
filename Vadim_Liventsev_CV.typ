#import "@preview/cades:0.3.1": qr-code

#let ink = rgb("#212121")
#let muted = rgb("#62676d")
#let faint = rgb("#e0e0e0")
#let paper = rgb("#fafafa")
#let accent = rgb("#1565c0")
#let accent-soft = rgb("#e9f2fc")
#let private-bg = rgb("#f0f1f2")

#let qr = qr-code(
  "https://vadim.me",
  width: 11mm,
  height: 11mm,
)

#let footer = [
  #line(length: 100%, stroke: .25mm + faint)
  #v(2.6mm)
  #grid(
    columns: (1fr, auto),
    column-gutter: 6mm,
    align: (left + horizon, right + horizon),
    [
      #grid(
        columns: (11mm, auto),
        column-gutter: 3mm,
        align: center,
        qr,
        [
          #text(size: 7pt, weight: 700, fill: ink)[vadim.me]
        ],
      )
    ],
    [
      #text(size: 7pt, fill: muted)[Numbered references and links on page 3.]
    ],
  )
]

#set document(
  title: "Research, Development, Teaching and Yapping",
  author: "Vadim Liventsev",
)
#set page(
  paper: "a4",
  margin: (top: 12mm, right: 13mm, bottom: 21mm, left: 13mm),
  footer-descent: 7.5mm,
  fill: paper,
  footer: footer,
)
#set text(
  font: ("Helvetica Neue", "Arial"),
  size: 10pt,
  fill: ink,
  lang: "en",
)
#set par(leading: .38em, spacing: 0pt)
#show link: set text(fill: accent)

#let nav-label(body) = text(
  size: 7.4pt,
  weight: 700,
  tracking: .13em,
  fill: muted,
  body,
)

#let section-title(body) = text(
  size: 10.5pt,
  weight: 760,
  tracking: .11em,
  fill: black,
  body,
)

#let contact(marker, label, url: none, citation-key: none) = box[
  #text(size: 7.8pt, weight: 800, fill: accent)[#marker]
  #h(.35em)
  #if url == none {
    text(size: 7.8pt, weight: 550, fill: muted, label)
  } else {
    link(url)[
      #text(size: 7.8pt, weight: 550, fill: accent, label)
    ]
    if citation-key != none {
      h(.35em)
      text(size: 6.75pt, weight: 600, fill: muted)[#cite(citation-key)]
    }
  }
]

#let artifact(label, citation-key: none, url: none) = {
  let external = url != none
  let badge = box(
    inset: (x: 1.65mm, y: .8mm),
    radius: 99pt,
    fill: if external { accent-soft } else { private-bg },
    stroke: .22mm + if external { rgb("#b9d3ef") } else { rgb("#d7dadd") },
    text(
      size: 6.75pt,
      weight: 700,
      tracking: .01em,
      fill: if external { rgb("#0f579f") } else { rgb("#6b7075") },
      label,
    ),
  )
  box[
    #if external { link(url, badge) } else { badge }
    #if citation-key != none {
      h(.55mm)
      text(size: 6.75pt, weight: 600, fill: muted)[#cite(citation-key)]
    }
  ]
}

#let project(body) = grid(
  columns: (1fr,),
  align: top,
  text(size: 8.25pt, fill: rgb("#282c30"), body),
)

#let tenure(years, affiliation) = [
  #text(size: 7.35pt, weight: 760, tracking: .035em, fill: accent)[#years]\
  #v(.55mm)
  #text(size: 8.4pt, weight: 720, fill: black)[#affiliation]
]

#v(4mm)
#grid(
  columns: (1fr, 77mm),
  column-gutter: 10mm,
  align: (left + bottom, right + bottom),
  [
    #text(size: 27pt, weight: 700, tracking: -.035em, fill: black)[Vadim Liventsev]
    #v(1.7mm)
    #text(size: 10.3pt, weight: 650, fill: accent)[Machine Learning Scientist & Engineer]
  ]
)

#v(3.4mm)
#contact([], [London, UK])
#h(4mm)
#contact([\@], [hi\@vadim.me], url: "mailto:agi@vadim.me", citation-key: <email>)
#h(4mm)
#contact([↗], [vadim.me], url: "https://vadim.me", citation-key: <website>)
#h(4mm)
#contact([⌘], [github.com/vadim0x60], url: "https://github.com/vadim0x60", citation-key: <github-profile>)
#h(4mm)
#contact([§], [Google Scholar], url: "https://scholar.google.com/citations?user=tpB0Uw8AAAAJ", citation-key: <google-scholar>)

#v(4.2mm)
#line(length: 100%, stroke: .55mm + ink)

// Selected work
#v(4mm)
#grid(
  columns: (1fr, auto),
  align: (left + bottom, right + bottom),
  section-title[Research and Development],
)

#v(2.5mm)
#line(length: 100%, stroke: .25mm + faint)
#grid(
  columns: (36mm, 1fr, 49mm),
  column-gutter: 4mm,
  inset: (y: 1.7mm),
  text(size: 6.8pt, weight: 750, tracking: .11em, fill: rgb("#70757a"))[WHEN / WHERE],
  text(size: 6.8pt, weight: 750, tracking: .11em, fill: rgb("#70757a"))[WHAT I BUILT],
  text(size: 6.8pt, weight: 750, tracking: .11em, fill: rgb("#70757a"))[PUBLIC ARTIFACTS],
)
#line(length: 100%, stroke: .25mm + faint)

#grid(
  columns: (36mm, 1fr, 49mm),
  rows: 16.5mm,
  column-gutter: 4mm,
  align: (left + horizon, left + horizon, left + horizon),

  // Ideatura
  tenure([2025—2026], [Ideatura]),
  project([An LLM coding harness for manipulating 3D models.]),
  [#artifact([ideatura.ai], citation-key: <ideatura>, url: "https://ideatura.ai")],

  // Philips Research — spans two projects
  grid.cell(rowspan: 2, tenure([2024—2025], [Philips Research])),
  project([A medical-device support ticket classifier identifying common defect types.]),
  [],
  project([A retrieval-based slide-deck generator for employee training.]),
  [],

  // TU/e × Philips Research — spans four projects
  grid.cell(rowspan: 4, tenure([2019—2024], [TU/e × Philips Research])),
  project([Multi-agent coding frameworks combining LLMs with genetic-programming principles.]),
  [
    #artifact([SEIDR paper], citation-key: <grishina2025seidr>, url: "https://doi.org/10.1145/3719351")
    #h(1.1mm)
    #artifact([Code], citation-key: <seidr-code>, url: "https://github.com/vadim0x60/seidr")
  ],
  project([Structural language models for source code.]),
  [
    #artifact([Tree VAE], citation-key: <liventsev2025tree>, url: "https://doi.org/10.1109/ACCESS.2025.3532522")
    #h(1.1mm)
    #artifact([Code], citation-key: <tree-vae-code>, url: "https://github.com/vadim0x60/autoencoderopt")
  ],
  project([Reinforcement-learning environments for healthcare, spanning vision and structured data.]),
  [
    #artifact([Paper], citation-key: <liventsev2021simulators>, url: "https://doi.org/10.3389/frai.2021.798659")
    #h(1.1mm)
    #artifact([HeartPole], citation-key: <heartpole-code>, url: "https://github.com/vadim0x60/heartpole")
    #h(1.1mm)
    #artifact([Auto-ALS], citation-key: <auto-als-code>, url: "https://github.com/vadim0x60/auto-als")
  ],
  project([Reinforcement learning from code execution feedback.]),
  [
    #artifact([BF++ paper], citation-key: <liventsev2021bfpp>, url: "https://arxiv.org/abs/2101.09571")
    #h(1.1mm)
    #artifact([Cibi code], citation-key: <cibi-code>, url: "https://github.com/vadim0x60/cibi")
  ],

  // RedKangaroo
  tenure([2019], [RedKangaroo]),
  project([A clinical-data exchange platform for syncing health data between providers.]),
  [],

  // Skoltech × Philips Research
  tenure([2017—2019], [Skoltech × Philips Research]),
  project([A system for mining tabular data from clinical notes.]),
  [
    #artifact([Deep Text Prior], citation-key: <liventsev2019deep>, url: "https://doi.org/10.1007/978-3-030-30493-5_26")
    #h(1.1mm)
    #artifact([Active learning], citation-key: <shelmanov2019active>, url: "https://doi.org/10.1109/BIBM47256.2019.8983157")
  ],

  // BotEngine
  tenure([2017], [BotEngine]),
  project([A web app for building chatbots with rules and flowcharts.]),
  [],

  // HSE × ISPRAS
  tenure([2013—2017], [HSE × ISPRAS]),
  project([A language-agnostic code completion system.]),
  [],

  // LIT
  tenure([2009—2013], [LIT]),
  project([Swarm robotics algorithms for exploring a location.]),
  [],

  // Row separators: full-width lines mark group boundaries; within a
  // merged affiliation the line skips the left column so the cell reads
  // as a single span.
  grid.hline(y: 1, stroke: .2mm + faint),
  grid.hline(y: 2, start: 1, end: 3, stroke: .2mm + faint),
  grid.hline(y: 3, stroke: .2mm + faint),
  grid.hline(y: 4, start: 1, end: 3, stroke: .2mm + faint),
  grid.hline(y: 5, start: 1, end: 3, stroke: .2mm + faint),
  grid.hline(y: 6, start: 1, end: 3, stroke: .2mm + faint),
  grid.hline(y: 7, stroke: .2mm + faint),
  grid.hline(y: 8, stroke: .2mm + faint),
  grid.hline(y: 9, stroke: .2mm + faint),
  grid.hline(y: 10, stroke: .2mm + faint),
  grid.hline(y: 11, stroke: .2mm + faint),
  grid.hline(y: 12, stroke: .2mm + faint),
)

// Teaching, courses, talks, and community work
#pagebreak()
#section-title[Teaching and Yapping]
#v(2.5mm)
#line(length: 100%, stroke: .25mm + faint)
#grid(
  columns: (36mm, 38mm, 1fr),
  column-gutter: 4mm,
  inset: (y: 1.7mm),
  text(size: 6.8pt, weight: 750, tracking: .11em, fill: rgb("#70757a"))[WHEN / WHERE],
  text(size: 6.8pt, weight: 750, tracking: .11em, fill: rgb("#70757a"))[FORMAT],
  text(size: 6.8pt, weight: 750, tracking: .11em, fill: rgb("#70757a"))[COURSE, TALK, OR SERIES],
)
#line(length: 100%, stroke: .25mm + faint)

#grid(
  columns: (36mm, 38mm, 1fr),
  rows: 15mm,
  column-gutter: 4mm,
  align: (left + horizon, left + horizon, left + horizon),

  tenure([2018—2019], [Skoltech]),
  project([Course author and instructor]),
  project([Functional Programming with Clojure]),

  tenure([2019], [Skoltech]),
  project([Course author and instructor]),
  project([Introduction to Artificial Humour]),

  tenure([2019—2021], [Netology]),
  project([Instructor and mentor]),
  project([Machine Learning; Computer Vision; Project Management]),

  tenure([2021—present], [Eindhoven]),
  project([Organizer and producer]),
  [
    #project([Eindhoven Reinforcement Learning Seminar])
    #v(1mm)
    #artifact([Series], citation-key: <einreise>, url: "https://vadim.me/publications/einreise/")
  ],

  tenure([2023], [Online]),
  project([Talk]),
  [
    #project([Fully Autonomous Programming with Large Language Models])
    #v(1mm)
    #artifact([Notes], citation-key: <seidr-talk>, url: "https://vadim.me/publications/seidr/")
  ],

  tenure([2022], [Online]),
  project([One-hour explainer]),
  [
    #project([Deceptive Diversity of Modern RL Methods])
    #v(1mm)
    #artifact([Notes], citation-key: <rl-explainer>, url: "https://vadim.me/publications/rl/")
  ],

  tenure([2020], [Online]),
  project([Tutorial]),
  [
    #project([Writing a Custom OpenAI Gym Environment])
    #v(1mm)
    #artifact([Tutorial], citation-key: <heartpole-tutorial>, url: "https://vadim.me/publications/heartpole/")
  ],

  grid.hline(y: 1, stroke: .2mm + faint),
  grid.hline(y: 2, stroke: .2mm + faint),
  grid.hline(y: 3, stroke: .2mm + faint),
  grid.hline(y: 4, stroke: .2mm + faint),
  grid.hline(y: 5, stroke: .2mm + faint),
  grid.hline(y: 6, stroke: .2mm + faint),
)

// The bibliography is the single directory for publications and other links;
// citation order and formatting are controlled by the selected CSL style.
#pagebreak()
#section-title[REFERENCES & LINKS]
#v(2.5mm)
#line(length: 100%, stroke: .55mm + ink)
#v(4mm)
#text(size: 8.65pt, fill: muted)[Reference numbers match linked items throughout the CV. Additional profile links are included below; every destination remains clickable in the PDF.]
#v(4mm)

#{
  set text(size: 8.3pt)
  set par(leading: .42em, spacing: 3mm)
  show link: set text(size: 7.2pt)
  bibliography("publications.bib", style: "ieee", title: none, full: true)
}
