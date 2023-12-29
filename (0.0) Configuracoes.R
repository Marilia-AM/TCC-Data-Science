# Configurando o diretório de trabalho
#
setwd("C:/Users/ADM/Downloads/TCC/Dados/Analise de Dados LBI T21")


# Atualização de pacotes
update.packages(checkBuilt=TRUE, ask=FALSE)

###############################################################################
#                                                                             #
####                       Instalando os pacotes                           ####
#              Só precisa fazer esse procedimento uma vez                     #
#                                                                             #
# https://www.youtube.com/watch?v=PO08u_oYScw&list=PLDoqBsM6cBJZa3uitQQZ2OP0VT-9ht2tT&index=3 #
# https://www.youtube.com/watch?v=WCavJTeAu5A&list=PLDoqBsM6cBJZa3uitQQZ2OP0VT-9ht2tT&index=5 #
###############################################################################

install.packages("tidyverse") ### Utilizaremos principalmente o dplyr 
#                                  (contém funções de manipulação/preparação
#                                  de BD)
install.packages("DescTools") ### Tools for Descriptive Statistics
install.packages("esquisse")  ### Explore and Visualize Your Data Interactively
install.packages("export")    ### Streamlined Export of Graphs and Data Tables
# install.packages("RVAdeMemoire") ### Testing and Plotting Procedures for Biostatistics
install.packages("aplpack") ### Plot Package
install.packages("ggplot2") ### system for declaratively creating graphics
install.packages("readxl") ### pacote de leitura em Excel
install.packages("summarytools") ### estatísticas descritivas

install.packages(classInt) # Estatística Descritiva - Variáveis Quantitativas
                           # Cria intervalos de classes

install.packages("classInt") ### Choose Univariate Class Intervals
install.packages("knitr") ### pacote para utilização do RMarkdown (algumas funcionalidades do R - aula MBA - data wrangling)
install.packages("fastDummies") ### Para criar variáveis dummies
install.packages("plotly")  ### making charts with Plotly's R graphing library

install.packages("dataMaid") # Cria relatórios automatizados
install.packages("dlookr")   ### Cria relatórios automatizados - Tools for Data Diagnosis, Exploration, Transformation
install.packages("gtsummary")### Presentation-Ready Data Summary and Analytic Result Tables

install.packages("writexl") ## para salvar arquivos em formato XLSX

install.packages("rmarkdown") ### Dynamic Documents for R
tinytex::install_tinytex() ### Helper Functions to Install and Maintain TeX Live and Complie LaTeX documents
install.packages("pagedown") ### Paginate the HTML Output of R Markdown with CSS for Print

install.packages("Hmisc") ### necessário para fazer o relatório do dlookr

library(tidyverse) 
library(DescTools)
library(esquisse)
library(export)
# library(RVAdeMemoire)
library(aplpack)
library(ggplot2)
library(readxl)
library(summarytools)

library(classInt)
library(dataMaid)


library(plotly)
library(gtsummary)

library(readr)

library(dlookr)
library(dplyr)
library(writexl)


library(rmarkdown)
library(pagedown)
library(fontawesome)

library(Hmisc)

# setTimeLimit(cpu = Inf, elapsed = Inf, transient = FALSE)
# fontawesome::fa_install()


# Para remover pacotes

# remove.packages("tidyverse") ### Utilizaremos principalmente o dplyr 
# #                                  (contém funções de manipulação/preparação
# #                                  de BD)
# remove.packages("plotly")  ### making charts with Plotly's R graphing library
# 
# remove.packages("DescTools")
# remove.packages("esquisse")
# remove.packages("export")
# # install.packages("RVAdeMemoire")
# remove.packages("aplpack") ### Plot Package
# remove.packages("ggplot2") ### system for declaratively creating graphics
# remove.packages("readxl") ### pacote de leitura em Excel
# remove.packages("summarytools")
# remove.packages("classInt")
# remove.packages("knitr") ### pacote para utilização do RMarkdown
# remove.packages("fastDummies") ### Para criar variáveis dummies
# remove.packages("dataMaid")
# remove.packages("dlookr")
# remove.packages("rmarkdown")
# remove.packages("pagedown")
# 
# remove.packages("gtsummary")



