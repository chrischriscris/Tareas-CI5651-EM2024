#let doc_title = "Tarea n: "

#set document(title: doc_title, author: "Christopher Gómez")
#set page(margin: 2cm)
#set text(font: "New Computer Modern", lang: "es")
#show raw: set text(font: "JetBrains Mono")
#set par(leading: 0.55em, justify: true)
#show par: set block(above: 1em, spacing: 0.55em)
#show heading: it => {
  set align(center)
  set text(14pt)
  block(height: 1.5em)[#it]
}
#set list(tight: false)
#set enum(tight: false)

// Start of the document

#grid(
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

= #doc_title

#enum[

// Pregunta 1

Enunciado \ \

Solución

][

// Pregunta n

Enunciado \ \

Solución

]
