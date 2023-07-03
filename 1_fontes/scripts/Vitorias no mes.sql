
	select 
				atleta.id,
				atleta.atleta,		
				COUNT(*) over(partition by atleta.atleta) as vitoria,
				getdate() as data_carga				
		from dim_atletas atleta
		left join fato_historico_jogos jogos
		on atleta.atleta = jogos.atleta
		where month(jogos.jogo) = 10
		and jogos.RESULTADO = 'V'
		

		select * from dim_atletas atleta
		left join fato_historico_jogos jogos
		on atleta.atleta = jogos.atleta
		where month(jogos.jogo) = 10
		and atleta.id = 26
		and jogos.RESULTADO = 'V'