
# 1.使用R中的数据读写，文件路径，for循环语句，读入路径“/assignment_idaccuracy/Aminer”总的所有文件，并将数据合并成为一个data.frame输出。
# 要求data.frame中至少要包括论文的doi号，发表年份，杂志，标题；
library("readr") 
aminer <- data.frame()
path <- "assignment_idaccuracy/Aminer/"
for (f in dir(path)){
  file <- read.csv(paste(path,f,sep=''), header = TRUE)
  aminer <- rbind(aminer,file)
}
write.csv(aminer,file="aminer.csv")


# 2.使用apply家族函数替代上述步骤中的for循环
library(dplyr)
path <- "assignment_idaccuracy/Aminer/"
filenames <- list.files(path, 
                        pattern="*.csv", 
                        full.names=TRUE)
filenames %>% lapply(read.csv) %>% bind_rows -> aminer
write.csv(aminer,file="aminer.csv")


# 3.将2中代码封装成为一个可以在命令行运行的脚本，脚本的唯一一个参数为aminer论文文件所在的路径。
#! /usr/bin/env Rscript
library(dplyr)
args = commandArgs(T)
path = args[1]
filenames <- list.files(path, pattern="*.csv", full.names=TRUE)
filenames %>% lapply(read.csv) %>% bind_rows -> aminer
write.csv(aminer,file="aminer.csv")


