use oficina;

INSERT INTO cliente (nome, telefone, email)
VALUES ('João Silva', '923456789', 'jsilva@oba.com'),
  ('Maria Antônia', '967878912', 'mantonia@oba.com'),
  ('Pedro Carlos', '94897191', 'pcarlos@oba.com');



INSERT INTO fabricante (fabricante)
VALUES ('GM'),
  ('VW'),
  ('FIAT');



INSERT INTO modelo (modelo, fabricante_idfabricante)
VALUES ('Astra', 1),
  ('Gol', 2),
  ('Punto', 3);



INSERT INTO veículo (cliente_idcliente, cor, placa, modelo_idmodelo)
VALUES (1, 'Branco', 'ABC-1234', 1),
  (2, 'Prata', 'CEF-6587', 2),
  (3, 'Vermelho', 'FEG-2587', 3);



INSERT INTO equipe_mecânicos (
    nome_equipe,
    veículo_idveículo,
    veículo_cliente_idcliente
  )
VALUES ('Revisão', 1, 1),
  ('Balanceamento', 2, 2),
  ('Mecânica Geral', 3, 3);





INSERT INTO Especialidade (Descrição) VALUES
            ('Revisão'),
            ('Balanceamento'),
            ('Mecânica Geral');


INSERT INTO mecânico (
    nome,
    endereço,
    Especialidade_idEspecialidade,
    equipe_mecânicos_idequipe_mecânicos,
    equipe_mecânicos_veículo_idveículo,
    equipe_mecânicos_veículo_cliente_idcliente
  )
VALUES ('Antonio Bento', 'Rua A', 1, 1, 1, 1),
  ('Antonio Silva', 'Rua B', 2, 1, 1, 1),
  ('Antonio Branco', 'Rua C', 3, 1, 1, 1);
            





INSERT INTO serviço (nome, valor)
VALUES ('Amortecedores',  150.00),
  ('Escapamento', 120.00),
  ('Revisão', 859.00);




INSERT INTO peças (nome, valor)
VALUES ('Para-brisa',  50.00),
  ('Radiador', 420.00),
  ('Bobinas', 519.00);

INSERT INTO os (
    data_emissão,
    status_os,
    data_conclusão,
    equipe_mecânicos_idequipe_mecânicos,
    equipe_mecânicos_veículo_idveículo,
    equipe_mecânicos_veículo_cliente_idcliente,
    serviço_idserviço,
    os_peças_peças_idpeças,
    peças_idpeças,
    data_autorizacao_execucao_cliente
  )
VALUES ('2022-01-14', 'Fechada', '2022-01-15', 1, 1, 1, 1, 1, 1,'2022-01-14'),
  ('2022-01-14', 'Fechada', '2022-01-18', 2, 2, 2, 2, 2, 2,'2022-01-14'),
  ('2022-01-14', 'Fechada', '2022-01-19', 2, 2, 2, 2, 2, 2,'2022-01-14');
