drop table DBO.FATO_aproveitamento_mensal_2022;

with CADASTRO(	CADASTRO_id, 
				CADASTRO_atleta,
				PONTOS_ESPERADOS_JANEIRO,
				PONTOS_ESPERADOS_FEVEREIRO,
				PONTOS_ESPERADOS_MARCO,
				PONTOS_ESPERADOS_ABRIL,
				PONTOS_ESPERADOS_MAIO,
				PONTOS_ESPERADOS_JUNHO,
				PONTOS_ESPERADOS_JULHO,
				PONTOS_ESPERADOS_AGOSTO,
				PONTOS_ESPERADOS_SETEMBRO,
				PONTOS_ESPERADOS_OUTUBRO,
				PONTOS_ESPERADOS_NOVEMBRO,
				PONTOS_ESPERADOS_DEZEMBRO)
as
(
	SELECT ATLETA.ID,
		ATLETA.ATLETA,
		(select QTDE *3 qtde_pontos_esperados from f_qtd_partidas_mes(1)) AS PONTOS_ESPERADOS_JANEIRO,
		(select QTDE *3 qtde_pontos_esperados from f_qtd_partidas_mes(2)) AS PONTOS_ESPERADOS_FEVEREIRO,
		(select QTDE *3 qtde_pontos_esperados from f_qtd_partidas_mes(3)) AS PONTOS_ESPERADOS_MARCO,
		(select QTDE *3 qtde_pontos_esperados from f_qtd_partidas_mes(4)) AS PONTOS_ESPERADOS_ABRIL,
		(select QTDE *3 qtde_pontos_esperados from f_qtd_partidas_mes(5)) AS PONTOS_ESPERADOS_MAIO,
		(select QTDE *3 qtde_pontos_esperados from f_qtd_partidas_mes(6)) AS PONTOS_ESPERADOS_JUNHO,
		(select QTDE *3 qtde_pontos_esperados from f_qtd_partidas_mes(7)) AS PONTOS_ESPERADOS_JULHO,
		(select QTDE *3 qtde_pontos_esperados from f_qtd_partidas_mes(8)) AS PONTOS_ESPERADOS_AGOSTO,
		(select QTDE *3 qtde_pontos_esperados from f_qtd_partidas_mes(9)) AS PONTOS_ESPERADOS_SETEMBRO,
		(select QTDE *3 qtde_pontos_esperados from f_qtd_partidas_mes(10)) AS PONTOS_ESPERADOS_OUTUBRO,
		(select QTDE *3 qtde_pontos_esperados from f_qtd_partidas_mes(11)) AS PONTOS_ESPERADOS_NOVEMBRO,
		(select QTDE *3 qtde_pontos_esperados from f_qtd_partidas_mes(12)) AS PONTOS_ESPERADOS_DEZEMBRO
	FROM dim_atletas ATLETA
),
PONTOS (ID,ATLETA, JANEIRO,FEVEREIRO, MARCO, ABRIL, MAIO,JUNHO,JULHO,AGOSTO,SETEMBRO,OUTUBRO,NOVEMBRO,DEZEMBRO)
as
(
	select * from FATO_pontos_2022
)

SELECT	CADASTRO_id AS ID,
		CADASTRO_atleta AS ATLETA,
		sum(
			(CAST(JANEIRO AS decimal)/ 
				(CAST(
						CASE
							WHEN PONTOS_ESPERADOS_JANEIRO <=0 THEN
								1
							ELSE	
								PONTOS_ESPERADOS_JANEIRO
						END  AS DECIMAL )
										 )
										  )
										   *100) over (partition by cadastro_id) JANEIRO,
		sum(
			(CAST(FEVEREIRO AS decimal)/ 
				(CAST(
						CASE
							WHEN PONTOS_ESPERADOS_FEVEREIRO <=0 THEN
								1
							ELSE	
								PONTOS_ESPERADOS_FEVEREIRO
						END  AS DECIMAL )
										 )
										  )
										   *100) over (partition by cadastro_id) FEVEREIRO,
		sum(
			(CAST(MARCO AS decimal)/ 
				(CAST(
						CASE
							WHEN PONTOS_ESPERADOS_MARCO <=0 THEN
								1
							ELSE	
								PONTOS_ESPERADOS_MARCO
						END  AS DECIMAL )
										 )
										  )
										   *100) over (partition by cadastro_id) MARCO,
		sum(
			(CAST(ABRIL AS decimal)/ 
				(CAST(
						CASE
							WHEN PONTOS_ESPERADOS_ABRIL <=0 THEN
								1
							ELSE	
								PONTOS_ESPERADOS_ABRIL
						END  AS DECIMAL )
										 )
										  )
										   *100) over (partition by cadastro_id) ABRIL,
		sum(
			(CAST(MAIO AS decimal)/ 
				(CAST(
						CASE
							WHEN PONTOS_ESPERADOS_MAIO <=0 THEN
								1
							ELSE	
								PONTOS_ESPERADOS_MAIO
						END  AS DECIMAL )
										 )
										  )
										   *100) over (partition by cadastro_id) MAIO,
		sum(
			(CAST(JUNHO AS decimal)/ 
				(CAST(
						CASE
							WHEN PONTOS_ESPERADOS_JUNHO <=0 THEN
								1
							ELSE	
								PONTOS_ESPERADOS_JUNHO
						END  AS DECIMAL )
										 )
										  )
										   *100) over (partition by cadastro_id) JUNHO,
		sum(
			(CAST(JULHO AS decimal)/ 
				(CAST(
						CASE
							WHEN PONTOS_ESPERADOS_JULHO <=0 THEN
								1
							ELSE	
								PONTOS_ESPERADOS_JULHO
						END  AS DECIMAL )
										 )
										  )
										   *100) over (partition by cadastro_id) JULHO,
		sum(
			(CAST(AGOSTO AS decimal)/ 
				(CAST(
						CASE
							WHEN PONTOS_ESPERADOS_AGOSTO <=0 THEN
								1
							ELSE	
								PONTOS_ESPERADOS_AGOSTO
						END  AS DECIMAL )
										 )
										  )
										   *100) over (partition by cadastro_id) AGOSTO,
		sum(
			(CAST(SETEMBRO AS decimal)/ 
				(CAST(
						CASE
							WHEN PONTOS_ESPERADOS_SETEMBRO <=0 THEN
								1
							ELSE	
								PONTOS_ESPERADOS_SETEMBRO
						END  AS DECIMAL )
										 )
										  )
										   *100) over (partition by cadastro_id) SETEMBRO,
		sum(
			(CAST(OUTUBRO AS decimal)/ 
				(CAST(
						CASE
							WHEN PONTOS_ESPERADOS_OUTUBRO <=0 THEN
								1
							ELSE	
								PONTOS_ESPERADOS_OUTUBRO
						END  AS DECIMAL )
										 )
										  )
										   *100) over (partition by cadastro_id) OUTUBRO,
		sum(
			(CAST(NOVEMBRO AS decimal)/ 
				(CAST(
						CASE
							WHEN PONTOS_ESPERADOS_NOVEMBRO <=0 THEN
								1
							ELSE	
								PONTOS_ESPERADOS_NOVEMBRO
						END  AS DECIMAL )
										 )
										  )
										   *100) over (partition by cadastro_id) NOVEMBRO,
		sum(
			(CAST(DEZEMBRO AS decimal)/ 
				(CAST(
						CASE
							WHEN PONTOS_ESPERADOS_DEZEMBRO <=0 THEN
								1
							ELSE	
								PONTOS_ESPERADOS_DEZEMBRO
						END  AS DECIMAL )
										 )
										  )
										   *100) over (partition by cadastro_id) DEZEMBRO
INTO
			DBO.FATO_aproveitamento_mensal_2022
FROM CADASTRO
LEFT JOIN PONTOS 
	ON  CADASTRO_id = PONTOS.ID


CREATE INDEX  idx_fato_aproveitamento_mensal_2022 ON DBO.FATO_aproveitamento_mensal_2022 (id);



select * from FATO_aproveitamento_mensal_2022

