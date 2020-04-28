
#
# This is a package with Summer inspired color palettes for R
#


# List of color palettes

summeR_colors <- list(
  sunbathing = c("#5A73BF", "#ADB8D9", "#A46656", "#F2B138", "#AA1E0C"),
  lunch = c("#909DD1", "#1E469E", "#DDB84C","#C555AC", "#A84E2A" ),
  PastelSunset = c("#E2A15A","#B0BFDF", "#BE9EDD", "#DB86AA"),
  BlueShades = c("#06A2BA", "#1EDFE3","#386262", "#03477D", "#35C9D5"),
  camping = c("#5C8132", "#7EA0E0", "#E5C156", "#C64D1E","#5F6E9A" )
)


# summeR function

summeR <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- summeR_colors[[name]]
  if (is.null(pal))
    stop("Check spelling? Palette does not exist")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop(paste0("Summer has infinite colors, but this palette has only ", length(pal)))
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#printing the palette
print.palette <- function(x, ...) {

  dt <- data.frame(a = 1:length(x), b = rep(5, length(x)))
  pl <- dt%>%
    ggplot(aes(a,b,fill = factor(a)))+
    geom_col()+
    scale_fill_manual(values = x)+
    guides(fill = FALSE)+
    labs(title = attr(x, "name"))+
    coord_fixed(ratio = 1)+
    theme_void()+
    theme(plot.title = element_text( hjust = .5,
                                     vjust = 2))
  print(pl)
}
