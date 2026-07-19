#import "@preview/cades:0.3.1": qr-code

#let ink = rgb("#212121")
#let muted = rgb("#62676d")
#let faint = rgb("#e0e0e0")
#let paper = rgb("#fafafa")
#let accent = rgb("#1565c0")
#let accent-soft = rgb("#e9f2fc")
#let private-bg = rgb("#f0f1f2")

#let distance = (
  page-margin: (top: 12mm, right: 13mm, bottom: 13mm, left: 13mm),
  qr-size: 11mm,
  page-top: 4mm,
  header-side-width: 70mm,
  header-gutter: 10mm,
  header-title-gap: 2.5mm,
  contact-gutter: 6mm,
  contact-row-gap: 1.15mm,
  contact-item-gap: 2mm,
  header-bottom-gap: 3.5mm,
  section-top-gap: 3mm,
  section-title-gap: 2.5mm,
  table-affiliation-width: 36mm,
  table-artifact-width: 49mm,
  table-gutter: 4mm,
  table-header-inset: 1.7mm,
  table-row-height: 15mm,
  artifact-gap: 1.1mm,
  artifact-inset: (x: 1.65mm, y: .8mm),
  artifact-citation-gap: .55mm,
  tenure-gap: 2.2mm,
  teaching-top-gap: 4mm,
  teaching-row-gap: 2.5mm,
  teaching-artifact-gap: 1mm,
  references-intro-gap: 4mm,
  bibliography-item-gap: 3mm,
  rule-accent: .35mm,
  rule-light: .25mm,
  rule-row: .2mm,
  rule-strong: .55mm,
)

#let qr = qr-code(
  "https://vadim.me",
  width: distance.qr-size,
  height: distance.qr-size,
)

#set document(
  title: "Research, Development, Teaching and Yapping",
  author: "Vadim Liventsev",
)
#set page(
  paper: "a4",
  margin: distance.page-margin,
  fill: paper,
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

#let contact(label, url: none, citation-key: none) = box[
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
    inset: distance.artifact-inset,
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
      h(distance.artifact-citation-gap)
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
  #v(distance.tenure-gap)
  #text(size: 8.4pt, weight: 720, fill: black)[#affiliation]
]

#v(distance.page-top)
#grid(
  columns: (1fr, distance.header-side-width),
  column-gutter: distance.header-gutter,
  align: (left + bottom, right + bottom),
  [
    #text(size: 27pt, weight: 700, tracking: -.035em, fill: black)[Vadim Liventsev]
    #v(distance.header-title-gap)
    #text(size: 10.3pt, weight: 550, fill: accent)[Machine Learning Scientist & Engineer]
  ],
  [
    #grid(
      columns: (1fr, distance.qr-size),
      column-gutter: distance.contact-gutter,
      align: (right + horizon, right + top),
      [
        #grid(
          columns: (1fr,),
          row-gutter: distance.contact-row-gap,
          align: right,
          [#contact([hire\@vadim.me], url: "mailto:hire@vadim.me")
           #h(distance.contact-item-gap)
           #contact([London, UK])],
          [
            #contact([GitHub], url: "https://github.com/vadim0x60", citation-key: <github-profile>)
            #h(distance.contact-item-gap)
            #contact([Google Scholar], url: "https://scholar.google.com/citations?user=tpB0Uw8AAAAJ", citation-key: <google-scholar>)
          ],
        )
      ],
      qr,
    )
  ],
)

#v(distance.header-bottom-gap)
#line(length: 100%, stroke: distance.rule-accent + accent)

// Selected work
#v(distance.section-top-gap)
#grid(
  columns: (1fr, auto),
  align: (left + bottom, right + bottom),
  section-title[Research and Development],
)

#v(distance.section-title-gap)
#line(length: 100%, stroke: distance.rule-light + faint)
#grid(
  columns: (distance.table-affiliation-width, 1fr, distance.table-artifact-width),
  column-gutter: distance.table-gutter,
  inset: (y: distance.table-header-inset),
  text(size: 6.8pt, weight: 750, tracking: .11em, fill: rgb("#70757a"))[AFFILIATION],
  text(size: 6.8pt, weight: 750, tracking: .11em, fill: rgb("#70757a"))[WHAT I BUILT],
  text(size: 6.8pt, weight: 750, tracking: .11em, fill: rgb("#70757a"))[PUBLIC ARTIFACTS],
)
#line(length: 100%, stroke: distance.rule-light + faint)

#grid(
  columns: (distance.table-affiliation-width, 1fr, distance.table-artifact-width),
  rows: distance.table-row-height,
  column-gutter: distance.table-gutter,
  align: (left + horizon, left + horizon, left + horizon),

  // Ideatura
  tenure([2025—2026], [Ideatura]),
  project([An LLM coding harness for manipulating 3D models.]),
  [#artifact([ideatura.ai], citation-key: <ideatura>, url: "https://ideatura.ai")],

  // Philips Research — spans two projects
  grid.cell(rowspan: 2, tenure([2024—2025], [Philips Research])),
  project([A medical-device support ticket classifier identifying common defect types.]),
  grid.cell(
    rowspan: 2,
    [#artifact([Speedformers], citation-key: <speedformers-code>, url: "https://github.com/philips-labs/speedformers")],
  ),
  project([A retrieval-based slide deck generator for employee training.]),

  // TU/e × Philips Research — spans four projects
  grid.cell(rowspan: 4, tenure([2019—2024], [TU/e × Philips Research])),
  project([Multi-agent coding frameworks combining LLMs with genetic-programming principles.]),
  [
    #artifact([SEIDR library], citation-key: <seidr-code>, url: "https://github.com/vadim0x60/seidr")
    #h(distance.artifact-gap)
    #artifact([SEIDR study], citation-key: <liventsev2023autonomous>, url: "https://doi.org/10.1145/3719351")
    #h(distance.artifact-gap)
    #artifact([Neurogenetic programming], citation-key: <liventsev2021neurogenetic>, url: "https://doi.org/10.1145/3719351")
  ],
  project([Structural language models for source code.]),
  [
    #artifact([Tree VAE], citation-key: <liventsev2025tree>, url: "https://doi.org/10.1109/ACCESS.2025.3532522")
    #h(distance.artifact-gap)
    #artifact([Code], citation-key: <tree-vae-code>, url: "https://github.com/vadim0x60/autoencoderopt")
  ],
  project([Reinforcement-learning environments for healthcare, spanning vision and structured data.]),
  [
    #artifact([Paper], citation-key: <liventsev2021simulators>, url: "https://doi.org/10.3389/frai.2021.798659")
    #h(distance.artifact-gap)
    #artifact([HeartPole], citation-key: <heartpole-code>, url: "https://github.com/vadim0x60/heartpole")
    #h(distance.artifact-gap)
    #artifact([Auto-ALS], citation-key: <auto-als-code>, url: "https://github.com/vadim0x60/auto-als")
  ],
  project([Reinforcement learning from code execution feedback.]),
  [
    #artifact([BF++ study], citation-key: <liventsev2021bfpp>, url: "https://arxiv.org/abs/2101.09571")
    #h(distance.artifact-gap)
    #artifact([Cibi library], citation-key: <cibi-code>, url: "https://github.com/vadim0x60/cibi")
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
    #h(distance.artifact-gap)
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
  project([Swarm robotics algorithms for exploring a locality.]),
  [],

  // Row separators: full-width lines mark group boundaries; within a
  // merged affiliation the line skips the left column so the cell reads
  // as a single span.
  grid.hline(y: 1, stroke: distance.rule-row + faint),
  grid.hline(y: 2, start: 1, end: 3, stroke: distance.rule-row + faint),
  grid.hline(y: 3, stroke: distance.rule-row + faint),
  grid.hline(y: 4, start: 1, end: 3, stroke: distance.rule-row + faint),
  grid.hline(y: 5, start: 1, end: 3, stroke: distance.rule-row + faint),
  grid.hline(y: 6, start: 1, end: 3, stroke: distance.rule-row + faint),
  grid.hline(y: 7, stroke: distance.rule-row + faint),
  grid.hline(y: 8, stroke: distance.rule-row + faint),
  grid.hline(y: 9, stroke: distance.rule-row + faint),
  grid.hline(y: 10, stroke: distance.rule-row + faint),
  grid.hline(y: 11, stroke: distance.rule-row + faint),
  grid.hline(y: 12, stroke: distance.rule-row + faint),
)

// Teaching, courses, talks, and community work
#v(distance.teaching-top-gap)
#section-title[Teaching]
#v(distance.section-title-gap)
#line(length: 100%, stroke: distance.rule-strong + ink)
#v(distance.section-title-gap)

#grid(
  columns: (distance.table-affiliation-width, 1fr),
  column-gutter: distance.table-gutter,
  row-gutter: distance.teaching-row-gap,
  align: (left + top, left + top),

  [#text(size: 7.35pt, weight: 700, fill: accent)[2018—2019] #text(size: 7.35pt, fill: muted)[· Skoltech]],
  project([Functional Programming with Clojure]),

  [#text(size: 7.35pt, weight: 700, fill: accent)[2019] #text(size: 7.35pt, fill: muted)[· Skoltech]],
  project([Introduction to Artificial Humour]),

  [#text(size: 7.35pt, weight: 700, fill: accent)[2019—2021] #text(size: 7.35pt, fill: muted)[· Netology]],
  project([Machine Learning]),

  [#text(size: 7.35pt, weight: 700, fill: accent)[2021—present] #text(size: 7.35pt, fill: muted)[· Eindhoven]],
  [
    #project([Eindhoven Reinforcement Learning Seminar])
    #v(distance.teaching-artifact-gap)
    #artifact([Series], citation-key: <einreise>, url: "https://vadim.me/publications/einreise/")
  ],
)

// The bibliography is the single directory for publications and other links;
// only entries cited in the CV are exported, and their order and formatting are
// controlled by the selected CSL style.
#pagebreak()
#section-title[REFERENCES & LINKS]
#v(distance.section-title-gap)
#line(length: 100%, stroke: distance.rule-strong + ink)
#v(distance.references-intro-gap)
#text(size: 8.65pt, fill: muted)[Reference numbers match linked items throughout the CV. Additional profile links are included below; every destination remains clickable in the PDF.]
#v(distance.references-intro-gap)

#{
  set text(size: 8.3pt)
  set par(leading: .42em, spacing: distance.bibliography-item-gap)
  show link: set text(size: 7.2pt)
  bibliography("publications.bib", style: "ieee", title: none)
}
