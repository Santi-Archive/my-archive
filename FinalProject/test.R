library(readr)
library(dplyr)
library(purrr)

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


# Wide format for France scores
france_scores <- france_all_score %>%
  tidyr::pivot_wider(names_from = score_type, values_from = n, values_fill = 0)

# Wide format for Opponent scores
opponent_scores <- opponent_all_score %>%
  tidyr::pivot_wider(names_from = score_type, values_from = n, values_fill = 0)


print(france_scores$serve_ace)

library(readr)
library(dplyr)
library(purrr)

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

#============= France Score Types ==============#
france_serve_ace <- france_all_score %>% filter(score_type == "serve_ace") %>% pull(n) #nolint
france_attack_zone1 <- france_all_score %>% filter(score_type == "attack_zone1") %>% pull(n) #nolint
france_attack_zone2 <- france_all_score %>% filter(score_type == "attack_zone2") %>% pull(n) #nolint
france_attack_zone3 <- france_all_score %>% filter(score_type == "attack_zone3") %>% pull(n) #nolint
france_attack_zone4 <- france_all_score %>% filter(score_type == "attack_zone4") %>% pull(n) #nolint
france_attack_zone5 <- france_all_score %>% filter(score_type == "attack_zone5") %>% pull(n) #nolint
france_attack_zone6 <- france_all_score %>% filter(score_type == "attack_zone6") %>% pull(n) #nolint
france_block_zone2 <- france_all_score %>% filter(score_type == "block_zone2") %>% pull(n) #nolint
france_block_zone3 <- france_all_score %>% filter(score_type == "block_zone3") %>% pull(n) #nolint
france_block_zone4 <- france_all_score %>% filter(score_type == "block_zone4") %>% pull(n) #nolint
france_error_zone1 <- france_all_score %>% filter(score_type == "error_zone1") %>% pull(n) #nolint
france_error_zone2 <- france_all_score %>% filter(score_type == "error_zone2") %>% pull(n) #nolint
france_error_zone3 <- france_all_score %>% filter(score_type == "error_zone3") %>% pull(n) #nolint
france_error_zone4 <- france_all_score %>% filter(score_type == "error_zone4") %>% pull(n) #nolint
france_error_zone5 <- france_all_score %>% filter(score_type == "error_zone5") %>% pull(n) #nolint
france_error_zone6 <- france_all_score %>% filter(score_type == "error_zone6") %>% pull(n) #nolint
france_error_double_touch <- france_all_score %>% filter(score_type == "error_double_touch") %>% pull(n) #nolint
france_error_illegal_attack <- france_all_score %>% filter(score_type == "error_illegal_attack") %>% pull(n) #nolint
france_error_foot_fault <- france_all_score %>% filter(score_type == "error_foot_fault") %>% pull(n) #nolint
france_receive_score <- france_all_score %>% filter(score_type == "receive") %>% pull(n) #nolint
france_other_score <- france_all_score %>% filter(score_type == "NA") %>% pull(n) #nolint
france_error_net_touch <- france_all_score %>% filter(score_type == "error_net_touch") %>% pull(n) #nolint
france_opponent_serve_error <- france_all_score %>% filter(score_type == "serve_error") %>% pull(n) #nolint
#================================================#

#============ Opponent Score Types ==============#
opponent_serve_ace <- opponent_all_score %>% filter(score_type == "serve_ace") %>% pull(n) #nolint
opponent_france_serve_error <- opponent_all_score %>% filter(score_type == "serve_error") %>% pull(n) #nolint
opponent_attack_zone1 <- opponent_all_score %>% filter(score_type == "attack_zone1") %>% pull(n) #nolint
opponent_attack_zone2 <- opponent_all_score %>% filter(score_type == "attack_zone2") %>% pull(n) #nolint
opponent_attack_zone3 <- opponent_all_score %>% filter(score_type == "attack_zone3") %>% pull(n) #nolint
opponent_attack_zone4 <- opponent_all_score %>% filter(score_type == "attack_zone4") %>% pull(n) #nolint
opponent_attack_zone5 <- opponent_all_score %>% filter(score_type == "attack_zone5") %>% pull(n) #nolint
opponent_attack_zone6 <- opponent_all_score %>% filter(score_type == "attack_zone6") %>% pull(n) #nolint
opponent_block_zone2 <- opponent_all_score %>% filter(score_type == "block_zone2") %>% pull(n) #nolint
opponent_block_zone3 <- opponent_all_score %>% filter(score_type == "block_zone3") %>% pull(n) #nolint
opponent_block_zone4 <- opponent_all_score %>% filter(score_type == "block_zone4") %>% pull(n) #nolint
opponent_error_zone1 <- opponent_all_score %>% filter(score_type == "error_zone1") %>% pull(n) #nolint
opponent_error_zone2 <- opponent_all_score %>% filter(score_type == "error_zone2") %>% pull(n) #nolint
opponent_error_zone3 <- opponent_all_score %>% filter(score_type == "error_zone3") %>% pull(n) #nolint
opponent_error_zone4 <- opponent_all_score %>% filter(score_type == "error_zone4") %>% pull(n) #nolint
opponent_error_zone5 <- opponent_all_score %>% filter(score_type == "error_zone5") %>% pull(n) #nolint
opponent_error_zone6 <- opponent_all_score %>% filter(score_type == "error_zone6") %>% pull(n) #nolint
opponent_error_net_touch <- opponent_all_score %>% filter(score_type == "error_net_touch") %>% pull(n) #nolint
opponent_error_receive <- opponent_all_score %>% filter(score_type == "error_receive") %>% pull(n) #nolint
#================================================#

