here::i_am("report.Rmd")
data <- read.csv(
  file = here::here("dataset","StudentPerformanceFactors.csv"))
head(data)
fit_model<-lm(Exam_Score~Hours_Studied+Attendance+Sleep_Hours,data=data)
saveRDS(fit_model, file = "output/lm_model.rds")