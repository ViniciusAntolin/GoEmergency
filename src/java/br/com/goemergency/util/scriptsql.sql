SET TIMEZONE TO 'America/Sao_Paulo';

CREATE TABLE pessoa(
idpessoa int GENERATED ALWAYS AS IDENTITY not null primary key,
cpf varchar(11) not null,
nome varchar(100) not null,
datanascimento Date not null,
email varchar(100) not null,
senha varchar(100) not null,
telefone varchar(11) not null,
idendereco integer not null,
code varchar(5),
isPaciente boolean,
isMedico boolean,
isAdmin boolean,
inactivatedAt Date,
createdAt Date DEFAULT CURRENT_TIMESTAMP,
updatedAt Date DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_id_endereco FOREIGN KEY (idendereco) REFERENCES endereco (idendereco)
);

CREATE TABLE medico(
idmedico int GENERATED ALWAYS AS IDENTITY not null primary key,
crm  varchar(11) not null,
idpessoa int not null,
ufcrm varchar(2),
inactivatedAt Date,
createdAt Date DEFAULT CURRENT_TIMESTAMP,
updatedAt Date DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_medico_pessoa
FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa)
);

CREATE TABLE endereco(
idendereco int GENERATED ALWAYS AS IDENTITY not null primary key,
cidade varchar(100) not null,
estado varchar(100) not null,
rua varchar(150) not null,
numero integer not null,
bairro varchar(150) not null,
cep varchar (8) not null,
inactivatedAt Date,
createdAt Date DEFAULT CURRENT_TIMESTAMP,
updatedAt Date DEFAULT CURRENT_TIMESTAMP
);

       CREATE TABLE sintomas(
    idsintoma integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    nomesintoma varying(500) NOT NULL,
    partecorpo varying(500) NOT NULL,
    CONSTRAINT idsintoma_pkey PRIMARY KEY (idsintoma)
);

INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor de cabeça', 'cabeca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no rosto', 'cabeça');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ou pressão nos seios da face', 'cabeça');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Febre', 'cabeça');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Rosto inchado', 'cabeça');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Fraqueza dos músculos faciais', 'cabeça');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Rosto dormente ou formigando', 'cabeça');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Perda de consciência', 'cabeça');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Memória prejudicada', 'cabeça');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Tonto', 'cabeça');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Sentindo-se enjoado', 'cabeça');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Perda de cabelo', 'cabeça');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Mudanças na pele localizadas do rosto', 'cabeça');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão recente na cabeça', 'cabeça');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nos olhos', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Olho vermelho', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Olhos vermelhos e ardendo', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Olhos coçando', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Olhos marejados', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Olhos amarelos', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao redor ou atrás do olho', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Deficiência visual', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Visão dupla', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Cegueira temporária', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pupilas assimétricas', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Nariz dolorido', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Mudança na pele da pálpebra', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Inchaço ao redor dos olhos', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pálpebras caídas', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Secreção seca nas pálpebras', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Flashes nos olhos', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Sensibilidade à luz', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão grave no olho', 'olhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Nariz dolorido', 'nariz');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Nariz inchado', 'nariz');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Nariz escorrendo', 'nariz');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Nariz entupido', 'nariz');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Nariz ou garganta coçando', 'nariz');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Voz nasal', 'nariz');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Ronco', 'nariz');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Espirro', 'nariz');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dificuldade de sentir cheiro', 'nariz');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ou pressão nos seios da face', 'nariz');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Sangrando pelo nariz', 'nariz');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Muco pingando no fundo da garganta', 'nariz');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão no nariz', 'nariz');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor de ouvido', 'ouvido');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Diminuição da audição', 'ouvido');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Secreção do ouvido', 'ouvido');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Ouvido entupido', 'ouvido');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Coçando dentro do ouvido', 'ouvido');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Ouvidos zumbindo', 'ouvido');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão no ouvido', 'ouvido');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Alterações dentro da boca', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Mau hálito', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Boca seca', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor de dente', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dificuldade de morder e mastigar', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na gengiva', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Gengivas inchadas', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Sangramento nas gengivas', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Língua anormalmente vermelha', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Sensação de queimação na língua', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Tosse', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Ronco', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Vômito', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Tossindo sangue', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Apetite diminuído', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Sede aumentada', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Placas brancas nas amígdalas', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Falta de ar', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão labial', 'boca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor de garganta', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao en,lir', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dificuldade de en,lir', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Garganta vermelha', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Tosse', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Raspando a garganta', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Som de assobio feito durante a respiração', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Muco pingando no fundo da garganta', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Rouquidão', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Nariz ou garganta coçando', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Falta de ar', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no pescoço', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Linfonodos aumentados', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pescoço inchado', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Torcicolo', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Veia do pescoço aumentada', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão no pescoço', 'pescoço e garganta');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Aumento da mama em homem', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no peito', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no peito se espalhando para o membro superior esquerdo', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no peito do tipo pressão', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Azia', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Palpitações', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Batimento cardíaco acelerado', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Ritmo cardíaco lento', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Tosse', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Falta de ar', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Respiração superficial', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Respiração acelerada', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Som de assobio feito durante a respiração', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão torácica', 'peito');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no membro superior', 'braços');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor forte no membro superior', 'braços');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no ombro', 'braços');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao mover o ombro', 'braços');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Articulação difícil de mover', 'braços');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor em ambos os membros superiores', 'braços');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Inchaço do membro superior', 'braços');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Ombro inchado', 'braços');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Formigamento ou dormência de um membro superior', 'braços');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Formigamento ou dormência em ambos os membros superiores', 'braços');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Perda de sensibilidade em ambos os braços', 'braços');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Espasmos nos braços ou mãos', 'braços');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão no braço', 'braços');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no membro superior', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no antebraço', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor em ambos os membros superiores', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor forte no membro superior', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Inchaço do membro superior', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Cotovelo inchado', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Punho inchado', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no punho', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao mover o punho', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no cotovelo', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao mover o cotovelo', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Formigamento ou dormência em ambos os membros superiores', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Mão caída', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Perda de sensibilidade em ambos os braços', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Espasmos nos braços ou mãos', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão no antebraço', 'antebraço');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no punho', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao mover o punho', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na mão ou dedos da mão', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor em um dedo da mão', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na pele ao redor da unha', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Mão inchada', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Punho inchado', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dedo da mão inchado', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Mudanças na pele das mãos', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Mão vermelha', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dedos azul-acinzentados', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pele vermelha nas palmas das mãos', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dedos da mão formigando', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Tremor de ambas as mãos', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Tremor em uma mão', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Perda de massa muscular nas mãos', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Mãos rígidas pela manhã', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dedos ou mãos frias', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão na mão', 'mão');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na barriga', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na região central e superior do abdome', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na parte superior esquerda do abdome', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na parte superior direita do abdome', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor de estôma, em queimação ou al, roendo', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Cólica na barriga', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor abdominal em cãibra', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor de estôma, fina e em pontadas', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao pressionar o abdome', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Azia', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Caroço no barriga', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Aumento do tamanho abdominal', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Inchaço', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Vômito', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Sentindo-se enjoado', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Indigestão', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Vomitando sangue', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Perda de peso', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão abdominal recente', 'abdome superior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na barriga', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no centro da barriga', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor de estôma, em queimação ou al, roendo', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Cólica na barriga', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor abdominal em cãibra', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor de estôma, fina e em pontadas', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao pressionar o abdome', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Caroço no barriga', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Aumento do tamanho abdominal', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Inchaço', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Constipação', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Diarreia', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Vômito', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Sentindo-se enjoado', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Fezes pretas', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Fezes vermelhas', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão abdominal recente', 'abdome médio');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na barriga', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na parte inferior esquerda do abdome', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Cólica na barriga', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor abdominal em cãibra', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na parte inferior direita do abdome', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na parte inferior do abdome', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor de estôma, fina e em pontadas', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao pressionar o abdome', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Inchaço', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Aumento do tamanho abdominal', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Caroço no barriga', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Perda do controle intestinal', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Constipação', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Diarreia', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Fezes pretas', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Fezes vermelhas', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão abdominal recente', 'abdome inferior');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Secreção da uretra', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Fluxo urinário intermitente', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no escroto ou testículo', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Inchaço do escroto', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Sensação de peso no escroto', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Diferença no tamanho dos testículos', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Caroço no escroto', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Disfunção erétil', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Urinando com frequência', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor quando urino', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Urina escura', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Urina vermelha', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Perdendo urina por acidente', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Urinando frequente à noite', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na virilha', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Coceira na virilha', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Necessidade urgente de urinar', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Micção em pequenas quantidades', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Mudanças na pele sobre ou em torno dos órgãos genitais', 'orgãos sexuais');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no membro inferior', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor forte no membro inferior', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na coxa', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor em ambos os membros inferiores', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no quadril', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao mover o quadril', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor lombar se espalhando pela parte de trás da coxa até o joelho', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Mancando devido à dor', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor aguda na coxa ou nádega que surge durante o esforço e alivia após um breve descanso', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao pressionar membro inferior', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Perna inchada', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Inchaço da articulação do quadril', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pernas inchadas', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Formigamento ou dormência em um membro inferior', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Formigamento ou dormência em ambos os membros inferiores', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Estrias vermelhas na barriga, quadris ou coxas', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão na coxa', 'coxa');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no membro inferior', 'joelhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor forte no membro inferior', 'joelhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor em ambos os membros inferiores', 'joelhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor em apenas um joelho', 'joelhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao mover o joelho', 'joelhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao pressionar a articulação', 'joelhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Juntas rígidas', 'joelhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Mancando devido à dor', 'joelhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Joelho inchado', 'joelhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Andar mais lento', 'joelhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Estalos da articulação durante o movimento', 'joelhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão no joelho', 'joelhos');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no membro inferior', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor em ambos os membros inferiores', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor forte no membro inferior', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na panturrilha', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao pressionar a panturrilha', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor forte na panturrilha ao andar', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor em apenas um joelho', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Perna inchada', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pernas inchadas', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Formigamento ou dormência em um membro inferior', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Formigamento ou dormência em ambos os membros inferiores', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão na perna', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Cãibras na panturrilha', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pernas pesadas no final do dia', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Perda de sensibilidade em apenas um braço ou perna', 'panturrilha');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor em um pé', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no dedo do pé', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Unha dolorida', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na pele ao redor da unha', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no tornozelo', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no dedão do pé', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pés formigando ou dormentes', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pés inchados', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dedo do pé inchado', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Mudanças na pele dos pés', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Unhas espessadas', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pontas dos dedos e unhas aumentadas', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Descoloração marrom nas unhas', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pontos brancos na unha', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Unhas amareladas', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pés e dedos dos pés frios', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Queda da parte da frente do pé', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão no dedo do pé', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nos dois pés', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão no pé', 'pé');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no pescoço', 'nuca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pescoço dói em apenas um lado', 'nuca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Torcicolo', 'nuca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dificuldade em se curvar', 'nuca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Pescoço inchado', 'nuca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão no pescoço', 'nuca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão de chicote', 'nuca');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas', 'costas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas que vem e vai', 'costas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas que piora após atividade física', 'costas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas de repente', 'costas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas forte', 'costas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no meio ou parte superior das costas', 'costas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas que diminui durante o repouso', 'costas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas durando várias horas', 'costas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Coluna rígida pela manhã', 'costas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Assimetria da coluna vertebral', 'costas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dificuldade em se curvar', 'costas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão nas costas', 'costas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no membro superior', 'cotovelo');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor forte no membro superior', 'cotovelo');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no cotovelo', 'cotovelo');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao mover o cotovelo', 'cotovelo');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Cotovelo inchado', 'cotovelo');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão no cotovelo', 'cotovelo');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Articulação difícil de mover', 'cotovelo');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor na região lombar', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas que vem e vai', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas de repente', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas forte', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas que piora após atividade física', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor lombar se espalhando para a virilia', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas que diminui durante o repouso', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas costas durando várias horas', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor lombar se espalhando pela parte de trás da coxa até o joelho', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Sensibilidade muscular paravertebral', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dificuldade em se curvar', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Coluna rígida pela manhã', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Lesão nas costas', 'lombar');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas nádegas', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no quadril', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao mover o quadril', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor no membro inferior', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor em ambos os membros inferiores', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor aguda na coxa ou nádega que surge durante o esforço e alivia após um breve descanso', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor lombar se espalhando pela parte de trás da coxa até o joelho', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Inchaço da articulação do quadril', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor anorretal', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Sangramento pelo ânus', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Úlcera, ferida ou abscesso perto do ânus', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Ânus coçando', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Fezes vermelhas', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Fezes pretas', 'nádegas');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor anorretal', 'ânus');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor nas nádegas', 'ânus');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Dor ao defecar', 'ânus');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Ânus coçando', 'ânus');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Úlcera, ferida ou abscesso perto do ânus', 'ânus');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Fezes vermelhas', 'ânus');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Sangramento pelo ânus', 'ânus');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Fezes pretas', 'ânus');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Fezes com odor fétido', 'ânus');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Diarreia', 'ânus');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Diarreia com mais de  evacuações por dia', 'ânus');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Constipação', 'ânus');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Perda do controle intestinal', 'ânus');
INSERT INTO sintomas (nomesintoma, partecorpo) VALUES ('Vermes nas fezes ou ao redor do ânus', 'ânus')

CREATE TABLE DOENCA (
 	IDDOENCA INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	NOMEDOENCA VARCHAR(500) NOT NULL,
	DESCRICAO VARCHAR(8000) NOT NULL,
	CAUSAS VARCHAR(8000) NOT NULL,
	DIAGNOSTICO VARCHAR(8000) NOT NULL,
	TRATAMENTO VARCHAR(8000) NOT NULL,
	PREVENCAO VARCHAR(8000) NOT NULL,
	MEDICOESPECIALISTA VARCHAR(500) NOT NULL,
)

INSERT INTO Doenca (NOMEDOENCA, DESCRICAO, CAUSAS, DIAGNOSTICO, TRATAMENTO, MEDICOESPECIALISTA, PREVENCAO) VALUES ('Resfriado Comum', 'Resfriado comum é uma infecção viral aguda, normalmente afebril e autolimitada, que envolve sintomas respiratórios superiores, como rinorreia, tosse e dor de garganta. O diagnóstico é clínico. Lavar as mãos ajuda a prevenir sua disseminação. O tratamento é de suporte.', 'Depois de um período de incubação de 24 a 72 horas, os sinais e sintomas do resfriado começam com faringite seguida de espirros, rinorreia, obstrução nasal e mal-estar. A temperatura é habitualmente normal, em particular quando o patógeno é um rinovírus ou um coronavírus. Secreções nasais são aquosas e profusas durante os primeiros dias, tornando-se, em seguida, mais mucoides e purulentas. Secreções mucopurulentas não indicam infecção secundária bacteriana. A tosse costuma ser leve, mas muitas vezes persiste até a 2ª semana. A maioria dos sintomas decorrentes de resfriados não complicados se resolve dentro de 10 dias. Resfriados podem exacerbar a asma e a bronquite crônica. Secreção purulenta ou sintomas significantes do trato respiratório inferior são incomuns na infecção por rinovírus. Sinusite e otite média purulentas podem resultar da própria infecção viral ou de infecção secundária.', 'O diagnóstico do resfriado comum geralmente é clínico, sem exames complementares, embora existam testes por reação em cadeia da polimerase (PCR [polymerase chain reaction]) disponíveis em muitas plataformas multiplex. Rinite alérgica é a consideração mais importante para o diagnóstico diferencial.', 'Não existe tratamento específico para o resfriado comum. Antipiréticos e analgésicos podem aliviar a febre ou a dor de garganta. A obstrução nasal pode melhorar com descongestionantes nasais. Descongestionantes nasais tópicos são mais eficazes do que os orais, mas o uso de medicamentos tópicos por > 3 a 5 dias pode causar congestão de rebote. Pode-se aliviar a rinorreia com anti-histamínicos de 1ª geração (p. ex., clorfeniramina) ou brometo de ipratrópio intranasal (2 borrifos da solução a 0,03%, 2 ou 3 vezes ao dia); mas devem ser evitados para os idosos e os pacientes com hipertrofia benigna da próstata ou glaucoma. Anti-histamínicos de 1ª geração com frequência produzem sedação, mas anti-histamínicos de 2ª geração (não sedativos) são ineficazes para tratar o resfriado comum. Anti-histamínicos e descongestionantes não são recomendados para crianças < 4 anos. Zinco, equinácea e vitamina C têm sido avaliados como terapias para resfriado comum, mas nenhum tem demonstrado ser claramente benéfico.', 'Clinico Geral', 'Não há vacinas para o resfriado comum. Vacinas bacterianas polivalentes, frutas cítricas, vitaminas, luz ultravioleta, aerossóis de glicol e outros remédios folclóricos não previnem o resfriado comum. Lavar as mãos e usar desinfetantes de superfície em um ambiente contaminado podem reduzir a disseminação da infecção. Antibióticos não devem ser administrados, a menos que haja evidência de infecção bacteriana secundária. Em pacientes com doença pulmonar crônica, podem ser administrados antibióticos com menos restrição.');
INSERT INTO Doenca (NOMEDOENCA, DESCRICAO, CAUSAS, DIAGNOSTICO, TRATAMENTO, MEDICOESPECIALISTA, PREVENCAO) VALUES ('Diabetes', 'A diabetes é uma doença crônica caracterizada pelo aumento dos níveis de açúcar no sangue, o que pode provocar danos em vários órgãos, se não for tratado. Existem quatro tipos principais de diabetes: a diabetes tipo 1, a diabetes tipo 2, a diabetes gestacional e a pré-diabetes.', 'As causas da diabetes variam de acordo com o tipo de diabetes: 1. Diabetes tipo 1 Não se conhece a causa exata da diabetes tipo 1, no entanto, sabe-se que o sistema imune identifica as células ß do pâncreas, responsáveis pela produção de insulina, e causa a sua destruição, sendo por isso conhecida como uma doença autoimune. Uma vez que não é causada pelo estilo de vida, a diabetes tipo 1 pode estar presente desde o nascimento, sendo identificada durante a infância ou adolescência. 2. Diabetes tipo 2 A diabetes tipo 2 é principalmente causada por maus hábitos alimentares, especialmente o consumo excessivo de alimentos com açúcar ou carboidratos. Além disso, ter um estilo de vida sedentário também pode contribuir para o aparecimento da diabetes. Pessoas com acúmulo de gordura na região abdominal também parecem ter maior risco de diabetes tipo 2, já que as células de gordura parecem contribuir para a resistência à insulina. 3. Diabetes gestacional A diabetes gestacional se desenvolve principalmente devido aos hormônios que são produzidos pela placenta durante a gravidez. Esses hormônios parecem bloquear parcialmente a ação da insulina, fazendo com que seja mais fácil aumentar os níveis de açúcar no sangue durante a gestação. Ainda assim, mulheres que têm excesso de peso, que ganharam muito peso durante a gravidez, que já tiveram diabetes gestacional ou que têm histórico de diabetes tipo 2 na família, parecem ter maior risco de desenvolver diabetes gestacional.', 'Causas de diabetes As causas da diabetes variam de acordo com o tipo de diabetes: 1. Diabetes tipo 1 Não se conhece a causa exata da diabetes tipo 1, no entanto, sabe-se que o sistema imune identifica as células ß do pâncreas, responsáveis pela produção de insulina, e causa a sua destruição, sendo por isso conhecida como uma doença autoimune. Uma vez que não é causada pelo estilo de vida, a diabetes tipo 1 pode estar presente desde o nascimento, sendo identificada durante a infância ou adolescência. 2. Diabetes tipo 2 A diabetes tipo 2 é principalmente causada por maus hábitos alimentares, especialmente o consumo excessivo de alimentos com açúcar ou carboidratos. Além disso, ter um estilo de vida sedentário também pode contribuir para o aparecimento da diabetes. Pessoas com acúmulo de gordura na região abdominal também parecem ter maior risco de diabetes tipo 2, já que as células de gordura parecem contribuir para a resistência à insulina. 3. Diabetes gestacional A diabetes gestacional se desenvolve principalmente devido aos hormônios que são produzidos pela placenta durante a gravidez. Esses hormônios parecem bloquear parcialmente a ação da insulina, fazendo com que seja mais fácil aumentar os níveis de açúcar no sangue durante a gestação. Ainda assim, mulheres que têm excesso de peso, que ganharam muito peso durante a gravidez, que já tiveram diabetes gestacional ou que têm histórico de diabetes tipo 2 na família, parecem ter maior risco de desenvolver diabetes gestacional.', 'O tratamento da diabetes tem como principais objetivos melhorar a qualidade de vida, aliviando os sintomas, e evitar o desenvolvimento de complicações de saúde mais graves. Embora alguns cuidados sejam considerados gerais para tratar qualquer tipo de diabetes, como planejar o tipo de alimentos que se ingere e fazer exercício físico regular, o tratamento pode variar um pouco de acordo com o tipo da diabetes: 1. Diabetes tipo 1 O principal tratamento para a diabetes tipo 1 é o uso diário de insulina injetável, pois, como o corpo não consegue produzir o hormônio, a insulina precisa ser injetada no corpo. Normalmente, é aplicada uma injeção ao início do dia, de ação lenta, para manter um nível basal do hormônio no organismo, mas também é necessário medir a glicemia antes e após as refeições para avaliar se é necessário fazer alguma injeção extra, geralmente de uma insulina rápida ou ultra-rápida. Além da insulina, também é recomendado manter um planeamento das refeições, especialmente sobre a quantidade de açúcar e carboidratos consumidos, assim como adotar um estilo de vida ativo, com a prática regular de exercício físico. 2. Diabetes tipo 2 O tratamento da diabetes tipo 2 nem sempre precisa começar sendo feito com remédios porque, dependendo dos níveis de açúcar no sangue, pode ser possível controlar a glicose apenas com alterações no estilo de vida, principalmente na dieta, com redução da ingestão de alimentos açucarados e carboidratos, assim como a prática regular de exercício físico. Nos casos em que é necessário fazer uso de remédios, o médico pode receitar o uso de dois tipos diferentes: Antidiabéticos orais: são a primeira linha de tratamento medicamentoso da diabetes tipo 2 e ajudam a manter os níveis de açúcar controladas através de vários mecanismos, seja estimulando a produção de insulina pelo pâncreas, eliminando glicose pela urina ou diminuindo a produção de glicose pelo fígado; Insulina: é usada quando os antidiabéticos orais não foram suficientes para controlar a glicose ou quando os antidiabéticos não são uma opção de tratamento, como no caso de pessoas com insuficiência renal. No caso de se fazer uso de insulina é importante fazer uma avaliação diária e regular da glicemia capilar, principalmente antes e depois das refeições através de um glicosímetro, que é um aparelho que mede a glicemia capilar. 3. Diabetes gestacional O tratamento da diabetes gestacional é feito essencialmente com alterações na dieta e prática regular de exercício físico, pois são medidas naturais que permitem controlar os níveis de glicemia no sangue. Porém, caso as alterações no estilo de vida não estejam sendo suficientes para controlar os níveis de açúcar e caso os valores de glicemia estejam sempre muito altos, o médico pode aconselhar o uso de antidiabéticos orais ou insulina, sendo também importante fazer a medição regular dos níveis de glicemia em casa, utilizando um aparelho para medir o nível de açúcar no sangue.', 'Endocrinologista / Nuticionista / Clinico Geral', 'Reduzir o consumo de sal, açúcar e gorduras. Parar de fumar. Praticar exercícios físicos regularmente, (pelo menos 30 minutos todos os dias). Manter o peso controlado.');
INSERT INTO Doenca (NOMEDOENCA, DESCRICAO, CAUSAS, DIAGNOSTICO, TRATAMENTO, MEDICOESPECIALISTA, PREVENCAO) VALUES ('Hipertensão', 'Condição em que a força do sangue contra a parede das artérias é muito grande. Normalmente, a hipertensão é definida como a pressão arterial acima de 14/9 e é considerada grave quando a pressão está acima de 18/12. Em geral, a pressão arterial elevada não tem sintomas. Ao longo do tempo, se não for tratada, poderá causar problemas de saúde, como doenças cardíacas e acidente vascular cerebral. Adotar uma dieta saudável com menos sal, praticar exercícios físicos regularmente e tomar medicamentos pode ajudar a baixar a pressão arterial.', 'A hipertensão, em 90% dos casos, é herdada dos pais por fatores genéticos. Além disso, existem hábitos que influenciam nos níveis da pressão arterial. Na lista de costumes prejudiciais estão: fumo, consumo elevado de álcool e bebidas alcoólicas e falta de atividade física. Há, ainda, condições como obesidade, estresse e colesterol em níveis elevados que podem desencadear a hipertensão. É importante destacar, também, que a incidência da doença aumenta com a idade. Consequentemente, idosos devem estar mais atentos e cuidadosos em relação à alimentação, principalmente, em busca da prevenção.', 'Medir a pressão regularmente é a única maneira de diagnosticar a hipertensão. Pessoas acima de 20 anos de idade devem medir a pressão ao menos umavez por ano. Se houver hipertensos na família, deve-se medir no mínimo duas vezes por ano.', 'O tratamento é feito por meio de cuidados individuais e do uso de diuréticos Adotar uma dieta saudável com menos sal, praticar exercícios físicos regularmente e tomar medicamentos pode ajudar a baixar a pressão arterial.', 'Cardiologista / Nefrologista / Clinico Geral', 'A pressão alta não tem cura, mas tem tratamento e pode ser controlada. Somente o médico poderá determinar o melhor método para cada paciente, mas além dos medicamentos disponíveis atualmente, é imprescindível adotar um estilo de vida saudável.');
INSERT INTO Doenca (NOMEDOENCA, DESCRICAO, CAUSAS, DIAGNOSTICO, TRATAMENTO, MEDICOESPECIALISTA, PREVENCAO) VALUES ( 'Asma', 'Asma é uma doença crônica que acomete as vias respiratórias, especialmente os brônquios, que são os canais por onde o ar passa até chegar nos pulmões, fazendo com que fiquem inflamadas, inchadas e produzam muco, ou secreção extra. Isso pode causar dificuldade para respirar, tosse e falta de ar.', '"Durante as crises, o asmático sente falta de ar, tosse, chiado e aperto no peito. Esses sintomas, que podem ser leves, moderados ou intensos, agravam-se na vigência de gripes e resfriados. Estudos apontam que a asma possivelmente seja hereditária. Uma vez portador da doença, um indivíduo pode ter um filho asmático. Assim, algumas pessoas já nascem com predisposição para a hiper-reatividade do aparelho respiratório diante de qualquer estímulo. Mas a doença também se desenvolve pela continuada exposição a um determinado agressor. Independentemente da origem da asma, existem diversos fatores que desencadeiam crises, razão pela qual são denominados gatilhos, a exemplo de pólen, mofo, ácaros, fumaça de cigarro, poluentes do ar, gases químicos, inseticidas, poeira, cheiros fortes, pêlo e saliva de animais, frio, estresse e até alguns alimentos, como leite e ovos.', 'O diagnóstico da asma se baseia na história do indivíduo, no conjunto de sintomas, na avaliação clínica e em exames complementares, a exemplo da radiografia de tórax e de provas de função pulmonar, como a espirometria, que identifica e quantifica a obstrução ao fluxo de ar. Além disso, testes laboratoriais de sangue e de pele são importantes para estabelecer a que gatilhos exatamente o asmático reage, visto que essa informação ajuda a evitar crises e a controlar a doença.', 'O tratamento é voltado para aliviar as crises e para manter a doença sob controle. No primeiro caso, usam-se broncodilatadores, que agem exatamente de modo contrário à resposta de hiper-reatividade, abrindo os brônquios. Para a manutenção do controle da asma, e também para aliviar as crises quando o efeito do broncodilatador se mostra insatisfatório, geralmente é associado um corticóide, que serve para desinflamar os brônquios do asmático e, assim, evitar futuras manifestações agudas. Ambas as medicações, broncodilatadores e corticóides, são utilizados preferencialmente pela via inalatória (bombinhas) que permitem o uso de doses menores, porém mais efetivas, dada a aplicação direta no local da reação. Outro coadjuvante bastante recente na prevenção de crises é aplicação de injeções periódicas de uma substância que age contra o anticorpo responsável pela reação alérgica, a imunoglobulina E. Este novo tratamento, porém, só é indicado para pessoas que têm determinados níveis desse anticorpo. Quem nasce com predisposição para ter essa hiper-reatividade dos pulmões precisa conhecer e evitar os gatilhos que desencadeiam as crises. De qualquer modo, é indispensável manter o ambiente do asmático o mais limpo possível e restringir seu contato com alérgenos ou com substâncias irritantes. O tabagismo e a asma, por exemplo, são absolutamente incompatíveis. Os animais têm de ser mantidos fora de casa, ou no mínimo, impedidos de entrar nos quartos de dormir. Colchões e travesseiros devem ser forrados com material lavável, o qual precisa ser higienizado periodicamente.', 'Pneumologista / Pediatra / Clínico geral / Fisioterapeuta respiratório', 'Quando não houver como evitar a exposição, o paciente pode seguir alguns cuidados, como: evitar atividades físicas ao ar livre, especialmente em dias frios; evitar baixa umidade ou exposição em dias com muita poluição; não fumar e evitar ambientes fechados com pessoas fumando.');
INSERT INTO Doenca (NOMEDOENCA, DESCRICAO, CAUSAS, DIAGNOSTICO, TRATAMENTO, MEDICOESPECIALISTA, PREVENCAO) VALUES ( 'Alzheimer', 'Doença progressiva que destrói a memória e outras funções mentais importantes.
As conexões das células cerebrais e as próprias células se degeneram e morrem, eventualmente destruindo a memória e outras funções mentais importantes.
Perda de memória e confusão são os principais sintomas.
Não existe cura, mas os medicamentos e as estratégias de controle podem melhorar os sintomas temporariamente.', 'A causa é desconhecida, mas acredita-se que seja geneticamente determinada. A doença instala-se quando o processamento de certas proteínas do sistema nervoso central começa a dar errado. Surgem, então, fragmentos de proteínas mal cortadas, tóxicas, dentro dos neurônios e nos espaços que existem entre eles.', 'Não existe uma forma simples de detectar o Alzheimer. O diagnóstico requer um exame médico completo. Exames de sangue, testes de estado mental e imagiologia cerebral podem ser usados para determinar a causa dos sintomas.', 'O tratamento para o Alzheimer é feito para controlar os sintomas e retardar o agravamento da degeneração cerebral provocada pela doença e inclui o uso de remédios, como Donepezila, Rivastigmina ou Memantina, por exemplo, indicados pelo neurologista ou psiquiatra.', 'Geriatra / Neurologista / Psiquiatra/ Clínico geral', 'Manter o peso em um nível saudável, normalmente abaixo de um Índice de Massa Corporal (IMC) de 25. Obter o máximo de educação escolar possível a partir da infância. Evitar traumatismo craniano (como concussões) Manter-se cognitivamente ativo com leituras e aprendendo coisas novas. Entre outras.');
INSERT INTO Doenca (NOMEDOENCA, DESCRICAO, CAUSAS, DIAGNOSTICO, TRATAMENTO, MEDICOESPECIALISTA, PREVENCAO) VALUES ( 'Dislipidemia (colesterol alto)', 'Colesterol anormalmente elevado ou gorduras (lipídeos) no sangue.
A dislipidemia aumenta a chance de entupimento das artérias (aterosclerose) e de ataques cardíacos, acidente vascular cerebral ou outros problemas circulatórios, especialmente em fumantes. Em adultos, geralmente é relacionada a obesidade, alimentação inadequada e falta de exercícios.
A dislipidemia geralmente não causa sintomas.
Uma dieta saudável, exercícios físicos e medicamentos hipolipemiantes podem ajudar a prevenir complicações.', 'O estilo de vida, a genética, distúrbios (por exemplo, níveis baixos de hormônio da tireoide ou doença renal), medicamentos ou uma combinação entre eles podem contribuir para o surgimento da dislipidemia.', 'A dislipidemia é uma doença assintomática, ou seja, não produz sintomas expressivos e, em geral, seu diagnóstico acontece após o surgimento de alguma doença relacionada, como diabetes e hipotireoidismo.

Especialista recomendam a realização de um check-up preventivo, com exame de colesterol incluso, a cada dois ou três anos para identificar dislipidemias, principalmente homens a partir dos 35 anos de idade e mulheres a partir de 45. Já as pessoas que se enquadram nos fatores de risco da doença, esse acompanhamento deve começar mais cedo, entre 20 e 35 anos no caso dos homens e 20 e 45 no caso das mulheres. Dependendo do resultado dos exames, os diagnósticos possíveis podem ser:

Hipercolesterolemia isolada: quando seu colesterol ruim, o LDL, está muito elevado, influenciando negativamente no colesterol total.

Hipertrigliceridemia isolada: quando o nível de triglicérides está alto demais.

Hiperlipidemia mista: quando ambos os níveis estão elevados. Nesse caso, o risco de ocasionar outras doenças é ainda maior.

HDL-C baixo: quando seu colesterol bom está abaixo do ideal.', 'Como a maioria das ocorrências de dislipidemias envolve hábitos alimentares e sedentarismo, a melhor forma de reverter o quadro é a adoção de um estilo de vida mais saudável, com medidas práticas, como:

Evitar o consumo de alimentos ricos em açúcar e gordura, como massas produzidas com farinha de trigo refinada, óleos vegetais e doces açucarados em geral (prefira adoçantes naturais, como stévia e xilitol), optando sempre que possível por produtos integrais.
Reduzir ao máximo o consumo de álcool.
Não fumar.
Praticar alguma atividade física de intensidade moderada, por pelo menos 30 minutos, quatro vezes por semana.
Além dessas medidas, nos casos de dislipidemias mais graves, em que há risco de problemas do coração, por exemplo, o médico também pode indicar um tratamento medicamentoso à base de estatinas e fibratos.

E em todos os casos, a mudança do estilo de vida já terá um impacto profundamente positivo na reversão das dislipidemias e qualquer outra condição que ofereça riscos à saúde em geral.', 'Cardiologista / Nutricionista / Endocrinologista / Clínico geral', 'Evite pratos prontos congelados ou ultraprocessados – procure fazer receitas com alimentos frescos. Consuma azeite e outras gorduras poliinsaturadas. Pratique uma atividade física regularmente. Além de prevenir doenças cardiovasculares e obesidade, os exercícios ainda reduzem estresse, ansiedade e depressão.');
INSERT INTO Doenca (NOMEDOENCA, DESCRICAO, CAUSAS, DIAGNOSTICO, TRATAMENTO, MEDICOESPECIALISTA, PREVENCAO) VALUES ( 'Afta', 'Afta é uma pequena úlcera rasa que aparece na cavidade oral, geralmente em decorrência de acidentes, mas é preciso procurar um médico caso não desapareça em três semanas. Aftas são pequenas úlceras rasas que aparecem na cavidade oral, geralmente na mucosa bucal, nas gengivas e embaixo da língua.', 'As aftas não são contagiosas e não se desenvolvem por causa do herpes-vírus, ao contrário do que a maioria das pessoas pensa. Embora ninguém saiba a sua causa exatamente, vários fatores combinados podem contribuir para seu aparecimento.

As causas mais comuns das aftas são:

Lesão bucal: tratamento dentário, escovação, prática de esportes e mordida na bochecha,

Sensibilidades alimentar: chocolate, café, alimentos altamente ácidos ou condimentados,

Carência de vitaminas e minerais: ferro, ácido fólico, B12 e zinco,

Alterações hormonais: como as que ocorrem durante o período menstrual,

Afecções e doenças: especialmente aquelas que afetam o sistema imunológico.', 'Não existe um exame específico para diagnosticar as aftas. É possível identificá-las com o exame clínico. Às vezes, uma biópsia da lesão pode ser necessária, se houver suspeitas de outras doenças.', 'As aftas pequenas geralmente não precisam de tratamento e desaparecerem em até duas semanas.

Se houver muita dor ou dificuldade para deglutir, pode-se recorrer a tratamentos sintomáticos, como os bochechos com medicamentos anti-inflamatórios e analgésicos, assim como à aplicação de pomadas para uso oral (orabase) com analgésicos. Em casos mais graves, pode ser necessário o uso de anti-inflamatórios sistêmicos (como os corticoides) ou medicamentos para reduzir a acidez estomacal.

Durante a recuperação, algumas medidas simples podem ajudar. Entre elas destacam-se: evitar alimentos ácidos ou muito condimentados (eles são irritantes) e escovar os dentes suavemente. Também ajuda quebrar pequenos pedaços de gelo e deixá-los dissolver na boca, como forma de aliviar a irritação.', 'Dentista / Otorrinolaringologista / Clinico Geral', 'Para prevenir o problema, a causa deve ser identificada. Se, por exemplo, houver deficiência de vitamina ou alguma alteração gastrointestinais que justifique, o indivíduo deverá procurar um médico para corrigir. Se o problema estiver ligado à acidez, alguns alimentos cítricos devem ser evitados como abacaxi, kiwi, limão ou até mesmo tomate, pois eles podem desencadear o quadro de estomatite aftosa.');
INSERT INTO Doenca (NOMEDOENCA, DESCRICAO, CAUSAS, DIAGNOSTICO, TRATAMENTO, MEDICOESPECIALISTA, PREVENCAO) VALUES ( 'Covid 19', 'O COVID-19 é o nome da doença causada pelo coronavírus denominado SARS-CoV-2. O vírus tem essa denominação porque pertence à mesma família de vírus que causam a síndrome respiratória aguda grave (SARS: severe acute respiratory syndrome em inglês) e alguns tipos de gripe comum. O nome da doença (COVID-19) indica o agente: CO de corona (o formato em coroa do vírus); VI de vírus; D de doença e 19 de 2019, pois foi descoberta em 2019.', 'Segundo a Organização Mundial de Saúde (OMS), os sintomas mais comuns da COVID-19 são febre, tosse seca, cansaço, coriza, dor de garganta, dificuldade para respirar, perda de olfato (anosmia), alteração do paladar (ageusia), náuseas, vômitos, diarreia, astenia (cansaço), hiporexia (diminuição parcial do apetite), dispnéia (falta de ar). É importante salientar que nem todos os pacientes podem apresentar todos os sintomas.

Cerca de 80 % dos casos são assintomáticos (sem sintomas) ou oligossintomáticos (poucos sintomas). Os 20% restantes requerem atendimento médico porque apresentam dificuldade respiratória. Destes, 5% pode necessitar de suporte ventilatório. Indivíduos idosos e que possuem comorbidades (coexistência de doenças) como pressão alta, problemas cardíacos e do pulmão, diabetes ou câncer, possuem maior risco de ficarem doentes.

Entretanto, indivíduos de todas as idades podem adquirir a doença e ficar gravemente doentes. Qualquer indivíduo que apresentar febre e/ou tosse associada a falta de ar deve procurar atendimento médico.', 'DIAGNÓSTICO CLÍNICO - avaliação da possibilidade da doença, levando em consideração a apresentação ou não dos sintomas descritos acima.
DIAGNÓSTICO CLÍNICO-EPIDEMIOLÓGICO – ocorre avaliação da associação de sinais e sintomas específicos da doença. Pode ser também avaliado indivíduos com sintomas de SARS que tenham tido contato próximo ou domiciliar com indivíduos com confirmação laboratorial de COVID-19 nos últimos 14 dias antes do aparecimento dos sintomas.
DIAGNÓSTICO LABORATORIAL - O padrão ouro para diagnóstico da COVID-19 é o RT-PCR, mas também são utilizados testes sorológicos para detecção do vírus.', 'Nos casos mais leves de COVID-19, em que a pessoa não apresenta sintomas ou apresenta sintomas pouco graves, como febre, cansaço, dor no corpo ou dor de cabeça, o tratamento pode ser feito em casa após a avaliação médica.

Normalmente o tratamento inclui ficar de repouso para ajudar o corpo a se recuperar, mas também é comum incluir o uso de alguns medicamentos prescritos pelo médico, como antipiréticos, analgésicos ou anti-inflamatórios, que ajudam a diminuir a febre, a dor de cabeça e o mal estar geral. Veja mais sobre os remédios utilizados para o coronavírus.

A Anvisa também aprovou o uso emergencial do Sotrovimabe para o tratamento de para o tratamento da COVID-19 leve em pessoas que não estejam fazendo uso de oxigenoterapia e que possuem risco de desenvolver uma infecção mais grave, devendo ser administrado pelo médico.

Cuidados durante o tratamento
Além do tratamento médico, durante a infecção COVID-19 é importante ter alguns cuidados que ajudam a manter o sistema imune fortalecido e outros que evitam a transmissão do vírus. Assim, de forma geral é recomendado:

Beber, pelo menos, 2 litros de água por dia, para otimizar o funcionamento do sistema imunológico e evitar uma possível desidratação;
Fazer uma alimentação saudável e natural, investindo na ingestão de alimentos ricos em proteína, como carne, peixe, ovos ou laticínios, assim como em frutas, legumes, cereais e tubérculos. Este tipo de alimentos ajuda a manter o corpo saudável e o sistema imune mais fortalecido;
Utilizar máscara bem ajustada ao rosto de modo a tapar o nariz e a boca e impedir que as gotículas de tosse ou espirros possam ser projetadas para o ar;
Manter o distanciamento social, uma vez que este permite diminuir o contato entre as pessoas. É importante evitar abraços, beijos e outros cumprimentos próximos. O ideal é que a pessoa infectada fique em isolamento no quarto ou em outro cômodo da casa.
Cobrir a boca ao tossir ou espirrar, utilizando um lenço descartável, que depois deverá ser jogado no lixo, ou a parte interna do cotovelo;
Evitar tocar no rosto ou na máscara com as mãos, e no caso de tocar é recomendado lavar as mãos logo a seguir;
Lavar as mãos com água e sabão regularmente durante, pelo menos, 20 segundos ou fazer a desinfecção das mãos com álcool gel 70% durante 20 segundos;
Desinfectar o celular com frequência, utilizando toalhetes com 70% álcool ou com um pano de microfibra umedecido em álcool 70%;
Evitar a partilha de objetos como talheres, copos, toalhas, lençóis, sabonetes ou outros objetos de higiene pessoal;
Limpar e arejar os cômodos da casa para permitir a circulação de ar;
Desinfetar as maçanetas das portas e todos os objetos compartilhados com outras pessoas, como por exemplo móveis, utilizando álcool 70% ou uma mistura de água com água sanitária;
Limpar e desinfectar o banheiro após ser utilizado, especialmente se for utilizado por outras pessoas;
Além disso, é importante colocar todo o lixo produzido numa sacola de plástico diferente, de forma a que sejam tomados os devidos cuidados quando for descartado.', 'Clinico Geral / Infectologista', 'As recomendações de prevenção à COVID-19 segundo a Organização Mundial da Saúde são as seguintes:

lavar as mãos com frequência até a altura dos punhos, com água e sabão ou higienizar o local com álcool gel em 70%, principalmente quando estiver em ambientes públicos e utilizar transporte público.
Cobrir a boca e o nariz com um lenço ou com a parte interna do cotovelo quando espirrar ou tossir.
Higienizar as mãos sempre que precisar tocar os olhos, nariz, boca ou a máscara.
Evite abraços, beijos e apertos de mãos.
Mantenha o distanciamento mínimo de 1 metro entre pessoas em lugares públicos e de convívio social.
Higienize periodicamente os objetos que são utilizados com frequência tais como celular, brinquedos das crianças, teclados de computador e etc....
Não compartilhe objetos de uso pessoal como talheres, toalhas, pratos e copos.
    Mantenha os ambientes limpos e bem ventilados.
Só saia de casa se for estritamente necessário.
Se estiver doente, evite ao máximo contato com outras pessoas.
Utilize sempre máscaras quando precisar sair de casa. Elas funcionam como uma barreira física contra gotículas potencialmente contaminadas.');

CREATE TABLE IF NOT EXISTS public.doenca
(
    iddoenca integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    nomedoenca character varying(500) COLLATE pg_catalog."default" NOT NULL,
    descricao character varying(8000) COLLATE pg_catalog."default" NOT NULL,
    causas character varying(8000) COLLATE pg_catalog."default" NOT NULL,
    diagnostico character varying(8000) COLLATE pg_catalog."default" NOT NULL,
    tratamento character varying(8000) COLLATE pg_catalog."default" NOT NULL,
    medicoespecialista character varying(500) COLLATE pg_catalog."default" NOT NULL,
    prevencao character varying(8000) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT doenca_pkey PRIMARY KEY (iddoenca)
)

alter table medico
add column especialidade varchar(100) not null

create table chat (
    idchat integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    idmedico integer NOT NULL,
    idpaciente integer NOT NULL,
    CONSTRAINT chat_pkey PRIMARY KEY (idchat),
    CONSTRAINT fk_idmedico FOREIGN KEY (idmedico)
        REFERENCES public.medico (idmedico),
    CONSTRAINT fk_idpaciente FOREIGN KEY (idpaciente)
        REFERENCES public.pessoa (idpessoa)
)

create table mensagens (
	idmensagem integer NOT NULL GENERATED ALWAYS AS IDENTITY,
	idchat integer not null,
	conteudo varchar (8000) not null,
	isAdministrative Boolean not NULL,
        createdAt TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
	CONSTRAINT fk_idchat FOREIGN KEY (idchat)
        REFERENCES public.chat (idchat)
)


ALTER TABLE medico DROP COLUMN inactivatedat
ALTER TABLE medico DROP COLUMN createdat
ALTER TABLE medico DROP COLUMN updatedat

ALTER TABLE pessoa DROP COLUMN idendereco  
ALTER TABLE pessoa ADD COLUMN idendereco integer

ALTER TABLE pessoa ADD CONSTRAINT fk_id_endereco FOREIGN KEY (idendereco) REFERENCES endereco (idendereco)


INSERT INTO pessoa(cpf, nome, datanascimento, email, senha, telefone, ispaciente, ismedico, isadmin, createdat, updatedat) VALUES ('08645211033', 'Gabriel Moretti', '2002-04-02', 'gabrielmorettipb5@gmail.com', '985251f3d13076beec69aca778ea31f', '1736329381', false, false, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
