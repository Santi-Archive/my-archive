library(readr)
library(dplyr)

data1 <- read_csv("FinalProject/France/2024_VNL_BUL_vs_FRA.csv")
data2 <- read_csv("FinalProject/France/2024_VNL_SLO_vs_FRA.csv")
data3 <- read_csv("FinalProject/France/2024_VNL_FRA_vs_USA.csv")
data4 <- read_csv("FinalProject/France/2024_VNL_TUR_vs_FRA.csv")

combined_data <- bind_rows(data1, data2, data3, data4)

test_france_score_counts <- combined_data %>%
  filter(scoring_team == "France") %>%
  count(score_type, sort = TRUE)

test_opponent_score_counts <- combined_data %>%
  filter(scoring_team != "France") %>%
  count(score_type, sort = TRUE)

test_france_serve_ace_count <- test_france_score_counts %>%
  filter(score_type == "serve_ace" & !is.na(n)) %>%
  pull(n)

test_france_opponent_errors <- test_france_score_counts %>%
  filter(grepl("error", score_type, ignore.case = TRUE) & !is.na(n)) %>%
  summarise(total = sum(n)) %>%
  pull(total)


# Count Total Points Scored by France (All Games)
total_france_score <- combined_data %>%
  filter(scoring_team == "France") %>%
  count(score_type, sort = TRUE)
# Output for this is first column = score_type and second column = frequency
# To access each individual score_type,
# use filter(score_type == "score_type" & !is.na(n)) %>%)

# Place each type of score_type into a variable
france_score_serve_error <- total_france_score %>%
  filter(score_type == "serve_error" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of serve_error

france_score_serve_ace <- total_france_score %>%
  filter(score_type == "serve_ace" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of serve_ace

france_score_attack_zone1 <- total_france_score %>%
  filter(score_type == "attack_zone1" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of attack_zone1

france_score_attack_zone2 <- total_france_score %>%
  filter(score_type == "attack_zone2" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of attack_zone2

france_score_attack_zone3 <- total_france_score %>%
  filter(score_type == "attack_zone3" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of attack_zone3

france_score_attack_zone4 <- total_france_score %>%
  filter(score_type == "attack_zone4" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of attack_zone4

france_score_attack_zone5 <- total_france_score %>%
  filter(score_type == "attack_zone5" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of attack_zone5

france_score_attack_zone6 <- total_france_score %>%
  filter(score_type == "attack_zone6" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of attack_zone6

france_score_block_zone2 <- total_france_score %>%
  filter(score_type == "block_zone2" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of block_zone2

france_score_block_zone3 <- total_france_score %>%
  filter(score_type == "block_zone3" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of block_zone3

france_score_block_zone4 <- total_france_score %>%
  filter(score_type == "block_zone4" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of block_zone4

france_score_error_zone1 <- total_france_score %>%
  filter(score_type == "error_zone1" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of error_zone1

france_score_error_zone2 <- total_france_score %>%
  filter(score_type == "error_zone2" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of error_zone2

france_score_error_zone3 <- total_france_score %>%
  filter(score_type == "error_zone3" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of error_zone3

france_score_error_zone4 <- total_france_score %>%
  filter(score_type == "error_zone4" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of error_zone4

france_score_error_zone5 <- total_france_score %>%
  filter(score_type == "error_zone5" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of error_zone5

france_score_error_zone6 <- total_france_score %>%
  filter(score_type == "error_zone6" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of error_zone6




# Count Total Points Conceded by France (All Games)
total_france_conceded <- combined_data %>%
  filter(scoring_team != "France") %>%
  count(score_type, sort = TRUE)
# Output for this is first column = score_type and second column = frequency
# To access each individual score_type,
# use filter(score_type == "score_type" & !is.na(n)) %>%)

france_conceded_serve_ace <- total_france_conceded %>%
  filter(score_type == "serve_ace" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of service ace conceded by France

france_conceded_serve_error <- total_france_conceded %>%
  filter(score_type == "serve_error" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of service error by France

france_conceded_attack_zone1 <- total_france_conceded %>%
  filter(score_type == "attack_zone1" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone1 attacks by opponents

france_conceded_attack_zone2 <- total_france_conceded %>%
  filter(score_type == "attack_zone2" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone2 attacks by opponents

france_conceded_attack_zone3 <- total_france_conceded %>%
  filter(score_type == "attack_zone3" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone3 attacks by opponents

france_conceded_attack_zone4 <- total_france_conceded %>%
  filter(score_type == "attack_zone4" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone4 attacks by opponents

france_conceded_attack_zone5 <- total_france_conceded %>%
  filter(score_type == "attack_zone5" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone5 attacks by opponents

france_conceded_attack_zone6 <- total_france_conceded %>%
  filter(score_type == "attack_zone6" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone6 attacks by opponents

france_conceded_block_zone2 <- total_france_conceded %>%
  filter(score_type == "block_zone2" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone2 blocks by opponents

france_conceded_block_zone3 <- total_france_conceded %>%
  filter(score_type == "block_zone3" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone3 blocks by opponents

france_conceded_block_zone4 <- total_france_conceded %>%
  filter(score_type == "block_zone4" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone4 blocks by opponents

france_concede_error_zone1 <- total_france_conceded %>%
  filter(score_type == "error_zone1" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone1 errors by opponent (France pts)

france_concede_error_zone2 <- total_france_conceded %>%
  filter(score_type == "error_zone2" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone2 errors by opponent (France pts)

france_concede_error_zone3 <- total_france_conceded %>%
  filter(score_type == "error_zone3" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone3 errors by opponent (France pts)

france_concede_error_zone4 <- total_france_conceded %>%
  filter(score_type == "error_zone4" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone4 errors by opponent (France pts)

france_concede_error_zone5 <- total_france_conceded %>%
  filter(score_type == "error_zone5" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone5 errors by opponent (France pts)

france_concede_error_zone6 <- total_france_conceded %>%
  filter(score_type == "error_zone6" & !is.na(n)) %>%
  pull(n)
# Variable contains the right amount of zone6 errors by opponent (France pts)