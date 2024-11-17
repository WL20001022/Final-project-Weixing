This report analyzes a dataset on student performance factors, aiming to understand the relationship between various factors like exam scores, study hours, attendance, and sleep hours.The dataset"StudentPerformanceFactors.csv" includes the factors mentioned(exam scores:integer.study hours:integer.attendance:integer.sleep hours:integer). The goal is to identify which factors significantly impact student performance and to provide descriptive insights into the data.

CODE STRUCTURE

code/data1 :
reads in the raw dataset and creat a dataset for table1

code/create_plot.R
create a scatter plot shows a  relationship between hours studied and exam scores
save the plot as scatter_plot in output/ folder

code/lm_model.R
fit a lm model to understand the effect of different factors on exam scores. and save it as lm_model.rds in output/folder


code/residual_plot.R
create residual plot to see the performance of lm model
save the plot as residual_plot in output/ folder

report.Rmd
produce the final report
The Makefile, Rmarkdown (report.Rmd), and HTML report will be in the root directory of the project. The Rmarkdown will contain the tables and figures produced in the analysis.