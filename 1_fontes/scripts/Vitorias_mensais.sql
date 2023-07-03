DROP TABLE dbo.FATO_derrotas_2022;

with CADASTRO(CADASTRO_id, CADASTRO_atleta)
as
(
	SELECT ATLETA.ID,
		ATLETA.ATLETA
	FROM dim_atletas ATLETA
)
,

JANEIRO ( JANEIRO_ID,JANEIRO_ATLETA,JANEIRO_2O22)
AS
(
	select * 
	from (
			select atleta.id id , atleta.atleta atleta ,
			count(*) over(partition by atleta.atleta) as jan_2022
			from dim_atletas atleta
			left join fato_historico_jogos jogos
			on atleta.atleta = jogos.atleta
			where month(jogos.jogo) = 1				
			and jogos.RESULTADO = 'V'
			) tbl
	group by id,atleta,jan_2022
),

FEVEREIRO ( FEVEREIRO_ID,FEVEREIRO_ATLETA,FEVEREIRO_2022)
AS
(
	select * 
	from (
			select atleta.id id , atleta.atleta atleta ,
			count(*) over(partition by atleta.atleta) as FEV_2022
			from dim_atletas atleta
			left join fato_historico_jogos jogos
			on atleta.atleta = jogos.atleta
			where month(jogos.jogo) = 2				
			and jogos.RESULTADO = 'V'
			) tbl
	group by id,atleta,FEV_2022
),
MARCO ( MARCO_ID,MARCO_ATLETA,MARCO_2022)
AS
(
	select * 
	from (
			select atleta.id id , atleta.atleta atleta ,
			count(*) over(partition by atleta.atleta) as MARCO_2022
			from dim_atletas atleta
			left join fato_historico_jogos jogos
			on atleta.atleta = jogos.atleta
			where month(jogos.jogo) = 3				
			and jogos.RESULTADO = 'V'
			) tbl
	group by id,atleta,MARCO_2022
)
,
ABRIL ( ABRIL_ID,ABRIL_ATLETA,ABRIL_2022)
AS
(
	select * 
	from (
			select atleta.id id , atleta.atleta atleta ,
			count(*) over(partition by atleta.atleta) as ABRIL_2022
			from dim_atletas atleta
			left join fato_historico_jogos jogos
			on atleta.atleta = jogos.atleta
			where month(jogos.jogo) = 4			
			and jogos.RESULTADO = 'V'
			) tbl
	group by id,atleta,ABRIL_2022
)
,
MAIO ( MAIO_ID,MAIO_ATLETA,MAIO_2022)
AS
(
	select * 
	from (
			select atleta.id id , atleta.atleta atleta ,
			count(*) over(partition by atleta.atleta) as MAIO_2022
			from dim_atletas atleta
			left join fato_historico_jogos jogos
			on atleta.atleta = jogos.atleta
			where month(jogos.jogo) = 5		
			and jogos.RESULTADO = 'V'
			) tbl
	group by id,atleta,MAIO_2022
)
,
JUNHO ( JUNHO_ID,JUNHO_ATLETA,JUNHO_2022)
AS
(
	select * 
	from (
			select atleta.id id , atleta.atleta atleta ,
			count(*) over(partition by atleta.atleta) as JUNHO_2022
			from dim_atletas atleta
			left join fato_historico_jogos jogos
			on atleta.atleta = jogos.atleta
			where month(jogos.jogo) = 6	
			and jogos.RESULTADO = 'V'
			) tbl
	group by id,atleta,JUNHO_2022
)
,
JULHO ( JULHO_ID,JULHO_ATLETA,JULHO_2022)
AS
(
	select * 
	from (
			select atleta.id id , atleta.atleta atleta ,
			count(*) over(partition by atleta.atleta) as JULHO_2022
			from dim_atletas atleta
			left join fato_historico_jogos jogos
			on atleta.atleta = jogos.atleta
			where month(jogos.jogo) = 7	
			and jogos.RESULTADO = 'V'
			) tbl
	group by id,atleta,JULHO_2022
)
,
AGOSTO ( AGOSTO_ID,AGOSTO_ATLETA,AGOSTO_2022)
AS
(
	select * 
	from (
			select atleta.id id , atleta.atleta atleta ,
			count(*) over(partition by atleta.atleta) as AGOSTO_2022
			from dim_atletas atleta
			left join fato_historico_jogos jogos
			on atleta.atleta = jogos.atleta
			where month(jogos.jogo) = 8
			and jogos.RESULTADO = 'V'
			) tbl
	group by id,atleta,AGOSTO_2022
)
,
SETEMBRO ( SETEMBRO_ID,SETEMBRO_ATLETA,SETEMBRO_2022)
AS
(
	select * 
	from (
			select atleta.id id , atleta.atleta atleta ,
			count(*) over(partition by atleta.atleta) as SETEMBRO_2022
			from dim_atletas atleta
			left join fato_historico_jogos jogos
			on atleta.atleta = jogos.atleta
			where month(jogos.jogo) = 9
			and jogos.RESULTADO = 'V'
			) tbl
	group by id,atleta,SETEMBRO_2022
)
,
OUTUBRO ( OUTUBRO_ID,OUTUBRO_ATLETA,OUTUBRO_2022)
AS
(
	select * 
	from (
			select atleta.id id , atleta.atleta atleta ,
			count(*) over(partition by atleta.atleta) as OUTUBRO_2022
			from dim_atletas atleta
			left join fato_historico_jogos jogos
			on atleta.atleta = jogos.atleta
			where month(jogos.jogo) = 10
			and jogos.RESULTADO = 'V'
			) tbl
	group by id,atleta,OUTUBRO_2022
)
,
NOVEMBRO ( NOVEMBRO_ID,NOVEMBRO_ATLETA,NOVEMBRO_2022)
AS
(
	select * 
	from (
			select atleta.id id , atleta.atleta atleta ,
			count(*) over(partition by atleta.atleta) as NOVEMBRO_2022
			from dim_atletas atleta
			left join fato_historico_jogos jogos
			on atleta.atleta = jogos.atleta
			where month(jogos.jogo) = 11
			and jogos.RESULTADO = 'V'
			) tbl
	group by id,atleta,NOVEMBRO_2022
)

,
DEZEMBRO ( DEZEMBRO_ID,DEZEMBRO_ATLETA,DEZEMBRO_2022)
AS
(
	select * 
	from (
			select atleta.id id , atleta.atleta atleta ,
			count(*) over(partition by atleta.atleta) as DEZEMBRO_2022
			from dim_atletas atleta
			left join fato_historico_jogos jogos
			on atleta.atleta = jogos.atleta
			where month(jogos.jogo) = 12
			and jogos.RESULTADO = 'V'
			) tbl
	group by id,atleta,DEZEMBRO_2022
)
SELECT CADASTRO_id AS ID,
	   CADASTRO_atleta AS ATLETA,
	   JANEIRO_2O22 AS JANEIRO,
	   FEVEREIRO_2022 AS FEVEREIRO,
	   MARCO_2022 AS MARCO,
	   ABRIL_2022 AS ABRIL,
	   MAIO_2022 AS MAIO,
	   JUNHO_2022 AS JUNHO,
	   JULHO_2022 AS JULHO,
	   AGOSTO_2022 AS AGOSTO,
	   SETEMBRO_2022 AS SETEMBRO,
	   OUTUBRO_2022 AS OUTUBRO,
	   NOVEMBRO_2022 AS NOVEMBRO,
	   DEZEMBRO_2022 AS DEZEMBRO
INTO
			DBO.FATO_derrotas_2022
FROM CADASTRO
LEFT JOIN JANEIRO
	ON  CADASTRO_id = JANEIRO_ID
LEFT JOIN FEVEREIRO
	ON  CADASTRO_id = FEVEREIRO_ID
LEFT JOIN MARCO
	ON  CADASTRO_id = MARCO_ID
LEFT JOIN ABRIL
	ON  CADASTRO_id = ABRIL_ID
LEFT JOIN MAIO
	ON  CADASTRO_id = MAIO_ID
LEFT JOIN JUNHO
	ON  CADASTRO_id = JUNHO_ID
LEFT JOIN JULHO
	ON  CADASTRO_id = JULHO_ID
LEFT JOIN AGOSTO
	ON  CADASTRO_id = AGOSTO_ID
LEFT JOIN SETEMBRO
	ON  CADASTRO_id = SETEMBRO_ID
LEFT JOIN OUTUBRO
	ON  CADASTRO_id = OUTUBRO_ID
LEFT JOIN NOVEMBRO
	ON  CADASTRO_id = NOVEMBRO_ID
LEFT JOIN DEZEMBRO
	ON  CADASTRO_id = DEZEMBRO_ID

CREATE INDEX  idx_fato_presenca ON DBO.FATO_derrotas_2022 (id);


