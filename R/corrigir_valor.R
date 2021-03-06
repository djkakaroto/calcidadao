# Author: Diego Lopes <https://github.com/djkakaroto>
# Version: 0.0.1
# Name: corrigir_valor
#' @export

# Curso para criar pacotes no R
# http://cursos.leg.ufpr.br/prr/capPacR.html
# https://stackoverflow.com/questions/14169620/add-a-month-to-a-date
# https://www.rdocumentation.org/packages/DescTools/versions/0.99.19/topics/AddMonths
# https://www.tutorialspoint.com/r/r_csv_files.htm
# Esta faltando corrigir a data para os indices e adicionar uma funcao para enviar a requisicao

corrigir_valor <-
  function(value = "",
           method = c("SELIC", "IPC-A", "IGP-M", "INPC"),
           startDate = FALSE,
           endDate = TRUE) {
    valor <- converte_valor(value)
    metodo <- toupper(method)
    dtInicial <- validar_data(startDate)
    dtFinal <- validar_data(endDate)
    URL_FULL <- ""

    # ----------------------------------------- #
    # Valida metodo (indicador) e retorna a URL #
    # ----------------------------------------- #
    if (is.character(metodo)) {
      if (pracma::strcmp("SELIC", metodo)) {
        urlBase <- retornaURL(metodo)
        URL_FULL <- paste(
          urlBase,
          "&dataInicial=",
          dtInicial,
          "&dataFinal=",
          dtFinal,
          "&valorCorrecao=",
          valor,
          sep = ""
        )
      } else if (pracma::strcmp("IPC-A", metodo)) {
        urlBase <- retornaURL(metodo)
        dtInicial <- validar_data_indices(dtInicial)
        dtFinal <- validar_data_indices(dtFinal, nMes = -2)
        URL_FULL = paste(
          urlBase,
          "&dataInicial=",
          dtInicial,
          "&dataFinal=",
          dtFinal,
          "&valorCorrecao=",
          valor,
          sep = ""
        )
      } else if (pracma::strcmp("IGP-M", metodo)) {
        urlBase = retornaURL(metodo)
        dtInicial <- validar_data_indices(dtInicial)
        dtFinal <- validar_data_indices(dtFinal, nMes = -1)
        URL_FULL = paste(
          urlBase,
          "&dataInicial=",
          dtInicial,
          "&dataFinal=",
          dtFinal,
          "&valorCorrecao=",
          valor,
          sep = ""
        )
      } else if (pracma::strcmp("INPC", metodo)) {
        urlBase = retornaURL(metodo)
        dtInicial <- validar_data_indices(dtInicial)
        dtFinal <- validar_data_indices(dtFinal, nMes = -2)
        URL_FULL = paste(
          urlBase,
          "&dataInicial=",
          dtInicial,
          "&dataFinal=",
          dtFinal,
          "&valorCorrecao=",
          valor,
          sep = ""
        )
      } else
      {
        return(cat("<Aviso> Metodo: ", indicator, " nao suportado!", sep = ""))
      }
    }
    # ------------------------------------------ #

  result <- imprimir_valor( URL_FULL )
  return (result)
  }
# ------------------------------------------------------- #
