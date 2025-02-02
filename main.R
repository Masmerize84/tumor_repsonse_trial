library(gt)
library(gtsummary)

table1 <- trial |>
  tbl_summary(
    by = trt,
    include = c(age, grade),
    missing = "no"
  ) |>
  add_n() |>
  add_overall() |>
  as_gt() |>
  tab_options(
    heading.background.color = "#FF0000",
    footnotes.background.color = "#FF0000",
    heading.align = 'left'
  ) |>
  tab_header(
    title = "Statistics from the trial data from gtsummary package",
    subtitle = "A simple example table"
  ) |>
  tab_source_note(md("This data is **simulated**"))
  
gtsave(table1, "table1.png")  

