library(gt)
library(gtsummary)

reset_gtsummary_theme()

# Set language for default statistical values
theme_gtsummary_language("nl")

# Create a summary table

table1 <- trial |>
  tbl_summary(
    by = trt,
    include = c(age, grade),
    missing = "no"
  ) |>
  add_n() |>
  add_overall() |>
  modify_header(
    update = list(
      stat_1 = "**A**",
      stat_2 = "**B**"
    )
  ) |>
  modify_spanning_header(
    all_stat_cols() ~ "**Drug**"
  ) |>
  as_gt() |>
  tab_options(
    heading.background.color = adjust_luminance("#005382", steps = 0.4),
    footnotes.background.color = adjust_luminance("#005382", steps = 0.6),
    heading.align = 'left'
  ) |>
  tab_header(
    title = "Statistics from the trial data from gtsummary package",
    subtitle = "A simple example table"
  ) |>
  tab_source_note(md("This data is **simulated**"))

# Save the table1 object as png in output folder
  
gtsave(table1, "./output/table1.png")  

