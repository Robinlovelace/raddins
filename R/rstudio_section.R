#' Converts text to an RStudio section
#'
#' This addon converts text to an RStudio section or code folding block.
#' @export
rstudio_section = function() {

  location = rstudioapi::getActiveDocumentContext()
  ## Get the row number
  r = location$selection[[1]]$range$start[1]
  line = location$contents[r]
  comment_line = paste0(line, " ----")
  is_comment = substr(line, 1L, 2L) == "#'"

  if(!is_comment) {
    comment_line = paste0("# ", comment_line)
  }
  rstudioapi::modifyRange(c(r, 1, r, Inf), comment_line)
}
