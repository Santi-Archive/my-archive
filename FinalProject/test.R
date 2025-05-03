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

opponent_score_counts <- combined_data %>%
  filter(scoring_team != "France") %>%
  count(score_type, sort = TRUE)

france_serve_ace_count <- france_score_counts %>%
  filter(score_type == "serve_ace" & !is.na(n)) %>%
  pull(n)

france_zone2_attack_count <- france_score_counts %>%
  filter(score_type == "attack_zone2" & !is.na(n)) %>%
  pull(n)

france_zone3_attack_count <- france_score_counts %>%
  filter(score_type == "attack_zone3" & !is.na(n)) %>%
  pull(n)

france_zone4_attack_count <- france_score_counts %>%
  filter(score_type == "attack_zone4" & !is.na(n)) %>%
  pull(n)

france_opponent_errors <- france_score_counts %>%
  filter(grepl("error", score_type, ignore.case = TRUE) & !is.na(n)) %>%
  summarise(total = sum(n)) %>%
  pull(total)

opponent_serve_errors <- france_score_counts %>%
  filter(score_type == "serve_error" & !is.na(n)) %>%
  pull(n)

total_opponent_score <- opponent_score_counts %>%
  filter(score_type == "attack_zone4" & !is.na(n)) %>%
  pull(n)

france_total_errors <- opponent_score_counts %>%
  filter(grepl("error", score_type, ignore.case = TRUE) & !is.na(n)) %>%
  summarise(total = sum(n)) %>%
  pull(total)

print(paste0("Service Ace: ", france_serve_ace_count))
print(paste0("Zone 2: ", france_zone2_attack_count))
print(paste0("Zone 3: ", france_zone3_attack_count))
print(paste0("Zone 4: ", france_zone4_attack_count))
print(paste0("Opponent Error Total: ", france_opponent_errors))
print(paste0("Opponent Service Error: ", opponent_serve_errors))
print(paste0("Opp. Zone 4: ", total_opponent_score))
print(paste0("France Total Errors: ", france_total_errors))