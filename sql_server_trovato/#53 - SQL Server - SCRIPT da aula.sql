/*
   _____ ____    __       _____ __________ _    ____________ 
  / ___// __ \  / /      / ___// ____/ __ \ |  / / ____/ __ \
  \__ \/ / / / / /       \__ \/ __/ / /_/ / | / / __/ / /_/ /
 ___/ / /_/ / / /___    ___/ / /___/ _, _/| |/ / /___/ _, _/ 
/____/\___\_\/_____/   /____/_____/_/ |_| |___/_____/_/ |_|  

Function: Validação de CPF no SQL Server

*/

--drop function Trovato.validaCPF;
--11122233344

CREATE FUNCTION Trovato.validaCPF(@vCPF as varchar(11))
returns varchar(11)
as 
begin

	if @vCPF is null return null;

	--Declaração das variáveis
	--------------------------
	declare @strCPF			varchar(11);
	declare @numDV1			int;
	declare @numDV2         int;
	declare @numCheckDV1    int;
	declare @numCheckDV2    int;
	declare @i              int;

	--Inicializar as variáveis
	--------------------------
	select @numDV1 = 0;
	set    @numDV2 = 0;
	set    @strCPF = @vCPF;

	--Tamanho do CPF
	----------------
	if len(@strCPF) < 11
		set @strCPF = concat(replicate('0', 11 - len(@strCPF)), @strCPF);

	--MOD (11) do 1º dígito verificador
	-----------------------------------
	set @numCheckDV1 = cast(substring(@strCPF, 10, 1) as int);
	set @numCheckDV2 = cast(substring(@strCPF, 11, 1) as int);

	set @i = 1;

	while (@i < 10)
	BEGIN
		set @numDV1 = @numDV1 + cast(substring(@strCPF, @i, 1) as int) * @i;
		set @i = @i + 1;
	END

	set @numDV1 = @numDV1 % 11;

	if @numDV1 = 10
		set @numDV1 = 0;

	--Se o numDV1 calculado é igual ao digito do CPF informado
	----------------------------------------------------------
	if @numDV1 != @numCheckDV1
		return 'Inválido';

	set @i = 2

	--MOD (11) do segundo dígito verificador
	----------------------------------------
	while (@i <= 10)
	BEGIN
		set @numDV2 = @numDV2 + substring(@strCPF, @i, 1) * (@i - 1);
		set @i = @i + 1;
	END
		
	set @numDV2 = @numDV2 % 11;

	if @numDV2 = 10
		set @numDV2 = 0;

	if @numDV2 != @numCheckDV2
		return 'Inválido';

	--Final da Function
	-------------------
	return 'Válido!';

end;


select Trovato.validaCPF(11122233396) as status_cpf;

select * from cpfs;
select nome, cpf, Trovato.validaCPF(cpf) from dbo.cpfs;