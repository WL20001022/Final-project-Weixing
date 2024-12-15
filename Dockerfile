# 使用 rocker/r-ver 镜像作为基础镜像
FROM rocker/r-ver:4.2.0

# 安装必要的系统依赖
RUN apt-get update && apt-get install -y \
  libcurl4-openssl-dev \
  libssl-dev \
  libxml2-dev

# 安装 renv 包
RUN R -e "install.packages('renv', repos='https://cran.rstudio.com')"

# 设置工作目录
WORKDIR /home/rstudio/project

# 复制 renv.lock 和 .Rprofile 文件到容器中
COPY renv.lock /home/rstudio/project/renv/renv.lock
COPY .Rprofile /home/rstudio/project/.Rprofile

# 如果 activate.R 文件存在，复制它
COPY renv/activate.R /home/rstudio/project/renv/activate.R

# 安装 renv 环境
RUN R -e "renv::restore()"

# 创建项目所需的目录
RUN mkdir -p /home/rstudio/project/{code,dataset,output,final_report}

# 复制项目中的文件到容器中
COPY code /home/rstudio/project/code
COPY dataset /home/rstudio/project/dataset
COPY report.Rmd /home/rstudio/project/report.Rmd
COPY makefile /home/rstudio/project/makefile
COPY README.md /home/rstudio/project/README.md

# 曝露 RStudio 端口
EXPOSE 8787

# 设置 RStudio 的密码环境变量
ENV PASSWORD=rstudio

# 启动 RStudio Server
CMD ["/init"]

