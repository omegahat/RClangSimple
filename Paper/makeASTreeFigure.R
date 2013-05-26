opts =
  c("font=\\tiny", "level distance=1.25cm",
    "level distance=1.25cm",
    "every node/.style={top color=white",
    "    bottom color=blue!25",
    "    rectangle,rounded corners",
    "    minimum height=8mm",
    "    draw=blue!75",
    "    very thick",
    "    drop shadow",
    "    align=center",
    "    text depth = 0pt}")

cat(makeTikzGraph(slr$fun, makeCombinedCursorLabel, opts, siblingDistance = structure(c(6, 7, 7, 4, 3), names = c("", 4:7))), sep = "\n", file = "Paper/sinLogASFig.tex")
