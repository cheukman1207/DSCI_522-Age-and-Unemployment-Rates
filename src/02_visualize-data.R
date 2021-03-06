#! /usr/bin/env Rscript
# 02_visualize-data.R
# Hayley Boyce
# Simon Chiu
# November 22, 2018

# PURPOSE: This script takes the clean dataset and creates exploratory visualizations
# for target audiences.
#
# METHOD: This script takes 2 arguments: one taking the clean data
#         (unemployment-age-gender-countries-filtered-clean.csv) and the other naming the
#         directory for the newly created figures
#
# OUTPUTS: histrogram.png, violin.png, mean-CI.png
#
# USAGE: Rscript 02_visualize-data.R
#
# RECOMMENDED:  bash Rscript src/02_visualize-data.R
#                            data/unemployment-age-gender-countries-filtered-clean.csv
#                            img/


suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(ggplot2))

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
out_pic_dir <- args[2]


# define main function
main <- function(){

  # read in data
  clean_unemployment <- read.csv(input_file)

  #Create histogram
  histo <- clean_unemployment %>%
    ggplot(aes(x = Value)) +
    geom_histogram(bins = 20, color = "white", fill = "turquoise" ) +
    xlim(0, 70) +
    #ylim(0, 420) +
    xlab("Unemployment Rate (%)") +
    ylab("Number of Observation") +
    ggtitle("The Distribution of Unemployment Rates by Age Group") +
    theme_bw() +
    theme(panel.background = element_rect(fill = "white", colour = "white"),
          strip.background =element_rect(fill="white"),
          plot.title = element_text(size = 13, face = "bold"),
          strip.text = element_text(size = 11, face = "bold")) +
    facet_grid(. ~ Age.Group)

  #Create Violin plot
  violin <- clean_unemployment %>%
    ggplot(aes(y = Value, x = Age.Group)) +
    geom_violin(adjust = 2, color = "lightblue3", fill = "lightblue") +
    geom_jitter(size = 0.15, color = "cornflowerblue", alpha = 0.6) +
    theme_bw() +
    xlab("Age Group") +
    ylab("Unemployment Rate (%)") +
    ggtitle("The Distribution of Unemployment Rates") +
    theme(plot.title = element_text(size = 11, face = "bold"))

  #Create the mean/95% confidence interval plot (Part 1 and 2)
    #Part 1 - Group data by age group
    clean_unemployment_Age_gped <- clean_unemployment %>%
    group_by(Age.Group) %>%
    summarize(mean = mean(Value),
              n    = length(Value),
              se   = sd(Value) / sqrt(n))

  #Part 2 - make the chart
  mean_CI_plot <- clean_unemployment_Age_gped %>%
    ggplot() +
    geom_point(aes(y = mean, x = Age.Group), colour = "royalblue2") +
    geom_errorbar(aes(ymin = mean + qnorm(0.05/2)*se,
                      ymax = mean - qnorm(0.05/2)*se,
                      x    = Age.Group),
                  colour = "slateblue4",
                  width  = 0.6)+
    theme_bw() +
    xlab("Age Group") +
    ylab("Average Unemployment Rate (%)") +
    ggtitle("95% Confidence Intervals of the Average Unemployment Rates") +
    theme(plot.title = element_text(size = 9, face = "bold"))

  #Save the charts
  ggsave("histrogram.png", plot = histo, path = out_pic_dir,
         width = 6, height = 4)

  ggsave("violin.png", plot = violin, path = out_pic_dir,
         width = 4.5, height = 4.5)

  ggsave("mean-CI.png", plot = mean_CI_plot, path = out_pic_dir,
         width = 4.5, height = 4.5)
}

# call main function
main()
