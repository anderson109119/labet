Dado (/^que eu realizo uma solicitação$/) do

	@request=Requests.new
	@request.solicitacao
end

Então (/^todos os ids retornados são validados$/) do

	@comum=Comum.new
	@comum.valida_ids
	idsretorno = $arquivo_retorno.join(",")
	puts "Os ids retornados são: #{idsretorno}"
end