setwd("./Bioinformatics_Incubtion_Data")


library(readxl)
library(ggplot2)
cbPalette <- c("#0073C299", "#EFC00099")

if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")

library(ggpubr)
#################################################################################
###########Introduction to Command line

data <- read_excel("Introduction to Commandline.xlsx")

Commandline<- ggplot(data, aes(x=Cohort, y=Scores, 
                       fill=factor(Season, levels = c("Pre-Internship", "Post-Internship")))) +
  geom_bar(stat="identity",position="dodge", width=0.5)+
  scale_fill_manual(values=cbPalette)+
  theme_classic()+
  labs(fill = "")+
  theme(legend.position = "none")+
  ggtitle("A.    Commandline")
  #theme(axis.line.x = element_line(color = "black"),axis.line.y = element_line(color = "black"),
        #panel.grid.major = element_blank(),axis.text.x = element_text(angle=45 ,hjust = 1))

Commandline + theme(text = element_text(size = 10), axis.title = element_text(size = 10))
Commandline

ggplot2::ggsave(filename = "Commandline.jpg",
                plot = Commandline, width = 5, height = 8, units = "in")



##########################################################################
#How comfortable are you with Git and GitHub

data <- read_excel("./How comfortable are you with Git and GitHub.xlsx")
Git<- ggplot(data, aes(x=Cohort, y=Scores, 
                       fill=factor(Season, levels = c("Pre-Internship", "Post-Internship")))) +
  geom_bar(stat="identity",position="dodge", width=0.5)+
  scale_fill_manual(values=cbPalette)+
  theme_classic()+
  labs(fill = "")+
  theme(legend.position = "none")+
  ggtitle("B.    Git and GitHub")
Git + theme(text = element_text(size = 10)) 

ggplot2::ggsave(filename = "Git.png",
                plot = Git, width = 5, height = 8, units = "in")


#############################################################################################################
######How comfortable are you with hpc and portability of work between local and hpc

data <- read_excel("./How comfortable are you with hpc and portability of work between local and hpc.xlsx")
hpc<- ggplot(data, aes(x=Cohort, y=Scores, 
                       fill=factor(Season, levels = c("Pre-Internship", "Post-Internship")))) +
  geom_bar(stat="identity",position="dodge", width=0.5)+
  scale_fill_manual(values=cbPalette)+
  theme_classic()+
  labs(fill = "")+
  theme(legend.position = "none")+
  ggtitle("A.    HPC")
hpc + theme(text = element_text(size = 10)) 

ggplot2::ggsave(filename = "hpc.png",
                plot = hpc, width = 5, height = 8, units = "in")



#############################################################################
#########How comfortable are you with python

data <- read_excel("./How comfortable are you with python.xlsx")
python<- ggplot(data, aes(x=Cohort, y=Scores, 
                          fill=factor(Season, levels = c("Pre-Internship", "Post-Internship")))) +
  geom_bar(stat="identity",position="dodge", width=0.5)+
  scale_fill_manual(values=cbPalette)+
  theme_classic()+
  labs(fill = "")+
  theme(legend.position = "none")+
  ggtitle("A.    Python")

ggplot2::ggsave(filename = "Python.png",
                plot = python, width = 5, height = 8, units = "in")


##############################################################################
#######How comfortable are you with R and R-markdown

data <- read_excel("./How comfortable are you with R and R-markdown.xlsx")
R<- ggplot(data, aes(x=Cohort, y=Scores, 
                     fill=factor(Season, levels = c("Pre-Internship", "Post-Internship")))) +
  geom_bar(stat="identity",position="dodge", width=0.5)+
  scale_fill_manual(values=cbPalette)+
  theme_classic()+
  labs(fill = "")+
  theme(legend.position = "none")+
  ggtitle("B.    R and Rmarkdown")
R + theme(text = element_text(size = 10)) 


ggplot2::ggsave(filename = "R.png",
                plot = R, width = 5, height = 8, units = "in")



################################################################################################

data <- read_excel("./How comfortable are you with scripting and building a pipeline.xlsx")
pipeline<- ggplot(data, aes(x=Cohort, y=Scores, 
                            fill=factor(Season, levels = c("Pre-Internship", "Post-Internship")))) +
  geom_bar(stat="identity",position="dodge", width=0.5)+
  scale_fill_manual(values=cbPalette)+
  theme_classic()+
  labs(fill = "Pipeline")+
  theme(legend.position = "none")+
  ggtitle("B.    Pipelines and Workflows")

pipeline + theme(text = element_text(size = 10))                    # All font sizes

pipeline

ggplot2::ggsave(filename = "Pipeline.png",
                plot = pipeline, width = 5, height = 8, units = "in")

#######
#####
#Arrange the plots
arrange <- ggarrange(Commandline + rremove("xlab"), Git + rremove("ylab") + rremove("xlab"),
          common.legend = TRUE, legend = "bottom")
ggsave("Fig3_Commandline_Git.png", arrange, width = 8, height = 3)

arrange <- ggarrange(hpc+ rremove("xlab"),pipeline+ rremove("xlab")+ rremove("ylab"),
          common.legend = TRUE, legend = "bottom")

ggsave("Fig4_hpc_pipeline.png", arrange, width = 8, height = 3)

arrange <- ggarrange(python+ rremove("xlab"), R+ rremove("xlab")+ rremove("ylab"),
          common.legend = TRUE, legend = "bottom")
ggsave("Fig5_python_R.png", arrange, width = 8, height = 3)

#plot_grid(Commandline, Git, hpc,pipeline, python, R, labels = "AUTO", scale = c(1, .9, .9, .7))
################################################################################
################################################################################
##Pie charts
colors_dutch <- c('#003C67FF','#8F7700FF','#3B3B3BFF',"#0073C2FF", "#EFC000FF",'#7AA6DCFF')
data <- read_excel("./Topics covered were relevant to me.xlsx")


topics <- ggplot(data, aes(x="", y=Scores, fill=Response)) +
  geom_bar(stat="identity", width=1) +
  scale_fill_manual(values=colors_dutch)+
  coord_polar("y", start=0) + theme_void()+
  ggtitle("A.   Topics were relevant")

topics + theme(text = element_text(size = 10))  

ggplot2::ggsave(filename = "Topics.png",
                plot = topics, width = 8, height = 5, units = "in")


data <- read_excel("./Content was organized and easy to follow.xlsx")

content <- ggplot(data, aes(x="", y=Scores, fill=Response)) +
  geom_bar(stat="identity", width=1) +
  scale_fill_manual(values=colors_dutch)+
  coord_polar("y", start=0) + theme_void()+
  ggtitle("B.   Content was organized")

content + theme(text = element_text(size = 10))  

ggplot2::ggsave(filename = "Content.png",
                plot = content, width = 8, height = 5, units = "in")


data <- read_excel("./Materials distributed were helpful.xlsx")

materials <- ggplot(data, aes(x="", y=Scores, fill=Response)) +
  geom_bar(stat="identity", width=1) +
  scale_fill_manual(values=colors_dutch)+
  coord_polar("y", start=0) + theme_void()+
  ggtitle("C.   Materials were helpful")

materials + theme(text = element_text(size = 10))  

ggplot2::ggsave(filename = "Materials.png",
                plot = materials, width = 8, height = 5, units = "in")


data <- read_excel("./The time allocated for the modules was sufficient.xlsx")

time <- ggplot(data, aes(x="", y=Scores, fill=Response)) +
  geom_bar(stat="identity", width=1) +
  scale_fill_manual(values=colors_dutch)+
  coord_polar("y", start=0) + theme_void()+
  ggtitle("D.    The time sufficient")

time + theme(text = element_text(size = 10))  

ggplot2::ggsave(filename = "Time.png",
                plot = time, width = 8, height = 5, units = "in")

arrange <- ggarrange(topics, content,time, materials, common.legend = TRUE, legend = "bottom")
arrange
ggsave("review.png", arrange, width = 6, height = 4)


