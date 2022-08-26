CREATE TABLE marca (codigo_marca serial PRIMARY KEY, nome VARCHAR(30));

INSERT INTO marca (nome) VALUES('Hyunday');
INSERT INTO marca (nome) VALUES('Ford');
INSERT INTO marca (nome) VALUES('Renault');
INSERT INTO marca (nome) VALUES('Nissan');
INSERT INTO marca (nome) VALUES('Kia');
INSERT INTO marca (nome) VALUES('Fiat');
INSERT INTO marca (nome) VALUES('VW');

CREATE TABLE modelo (codigo_modelo serial PRIMARY KEY, 
					 descricao VARCHAR(40), 
					 preco NUMERIC, 
					 codigo_marca INT, 
					 FOREIGN KEY (codigo_marca) REFERENCES marca(codigo_marca) ON UPDATE CASCADE ON DELETE CASCADE);
					 
INSERT INTO modelo (descricao,preco,codigo_marca) VALUES('Gol',30000,7);
INSERT INTO modelo (descricao,preco,codigo_marca) VALUES('HB20',32000,1);
INSERT INTO modelo (descricao,preco,codigo_marca) VALUES('HB20S',36000,1);
INSERT INTO modelo (descricao,preco,codigo_marca) VALUES('Cerato',26200,5);
INSERT INTO modelo (descricao,preco,codigo_marca) VALUES('Ka',23500,2);
INSERT INTO modelo (descricao,preco,codigo_marca) VALUES('ECO SPORT',5500,2);
INSERT INTO modelo (descricao,preco,codigo_marca) VALUES('SIENA',45000,6)
					 
--JOIN
SELECT mo.descricao,mo.preco,ma.nome FROM modelo mo, marca ma
WHERE mo.codigo_marca = ma.codigo_marca;

SELECT * FROM modelo 
WHERE preco > (SELECT round (AVG(preco),2) media FROM modelo);

SELECT round (AVG(preco),2)AS MEDIA_Hyunday FROM modelo WHERE codigo_marca = 1; 

SELECT codigo_marca, MIN(preco) FROM modelo GROUP BY codigo_marca;

SELECT codigo_marca, MIN(preco) FROM modelo GROUP BY codigo_marca
HAVING min(preco) > 25000;

SELECT * FROM marca;
SELECT * FROM modelo;

SELECT * FROM marca WHERE NOT EXISTS(
SELECT * FROM modelo WHERE modelo.codigo_marca = marca.codigo_marca);
