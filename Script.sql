--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-07-22 01:09:50

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
-- TOC entry 4976 (class 0 OID 0)
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
-- TOC entry 4977 (class 0 OID 0)
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
-- TOC entry 4978 (class 0 OID 0)
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
-- TOC entry 4979 (class 0 OID 0)
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
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 226
-- Name: Tema_idTema_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tema_idTema_seq" OWNED BY public."Tema"."idTema";


--
-- TOC entry 227 (class 1259 OID 17633)
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
-- TOC entry 228 (class 1259 OID 17638)
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
-- TOC entry 229 (class 1259 OID 17643)
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
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 229
-- Name: UsuarioMateria_idUsuMat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."UsuarioMateria_idUsuMat_seq" OWNED BY public."UsuarioMateria"."idUsuMat";


--
-- TOC entry 230 (class 1259 OID 17644)
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
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 230
-- Name: Usuario_idUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Usuario_idUsuario_seq" OWNED BY public."Usuario"."idUsuario";


--
-- TOC entry 231 (class 1259 OID 17645)
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
-- TOC entry 232 (class 1259 OID 17653)
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
-- TOC entry 4780 (class 2604 OID 17658)
-- Name: Apunte idApunte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Apunte" ALTER COLUMN "idApunte" SET DEFAULT nextval('public."Apunte_idApunte_seq"'::regclass);


--
-- TOC entry 4781 (class 2604 OID 17659)
-- Name: Contenido idContenido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contenido" ALTER COLUMN "idContenido" SET DEFAULT nextval('public."Contenido_idContenido_seq"'::regclass);


--
-- TOC entry 4782 (class 2604 OID 17660)
-- Name: Materia idMateria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Materia" ALTER COLUMN "idMateria" SET DEFAULT nextval('public."Materia_idMateria_seq"'::regclass);


--
-- TOC entry 4783 (class 2604 OID 17661)
-- Name: Recordatorio idRecordatorio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recordatorio" ALTER COLUMN "idRecordatorio" SET DEFAULT nextval('public."Recordatorio_idRecordatorio_seq"'::regclass);


--
-- TOC entry 4784 (class 2604 OID 17662)
-- Name: Tema idTema; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tema" ALTER COLUMN "idTema" SET DEFAULT nextval('public."Tema_idTema_seq"'::regclass);


--
-- TOC entry 4785 (class 2604 OID 17664)
-- Name: Usuario idUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario" ALTER COLUMN "idUsuario" SET DEFAULT nextval('public."Usuario_idUsuario_seq"'::regclass);


--
-- TOC entry 4786 (class 2604 OID 17665)
-- Name: UsuarioMateria idUsuMat; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioMateria" ALTER COLUMN "idUsuMat" SET DEFAULT nextval('public."UsuarioMateria_idUsuMat_seq"'::regclass);


--
-- TOC entry 4957 (class 0 OID 17597)
-- Dependencies: 217
-- Data for Name: Apunte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Apunte" ("idApunte", "idUsuMat", fecha, titulo, resumen) FROM stdin;
\.


--
-- TOC entry 4959 (class 0 OID 17603)
-- Dependencies: 219
-- Data for Name: Contenido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Contenido" ("idContenido", "idTema", texto) FROM stdin;
\.


--
-- TOC entry 4961 (class 0 OID 17609)
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
-- TOC entry 4963 (class 0 OID 17615)
-- Dependencies: 223
-- Data for Name: Recordatorio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Recordatorio" ("idRecordatorio", "idUsuario", "fechaLimite", titulo, descripcion, estado, "fechaRegistro", hora) FROM stdin;
\.


--
-- TOC entry 4965 (class 0 OID 17621)
-- Dependencies: 225
-- Data for Name: Tema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tema" ("idTema", "idApunte", "idTemaPadre", nombre) FROM stdin;
\.


--
-- TOC entry 4967 (class 0 OID 17633)
-- Dependencies: 227
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuario" ("idUsuario", nombre, apellido, correo, contrasena, estado, "fechaRegistro") FROM stdin;
\.


--
-- TOC entry 4968 (class 0 OID 17638)
-- Dependencies: 228
-- Data for Name: UsuarioMateria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UsuarioMateria" ("idUsuMat", "idUsuario", "idMateria", estado, "fechaRegistro") FROM stdin;
\.


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 218
-- Name: Apunte_idApunte_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Apunte_idApunte_seq"', 1, false);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 220
-- Name: Contenido_idContenido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Contenido_idContenido_seq"', 1, false);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 222
-- Name: Materia_idMateria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Materia_idMateria_seq"', 5, true);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 224
-- Name: Recordatorio_idRecordatorio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Recordatorio_idRecordatorio_seq"', 1, false);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 226
-- Name: Tema_idTema_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tema_idTema_seq"', 1, false);


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 229
-- Name: UsuarioMateria_idUsuMat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UsuarioMateria_idUsuMat_seq"', 1, false);


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 230
-- Name: Usuario_idUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Usuario_idUsuario_seq"', 1, false);


--
-- TOC entry 4788 (class 2606 OID 17667)
-- Name: Apunte Apunte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Apunte"
    ADD CONSTRAINT "Apunte_pkey" PRIMARY KEY ("idApunte");


--
-- TOC entry 4790 (class 2606 OID 17669)
-- Name: Contenido Contenido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contenido"
    ADD CONSTRAINT "Contenido_pkey" PRIMARY KEY ("idContenido");


--
-- TOC entry 4792 (class 2606 OID 17671)
-- Name: Materia Materia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Materia"
    ADD CONSTRAINT "Materia_pkey" PRIMARY KEY ("idMateria");


--
-- TOC entry 4794 (class 2606 OID 17673)
-- Name: Recordatorio Recordatorio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recordatorio"
    ADD CONSTRAINT "Recordatorio_pkey" PRIMARY KEY ("idRecordatorio");


--
-- TOC entry 4796 (class 2606 OID 17675)
-- Name: Tema Tema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tema"
    ADD CONSTRAINT "Tema_pkey" PRIMARY KEY ("idTema");


--
-- TOC entry 4802 (class 2606 OID 17679)
-- Name: UsuarioMateria UsuarioMateria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioMateria"
    ADD CONSTRAINT "UsuarioMateria_pkey" PRIMARY KEY ("idUsuMat");


--
-- TOC entry 4798 (class 2606 OID 17681)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("idUsuario");


--
-- TOC entry 4800 (class 2606 OID 17723)
-- Name: Usuario correo_unico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT correo_unico UNIQUE (correo);


--
-- TOC entry 4806 (class 2606 OID 17933)
-- Name: Tema Apunte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tema"
    ADD CONSTRAINT "Apunte_fkey" FOREIGN KEY ("idApunte") REFERENCES public."Apunte"("idApunte") ON DELETE CASCADE;


--
-- TOC entry 4807 (class 2606 OID 17953)
-- Name: Tema TemaPadre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tema"
    ADD CONSTRAINT "TemaPadre_fkey" FOREIGN KEY ("idTemaPadre") REFERENCES public."Tema"("idTema") ON DELETE CASCADE;


--
-- TOC entry 4804 (class 2606 OID 17928)
-- Name: Contenido Tema_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contenido"
    ADD CONSTRAINT "Tema_fkey" FOREIGN KEY ("idTema") REFERENCES public."Tema"("idTema") ON DELETE CASCADE;


--
-- TOC entry 4805 (class 2606 OID 17948)
-- Name: Recordatorio Usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recordatorio"
    ADD CONSTRAINT "Usuario_fkey" FOREIGN KEY ("idUsuario") REFERENCES public."Usuario"("idUsuario") ON DELETE CASCADE;


--
-- TOC entry 4808 (class 2606 OID 17707)
-- Name: UsuarioMateria idMateria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioMateria"
    ADD CONSTRAINT "idMateria" FOREIGN KEY ("idMateria") REFERENCES public."Materia"("idMateria") NOT VALID;


--
-- TOC entry 4803 (class 2606 OID 17938)
-- Name: Apunte idUsuMat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Apunte"
    ADD CONSTRAINT "idUsuMat" FOREIGN KEY ("idUsuMat") REFERENCES public."UsuarioMateria"("idUsuMat") ON DELETE CASCADE;


--
-- TOC entry 4809 (class 2606 OID 17943)
-- Name: UsuarioMateria idUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioMateria"
    ADD CONSTRAINT "idUsuario" FOREIGN KEY ("idUsuario") REFERENCES public."Usuario"("idUsuario") ON DELETE CASCADE;


-- Completed on 2025-07-22 01:09:50

--
-- PostgreSQL database dump complete
--

