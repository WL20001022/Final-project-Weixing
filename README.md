
---

# Project: Student Performance Analysis

This report analyzes a dataset on student performance factors, aiming to understand the relationship between various factors like exam scores, study hours, attendance, and sleep hours. The dataset "StudentPerformanceFactors.csv" includes the following factors:

- **exam scores**: Integer
- **study hours**: Integer
- **attendance**: Integer
- **sleep hours**: Integer

The goal is to identify which factors significantly impact student performance and to provide descriptive insights into the data.

## Code Structure

- **code/data1.R**: Reads the raw dataset and creates a dataset for `table1`.
- **code/create_plot.R**: Creates a scatter plot showing the relationship between hours studied and exam scores and saves it as `scatter_plot.png` in the `output/` folder.
- **code/lm_model.R**: Fits a linear model to understand the effect of different factors on exam scores and saves it as `lm_model.rds` in the `output/` folder.
- **code/residual_plot.R**: Creates a residual plot to see the performance of the linear model and saves the plot as `residual_plot.png` in the `output/` folder.
- **report.Rmd**: Generates the final report in HTML format.

## How to Run the Project in Docker

To use this project in a Docker container, follow these steps:

### 1. Clone the Repository
Clone this repository to your local machine using Git:

```
git clone git@github.com:WL20001022/Final-project-Weixing.git

```

### 2. Navigate to the Project Directory
Change to the directory where the project is located:

```
cd Final-project-Weixing

```

### 3. Build the Docker Image
Run the following command to build the Docker image:

```
docker build -t my-rstudio-image .
```

### 4. Run the Docker Container
Use the following command to run the Docker container:

```
docker run -e PASSWORD=my_secure_password -p 8787:8787 my-rstudio-image
```

- `-e PASSWORD=my_secure_password`: Sets the password for accessing RStudio inside the container.
- `-p 8787:8787`: Maps port 8787 from the container to port 8787 on your local machine.
- `my-rstudio-image`: This is the image name you built in the previous step.

### 5. Access RStudio
Once the container is running, open your web browser and go to `http://localhost:8787`. You will be prompted to log in. Use the password you set earlier (`my_secure_password`).

### 6. Set the Working Directory
Once inside RStudio, open the **Console** and run the following command to set the working directory to your project folder:

```
setwd("/home/rstudio/project")
```

This ensures that the R scripts can correctly access your project files.

### 7. Install Dependencies
In the **Terminal** window inside RStudio, run the following command to install the necessary R packages:

```
make install
```

This command will use the `renv::restore()` function to install all the required packages as listed in the `renv.lock` file.

### 8. Generate the Report
To generate the report, run the following command in the **Terminal**:

```
make report.html
```

This will render the `report.Rmd` file to `report.html`.

### 9. Adjust File Permissions (If Necessary)
If you encounter any issues with file permissions, you may need to adjust the permissions on the project directory. To do so, run the following commands in the **Terminal**:

```
sudo chmod -R 777 /home/rstudio/project
sudo chown -R rstudio:rstudio /home/rstudio/project
```

These commands give full read/write/execute permissions to the `project` folder and change the ownership to the `rstudio` user.

---
