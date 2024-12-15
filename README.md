
# Project: Student Performance Factors Analysis

## Overview

This report analyzes a dataset on student performance factors, aiming to understand the relationship between various factors like exam scores, study hours, attendance, and sleep hours. The dataset `"StudentPerformanceFactors.csv"` includes the following factors:
- Exam scores (integer)
- Study hours (integer)
- Attendance (integer)
- Sleep hours (integer)

The goal is to identify which factors significantly impact student performance and provide descriptive insights into the data.

## Project Directory Structure

- **code**: Contains R scripts for data processing, modeling, and plot generation.
- **dataset**: Contains the raw data (`StudentPerformanceFactors.csv`).
- **output**: Contains the generated files (e.g., models, plots, and the final report).
- **renv**: Contains the environment configuration for package dependencies.
- **report.Rmd**: The Rmarkdown file to generate the final report.

## How to Set Up the Project

### Step 1: Clone the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/WL20001022/Final-project-Weixing.git
```

Navigate to the project directory:

```bash
cd Final-project-Weixing
```

### Step 2: Build the Docker Image

build the Docker image:

```bash
make docker-build
```

This command will build the Docker image 

### Step 3: Run the Docker Container

To generate the report using the Docker container, execute the following command:

```bash
make docker-run
```



