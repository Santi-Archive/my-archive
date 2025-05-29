library(readr)
library(dplyr)
library(purrr)
library(tidyr)
library(ggplot2)

data1 <- read_csv("FinalProject/France/2024_VNL_BUL_vs_FRA.csv")
data2 <- read_csv("FinalProject/France/2024_VNL_SLO_vs_FRA.csv")
data3 <- read_csv("FinalProject/France/2024_VNL_FRA_vs_USA.csv")
data4 <- read_csv("FinalProject/France/2024_VNL_TUR_vs_FRA.csv")
data5 <- read_csv("FinalProject/France/2024_VNL_FRA_vs_ITA.csv")
data6 <- read_csv("FinalProject/France/2024_VNL_FRA_vs_NED.csv")

combined_data <- bind_rows(data1, data2, data3, data4, data5, data6)

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

france_zonedistribution_data <- data.frame(
    category = c("Zone 1", "Zone 2", "Zone 3", "Zone 4", "Zone 6"), #nolint
    count = c(france_scores$attack_zone1, france_scores$attack_zone2,
            france_scores$attack_zone3, france_scores$attack_zone4, #nolint
            france_scores$attack_zone6)
)
france_zonedistribution_data$label <- france_zonedistribution_data$count
# Distribution of France attack in zone 1 to 6
france_zone_distribution <- ggplot(france_zonedistribution_data, aes(x = "", y = count, fill = category)) + #nolint
    geom_bar(stat = "identity", width = 1) + coord_polar(theta = "y") + geom_text(aes(label = label), #nolint
    position = position_stack(vjust = 0.5), color = "black", size = 4) + theme_void() + #nolint
    theme(legend.title = element_blank()) + theme(plot.background = element_rect(fill = "white", color = "white")) #nolint

ggsave("plot_zone.png", plot = france_zone_distribution, width = 6, height = 4, dpi = 300) #nolint


france_blockdistribution_data <- data.frame(
    category = c("Zone 2", "Zone 3", "Zone 4"), #nolint
    count = c(france_scores$block_zone2, france_scores$block_zone3,
            france_scores$block_zone4) #nolint
)
france_blockdistribution_data$label <- france_blockdistribution_data$count
# Distribution of France block in zone 2 to 4
france_block_distribution <- ggplot(france_blockdistribution_data, aes(x = "", y = count, fill = category)) + #nolint
    geom_bar(stat = "identity", width = 1) + coord_polar(theta = "y") + geom_text(aes(label = label), #nolint
    position = position_stack(vjust = 0.5), color = "black", size = 4) + theme_void() + #nolint
    theme(legend.title = element_blank()) + theme(plot.background = element_rect(fill = "white", color = "white")) #nolint

ggsave("plot_block.png", plot = france_block_distribution, width = 6, height = 4, dpi = 300) #nolint



total_attacks_france <- france_scores$attack_zone1 + france_scores$attack_zone2 + france_scores$attack_zone3 + #nolint
                        france_scores$attack_zone4 + france_scores$attack_zone6 #nolint
total_blocks_france <-  france_scores$block_zone2 + france_scores$block_zone3 + france_scores$block_zone4 #nolint
total_serve_ace_france <- france_scores$serve_ace
total_serve_error_france <- france_scores$serve_error
total_opponent_error_france <-  france_scores$error_zone1 + france_scores$error_zone2 + france_scores$error_zone3 + #nolint
                                france_scores$error_zone4 + france_scores$error_zone5 + france_scores$error_zone6 #nolint
total_other_error_france <- france_scores$error_net_touch + france_scores$error_double_touch + france_scores$error_foot_fault + #nolint
                            france_scores$error_illegal_attack #nolint

# Distribution of all points scored by France
france_total_distribution_data <- data.frame(
    category = c("Attacks", "Blocks", "Service Ace", "Opponent Service Error", "Opponent Attack Error", "Other Opponent Error"), #nolint
    count = c(total_attacks_france, total_blocks_france, total_serve_ace_france, total_serve_error_france, #nolint
            total_opponent_error_france, total_other_error_france) #nolint
)
france_total_distribution_data$label <- france_total_distribution_data$count

france_total_points <- ggplot(france_total_distribution_data, aes(x = "", y = count, fill = category)) + #nolint
    geom_bar(stat = "identity", width = 1) + coord_polar(theta = "y") + geom_text(aes(label = label), position = position_stack(vjust = 0.5), color = "black", size = 4) + theme_void() + theme(legend.title = element_blank()) + theme(plot.background = element_rect(fill = "white", color = "white")) #nolint
ggsave("plot_total_france.png", plot = france_total_points, width = 6, height = 4, dpi = 300) #nolint



france_opponent_error_data <- data.frame(
    category = c("Error Zone 1", "Error Zone 2", "Error Zone 3", "Error Zone 4", #nolint
                "Error Zone 5", "Error Zone 6", "Service Error", "Error Net Touch", #nolint
                "Error Double Touch", "Error Foot Fault", "Error Illegal Attack"), #nolint
    count = c(france_scores$error_zone1, france_scores$error_zone2, france_scores$error_zone3, #nolint
            france_scores$error_zone4, france_scores$error_zone5, france_scores$error_zone6, #nolint
            france_scores$serve_error, france_scores$error_net_touch, france_scores$error_double_touch, #nolint
            france_scores$error_foot_fault, france_scores$error_illegal_attack)
)
france_opponent_error_data$label <- france_opponent_error_data$count

france_opponent_error <- ggplot(france_opponent_error_data, aes(x = "", y = count, fill = category)) + #nolint
    geom_bar(stat = "identity", width = 1) + coord_polar(theta = "y") + geom_text(aes(label = label), position = position_stack(vjust = 0.5), color = "black", size = 4) + theme_void() + theme(legend.title = element_blank()) + theme(plot.background = element_rect(fill = "white", color = "white")) #nolint
ggsave("plot_total_error.png", plot = france_opponent_error, width = 6, height = 4, dpi = 300) #nolint


conceded_attacks_france <-  opponent_scores$attack_zone1 + opponent_scores$attack_zone2 + opponent_scores$attack_zone3 + #nolint
                            opponent_scores$attack_zone4 + opponent_scores$attack_zone6 #nolint
conceded_blocks_france <-   opponent_scores$block_zone2 + opponent_scores$block_zone3 + opponent_scores$block_zone4 #nolint
conceded_serve_ace_france <- opponent_scores$serve_ace
conceded_serve_error_france <- opponent_scores$serve_error
conceded_opponent_error_france <- opponent_scores$error_zone1 + opponent_scores$error_zone2 + opponent_scores$error_zone3 + #nolint
                                opponent_scores$error_zone4 + opponent_scores$error_zone6 #nolint
conceded_other_errors_france <- opponent_scores$error_net_touch + opponent_scores$error_receive #nolint

opp_total_distribution_data <- data.frame(
    category = c("Attacks", "Blocks", "Service Ace", "Opponent Service Error", "Opponent Attack Error", "Other Opponent Error"), #nolint
    count = c(conceded_attacks_france, conceded_blocks_france, conceded_serve_ace_france, conceded_serve_error_france, conceded_opponent_error_france, conceded_other_errors_france) #nolint
)
opp_total_distribution_data$label <- opp_total_distribution_data$count

opp_total_distribution <- ggplot(opp_total_distribution_data, aes(x = "", y = count, fill = category)) + #nolint
    geom_bar(stat = "identity", width = 1) + coord_polar(theta = "y") + geom_text(aes(label = label), position = position_stack(vjust = 0.5), color = "black", size = 4) + theme_void() + theme(legend.title = element_blank()) + theme(plot.background = element_rect(fill = "white", color = "white")) #nolint
ggsave("plot_total_opponent.png", plot = opp_total_distribution, width = 6, height = 4, dpi = 300) #nolint


opp_zonedistribution_data <- data.frame(
    category = c("Zone 1", "Zone 2", "Zone 3", "Zone 4", "Zone 5", "Zone 6"), #nolint
    count = c(opponent_scores$attack_zone1, opponent_scores$attack_zone2, opponent_scores$attack_zone3, #nolint
            opponent_scores$attack_zone4, opponent_scores$attack_zone5, opponent_scores$attack_zone6) #nolint
)
opp_zonedistribution_data$label <- opp_zonedistribution_data$count

opp_zone_distribution <- ggplot(opp_zonedistribution_data, aes(x = "", y = count, fill = category)) + #nolint
    geom_bar(stat = "identity", width = 1) + coord_polar(theta = "y") + geom_text(aes(label = label), position = position_stack(vjust = 0.5), color = "black", size = 4) + theme_void() + theme(legend.title = element_blank()) + theme(plot.background = element_rect(fill = "white", color = "white")) #nolint
ggsave("plot_opp_zone.png", plot = opp_zone_distribution, width = 6, height = 4, dpi = 300) #nolint

opp_blockdistributiondata <- data.frame(
    category = c("Zone 2", "Zone 3", "Zone 4"), #nolint
    count = c(opponent_scores$block_zone2, opponent_scores$block_zone3, opponent_scores$block_zone4) #nolint
)
opp_blockdistributiondata$label <- opp_blockdistributiondata$count

opp_block_distribution <- ggplot(opp_blockdistributiondata, aes(x = "", y = count, fill = category)) + #nolint
    geom_bar(stat = "identity", width = 1) + coord_polar(theta = "y") + geom_text(aes(label = label), position = position_stack(vjust = 0.5), color = "black", size = 4) + theme_void() + theme(legend.title = element_blank()) + theme(plot.background = element_rect(fill = "white", color = "white")) #nolint
ggsave("plot_opp_block.png", plot = opp_block_distribution, width = 6, height = 4, dpi = 300) #nolint


opponent_france_error_data <- data.frame(
    category = c("Error Zone 1", "Error Zone 2", "Error Zone 3", "Error Zone 4", #nolint
                "Error Zone 6", "Service Error", "Error Net Touch"), #nolint
    count = c(opponent_scores$error_zone1, opponent_scores$error_zone2, opponent_scores$error_zone3, #nolint
            opponent_scores$error_zone4, opponent_scores$error_zone6, opponent_scores$serve_error, opponent_scores$error_net_touch) #nolint
)
opponent_france_error_data$label <- opponent_france_error_data$count

opp_error_distribution <- ggplot(opponent_france_error_data, aes(x = "", y = count, fill = category)) + #nolint
    geom_bar(stat = "identity", width = 1) + coord_polar(theta = "y") + geom_text(aes(label = label), position = position_stack(vjust = 0.5), color = "black", size = 4) + theme_void() + theme(legend.title = element_blank()) + theme(plot.background = element_rect(fill = "white", color = "white")) #nolint
ggsave("plot_opp_error.png", plot = opp_error_distribution, width = 6, height = 4, dpi = 300) #nolint



# Top Scorer Breakdown
france_total_points <- combined_data %>%
  filter(scoring_team == "France", !is.na(player_score)) %>%
  count(player_score, name = "points") %>%
  mutate(percentage = round(100 * points / sum(points), 1))

bar_plot <- ggplot(france_total_points, aes(x = reorder(player_score, -percentage), y = percentage, fill = player_score)) + #nolint
  geom_col() +
  geom_text(aes(label = paste0(percentage, "%")), vjust = -0.5, size = 3) +
  labs(
    title = "Total Points Contribution by France Players",
    x = "Player",
    y = "Percentage of Team's Total Points",
    fill = "Player"
  ) +
  theme_minimal()

ggsave("france_player_total_points_bar.png", plot = bar_plot, width = 10, height = 6, dpi = 300, bg = "white") #nolint

# Score Breakdown Per Zone
attack_data <- combined_data %>% filter(scoring_team == "France", grepl("attack_zone", score_type)) #nolint

zone_player_counts <- attack_data %>% group_by(score_type, player_score) %>% summarise(points = n(), .groups = "drop") #nolint

zone_distribution <- zone_player_counts %>% group_by(score_type) %>% mutate(percentage = points / sum(points) * 100) #nolint

zone_plot <- ggplot(zone_distribution, aes(x = score_type, y = percentage, fill = player_score)) + #nolint
  geom_col(position = "stack") +
  geom_text(aes(label = paste0(round(percentage, 1), "%")), 
            position = position_stack(vjust = 0.5), 
            color = "white", size = 3) +
  labs(title = "Zone-wise Scoring Breakdown by Player (France)",
       x = "Attack Zone",
       y = "Percentage of Points",
       fill = "Player") +
  theme_minimal()

ggsave("zone_player_distribution_labeled.png", plot = zone_plot, 
       width = 10, height = 6, dpi = 300, bg = "white")

france_data <- combined_data %>%
  filter(scoring_team == "France")

last_5_points_france <- france_data %>%
  group_by(match_id, set) %>%
  arrange(set, rally_number) %>%
  mutate(point_position = n() - row_number() + 1) %>%
  filter(point_position <= 5)

head(last_5_points_france)

score_type_analysis <- last_5_points_france %>%
  count(score_type) %>%
  arrange(desc(n))

print(score_type_analysis)

ggplot(score_type_analysis, aes(x = reorder(score_type, -n), y = n, fill = score_type)) + #nolint
  geom_col() +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +
  labs(
    title = "Score Type Breakdown for France's Last 5 Points of Each Set",
    x = "Score Type",
    y = "Frequency of Score Type",
    fill = "Score Type"
  ) +
  theme_minimal()

ggsave("france_last_5_points_score_type_analysis.png", width = 8, height = 6, dpi = 300, bg = "white") #nolint
