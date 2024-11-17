


output/data1.rds: code/data1.R dataset/studentPerformanceFactors.csv
	Rscript code/data1.R


output/lm_model.rds: code/lm_model.R	dataset/StudentPerformanceFactors.csv
	Rscript	code/lm_model.R


output/scatter_plot.png: code/create_plot.R	dataset/StudentPerformanceFactors.csv	output/lm_model.rds
	Rscript	code/create_plot.R


output/residual_plot.png: code/residual_plot.R dataset/StudentPerformanceFactors.csv	output/lm_model.rds
	Rscript	code/residual_plot.R


report.html: output/data1.rds output/lm_model.rds output/scatter_plot.png output/residual_plot.png report.Rmd
	Rscript -e "rmarkdown::render(input = 'report.Rmd', output_file = 'report.html', output_dir = 'D:/550/final project')"