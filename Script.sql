--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-07-20 21:41:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 17597)
-- Name: Apunte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Apunte" (
    "idApunte" integer NOT NULL,
    "idUsuMat" bigint NOT NULL,
    fecha date NOT NULL,
    titulo text NOT NULL,
    resumen text
);


ALTER TABLE public."Apunte" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17602)
-- Name: Apunte_idApunte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Apunte_idApunte_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Apunte_idApunte_seq" OWNER TO postgres;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 218
-- Name: Apunte_idApunte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Apunte_idApunte_seq" OWNED BY public."Apunte"."idApunte";


--
-- TOC entry 219 (class 1259 OID 17603)
-- Name: Contenido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Contenido" (
    "idContenido" integer NOT NULL,
    "idTema" bigint NOT NULL,
    "idTipo" bigint NOT NULL,
    texto text NOT NULL
);


ALTER TABLE public."Contenido" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17608)
-- Name: Contenido_idContenido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Contenido_idContenido_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Contenido_idContenido_seq" OWNER TO postgres;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 220
-- Name: Contenido_idContenido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Contenido_idContenido_seq" OWNED BY public."Contenido"."idContenido";


--
-- TOC entry 221 (class 1259 OID 17609)
-- Name: Materia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Materia" (
    "idMateria" integer NOT NULL,
    "nombreMateria" text NOT NULL,
    "cursoParalelo" text NOT NULL,
    "nombreDocente" text NOT NULL,
    horario text NOT NULL,
    estado text NOT NULL,
    "fechaRegistro" date NOT NULL,
    clave text,
    "imagenUrl" text
);


ALTER TABLE public."Materia" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17614)
-- Name: Materia_idMateria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Materia_idMateria_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Materia_idMateria_seq" OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 222
-- Name: Materia_idMateria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Materia_idMateria_seq" OWNED BY public."Materia"."idMateria";


--
-- TOC entry 223 (class 1259 OID 17615)
-- Name: Recordatorio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Recordatorio" (
    "idRecordatorio" integer NOT NULL,
    "idUsuario" bigint NOT NULL,
    "fechaLimite" date NOT NULL,
    titulo text NOT NULL,
    descripcion text,
    estado text NOT NULL,
    "fechaRegistro" date NOT NULL,
    hora text NOT NULL
);


ALTER TABLE public."Recordatorio" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17620)
-- Name: Recordatorio_idRecordatorio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Recordatorio_idRecordatorio_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Recordatorio_idRecordatorio_seq" OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 224
-- Name: Recordatorio_idRecordatorio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Recordatorio_idRecordatorio_seq" OWNED BY public."Recordatorio"."idRecordatorio";


--
-- TOC entry 225 (class 1259 OID 17621)
-- Name: Tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tema" (
    "idTema" integer NOT NULL,
    "idApunte" bigint NOT NULL,
    "idTemaPadre" bigint,
    nombre text NOT NULL
);


ALTER TABLE public."Tema" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17626)
-- Name: Tema_idTema_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tema_idTema_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Tema_idTema_seq" OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 226
-- Name: Tema_idTema_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tema_idTema_seq" OWNED BY public."Tema"."idTema";


--
-- TOC entry 227 (class 1259 OID 17627)
-- Name: Tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tipo" (
    "idTipo" integer NOT NULL,
    nombre text NOT NULL,
    descripcion text
);


ALTER TABLE public."Tipo" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17632)
-- Name: Tipo_idTipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tipo_idTipo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Tipo_idTipo_seq" OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 228
-- Name: Tipo_idTipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tipo_idTipo_seq" OWNED BY public."Tipo"."idTipo";


--
-- TOC entry 229 (class 1259 OID 17633)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "idUsuario" integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    correo text NOT NULL,
    contrasena text NOT NULL,
    estado text NOT NULL,
    "fechaRegistro" date NOT NULL
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17638)
-- Name: UsuarioMateria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UsuarioMateria" (
    "idUsuMat" integer NOT NULL,
    "idUsuario" bigint NOT NULL,
    "idMateria" bigint NOT NULL,
    estado text NOT NULL,
    "fechaRegistro" date NOT NULL
);


ALTER TABLE public."UsuarioMateria" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17643)
-- Name: UsuarioMateria_idUsuMat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."UsuarioMateria_idUsuMat_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."UsuarioMateria_idUsuMat_seq" OWNER TO postgres;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 231
-- Name: UsuarioMateria_idUsuMat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."UsuarioMateria_idUsuMat_seq" OWNED BY public."UsuarioMateria"."idUsuMat";


--
-- TOC entry 232 (class 1259 OID 17644)
-- Name: Usuario_idUsuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Usuario_idUsuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Usuario_idUsuario_seq" OWNER TO postgres;

--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 232
-- Name: Usuario_idUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Usuario_idUsuario_seq" OWNED BY public."Usuario"."idUsuario";


--
-- TOC entry 233 (class 1259 OID 17645)
-- Name: recordatoriosporusuario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.recordatoriosporusuario AS
 SELECT "idUsuario",
    count(*) FILTER (WHERE (estado = 'Pendiente'::text)) AS pendientes,
    count(*) FILTER (WHERE (estado = 'Realizado'::text)) AS realizados,
    count(*) AS total
   FROM public."Recordatorio"
  GROUP BY "idUsuario";


ALTER VIEW public.recordatoriosporusuario OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17653)
-- Name: usuariomaterias; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.usuariomaterias AS
 SELECT um."idUsuMat",
    ((u.nombre || ' '::text) || u.apellido) AS usuario,
    m."nombreMateria",
    m."cursoParalelo"
   FROM ((public."UsuarioMateria" um
     JOIN public."Usuario" u ON ((um."idUsuario" = u."idUsuario")))
     JOIN public."Materia" m ON ((um."idMateria" = m."idMateria")))
  WHERE (um.estado = 'Activo'::text)
  ORDER BY ((u.nombre || ' '::text) || u.apellido);


ALTER VIEW public.usuariomaterias OWNER TO postgres;

--
-- TOC entry 4785 (class 2604 OID 17658)
-- Name: Apunte idApunte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Apunte" ALTER COLUMN "idApunte" SET DEFAULT nextval('public."Apunte_idApunte_seq"'::regclass);


--
-- TOC entry 4786 (class 2604 OID 17659)
-- Name: Contenido idContenido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contenido" ALTER COLUMN "idContenido" SET DEFAULT nextval('public."Contenido_idContenido_seq"'::regclass);


--
-- TOC entry 4787 (class 2604 OID 17660)
-- Name: Materia idMateria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Materia" ALTER COLUMN "idMateria" SET DEFAULT nextval('public."Materia_idMateria_seq"'::regclass);


--
-- TOC entry 4788 (class 2604 OID 17661)
-- Name: Recordatorio idRecordatorio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recordatorio" ALTER COLUMN "idRecordatorio" SET DEFAULT nextval('public."Recordatorio_idRecordatorio_seq"'::regclass);


--
-- TOC entry 4789 (class 2604 OID 17662)
-- Name: Tema idTema; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tema" ALTER COLUMN "idTema" SET DEFAULT nextval('public."Tema_idTema_seq"'::regclass);


--
-- TOC entry 4790 (class 2604 OID 17663)
-- Name: Tipo idTipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo" ALTER COLUMN "idTipo" SET DEFAULT nextval('public."Tipo_idTipo_seq"'::regclass);


--
-- TOC entry 4791 (class 2604 OID 17664)
-- Name: Usuario idUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario" ALTER COLUMN "idUsuario" SET DEFAULT nextval('public."Usuario_idUsuario_seq"'::regclass);


--
-- TOC entry 4792 (class 2604 OID 17665)
-- Name: UsuarioMateria idUsuMat; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioMateria" ALTER COLUMN "idUsuMat" SET DEFAULT nextval('public."UsuarioMateria_idUsuMat_seq"'::regclass);


--
-- TOC entry 4966 (class 0 OID 17597)
-- Dependencies: 217
-- Data for Name: Apunte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Apunte" ("idApunte", "idUsuMat", fecha, titulo, resumen) FROM stdin;
3	3	2025-06-04	MER	Resumen del diagrama entidad-relación
4	4	2025-06-04	SCRUM	Resumen de metodología ágil SCRUM
\.


--
-- TOC entry 4968 (class 0 OID 17603)
-- Dependencies: 219
-- Data for Name: Contenido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Contenido" ("idContenido", "idTema", "idTipo", texto) FROM stdin;
4	5	1	Una entidad representa un objeto del mundo real. Una relación une dos entidades.
\.


--
-- TOC entry 4970 (class 0 OID 17609)
-- Dependencies: 221
-- Data for Name: Materia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Materia" ("idMateria", "nombreMateria", "cursoParalelo", "nombreDocente", horario, estado, "fechaRegistro", clave, "imagenUrl") FROM stdin;
1	Administración de Bases de Datos	Quinto 'A'	Milton Valarezo	Lunes 07:30 - 09:30 / Jueves 07:30 - 09:30	Activo	2025-06-05	abd123	abd.jpg
2	Ingeniería de Software I	Quinto 'A'	Patricio Orellana	Lunes 09:30 - 11:30 / Jueves 09:30 - 11:30	Activo	2025-06-05	is123	is.jpg
3	Plataformas de Hardware	Quinto 'A'	Johnny Novillo	Lunes 11:30 - 13:30 / Miércoles 09:30 - 11:30	Activo	2025-06-05	ph123	ph.avif
4	Tecnologías Web	Quinto 'A'	Milton Valarezo	Martes 07:30 - 10:30	Activo	2025-06-05	tw123	tw.avif
5	Fundamentos de Redes	Quinto 'A'	Oscar Cardenas	Lunes 11:30 - 13:30 / Miércoles 09:30 - 11:30	Activo	2025-06-05	fr123	fr.jpg
\.


--
-- TOC entry 4972 (class 0 OID 17615)
-- Dependencies: 223
-- Data for Name: Recordatorio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Recordatorio" ("idRecordatorio", "idUsuario", "fechaLimite", titulo, descripcion, estado, "fechaRegistro", hora) FROM stdin;
15	4	2025-06-15	Desarrollo App Angular	Implementar módulo de autenticación.	Activo	2025-06-03	14:00
1	1	2025-06-06	Deber de Ingeniería en software	Investigación de usabilidad (conceptos, ejemplos e importancia.)	Activo	2025-06-01	14:00
4	1	2025-06-08	Entrevista técnica	Preparar respuestas y repasar algoritmos.	Activo	2025-06-05	07:00
6	3	2025-06-07	Práctica de Electrónica	Simular circuito en Proteus.	Activo	2025-06-05	23:59
7	4	2025-07-10	Ensayo de ética	Redactar el ensayo sobre dilemas éticos.	Activo	2025-06-01	10:30
8	1	2025-06-13	Informe de laboratorio	Análisis de resultados y conclusiones.	Activo	2025-06-03	13:00
10	3	2025-05-30	Evaluación Sistemas Operativos	Estudiar planificación de procesos.	Activo	2025-05-27	07:30
11	4	2025-06-06	Exposición de Historia	Preparar presentación en PowerPoint.	Activo	2025-06-05	15:00
12	1	2025-06-20	Taller de Física	Resolver problemas de cinemática.	Activo	2025-06-01	17:00
14	3	2025-06-12	Simulación de red	Usar Cisco Packet Tracer.	Activo	2025-06-04	08:30
16	1	2025-06-10	Revisión bibliográfica	Leer artículos sobre UX/UI.	Activo	2025-06-05	13:30
18	3	2025-05-25	Control de lectura	Leer capítulo 4 y responder preguntas.	Activo	2025-05-20	16:30
19	4	2025-06-05	Práctica de SQL	Diseñar consultas con joins y subqueries.	Activo	2025-06-04	09:00
20	1	2025-06-30	Ensayo sobre transformación digital	Escribir borrador y corregir redacción.	Activo	2025-06-01	08:30
22	3	2025-06-16	Entrega de infografía	Diseñar infografía sobre redes neuronales.	Activo	2025-06-02	11:30
23	4	2025-06-09	Tarea de probabilidad	Resolver ejercicios sobre distribuciones.	Activo	2025-06-05	12:00
24	1	2025-07-02	Reporte de prácticas preprofesionales	Completar formato y adjuntar evidencias.	Activo	2025-06-04	07:00
26	3	2025-06-08	Taller de Java	Practicar manejo de excepciones.	Activo	2025-06-05	19:30
27	4	2025-06-06	Consulta de proyecto final	Asistir a tutoría con avances.	Activo	2025-06-05	21:00
28	1	2025-06-07	Simulación empresarial	Revisar escenarios económicos.	Activo	2025-06-05	22:30
30	3	2025-06-05	Entrega de práctica HTML/CSS	Maquetar sitio web responsivo.	Activo	2025-06-05	08:00
31	4	2025-06-14	Trabajo grupal Ética Profesional	Coordinar tareas con el grupo.	Activo	2025-06-03	15:30
32	1	2025-06-01	Cuestionario de análisis de datos	Resolver en línea antes del plazo.	Activo	2025-05-30	16:00
34	1	2025-07-18	Prueba ID	Probando ID	Activo	2025-07-16	10:30
\.


--
-- TOC entry 4974 (class 0 OID 17621)
-- Dependencies: 225
-- Data for Name: Tema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tema" ("idTema", "idApunte", "idTemaPadre", nombre) FROM stdin;
5	3	\N	Entidades y relaciones
\.


--
-- TOC entry 4976 (class 0 OID 17627)
-- Dependencies: 227
-- Data for Name: Tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tipo" ("idTipo", nombre, descripcion) FROM stdin;
1	Definición	Explicación conceptual del tema
2	Ejemplo	Caso práctico del contenido
3	Aplicación	Cómo se usa en la vida real
\.


--
-- TOC entry 4978 (class 0 OID 17633)
-- Dependencies: 229
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuario" ("idUsuario", nombre, apellido, correo, contrasena, estado, "fechaRegistro") FROM stdin;
3	Anthony	Murillo	jorebed54321@gmail.com	AnthonyMurillo2003	Activo	2025-06-01
4	Mauricio	Perez	mauriciobbelduma29@gmail.com	00900977	Activo	2025-06-01
1	Alex Ariel	Niola Toro	niolatoro@hotmail.com	Ados0750669202@	Activo	2025-06-01
5	Juan	Perez	juan@example.com	Segura123*	Activo	2025-07-20
9	Charlie	Cordova	charlie@gmail.com	Charlie123@	Activo	2025-07-21
\.


--
-- TOC entry 4979 (class 0 OID 17638)
-- Dependencies: 230
-- Data for Name: UsuarioMateria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UsuarioMateria" ("idUsuMat", "idUsuario", "idMateria", estado, "fechaRegistro") FROM stdin;
3	3	1	Activo	2025-06-05
4	4	2	Activo	2025-06-05
6	1	2	Activo	2025-07-19
7	1	3	Activo	2025-07-19
12	3	5	Activo	2025-07-20
14	1	4	Activo	2025-07-20
15	1	5	Activo	2025-07-20
16	1	1	Activo	2025-07-20
\.


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 218
-- Name: Apunte_idApunte_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Apunte_idApunte_seq"', 1, false);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 220
-- Name: Contenido_idContenido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Contenido_idContenido_seq"', 1, false);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 222
-- Name: Materia_idMateria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Materia_idMateria_seq"', 1, false);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 224
-- Name: Recordatorio_idRecordatorio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Recordatorio_idRecordatorio_seq"', 42, true);


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 226
-- Name: Tema_idTema_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tema_idTema_seq"', 1, false);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 228
-- Name: Tipo_idTipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tipo_idTipo_seq"', 1, false);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 231
-- Name: UsuarioMateria_idUsuMat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UsuarioMateria_idUsuMat_seq"', 23, true);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 232
-- Name: Usuario_idUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Usuario_idUsuario_seq"', 9, true);


--
-- TOC entry 4794 (class 2606 OID 17667)
-- Name: Apunte Apunte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Apunte"
    ADD CONSTRAINT "Apunte_pkey" PRIMARY KEY ("idApunte");


--
-- TOC entry 4796 (class 2606 OID 17669)
-- Name: Contenido Contenido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contenido"
    ADD CONSTRAINT "Contenido_pkey" PRIMARY KEY ("idContenido");


--
-- TOC entry 4798 (class 2606 OID 17671)
-- Name: Materia Materia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Materia"
    ADD CONSTRAINT "Materia_pkey" PRIMARY KEY ("idMateria");


--
-- TOC entry 4800 (class 2606 OID 17673)
-- Name: Recordatorio Recordatorio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recordatorio"
    ADD CONSTRAINT "Recordatorio_pkey" PRIMARY KEY ("idRecordatorio");


--
-- TOC entry 4802 (class 2606 OID 17675)
-- Name: Tema Tema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tema"
    ADD CONSTRAINT "Tema_pkey" PRIMARY KEY ("idTema");


--
-- TOC entry 4804 (class 2606 OID 17677)
-- Name: Tipo Tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo"
    ADD CONSTRAINT "Tipo_pkey" PRIMARY KEY ("idTipo");


--
-- TOC entry 4810 (class 2606 OID 17679)
-- Name: UsuarioMateria UsuarioMateria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioMateria"
    ADD CONSTRAINT "UsuarioMateria_pkey" PRIMARY KEY ("idUsuMat");


--
-- TOC entry 4806 (class 2606 OID 17681)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("idUsuario");


--
-- TOC entry 4808 (class 2606 OID 17723)
-- Name: Usuario correo_unico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT correo_unico UNIQUE (correo);


--
-- TOC entry 4815 (class 2606 OID 17933)
-- Name: Tema Apunte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tema"
    ADD CONSTRAINT "Apunte_fkey" FOREIGN KEY ("idApunte") REFERENCES public."Apunte"("idApunte") ON DELETE CASCADE;


--
-- TOC entry 4816 (class 2606 OID 17687)
-- Name: Tema TemaPadre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tema"
    ADD CONSTRAINT "TemaPadre_fkey" FOREIGN KEY ("idTemaPadre") REFERENCES public."Tema"("idTema") NOT VALID;


--
-- TOC entry 4812 (class 2606 OID 17928)
-- Name: Contenido Tema_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contenido"
    ADD CONSTRAINT "Tema_fkey" FOREIGN KEY ("idTema") REFERENCES public."Tema"("idTema") ON DELETE CASCADE;


--
-- TOC entry 4813 (class 2606 OID 17697)
-- Name: Contenido Tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contenido"
    ADD CONSTRAINT "Tipo_fkey" FOREIGN KEY ("idTipo") REFERENCES public."Tipo"("idTipo") NOT VALID;


--
-- TOC entry 4814 (class 2606 OID 17948)
-- Name: Recordatorio Usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recordatorio"
    ADD CONSTRAINT "Usuario_fkey" FOREIGN KEY ("idUsuario") REFERENCES public."Usuario"("idUsuario") ON DELETE CASCADE;


--
-- TOC entry 4817 (class 2606 OID 17707)
-- Name: UsuarioMateria idMateria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioMateria"
    ADD CONSTRAINT "idMateria" FOREIGN KEY ("idMateria") REFERENCES public."Materia"("idMateria") NOT VALID;


--
-- TOC entry 4811 (class 2606 OID 17938)
-- Name: Apunte idUsuMat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Apunte"
    ADD CONSTRAINT "idUsuMat" FOREIGN KEY ("idUsuMat") REFERENCES public."UsuarioMateria"("idUsuMat") ON DELETE CASCADE;


--
-- TOC entry 4818 (class 2606 OID 17943)
-- Name: UsuarioMateria idUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioMateria"
    ADD CONSTRAINT "idUsuario" FOREIGN KEY ("idUsuario") REFERENCES public."Usuario"("idUsuario") ON DELETE CASCADE;


-- Completed on 2025-07-20 21:41:25

--
-- PostgreSQL database dump complete
--

