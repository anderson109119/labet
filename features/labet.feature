#encoding: utf-8
#language: pt

Funcionalidade: Valida retorno LABET (versão 4.4)
Data de execução: 02/03/2018
  Eu como usuário
  Quero acessar o serviço LABET
  Para validar retorno de todas informações relacionadas aos pedidos enviados

@data_validar_retorno_ids
Cenário: Validar se os ids retornados estão corretos
  Dado que eu realizo uma solicitação
  Então todos os ids retornados são validados

@data_validar_retorno_OS_alvaro_vinculada
Cenário: Validar se ordem de serviço alvaro vinculada é retornada corretamente
  Dado que eu realize uma solicitação
  Quando receber a resposta de ordem de serviço alvaro vinculada
  E a ordem de serviço é retornada corretamente
  Então os dados são consultados com sucesso no banco labor

@data_validar_retorno_aceite
Cenário: Validar se ordem de serviço alvaro vinculada enviada retorna dado de aceite
  Dado que eu realize um pedido
  Então o dados referente ao aceite é retornado com sucesso