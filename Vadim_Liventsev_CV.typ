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
          #text(size: 7pt, weight: 700, fill: ink)[vadim.me · L2]\
          #text(size: 7pt, fill: muted)[Scan for the live profile and current links.]
        ],
      )
    ],
    [
      #text(size: 7pt, weight: 700, fill: ink)[PRINT-FRIENDLY]\
      #text(size: 7pt, fill: muted)[Full links and references on page 2.]
    ],
  )
]

#set document(
  title: "Vadim Liventsev — Selected Work",
  author: "Vadim Liventsev",
  description: "Selected AI research and engineering work by Vadim Liventsev",
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

#let link-key(key) = text(
  size: 5.7pt,
  weight: 800,
  tracking: .04em,
  fill: accent,
  key,
)

#let contact(marker, label, url: none, key: none) = box[
  #text(size: 7.8pt, weight: 800, fill: accent)[#marker]
  #h(.35em)
  #if url == none {
    text(size: 7.8pt, weight: 550, fill: muted, label)
  } else {
    link(url)[
      #text(size: 7.8pt, weight: 550, fill: accent, label)
      #if key != none {
        h(.35em)
        link-key(key)
      }
    ]
  }
]

#let artifact(label, url: none, key: none) = {
  let external = url != none
  let label-content = [
    #label
    #if external {
      h(.75mm)
      link-key(key)
    }
  ]
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
      label-content,
    ),
  )
  if external { link(url, badge) } else { badge }
}

#let cited-artifact(label, citation-key, url: none, key: none) = box[
  #artifact(label, url: url, key: key)
  #h(.55mm)
  #text(size: 6.75pt, weight: 600, fill: muted)[#cite(citation-key)]
]

#let link-entry(key, label, url, display: none) = block(
  below: 1.7mm,
  [
    #grid(
      columns: (7.5mm, 1fr),
      column-gutter: 1.5mm,
      align: top,
      text(size: 6.4pt, weight: 800, tracking: .04em, fill: accent, key),
      [
        #text(size: 7.35pt, weight: 680, fill: ink)[#label]\
        #link(url)[#text(size: 6.9pt, fill: rgb("#41464b"))[#if display == none { url } else { display }]]
      ],
    )
  ],
)

#let project(body) = grid(
  columns: (1.35mm, 1fr),
  column-gutter: 1.85mm,
  align: top,
  box(height: 1em)[#text(size: 8.2pt, fill: accent)[•]],
  text(size: 8.25pt, fill: rgb("#282c30"), body),
)

#let tenure(years, affiliation) = [
  #text(size: 7.35pt, weight: 760, tracking: .035em, fill: accent)[#years]\
  #v(.55mm)
  #text(size: 8.4pt, weight: 720, fill: black)[#affiliation]
]

#let work-row(description, artifacts, years: none, affiliation: none) = block(
  breakable: false,
  [
    #grid(
      columns: (36mm, 1fr, 49mm),
      rows: 16.5mm,
      column-gutter: 4mm,
      align: (left + horizon, left + horizon, left + horizon),
      if years == none { [] } else { tenure(years, affiliation) },
      project(description),
      artifacts,
    )
    #line(length: 100%, stroke: .2mm + faint)
  ],
)

// Masthead
#grid(
  columns: (1fr, auto),
  align: (left, right),
  nav-label(text(fill: ink)[VADIM LIVENTSEV]),
  nav-label[SELECTED WORK · 2009—2026],
)

#v(4mm)
#grid(
  columns: (1fr, 77mm),
  column-gutter: 10mm,
  align: (left + bottom, right + bottom),
  [
    #text(size: 27pt, weight: 700, tracking: -.035em, fill: black)[Vadim Liventsev]
    #v(1.7mm)
    #text(size: 10.3pt, weight: 650, fill: accent)[Head of AI · Machine Learning Scientist & Engineer]
  ],
  [
    #set par(justify: false)
    #align(right)[#text(size: 8.65pt, fill: rgb("#41464b"))[
      AI research and engineering across program synthesis, agentic coding,
      machine learning for health, and tools for structured and 3D data.
    ]]
  ],
)

#v(3.4mm)
#contact([•], [London, UK])
#h(4mm)
#contact([\@], [hi\@vadim.me], url: "mailto:hi@vadim.me", key: [L1])
#h(4mm)
#contact([↗], [vadim.me], url: "https://vadim.me", key: [L2])
#h(4mm)
#contact([⌘], [github.com/vadim0x60], url: "https://github.com/vadim0x60", key: [L3])
#h(4mm)
#contact([§], [Google Scholar], url: "https://scholar.google.com/citations?user=tpB0Uw8AAAAJ", key: [L4])

#v(4.2mm)
#line(length: 100%, stroke: .55mm + ink)

// Selected work
#v(4mm)
#grid(
  columns: (1fr, auto),
  align: (left + bottom, right + bottom),
  section-title[SELECTED AI & SOFTWARE WORK],
  text(size: 7.1pt, fill: muted)[Citations resolve to the selected publications on page 2.],
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

#work-row(
  [An LLM coding harness for manipulating 3D models.],
  [#artifact([ideatura.ai], url: "https://ideatura.ai", key: [L8])],
  years: [2025—2026],
  affiliation: [Ideatura],
)

#work-row(
  [A medical-device support-ticket classifier identifying common defect types.],
  [#artifact([Private work])],
  years: [2024—2025],
  affiliation: [Philips Research],
)

#work-row(
  [A retrieval-based slide-deck generator for employee training.],
  [#artifact([Private work])],
)

#work-row(
  [Multi-agent coding frameworks combining LLMs with genetic-programming principles.],
  [
    #cited-artifact([SEIDR paper], <grishina2025seidr>, url: "https://doi.org/10.1145/3719351", key: [L9])
    #h(1.1mm)
    #artifact([Code], url: "https://github.com/vadim0x60/seidr", key: [L10])
  ],
  years: [2019—2024],
  affiliation: [TU/e × Philips Research],
)

#work-row(
  [Structural language models for source code.],
  [
    #cited-artifact([Tree VAE], <liventsev2025tree>, url: "https://doi.org/10.1109/ACCESS.2025.3532522", key: [L11])
    #h(1.1mm)
    #artifact([Code], url: "https://github.com/vadim0x60/autoencoderopt", key: [L12])
  ],
)

#work-row(
  [Reinforcement-learning environments for healthcare, spanning vision and structured data.],
  [
    #cited-artifact([Paper], <liventsev2021simulators>, url: "https://doi.org/10.3389/frai.2021.798659", key: [L13])
    #h(1.1mm)
    #artifact([HeartPole], url: "https://github.com/vadim0x60/heartpole", key: [L14])
    #h(1.1mm)
    #artifact([Auto-ALS], url: "https://github.com/vadim0x60/auto-als", key: [L15])
  ],
)

#work-row(
  [Reinforcement learning from code-execution feedback.],
  [
    #cited-artifact([BF++ paper], <liventsev2021bfpp>, url: "https://arxiv.org/abs/2101.09571", key: [L16])
    #h(1.1mm)
    #artifact([Cibi code], url: "https://github.com/vadim0x60/cibi", key: [L17])
  ],
)

#work-row(
  [A clinical-data exchange platform for syncing health data between providers.],
  [#artifact([Archived / private])],
  years: [2019],
  affiliation: [RedKangaroo],
)

#work-row(
  [A system for mining tabular data from clinical notes.],
  [
    #cited-artifact([Deep Text Prior], <liventsev2019deep>, url: "https://doi.org/10.1007/978-3-030-30493-5_26", key: [L18])
    #h(1.1mm)
    #cited-artifact([Active learning], <shelmanov2019active>, url: "https://doi.org/10.1109/BIBM47256.2019.8983157", key: [L19])
  ],
  years: [2017—2019],
  affiliation: [Skoltech × Philips Research],
)

#work-row(
  [A web app for building chatbots with rules and flowcharts.],
  [#artifact([No public release])],
  years: [2017],
  affiliation: [BotEngine],
)

#work-row(
  [A language-agnostic code-completion system.],
  [#artifact([No public release])],
  years: [2013—2017],
  affiliation: [HSE × ISPRAS],
)

#work-row(
  [Swarm-robotics algorithms for exploring a location.],
  [#artifact([No public release])],
  years: [2009—2013],
  affiliation: [LIT],
)

// The bibliography is generated from publications.bib; citation order and
// formatting are controlled by the selected CSL style.
#pagebreak()
#section-title[REFERENCES & LINKS]
#v(2.5mm)
#line(length: 100%, stroke: .55mm + ink)
#v(4mm)
#text(size: 8.65pt, fill: muted)[L-keys match links on page 1; additional profile links are included here. Every destination remains clickable in the PDF.]
#v(4mm)

#text(size: 8.2pt, weight: 760, tracking: .1em, fill: black)[SELECTED PUBLICATIONS]
#v(2.5mm)

#{
  set text(size: 8.3pt)
  set par(leading: .42em, spacing: 3mm)
  show link: set text(size: 7.2pt)
  bibliography("publications.bib", style: "ieee", title: none)
}

#v(4mm)
#text(size: 8.2pt, weight: 760, tracking: .1em, fill: black)[LINK DIRECTORY]
#v(1.5mm)
#line(length: 100%, stroke: .25mm + faint)
#v(3mm)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 8mm,
  align: top,
  [
    #text(size: 6.7pt, weight: 780, tracking: .1em, fill: muted)[CONTACT & PROFILES]
    #v(2.2mm)
    #link-entry([L1], [Email], "mailto:hi@vadim.me", display: "hi@vadim.me")
    #link-entry([L2], [Personal website], "https://vadim.me")
    #link-entry([L3], [GitHub profile], "https://github.com/vadim0x60")
    #link-entry([L4], [Google Scholar], "https://scholar.google.com/citations?user=tpB0Uw8AAAAJ")
    #link-entry([L5], [Publication list], "https://vadim.me/publications/")
    #link-entry([L6], [LinkedIn], "https://www.linkedin.com/in/vadim-liventsev-6b56b9196/")
    #link-entry([L7], [ORCID], "https://orcid.org/0000-0002-6670-6909")

    #v(1.8mm)
    #text(size: 6.7pt, weight: 780, tracking: .1em, fill: muted)[CURRENT WORK]
    #v(2.2mm)
    #link-entry([L8], [Ideatura], "https://ideatura.ai")
  ],
  [
    #text(size: 6.7pt, weight: 780, tracking: .1em, fill: muted)[PAPERS & CODE]
    #v(2.2mm)
    #link-entry([L9], [SEIDR paper], "https://doi.org/10.1145/3719351")
    #link-entry([L10], [SEIDR source code], "https://github.com/vadim0x60/seidr")
    #link-entry([L11], [Tree VAE paper], "https://doi.org/10.1109/ACCESS.2025.3532522")
    #link-entry([L12], [Tree VAE source code], "https://github.com/vadim0x60/autoencoderopt")
    #link-entry([L13], [Patient simulators paper], "https://doi.org/10.3389/frai.2021.798659")
    #link-entry([L14], [HeartPole source code], "https://github.com/vadim0x60/heartpole")
    #link-entry([L15], [Auto-ALS source code], "https://github.com/vadim0x60/auto-als")
    #link-entry([L16], [BF++ paper], "https://arxiv.org/abs/2101.09571")
    #link-entry([L17], [Cibi source code], "https://github.com/vadim0x60/cibi")
    #link-entry([L18], [Deep Text Prior paper], "https://doi.org/10.1007/978-3-030-30493-5_26")
    #link-entry([L19], [Active learning paper], "https://doi.org/10.1109/BIBM47256.2019.8983157")
  ],
)
