CREATE TABLE IF NOT EXISTS USUARIOS (
	usuario VARCHAR(200) NOT NULL,
	nome VARCHAR(200) NOT NULL,
	email VARCHAR(200) NOT NULL,
	senha VARCHAR(32) NOT NULL,
	sexo ENUM("M", "F") NOT NULL,
	cargo ENUM("ADMNISTRADOR", "MODERADOR", "PADRAO") DEFAULT "PADRAO" NOT NULL,
	PRIMARY KEY (usuario)
);

CREATE TABLE IF NOT EXISTS MURAIS (
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
	USUARIOS_usuario VARCHAR(200) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (USUARIOS_usuario) REFERENCES USUARIOS(usuario)
);

CREATE TABLE IF NOT EXISTS POSTAGENS  (
	id INT NOT NULL AUTO_INCREMENT,
	data DATE NOT NULL,
	mensagem VARCHAR(140) NOT NULL,
	media VARCHAR(200),
	MURAIS_id INT NOT NULL,
	USUARIOS_usuario VARCHAR(200) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (USUARIOS_usuario) REFERENCES USUARIOS(usuario),
	FOREIGN KEY (MURAIS_id) REFERENCES MURAIS(id)
);

CREATE TABLE IF NOT EXISTS CURTIDAS (
	POSTAGEM_id  INT NOT NULL,
	USUARIOS_usuario  VARCHAR(200) NOT NULL,
	PRIMARY KEY (POSTAGEM_id, USUARIOS_usuario),
	FOREIGN KEY (POSTAGEM_id) REFERENCES POSTAGENS(id),
	FOREIGN KEY (USUARIOS_usuario) REFERENCES USUARIOS(usuario)
);

CREATE TABLE IF NOT EXISTS COMENTARIOS  (
	id INT NOT NULL AUTO_INCREMENT,
	mensagem  VARCHAR(140) NOT NULL,
	POSTAGEM_id  INT NOT NULL,
	USUARIOS_usuario  VARCHAR(200) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (POSTAGEM_id) REFERENCES POSTAGENS(id),
	FOREIGN KEY (USUARIOS_usuario) REFERENCES USUARIOS(usuario)
);

CREATE TABLE IF NOT EXISTS POST_SALVOS  (
	POSTAGEM_id  INT NOT NULL,
	USUARIOS_usuario  VARCHAR(200) NOT NULL,
	PRIMARY KEY (POSTAGEM_id,  USUARIOS_usuario),
	FOREIGN KEY (POSTAGEM_id) REFERENCES POSTAGENS(id),
	FOREIGN KEY (USUARIOS_usuario) REFERENCES USUARIOS(usuario)
);

CREATE TABLE IF NOT EXISTS EVENTOS  (
	dataI  DATE NOT NULL,
	dateF  DATE NOT NULL,
	POSTAGEM_id  INT NOT NULL,
	PRIMARY KEY (POSTAGEM_id),
	FOREIGN KEY (POSTAGEM_id) REFERENCES POSTAGENS(id)
);

CREATE TABLE IF NOT EXISTS ANUNCIOS  (
	preco  FLOAT NOT NULL,
	disponivel  BINARY NOT NULL,
	POSTAGEM_id  INT NOT NULL,
	PRIMARY KEY (POSTAGEM_id),
	FOREIGN KEY (POSTAGEM_id) REFERENCES POSTAGENS(id)
);

CREATE TABLE IF NOT EXISTS PRESENCAS  (
	EVENTOS_POSTAGEM_id  INT NOT NULL,
	USUARIOS_usuario  VARCHAR(200) NOT NULL,
	PRIMARY KEY (EVENTOS_POSTAGEM_id,  USUARIOS_usuario),
	FOREIGN KEY (EVENTOS_POSTAGEM_id) REFERENCES EVENTOS(POSTAGEM_id),
	FOREIGN KEY (USUARIOS_usuario) REFERENCES USUARIOS(usuario)
);

CREATE TABLE IF NOT EXISTS LEMBRETES  (
	POSTAGEM_id  INT NOT NULL,
	USUARIOS_usuario  VARCHAR(200) NOT NULL,
	horario  DATETIME NOT NULL,
	PRIMARY KEY (POSTAGEM_id,  USUARIOS_usuario),
	FOREIGN KEY (POSTAGEM_id) REFERENCES POSTAGENS(id),
	FOREIGN KEY (USUARIOS_usuario) REFERENCES USUARIOS(usuario)
);
