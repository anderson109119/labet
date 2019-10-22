Before do |scenario|
  begin
    if File.exist?('C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/retorno_ids/retorno.txt') then    
      File.delete( "C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/retorno_ids/retorno.txt" )
    end

    if File.exist?('C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/retorno_ids/resultado_valor_incorreto.txt') then    
      File.delete( "C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/retorno_ids/resultado_valor_incorreto.txt" )
    end

  	if !File.exist?('C:\Dasa_Automacoes\LABET\LABET_Automacao_Servicos\features\arquivos\solicitacao\historico_envio.txt') then
  		file_name_data = File.new("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/solicitacao/historico_envio.txt")
  	end
  	time = "#{Time.now.strftime('Dta:%Y-%m-%d_Horario_Execucao:%Hhs-%Mmin-%Ssegs')}:"
    	File.open("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/solicitacao/historico_envio.txt", "w") do |x|
   	x.puts time
    	x.close
    	end

    if !File.exist?('C:\Dasa_Automacoes\LABET\LABET_Automacao_Servicos\features\arquivos\solicitacao\retorno_os.txt') then
      file_name_data = File.new("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/solicitacao/retorno_os.txt")
    end
    time = "#{Time.now.strftime('Dta:%Y-%m-%d_Horario_Execucao:%Hhs-%Mmin-%Ssegs')}:"
      File.open("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/solicitacao/retorno_os.txt", "w") do |f|
    f.puts time
      f.close
      end
    if !File.exist?('C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/solicitacao/retorna_bd_labor.txt') then
      file_name_data = File.new("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/solicitacao/retorna_bd_labor.txt")
    end
    time = "#{Time.now.strftime('Dta:%Y-%m-%d_Horario_Execucao:%Hhs-%Mmin-%Ssegs')}:"
      File.open("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/solicitacao/retorna_bd_labor.txt", "w") do |q|
    q.puts time
      q.close
    end
  end
end

After do |scenario|

  # escreve o json enviado guardando como um histórico daquela execução
  File.open("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/solicitacao/historico_envio.txt", "a") do |y|
  # A variável abaixo tem o conteúdo do json que será enviado na classe Resquests  
    y.puts $arquivo_aa
    y.close
  end
  # escreve o json retornado, não agraga como um histórico, pois a cada execução, before(antes de iniciar)
  # temos a gravação de um time no arquivo com p modo "w", ou seja, sobrescreve tudo gravado na rodada
  # anterior e coloca o tempo de execução dentro do arquivo, depois passa por aqui "after scenarios"
  # para gravar o retorno da solicitação abaixo da linha de data/hora já gravada no arquivo.
  File.open("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/solicitacao/retorno_os.txt", "a") do |k|
  # A variável abaixo tem o retorno da solicitação enviada  
    k.puts $resposta_solicitacao_json_retorna_ordem_servico
    k.close
  end

  File.open("C:/Dasa_Automacoes/LABET/LABET_Automacao_Servicos/features/arquivos/solicitacao/retorna_bd_labor.txt","a") do |o|
    o.puts "Os dados retornados do banco são os seguintes: " + "\n\n"
    o.puts "1. O dado referente ao campo ORDPCT é: "+"#{$a}"
    o.puts "2. O dado referente ao campo ORDAREA é: "+"#{$b}"
    o.puts "3. O dado referente ao campo orddtprometida é: "+"#{$c}"
    o.puts "4. O dado referente ao campo PctNome é: "+"#{$d}"
    o.puts "5. O dado referente ao campo PctDtNasc é: "+"#{$e}"
    o.puts "6. O dado referente ao campo tmpNtoExecucao é: "+"#{$f}"
    o.puts "7. O dado referente ao campo parametro1 é: "+"#{$g}"
    o.close
  end
end