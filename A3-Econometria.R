# Econometria Avançada Aula 3

# Revisão Aula 2

install.packages("pwt8") #instala o pacote pwt8
library(pwt8) #roda o pacote pwt8
data("pwt8.0") #carrega os dados pwt8.0 disponiveis no pacote
View(pwt8.0) #vizualiza a tabela pwt8.0
br <- subset(pwt8.0, country=="Brazil", select = c("rgdpna", "avh", "xr")) #cria uma tabela br onde é escolhido o país Brasil e as variáveis
colnames(br) <- c("PIB","Trabalho","Câmbio") #altera o nome das variáveis
View(br) #vizualiza a tabela br criada
plot(br$PIB) #cria um gráfico dos valores de PIB na tabela br
plot(br$PIB, type="l") #transforma os valores em forma de linha
dados <- ts(br, start = 1950,  frequency = 1) #cria a tabela dados com uma série temporal que começa em 1950 e a frequência é anual
plot(dados, col="blue", main = "Dados Brasileiros", xlab="Ano", plot.type = "single") #cria um gráfico da tabela dados com cor azul
setwd("G:/USJT/Econometria/A3") #altera o diretório
write.csv(br,file = "br.csv") #salva a tabela
library("readr") #carrega o pacote de leitura de arquivos .csv
br <- read_csv("G:/USJT/Econometria/A3/br.csv", col_types = c("date", "numeric", "numeric", "numeric")) #lê o arquivo .csv escolhido na pasta escolhida
View(br) #vizualiza a tabela
br <- br[,-1] #apaga a primeira coluna da tabela
colnames(br)[3] <- "Câmbio" #altera o nome da terceira coluna
write.csv(br,file = "Dados-Brasileiros.csv") #salva a nova tabela
