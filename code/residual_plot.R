here::i_am("code/residual_plot.R")

data <- read.csv(
  file = here::here("dataset","StudentPerformanceFactors.csv"))
fit_model<-readRDS(file = here::here("output", "lm_model.rds"))
library(ggplot2)

plot_path <- "output/residual_plot.png" 
png(filename = plot_path, width = 800, height = 600)  
ggplot(fit_model, aes(.fitted, .resid)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(
    title = "Residual Plot",
    x = "Fitted Values",
    y = "Residuals"
  ) +
  theme_minimal()
dev.off()

