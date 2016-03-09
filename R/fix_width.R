#' Fix text width
#'
#' Formats text and ensure that the line width have a maximum length of
#' \code{options("width")}.
#' @import rstudioapi
#' @export
fix_width = function() {

  ## Subtract 0.5 to split exactly on the line break
  line_width = options("width")[[1]] - 0.5

  ## Get the document context
  ## I think this has already been called, but
  ## don't know how to access it
  location = rstudioapi::getActiveDocumentContext()

  ## Get the row number
  r = location$selection[[1]]$range$start[1]
  ## Get the text in that line
  line = location$contents[r]
  if(nchar(line) < line_width) return()

  ## Split on space and determine where to put the line breaks
  line_split = strsplit(line, " ")[[1]]
  ceils = ceiling(cumsum(sapply(line_split, nchar)+1)/(line_width))

  ## Add in line breaks
  diffs = diff(ceils) > 0
  line_split[c(diffs, FALSE)] = paste0(line_split[c(diffs, FALSE)], "\n")
  line_split[c(!diffs, FALSE)] = paste0(line_split[c(!diffs, FALSE)], " ")

  ## Change text
  rstudioapi::modifyRange(c(r, 1, r, Inf), paste(line_split, collapse = ""))
}
