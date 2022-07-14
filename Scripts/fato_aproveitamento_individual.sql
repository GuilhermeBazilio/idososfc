		drop table dw_idosos.fato_aproveitamento_individual;
		
		select 
				id,
				atleta,		
				sum (
							 (case 
							 	when pontos <= 0 then 0
							 	when pontos is null then 0
							 else
							 	pontos
							 end
							 	/(
							 		  case 	
							 		  		when presenca <=0 then 1 	
							 		  		when presenca is null then 1
							 		  else
							 		  		presenca
							 		   end
							 		   		 *3))*100) over(partition by atleta) aproveitamento,
				case 
					when presenca is null then 0
				else 
					presenca
				end
				as jogos_disputados,
				case 
					when vitorias is null then 0
				else 
					vitorias
				end	
				as total_vitorias,
				case 
					when empates is null then 0
				else 
					empates
				end
				as total_empates,		
				case 
					when derrotas  is null then 0
				else 
					derrotas 
				end
				as total_derrotas,
				now() as data_carga
				
		into 
			dw_idosos.fato_aproveitamento_individual
		from dw_idosos.dim_atletas;
		
		create index  idx_fato_aproveitamento_individual on dw_idosos.fato_aproveitamento_individual  (id);

	

 
 
