class Comum

def valida_ids
	$arquivo_retorno = IO.readlines("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/retorno_ids/retorno.txt").map(&:chomp)
	arquivo_comp = IO.readlines("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/retorno_ids/compara.txt").map(&:chomp)

	if arquivo_comp.eql? $arquivo_retorno then 
		puts nil
	else

		File.open("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/retorno_ids/resultado_valor_incorreto.txt","a"){ |f| f.puts((arquivo_comp-"#{$arquivo_retorno}").join("\n"))}
			lines = File.foreach("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/retorno_ids/resultado_valor_incorreto.txt").count
			puts "O número de linhas incorretas é: " + "#{lines}"				
			puts raise "Os ids retornados não são iguais aos comparados" + "\n" + "Info: Verificar linhas incorretas no arquivo resultado_valor_incorreto"
		f.close
		v.close
	end	
end

	
def	guarda_json_envio

		$enviojson = '                {
                "paciente":
                {
                               "nome":"Teste entrada requisição",
                               "dataNascimento":"1980-05-10"
                },
                "dataCadastro":"2018-01-03 12:35:50",
                "dataPrevistoResultado":"2018-01-08 12:35:50",
                "codigoEntidadeAlvaro":"2626",
                "codigoExameAlvaro":"TOXMED"
}'

	$arquivojson = File.open("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/solicitacao/enviateste9.json") 
		File.write($arquivojson,$enviojson)
	end

def enviar_json		

		$arquivo_aa = File.read("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/solicitacao/enviateste9.json") 			
	end

def valida_ordem_servico

		retornoos = JSON.parse($resposta_solicitacao_json_retorna_ordem_servico.body)
		$retornoordemservico = retornoos
		if $retornoordemservico.eql?($retornoordemservico) then puts nil else raise "A ordem de serviço está incorreta !" end
		puts "A ordem de serviço é: #{$retornoordemservico}"	
	end

	def acesso_banco

		$client = Mysql2::Client.new(:host => "10.122.52.28", :username => "Administrador", :password => "CeBiQuimMaster")
	end

	def executar_query_os

		$results_os = $client.query("select * from labor.ordem_servico where ordsid ="+"#{$retornoordemservico}")
	end

	def executar_query_paciente

		$results_paciente = $client.query("select * from labor.pacientes where PctSid ="+"#{$a}")
	end

	def executar_query_tempo
		$results_tempo = $client.query("select * from labor.tempo where tmpOrdem ="+"#{$retornoordemservico}")
	end

	def executar_query_param_config_compara
		$results_param_config_compara = $client.query("select parametro1 from labor.parametro_config where codchamada = 'Faturar_Labet'")
	end

	def valida_retorno_aceite

		$resposta_solicitacao_validar_retorna_aceite = $resposta_solicitacao_retorna_aceite.strip

		if $resposta_solicitacao_validar_retorna_aceite.eql?("SALVO") then nil else raise "Não foi retornado aceite ou retorno incorreto" end
	end
end