delimiter //

create procedure 

insertPeca(

    IN cod varchar(5),

    IN nome varchar(255),

    IN cor varchar(255),

    in peso int,

    in cidade varchar(255))

begin

    insert into tb_peca(

        codPeca,

        nomePeca,

        corPeca,

        pesoPeca,

        cidadePeca

    ) values (

        cod,

        nome,

        cor,

        peso,

        cidade

    );

end //

delimiter ;

 

call func_agregadas.insertPeca('P4', 'Martelo', 'Azul', 14, 'São Paulo');

 



delimiter //

create procedure insertRandomPECA(IN quantity int)

BEGIN

DECLARE count INT default 0;

DECLARE arrCor varchar(255) default 'azul,verde,vermelho,preto,roxo,amarelo';

DECLARE arrCidade varchar(255) default 'São Paulo, Rio de Janeiro, Acre, Manaus, Minas Gerais, Bahia';

DECLARE arrPeca varchar(255) default 'Marreta, Martelo, Parafuso, Torneira, Cano, Furadeira';

loop_insert: LOOP

    set count = count + 1;

    call func_agregadas.insertPeca(

        CONCAT('P',count),

        SUBSTRING_INDEX(

            SUBSTRING_INDEX(arrPeca, ',', FLOOR(RAND()*(5-1+1))+1),

        ',', -1),

        SUBSTRING_INDEX(

            SUBSTRING_INDEX(arrCor, ',', FLOOR(RAND()*(5-1+1))+1),

        ',', -1),

        FLOOR(RAND()*(100-1)),

        SUBSTRING_INDEX(

            SUBSTRING_INDEX(arrCidade, ',', FLOOR(RAND()*(5-1+1))+1),

        ',', -1)

    );


    if count=quantity then

        leave loop_insert;

    end if;

end loop loop_insert;

END//

DELIMITER ;

 

call func_agregadas.insertRandomPECA(5000);

 

select * from tb_peca;


