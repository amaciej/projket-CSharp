/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     30.11.2018 15:52:06                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AUTOKARY') and o.name = 'FK_AUTOKARY_KIEROWCA__KIEROWCY')
alter table AUTOKARY
   drop constraint FK_AUTOKARY_KIEROWCA__KIEROWCY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KURSY') and o.name = 'FK_KURSY_AUTOKAR W_AUTOKARY')
alter table KURSY
   drop constraint "FK_KURSY_AUTOKAR W_AUTOKARY"
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KURSY') and o.name = 'FK_KURSY_TRASA W K_TRASY')
alter table KURSY
   drop constraint "FK_KURSY_TRASA W K_TRASY"
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ODCINEK') and o.name = 'FK_ODCINEK_KONIEC_MIEJSCOW')
alter table ODCINEK
   drop constraint FK_ODCINEK_KONIEC_MIEJSCOW
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ODCINEK') and o.name = 'FK_ODCINEK_START_MIEJSCOW')
alter table ODCINEK
   drop constraint FK_ODCINEK_START_MIEJSCOW
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ODCINEK_TRASY') and o.name = 'FK_ODCINEK__ODCINEK_T_ODCINEK')
alter table ODCINEK_TRASY
   drop constraint FK_ODCINEK__ODCINEK_T_ODCINEK
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ODCINEK_TRASY') and o.name = 'FK_ODCINEK__ODCINEK_T_TRASY')
alter table ODCINEK_TRASY
   drop constraint FK_ODCINEK__ODCINEK_T_TRASY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PASAŻEROWIE_KURSY') and o.name = 'FK_PASAŻERO_KURS_PASA_PASAŻERO')
alter table PASAŻEROWIE_KURSY
   drop constraint FK_PASAŻERO_KURS_PASA_PASAŻERO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PASAŻEROWIE_KURSY') and o.name = 'FK_PASAŻERO_PASAŻEROW_KURSY')
alter table PASAŻEROWIE_KURSY
   drop constraint FK_PASAŻERO_PASAŻEROW_KURSY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UŻYTKOWNICY') and o.name = 'FK_UŻYTKOWN_FUNCKJA U_UPRAWNIE')
alter table UŻYTKOWNICY
   drop constraint "FK_UŻYTKOWN_FUNCKJA U_UPRAWNIE"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AUTOKARY')
            and   name  = 'Kierowca_autobusu_FK'
            and   indid > 0
            and   indid < 255)
   drop index AUTOKARY.Kierowca_autobusu_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AUTOKARY')
            and   type = 'U')
   drop table AUTOKARY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KIEROWCY')
            and   type = 'U')
   drop table KIEROWCY
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KURSY')
            and   name  = 'Autokar w kursie_FK'
            and   indid > 0
            and   indid < 255)
   drop index KURSY."Autokar w kursie_FK"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KURSY')
            and   name  = 'Trasa w kursie_FK'
            and   indid > 0
            and   indid < 255)
   drop index KURSY."Trasa w kursie_FK"
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KURSY')
            and   type = 'U')
   drop table KURSY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MIEJSCOWOŚCI')
            and   type = 'U')
   drop table MIEJSCOWOŚCI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ODCINEK')
            and   name  = 'Koniec_FK'
            and   indid > 0
            and   indid < 255)
   drop index ODCINEK.Koniec_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ODCINEK')
            and   name  = 'Start_FK'
            and   indid > 0
            and   indid < 255)
   drop index ODCINEK.Start_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ODCINEK')
            and   type = 'U')
   drop table ODCINEK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ODCINEK_TRASY')
            and   name  = 'ODCINEK_TRASY2_FK'
            and   indid > 0
            and   indid < 255)
   drop index ODCINEK_TRASY.ODCINEK_TRASY2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ODCINEK_TRASY')
            and   name  = 'ODCINEK_TRASY_FK'
            and   indid > 0
            and   indid < 255)
   drop index ODCINEK_TRASY.ODCINEK_TRASY_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ODCINEK_TRASY')
            and   type = 'U')
   drop table ODCINEK_TRASY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PASAŻEROWIE')
            and   type = 'U')
   drop table PASAŻEROWIE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PASAŻEROWIE_KURSY')
            and   name  = 'Pasażerowie w kursie_FK'
            and   indid > 0
            and   indid < 255)
   drop index PASAŻEROWIE_KURSY."Pasażerowie w kursie_FK"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PASAŻEROWIE_KURSY')
            and   name  = 'Kurs_pasażera_FK'
            and   indid > 0
            and   indid < 255)
   drop index PASAŻEROWIE_KURSY.Kurs_pasażera_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PASAŻEROWIE_KURSY')
            and   type = 'U')
   drop table PASAŻEROWIE_KURSY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TRASY')
            and   type = 'U')
   drop table TRASY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UPRAWNIENIA')
            and   type = 'U')
   drop table UPRAWNIENIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('UŻYTKOWNICY')
            and   name  = 'Funckja użytkowników_FK'
            and   indid > 0
            and   indid < 255)
   drop index UŻYTKOWNICY."Funckja użytkowników_FK"
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UŻYTKOWNICY')
            and   type = 'U')
   drop table UŻYTKOWNICY
go

/*==============================================================*/
/* Table: AUTOKARY                                              */
/*==============================================================*/
create table AUTOKARY (
   Id_Autokaru          int                  not null,
   Id_Kierowcy          int                  null,
   Nr_Rejstracyjny      varchar(7)           null,
   Iilość_Miejsc        int                  null,
   Marka                varchar(25)          null,
   Model                varchar(20)          null,
   Rocznik              int                  null,
   constraint PK_AUTOKARY primary key nonclustered (Id_Autokaru)
)
go

/*==============================================================*/
/* Index: Kierowca_autobusu_FK                                  */
/*==============================================================*/
create index Kierowca_autobusu_FK on AUTOKARY (
Id_Kierowcy ASC
)
go

/*==============================================================*/
/* Table: KIEROWCY                                              */
/*==============================================================*/
create table KIEROWCY (
   Id_Kierowcy          int                  not null,
   Imię                 varchar(50)          null,
   Nazwisko             varchar(50)          null,
   PESEL                numeric(11)          null,
   constraint PK_KIEROWCY primary key nonclustered (Id_Kierowcy)
)
go

/*==============================================================*/
/* Table: KURSY                                                 */
/*==============================================================*/
create table KURSY (
   Id_Kursy             int                  not null,
   Id_Trasy             int                  null,
   Id_Autokaru          int                  null,
   Dni                  varchar(50)          null,
   Godz_Początek        datetime             null,
   Godz_Koniec          datetime             null,
   Ilość_Pasażerów      int                  null,
   constraint PK_KURSY primary key nonclustered (Id_Kursy)
)
go

/*==============================================================*/
/* Index: "Trasa w kursie_FK"                                   */
/*==============================================================*/
create index "Trasa w kursie_FK" on KURSY (
Id_Trasy ASC
)
go

/*==============================================================*/
/* Index: "Autokar w kursie_FK"                                 */
/*==============================================================*/
create index "Autokar w kursie_FK" on KURSY (
Id_Autokaru ASC
)
go

/*==============================================================*/
/* Table: MIEJSCOWOŚCI                                          */
/*==============================================================*/
create table MIEJSCOWOŚCI (
   Id_Miejscowości      int                  not null,
   M_Nazwa              varchar(50)          null,
   constraint PK_MIEJSCOWOŚCI primary key nonclustered (Id_Miejscowości)
)
go

/*==============================================================*/
/* Table: ODCINEK                                               */
/*==============================================================*/
create table ODCINEK (
   Id_Odcinek           int                  not null,
   Id_Miejscowości_S    int                  null,
   Id_Miejscowości_K    int                  null,
   Długość              varchar(7)           null,
   Godz_Początek        datetime             null,
   Godz_Koniec          datetime             null,
   Cena_Biletu          money                null,
   constraint PK_ODCINEK primary key nonclustered (Id_Odcinek)
)
go

/*==============================================================*/
/* Index: Start_FK                                              */
/*==============================================================*/
create index Start_FK on ODCINEK (
Id_Miejscowości_K ASC
)
go

/*==============================================================*/
/* Index: Koniec_FK                                             */
/*==============================================================*/
create index Koniec_FK on ODCINEK (
Id_Miejscowości_S ASC
)
go

/*==============================================================*/
/* Table: ODCINEK_TRASY                                         */
/*==============================================================*/
create table ODCINEK_TRASY (
   Id_Odcinek           int                  not null,
   Id_Trasy             int                  not null,
   Kolejność            int                  null,
   constraint PK_ODCINEK_TRASY primary key (Id_Odcinek, Id_Trasy)
)
go

/*==============================================================*/
/* Index: ODCINEK_TRASY_FK                                      */
/*==============================================================*/
create index ODCINEK_TRASY_FK on ODCINEK_TRASY (
Id_Odcinek ASC
)
go

/*==============================================================*/
/* Index: ODCINEK_TRASY2_FK                                     */
/*==============================================================*/
create index ODCINEK_TRASY2_FK on ODCINEK_TRASY (
Id_Trasy ASC
)
go

/*==============================================================*/
/* Table: PASAŻEROWIE                                           */
/*==============================================================*/
create table PASAŻEROWIE (
   Id_Pasażer           int                  not null,
   Imię                 varchar(50)          null,
   Nazwisko             varchar(50)          null,
   constraint PK_PASAŻEROWIE primary key nonclustered (Id_Pasażer)
)
go

/*==============================================================*/
/* Table: PASAŻEROWIE_KURSY                                     */
/*==============================================================*/
create table PASAŻEROWIE_KURSY (
   Id_PasKurs           int                  not null,
   Id_Kursy             int                  null,
   Id_Pasażer           int                  null,
   constraint PK_PASAŻEROWIE_KURSY primary key nonclustered (Id_PasKurs)
)
go

/*==============================================================*/
/* Index: Kurs_pasażera_FK                                      */
/*==============================================================*/
create index Kurs_pasażera_FK on PASAŻEROWIE_KURSY (
Id_Pasażer ASC
)
go

/*==============================================================*/
/* Index: "Pasażerowie w kursie_FK"                             */
/*==============================================================*/
create index "Pasażerowie w kursie_FK" on PASAŻEROWIE_KURSY (
Id_Kursy ASC
)
go

/*==============================================================*/
/* Table: TRASY                                                 */
/*==============================================================*/
create table TRASY (
   Id_Trasy             int                  not null,
   U_Nazwa              varchar(50)          null,
   Czas_Trasy           int                  null,
   constraint PK_TRASY primary key nonclustered (Id_Trasy)
)
go

/*==============================================================*/
/* Table: UPRAWNIENIA                                           */
/*==============================================================*/
create table UPRAWNIENIA (
   Id_Upr               int                  not null,
   U_Nazwa              varchar(50)          null,
   constraint PK_UPRAWNIENIA primary key nonclustered (Id_Upr)
)
go

/*==============================================================*/
/* Table: UŻYTKOWNICY                                           */
/*==============================================================*/
create table UŻYTKOWNICY (
   Id_Użyt              int                  not null,
   Id_Upr               int                  not null,
   Login                varchar(50)          null,
   Hasło                varchar(50)          null,
   constraint PK_UŻYTKOWNICY primary key nonclustered (Id_Użyt)
)
go

/*==============================================================*/
/* Index: "Funckja użytkowników_FK"                             */
/*==============================================================*/
create index "Funckja użytkowników_FK" on UŻYTKOWNICY (
Id_Upr ASC
)
go

alter table AUTOKARY
   add constraint FK_AUTOKARY_KIEROWCA__KIEROWCY foreign key (Id_Kierowcy)
      references KIEROWCY (Id_Kierowcy)
go

alter table KURSY
   add constraint "FK_KURSY_AUTOKAR W_AUTOKARY" foreign key (Id_Autokaru)
      references AUTOKARY (Id_Autokaru)
go

alter table KURSY
   add constraint "FK_KURSY_TRASA W K_TRASY" foreign key (Id_Trasy)
      references TRASY (Id_Trasy)
go

alter table ODCINEK
   add constraint FK_ODCINEK_KONIEC_MIEJSCOW foreign key (Id_Miejscowości_S)
      references MIEJSCOWOŚCI (Id_Miejscowości)
go

alter table ODCINEK
   add constraint FK_ODCINEK_START_MIEJSCOW foreign key (Id_Miejscowości_K)
      references MIEJSCOWOŚCI (Id_Miejscowości)
go

alter table ODCINEK_TRASY
   add constraint FK_ODCINEK__ODCINEK_T_ODCINEK foreign key (Id_Odcinek)
      references ODCINEK (Id_Odcinek)
go

alter table ODCINEK_TRASY
   add constraint FK_ODCINEK__ODCINEK_T_TRASY foreign key (Id_Trasy)
      references TRASY (Id_Trasy)
go

alter table PASAŻEROWIE_KURSY
   add constraint FK_PASAŻERO_KURS_PASA_PASAŻERO foreign key (Id_Pasażer)
      references PASAŻEROWIE (Id_Pasażer)
go

alter table PASAŻEROWIE_KURSY
   add constraint FK_PASAŻERO_PASAŻEROW_KURSY foreign key (Id_Kursy)
      references KURSY (Id_Kursy)
go

alter table UŻYTKOWNICY
   add constraint "FK_UŻYTKOWN_FUNCKJA U_UPRAWNIE" foreign key (Id_Upr)
      references UPRAWNIENIA (Id_Upr)
go

