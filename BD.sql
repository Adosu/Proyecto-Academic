PGDMP                      }            Proyecto    17.4    17.4 L    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    17596    Proyecto    DATABASE     p   CREATE DATABASE "Proyecto" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-MX';
    DROP DATABASE "Proyecto";
                     postgres    false            �            1255    17992     actualizar_estado_recordatorio()    FUNCTION     �   CREATE FUNCTION public.actualizar_estado_recordatorio() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW."fechaLimite" < CURRENT_DATE AND NEW.estado = 'Activo' THEN
    NEW.estado := 'Vencido';
  END IF;
  RETURN NEW;
END;
$$;
 7   DROP FUNCTION public.actualizar_estado_recordatorio();
       public               postgres    false            �            1255    17994    set_estado_activo()    FUNCTION     �   CREATE FUNCTION public.set_estado_activo() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.estado IS NULL THEN
    NEW.estado := 'Activo';
  END IF;
  RETURN NEW;
END;
$$;
 *   DROP FUNCTION public.set_estado_activo();
       public               postgres    false            �            1255    17985    set_fecha_registro()    FUNCTION     �   CREATE FUNCTION public.set_fecha_registro() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW."fechaRegistro" IS NULL THEN
    NEW."fechaRegistro" := CURRENT_DATE;
  END IF;
  RETURN NEW;
END;
$$;
 +   DROP FUNCTION public.set_fecha_registro();
       public               postgres    false            �            1259    17597    Apunte    TABLE     �   CREATE TABLE public."Apunte" (
    "idApunte" integer NOT NULL,
    "idUsuMat" bigint NOT NULL,
    fecha date NOT NULL,
    titulo text NOT NULL,
    resumen text
);
    DROP TABLE public."Apunte";
       public         heap r       postgres    false            �            1259    17602    Apunte_idApunte_seq    SEQUENCE     �   CREATE SEQUENCE public."Apunte_idApunte_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Apunte_idApunte_seq";
       public               postgres    false    217            �           0    0    Apunte_idApunte_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Apunte_idApunte_seq" OWNED BY public."Apunte"."idApunte";
          public               postgres    false    218            �            1259    17603 	   Contenido    TABLE        CREATE TABLE public."Contenido" (
    "idContenido" integer NOT NULL,
    "idTema" bigint NOT NULL,
    texto text NOT NULL
);
    DROP TABLE public."Contenido";
       public         heap r       postgres    false            �            1259    17608    Contenido_idContenido_seq    SEQUENCE     �   CREATE SEQUENCE public."Contenido_idContenido_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."Contenido_idContenido_seq";
       public               postgres    false    219            �           0    0    Contenido_idContenido_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Contenido_idContenido_seq" OWNED BY public."Contenido"."idContenido";
          public               postgres    false    220            �            1259    17609    Materia    TABLE     +  CREATE TABLE public."Materia" (
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
    DROP TABLE public."Materia";
       public         heap r       postgres    false            �            1259    17614    Materia_idMateria_seq    SEQUENCE     �   CREATE SEQUENCE public."Materia_idMateria_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Materia_idMateria_seq";
       public               postgres    false    221            �           0    0    Materia_idMateria_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Materia_idMateria_seq" OWNED BY public."Materia"."idMateria";
          public               postgres    false    222            �            1259    17615    Recordatorio    TABLE       CREATE TABLE public."Recordatorio" (
    "idRecordatorio" integer NOT NULL,
    "idUsuario" bigint NOT NULL,
    "fechaLimite" date NOT NULL,
    titulo text NOT NULL,
    descripcion text,
    estado text NOT NULL,
    "fechaRegistro" date NOT NULL,
    hora text NOT NULL
);
 "   DROP TABLE public."Recordatorio";
       public         heap r       postgres    false            �            1259    17620    Recordatorio_idRecordatorio_seq    SEQUENCE     �   CREATE SEQUENCE public."Recordatorio_idRecordatorio_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."Recordatorio_idRecordatorio_seq";
       public               postgres    false    223            �           0    0    Recordatorio_idRecordatorio_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public."Recordatorio_idRecordatorio_seq" OWNED BY public."Recordatorio"."idRecordatorio";
          public               postgres    false    224            �            1259    17621    Tema    TABLE     �   CREATE TABLE public."Tema" (
    "idTema" integer NOT NULL,
    "idApunte" bigint NOT NULL,
    "idTemaPadre" bigint,
    nombre text NOT NULL
);
    DROP TABLE public."Tema";
       public         heap r       postgres    false            �            1259    17626    Tema_idTema_seq    SEQUENCE     �   CREATE SEQUENCE public."Tema_idTema_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Tema_idTema_seq";
       public               postgres    false    225            �           0    0    Tema_idTema_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Tema_idTema_seq" OWNED BY public."Tema"."idTema";
          public               postgres    false    226            �            1259    17633    Usuario    TABLE     �   CREATE TABLE public."Usuario" (
    "idUsuario" integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    correo text NOT NULL,
    contrasena text NOT NULL,
    estado text NOT NULL,
    "fechaRegistro" date NOT NULL
);
    DROP TABLE public."Usuario";
       public         heap r       postgres    false            �            1259    17638    UsuarioMateria    TABLE     �   CREATE TABLE public."UsuarioMateria" (
    "idUsuMat" integer NOT NULL,
    "idUsuario" bigint NOT NULL,
    "idMateria" bigint NOT NULL,
    estado text NOT NULL,
    "fechaRegistro" date NOT NULL
);
 $   DROP TABLE public."UsuarioMateria";
       public         heap r       postgres    false            �            1259    17643    UsuarioMateria_idUsuMat_seq    SEQUENCE     �   CREATE SEQUENCE public."UsuarioMateria_idUsuMat_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."UsuarioMateria_idUsuMat_seq";
       public               postgres    false    228            �           0    0    UsuarioMateria_idUsuMat_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."UsuarioMateria_idUsuMat_seq" OWNED BY public."UsuarioMateria"."idUsuMat";
          public               postgres    false    229            �            1259    17644    Usuario_idUsuario_seq    SEQUENCE     �   CREATE SEQUENCE public."Usuario_idUsuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Usuario_idUsuario_seq";
       public               postgres    false    227            �           0    0    Usuario_idUsuario_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Usuario_idUsuario_seq" OWNED BY public."Usuario"."idUsuario";
          public               postgres    false    230            �            1259    17967    apuntes_por_materia    VIEW     �  CREATE VIEW public.apuntes_por_materia AS
 SELECT a."idApunte",
    a."idUsuMat",
    u.nombre AS nombre_usuario,
    u.apellido AS apellido_usuario,
    m."nombreMateria",
    m."cursoParalelo",
    a.fecha,
    a.titulo,
    a.resumen
   FROM (((public."Apunte" a
     JOIN public."UsuarioMateria" um ON ((a."idUsuMat" = um."idUsuMat")))
     JOIN public."Usuario" u ON ((um."idUsuario" = u."idUsuario")))
     JOIN public."Materia" m ON ((um."idMateria" = m."idMateria")))
  ORDER BY u.nombre, u.apellido;
 &   DROP VIEW public.apuntes_por_materia;
       public       v       postgres    false    217    228    227    227    228    227    221    221    228    221    217    217    217    217            �            1259    17981    contenidos_por_tema    VIEW     .  CREATE VIEW public.contenidos_por_tema AS
 SELECT c."idContenido",
    c."idTema",
    t.nombre AS nombre_tema,
    t."idTemaPadre",
    c.texto
   FROM (public."Contenido" c
     JOIN public."Tema" t ON ((c."idTema" = t."idTema")))
  ORDER BY t."idTemaPadre" NULLS FIRST, t."idTema", c."idContenido";
 &   DROP VIEW public.contenidos_por_tema;
       public       v       postgres    false    219    219    225    225    225    219            �            1259    17962    materias_inscritas_por_usuario    VIEW     �  CREATE VIEW public.materias_inscritas_por_usuario AS
 SELECT um."idUsuMat",
    um."idUsuario",
    u.nombre AS nombre_usuario,
    u.apellido AS apellido_usuario,
    um."idMateria",
    m."nombreMateria",
    m."cursoParalelo",
    um.estado,
    um."fechaRegistro"
   FROM ((public."UsuarioMateria" um
     JOIN public."Usuario" u ON ((um."idUsuario" = u."idUsuario")))
     JOIN public."Materia" m ON ((um."idMateria" = m."idMateria")))
  ORDER BY u.nombre, u.apellido;
 1   DROP VIEW public.materias_inscritas_por_usuario;
       public       v       postgres    false    227    221    221    221    227    227    228    228    228    228    228            �            1259    17958    recordatorios_por_usuario    VIEW     H  CREATE VIEW public.recordatorios_por_usuario AS
 SELECT r."idRecordatorio",
    r."idUsuario",
    u.nombre,
    u.apellido,
    r."fechaLimite",
    r.titulo,
    r.descripcion,
    r.estado,
    r."fechaRegistro",
    r.hora
   FROM (public."Recordatorio" r
     JOIN public."Usuario" u ON ((r."idUsuario" = u."idUsuario")));
 ,   DROP VIEW public.recordatorios_por_usuario;
       public       v       postgres    false    227    227    227    223    223    223    223    223    223    223    223            �            1259    17972    temas_por_apunte    VIEW     %  CREATE VIEW public.temas_por_apunte AS
 SELECT t."idTema",
    t."idApunte",
    a.titulo AS titulo_apunte,
    t."idTemaPadre",
    t.nombre
   FROM (public."Tema" t
     JOIN public."Apunte" a ON ((t."idApunte" = a."idApunte")))
  ORDER BY a.titulo, t."idTemaPadre" NULLS FIRST, t."idTema";
 #   DROP VIEW public.temas_por_apunte;
       public       v       postgres    false    225    217    225    225    217    225            �           2604    17658    Apunte idApunte    DEFAULT     x   ALTER TABLE ONLY public."Apunte" ALTER COLUMN "idApunte" SET DEFAULT nextval('public."Apunte_idApunte_seq"'::regclass);
 B   ALTER TABLE public."Apunte" ALTER COLUMN "idApunte" DROP DEFAULT;
       public               postgres    false    218    217            �           2604    17659    Contenido idContenido    DEFAULT     �   ALTER TABLE ONLY public."Contenido" ALTER COLUMN "idContenido" SET DEFAULT nextval('public."Contenido_idContenido_seq"'::regclass);
 H   ALTER TABLE public."Contenido" ALTER COLUMN "idContenido" DROP DEFAULT;
       public               postgres    false    220    219            �           2604    17660    Materia idMateria    DEFAULT     |   ALTER TABLE ONLY public."Materia" ALTER COLUMN "idMateria" SET DEFAULT nextval('public."Materia_idMateria_seq"'::regclass);
 D   ALTER TABLE public."Materia" ALTER COLUMN "idMateria" DROP DEFAULT;
       public               postgres    false    222    221            �           2604    17661    Recordatorio idRecordatorio    DEFAULT     �   ALTER TABLE ONLY public."Recordatorio" ALTER COLUMN "idRecordatorio" SET DEFAULT nextval('public."Recordatorio_idRecordatorio_seq"'::regclass);
 N   ALTER TABLE public."Recordatorio" ALTER COLUMN "idRecordatorio" DROP DEFAULT;
       public               postgres    false    224    223            �           2604    17662    Tema idTema    DEFAULT     p   ALTER TABLE ONLY public."Tema" ALTER COLUMN "idTema" SET DEFAULT nextval('public."Tema_idTema_seq"'::regclass);
 >   ALTER TABLE public."Tema" ALTER COLUMN "idTema" DROP DEFAULT;
       public               postgres    false    226    225            �           2604    17664    Usuario idUsuario    DEFAULT     |   ALTER TABLE ONLY public."Usuario" ALTER COLUMN "idUsuario" SET DEFAULT nextval('public."Usuario_idUsuario_seq"'::regclass);
 D   ALTER TABLE public."Usuario" ALTER COLUMN "idUsuario" DROP DEFAULT;
       public               postgres    false    230    227            �           2604    17665    UsuarioMateria idUsuMat    DEFAULT     �   ALTER TABLE ONLY public."UsuarioMateria" ALTER COLUMN "idUsuMat" SET DEFAULT nextval('public."UsuarioMateria_idUsuMat_seq"'::regclass);
 J   ALTER TABLE public."UsuarioMateria" ALTER COLUMN "idUsuMat" DROP DEFAULT;
       public               postgres    false    229    228            v          0    17597    Apunte 
   TABLE DATA           R   COPY public."Apunte" ("idApunte", "idUsuMat", fecha, titulo, resumen) FROM stdin;
    public               postgres    false    217   �f       x          0    17603 	   Contenido 
   TABLE DATA           E   COPY public."Contenido" ("idContenido", "idTema", texto) FROM stdin;
    public               postgres    false    219   h       z          0    17609    Materia 
   TABLE DATA           �   COPY public."Materia" ("idMateria", "nombreMateria", "cursoParalelo", "nombreDocente", horario, estado, "fechaRegistro", clave, "imagenUrl") FROM stdin;
    public               postgres    false    221   	j       |          0    17615    Recordatorio 
   TABLE DATA           �   COPY public."Recordatorio" ("idRecordatorio", "idUsuario", "fechaLimite", titulo, descripcion, estado, "fechaRegistro", hora) FROM stdin;
    public               postgres    false    223   Uk       ~          0    17621    Tema 
   TABLE DATA           M   COPY public."Tema" ("idTema", "idApunte", "idTemaPadre", nombre) FROM stdin;
    public               postgres    false    225   l       �          0    17633    Usuario 
   TABLE DATA           o   COPY public."Usuario" ("idUsuario", nombre, apellido, correo, contrasena, estado, "fechaRegistro") FROM stdin;
    public               postgres    false    227   dm       �          0    17638    UsuarioMateria 
   TABLE DATA           i   COPY public."UsuarioMateria" ("idUsuMat", "idUsuario", "idMateria", estado, "fechaRegistro") FROM stdin;
    public               postgres    false    228   Qn       �           0    0    Apunte_idApunte_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Apunte_idApunte_seq"', 13, true);
          public               postgres    false    218            �           0    0    Contenido_idContenido_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Contenido_idContenido_seq"', 19, true);
          public               postgres    false    220            �           0    0    Materia_idMateria_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Materia_idMateria_seq"', 5, true);
          public               postgres    false    222            �           0    0    Recordatorio_idRecordatorio_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."Recordatorio_idRecordatorio_seq"', 8, true);
          public               postgres    false    224            �           0    0    Tema_idTema_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Tema_idTema_seq"', 36, true);
          public               postgres    false    226            �           0    0    UsuarioMateria_idUsuMat_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."UsuarioMateria_idUsuMat_seq"', 11, true);
          public               postgres    false    229            �           0    0    Usuario_idUsuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Usuario_idUsuario_seq"', 9, true);
          public               postgres    false    230            �           2606    17667    Apunte Apunte_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Apunte"
    ADD CONSTRAINT "Apunte_pkey" PRIMARY KEY ("idApunte");
 @   ALTER TABLE ONLY public."Apunte" DROP CONSTRAINT "Apunte_pkey";
       public                 postgres    false    217            �           2606    17669    Contenido Contenido_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Contenido"
    ADD CONSTRAINT "Contenido_pkey" PRIMARY KEY ("idContenido");
 F   ALTER TABLE ONLY public."Contenido" DROP CONSTRAINT "Contenido_pkey";
       public                 postgres    false    219            �           2606    17671    Materia Materia_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Materia"
    ADD CONSTRAINT "Materia_pkey" PRIMARY KEY ("idMateria");
 B   ALTER TABLE ONLY public."Materia" DROP CONSTRAINT "Materia_pkey";
       public                 postgres    false    221            �           2606    17673    Recordatorio Recordatorio_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Recordatorio"
    ADD CONSTRAINT "Recordatorio_pkey" PRIMARY KEY ("idRecordatorio");
 L   ALTER TABLE ONLY public."Recordatorio" DROP CONSTRAINT "Recordatorio_pkey";
       public                 postgres    false    223            �           2606    17675    Tema Tema_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Tema"
    ADD CONSTRAINT "Tema_pkey" PRIMARY KEY ("idTema");
 <   ALTER TABLE ONLY public."Tema" DROP CONSTRAINT "Tema_pkey";
       public                 postgres    false    225            �           2606    17679 "   UsuarioMateria UsuarioMateria_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."UsuarioMateria"
    ADD CONSTRAINT "UsuarioMateria_pkey" PRIMARY KEY ("idUsuMat");
 P   ALTER TABLE ONLY public."UsuarioMateria" DROP CONSTRAINT "UsuarioMateria_pkey";
       public                 postgres    false    228            �           2606    17681    Usuario Usuario_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("idUsuario");
 B   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_pkey";
       public                 postgres    false    227            �           2606    17723    Usuario correo_unico 
   CONSTRAINT     S   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT correo_unico UNIQUE (correo);
 @   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT correo_unico;
       public                 postgres    false    227            �           2620    17993 /   Recordatorio trg_actualizar_estado_recordatorio    TRIGGER     �   CREATE TRIGGER trg_actualizar_estado_recordatorio BEFORE INSERT OR UPDATE ON public."Recordatorio" FOR EACH ROW EXECUTE FUNCTION public.actualizar_estado_recordatorio();
 J   DROP TRIGGER trg_actualizar_estado_recordatorio ON public."Recordatorio";
       public               postgres    false    237    223            �           2620    17997 $   Recordatorio trg_estado_recordatorio    TRIGGER     �   CREATE TRIGGER trg_estado_recordatorio BEFORE INSERT ON public."Recordatorio" FOR EACH ROW EXECUTE FUNCTION public.set_estado_activo();
 ?   DROP TRIGGER trg_estado_recordatorio ON public."Recordatorio";
       public               postgres    false    223    238            �           2620    17995    Usuario trg_estado_usuario    TRIGGER     ~   CREATE TRIGGER trg_estado_usuario BEFORE INSERT ON public."Usuario" FOR EACH ROW EXECUTE FUNCTION public.set_estado_activo();
 5   DROP TRIGGER trg_estado_usuario ON public."Usuario";
       public               postgres    false    227    238            �           2620    17996 (   UsuarioMateria trg_estado_usuariomateria    TRIGGER     �   CREATE TRIGGER trg_estado_usuariomateria BEFORE INSERT ON public."UsuarioMateria" FOR EACH ROW EXECUTE FUNCTION public.set_estado_activo();
 C   DROP TRIGGER trg_estado_usuariomateria ON public."UsuarioMateria";
       public               postgres    false    228    238            �           2620    17989 0   Recordatorio trg_set_fecha_registro_recordatorio    TRIGGER     �   CREATE TRIGGER trg_set_fecha_registro_recordatorio BEFORE INSERT ON public."Recordatorio" FOR EACH ROW EXECUTE FUNCTION public.set_fecha_registro();
 K   DROP TRIGGER trg_set_fecha_registro_recordatorio ON public."Recordatorio";
       public               postgres    false    223    236            �           2620    17986 &   Usuario trg_set_fecha_registro_usuario    TRIGGER     �   CREATE TRIGGER trg_set_fecha_registro_usuario BEFORE INSERT ON public."Usuario" FOR EACH ROW EXECUTE FUNCTION public.set_fecha_registro();
 A   DROP TRIGGER trg_set_fecha_registro_usuario ON public."Usuario";
       public               postgres    false    236    227            �           2620    17987 4   UsuarioMateria trg_set_fecha_registro_usuariomateria    TRIGGER     �   CREATE TRIGGER trg_set_fecha_registro_usuariomateria BEFORE INSERT ON public."UsuarioMateria" FOR EACH ROW EXECUTE FUNCTION public.set_fecha_registro();
 O   DROP TRIGGER trg_set_fecha_registro_usuariomateria ON public."UsuarioMateria";
       public               postgres    false    236    228            �           2606    17933    Tema Apunte_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tema"
    ADD CONSTRAINT "Apunte_fkey" FOREIGN KEY ("idApunte") REFERENCES public."Apunte"("idApunte") ON DELETE CASCADE;
 >   ALTER TABLE ONLY public."Tema" DROP CONSTRAINT "Apunte_fkey";
       public               postgres    false    4803    217    225            �           2606    17953    Tema TemaPadre_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tema"
    ADD CONSTRAINT "TemaPadre_fkey" FOREIGN KEY ("idTemaPadre") REFERENCES public."Tema"("idTema") ON DELETE CASCADE;
 A   ALTER TABLE ONLY public."Tema" DROP CONSTRAINT "TemaPadre_fkey";
       public               postgres    false    4811    225    225            �           2606    17928    Contenido Tema_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Contenido"
    ADD CONSTRAINT "Tema_fkey" FOREIGN KEY ("idTema") REFERENCES public."Tema"("idTema") ON DELETE CASCADE;
 A   ALTER TABLE ONLY public."Contenido" DROP CONSTRAINT "Tema_fkey";
       public               postgres    false    219    4811    225            �           2606    17948    Recordatorio Usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Recordatorio"
    ADD CONSTRAINT "Usuario_fkey" FOREIGN KEY ("idUsuario") REFERENCES public."Usuario"("idUsuario") ON DELETE CASCADE;
 G   ALTER TABLE ONLY public."Recordatorio" DROP CONSTRAINT "Usuario_fkey";
       public               postgres    false    227    4813    223            �           2606    17707    UsuarioMateria idMateria    FK CONSTRAINT     �   ALTER TABLE ONLY public."UsuarioMateria"
    ADD CONSTRAINT "idMateria" FOREIGN KEY ("idMateria") REFERENCES public."Materia"("idMateria") NOT VALID;
 F   ALTER TABLE ONLY public."UsuarioMateria" DROP CONSTRAINT "idMateria";
       public               postgres    false    4807    228    221            �           2606    17938    Apunte idUsuMat    FK CONSTRAINT     �   ALTER TABLE ONLY public."Apunte"
    ADD CONSTRAINT "idUsuMat" FOREIGN KEY ("idUsuMat") REFERENCES public."UsuarioMateria"("idUsuMat") ON DELETE CASCADE;
 =   ALTER TABLE ONLY public."Apunte" DROP CONSTRAINT "idUsuMat";
       public               postgres    false    217    228    4817            �           2606    17943    UsuarioMateria idUsuario    FK CONSTRAINT     �   ALTER TABLE ONLY public."UsuarioMateria"
    ADD CONSTRAINT "idUsuario" FOREIGN KEY ("idUsuario") REFERENCES public."Usuario"("idUsuario") ON DELETE CASCADE;
 F   ALTER TABLE ONLY public."UsuarioMateria" DROP CONSTRAINT "idUsuario";
       public               postgres    false    227    228    4813            v   u  x�mR�N�0<;_�G�ڨI�#U��Rō��l��c?������c�>��X��ݙ�Q�rR��'�qY��h*l��=����";�Ǖ�bd&fC䪍&�Jz���Vd�2ʑܨ��ְ�O�BP�Y1�G��LE1�0B�q��i��JI��F�)�N&�o��h�;V�g� t���}��d�X�� ^�@�2+��#(iG�	Zr�b�PJ�h���k�TGgA�ػ�a[q�����-�p�����q'i���6GJs6S��9k���Ԑ���d1�[��p�����j�NP3Իa��yYRE�z#�y ����\��ɾJqQ���b%�3��C;�%�+����1ϲ���S      x   �  x��S�n�0�ɯ�h�"R�#��قݲ�ȳ�@"U��п�'ݺ��z�lWIt� ����ݻ{ǚɊi�:k�0(����|��j�GqY2��E*.%�5�`jmO?]�WJ46E�8��ܪBn�,�K���D�z��@�8�A<<W3"U�rW����2S�T�1t6�0�h��6�!��+:�f�u���x�s}j�.._I�+�$��}��.�U敉Z ��X8x�?��Ey�VD�6���isqZ1��m'��S#U����}�"�Lo�ݧ�~��'��dQ�\�6�r��ƺ���^��,]�,�vS��X=־:Z��m�䗯;��[��#�a���>�� 2�@��f���H@�A� �!2�����/���:{���3\���%X�����Fԃ3#1%f5�<'σK�:G'�И��c@�	
��K'�<%���5۲��(ϭ.���E����#��xR��/�������S�      z   <  x���MN�0F��)���I(��
ъ��#ذ�&�t�kW��nĂG�ňUJQ��X�5����9d�tM��3���K��9X��p	N[vW�r���=6#��O ��f7��o�ӳX�>#?�����皍G�f���}q�C�4�b?��<��D���<�Ag��9|�UX�3���s�R���Ĩ���Dw}@��w �(�l!�A������^�+0�+����.I�]-���-}F��h����lV()��#&JK��-X�������q��Cq�*�pU���B�����&�=����s���uxT`�13�����A�P7��      |   �   x�u�K
�0����@%I[��)=��覛��"�II��<�3��n��o8&ʌU��q���[�nB��9ڏ���h���7�BV�9#bb�� �&O�s�cG��G#��6�h�԰��-�Ȣ.)!��lQZ�:o�~��'��g��^��ä���\ı����S�      ~   E  x�mRKn�0]{N��U�IkP%$@��dc9r��6=C���:vP�����u�1'��d��ZY�Js�q v�ݹWM��5H�9��U�}7��O�hl_;�B�U7�ҝ7��&:
]���2�ȡ�=0��G��d� �Db����t��UU^�JS}���6�$�hi�SS)�%�G��,�.��ei���v��.���]g��)��v7	l>�x@N6��T>��y]g��X-���q\N� �V>b|>�D2�S�c2�?Q�Oe�0���$��Cs`���4���k��=)"��?8Mף��� ��o�g      �   �   x�u��n�0D���������������^�&����@��9�����l��-S���eG�GFd�Ԧ�֓u�fU�g!��n�!��Z,�)���z�go&
5cKQ7�ҹ�ܒ'�0�Ê�5VU��~�w���
máǾ��9��I�ћa�����-��D�?�S�8���� uu�l��מ��O���y�S�W�:
c�s������Js!�7;���      �   M   x�m�1�0���KQ�J�������e�W�뽿윭g#��Sx�S�(ቐ��tߑr�%��s3�ey)�     