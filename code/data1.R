#setwd("D:\\550\\final project")
here::i_am("report.Rmd")

data <- read.csv(
  file = here::here("dataset","StudentPerformanceFactors.csv"))
head(data)

library(labelled)
library(gtsummary)

var_label(data) <- list(
  Exam_Score = "Exam score",
  Hours_Studied = "Study hours",
  Attendance = "Attendance",
  Sleep_Hours = "Sleep hours"
)
data1<-data%>%select(Exam_Score, Hours_Studied, Attendance, Sleep_Hours)

saveRDS(data1, "output/data1.rds")


