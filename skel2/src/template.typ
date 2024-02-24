#let conf(font: "CMU Concrete", math_font: "Neo Euler", title, doc) = {
  set document(title: [#title], author: "Christopher Gómez")
  set page(margin: 2cm)
  set text(font: font, lang: "es")
  show raw: set text(font: "JetBrains Mono")
  show math.equation: set text(font: math_font)
  set par(leading: 0.55em, justify: true)
  show par: set block(above: 1em, spacing: 0.55em)
  show heading: it => {
    set align(center)
    set text(14pt)
    block(height: 1.5em)[#it]
  }
  set list(tight: false)
  set enum(tight: false)

  // Start of the document

  grid(
    columns: (1fr, 1fr),
    block[
      #set align(center)
      #image("logo.png",width: 50%)
      Universidad Simón Bolívar \
      CI-5651 - Diseño de Algoritmos I \
      Prof. Ricardo Monascal \
    ],[
      #set align(end)
      #rect(
        fill: rgb("#C4E6FF"),
        outset: 0.5em
      )[
        #set align(center)
        Resuelto por: \
        Christopher Gómez \
      ]
    ]
  )

  [= #title]

  doc
}

// Helper for questions

#let question(..args) = {
  let questions = args.pos()
  let n = questions.len()

  let i = 0
  while i < n {
    let question = questions.at(i)
    let answer = questions.at(i+1)

    enum(start: calc.floor(i/2 + 1))[
      #question \ \
      #answer
    ]

    if i+2 < n {
      pagebreak()
    }

    i += 2
  }
}
