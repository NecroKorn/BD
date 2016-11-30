/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     02-11-2016 14:20:46                          */
/*==============================================================*/


drop index RELATIONSHIP_6_FK;

drop index BUTACA_RESERVADA_PK;

alter table BUTACA_RESERVADA
   drop constraint PK_BUTACA_RESERVADA;

drop table BUTACA_RESERVADA;

drop index CALIFICACION_PELICULA_PK;

alter table CALIFICACION_PELICULA
   drop constraint PK_CALIFICACION_PELICULA;

drop table CALIFICACION_PELICULA;

drop index CINE_PK;

alter table CINE
   drop constraint PK_CINE;

drop table CINE;

drop index RELATIONSHIP_4_FK;

drop index RELATIONSHIP_3_FK;

drop index FUNCION_PK;

alter table FUNCION
   drop constraint PK_FUNCION;

drop table FUNCION;

drop index GENERO_PELICULA_PK;

alter table GENERO_PELICULA
   drop constraint PK_GENERO_PELICULA;

drop table GENERO_PELICULA;

drop index RELATIONSHIP_11_FK;

drop index RELATIONSHIP_10_FK;

drop index RELATIONSHIP_7_FK;

drop index PELICULA_PK;

alter table PELICULA
   drop constraint PK_PELICULA;

drop table PELICULA;

drop index PERSONA_PK;

alter table PERSONA
   drop constraint PK_PERSONA;

drop table PERSONA;

drop index RELATIONSHIP_9_FK;

drop index RELATIONSHIP_8_FK;

drop index REPARTO_PK;

alter table REPARTO
   drop constraint PK_REPARTO;

drop table REPARTO;

drop index RELATIONSHIP_5_FK;

drop index RESERVA_PK;

alter table RESERVA
   drop constraint PK_RESERVA;

drop table RESERVA;

drop index ROL_REPARTO_PK;

alter table ROL_REPARTO
   drop constraint PK_ROL_REPARTO;

drop table ROL_REPARTO;

drop index RELATIONSHIP_2_FK;

drop index SALA_PK;

alter table SALA
   drop constraint PK_SALA;

drop table SALA;

/*==============================================================*/
/* Table: BUTACA_RESERVADA                                      */
/*==============================================================*/
create table BUTACA_RESERVADA (
   ID_BUTACA            INT4                 not null,
   ID_RESERVA           INT4                 null,
   NUMERO_BUTACA_RESERVADA INT4                 null
);

alter table BUTACA_RESERVADA
   add constraint PK_BUTACA_RESERVADA primary key (ID_BUTACA);

/*==============================================================*/
/* Index: BUTACA_RESERVADA_PK                                   */
/*==============================================================*/
create unique index BUTACA_RESERVADA_PK on BUTACA_RESERVADA (
ID_BUTACA
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on BUTACA_RESERVADA (
ID_RESERVA
);

/*==============================================================*/
/* Table: CALIFICACION_PELICULA                                 */
/*==============================================================*/
create table CALIFICACION_PELICULA (
   ID_CALIFICACION_PELICULA INT4                 not null,
   NOMBRE_CALIFICACION_PELICULA VARCHAR(100)         null
);

alter table CALIFICACION_PELICULA
   add constraint PK_CALIFICACION_PELICULA primary key (ID_CALIFICACION_PELICULA);

/*==============================================================*/
/* Index: CALIFICACION_PELICULA_PK                              */
/*==============================================================*/
create unique index CALIFICACION_PELICULA_PK on CALIFICACION_PELICULA (
ID_CALIFICACION_PELICULA
);

/*==============================================================*/
/* Table: CINE                                                  */
/*==============================================================*/
create table CINE (
   ID_CINE              INT4                 not null,
   DIRECCION            VARCHAR(100)         null,
   NOMBRE_CINE          VARCHAR(100)         null
);

alter table CINE
   add constraint PK_CINE primary key (ID_CINE);

/*==============================================================*/
/* Index: CINE_PK                                               */
/*==============================================================*/
create unique index CINE_PK on CINE (
ID_CINE
);

/*==============================================================*/
/* Table: FUNCION                                               */
/*==============================================================*/
create table FUNCION (
   ID_FUNCION           INT4                 not null,
   ID_PELICULA          INT4                 null,
   ID_SALA              INT4                 null,
   FECHA_FUNCION        DATE                 null
);

alter table FUNCION
   add constraint PK_FUNCION primary key (ID_FUNCION);

/*==============================================================*/
/* Index: FUNCION_PK                                            */
/*==============================================================*/
create unique index FUNCION_PK on FUNCION (
ID_FUNCION
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on FUNCION (
ID_SALA
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on FUNCION (
ID_PELICULA
);

/*==============================================================*/
/* Table: GENERO_PELICULA                                       */
/*==============================================================*/
create table GENERO_PELICULA (
   ID_GENERO_PELICULA   INT4                 not null,
   NOMBRE_GENERO        VARCHAR(100)         null
);

alter table GENERO_PELICULA
   add constraint PK_GENERO_PELICULA primary key (ID_GENERO_PELICULA);
   
ALTER TABLE GENERO_PELICULA
  ADD CONSTRAINT genero_uniq UNIQUE(nombre_genero);

/*==============================================================*/
/* Index: GENERO_PELICULA_PK                                    */
/*==============================================================*/
create unique index GENERO_PELICULA_PK on GENERO_PELICULA (
ID_GENERO_PELICULA
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
create table PELICULA (
   ID_CALIFICACION_PELICULA INT4                 not null,
   ID_GENERO_PELICULA   INT4                 not null,
   ID_PELICULA          INT4                 not null,
   ID_REPARTO           INT4                 null,
   TITULO_DISTRIBUCION  VARCHAR(100)         null,
   TITULO_ORIGINAL      VARCHAR(100)         null,
   IDIOMA_ORIGINAL      VARCHAR(100)         null,
   SUBTITULOS_ESPANOL   BOOL                 null,
   ANO_PRODUCCION       NUMERIC              null,
   DURACION_MINUTOS     INT4                 null,
   FECHA_ESTRENO        DATE                 null,
   RESUMEN              VARCHAR(500)         null
);

alter table PELICULA
   add constraint PK_PELICULA primary key (ID_PELICULA);

/*==============================================================*/
/* Index: PELICULA_PK                                           */
/*==============================================================*/
create unique index PELICULA_PK on PELICULA (
ID_PELICULA
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on PELICULA (
ID_REPARTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on PELICULA (
ID_CALIFICACION_PELICULA
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on PELICULA (
ID_GENERO_PELICULA
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA (
   ID_PERSONA           INT4                 not null,
   NOMBRE_PERSONA       VARCHAR(100)         null,
   APELLIDO_PATERNO     VARCHAR(100)         null,
   APELLIDO_MATERNO     VARCHAR(100)         null
);

alter table PERSONA
   add constraint PK_PERSONA primary key (ID_PERSONA);

/*==============================================================*/
/* Index: PERSONA_PK                                            */
/*==============================================================*/
create unique index PERSONA_PK on PERSONA (
ID_PERSONA
);

/*==============================================================*/
/* Table: REPARTO                                               */
/*==============================================================*/
create table REPARTO (
   ID_REPARTO           INT4                 not null,
   ID_PERSONA           INT4                 null,
   ID_ROL_REPARTO       INT4                 null,
   NOMBRE_PERSONAJE     VARCHAR(100)         null
);

alter table REPARTO
   add constraint PK_REPARTO primary key (ID_REPARTO);

/*==============================================================*/
/* Index: REPARTO_PK                                            */
/*==============================================================*/
create unique index REPARTO_PK on REPARTO (
ID_REPARTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on REPARTO (
ID_PERSONA
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on REPARTO (
ID_ROL_REPARTO
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA (
   ID_RESERVA           INT4                 not null,
   ID_FUNCION           INT4                 null,
   FECHA_RESERVA        DATE                 null,
   VIGENTE              BOOL                 null,
   FECHA_ESTADO         DATE                 null
);

alter table RESERVA
   add constraint PK_RESERVA primary key (ID_RESERVA);

/*==============================================================*/
/* Table: Historia_Reserva                                               */
/*==============================================================*/

CREATE TABLE public.Historia_Reserva
(
	id_historia integer NOT NULL,
	operacion char(1) NOT NULL,
	fecha_proceso date NOT NULL,
	id_reserva integer NOT NULL,

  CONSTRAINT pk_id_historia PRIMARY KEY (id_historia)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.Historia_Reserva
  OWNER TO sa;

/*==============================================================*/
/* Index: RESERVA_PK                                            */
/*==============================================================*/
create unique index RESERVA_PK on RESERVA (
ID_RESERVA
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on RESERVA (
ID_FUNCION
);

/*==============================================================*/
/* Table: ROL_REPARTO                                           */
/*==============================================================*/
create table ROL_REPARTO (
   ID_ROL_REPARTO       INT4                 not null,
   NOMBRE_ROL           VARCHAR(100)         null
);

alter table ROL_REPARTO
   add constraint PK_ROL_REPARTO primary key (ID_ROL_REPARTO);
   
ALTER TABLE ROL_REPARTO ADD UNIQUE (nombre_rol);

/*==============================================================*/
/* Index: ROL_REPARTO_PK                                        */
/*==============================================================*/
create unique index ROL_REPARTO_PK on ROL_REPARTO (
ID_ROL_REPARTO
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA (
   ID_SALA              INT4                 not null,
   ID_CINE              INT4                 null,
   NUMERO_SALA          INT4                 null,
   CANTIDAD_BUTACAS     INT4                 null
);

alter table SALA
   add constraint PK_SALA primary key (ID_SALA);

/*==============================================================*/
/* Index: SALA_PK                                               */
/*==============================================================*/
create unique index SALA_PK on SALA (
ID_SALA
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on SALA (
ID_CINE
);

alter table BUTACA_RESERVADA
   add constraint FK_BUTACA_R_RELATIONS_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA)
      on delete restrict on update restrict;

alter table FUNCION
   add constraint FK_FUNCION_RELATIONS_SALA foreign key (ID_SALA)
      references SALA (ID_SALA)
      on delete restrict on update restrict;

alter table FUNCION
   add constraint FK_FUNCION_RELATIONS_PELICULA foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA)
      on delete restrict on update restrict;

alter table PELICULA
   add constraint FK_PELICULA_RELATIONS_CALIFICA foreign key (ID_CALIFICACION_PELICULA)
      references CALIFICACION_PELICULA (ID_CALIFICACION_PELICULA)
      on delete restrict on update restrict;

alter table PELICULA
   add constraint FK_PELICULA_RELATIONS_GENERO_P foreign key (ID_GENERO_PELICULA)
      references GENERO_PELICULA (ID_GENERO_PELICULA)
      on delete restrict on update restrict;

alter table PELICULA
   add constraint FK_PELICULA_RELATIONS_REPARTO foreign key (ID_REPARTO)
      references REPARTO (ID_REPARTO)
      on delete restrict on update restrict;

alter table REPARTO
   add constraint FK_REPARTO_RELATIONS_PERSONA foreign key (ID_PERSONA)
      references PERSONA (ID_PERSONA)
      on delete restrict on update restrict;

alter table REPARTO
   add constraint FK_REPARTO_RELATIONS_ROL_REPA foreign key (ID_ROL_REPARTO)
      references ROL_REPARTO (ID_ROL_REPARTO)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_RELATIONS_FUNCION foreign key (ID_FUNCION)
      references FUNCION (ID_FUNCION)
      on delete restrict on update restrict;

alter table SALA
   add constraint FK_SALA_RELATIONS_CINE foreign key (ID_CINE)
      references CINE (ID_CINE)
      on delete restrict on update restrict;

