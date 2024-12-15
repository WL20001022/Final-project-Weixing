.PHONY: docker-build
docker-build:
	@echo "Building Docker image"
	docker build -t weixing1022/my-rstudio-image .

.PHONY: docker-run
docker-run -v "/$$(pwd)"/report:/project/report weixing1022/my-rstudio-image
	@echo "Running the Docker container with an empty report directory"
	# Ensure the report directory is empty before running
	mkdir -p report
	# Run the Docker container and mount the empty report directory
	docker run -v"/$$(pdw)"/
# Install dependencies (this is the missing install step)
.PHONY: install
install:
	@echo "Restoring R environment from renv.lock"
	Rscript -e "renv::restore()"

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

# Generate report.html
report.html: output/data1.rds output/lm_model.rds output/scatter_plot.png output/residual_plot.png report.Rmd
	Rscript -e "rmarkdown::render(input = 'report.Rmd', output_file = 'report.html')"

