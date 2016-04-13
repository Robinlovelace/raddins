# Aim: make selection bold in RMarkdown
make_bold <- function() {
  txt = rstudioapi::getActiveDocumentContext()
  txt_sel = txt$selection[[1]]$text
  txt_new = paste0("**", txt_sel, "**")
  rstudioapi::insertText(txt_new)
}
