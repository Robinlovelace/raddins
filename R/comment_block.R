# Removes white space at the start and end of a line
remove_white = function(x) gsub("(^[[:space:]]+|[[:space:]]+$)", "", x)


#' Add a comment block
#'
#' Surrounds text with a comment block
#' @export
comment_block = function() {
  line_width = 80

  location = rstudioapi::getActiveDocumentContext()
  ## Get the row number
  r = location$selection[[1]]$range$start[1]
  line = location$contents[r]

  # If roxygen2 block add #'
  is_roxy2 = substr(line, 1L, 2L) == "#'"
  if(is_roxy2) {
    comment_line = paste(c("#' ", rep("#", line_width-3)), collapse = "")
    line = remove_white(substr(line, 3L, nchar(line)))
    line = paste(c("#' ## ", line, rep(" ", line_width - nchar(line) - 8), "##\n"),
                 collapse = "")
  } else {
    comment_line = paste(c(rep("#", line_width)), collapse = "")
    line = remove_white(line)
    line = paste(c("## ", line, rep(" ", line_width - nchar(line) - 5), "##\n"),
                 collapse = "")
  }
  text = paste(c(comment_line, "\n", line, comment_line), collapse = "")
  rstudioapi::modifyRange(c(r, 1, r, Inf), text)
}






