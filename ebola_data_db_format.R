#Author: José Jaime Comé
#Date: September 23, 2021
#Dataset: https://data.world/brianray/ebola-cases/workspace/file?filename=ebola_data_db_format.csv

library(tidyr)
dr <- "C:/Path" # configure local path for downloaded csv file.
df <- read.csv(paste(dr,"/ebola_data_db_format.csv",sep=""), header = TRUE,stringsAsFactors=FALSE,na.strings="")
#Columns names
names(df)
#Columns and types
sapply(df, class)
#Number of rows
nrow(df)
#Print first row
head(df, 1)
#Creating column for Year, Month and Day
df$Year <- substr(df$Date, 1, 4)
df$Month <- substr(df$Date, 6, 7)
df$Day <- substr(df$Date, 9, 10)
df$Year_mth <- paste(substr(df$Date, 1, 4), "-", substr(df$Date, 6, 7), sep="")
#Print first row
head(df, 1)

df$Indicator2 <- as.character(NA)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Cumulative number of confirmed, probable and suspected Ebola cases","cum_n_conf_prob_susp_eb", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Cumulative number of confirmed Ebola cases","cum_n_conf_eb", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Cumulative number of probable Ebola cases","cum_n_prob_eb", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Cumulative number of suspected Ebola cases","cum_n_susp_eb", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Cumulative number of confirmed, probable and suspected Ebola deaths","cum_n_conf_prob_susp_eb_dth", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Cumulative number of confirmed Ebola deaths","cum_n_conf_dth", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Cumulative number of probable Ebola deaths","cum_n_prob_eb_dth", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Cumulative number of suspected Ebola deaths","cum_n_susp_eb_dth", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Number of confirmed Ebola cases in the last 21 days","n_conf_eb_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Number of confirmed, probable and suspected Ebola cases in the last 21 days","n_conf_prob_susp_eb_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Number of probable Ebola cases in the last 21 days","n_prob_eb_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Number of confirmed Ebola cases in the last 7 days","n_conf_eb_lst_7d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Number of probable Ebola cases in the last 7 days","n_prob_eb_lst_7d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Number of suspected Ebola cases in the last 7 days","n_susp_eb_lst_7d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Number of confirmed, probable and suspected Ebola cases in the last 7 days","n_conf_prob_susp_eb_lst_7d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Proportion of confirmed Ebola cases that are from the last 7 days","prop_conf_eb_lst_7d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Proportion of probable Ebola cases that are from the last 7 days","prop_prob_eb_lst_7d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Proportion of suspected Ebola cases that are from the last 7 days","prop_susp_eb_lst_7d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Proportion of confirmed, probable and suspected Ebola cases that are from the last 7 days","prop_conf_prob_susp_eb_lst_7d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Number of suspected Ebola cases in the last 21 days","n_susp_eb_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Proportion of confirmed Ebola cases that are from the last 21 days","prop_conf_eb_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Proportion of probable Ebola cases that are from the last 21 days","prop_prob_eb_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Proportion of suspected Ebola cases that are from the last 21 days","prop_susp_eb_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Proportion of confirmed, probable and suspected Ebola cases that are from the last 21 days","prop_conf_prob_susp_eb_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Case fatality rate (CFR) of confirmed Ebola cases","cfr_conf_eb_cs", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Case fatality rate (CFR) of probable Ebola cases","cfr_prob_eb_cs", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Case fatality rate (CFR) of suspected Ebola cases","cfr_susp_eb_cs", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Case fatality rate (CFR) of confirmed, probable and suspected Ebola cases","cfr_conf_prob_susp_eb_cs", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Number of confirmed Ebola deaths in the last 21 days","n_conf_dth_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Number of probable Ebola deaths in the last 21 days","n_prob_dth_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Number of suspected Ebola deaths in the last 21 days","n_susp_dth_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Number of confirmed, probable and suspected Ebola deaths in the last 21 days","n_conf_prob_susp_dth_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Proportion of confirmed Ebola deaths that are from the last 21 days","prop_conf_dth_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Proportion of probable Ebola deaths that are from the last 21 days","prop_prob_dth_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Proportion of suspected Ebola deaths that are from the last 21 days","prop_susp_dth_lst_21d", df$Indicator2)
df$Indicator2 <- ifelse(!is.na(df$Indicator) & df$Indicator == "Proportion of confirmed, probable and suspected Ebola deaths that are from the last 21 days","prop_conf_prob_susp_dth_lst_21d", df$Indicator2)

#Expanding
df <- as.data.frame(df %>% pivot_wider(names_from = Indicator2, values_from = value))

#Mean of confirmed CFR(Case fatality rate)
mean(df[!is.na(df$cfr_conf_eb_cs),"cfr_conf_eb_cs"])

#Commulative cases by Year_month
aggregate(df$cum_n_conf_eb, by=list(Category=df$Year_mth), FUN=sum,na.rm=TRUE)
