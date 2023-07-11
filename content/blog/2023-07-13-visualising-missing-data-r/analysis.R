viz_missing <- function(data,
                        missing = NA,
                        show_rownames = TRUE,
                        show_colnames = TRUE) {
  # check which values are missing
  is_missing <- data |>
    dplyr::mutate(dplyr::across(dplyr::everything(), ~ .x %in% missing)) |>
    tibble::rownames_to_column() |>
    tidyr::pivot_longer(cols = -rowname, names_to = "colname", values_to = "value") |>
    # arrange axes in same order as appear in data
    dplyr::mutate(
      colname = factor(colname, levels = colnames(data)),
      rowname = factor(rowname, levels = rownames(data)),
      value = factor(value, levels = c(TRUE, FALSE))
    )
  # plot as a heatmap
  g <- ggplot2::ggplot(data = is_missing) +
    ggplot2::geom_raster(
      mapping = ggplot2::aes(
        x = colname, y = rowname, fill = value
      )
    ) +
    ggplot2::scale_y_discrete(limits = rev) +
    ggplot2::scale_fill_manual(
      name = "Missing?",
      values = c(
        "TRUE" = "black",
        "FALSE" = "grey90"
      ),
      drop = FALSE,
      labels = c("TRUE" = "Yes", "FALSE" = "No"),
      breaks = c("TRUE", "FALSE")
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(plot.margin = ggplot2::margin(10, 10, 10, 10),
                   legend.position = "top")
  if (!show_rownames) {
    g <- g + 
      ggplot2::theme(axis.text.y = ggplot2::element_blank(),
                     axis.title.y = ggplot2::element_blank())
  }
  if (show_colnames) {
    g <- g + ggplot2::theme(
      axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))
  } else {
    g <- g + 
      ggplot2::theme(axis.text.x = ggplot2::element_blank(),
                     axis.title.x = ggplot2::element_blank())
  }
  return(g)
}

# squirrel example
squirrel_data <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-05-23/squirrel_data.csv')
viz_missing(squirrel_data, show_rownames = FALSE)

# retail example
state_retail <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-12-13/state_retail.csv',  col_types = "cciciiccc")
viz_missing(state_retail, show_rownames = FALSE)

# Examples
n <- 15

# random example
set.seed(2023)
m1 <- matrix(rbinom(n = n^2, size = 1, p = 0.1), nrow = n, ncol = n)
colnames(m1) = paste("col", 1:n)
rownames(m1) = paste("row", 1:n)
m1 <- as.data.frame(m1)
viz_missing(m1, missing = 1)
sum(m1)

# structured missing
set.seed(2023)
m2 <- matrix(0, nrow = n, ncol = n)
colnames(m2) = paste("col", 1:n)
rownames(m2) = paste("row", 1:n)
m2 <- as.data.frame(m2)
m2$`col 6` <- rbinom(n = n, size = 1, p = 0.1)
m2$`col 8` <- rbinom(n = n, size = 1, p = 0.7)
m2$`col 9` <- rbinom(n = n, size = 1, p = 0.7)
viz_missing(m2, missing = 1)
sum(m2)
