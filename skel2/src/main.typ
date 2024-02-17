#set page(margin: 1in)
#set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
#set text(font: "New Computer Modern")
#show raw: set text(font: "New Computer Modern Mono")
#show par: set block(spacing: 0.55em)
#show heading: it => {
  set align(center)
  set text(14pt)
  block[
    #it
  ]
}

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



= Tarea n: 

// Pregunta 1
+ 

// ...
+