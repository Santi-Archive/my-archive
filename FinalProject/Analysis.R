library(readr)
library(dplyr)
library(purrr)
library(tidyr)

data1 <- read_csv("FinalProject/France/2024_VNL_BUL_vs_FRA.csv")
data2 <- read_csv("FinalProject/France/2024_VNL_SLO_vs_FRA.csv")
data3 <- read_csv("FinalProject/France/2024_VNL_FRA_vs_USA.csv")
data4 <- read_csv("FinalProject/France/2024_VNL_TUR_vs_FRA.csv")

combined_data <- bind_rows(data1, data2, data3, data4)

france_all_score <- combined_data %>%
    filter(scoring_team == "France") %>% #nolint
    count(score_type, sort = TRUE)

opponent_all_score <- combined_data %>%
    filter(scoring_team != "France") %>% #nolint
    count(score_type, sort = TRUE)

france_scores <- france_all_score %>%
  tidyr::pivot_wider(names_from = score_type, values_from = n, values_fill = 0)

opponent_scores <- opponent_all_score %>%
  tidyr::pivot_wider(names_from = score_type, values_from = n, values_fill = 0)

# france_scores$serve_ace
# opponent_scores$attack_zone3


