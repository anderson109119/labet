class Requests

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

	def solicitacao
		var_recebe_colunaA = []

			arquivo_lista_cnpjs = Roo::Excelx.new("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/retorno_ids/cnpjs.xlsx")
			arquivo_lista_cnpjs.default_sheet = arquivo_lista_cnpjs.sheets.first
			1.upto(5) do |line|

				recebe_lista_all_cols = arquivo_lista_cnpjs.cell(line,'A')
				
				var_recebe_colunaA[line] = recebe_lista_all_cols

			print "\n" + "Para o CNPJ #{var_recebe_colunaA[line]}, temos a seguinte resposta:" + "\n\n" 

			$resposta_solicitacao = HTTParty.get("http://webservicehomolog.alvaro.com.br//webserviceaol/rest/homologacao/entidadeCnpj/" + "#{var_recebe_colunaA[line]}")
		  	$recebejson = JSON.parse($resposta_solicitacao.body)
		  	puts $recebejson
		  	File.open("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/retorno_ids/retorno.txt", "a") do |g|
			g.puts($recebejson)
			g.close
	  	 	end
	  	end
	end

	def solicitacao_json_retorna_ordem_servico

		print "\n" + "Dado que envie solicitação LABET" + "\n\n" 

		$resposta_solicitacao_json_retorna_ordem_servico = HTTParty.post("http://webservicehomolog.alvaro.com.br/webserviceaol/rest/homologacao/inserirOrdemServicoFaturar", :body => $arquivo_aa, :headers => {"Content-Type" => 'application/json'})
	  	puts $resposta_solicitacao_json_retorna_ordem_servico.body
	end

	def solicitação_retorna_aceite
		print "\n" + "Dado que envie solicitação LABET com a OS #{$retornoordemservico} " + "\n\n" 
		$resposta_solicitacao_retorna_aceite = HTTParty.get("http://webservicehomolog.alvaro.com.br/webserviceaol/rest/homologacao/RetornoResultadoFaturar/" + "#{$retornoordemservico}")		
	end
end