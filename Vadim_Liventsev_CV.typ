#import "@preview/cades:0.3.1": qr-code

#let ink = rgb("#212121")
#let muted = rgb("#62676d")
#let faint = rgb("#e0e0e0")
#let paper = rgb("#fafafa")
#let accent = rgb("#315f7d")
#let accent-soft = rgb("#eef3f6")
#let private-bg = rgb("#f0f1f2")

#let themes = (
  "code-generation": (label: [Code generation], mark: [C], color: rgb("#3c6e91")),
  "training-models": (label: [Training models], mark: [T], color: rgb("#765d8d")),
  "managing-people": (label: [Managing people], mark: [P], color: rgb("#a56a43")),
  "multi-agent": (label: [Multi-agent systems], mark: [A], color: rgb("#3c7a70")),
  "reinforcement-learning": (label: [Reinforcement learning], mark: [R], color: rgb("#9b4f5f")),
  "healthtech": (label: [Healthtech], mark: [H], color: rgb("#5f7d4e")),
)

#let distance = (
  xs: .5mm,
  sm: 1mm,
  md: 2mm,
  lg: 3mm,
  xl: 4mm,
)

#let qr = qr-code(
  "https://vadim.me",
  width: 11mm,
  height: 11mm,
)

#set document(
  title: "Research, Development, Teaching and Yapping",
  author: "Vadim Liventsev",
)
#set page(
  paper: "a4",
  margin: (top: 12mm, right: 13mm, bottom: 13mm, left: 13mm),
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
    inset: (x: distance.md, y: distance.sm),
    radius: 99pt,
    fill: if external { accent-soft } else { private-bg },
    stroke: .22mm + if external { rgb("#c8d7e0") } else { rgb("#d7dadd") },
    text(
      size: 6.75pt,
      weight: 700,
      tracking: .01em,
      fill: if external { accent } else { rgb("#6b7075") },
      label,
    ),
  )
  box[
    #if external { link(url, badge) } else { badge }
    #if citation-key != none {
      h(distance.xs)
      text(size: 6.75pt, weight: 600, fill: muted)[#cite(citation-key)]
    }
  ]
}

#let theme-marker(theme-id) = {
  let theme = themes.at(theme-id)
  box(
    width: 3.2mm,
    height: 3.2mm,
    radius: 99pt,
    fill: theme.color,
    align(
      center + horizon,
      text(size: 5.5pt, weight: 800, fill: white, theme.mark),
    ),
  )
}

#let theme-markers(theme-ids) = {
  for (index, theme-id) in theme-ids.enumerate() {
    if index > 0 { h(distance.sm) }
    theme-marker(theme-id)
  }
}

#let theme-key(theme-id) = {
  let theme = themes.at(theme-id)
  box[
    #theme-marker(theme-id)
    #h(distance.sm)
    #text(size: 6.35pt, weight: 600, fill: muted, theme.label)
  ]
}

#let theme-legend = grid(
  columns: (auto, auto, auto),
  column-gutter: distance.lg,
  row-gutter: distance.sm,
  align: (left + horizon,),
  theme-key("code-generation"),
  theme-key("training-models"),
  theme-key("managing-people"),
  theme-key("multi-agent"),
  theme-key("reinforcement-learning"),
  theme-key("healthtech"),
)

#let project(body, themes: ()) = grid(
  columns: (1fr, auto),
  column-gutter: distance.sm,
  align: (left + top, right + top),
  text(size: 8.25pt, fill: rgb("#282c30"), body),
  theme-markers(themes),
)

#let tenure(years, affiliation) = [
  #text(size: 7.35pt, weight: 760, tracking: .035em, fill: accent)[#years]\
  #v(distance.md)
  #text(size: 8.4pt, weight: 720, fill: black)[#affiliation]
]

#v(distance.xl)
#grid(
  columns: (1fr, 70mm),
  column-gutter: 10mm,
  align: (left + bottom, right + bottom),
  [
    #text(size: 27pt, weight: 700, tracking: -.035em, fill: black)[Vadim Liventsev]
    #v(distance.lg)
    #text(size: 10.3pt, weight: 550, fill: accent)[Machine Learning Scientist & Engineer]
  ],
  [
    #grid(
      columns: (1fr, 11mm),
      column-gutter: 6mm,
      align: (right + horizon, right + top),
      [
        #grid(
          columns: (1fr,),
          row-gutter: distance.sm,
          align: right,
          [#contact([hire\@vadim.me], url: "mailto:hire@vadim.me")
           #h(distance.md)
           #contact([London, UK])],
          [
            #contact([GitHub], url: "https://github.com/vadim0x60", citation-key: <github-profile>)
            #h(distance.md)
            #contact([Google Scholar], url: "https://scholar.google.com/citations?user=tpB0Uw8AAAAJ", citation-key: <google-scholar>)
          ],
        )
      ],
      qr,
    )
  ],
)

#v(distance.xl)
#line(length: 100%, stroke: .35mm + accent)

// Selected work
#v(distance.lg)
#grid(
  columns: (1fr, auto),
  column-gutter: distance.lg,
  align: (left + horizon, right + horizon),
  section-title[Research and Development],
  theme-legend,
)

#v(distance.md)
#line(length: 100%, stroke: .25mm + faint)
#grid(
  columns: (36mm, 1fr, 49mm),
  column-gutter: distance.xl,
  inset: (y: distance.md),
  text(size: 6.8pt, weight: 750, tracking: .11em, fill: rgb("#70757a"))[AFFILIATION],
  text(size: 6.8pt, weight: 750, tracking: .11em, fill: rgb("#70757a"))[WHAT I BUILT],
  text(size: 6.8pt, weight: 750, tracking: .11em, fill: rgb("#70757a"))[PUBLIC ARTIFACTS],
)
#line(length: 100%, stroke: .25mm + faint)

#grid(
  columns: (36mm, 1fr, 49mm),
  rows: 15mm,
  column-gutter: distance.xl,
  align: (left + horizon, left + horizon, left + horizon),

  // Ideatura
  tenure([2025—2026], [Ideatura]),
  project(
    [An LLM coding harness for manipulating 3D models.],
    themes: ("code-generation","multi-agent"),
  ),
  [#artifact([ideatura.ai], citation-key: <ideatura>, url: "https://ideatura.ai")],

  // Philips Research — spans two projects
  grid.cell(rowspan: 2, tenure([2024—2025], [Philips Research])),
  project(
    [A medical-device support ticket classifier identifying common defect types.],
    themes: ("training-models", "healthtech"),
  ),
  grid.cell(
    rowspan: 2,
    [#artifact([Speedformers], citation-key: <speedformers-code>, url: "https://github.com/philips-labs/speedformers")],
  ),
  project([A retrieval-based slide deck generator for employee training.]),

  // TU/e × Philips Research — spans four projects
  grid.cell(
    rowspan: 4,
    tenure([2019—2024], [
      TU Eindhoven × Philips Research
      #v(distance.md)
      #artifact(
        [PhD thesis],
        citation-key: <liventsev2026deep>,
        url: "https://research.tue.nl/en/publications/deep-program-induction-for-personal-healthcare/",
      )
    ]),
  ),
  project(
    [Multi-agent coding frameworks combining LLMs with genetic programming principles.],
    themes: ("code-generation", "multi-agent"),
  ),
  [
    #artifact([SEIDR library], citation-key: <seidr-code>, url: "https://github.com/vadim0x60/seidr")
    #h(distance.sm)
    #artifact([SEIDR study], citation-key: <liventsev2023autonomous>, url: "https://doi.org/10.1145/3719351")
    #h(distance.sm)
    #artifact([Neurogenetic programming], citation-key: <liventsev2021neurogenetic>, url: "https://doi.org/10.1145/3719351")
  ],
  project(
    [Structural language models for source code.],
    themes: ("code-generation", "training-models", "managing-people"),
  ),
  [
    #artifact([Tree VAE], citation-key: <liventsev2025tree>, url: "https://doi.org/10.1109/ACCESS.2025.3532522")
  ],
  project(
    [Reinforcement learning environments for healthcare, spanning vision and structured data.],
    themes: ("reinforcement-learning", "healthtech", "training-models","managing-people"),
  ),
  [
    #artifact([Simulators paper], citation-key: <liventsev2021simulators>, url: "https://doi.org/10.3389/frai.2021.798659")
    #h(distance.sm)
    #artifact([Benchmarking paper], citation-key: <liventsev2021simulators>, url: "https://doi.org/10.3389/frai.2021.798659")
    #h(distance.sm)
    #artifact([HeartPole], citation-key: <heartpole-code>, url: "https://github.com/vadim0x60/heartpole")
    #h(distance.sm)
    #artifact([Auto-ALS], citation-key: <auto-als-code>, url: "https://github.com/vadim0x60/auto-als")
  ],
  project(
    [Reinforcement learning from code execution feedback.],
    themes: ("code-generation", "training-models", "reinforcement-learning"),
  ),
  [
    #artifact([BF++ study], citation-key: <liventsev2021bfpp>, url: "https://arxiv.org/abs/2101.09571")
    #h(distance.sm)
    #artifact([Cibi library], citation-key: <cibi-code>, url: "https://github.com/vadim0x60/cibi")
  ],

  // RedKangaroo
  tenure([2019], [RedKangaroo]),
  project(
    [A clinical data exchange platform for syncing health data between providers.],
    themes: ("healthtech",),
  ),
  [],

  // Skoltech × Philips Research
  tenure([2017—2019], [Skoltech × Philips Research]),
  project(
    [A system for mining tabular data from clinical notes.],
    themes: ("training-models", "healthtech"),
  ),
  [
    #artifact([Deep Text Prior], citation-key: <liventsev2019deep>, url: "https://doi.org/10.1007/978-3-030-30493-5_26")
    #h(distance.sm)
    #artifact([Active learning], citation-key: <shelmanov2019active>, url: "https://doi.org/10.1109/BIBM47256.2019.8983157")
  ],

  // BotEngine
  tenure([2017], [BotEngine]),
  project(
    [A web app for building chatbots with rules and flowcharts.],
  ),
  [],

  // HSE × ISPRAS
  tenure([2013—2017], [Higher School of Economics × Institute for Systems Programming]),
  project(
    [A language-agnostic code completion system.],
    themes: ("code-generation", "training-models"),
  ),
  [],

  // LIT
  tenure([2009—2013], [Lyceum of Information Technologies]),
  project(
    [Swarm robotics algorithms for exploring a locality.],
    themes: ("multi-agent",),
  ),
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
#v(distance.xl)
#section-title[Teaching]
#v(distance.lg)
#line(length: 100%, stroke: .55mm + ink)
#v(distance.lg)

#grid(
  columns: (36mm, 1fr),
  column-gutter: distance.xl,
  row-gutter: distance.lg,
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
    #v(distance.sm)
    #artifact([Series], citation-key: <einreise>, url: "https://vadim.me/publications/einreise/")
  ],
)

// The bibliography is the single directory for publications and other links;
// only entries cited in the CV are exported, and their order and formatting are
// controlled by the selected CSL style.
#pagebreak()
#section-title[REFERENCES & LINKS]
#v(distance.lg)
#line(length: 100%, stroke: .55mm + ink)
#v(distance.xl)
#text(size: 8.65pt, fill: muted)[Reference numbers match linked items throughout the CV. Additional profile links are included below; every destination remains clickable in the PDF.]
#v(distance.xl)

#{
  set text(size: 8.3pt)
  set par(leading: .42em, spacing: distance.lg)
  show link: set text(size: 7.2pt)
  bibliography("publications.bib", style: "ieee", title: none)
}
