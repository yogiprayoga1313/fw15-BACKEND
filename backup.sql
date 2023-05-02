PGDMP                         {            postgres    15.2    15.2 S    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3468                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            �            1259    32812 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);
    DROP TABLE public.categories;
       public         heap    postgres    false    5            �            1259    32811    categories_id_seq    SEQUENCE     �   ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    220            �            1259    32918    citites    TABLE     �   CREATE TABLE public.citites (
    id integer NOT NULL,
    picture character varying(255),
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);
    DROP TABLE public.citites;
       public         heap    postgres    false    5            �            1259    32917    citites_id_seq    SEQUENCE     �   ALTER TABLE public.citites ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.citites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238    5            �            1259    32838    eventCategories    TABLE     �   CREATE TABLE public."eventCategories" (
    id integer NOT NULL,
    "eventId" character varying(255),
    "categoryId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);
 %   DROP TABLE public."eventCategories";
       public         heap    postgres    false    5            �            1259    32837    eventCategories_id_seq    SEQUENCE     �   ALTER TABLE public."eventCategories" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."eventCategories_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224    5            �            1259    32828    events    TABLE     V  CREATE TABLE public.events (
    id integer NOT NULL,
    picture character varying(255),
    title character varying(255),
    date date,
    "cityId" integer,
    descriptions text,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone,
    "categoriesId" integer,
    "createdBy" integer
);
    DROP TABLE public.events;
       public         heap    postgres    false    5            �            1259    32827    events_id_seq    SEQUENCE     �   ALTER TABLE public.events ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    222            �            1259    32956    forgotRequest    TABLE     �   CREATE TABLE public."forgotRequest" (
    id integer NOT NULL,
    email character varying(255),
    code character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);
 #   DROP TABLE public."forgotRequest";
       public         heap    postgres    false    5            �            1259    32955    forgotRequest_id_seq    SEQUENCE     �   ALTER TABLE public."forgotRequest" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."forgotRequest_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    244            �            1259    32845    partners    TABLE     �   CREATE TABLE public.partners (
    id integer NOT NULL,
    picture character varying(255),
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);
    DROP TABLE public.partners;
       public         heap    postgres    false    5            �            1259    32844    partners_id_seq    SEQUENCE     �   ALTER TABLE public.partners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    226            �            1259    32870    paymentMethod    TABLE     �   CREATE TABLE public."paymentMethod" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);
 #   DROP TABLE public."paymentMethod";
       public         heap    postgres    false    5            �            1259    32869    paymentMethod_id_seq    SEQUENCE     �   ALTER TABLE public."paymentMethod" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."paymentMethod_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232    5            �            1259    32803    profile    TABLE     �  CREATE TABLE public.profile (
    id integer NOT NULL,
    picture character varying(255),
    "fullName" character varying(255),
    "phoneNumber" character varying(255),
    gender boolean,
    profession character varying(255),
    nationality character varying(255),
    "birthDate" date,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone,
    "userId" integer
);
    DROP TABLE public.profile;
       public         heap    postgres    false    5            �            1259    32802    profile_id_seq    SEQUENCE     �   ALTER TABLE public.profile ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218    5            �            1259    32854    reservationSection    TABLE     �   CREATE TABLE public."reservationSection" (
    id integer NOT NULL,
    name character varying(255),
    price character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);
 (   DROP TABLE public."reservationSection";
       public         heap    postgres    false    5            �            1259    32853    reservationSection_id_seq    SEQUENCE     �   ALTER TABLE public."reservationSection" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."reservationSection_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    228            �            1259    32863    reservationStatus    TABLE     �   CREATE TABLE public."reservationStatus" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);
 '   DROP TABLE public."reservationStatus";
       public         heap    postgres    false    5            �            1259    32862    reservationStatus_id_seq    SEQUENCE     �   ALTER TABLE public."reservationStatus" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."reservationStatus_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    230            �            1259    32884    reservationTickets    TABLE     �   CREATE TABLE public."reservationTickets" (
    id integer NOT NULL,
    "reservationId" integer,
    "sectionId" integer,
    quantity integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);
 (   DROP TABLE public."reservationTickets";
       public         heap    postgres    false    5            �            1259    32883    reservationTickets_id_seq    SEQUENCE     �   ALTER TABLE public."reservationTickets" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."reservationTickets_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    236            �            1259    32877    reservations    TABLE       CREATE TABLE public.reservations (
    id integer NOT NULL,
    "eventId" integer,
    "userId" integer,
    "statusId" integer,
    "paymentMethod" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);
     DROP TABLE public.reservations;
       public         heap    postgres    false    5            �            1259    32949    reservationsTickets    TABLE     �   CREATE TABLE public."reservationsTickets" (
    id integer NOT NULL,
    "reservationId" integer,
    "sectionId" integer,
    quantity integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);
 )   DROP TABLE public."reservationsTickets";
       public         heap    postgres    false    5            �            1259    32948    reservationsTickets_id_seq    SEQUENCE     �   ALTER TABLE public."reservationsTickets" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."reservationsTickets_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    242            �            1259    32876    reservations_id_seq    SEQUENCE     �   ALTER TABLE public.reservations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234    5            �            1259    32938    users    TABLE     
  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    password character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false    5            �            1259    32937    users_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    240    5            �            1259    32784    wishlist    TABLE     �   CREATE TABLE public.wishlist (
    id integer NOT NULL,
    "eventId" integer,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);
    DROP TABLE public.wishlist;
       public         heap    postgres    false    5            �            1259    32783    wishlist_id_seq    SEQUENCE     �   ALTER TABLE public.wishlist ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216    5            n          0    32812 
   categories 
   TABLE DATA           G   COPY public.categories (id, name, "createdAt", "updateAt") FROM stdin;
    public          postgres    false    220   �c       �          0    32918    citites 
   TABLE DATA           M   COPY public.citites (id, picture, name, "createdAt", "updateAt") FROM stdin;
    public          postgres    false    238   �c       r          0    32838    eventCategories 
   TABLE DATA           a   COPY public."eventCategories" (id, "eventId", "categoryId", "createdAt", "updateAt") FROM stdin;
    public          postgres    false    224   vd       p          0    32828    events 
   TABLE DATA           �   COPY public.events (id, picture, title, date, "cityId", descriptions, "createdAt", "updateAt", "categoriesId", "createdBy") FROM stdin;
    public          postgres    false    222   �d       �          0    32956    forgotRequest 
   TABLE DATA           S   COPY public."forgotRequest" (id, email, code, "createdAt", "updateAt") FROM stdin;
    public          postgres    false    244   �e       t          0    32845    partners 
   TABLE DATA           N   COPY public.partners (id, picture, name, "createdAt", "updateAt") FROM stdin;
    public          postgres    false    226   �f       z          0    32870    paymentMethod 
   TABLE DATA           L   COPY public."paymentMethod" (id, name, "createdAt", "updateAt") FROM stdin;
    public          postgres    false    232   Ng       l          0    32803    profile 
   TABLE DATA           �   COPY public.profile (id, picture, "fullName", "phoneNumber", gender, profession, nationality, "birthDate", "createdAt", "updateAt", "userId") FROM stdin;
    public          postgres    false    218   �g       v          0    32854    reservationSection 
   TABLE DATA           X   COPY public."reservationSection" (id, name, price, "createdAt", "updateAt") FROM stdin;
    public          postgres    false    228   �h       x          0    32863    reservationStatus 
   TABLE DATA           P   COPY public."reservationStatus" (id, name, "createdAt", "updateAt") FROM stdin;
    public          postgres    false    230   �i       ~          0    32884    reservationTickets 
   TABLE DATA           s   COPY public."reservationTickets" (id, "reservationId", "sectionId", quantity, "createdAt", "updateAt") FROM stdin;
    public          postgres    false    236   j       |          0    32877    reservations 
   TABLE DATA           u   COPY public.reservations (id, "eventId", "userId", "statusId", "paymentMethod", "createdAt", "updateAt") FROM stdin;
    public          postgres    false    234   9j       �          0    32949    reservationsTickets 
   TABLE DATA           t   COPY public."reservationsTickets" (id, "reservationId", "sectionId", quantity, "createdAt", "updateAt") FROM stdin;
    public          postgres    false    242   �j       �          0    32938    users 
   TABLE DATA           W   COPY public.users (id, username, email, password, "createdAt", "updateAt") FROM stdin;
    public          postgres    false    240   (k       j          0    32784    wishlist 
   TABLE DATA           T   COPY public.wishlist (id, "eventId", "userId", "createdAt", "updateAt") FROM stdin;
    public          postgres    false    216   fm       �           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 4, true);
          public          postgres    false    219            �           0    0    citites_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.citites_id_seq', 20, true);
          public          postgres    false    237            �           0    0    eventCategories_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."eventCategories_id_seq"', 4, true);
          public          postgres    false    223            �           0    0    events_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.events_id_seq', 8, true);
          public          postgres    false    221            �           0    0    forgotRequest_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."forgotRequest_id_seq"', 12, true);
          public          postgres    false    243            �           0    0    partners_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.partners_id_seq', 2, true);
          public          postgres    false    225            �           0    0    paymentMethod_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."paymentMethod_id_seq"', 5, true);
          public          postgres    false    231            �           0    0    profile_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.profile_id_seq', 21, true);
          public          postgres    false    217            �           0    0    reservationSection_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."reservationSection_id_seq"', 6, true);
          public          postgres    false    227            �           0    0    reservationStatus_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."reservationStatus_id_seq"', 8, true);
          public          postgres    false    229            �           0    0    reservationTickets_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."reservationTickets_id_seq"', 1, false);
          public          postgres    false    235            �           0    0    reservationsTickets_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."reservationsTickets_id_seq"', 4, true);
          public          postgres    false    241            �           0    0    reservations_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.reservations_id_seq', 8, true);
          public          postgres    false    233            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 19, true);
          public          postgres    false    239            �           0    0    wishlist_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.wishlist_id_seq', 12, true);
          public          postgres    false    215            �           2606    32817    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    220            �           2606    32925    citites citites_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.citites
    ADD CONSTRAINT citites_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.citites DROP CONSTRAINT citites_pkey;
       public            postgres    false    238            �           2606    32843 $   eventCategories eventCategories_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."eventCategories"
    ADD CONSTRAINT "eventCategories_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."eventCategories" DROP CONSTRAINT "eventCategories_pkey";
       public            postgres    false    224            �           2606    32835    events events_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public            postgres    false    222            �           2606    32963     forgotRequest forgotRequest_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."forgotRequest"
    ADD CONSTRAINT "forgotRequest_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."forgotRequest" DROP CONSTRAINT "forgotRequest_pkey";
       public            postgres    false    244            �           2606    32852    partners partners_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.partners DROP CONSTRAINT partners_pkey;
       public            postgres    false    226            �           2606    32875     paymentMethod paymentMethod_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."paymentMethod"
    ADD CONSTRAINT "paymentMethod_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."paymentMethod" DROP CONSTRAINT "paymentMethod_pkey";
       public            postgres    false    232            �           2606    32810    profile profile_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_pkey;
       public            postgres    false    218            �           2606    32861 *   reservationSection reservationSection_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."reservationSection"
    ADD CONSTRAINT "reservationSection_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public."reservationSection" DROP CONSTRAINT "reservationSection_pkey";
       public            postgres    false    228            �           2606    32868 (   reservationStatus reservationStatus_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."reservationStatus"
    ADD CONSTRAINT "reservationStatus_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."reservationStatus" DROP CONSTRAINT "reservationStatus_pkey";
       public            postgres    false    230            �           2606    32889 *   reservationTickets reservationTickets_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."reservationTickets"
    ADD CONSTRAINT "reservationTickets_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public."reservationTickets" DROP CONSTRAINT "reservationTickets_pkey";
       public            postgres    false    236            �           2606    32954 ,   reservationsTickets reservationsTickets_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."reservationsTickets"
    ADD CONSTRAINT "reservationsTickets_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."reservationsTickets" DROP CONSTRAINT "reservationsTickets_pkey";
       public            postgres    false    242            �           2606    32882    reservations reservations_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_pkey;
       public            postgres    false    234            �           2606    32947    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    240            �           2606    32945    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    240            �           2606    32789    wishlist wishlist_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_pkey;
       public            postgres    false    216            n   P   x�3�t���U�4202�50�5�T04�22�20�314774���2�tL.���C(3V02�2��25�33551�)����� ��      �   {   x�]˻1 �:��.�/��!��� P�H4�H��	�P����������H�ȆrB	�`,����sƶ�Y#e_�ҏ��oR`1l�*}���:c��ܢZ��
���s~�t'�      r   :   x�3��L)�QH�,)��4202ƺ&��f
�VF�V�Fz��f&��1~\1z\\\ ]y�      p   .  x����n�0�sx
^��v�|���.}�^2�1�Vu��/@�NܚD(��o+��%��X������η<L�" � 6@
IMy��a���!��Z�p�xP\->[!� ���6�i���W���Mm���Ե}j���\��\2�&�bd0s ��2�/����y�E(G�S]��S�mqc"mQ���'AXD�����z�k��⛹���Y�s$��%Dm��V}e�(���J�GF-�ь�ST��Z(� /���VR�����j�qv���n�Q���>��em]�l�C,�uUU���z      �   �   x�e�1n1�����.�EUyA^��8�'e��\لꑖKa���������]���fU:dSQ^�.�o��� 
D��]?vM�w7>�6�Z1��.���獯LuPJ���YbT�$�a�DX�/Vs� 3�N�.�rH�kb>�J�N�b��4F�D�j2�x=+���xe�5[���"��JMl��T�J潩JNI�"��N���L[r}��y{�D�(hDz�0��9�<vp-���z���      t   H   x�3�44�04�043�0����*HM�L��K�KN�4202�50�54Q02�24�2��3�4166������� �E(      z   p   x�m�1�0F��9E.P�����k'$`�),���?���	��'-Y-�Ƃ&>�zJN�v�g^�6���;�T�m�ok�CXw��ħ�t���s�Y�*���SJ/&b#�      l     x�}��n1���)�.�'v2�����X"�@W�:�o�KJ�Rك3���ǆ� 08b����|P�4��n��G�ګ���ӹ�/j�Y)�QZ-8�]k�n�%GK ���v��j�2��^��빟|"N�C�ŻxRS
�䝯)ߧ�м��>��¡����O�a�?�J%Q�b�E�	��XHH,"����_y��}/�H�~������=:x X�-øx�v���bBJ���C.�d��p��S~��r
ɢ�6Z�U��h���kt�      v   �   x�u���0E���
7kf�wT��d	l�"�'��}:�j��[���`d=��J�D�((�Z{�E��5�Zfe�'��u��*�4�r��6�#͐���}��0$r�jx�	Z_��Uޥ-��ˑ�q��|TB�/��7�      x   �   x��ʱ�0�ڞ���˲${�L@���p��\�
~�C؏�\�+p�<'�Q&p�� ���W�a�\ӟ[bC��+��w�<ߜH�_\&56G�6����~=���n����
)���P���G�      ~      x������ � �      |   �   x����	�0��g{�,��u"d�9
��P0=|�y���AD�,��eG��6�2,qHU�qS���X "#�+����l�	�=��������M96�2.KP]B�t=P/2p��7��%�S���R��&x���9�z�>O      �   C   x�3���4B##c]]C3K+S+SC=3#s3sS�
.�U�V&zf�F� U1z\\\ cB�      �   .  x���I��P���Z���=�Ĥ��R��cPe}&�U�3�99�/'����K��٣��%E�;%q�xy:�H��}�q2���G�k5B����9����؃�&��X�!�z���H��t��D��s�r�:�ia�T35�N���| D� �ŉ/R�:@ c~�i�>��qeP��eВu�5fPKl��Jc�e�S,� ��7�L��|�+����m�=�;� ԍs���W��`��"F���9Ȃ�x��*q�[�~���nK[�b}�s��:�9o��-]�"�oţ��i)L�fV.��Ft}5����PaH�s��=Tb��Ty�tO���y�.O�u{yg���j<�l�Vw�V�lai��m�{|(�s�I����xN�h���r
�� �ćK�^�{��v�J4_�!�X��WQH��rw�����F����N#ڴn�,��$A�5wm��ǂ�'++X` ���%��.�")yU�2���sБ���S�����(��}\���w�z=I�E���"H�0��{,(�cd	
��d���C�~      j   �   x�m��1г]�6L� ��ۇ$ZE��� M�/�`{�_��Q:�u�׳{�u>d\��Z:(T�|[U���R(F9H4��X_��(�jY�B1�m��h�HaB`�l���;Z����O����eFi�������R�ʻ�$Xx����&��Zqk@7bω�������E�     