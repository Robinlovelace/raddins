#' Move text up a single line
#'
#' Moves a line of text up one row and appends it to the line above
#' @import rstudioapi
#' @export
move_up = function() {
  location = rstudioapi::getActiveDocumentContext()
  max_row = length(location$contents)

  ## Get the row number
  r = as.integer(location$selection[[1]]$range$start[1])
  if(r == 1L) return()
  if(nchar(location$path) == 0L) {
    message("Please save your file to use this add-on")
    return()
  }

  col = nchar(location$contents[r-1L])
  ## Get the text in that line
  text = paste(location$contents[r-1L], location$contents[r])

  rstudioapi::modifyRange(c(r, 1, max_row, Inf),
                  paste(location$contents[(r+1L):max_row], collapse = "\n"))
  rstudioapi::modifyRange(c(r-1, 1, r-1, Inf), text)
  rstudioapi::navigateToFile(location$path, r-1L, col+1L)
}

