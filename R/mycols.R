#' My colour palette
#'
#' 23 colours ordered so the first ones are the most different from each other,
#' including for colour-blind viewers (the first 9 stay distinct for all 3 common types).
#' Asking for more than 23 adds lighter, then darker, shades of the same colours (up to 69).
#'
#' @param panel NULL / "default" / "0" for the main palette, or "1" / "2" for the older small panels.
#' @param n How many colours to return. NULL returns the whole panel.
#' @return A character vector of colours.
#' @examples
#' mycols(n = 10)
#' # DimPlot(obj, cols = mycols(n = 30))
#' @export
mycols <- function(panel = NULL, n = NULL){
  if(is.null(panel) || panel == "default" || panel == "0"){
    cols <- c(
      "aquamarine2",
      "purple2",
      "firebrick4",
      "gold2",
      "cyan4",
      "orchid2",
      "gold4",
      "#5C2175",
      "indianred1",
      "hotpink4",
      "#95EF95",
      "violetred1",
      "#7B853A",
      "#6E9CBB",
      "mediumorchid2",
      "dodgerblue3",
      "darkorange",
      "tan4",
      "olivedrab",
      "steelblue2",
      "darkkhaki",
      "rosybrown1",
      "#9447D3"
    )} else
      if(panel == "1"){
        cols <- c(
          "darkorange",
          "violetred1",
          "indianred1",
          "gold2",
          "firebrick4",
          "gold4",
          "#7B853A"
        )} else
          if(panel == "2"){
            cols <- c(
              "#5C2175",
              "#9447D3",
              "#6E9CBB",
              "dodgerblue3",
              "cyan4"
            )} else
              stop('No such panel. Choose one of NULL / "default" / "0", "1" or "2".')

  if(is.null(n)) return(cols)

  # not enough colours: add lighter shades, then darker shades, of the same colours
  if(n > length(cols)){
    lighter <- sapply(cols, function(x) grDevices::colorRampPalette(c(x, "white"))(3)[2])  # halfway to white
    darker  <- sapply(cols, function(x) grDevices::colorRampPalette(c(x, "black"))(5)[2])  # a quarter of the way to black
    cols <- unname(c(cols, lighter, darker))
  }
  if(n > length(cols)) stop("Only ", length(cols), " colours available. Label the clusters instead.")

  cols[1:n]
}
