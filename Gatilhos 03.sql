-- Codigo = sequence 

CREATE TABLE TB_PRODUTO (
    CODIGO NUMBER(3) PRIMARY KEY,
    DESCRICAO VARCHAR2(100) NOT NULL,
    PRECO NUMBER(10,2) NOT NULL
);

CREATE SEQUENCE SQ_PRODUTO
    START WITH 1
    INCREMENT BY 1;
-----------------------------------------------

CREATE OR REPLACE TRIGGER TG_GERAR_VALORES 
BEFORE INSERT ON TB_PRODUTO
FOR EACH ROW
BEGIN
   :NEW.CODIGO := SQ_PRODUTO.nextval;
END;
-----------------------------------------------
-- TESTES 
INSERT INTO tb_produto (descricao, preco)
values ('COCA-COLA', 2.00);

INSERT INTO tb_produto (descricao, preco)
values ('ARROZ', 5.00);

SELECT * FROM tb_produto;

