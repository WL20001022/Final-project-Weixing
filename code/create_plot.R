here::i_am("report.Rmd")

data <- read.csv(
  file = here::here("dataset","StudentPerformanceFactors.csv"))
head(data)

library(ggplot2)

plot_path <- "output/scatter_plot.png"  


png(filename = plot_path, width = 800, height = 600)  
ggplot(data, aes(x = Hours_Studied, y = Exam_Score)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(
    title = "Relationship between Hours Studied and Exam Score",
    x = "Hours Studied",
    y = "Exam Score"
  ) +
  theme_minimal()
dev.off()

