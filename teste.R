csv <- "/Users/diego/Downloads/casa.csv"

require(gdata)
#View(dados)
dados <- read.csv2(csv, header= T, sep=";")
library(calcidadao)

for ( i in 1:nrow(dados) ){
#for ( i in 1:1 ){

    valor <- dados$VALOR[i]
    #print(valor)
    dt_venc <- as.character(dados$DT_VENC[i])
    #print(dt_venc)
    val_inpc <- corrigir_valor(value = valor, method = "INPC", startDate = dt_venc)
    val_ipca <- corrigir_valor(value = valor, method = "IPC-A", startDate = dt_venc)
    val_selic <- corrigir_valor(value = valor, method = "SELIC", startDate = dt_venc)
    val_igpm <- corrigir_valor(value = valor, method = "IGP-M", startDate = dt_venc)

    if ( !is.null( val_inpc )){
      dados$INPC[i] <- val_inpc
      #print(val_inpc)
      val_inpc <- ""
    }

    if ( !is.null( val_ipca )){
      dados$IPCA[i] <- val_ipca
      #print(val_ipca)
      val_ipca <- ""
    }

    if ( !is.null( val_selic)){
      dados$SELIC[i] <- val_selic
      #print(val_selic)
      val_selic <- ""
    }

    if ( !is.null( val_igpm )){
      dados$IGPM[i] <- val_igpm
      #print(val_igpm)
      val_igpm <- ""
    }
    #dt <- c ( dados$PARCELA[i], dados[i, "VALOR"] )
    #dados$IPCA[i] <- i
    #dados$INPC[54] <- "0,00"
    #dados$IPCA[54] <- "0,00"
    #dados$SELIC[55] <- "0,00"
    #dados$IGPM[55] <- "0,00"

    #write.csv2(dados, "casa_corrigido_indices.csv")
    sum(1,01+3,10)
    colSums(dados$IPCA[1])

    sum_valor <- 0

    for (n in 1:nrow(dados)) {
      valor_conv <- converte_valor(dados$IPCA[n])
      print(valor_conv)
      sum_valor <- (sum(as.numeric(valor_conv)))
    }
    print(sum_valor)

}

