###############################################################################
#                                                                             #
#                                                                             #
###                                                                          ##
###                             LBI - T21                                   ###
##                                                                           ##
#                                                                             #
#                                                                             #
###############################################################################

#Lendo o conjunto de dados
hd_t21 <- read_csv("HabeasData_Down.csv")

#Dimensão do conjunto de dados
dim(hd_t21)

#Estrutura dos dados
str(hd_t21)
glimpse(hd_t21)

#Transformando espaços inexistentes em NA
hd_t21[hd_t21 == '[]'] <- NA
hd_t21[hd_t21 == ''] <- NA
hd_t21[hd_t21 == '["NÃO DISPONÍVEL"]'] <- NA
hd_t21[hd_t21 == 'NÃO DISPONÍVEL'] <- NA


## Alterando os campos de caracter para data
hd_t21$data_sentenca <- as.Date(hd_t21$data_sentenca, "%d/%m/%Y")
hd_t21$distribuição <- as.Date(hd_t21$distribuição, "%d/%m/%Y")

## Alterando os campos de caracter para number
hd_t21 <- hd_t21 %>% 
  mutate(valor_acao_number = parse_number(hd_t21$"valor_acao",  
                                         locale = locale(decimal_mark = ","))) %>% 
  select(-valor_acao) 

## Visualizando os conteúdos de alguns campos (possivelmente factor)
unique(hd_t21$area_direito)
unique(hd_t21$camara)
unique(hd_t21$comarca)
unique(hd_t21$descricao_procedimento)
unique(hd_t21$detalhe_materia) #excluir, só possui NA
unique(hd_t21$detalhe_procedimento)
unique(hd_t21$forum)
unique(hd_t21$instancia)
unique(hd_t21$materia_principal)
unique(hd_t21$natureza_processo)
unique(hd_t21$natureza_vara)
unique(hd_t21$procedimento)
unique(hd_t21$regiao)
unique(hd_t21$sentenca)
unique(hd_t21$status)
unique(hd_t21$subcategoria)
unique(hd_t21$tipo_assunto)
unique(hd_t21$tipo_processo)
unique(hd_t21$UF)
unique(hd_t21$vara)

# Excluindo variáveis que não contêm informações

hd_t21$detalhe_materia <- NULL

dim(hd_t21)

## Alterando os campos de caracter para factor

# hd_t21[,-2] <- hd_t21[,-2] %>%
  # mutate_all(factor)
hd_t21$UF <- as.factor(hd_t21$UF)
hd_t21$area_direito <- as.factor(hd_t21$area_direito)
hd_t21$camara <- as.factor(hd_t21$camara)
hd_t21$comarca <- as.factor(hd_t21$comarca)
hd_t21$descricao_procedimento <- as.factor(hd_t21$descricao_procedimento)
hd_t21$detalhe_procedimento <- as.factor(hd_t21$detalhe_procedimento)
hd_t21$forum <- as.factor(hd_t21$forum)
hd_t21$instancia <- as.factor(hd_t21$instancia)
hd_t21$materia_principal <- as.factor(hd_t21$materia_principal)
hd_t21$natureza_processo <- as.factor(hd_t21$natureza_processo)
hd_t21$natureza_vara <- as.factor(hd_t21$natureza_vara)
hd_t21$procedimento <- as.factor(hd_t21$procedimento)
hd_t21$regiao <- as.factor(hd_t21$regiao)
hd_t21$sentenca <- as.factor(hd_t21$sentenca)
hd_t21$status <- as.factor(hd_t21$status)
hd_t21$subcategoria <- as.factor(hd_t21$subcategoria)
hd_t21$tipo_assunto <- as.factor(hd_t21$tipo_assunto)
hd_t21$tipo_processo <- as.factor(hd_t21$tipo_processo)
hd_t21$vara <- as.factor(hd_t21$vara)

glimpse(hd_t21)

# Verificar se há duplicidade de observações e excluí-las se houver
# No "distinct" (tidyverse), como não especificamos variáveis, considerou todas

hd_t21 <- dplyr::distinct(hd_t21)

dim(hd_t21)


 #******************* FINAL *******************#
