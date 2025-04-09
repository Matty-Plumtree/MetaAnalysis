
model_summary <- summary(modelrma_mod)

table_df <- data.frame(
  Fixed_effect = rownames(model_summary$beta),
  Estimate     = round(model_summary$beta[,1], 3),
  `Lower CI [0.025]` = round(model_summary$ci.lb, 3),
  `Upper CI [0.975]` = round(model_summary$ci.ub, 3),
  `p-value`    = round(model_summary$pval, 4)
)



library(gt)

gt_table <- table_df %>%
  gt() %>%
  cols_label(
    Fixed_effect = "Fixed effect"
  ) %>%
  fmt_number(columns = 2:5, decimals = 3) %>%
  tab_options(
    table.border.top.color = "black",
    table.border.bottom.color = "black",
    heading.align = "left"
  )

gt_table
