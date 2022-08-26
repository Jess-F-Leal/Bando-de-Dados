CREATE TABLE empregado (id_empregado serial PRIMARY KEY,
					   nome VARCHAR(40) NOT NULL,
					   email VARCHAR(40) NOT NULL UNIQUE,
					   cargo VARCHAR(40),
					   salario NUMERIC);
					   
INSERT INTO empregado(nome,email,cargo,salario) 
	VALUES ('Adriana', 'adriana@gmail.com', 'Programador', 5000),
		   ('Antonia', 'antonio@gmail.com', 'Analista de Sistema', 6500);
		   
CREATE TABLE empregado_log (id_empregado_log serial PRIMARY KEY,
						id_empregado int,						
						nome varchar(50),
						email varchar(40),
						cargo varchar(50),
						salario numeric,
						data_modificacao timestamp,
						acao varchar(20));

CREATE OR REPLACE FUNCTION  empregado_log_fun()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO empregado_log(id_empregado,nome,salario,data_modificacao,acao)	
			VALUES (NEW.id_empregado,NEW.nome,NEW.salario,now(),'update');
RETURN NEW;		
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER empregado_trigger_log
AFTER UPDATE
ON empregado
FOR EACH ROW 
EXECUTE PROCEDURE empregado_log_fun();

UPDATE empregado SET nome = 'Ana Luiza', salario = 6800 WHERE id_empregado  = 1

CREATE OR REPLACE FUNCTION  empregado_log_fun_delete()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO empregado_log(id_empregado,nome,salario,data_modificacao,acao)	
			VALUES (OLD.id_empregado,OLD.nome,OLD.salario,now(),'delete');
RETURN NEW;		
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER empregado_trigger_log_delete
AFTER DELETE
ON empregado
FOR EACH ROW 
EXECUTE PROCEDURE empregado_log_fun_delete();

DELETE FROM empregado WHERE id_empregado  = 1;

SELECT * FROM empregado;
SELECT * FROM empregado_log;


