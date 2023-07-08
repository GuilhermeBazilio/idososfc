CREATE FUNCTION IDOSOS_STG.f_qtd_partidas_mes(@Mes INT,@Ano INT)
RETURNS INT
AS
BEGIN
    DECLARE @DataInicio DATE, @DataFim DATE, @QTDE INT;
    
    SET @DataInicio = DATEFROMPARTS(@Ano, @Mes, 1);
    SET @DataFim = DATEADD(DAY, -1, DATEADD(MONTH, 1, @DataInicio));
    
    SET @QTDE = (
        SELECT COUNT(*) AS Quantidade_Quintas
        FROM (
            SELECT DATEPART(WEEKDAY, Data) AS DiaSemana
            FROM (
                SELECT TOP (DATEDIFF(DAY, @DataInicio, @DataFim) + 1)
                    DATEADD(DAY, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1, @DataInicio) AS Data
                FROM sys.columns
            ) AS DatasMes
            --WHERE DiaSemana = 5 -- 5 representa quinta-feira na função DATEPART
        ) AS Quintas
        WHERE DiaSemana = 5 -- 5 representa quinta-feira na função DATEPART
    );
    
    RETURN @QTDE;
END;


