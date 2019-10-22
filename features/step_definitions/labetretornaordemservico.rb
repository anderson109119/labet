Dado (/^que eu realize uma solicitação$/) do

	@comum=Comum.new
	@comum.guarda_json_envio
	@comum.enviar_json	
end

Quando (/^receber a resposta de ordem de serviço alvaro vinculada$/) do

	@request=Requests.new
	@request.solicitacao_json_retorna_ordem_servico
end

E (/^a ordem de serviço é retornada corretamente$/) do

	@comum=Comum.new
	@comum.valida_ordem_servico
end

Então (/^os dados são consultados com sucesso no banco labor$/) do
	@comum = Comum.new
	@comum.acesso_banco
	@comum.executar_query_os

	$results_os.each do |item|

		puts "A ordem de serviço retornada e utilizada para consulta no banco foi: "+"#{$retornoordemservico}"
		$a = item['ORDPCT']
		if $a.eql?($a) then puts nil else raise "ORDPCT não retornado ou incorreto" end
		if $a.eql?("NULL") then puts raise "ORDPCT está Nullo" else puts nil end
		if $a.eql?("") then puts raise "ORDPCT está vazio" else puts nil end
		puts "O retorno do banco para consulta no campo ORDPCT é: " + "#{$a}"

		$b = item['ORDAREA']
		if $b.eql?("3") then puts nil else raise "ordarea não retornado ou incorreto" end
		if $b.eql?("NULL") then puts raise "ORDAREA está Nullo" else puts nil end
		if $b.eql?("") then puts raise "ORDAREA está vazio" else puts nil end
		puts "O retorno do banco para consulta no campo ORDAREA é: " + "#{$b}"

		$c = item['orddtprometida']
		if $c.eql?($c) then puts nil else raise "orddtprometida não retornado ou incorreto" end
		if $c.eql?("NULL") then puts raise "orddtprometida está Nullo" else puts nil end
		if $c.eql?("") then puts raise "orddtprometida está vazio" else puts nil end
		puts "O retorno do banco para consulta no campo orddtprometida é: " + "#{$c}"
	end

	@comum.executar_query_paciente

	$results_paciente.each do |item|

		$d = item['PctNome']
		if $d.eql?($d) then puts nil else raise "PctNome não retornado ou incorreto" end
		if $d.eql?("NULL") then raise "PctNome está Nullo" else puts nil end
		if $d.eql?("") then puts raise "PctNome está vazio" else puts nil end
		puts "O retorno do banco para consulta no campo PctNome é: " + "#{$d}"

		$e = item['PctDtNasc']
		if $e.eql?($e) then puts nil else raise "PctDtNasc não retornado ou incorreto" end
		if $e.eql?("NULL") then raise "PctDtNasc está Nullo" else puts nil end
		if $e.eql?("") then puts raise "PctDtNasc está vazio" else puts nil end
		puts "O retorno do banco para consulta no campo PctDtNasc é: " + "#{$e}"
	end

	@comum.executar_query_tempo

	$results_tempo.each do |item|

		$f = item['tmpNtoExecucao']
	end

	@comum.executar_query_param_config_compara

	$results_param_config_compara.each do |item|

		$g = item['parametro1']		
	end

	if $f.eql?($g) then puts nil else raise "O campo tmpNtoExecucao não é igual ao campo parametro1" end
	puts "O retorno do banco para consulta no campo tmpNtoExecucao é: " + "#{$f}"
	puts "O retorno do banco para consulta no campo parametro1 é: " + "#{$g}"
end