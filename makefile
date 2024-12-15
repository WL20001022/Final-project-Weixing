.PHONY: docker-build
docker-build:
	@echo "Building Docker image"
	docker build -t weixing1022/my-rstudio-image .

.PHONY: docker-run
docker-run:
	@echo "Running the Docker container with an empty report directory"
	# Ensure the report directory is empty before running
	mkdir -p report
	# Run the Docker container and mount the empty report directory
	docker run --rm \
	-v "$(PWD)/report:/home/rstudio/project/report" \
	-v "$(PWD)/output:/home/rstudio/project/output" \
	-v "$(PWD)/dataset:/home/rstudio/project/dataset" \
	-p 8787:8787 weixing1022/my-rstudio-image \
	Rscript -e "rmarkdown::render(input = '/home/rstudio/project/report.Rmd', output_file = '/home/rstudio/project/report/report.html')"

# Generate data1.rds file
output/data1.rds: code/data1.R dataset/StudentPerformanceFactors.csv
	Rscript code/data1.R

# Generate lm_model.rds file
output/lm_model.rds: code/lm_model.R dataset/StudentPerformanceFactors.csv
	Rscript code/lm_model.R

# Create the scatter plot
output/scatter_plot.png: code/create_plot.R dataset/StudentPerformanceFactors.csv output/lm_model.rds
	Rscript code/create_plot.R

# Create the residual plot
output/residual_plot.png: code/residual_plot.R dataset/StudentPerformanceFactors.csv output/lm_model.rds
	Rscript code/residual_plot.R

report.html: output/data1.rds output/lm_model.rds output/scatter_plot.png output/residual_plot.png report.Rmd
	Rscript -e "rmarkdown::render(input = 'report.Rmd', output_file = 'report.html')"
# Clean up or remove any generated files if needed
clean:
	rm -rf output/*
