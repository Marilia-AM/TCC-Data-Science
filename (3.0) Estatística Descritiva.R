### ESTATÍSTICA DESCRITIVA UNIVARIADA ###
## https://www.youtube.com/watch?v=GvJMGGHJRVk&list=PLDoqBsM6cBJZa3uitQQZ2OP0VT-9ht2tT&index=3

# Classificação das Variáveis
names(hd_t21)

# "UF"                       : QUALITATIVA NOMINAL POLICOTÔMICA
# "_id"                      : NÃO SERÁ UTILIZADA, PODE SER EXCLUÍDA
# "advogados_autor"          : QUALITATIVA NOMINAL POLICOTÔMICA
# "advogados_reu"            : QUALITATIVA NOMINAL POLICOTÔMICA **
# "andamentos"               : QUALITATIVA NOMINAL POLICOTÔMICA **
# "area_direito"             : QUALITATIVA NOMINAL POLICOTÔMICA
# "autores_pessoa_fisica"    : QUALITATIVA NOMINAL POLICOTÔMICA **
# "autores_pessoa_juridica"  : QUALITATIVA NOMINAL POLICOTÔMICA **
# "camara"                   : QUALITATIVA NOMINAL POLICOTÔMICA
# "comarca"                  : QUALITATIVA NOMINAL POLICOTÔMICA
# "data_sentenca"            : QUANTITATIVA DATA
# "datajud"                  : QUALITATIVA NOMINAL DICOTÔMICA
# "descricao_procedimento"   : QUALITATIVA NOMINAL POLICOTÔMICA **
# "detalhe_procedimento"     : QUALITATIVA NOMINAL POLICOTÔMICA
# "distribuição"             : QUANTITATIVA DATA
# "forum"                    : QUALITATIVA NOMINAL POLICOTÔMICA
# "instancia"                : QUALITATIVA NOMINAL POLICOTÔMICA
# "materia_principal"        : QUALITATIVA NOMINAL POLICOTÔMICA
# "natureza_processo"        : QUALITATIVA NOMINAL POLICOTÔMICA
# "natureza_vara"            : QUALITATIVA NOMINAL POLICOTÔMICA
# "numero"                   : QUALITATIVA NOMINAL POLICOTÔMICA
# "procedimento"             : QUALITATIVA NOMINAL POLICOTÔMICA
# "publicacoes"              : QUALITATIVA NOMINAL POLICOTÔMICA **
# "regiao"                   : QUALITATIVA NOMINAL POLICOTÔMICA
# "reus_pessoa_fisica"       : QUALITATIVA NOMINAL POLICOTÔMICA **
# "reus_pessoa_juridica"     : QUALITATIVA NOMINAL POLICOTÔMICA **
# "sentenca"                 : QUALITATIVA NOMINAL POLICOTÔMICA
# "status"                   : QUALITATIVA NOMINAL POLICOTÔMICA
# "subcategoria"             : QUALITATIVA NOMINAL POLICOTÔMICA
# "tipo_assunto"             : QUALITATIVA NOMINAL POLICOTÔMICA
# "tipo_processo"            : QUALITATIVA NOMINAL POLICOTÔMICA
# "vara"                     : QUALITATIVA NOMINAL POLICOTÔMICA
# "valor_acao_number"        : QUANTITATIVA RAZÃO CONTÍNUA
# "natureza_var"             : QUALITATIVA NOMINAL POLICOTÔMICA

##
### Variáveis Qualitativas ###
##

## Iniciarei com a variável UF.
## Depois iremos criar uma função para obter as estatísticas para todas as variáveis

## Tabelas

# Distribuição de Frequências ==>> UF

freq(hd_t21$UF)

# Outra forma é chamar a função original e mudar o número de casas decimasi
summarytools::freq(hd_t21$UF, round.digits = 1)

# Moda
DescTools::Mode(hd_t21$UF, na.rm = T)


## Gráficos

# Barras
hd_t21 %>%
  ggplot() +
  aes(x = UF) +
  geom_bar(fill = "darkgreen") +
  labs(x = "UF", y = "Frequência absoluta", 
       title = "Número de Processos por Unidade Federativa") +
  theme_minimal()

# Pie Chart with Percentages

# Criar um dataset com os dados da variável (em formato de tabela)

UF <- table(hd_t21$UF)
dados_grafico <- data.frame(UF)
print(dados_grafico)


# Alterar o nome das variáveis

dados_grafico <- dados_grafico %>% rename(UF = 1,
                                          Processos = 2)

# Plotar o gráfico

#library(plotly)

fig <- plotly::plot_ly(dados_grafico, labels = ~UF, values = ~Processos, type = 'pie')
fig <- fig %>% layout(title = 'Resultado das sentenças',
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
fig

##
### Variáveis Quantitativas ###
## https://www.youtube.com/watch?v=WCavJTeAu5A&list=PLDoqBsM6cBJZa3uitQQZ2OP0VT-9ht2tT&index=4
##

freq(hd_t21$valor_acao_number)
hd_t21_filter <- hd_t21[hd_t21$valor_acao_number != 70000,]


#Definir o intervalo de classes da variável quantitativa
classIntervals(hd_t21$valor_acao_number, 10)


#Medidas-resumo

descr(hd_t21$valor_acao_number)

# Moda
DescTools::Mode(hd_t21$valor_acao_number, na.rm = T) #moda

# Quartis
quantile(hd_t21$valor_acao_number, na.rm = T, probs = seq(0, 1, .10)) # percentis


# Gráficos

# Histograma

ggplot(hd_t21_filter) +
 aes(x = valor_acao_number) +
 geom_histogram(bins = 20L, fill = "#112446") +
 labs(x = "Valor (R$)", 
 y = "Frequência") +
 theme_minimal()

# Gráfico de Densidades

ggplot(hd_t21_filter) +
  aes(x = valor_acao_number) +
  geom_density(adjust = 5L, fill = "#112446") +
  labs(x = "Valor (R$)",
       y = "Densidade") +
  theme_minimal()

# Boxplot com violin

ggplot(hd_t21_filter) +
  aes(x = "", y = valor_acao_number) +
  geom_violin(fill = "#fff5f0") +
  geom_boxplot(width = 0.7, fill = "grey", alpha = 0.2) +
  labs(x = "", 
       y = "Valor (R$)") +
  theme_minimal()

