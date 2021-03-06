CREATE TYPE TIPO_NOTA AS ENUM('N','R','1','2','3','4','5');
CREATE TYPE TIPO_ROL AS ENUM('Estudiante','Coordinador','Orientador(DIDE)');

CREATE TABLE USUARIO(
    USBID       VARCHAR(10) NOT NULL,
    CEDULA      INTEGER NOT NULL UNIQUE,
    NOMBRE      VARCHAR(60) NOT NULL,
    APELLIDO    VARCHAR(60) NOT NULL,
    CONTRASENA  VARCHAR(50) NOT NULL,
    ROL         TIPO_ROL    NOT NULL,
    PRIMARY KEY (USBID)
);

CREATE TABLE ORIENTADOR(
    USBID       VARCHAR(10) NOT NULL,
    FOREIGN KEY (USBID) REFERENCES USUARIO(USBID),
    PRIMARY KEY (USBID)
);

CREATE TABLE CARRERA(
    CODCARRERA     NUMERIC(4) NOT NULL,
    NOMBRE         VARCHAR(60) NOT NULL UNIQUE,
    CUPOS          NUMERIC(3) NOT NULL,
    INDICE_MIN     REAL NOT NULL,	
    PRIMARY KEY (CODCARRERA)
);

CREATE TABLE COORDINADOR(
    USBID       VARCHAR(10) NOT NULL,
    CODCARRERA  NUMERIC(4)  NOT NULL,
    FOREIGN KEY (USBID) REFERENCES USUARIO(USBID),
    FOREIGN KEY (CODCARRERA) REFERENCES CARRERA(CODCARRERA),
    PRIMARY KEY (USBID)
);

CREATE TABLE ESTUDIANTE(
    USBID           VARCHAR(10) NOT NULL,
    INDICE          REAL NOT NULL,
    CODCARRERA      NUMERIC(4) NOT NULL,    
    CB_APROBADO     BOOLEAN NOT NULL,
    FOREIGN KEY (CODCARRERA) REFERENCES CARRERA(CODCARRERA),
    FOREIGN KEY (USBID) REFERENCES USUARIO(USBID) ON DELETE CASCADE,
    PRIMARY KEY (USBID)
);

CREATE TABLE REQUISITO(
    CODREQUISITO    NUMERIC(4),
    DESCRIPCION     VARCHAR(160) UNIQUE,
    PRIMARY KEY (CODREQUISITO)
);

CREATE TABLE EXIGE(
    CODREQUISITO    NUMERIC(4)  NOT NULL,
    CODCARRERA      NUMERIC(4) NOT NULL,
    FOREIGN KEY (CODREQUISITO) REFERENCES REQUISITO(CODREQUISITO),
    FOREIGN KEY (CODCARRERA) REFERENCES CARRERA(CODCARRERA),
    PRIMARY KEY (CODREQUISITO, CODCARRERA)
);

CREATE TABLE SOLICITUD(
    USBID           VARCHAR(10) NOT NULL,
    CODCARRERA      NUMERIC(4) NOT NULL,
    FECHA           DATE NOT NULL,
    ADVERTENCIA     VARCHAR(500),
    SOL_ACEPTADA    BOOLEAN NOT NULL,
    CC_APROBADO     BOOLEAN NOT NULL,
    MOTIVACION      VARCHAR(1500) NOT NULL,
    FOREIGN KEY (USBID) REFERENCES ESTUDIANTE(USBID),
    FOREIGN KEY (CODCARRERA) REFERENCES CARRERA(CODCARRERA),
    PRIMARY KEY(USBID,CODCARRERA)
);

CREATE TABLE ASIGNATURA(
    CODASIGNATURA   VARCHAR(6) NOT NULL,
    NOMBRE          VARCHAR(60) NOT NULL,
    CREDITOS        NUMERIC(1) NOT NULL,
    CICLO_BAS       BOOLEAN NOT NULL,
    PRIMARY KEY (CODASIGNATURA)
);

CREATE TABLE CURSA(
    USBID           VARCHAR(10) NOT NULL,
    CODASIGNATURA   VARCHAR(6) NOT NULL,
    FOREIGN KEY (USBID) REFERENCES ESTUDIANTE(USBID),
    FOREIGN KEY (CODASIGNATURA) REFERENCES ASIGNATURA(CODASIGNATURA),
    PRIMARY KEY (USBID,CODASIGNATURA)
);

CREATE TABLE CALIFICACION(
    USBID           VARCHAR(10) NOT NULL,
    CODASIGNATURA   VARCHAR(6) NOT NULL,
    NOTA            TIPO_NOTA NOT NULL,
    FOREIGN KEY (USBID,CODASIGNATURA) REFERENCES CURSA(USBID,CODASIGNATURA),
    PRIMARY KEY (USBID,CODASIGNATURA,NOTA)
);

CREATE TABLE REPORTE(
    USBID         VARCHAR(10) NOT NULL,	
    CODCARRERA    NUMERIC(4) NOT NULL,
    NUMERO        NUMERIC(5) NOT NULL UNIQUE,
    DESCRIPCION   VARCHAR(1500) NOT NULL,
    FOREIGN KEY (USBID,CODCARRERA) REFERENCES SOLICITUD(USBID,CODCARRERA),
    PRIMARY KEY (USBID, CODCARRERA, NUMERO)
);

CREATE TABLE RECOMIENDA(
    USBID           VARCHAR(10) NOT NULL,
    CODCARRERA      NUMERIC(4) NOT NULL,
    CODASIGNATURA   VARCHAR(6) NOT NULL,
    NOTA_MIN        TIPO_NOTA,
    FOREIGN KEY(USBID,CODCARRERA) REFERENCES SOLICITUD(USBID,CODCARRERA),
    FOREIGN KEY (CODASIGNATURA) REFERENCES ASIGNATURA(CODASIGNATURA),
    PRIMARY KEY (USBID,CODCARRERA,CODASIGNATURA)
);


---------------------------------------------------------------------
/*Triggers*/


/*El siguiente trigger se encarga de que cada usuario pertenezca
a una única de las siguientes entidades: Estudiante, Coordinador
u Orientador*//*
CREATE OR REPLACE FUNCTION existeEstiduante()
RETURNS TRIGGER AS $existeEstudiante$
	BEGIN
		IF EXISTS (SELECT *
					FROM ESTUDIANTE AS persona
					WHERE NEW.USBID = persona.USBID) THEN RETURN NULL;
		END IF;
		RETURN NEW;
	END:
$existeEstudiante$ LANGUAGE plpgsql;
	
CREATE OR REPLACE FUNCTION existeOrientador()
RETURNS TRIGGER AS $existeOrientador$
	BEGIN
		IF EXISTS (SELECT *
					FROM ORIENTADOR AS persona
					WHERE NEW.USBID = persona.USBID) THEN RETURN NULL;
		END IF;
		RETURN NEW;
	END;
$existeOrientador$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION existeCoordinador()
RETURNS TRIGGER AS $existeCoordinador$
	BEGIN
		IF EXISTS (SELECT *
					FROM COORDINADOR AS persona
					WHERE NEW.USBID = persona.USBID) THEN RETURN NULL;
		END IF;
		RETURN NEW;
	END;
$existeCoordinador$ LANGUAGE plpgsql;

CREATE TRIGGER existeEstudiante
BEFORE INSERT OR UPDATE ON ESTUDIANTE FOR EACH ROW
EXECUTE PROCEDURE existeEstudiante();

CREATE TRIGGER existeOrientador
BEFORE INSERT OR UPDATE ON ORIENTADOR FOR EACH ROW
EXECUTE PROCEDURE existeOrientador();

CREATE TRIGGER existeCoordinador
BEFORE INSERT OR UPDATE ON COORDINADOR FOR EACH ROW
EXECUTE PROCEDURE existeCoordinador();
*/