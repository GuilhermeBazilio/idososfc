select id,atleta, presenca
from 
(select atleta.id, jogo.atleta,
count(*) over(partition by jogo.atleta) as presenca
from dim_atletas atleta
inner join fato_historico_jogos jogo
on atleta.atleta = jogo.atleta
) as tb
group by id,atleta, presenca