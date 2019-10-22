Dado (/^que eu realize um pedido$/) do

	@request=Requests.new
	@request.solicitação_retorna_aceite
end

Então (/^o dados referente ao aceite é retornado com sucesso$/) do

	@comum=Comum.new
	@comum.valida_retorno_aceite
	puts "O retorno referente ao aceite é: #{$resposta_solicitacao_validar_retorna_aceite}"
end