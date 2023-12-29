## https://www.youtube.com/watch?v=jGkIwgF0Ads&list=PLDoqBsM6cBJZa3uitQQZ2OP0VT-9ht2tT&index=5
## Relatório Análise Exploratória

hd_t21_select <- hd_t21[,c(1,6,9:20,22,24,27:33)]


# Renomeando as colunas selecionadas que não estiverem no padrão UTF8
# A função 'rename' torna este trabalho mais prático
# A seguir, o argumento da função é: novo nome = nome antigo

hd_t21_select <- dplyr::rename(hd_t21_select,
                               distribuicao = "distribuição")

str(hd_t21_select)

# Utilizando o pacote dataMaid
dataMaid::makeDataReport(hd_t21_select)

#Utilizando o pacote dlookr
dlookr::eda_report(hd_t21_select)

# Filtrando casos em que um determinado grupo foi totalmente preenchido Ex.: natureza_vara
# Não está no TCC!!!!
hd_t21_filter <- hd_t21_select[!is.na(hd_t21_select$natureza_vara),]

# Relatório segundo a variável status
dlookr::eda_report(hd_t21_select, target = "status")

# https://www.youtube.com/watch?v=xI8f0kUnmF0&list=PLDoqBsM6cBJZa3uitQQZ2OP0VT-9ht2tT&index=7

# Criando tabelas para artigos científicos
gtsummary::tbl_summary(hd_t21_select)

# Mudando os nomes dos labels
tbl_summary(hd_t21_select, label = list(regiao ~ "Região",
                                        sentenca ~ "Sentença",
                                        valor_acao_number ~"Valor da ação"))

# Mudando a estatística descritiva
tbl_summary(hd_t21_2, label = list(regiao ~ "Região",
                                   sentenca ~ "Sentença",
                                   valor_acao_number ~"Valor da ação"),
            statistic = list(valor_acao_number ~ "{mean} ({sd})"))

# Mudando o número de casas decimais
tbl_summary(hd_t21_2, label = list(regiao ~ "Região",
                                   sentenca ~ "Sentença",
                                   valor_acao_number ~"Valor da ação"),
            statistic = list(valor_acao_number ~ "{mean} ({sd})"),
            digits = list(valor_acao_number ~ c(2,2))) ## como tem dois valores para essa variável
## cria o vetor e coloca o número de dígitos
## para cada uma delas


# Mudando o tipo de apresentação da variável
tbl_summary(hd_t21_2, label = list(regiao ~ "Região",
                                   sentenca ~ "Sentença",
                                   valor_acao_number ~"Valor da ação"),
            statistic = list(valor_acao_number ~ "{mean} ({sd})"),
            digits = list(valor_acao_number ~ c(2,2)),
            type = list(valor_acao_number ~ "continuous2",
                        tipo_assunto ~ "categorical")) 

# Mudando a apresentação dos missings
tbl_summary(hd_t21_2, label = list(regiao ~ "Região",
                                   sentenca ~ "Sentença",
                                   valor_acao_number ~"Valor da ação"),
            statistic = list(valor_acao_number ~ "{mean} ({sd})"),
            digits = list(valor_acao_number ~ c(2,2)),
            type = list(valor_acao_number ~ "continuous2"),
            missing = "ifany", # always - sempre mostra; no - nunca mostra, ifany - padrão
            missing_text = "Dados ausentes") 

# Ordenando as categorias das variáveis qualitativas
tbl_summary(hd_t21_2, label = list(regiao ~ "Região",
                                   sentenca ~ "Sentença",
                                   valor_acao_number ~"Valor da ação"),
            statistic = list(valor_acao_number ~ "{mean} ({sd})"),
            digits = list(valor_acao_number ~ c(2,2)),
            type = list(valor_acao_number ~ "continuous2"),
            missing = "ifany", # always - sempre mostra; no - nunca mostra, ifany - padrão
            missing_text = "Dados ausentes",
            sort = list(uf ~ "frequency")) # ou "alphanumeric

# Tabela por grupo
tbl_summary(hd_t21_2, label = list(regiao ~ "Região",
                                   sentenca ~ "Sentença",
                                   valor_acao_number ~"Valor da ação"),
            statistic = list(valor_acao_number ~ "{mean} ({sd})"),
            digits = list(valor_acao_number ~ c(2,2)),
            type = list(valor_acao_number ~ "continuous2"),
            missing = "ifany", # always - sempre mostra; no - nunca mostra, ifany - padrão
            missing_text = "Dados ausentes",
            sort = list(UF ~ "frequency"), # ou "alphanumeric
            by = status,
            percent = "row") #por linha

# Layout - variáveis em negrito
tbl_summary(hd_t21_2,
            by = status,
            percent = "row") %>%
  bold_labels() %>%
  italicize_levels()

# Layout - variáveis em negrito
tbl_summary(hd_t21_2,
            by = status,
            percent = "row") %>%
  bold_labels() %>%
  add_n(statistic = "{n}", #valor apresentado
        col_label = "Tamanho da amostra", #nome da coluna
        footnote = T, #Explicação no rodapé
        last = F) #Se na última coluna

# Layout - coluna com as estatísticas do total
tbl_summary(hd_t21_2,
            by = status,
            percent = "row") %>%
  bold_labels() %>%
  add_n(statistic = "{n}", #valor apresentado
        col_label = "Tamanho da amostra", #nome da coluna
        footnote = T, #Explicação no rodapé
        last = F) %>% #Se na última coluna 
  add_overall(col_label = "Total", # nome da coluna
              last = T) %>% # se fica no final da tabela
  add_p(pvalue_fun = function(x) style_pvalue(x, digits = 3),
        test = list(valor_acao_number ~ "t.test"))

# Layout - muda nome das colunas
tb <- tbl_summary(hd_t21_2,
                  by = status,
                  percent = "row") %>%
  add_p()

show_header_names(tb)

tb %>%
  modify_header(update = list(label ~ "**Variável**",
                              p.value ~ "**Valor-p**"))

# Salvando a tabela
library(flextable)
tb <- as_flex_table(tb)
save_as_docx(tb, path = "C:/Users/ADM/Downloads/TCC/Dados/Analise de Dados LBI T21/Tabela.docx")
save_as_image(tb, path = "C:/Users/ADM/Downloads/TCC/Dados/Analise de Dados LBI T21/Tabela.jpeg")

#####################
getwd()
## Removendo os campos que não serão utilizados
#habeasdata_t21$`_id` <- NULL
#habeasdata_t21$instancia <- NULL
#habeasdata_t21$advogados_autor <- NULL
#habeasdata_t21$advogados_reu <- NULL
#habeasdata_t21$autores_pessoa_fisica <- NULL
#habeasdata_t21$autores_pessoa_juridica <- NULL
#habeasdata_t21$reus_pessoa_fisica <- NULL
#habeasdata_t21$reus_pessoa_juridica <- NULL

glimpse(hd_t21) # Função parecida com a str

options(max.print = 1600)
unique(year(hd_t21$distribuição))

unique(hd_t21$advogados_autor)
unique(hd_t21$advogados_reu)
unique(hd_t21$autores_pessoa_fisica)
unique(hd_t21$autores_pessoa_juridica)
unique(hd_t21$reus_pessoa_fisica)
unique(hd_t21$reus_pessoa_juridica)

ufs <- unique(hd_t21$UF)


visualizacao_1 <- select(hd_t21,valor_acao)

# Referência adicional: o parse_number já faz a alteração para o formato desejável

#hd_t21 <- hd_t21 %>% 
#  mutate(valor_acao = na_if(valor_acao, "NÃO DISPONÍVEL"))



glimpse(hd_t21) 


hd_t21_interdicao <- hd_t21 %>% 
  filter(str_detect(publicacoes, "INTERDIÇÃO"))

hd_t21_n_interdicao <- hd_t21 %>% 
  filter(str_detect(publicacoes, "INTERDIÇÃO", negate = TRUE))

rm(hd_t21_interdicao)
rm(hd_t21_n_interdicao)

visualizacao_1 <- select(hd_t21,"_id",andamentos)

#extrai_conteudo <- str_extract_all(jogos$events_list, 
#                              "'Goal', 'action_player_1': '\\w*(.*?)\\w*\\'",
#                              simplify = TRUE)

print(hd_t21$andamentos)
