library(readr)
library(dplyr)

data1 <- read_csv("FinalProject/France/2024_VNL_BUL_vs_FRA.csv")
data2 <- read_csv("FinalProject/France/2024_VNL_SLO_vs_FRA.csv")
data3 <- read_csv("FinalProject/France/2024_VNL_FRA_vs_USA.csv")
data4 <- read_csv("FinalProject/France/2024_VNL_TUR_vs_FRA.csv")

combined_data <- bind_rows(data1, data2, data3, data4)

france_score_counts <- combined_data %>%
  filter(scoring_team == "France") %>%
  count(score_type, sort = TRUE)

france_serve_ace_count <- france_score_counts %>%
  filter(score_type == "serve_ace" & !is.na(n)) %>%
  pull(n)

france_zone2_attack_count <- france_score_counts %>%
  filter(score_type == "attack_zone2" & !is.na(n)) %>%
  pull(n)

print(france_serve_ace_count)
print(france_zone2_attack_count)