--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO annndrey;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: annndrey
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO annndrey;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: annndrey
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: annndrey
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO annndrey;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: annndrey
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO annndrey;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: annndrey
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: annndrey
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_message; Type: TABLE; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE TABLE auth_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.auth_message OWNER TO annndrey;

--
-- Name: auth_message_id_seq; Type: SEQUENCE; Schema: public; Owner: annndrey
--

CREATE SEQUENCE auth_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_message_id_seq OWNER TO annndrey;

--
-- Name: auth_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: annndrey
--

ALTER SEQUENCE auth_message_id_seq OWNED BY auth_message.id;


--
-- Name: auth_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: annndrey
--

SELECT pg_catalog.setval('auth_message_id_seq', 1, false);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO annndrey;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: annndrey
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO annndrey;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: annndrey
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: annndrey
--

SELECT pg_catalog.setval('auth_permission_id_seq', 27, true);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO annndrey;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO annndrey;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: annndrey
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO annndrey;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: annndrey
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: annndrey
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: annndrey
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO annndrey;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: annndrey
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: annndrey
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO annndrey;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: annndrey
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO annndrey;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: annndrey
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: annndrey
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO annndrey;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: annndrey
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO annndrey;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: annndrey
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: annndrey
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO annndrey;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: annndrey
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO annndrey;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: annndrey
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: annndrey
--

SELECT pg_catalog.setval('django_content_type_id_seq', 9, true);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO annndrey;

--
-- Name: orders_stuff; Type: TABLE; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE TABLE orders_stuff (
    id integer NOT NULL,
    name_rus character varying(300) NOT NULL,
    name_exact character varying(200) NOT NULL,
    manuf character varying(100) NOT NULL,
    man_site character varying(200),
    cat_num character varying(200),
    package character varying(100),
    stgroup character varying(1) NOT NULL
);


ALTER TABLE public.orders_stuff OWNER TO annndrey;

--
-- Name: orders_stuff_id_seq; Type: SEQUENCE; Schema: public; Owner: annndrey
--

CREATE SEQUENCE orders_stuff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.orders_stuff_id_seq OWNER TO annndrey;

--
-- Name: orders_stuff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: annndrey
--

ALTER SEQUENCE orders_stuff_id_seq OWNED BY orders_stuff.id;


--
-- Name: orders_stuff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: annndrey
--

SELECT pg_catalog.setval('orders_stuff_id_seq', 2048, true);


--
-- Name: orders_wish; Type: TABLE; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE TABLE orders_wish (
    id integer NOT NULL,
    stuff_id integer NOT NULL,
    pieces integer NOT NULL,
    price_man numeric(1000,2),
    price_rus numeric(1000,2),
    order_date timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    urgent boolean NOT NULL,
    status character varying(1) NOT NULL,
    comment text NOT NULL
);


ALTER TABLE public.orders_wish OWNER TO annndrey;

--
-- Name: orders_wish_id_seq; Type: SEQUENCE; Schema: public; Owner: annndrey
--

CREATE SEQUENCE orders_wish_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.orders_wish_id_seq OWNER TO annndrey;

--
-- Name: orders_wish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: annndrey
--

ALTER SEQUENCE orders_wish_id_seq OWNED BY orders_wish.id;


--
-- Name: orders_wish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: annndrey
--

SELECT pg_catalog.setval('orders_wish_id_seq', 1, false);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: annndrey
--

ALTER TABLE auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: annndrey
--

ALTER TABLE auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: annndrey
--

ALTER TABLE auth_message ALTER COLUMN id SET DEFAULT nextval('auth_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: annndrey
--

ALTER TABLE auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: annndrey
--

ALTER TABLE auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: annndrey
--

ALTER TABLE auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: annndrey
--

ALTER TABLE auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: annndrey
--

ALTER TABLE django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: annndrey
--

ALTER TABLE django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: annndrey
--

ALTER TABLE orders_stuff ALTER COLUMN id SET DEFAULT nextval('orders_stuff_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: annndrey
--

ALTER TABLE orders_wish ALTER COLUMN id SET DEFAULT nextval('orders_wish_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: annndrey
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: annndrey
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_message; Type: TABLE DATA; Schema: public; Owner: annndrey
--

COPY auth_message (id, user_id, message) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: annndrey
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add message	4	add_message
11	Can change message	4	change_message
12	Can delete message	4	delete_message
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add оборудование	7	add_stuff
20	Can change оборудование	7	change_stuff
21	Can delete оборудование	7	delete_stuff
22	Can add пожелание	8	add_wish
23	Can change пожелание	8	change_wish
24	Can delete пожелание	8	delete_wish
25	Can add log entry	9	add_logentry
26	Can change log entry	9	change_logentry
27	Can delete log entry	9	delete_logentry
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: annndrey
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
1	annndrey			gontchar@gmail.com	sha1$3d356$f334b5efdbd12ee80f3ea083f8c83f17e7bcd772	t	t	t	2011-10-04 22:03:04.225892+04	2011-10-03 14:49:49.923384+04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: annndrey
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: annndrey
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: annndrey
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: annndrey
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	message	auth	message
5	content type	contenttypes	contenttype
6	session	sessions	session
7	оборудование	orders	stuff
8	пожелание	orders	wish
9	log entry	admin	logentry
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: annndrey
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
7fbe9b144a8ec8698347f51c2a3f41e3	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjM5NjA4NTJjOGM3NjY1YThkNWFm\nNzQzYWE1ZmMxOGZl\n	2011-10-17 17:17:09.498686+04
2afceeeed354cc6d92c646ebdfcbb580	gAJ9cQEoVQ1fYXV0aF91c2VyX2lkcQJLAVUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVKWRqYW5nby5j\nb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQR1LjE1ZDc3NmYxNWI5YjRhODM2ZmNl\nYmRjMTA4NDVhOTFl\n	2011-10-18 16:40:20.590417+04
065e2a157a8a4ef2a16e2cc1f0ed8755	gAJ9cQEoVQ1fYXV0aF91c2VyX2lkcQJLAVUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVKWRqYW5nby5j\nb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQR1LjE1ZDc3NmYxNWI5YjRhODM2ZmNl\nYmRjMTA4NDVhOTFl\n	2011-10-18 16:46:34.134354+04
0acf9cbf9e5d5b974546632ce6d7f711	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjM5NjA4NTJjOGM3NjY1YThkNWFm\nNzQzYWE1ZmMxOGZl\n	2011-10-18 19:31:26.527051+04
75f88685a6d78de124671b703632fcf4	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjM5NjA4NTJjOGM3NjY1YThkNWFm\nNzQzYWE1ZmMxOGZl\n	2011-10-18 22:03:04.306278+04
\.


--
-- Data for Name: orders_stuff; Type: TABLE DATA; Schema: public; Owner: annndrey
--

COPY orders_stuff (id, name_rus, name_exact, manuf, man_site, cat_num, package, stgroup) FROM stdin;
1399	среда культуральная CD OptiCHO	CD OptiCHO™ Medium (1X), liquid	Gibco	\N	12681-011	1000 ml	C
1400	добавка к культуральной среде CD OptiCHO	CD OptiCHO™ AGT™	Gibco	\N	A11222-01	100 L	C
1401	добавка к культуральной среде Pluronic	Pluronic® F-68, 10% (100X)	Gibco	\N	24040-032	100 ml	C
1402	полимер для градиентного разделения клеток	Percoll	GE Healthcare	\N	17-0891-01 	1 Л	C
1403	полимер для градиентного разделения клеток	Ficoll-Paque PREMIUM	GE Healthcare	\N	17-5442-02	 6*100мл	C
1404	среда для гибридом	Clone Matrix  6x40 ml	Genetix	\N	K8500	6*40 мл	C
1405	среда культуральная DMEM	DMEM/High Modified, 500ml	HyClone	\N	SH30285.01	0,5 л	C
1406	среда культуральная DMEM/F12 1:1	DME/F12 1:1	HyClone	\N	SH30023.01	0,5 л	C
1407	среда культуральная RPMI1640	RPMI-1640 w/o Glutamine; With Phenol Red	HyClone	\N	SH30096.01	0,5 л	C
1408	телячья эмбриональная сыворотка 	Fetal bovine serum (FBS)	HyClone	\N	SV30160.03	0,5 л	C
1409	L-глутамин	L-Glutamine; 200mM in 0.85% NaCl; 	HyClone	\N	SH30034.01	0,1 л	C
1410	Пеницилин-стрептомицин	Penicillin-Streptomycin Solution, 100X; 	HyClone	\N	SV30010	0,1 л	C
1411	Трипсин 0,05%	Trypsin 0.05%; 	HyClone	\N	SH30236.02	0,5 л	C
1412	Трипсин 0,25%+ЭДТА (1:1)	Trypsin 0.25%+EDTA; 	HyClone	\N	SH30042.02	0,5 л	C
1413	Трипановый синий (витальный краситель) 	Trypan Blue Solution, 0.4% in Phosphate Buffered Saline	HyClone	\N	SV30084.01	0,1 л	C
1414	Трипановый синий, 0,4% раствор, стерильный, тестированный на культуре клеток		Sigma	\N	T8154	20 ml	C
1415	среда культуральная DMEM/F12 1:1 (сухая)	DME/F12 1:1 (powder)   	HyClone	\N	SH30004.04	50L	C
1416	среда культуральная RPMI1640 (сухая)	RPMI Medium 1640 (powder) 	HyClone	\N	SH30012.04 	50L	C
1417	Натрия бикарбонат (сухой)	Sodium Bicarbonate (powder)	HyClone	\N	SH30173.02	0,105g	C
1418	Фосфатно-солевой буфер для культуральных работ	Dulbecco’s Phosphate Buffered Saline Modified, without calcium chloride and magnesium chloride, powder, suitable for cell culture, 10*1L	Sigma	\N	D5652	10X1L	C
1419	Фосфатно-солевой буфер для культуральных работ	HyClone Dulbeccos PBS (Powder)	HyClone	\N	SH30013.03	10л	C
1420	солевой раствор Хэнкса	Hank's Balanced Salt Solution without Calcium, without Magnesium, with Phenol Red (powder)	HyClone	\N	SH30016.02 	2*5л	C
1421	Добавки для культуральной среды	HyClone Cell Boost Kit	HyClone	\N	SH30890	1.0	C
1422	Незаменимые аминокислоты	Non-Essential Amino Acids (NEAA Solution), 100X	HyClone	\N	SH30238.01		C
1423	Натрия пируват	Sodium Pyruvate, 100mM Solution	HyClone	\N	SH30239.01		C
1424	Амфотерицин	Amphotericin B (Fungizone) Solution, 250µg/mL	HyClone	\N	SV30078.01	50mL	C
1425	Гентамицин	Gentamicin Solution, 50mg/mL	HyClone	\N	SV30080.01	10 x 10mL	C
1426	Витамины	MEM Vitamin Solution, 100x	HyClone	\N	SH30599.01	100mL	C
1427	2-меркаптоэтанол	2-MERCAPTOETHANOL, BIOTECHNOLOGY GRADE	Amresco	\N	482.0	0,25 л	C
1428	Селективный антибиотик G418	G 418 Sulfate, Cell Culture Tested	Calbiochem	\N	345810-25GM	25g	C
1429	среда культуральная Panserin 401	Panserin 401	Pan-Biotech	\N	P04-710401	0,5 л	C
1430	среда культуральная Panserin РХ40	Panserin РХ40	Pan-Biotech	\N	P04-710PX40	0,5 л	C
1431	Определение клеточной пролиферации	CellTiter 96® AQueous One Solution Cell Proliferation Assay	Promega	\N	G3581	0.10000000000000001	C
1432	Не радиоактивный цитотоксический тест (кит)	CytoTox 96® Non-Radioactive Cytotoxicity Assay	Promega	\N	G1780	кит	C
1433	Анализ клеточной выживаемости	CellTiter-Glo® Luminescent Cell Viability Assay	Promega	\N	G7571	10 × 10ml	C
1434	ЛАЛ-реактив чувствит 0,06	PYROGENT 250 Tests 0.06 EU/ml Sensitivity	Lonza	\N	194-06	250 tests	C
1435	Контрольный стандарт эндотоксина	Endotoxin, E.coli O55:B5	Lonza	\N	186.0	5амп х 10нг/амп	C
1436	Определение содержания эндотоксина, хромогенный анализ, набор QCL-1000 300 Test Kit	Endpoint Chromogenic LAL Assay QCL-1000 300 Test Kit	Lonza	\N	50-648U	300 Test Kit	C
1437	Система детекции ЭнВижн™ /ПХ, двойное связывание Кроличьи/Мышиные	EnVision + Dual Link, Single Reagents HRP. Rabbit/Mouse 	Dako	\N	K4061	1100 tests	C
1438	Парафиновый карандаш для ИГХ	Dako Pen	Dako	\N	S2002		C
1439	Жидкий DAB-хромоген	Liquid DAB+ 	Dako	\N	K3468	1100 tests	C
1440	Реактив для трансфекции клеток УНИФЕКТИН-56	Реагент для трансфекции МФ-56,	RBL	\N	R48-452	 0.5 мл	C
1441	Гемацитометр (камера Фукса-Розенталя)		ООО «ГЕМ»	\N	1080302.0	1.0	C
1442	Стекла покровные для счетных камер, 20х26 мм		ООО «ГЕМ»	\N	1052013.0	транспортная коробка 10х10	C
1443	аспирационные пипетки 2 мл	Aspirating Pipette, 2 ml, Paper / Plastic Wrapped	Greiner bio-one	\N	710183.0		P
1444	Серологическая пипетка 2мл 	Disposable Serological Pipets, Polystyrene, Sterile, 2 ml	Greiner bio-one	\N	710180.0	1000.0	P
1445	Серологическая пипетка 5мл 	Disposable Serological Pipets, Polystyrene, Sterile, 5 ml	Greiner bio-one	\N	606180.0	200.0	P
1446	Серологическая пипетка 10мл 	Disposable Serological Pipets, Polystyrene, Sterile, 10 ml	Greiner bio-one	\N	607180.0	200.0	P
1447	Серологическая пипетка 25мл 	Disposable Serological Pipets, Polystyrene, Sterile, 25 ml	Greiner bio-one	\N	760180.0	200.0	P
1448	Серологическая пипетка 50мл 	Disposable Serological Pipets, Polystyrene, Sterile, 50 ml	Greiner bio-one	\N	768180.0	100.0	P
1449	Пробирки с белыми крышками 30 мл	MULTIPURPOSE CONTAINER, 30 ML, PS, 	Greiner bio-one	\N	201170.0	400.0	P
1539	Стекляная колба на 2 L	Pyrex™ long neck culture flask, capacity 2000 mL	Sigma	\N	CLS44422L-1EA	1.0	G
1450	пробирки для центрифугирования 15 мл	Centrifuge Tube, 17x120 mm, Sterile, PPN, Blue Screw Cap, White Writing Area 15 ml	Greiner bio-one	\N	188271.0	1000.0	P
1451	пробирки для центрифугирования 50 мл	Centrifuge Tube, 30x115 mm, Sterile, PP, Blue Screw Cap, White Writing Area Conical B                                             50 ml	Greiner bio-one	\N	227270.0	300.0	P
1452	Пленка для закрывания планшетов 	EASYseal for ELISA applications 	Greiner bio-one	\N	676001.0	100шт/уп	P
1453	чашки петри для гибридом	PetriWell-1plate 40/case	Genetix	\N	W1055	40.0	P
1454	Чашка Петри культуральная, 35х10мм	35mm TC-Treated Culture Dish	Corning 	\N	430165.0	500.0	P
1455	Чашка Петри культуральная, 60х15мм	60mm TC-Treated Culture Dish	Corning 	\N	430166.0	500.0	P
1456	Чашки Петри культуральная 100 мм	100mm TC-Treated Culture Dish	Corning 	\N	430167.0	500.0	P
1457	Чашки Петри культуральная 150 мм	150mm TC-Treated Culture Dish	Corning 	\N	430599.0	60.0	P
1458	флакон культуральный 25 см	cell culture flasks surface area 25 cm2, 	Corning 	\N	430372.0	500.0	P
1459	флакон культуральный 75 см	cell culture flasks surface area 75 cm2, 	Corning 	\N	430370.0	100.0	P
1460	планшет культуральный 6-луночный, плоскодонный	6 Well Clear TC-Treated Multiple Well Plates, Bulk Packed, Sterile	Corning 	\N	3506.0	100.0	P
1461	планшет культуральный 6-луночный, плоскодонный, инд. уп.	6 Well Clear TC-Treated Multiple Well Plates, Individually Wrapped	Corning 	\N	3516.0	50.0	P
1462	планшет культуральный 24-луночный, плоскодонный, инд. уп.	24 Well Clear TC-Treated Multiple Well Plates, Individually Wrapped, Sterile	Corning 	\N	3524.0	100.0	P
1463	планшет культуральный 48-луночный, плоскодонный, инд. уп.	48 Well Clear TC-Treated Multiple Well Plates, Individually Wrapped, Sterile	Corning 	\N	3548.0	100.0	P
1464	планшет культуральный 96-луночный, плоскодонный, инд. уп.	96 Well Clear Flat Bottom Polystyrene TC-Treated Microplates, Individually Wrapped, with Lid, Sterile	Corning 	\N	3599.0	100.0	P
1465	планшет культуральный 96-луночный, круглодонный, инд. уп.	96 well, round bottom, tissue-culture treated	Corning 	\N	3799.0	50.0	P
1466	виалы для замораживания клеток	cryogenic vials, external thread capacity 2.0 mL	Corning 	\N	430659.0	500.0	P
1467	фильтр-насадка на бутылку	bottle-top vacuum filters polyethersulfone membrane, pore size 0.22 μm, membrane diam. 70 mm, funnel capacity 500 mL	Corning 	\N	431117.0	12.0	P
1468	фильтр-система с бутылкой	bottle-top vacuum filter system polyethersulfone membrane, pore size 0.22 μm, membrane area 33.2 cm2, filter capacity 500 mL	Corning 	\N	431097.0	12.0	P
1469	фильтр-насадка на шприц 0,22	syringe filters, sterile polyethersulfone membrane, pore size 0.2 μm	Corning 	\N	431229.0	50.0	P
1470	фильтр-насадка на шприц 0,22	syringe filters, sterile cellulose acetate membrane (surfactant-free), membrane diam. 26 mm, pore size 0.2 μm	Corning 	\N	431219.0	50.0	P
1471	фильтр-насадка на шприц 0,45	syringe filters, sterile cellulose acetate membrane (surfactant-free), membrane diam. 26 mm, pore size 0.45 μm	Corning 	\N	431220.0	50.0	P
1472	пробирки для микроцентрифуги прозрачные 1,7мл	Snap Cap Microcentrifuge Tube, Polypropylene, Nonsterile, 5000/Case 1,7 ml	Corning 	\N	3621.0	5000.0	P
1473	пробирки для микроцентрифуги ассорти 1,7	Snap Cap Microcentrifuge Tube, Poly-propylene, Rainbow Colors,  Nonsterile 500/Case                                               1,7 ml	Corning 	\N	3622.0	500.0	P
1474	пробирки для микроцентрифуги прозрачные 2мл	 microcentrifuge tubes, snap-cap, volume 2.0 mL, natural	Corning 	\N	3213.0	1000.0	P
1475	пробирки для микроцентрифуги 0,65	microcentrifuge tubes, pre-lubricated volume 0.65 mL	Corning 	\N	3206.0	500.0	P
1476	клеточный скребок	Small Cell Scraper with Pink Handle	Corning 	\N	3009.0	100.0	P
1477	Чашка Петри культуральная, 60х15мм, необр	non-treated culture dishes D × H 60 mm × 15 mm	Corning 	\N	430589.0	500.0	P
1478	Чашка Петри культуральная, 100х20мм, необр	non-treated culture dishes D × H 100 mm × 20 mm	Corning 	\N	430591.0	500.0	P
1479	сосуд Эрленмейера 125 мл	125mL Polycarbonate Erlenmeyer Flask with Vent Cap	Corning 	\N	431143.0	50.0	P
1480	сосуд Эрленмейера 500 мл	500mL Polycarbonate Erlenmeyer Flask with Vent Cap	Corning 	\N	431145.0	25.0	P
1481	96-луночный планшет для ИФА	96 Well Flat Btm Maxisorp Immuno Plate	NUNC	\N	442404.0	60.0	P
1482	4-луночный планшет стерильный	4 well dish with cut-off corner & TC surface for easy cell attachment	NUNC	\N	176740.0	120.0	P
1483	флакон для суспензионных культур	Tissue culture flasks with green quick-release\nscrew cap - with or without Plug Seal Cap	sarsted	\N	83.1810.500	100.0	P
1484	носики с фильтрами 10	sterile-filtered tips 10mkl 	ULplast	\N	HT-F96S-010	1.0	P
1485	носики с фильтрами 20	sterile-filtered tips 20mkl 	ULplast	\N	HT-F96S-020	1.0	P
1486	носики с фильтрами 200	 sterile-filtered tips 200mkl 	ULplast	\N	HT-F96S-200	1.0	P
1487	носики с фильтрами 1000	 sterile-filtered tips 1000mkl 	ULplast	\N	HT-F96S-1000	1.0	P
1488	наконечники без фильтров  200   	Omnitip FastRack™ Reload volume 200mkl	ULplast\\Omnitip	\N	HT-200-960 или Omnitip 83710	 рэк (960)	P
1489	наконечники без фильтров 1000  	Omnitip FastRack™ Reload volume 1000mkl	ULplast\\Omnitip	\N	HT-1000-576 или Omnitip 85710	рэк (576)	P
1490	наконечники без фильтров 5000	5mL Macro Tip, Eppendorf-type, Bagged Natural Polypropylene	SSI	\N	SSI-4420-00 	250.0	P
1491	наконечники без фильтров 5000		Thermo Fisher Scientific	\N	 LT-5 	100.0	P
1492	штативы для носиков  1000мкл	Empty rack volume 1000mkl	Omnitip	\N	85910.0	45.0	P
1493	штативы для носиков  200мкл	Empty rack volume 200mkl	Omnitip	\N	83910.0	65.0	P
1494	Пробирки в стрипах по 8 штук, классические	0.2mL 8-Strip UltraFlux® PCR Tubes without Cap\nNatural Polypropylene  	SSI	\N	SSI-3111	125.0	P
1495	Крышки выпуклые оптически-прозрачные для стрипов SSI-3111	8-Strip Dome Caps for UltraFlux® PCR Tubes\nNatural Polypropylene	SSI	\N	SSI-3101	125.0	P
1496	Крышки плоские оптически-прозрачные для стрипов SSI-3111	8-Strip, Flat Caps for UltraFlux® PCR Tubes\nNatural Polypropylene 	SSI	\N	SSI-3105	125.0	P
1497	стрипы для ПЦР с отдельно прикрепленными плоскими крышками	0.2mL SnapStrip®II PCR Tubes, 8-strip of tubes with Individual attached Flat Caps Natural Polypropylene  	SSI	\N	SSI-3245	120.0	P
1498	пробирки с конусовидным дном крышка	1.5mL Screw Tube, Graduated Natural Polypropylene 	SSI	\N	SSI-2230	500.0	P
1499	крышки резьбовые 	Screw Cap with O-ring Assorted Opaque Colors\nPolypropylene	SSI	\N	SSI-2001-59	500.0	P
1500	Пробирки для Qubit 500mkl тонкостеные 	Qubit® assay tubes	Invitrogen	\N	Q32856	500.0	P
1501	фильтр-переходник	Minisart HF, 0.2 µm Minisart - Polyethersulfone (PES)  sterile, individually packed with luer lock outlet\n	Sartorius	\N	16532 -k	50.0	P
1502	фильтр-переходник	CultiBag Perfusion Pro 2L 5mkm	Sartorius	\N	DBP002L5--SM		P
1503	Ванночки-резервуары для многоканальных пипеток, автоклавируемые, 5 шт./уп., 		Thermo	\N	9510027.0	5.0	P
1504	пробирки для цитофлуориметра	Test Tube, 12 x 75 mm, Blue (pkg of 250)	Beckman Coulter	\N	2523749.0	250.0	P
1505	индикаторные полоски	pH test strips     4.5 – 10	Sigma	\N	P4536-100EA	100.0	G
1506	индикаторные полоски	pH test strips\n0-14 pH, resolution: 1.0 pH unit	Sigma	\N	P4786-100EA	100.0	G
1507	индикаторные полоски	pH test strips\n0.0-6.0 pH, resolution: 0.5 pH unit	Sigma	\N	P4661-100EA	100.0	G
1508	индикаторные полоски	pH test strips  7-14	Sigma	\N	P4411-100EA	100.0	G
1509	Маркировочная лента синяя	Sigma label tape blue	Sigma	\N	L8144-1EA	1 шт	G
1510	Маркировочная лента зеленая	Sigma label tape green	Sigma	\N	L8269-1EA	1 шт	G
1511	Маркировочная лента белая	Sigma label tape white	Sigma	\N	L8394-1EA	1 шт	G
1512	Маркировочная лента красная	Sigma label tape red	Sigma	\N	L8519-1EA	1 шт	G
1513	лента индикатор автоклавирования	Tape, autoclave indicator, Sigmaware	Sigma	\N	A2549-6EA	6.0	G
1514	Метки для  Tough-Tags (Sigma )	Laser Tough-Tags™ sidewall - size 1.28 in. × 0.5 in., white 	Sigma	\N	Z366226-1PAK	2.0	G
1515	Метки для микроцентрифужных пробирок Tough-Tags (Sigma )	Tough-Tags™ microcentrifuge tube labels	Sigma	\N	Z359122-1PAK	4.0	G
1516	кварцевый цифровой таймер 1-канальный 	Quartz digital timer Model T-20	Sigma	\N	T6164-1EA	1 шт	G
1517	кварцевый цифровой таймер 4-х канальный (1 строка)	Quartz digital timer Model T-440	Sigma	\N	T2166-1EA	1 шт	G
1518	кварцевый цифровой таймер 3-х канальный (3 строки)	Quartz digital timer Model T-590	Sigma	\N	T2291-1EA	1 шт	G
1519	перманентный лабораторный маркер, экстра тонкий, черный 	Sigma lab markers Extra-Fine tip, black	Sigma	\N	S5769-10EA	10 шт	G
1520	перманентный лабораторный маркер, экстра тонкий, синий 	Sigma lab markers Extra-Fine tip, blue	Sigma	\N	S6269-10EA	10 шт	G
1521	перманентный лабораторный маркер, экстра тонкий, красный 	Sigma lab markers Extra-Fine tip, red	Sigma	\N	S6519-10EA	10 шт	G
1522	перманентный лабораторный маркер, тонкий, черный 	Sigma lab markers Fine tip, black	Sigma	\N	S5894-10EA	10 шт	G
1523	перманентный лабораторный маркер, тонкий, синий	Sigma lab markers Fine tip, blue	Sigma	\N	S6644-10EA	10 шт	G
1524	перманентный лабораторный маркер, тонкий, красный 	Sigma lab markers Fine tip, green	Sigma	\N	S6894-10EA	10 шт	G
1525	перманентный лабораторный маркер, тонкий, зеленый	Sigma lab markers Fine tip, red	Sigma	\N	S6769-10EA	10 шт	G
1526	Стеклянный химический стакан Гриффина, 100 мл	Duran® beakers capacity 100 mL, low form	Sigma	\N	Z231827-1EA	1 шт	G
1527	Стеклянный химический стакан Гриффина, 250 мл	Duran® beakers capacity 250 mL, low form	Sigma	\N	Z231843-1EA	1 шт	G
1528	Стеклянный химический стакан Гриффина, 600 мл	Duran® beakers capacity 600 mL, low form	Sigma	\N	Z231878-1EA	1 шт	G
1529	Стеклянный химический стакан Гриффина, 1000 мл	Duran® beakers capacity 1,000 mL, low form	Sigma	\N	Z231894-1EA	1 шт	G
1530	Пластиковый (полиметилпентеновый) химический стакан Гриффина, 100 мл	Nalgene® Griffin beakers capacity 100 mL, transparent polymethylpentene	Sigma	\N	Z130893-1PAK	12 шт	G
1531	Пластиковый (полиметилпентеновый) химический стакан Гриффина, 250 мл	Nalgene® Griffin beakers capacity 250 mL, transparent polymethylpentene	Sigma	\N	Z130915-1PAK	6 шт	G
1532	Пластиковый химический стакан Гриффина, 500 мл 	PLASTIBRAND® beaker, PMP capacity 500 mL, blue scale	Sigma	\N	Z322873-5EA	5 шт	G
1533	Пластиковый (полиметилпентеновый) химический стакан Гриффина, 1000 мл	Nalgene® Griffin beakers capacity 1,000 mL, transparent polymethylpentene	Sigma	\N	Z130923-1PAK	3 шт	G
1534	Воронка стеклянная толстостенная прямая, diam.75 мм	ACE heavy-wall powder funnels Straight, top diam. 75 mm	Sigma	\N	Z 189944-1EA	1 шт	G
1535	Воронка стеклянная толстостенная прямая, diam.100 мм	ACE heavy-wall powder funnels Straight, top diam. 100 mm	Sigma	\N	Z189952-1EA	2 шт	G
1536	Пластиковый (полиметинпентеновый) мерный цилиндр на 100 мл	Nalgene® graduated cylinders volume 1,000 mL, polymethylpentene	Sigma	\N	Z131067-1EA	1 шт	G
1537	Пластиковый (полиметинпентеновый) мерный цилиндр на 100 мл	Nalgene® graduated cylinders volume 500 mL, polymethylpentene	Sigma	\N	Z131059-1EA	1шт	G
1538	Пластиковый (полиметинпентеновый) мерный цилиндр на 100 мл	Nalgene® graduated cylinders volume 100 mL, polymethylpentene	Sigma	\N	Z131040-1EA	1шт	G
1540	Стекляная колба на 1 L	Pyrex™ long neck culture flask, capacity 1000 mL	Sigma	\N	CLS44421L-1EA	1.0	G
1541	Стекляная колба на 500 mL	Pyrex™ long neck culture flask, capacity 500 mL	Sigma	\N	CLS4442500-1EA	1.0	G
1542	Стекляная колба на 250 mL	Pyrex™ long neck culture flask, capacity 250 mL	Sigma	\N	CLS4442250-6EA	6.0	G
1543	Стекляная колба Эрленмейера с отбойниками на 1 L 	Pyrex™ baffled Erlenmeyer flask, capacity 1,000 mL	Sigma	\N	CLS44501L-1EA	1.0	G
1544	Стекляная колба Эрленмейера с отбойниками на  500 mL 	Pyrex™ baffled Erlenmeyer flask, capacity 500 mL	Sigma	\N	CLS4450500-6EA	6.0	G
1545	Стекляная колба Эрленмейера с отбойниками на  250 mL 	Pyrex™ baffled Erlenmeyer flask, capacity 250 mL	Sigma	\N	CLS4450250-6EA	6.0	G
1546	Пластиковая колба на 2 L с градуировкой 200 ml	Nalgene® baffled shake flask, capacity 2,000 mL, Beaded neck	Sigma	\N	F0527-2EA	2.0	G
1547	Пластиковая колба на 1 L с градуировкой	Nalgene® baffled shake flask, flask capacity 1,000 mL, Straight neck	Sigma	\N	F0402-2EA	2.0	G
1548	Пластиковая колба на 500 mL с градуировкой 50 ml	Nalgene® baffled shake flask, flask capacity 500 mL, Straight neck	Sigma	\N	F0277-4EA	4.0	G
1549	Пластиковая колба на 250 mL с градуировкой 25 ml	Nalgene® baffled shake flask, flask capacity 250 mL, Beaded neck	Sigma	\N	F0152-4EA	4.0	G
1550	Полотенца Tork с центральной вытяжкой 420 с перфорацией (No name )		Tork	\N	130044-00	6.0	G
1551	Жидкое мыло-крем Tork Premium, 5 л		Tork	\N	400505.0		G
1552	бумага фильтровальная общего назначения MACHAREY NAGEL		isolab	\N	044.10.003	40x40 см 250 шт	G
1553	бумага фильтровальная (мелкой пористости) - 125 мм MACHAREY NAGEL		isolab	\N	044.08.002	100 шт	G
1554	лапка для штатива (4 пальца) - 50 мм		isolab	\N	045.01.001		G
1555	лапка для штатива (4 пальца) с муфтой  - 50 мм		isolab	\N	045.04.001		G
1556	лапка для штатива (3 пальца) большая с муфтой - 70 мм		isolab	\N	045.06.001		G
1557	шпатель с лопаткой и ложкой - 180 мм		isolab	\N	047.01.001		G
1558	шпатель плоский двусторонний - 200 мм		isolab	\N	047.05.001		G
1559	шпатель микро (с лопаткой и ложкой) - 180 мм		isolab	\N	047.06.001		G
1560	пинцет с тупыми губками - 130 мм		isolab	\N	048.01.001		G
1561	пинцет для покровных стекол - 105 мм		isolab	\N	048.03.001		G
1562	пинцет для фильтровальной бумаги - 130 мм		isolab	\N	048.04.001		G
1563	ножницы общего назначения - 160 мм		isolab	\N	048.05.001		G
1564	магнитный перемешивающий элемент (мешальник) - 20x6 мм		isolab	\N	057.01.020		G
1565	магнитный перемешивающий элемент (мешальник) - 30x6 мм		isolab	\N	057.01.030		G
1566	магнитный перемешивающий элемент (мешальник) - 40x7 мм		isolab	\N	057.01.040		G
1567	магнитный перемешивающий элемент (мешальник) - 50x7 мм		isolab	\N	057.01.050		G
1568	магнитный перемешивающий элемент (мешальник) - 60x8 мм		isolab	\N	057.01.060		G
1569	магнитный перемешивающий элемент (мешальник) - 70x8 мм		isolab	\N	057.01.070		G
1570	палочка с магнитом для извлечения мешальников - 350 мм		isolab	\N	057.02.001		G
1571	Ретривер для доставания магнитных мешальников, около 30 см	Stirring bar retriever, L 12 in., PE	Sigma	\N	Z105694-1EA		G
1572	Набор магнитных мешальников: 2 of each size. 1/2 × 5/16 in., 5/8 × 5/16 in., 1 × 3/8 in., 11/2 × 3/8 in., 2 × 3/8 in., 21/2 × 3/8 in	Spinbar® assortment, PTFE-coated octagonal	Sigma	\N	Z105074-1KT		G
1573	Пинцет из нервавеющей стали, 12 см	Dressing tissue forceps, L 4 3/4 in	Sigma	\N	F3892-1EA		G
1574	Пинцет из нервавеющей стали, 15 см	Dressing tissue forceps, L 6 in	Sigma	\N	F4267-1EA		G
1575	Пинцет из нервавеющей стали c закругленными концами, 10 см	Micro-dissecting forceps, Curved	Sigma	\N	F4142-1EA		G
1576	Зажим для термометра	Aldrich® thermometer swivel Benchclamp™	Sigma	\N	Z556858-1EA		G
1577	Струбцина, размер  L,  3-вильчатая, 2 регулировки\n	Aldrich® ultra Benchclamp™, dual adjustment, size L	Sigma	\N	Z556629-1EA		G
1578	Струбцина, размер  М,  3-вильчатая, 2 регулировки\n	Aldrich® ultra Benchclamp™, dual adjustment, size М	Sigma	\N	Z556610-1EA		G
1579	Струбцина, размер  S,  3-вильчатая, 1 регулировка\n	Aldrich® ultra Benchclamp™, single adjustment, size S	Sigma	\N	Z556572-1EA		G
1580	Держатель зажима, Holds rods from 0.089 to 1.6 cm (0.6 in.) diameter.	Alumaloy® clamp holder, with brass thumbscrews	Sigma	\N	Z243620-1EA		G
1581	Стойка для зажимов c подставкой: base size 6 in. × 9 in.\nrod diam. × L  1/2 in. × 24 in.\n	Support stand with rod, base size 6 in. × 9 in., Standard	Sigma	\N	Z509469-1EA		G
1582	Стойка для зажимов c подставкой: base size 6 in. × 11 in.\nrod diam. × L  1/2 in. × 36 in.\n	Support stand with rodб base size 6 in. × 11 in., Heavy duty	Sigma	\N	Z509515-1EA		G
1583	парафиновая пленка (парафильм) - 	Parafilm M 50 мм x 75 м		\N			G
1584	парафиновая пленка (парафильм) - 	Parafilm M 100 мм x 38 м		\N			G
1585	перчатки теплозащитные			\N	067.03.001		G
1586	прививочная петля, сталь, с закругленным концом			\N	082.02.001	10.0	G
1587	пипетка Пастера ПЭ нестерильная - 3 мл			\N	084.02.001	500.0	G
1588	\nКартридж предобработки воды	Q-GARD 1	Millipore	\N	QGARD00R1	шт	G
1589	\nКартридж QUANTUM EX (Органекс) с Миллипаком нест.	ORGANEX QUANTUM WITH MILLIPAK	Millipore	\N	QTUMMPKE	уп	G
1590	штатив для пробирок пластиковый, на 4 × 50 mL пробирок,12 × 15 mL пробирок, 32 × 1.5 mL пробирок или 32 × 0.5 mL пробирок	Four-way microtube rack assorted colors	Sigma	\N	R5651-5EA	5.0	G
1591	штатив для пробирок  стальной (покрыт эпоксидной смолой), на 16 пробирок по 50 mL 	Scienceware® centrifuge tube rack, epoxy-coated steel 16-position, for 50 mL plastic centrifuge tubes	Sigma	\N	R8384	1.0	G
1592	штатив для пробирок стальной (покрыт эпоксидной смолой), на 20 пробирок по 15 mL 	Scienceware® centrifuge tube rack, epoxy-coated steel 20-position, for 15 mL plastic centrifuge tubes	Sigma	\N	R8634-1EA	1.0	G
1593	штатив для пробирок  пенопластовый, на 20 пробирок по 50 mL	Corning® styrofoam rack for 50 mL centrifuge tubes (20шт/уп)	Sigma	\N	CLS4365-20EA	20.0	G
1594	штатив для пробирок  на 1 пробирку 50 mL, 5 в упаковке	One Well rack, Polypropylene interlocking, assorted colors	Sigma	\N	Z708461-5EA	5.0	G
1595	штатив для пробирок этажерочного типа, на 24 1.5-mL пробирки (4 × 6), L × W × H 143 mm × 90 mm × 52 mm	Microcentrifuge tube rack, Nalgene®\ncapacity, 24 1.5-mL tubes (4 × 6), white	Sigma	\N	R0641-1EA	1.0	G
1596	штатив для пробирок этажерочного типа, на 96 1.5-mL пробирки (8 × 12), L × W × H 201 mm × 131 mm × 54 mm	Microcentrifuge tube rack, Nalgene® capacity, 96 1.5-mL tubes (8 × 12), blue	Sigma	\N	R1891-1EA	1.0	G
1597	Штатив для пробирок 1,5-2 мл, Полипропилен, 80 лунок	Штатив для микропробирок	Хеликон	\N	RP-80	1.0	G
1598	Штатив «рабочее место», оргстекло, Для пробирок 1,5 мл, 72 места	RA-7215	Хеликон	\N	 RA-7215	1.0	G
1599	штатив для пробирок 0,5 мл двусторонний, на 96 (8 × 12) × 0.5 mL пробирокon или 96 (8 × 12) × 1.5 - 2.0 mL пробирок. 	Reversible 96 well rack, assorted colors	Sigma	\N	R6151-5EA	5.0	G
1600	штатив для пробирок на 96 ПЦР-пробирок по 0.2 mL (8х12), крышка отдельно	GeNunc™ tube tray and holder	Sigma	\N	P4366-5EA	5.0	G
1601	штатив для пробирок на 96 ПЦР-пробирок по 0.2 mL (8х12), крышка слитно	PCR 96 Well rack\nassorted colors	Sigma	\N	R6901-5EA	5.0	G
1602	 Штатив «рабочее место», оргстекло, Для пробирок 0,2 мл, 200 мест	RA-20002	Хеликон	\N	RA-20002	1.0	G
1603	штатив для криовиалов полипропиленовый,19 cм × 10 cм × 2.2 cм, 5 в упаковке	Wheaton vial rack 12 mm vial, no. of holes, 50 (5 × 10)	Sigma	\N	Z252484-1PAK	1.0	G
1604	крышки для кипячения пробирок  для 0.5 и 1.5 mL микроцентрифужных пробирок, можно автоклавировать	Microcentrifuge tube holder	Sigma	\N	Z708372-100EA	100.0	G
1605	Штатив для пробирок 1,5-2 мл с крышкой. Полипропилен. Количество лунок - 100	Штатив для микропробирок с крышкой	Хеликон	\N	RP-100	1.0	G
1606	штатив для пробирок 12 х 54 мм, на 50 (5х10) лунок, пропилен, крышка на петле	Штатив для хранения на 50 мест с крышкой, для криопробирок 12 х 54 мм	SSI (Хеликон)	\N	SSI-5510-00	1.0	G
1607	штатив для пробирок (WxDxH) = 141x151x57 mm,на 100 (10x10) лунок. Крышка на петле	VICTOR Box 57 / 10x10 cells, Height 57 mm fix	National Lab GmbH	\N	KVH57-S100NA		G
1608	штатив для пробирок (WxDxH) = 141x85x59 mm, на 50 (5х10) лунок. Крышка на петле	VICTOR Box 59 / 5x10 cells, Height 59 mm fix	National Lab GmbH	\N	KVA59-S50NA		G
1609	Штатив для стрипов и планшетов, 96 лунок, Прозрачная съемная защелкивающаяся крышка	Штатив для стрипов и планшетов	SSI (Хеликон)	\N	SSI-5240	1.0	G
1610	бутыль стеклянная simax 5L	Reagent bottles with screw GL 45 acc. to DIN– complete, marked SIMAX 1L	Simax	\N	2070 M/5000	6.0	G
1611	бутыль стеклянная simax 2L	Reagent bottles with screw GL 45 acc. to DIN– complete, marked SIMAX 1L	Simax	\N	2070 M/2000	10.0	G
1612	бутыль стеклянная simax 1L	Reagent bottles with screw GL 45 acc. to DIN– complete, marked SIMAX 1L	Simax	\N	2070 M/1000	10.0	G
1613	бутыль стеклянная simax 0,5 L	Reagent bottles with screw GL 45 acc. to DIN– complete, marked SIMAX 500ml	Simax	\N	2070M/5000	10.0	G
1614	бутыль стеклянная simax 250 ml	Reagent bottles with screw GL 45 acc. to DIN– complete, marked SIMAX 250 ml	Simax	\N	2070 M/250	10.0	G
1615	бутыль стеклянная simax 100 ml	Reagent bottles with screw GL 45 acc. to DIN– complete, marked SIMAX 100 ml	Simax	\N	2070 M/100	10.0	G
1616	бутыль стеклянная wheaton 1 L	Wheaton media bottles, glass\nsize 1000 mL, Rubber lined phenolic cap	Sigma	\N	Z364843-24EA	24.0	G
1617	бутыль стеклянная wheaton 500 ml	Wheaton media bottles, glass\nsize 500 mL, Rubber lined phenolic cap	Sigma	\N	Z364835-24EA	24.0	G
1618	бутыль стеклянная wheaton 250 ml	Wheaton media bottles, glass\nsize 250 mL, Rubber lined phenolic cap	Sigma	\N	Z364827-48EA	48.0	G
1619	бутыль стеклянная wheaton 125 ml	Wheaton media bottles, glass\nsize 125 mL, Rubber lined phenolic cap	Sigma	\N	Z364819-48EA	48.0	G
1620	Перчатки Ansell Derma clean смотр., нестер., неопудр.  L (уп 50 пар)		Ansell	\N		50 пар	G
1621	Перчатки Ansell Derma clean смотр., нестер., неопудр.  M (уп 50 пар)		Ansell	\N		50 пар	G
1622	Перчатки Ansell Derma clean смотр., нестер., неопудр.  S (уп 50 пар)		Ansell	\N		50 пар	G
1623	Перчатки Ansell Derma clean смотр., нестер., неопудр. XS		Ansell	\N		50 пар	G
1624	скальпели одноразовые с пластмассовой ручкой стерильный №23 (лезвие нерж сталь) Apexmed 500 в уп			\N			G
1625	Стер. однораз.  хирургические лезвия из нерж.стали  “Paragon” №10 или 20,21,22,23; 100 в уп			\N			G
1626	Ступка фарфоровая № 2 (d 70мм)			\N			G
1627	халаты многоразовые  в ассортименте			\N			G
1628	Шприцы одноразовые (туберкулиновые)  1мл 26Gx1/2		SFM Hospital Products GmbH	\N		100.0	G
1629	Шприцы одноразовые (туберкулиновые)   2мл 23Gx1/4		SFM Hospital Products GmbH	\N		100.0	G
1630	Шприцы одноразовые (туберкулиновые)   5мл 22Gx1/1,5		SFM Hospital Products GmbH	\N		100.0	G
1631	Шприцы одноразовые (туберкулиновые)  10мл 21Gx1/1,5		SFM Hospital Products GmbH	\N		100.0	G
1632	Шприцы одноразовые (туберкулиновые)   20 мл		SFM Hospital Products GmbH	\N		100.0	G
1633	Шприцы одноразовые (туберкулиновые)  50 мл		SFM Hospital Products GmbH	\N		100.0	G
1634	бутанол	1-Butanol - for molecular biology, ≥99%	Sigma	\N	B7906	500ML 	S
1635	хелатирующий агент	8-hydroxy-chinolin (8-Quinolinol)	Sigma	\N	22019-250G-R	250G	S
1636	азид натрия	Sodium azide - ReagentPlus®, ≥99.5%	Sigma	\N	S2002	500 g	S
1637	ацетат аммония	Ammonium acetate for molecular biology, ~98%	Sigma	\N	A1542	500G	S
1638	персульфат аммония	Ammonium persulfate - for molecular biology, powder, ≥98% 	Sigma	\N	A9164	100g 	S
1639	сульфат аммония	Ammonium sulfate	Sigma	\N	A4418-5KG	5 kg	S
1640	агар 	Bacto Agar, A solidifying agent, is a purified agar in which extraneous matter, pigmented portions and salts are reduced to a minimum	BD	\N	214010.0	454 g	S
1641	пептон	BD Bacto™ Peptone, An enzymatic digest of animal protein	BD	\N	211820.0	2 kg	S
1642	триптон	BD Bacto™ Tryptone, Enzymatic digest of casein	BD	\N	211699.0	2 kg	S
1643	дрожжевой экстракт	BD Bacto™ Yeast Extract, Water-soluble extract of autolyzed yeast cells suitable for use in culture media	BD	\N	212720.0	2 kg	S
1644	сухая смесь LB	BD Difco™ LB Broth Base, BD Select APS™ (Alternative Protein Source), Propagation and maintenance of E. coli for molecular biology. Non-animal origin formulation	BD	\N	212484.0	10 kg	S
1645	сухая смесь LB	BD LB bouillon	BD	\N	214906.0	10 kg	S
1646	N-бис (2-гидроксиэтил)-2- аминоэтансульфоновая кислота	BES	Sigma	\N	B9879	25 g	S
1647	борная кислота	Boric acid - for molecular biology, ≥98.5% 		\N	B6768	5KG	S
1648	стандартный раствор фиолетовый pH 10	Buffer solution pH 10.0 (20 °C)\nborax / sodium hydroxide solution, solution ready for use, violet colored	Sigma	\N	33668.0	500ML	S
1649	стандартный раствор зеленый  pH 7	Buffer solution pH 7.0 (20 °C)\nwith fungicide, potassium dihydrogen phosphate / disodium hydrogen phosphate, solution ready for use, green colored	Sigma	\N	33666.0	500ML	S
1650	стандартный раствор красный pH 4	Buffer standard solution, color-coded\nBioChemika, standardized against NIST standard reference material, red, color-coded, pH 4.00±0.01	Sigma	\N	82598.0	500ML	S
1651	хлорид кальция дигидрат	Calcium chloride dihydrate for molecular biology,~99%	Sigma	\N	C3306	500g 	S
1652	лимонная кислота	Citric acid - anhydrous, cell culture tested, plant cell culture tested (Sigma)\n	Sigma	\N	C2404	500 g	S
1653	колхицин	Colchicine - ≥95% (HPLC), powder	Sigma	\N	C9754	500 g	S
1654	кумасси бриллиантовый синий	Coomassie Brilliant blue	bio-Rad	\N	161-0400	10 g	S
1655	Синтетический глюкокортикостероид	Dexamethasone powder, ≥97%, cell culture tested	Sigma	\N	D4902	25G	S
1656	Диметил сульфоксид 99% чистоты	Dimethyl Sulfoxide Cell Culture Reagent, Purity: ≥99%	MP Biomedicals	\N	219605590.0	0,5 л	S
1657	Диметил сульфоксид 	Dimethyl Sulfoxide, ACS grade	Amresco	\N	0231-500ML	0,5 л	S
1658	ЭДТА	EDTA disodium salt hydrate 99% 	Sigma	\N	E5134	1 kg	S
1659	этидий бромид в растворе	Ethidium bromide solution BioReagent, for molecular biology, 500 μg/mL in H2O	Sigma	\N	E1385	5ML	S
1660	раствор формальдегида	Formaldehyde solution - contains 10-15% methanol as stabilizer, 37 wt. % in H2O 	Sigma	\N	F1635	500 ml	S
1661	формамид	Formamide ≥99.5% (GC), BioReagent, for molecular biology	Sigma	\N	F9037	100 ml	S
1662	раствор гентамицина	Gentamycin solution	Sigma	\N	G1397	10 ml	S
1663	глицерол	Glycerol - for molecular biology, ≥99%	Sigma	\N	G5516	1 L	S
1664	бета-Глицерофосфат динатриевая соль, гидрат	β-Glycerophosphate disodium salt hydrate\nBioUltra, suitable for cell culture, suitable for plant cell culture, ≥99.0%	Sigma	\N	G9422	10G	S
1665	глицин для электрофореза	Glycine for electrophoresis, 99%	Sigma	\N	G8898	500 g	S
1666	гуанидин гидрохлорида	Guanidine hydrochloride for molecular biology, 99%	Sigma	\N	G3272	500 g	S
1667	гуанидин тиоцианат	Guanidine thiocyanate for molecular biology, 99%	Sigma	\N	G9277	500 g	S
1668	имидазол	Imidazole for molecular biology, ≥99%	Sigma	\N	I5513	25g	S
1669	ацетат лития	Lithium acetate dihydrate	Sigma	\N	L6883	250 g	S
1670	хлорид лития	Lithium chloride - for molecular biology, ≥99% 	Sigma	\N	L9650	100 g	S
1671	ультранизкоплавкая агароза	LMP agarose	Gibco	\N	1029A	100 g	S
1672	хлорид магния шестиводный	Magnesium chloride hexahydrate SigmaUltra, 99.0%	Sigma	\N	M2670	500 g	S
1673	MgCl2	Magnesium chloride hexahydrate - ReagentPlus®, ≥99.0%	Sigma	\N	M0250	500 g	S
1674	сульфат магния семиводный	Magnesium sulfate heptahydrate for molecular biology, 99.0%	Sigma	\N	M2773	500 g	S
1675	бета-меркаптоэтанол для ЭФ, но не Cell Culture Tested, 500 mL	2-Mercaptoethanol, ≥99.0%	Sigma	\N	M6250-500ML	500 мл	S
1676	метотрексат	Methotrexate hydrate	Sigma	\N	A6770	10MG	S
1677	минеральное масло	Mineral oil 	Sigma	\N	M5904	500 ml	S
1678	минеральное масло для клеточных культур	Mineral oil light oil ((neat)), BioXtra, suitable for mouse embryo cell culture\n	Sigma	\N	M5310-1L	1 l	S
1679	хлорид марганца тетрагидрат	MnCl2 tetrahydrate	Sigma	\N	M3634, 	500 g	S
1680	мовиол	Mowiol	Calbiochem	\N	#475904	100 G	S
1681	детергент NP-40	NP-40	Sigma	\N	74385.0	1L	S
1682	параформальдегид	Paraformaldehyde - reagent grade, crystalline	Sigma	\N	P6148	500G	S
1683	полиэтиленгликоль	PEG 3350 Poly(ethylene glycol) - average mol wt 3015-3685	Sigma	\N	P3640	500G	S
1684	полиэтиленгликоль	PEG 4000	Merck	\N	81242.0	1KG	S
1685	полиэтиленгликоль	PEG 8000 Poly(ethylene glycol) - average mol wt 8,000, powder	Sigma	\N	P2139	500G	S
1686	Хлорная кислота 70% 	perchloric acid	Fluka 	\N	77227.0	0,5 л	S
1687	ацетат калия	Potassium acetate - BioXtra, ≥99.0%	Sigma	\N	P5708	500 g	S
1688	ацетат калия	Potassium acetate, ultra, minimum 99%	Sigma	\N	P5708	500G	S
1689	калий хлор	Potassium chloride - for molecular biology, ≥99.0%	Sigma	\N	P9541	500 g	S
1690	калия гидрокарбонат	Potassium hydrogen carbonate	Sigma	\N	237205.0	500G	S
1691	фосфат калия двуосновный	Potassium hydrogen phosphate anhydrous	Sigma	\N	P3786	500 g	S
1692	гидроксид калия	Potassium hydroxide - BioXtra, ≥85% KOH basis	Sigma	\N	P5958	500 g	S
1693	двухосновный фосфат калия тригидрат	Potassium phosphate dibasic trihydrate for molecular biology, 99%	Sigma	\N	P9666	500G	S
1694	одноосновный фосфат калия	Potassium phosphate monobasic for molecular biology, 98%	Sigma	\N	P9791	500G	S
1695	одноосновный фосфат калия	Potassium phosphate monobasic powder, suitable for cell culture, suitable for insect cell culture	Sigma	\N	P5655	500G	S
1696	поливинилпирролидон	PVP (Polyvinylpyrrolidone)	Sigma	\N	PVP10	500G 	S
1697	ацетат натрия	Sodium acetate 	Sigma	\N	S2889	5KG	S
1698	бикарбонат натрия	Sodium bicarbonate SigmaUltra, ≥99.5%,	Sigma	\N	S6297	250G	S
1699	какодилат натрия тригидрат	Sodium cacodylate trihydrate	Sigma	\N	C4945	25G	S
1700	карбонат натрия	Sodium carbonate SigmaUltra, 99.0%	Sigma	\N	S7795	500G	S
1701	хлорид натрия	Sodium chloride - for molecular biology, DNase, RNase, and protease, none detected, ≥98%	Sigma	\N	S3014	5KG	S
1702	хлорид натрия	Sodium chloride BioXtra, ≥99.5%\n		\N	S7653	5KG	S
1703	цитрат натрия дигидрат	Sodium citrate tribasic dihydrate	Sigma	\N	71402.0	1KG	S
1704	цитрат натрия дигидрат	Sodium citrate tribasic dihydrate ACS reagent, 99.0%	Sigma	\N	S4641	500G	S
1705	лаурил сульфат	Sodium dodecyl sulfate	Sigma	\N	L4390	500G	S
1706	лаурилсульфат	Sodium dodecyl sulfate	Sigma	\N	L5750	5KG	S
1707	гидроксид натрия	Sodium hydroxide	Sigma	\N	S8045	500G	S
1708	двухосновный фосфат натрия дигидрат	Sodium phosphate dibasic dihydrate - BioUltra, for molecular biology, ≥99.0%	Sigma	\N	71643.0	1KG	S
1709	двухосновный фосфат натрия	Sodium phosphate dibasic for molecular biology, 98.5%	Sigma	\N	S3264	500G	S
1710	одноосновный фосфат натрия	Sodium phosphate monobasic for mol biol, anhydrous, 98%	Sigma	\N	S3139	1KG	S
1711	тиоционат натрия	Sodium Thiocyanate solution (fluka)	Sigma	\N	80518-500ML-F	500 ml	S
1712	стрептомицина сульфат	Streptomycin sulfate cell culture tested	Sigma	\N	S9137	25 g	S
1713	сахароза	Sucrose	Sigma	\N	S0389	500G	S
1714	буфер (ТАЕ)	TAE buffer 10x	Applichem	\N	4227-5000	5 L	S
1715	буфер (ТБЕ)	TBE buffer 10x	Applichem	\N	A4348-9010	10 L	S
1716	Фосфатно-солевой буфер (PBS) сухая смесь (100 л)	PBS 100L	Applichem	\N	A0964,9100	100 L	S
1717	мертиолят	Thimerosal	Sigma	\N	T5125-10G	10 g	S
1718	детергент Triton X-100	Triton X-100	Sigma	\N	T8787	250ML	S
1719	буфер (Trizma Base)	Trizma Base	Sigma	\N	T6066	1KG	S
1720	буфер (Trizma Hydrochloride)	Trizma Hydrochloride	Sigma	\N	T5941	500G	S
1721	детергент  TWEEN 20	TWEEN 20 for electrophoresis	Applichem	\N	A1389,0500	500 ml	S
1722	детергент  TWEEN 80	Tween 80	Sigma	\N	P5188	100ML	S
1723	мочевина	Urea for molecular biology, 98%, powder	Sigma	\N	U5378	5KG	S
1724	соляная кислота	Hydrochloric acid ACS reagent, 37%	Sigma	\N	320331-500ML 	500 мл	S
1725	серная кислота	Sulfuric acid 99.999%	Sigma	\N	339741-500ML	500 мл	S
1726	ортофосфорная кислота	Phosphoric acid ACS reagent, ≥85 wt. % in H2O	Sigma	\N	215104-500ML	500 мл	S
1727	трихлоруксусная кислота	Trichloroacetic acid\nanalytical standard, ampule of 100 mg\n	Sigma	\N	442820.0	100 mg	S
1728	уксусная кислота	Acetic acid ACS reagent, ≥99.7%	Sigma	\N	695092-6X500ML	6*500 ml	S
1729	ксилол	o-Xylene anhydrous, 97%	Sigma	\N	294780-1L	1 L	S
1730	изопропанол	2-Propanol anhydrous, 99.5%	Sigma	\N	278475-6X1L	6*1L	S
1731	изоамиловый спирт	Isoamyl alcohol natural, ≥98%, FG	Sigma	\N	W205710-1KG-K		S
1732	хлороформ 		Sigma	\N			S
1733	этанол		Sigma	\N			S
1734	Человеческий рекомбинантный ФНО-альфа	Recombinant Human TNF-alpha	R&D systems	\N	210-ТА-010	10 µg	I
1735	Моноклональные антитела к ГМ-КСФ	Human GM-CSF Antibody, Monoclonal Mouse IgG1, Clone # 6804	R&D systems	\N	MAB615	500 µg	I
1736	рекомбинантный белок BMP2	Recombinant Human BMP2	R&D systems	\N	355-BM-010	10mkg	I
1737	рекомбинантный белок BMP4	Recombinant Human BMP4	R&D systems	\N	314-BP-010	10mkg	I
1738	рекомбинантный белок BMP7	Recombinant Human BMP7	R&D systems	\N	354-BP-010	10mkg	I
1739	рекомбинантный белок BMP7	Recombinant Human BMP7	R&D systems	\N	354-BP-10/CF	10mkg	I
1740	рекомбинантный белок BMP9	Recombinant Human BMP9	R&D systems	\N	3209-BP-010	10mkg	I
1741	рекомбинантный белок GCSF	Recombinant Human GCSF	R&D systems	\N	214-CS-005	5mkg	I
1742	рекомбинантный белок FGF	Recombinant Human FGF basic 146 aa	R&D systems	\N	233-FB-025	25mkg	I
1743	рекомбинантный белок Flt3	Recombinant Human Flt3 Ligand	R&D systems	\N	308-FK-005	5mkg	I
1744	Человеческий рекомбинантный ГМ-КСФ	Recombinant Human GMCSF	R&D systems	\N	215-GM-010	10mkg	I
1745	Человеческий рекомбинантный ГМ-КСФ	Recombinant Human GMCSF	R&D systems	\N	215-GM-050	50 μg	I
1746	Человеческий рекомбинантный ИЛ-1бета	Recombinant Human IL-1 beta/IL-1F2	R&D systems	\N	201-LВ-025	25 µg	I
1747	рекомбинантный белок IL 2	Recombinant Human IL2	R&D systems	\N	202-IL-010	10mkg	I
1748	рекомбинантный белок IL 3	Recombinant Human IL3	R&D systems	\N	203-IL-010	10mkg	I
1749	рекомбинантный белок IL 4	Recombinant Human IL4	R&D systems	\N	204-IL-010	10mkg	I
1750	Человеческий рекомбинантный ИЛ-4	Recombinant Human IL4	R&D systems	\N	204-IL-050	50 μg	I
1751	рекомбинантный белок IL 6	Recombinant Human IL6	R&D systems	\N	206-IL-010	10mkg	I
1752	рекомбинантный белок IL 11	Recombinant Human IL11	R&D systems	\N	218-IL-005	5mkg	I
1753	рекомбинантный интерферон-бета	Recombinant Human IFN-beta 1a (Mammalian), CF	R&D systems	\N	11410-2	1MU	I
1754	рекомбинантный интерферон-альфа	Recombinant Human IFN-alpha 2 (alpha 2b)	R&D systems	\N	11105-1	100000 U	I
1755	рекомбинантный белок Noggin	Recombinant Human Noggin	R&D systems	\N	6057-NG-025	25mkg	I
1756	рекомбинантный белок PIGF	Recombinant Human PlGF	R&D systems	\N	264-PG-010	10mkg	I
1757	рекомбинантный белок SCF	Recombinant Human SCF	R&D systems	\N	255-SC-010	10 µg	I
1758	рекомбинантный белок TGF-бета	Human TGFβ1	R&D systems	\N	100-B-001	1mkg	I
1759	рекомбинантный белок VEGF-C	Recombinant Human VEGF-C	R&D systems	\N	2179-VC-025	25 µg	I
1760	Раствор субстрата ТМБ	Substrate Reagent Pack (8 vials Color A, 8 vials Color B) 	R&D systems	\N	DY999		I
1761	рекомбинантный hWnt3a	rmWnt-3A, 	R&D systems	\N	1324-WN	10 mkg	I
1762	рекомбинантный hWnt5a	rmWnt-5a, 	R&D systems	\N	645-WN	10 mkg	I
1763	рекомбинантный hWnt11	Recombinant Human Wnt-11	R&D systems	\N	6179-WN-010	10 mkg	I
1764	рекомбинантный белок WIF	Recombinant Human WIF1 	R&D systems	\N	 #1341WF	50 mkg	I
1765	ИФА-набор для определения sFlt-1 	Human sVEGF R1/Flt-1 Quantikine ELISA Kit	R&D Systems	\N	DVR100B	1.0	I
1766	Набор реактивов для определения sFlt-1	Human VEGF R1/Flt-1 DuoSet	R&D Systems	\N	DY321	1.0	I
1767	ИФА-набор для определения эндоглина 	Human Endoglin/CD105 Quantikine ELISA Kit	R&D Systems	\N	DNDG00	1.0	I
1768	Набор реактивов для определения эндоглина 	Human Endoglin/CD105 DuoSet	R&D Systems	\N	DY1097	1.0	I
1769	ИФА-набор для определения PlGF 	Human PlGF Quantikine ELISA Kit	R&D Systems	\N	DPG00	1.0	I
1770	Набор реактивов для определения PlGF 	Human PlGF DuoSet	R&D Systems	\N	DY264	1.0	I
1771	ИФА-набор для определения VEGF 	Human VEGF Quantikine ELISA Kit	R&D Systems	\N	DVE00	1.0	I
1772	Набор реактивов для определения VEGF 	Human VEGF DuoSet	R&D Systems	\N	DY293B	1.0	I
1773	30% р-р перекиси водорода	Hydrogen peroxide solution - 30 % (w/w) in H2O, contains stabilizer	Sigma	\N	H1009-5ml	5 ml	I
1774	таблетки фосфатно-цитратного буфера	Phosphate-Citrate Buffer - tablet	Sigma	\N	P4809-50	50 tab	I
1775	таблетки ТМБ	3,3′,5,5′-Tetramethylbenzidine - tablet, 1 mg substrate per tablet	Sigma	\N	T5525-100	100 tab	I
1776	рекомбинантный белок тромбопоэтин	Thrombopoietin, human recombinant, expressed in E. coli	Sigma	\N	T1568-5UG	5mkg	I
1777	рекомбинантный белок LIF	Leukemia Inhibitory Factor human recombinant	Sigma	\N	L5283-10UG	10 mkg	I
1778	Таблетки субстрата для ИФА SigmaFast OPD	SIGMAFAST™ OPD - tablet	Sigma	\N	P9187-50SET	50 шт	I
1779	п-нитрофенол в растворе	4-Nitrophenol solution - 10 mM	Sigma	\N	N7660-100ml 	100 ml	I
1780	п-нитрофенол сухой	4-Nitrophenol - spectrophotometric grade	Sigma	\N	1048-5G	5 g	I
1781	Диэтаноламин	Diethanolamine - reagent grade, ≥98.0%	Sigma	\N	D8885-500G	500g	I
1782	Таблетки субстрата п-нитрофенилфосфата pNPP	4-Nitrophenyl phosphate disodium salt hexahydrate	Sigma	\N	N2765-100	100 tab	I
1783	Бычий сывороточный альбумин без протеаз	Albumin from bovine serum - lyophilized powder, essentially globulin free, essentially protease free, ≥98%	Sigma	\N	A3059-100g	100 g	I
1784	Бычий сывороточный альбумин 	Albumin from bovine serum\n≥98% (agarose gel electrophoresis), lyophilized powder\n	Sigma	\N	A7906-500G	500 g	I
1785	вторичные антитела против козьих антител для блоттинга	Anti-Goat IgG (whole molecule)–Peroxidase antibody produced in rabbit\naffinity isolated antibody, buffered aqueous solution	Sigma	\N	A5420-1ML	1 ml	I
1786	Краситель для меч. белков	Cy3 mono-Reactive Dye Pack	GE Healthcare	\N	PA23001	Kit(5 packs)	I
1787	Краситель для меч. белков	Cy5 mono-Reactive Dye Pack	GE Healthcare	\N	PA25001	Kit(5 packs)	I
1788	вторичные антитела против кроличьих антител для блоттинга	ECL Rabbit IgG, HRP-Linked Whole Ab (from donkey)	GE Healthcare	\N	NA934-1ML	1ML	I
1789	вторичные антитела против мышиных антител для блоттинга	ECL Mouse IgG, HRP-Linked Whole Ab (from sheep)	GE Healthcare	\N	NA931-1ML	1ML	I
1790	Конъюгат стрептавидина с пероксидазой хрена	Streptavidin, Peroxidase Conjugate\nApplications: Enzyme Immunoassay (1:10,000)	Calbiochem	\N	189733.0	1.0	I
1791	Антитела козьи к иммуноглобулинам мыши	Антитела козьи к иммуноглобулинам мыши	ИМТЕК	\N	GAM Iss		I
1792	Антитела козьи к иммуноглобулинам мыши меченные пероксидазой хрена	Антитела козьи к иммуноглобулинам мыши меченные пероксидазой хрена	ИМТЕК	\N	P-GAM Iss		I
1793	антитела	Wnt5a/b (C27E8) Rabbit mAb, 	Cell Signaling	\N	2530S	100 ul	I
1794	антитела	Wnt3a (C64F2) Rabbit mAb, 	Cell Signaling	\N	2721S	100 ul	I
1795	антитела к бета-2-микроглобулину	beta 2 Microglobulin antibody [B2M-01] 		\N	ab759		I
1796	антитела к актину	beta Actin antibody [mAbcam 8226] - Loading Control	Abcam	\N	ab8226		I
1797	антитела против мыши	CloneDetect Anti-mouse, FITC  Sterile, azide-free. 10000U atomizer bottle	Genetix	\N	K8221	5 мл	I
1798	антитела против мыши	CloneDetect antiMouse CIF unlabelled 	Genetix	\N	K8235	1ml	I
1799	стерилизующий реагент	Sterilising Agent 	Genetix	\N	K8085	50x1L	I
1800	антитела против мыши	CloneDetect Anti-mouse, 549Ex	Genetix	\N	K8230	 1ml	I
1801	Моноклональные антитела CD1a	PE Mouse Anti-Human CD1a	BD Pharmingen™	\N	555807.0	100 test	I
1802	Моноклональные антитела CD2	FITC Mouse Anti-Human CD2	BD Pharmingen™	\N	555326.0	100 test	I
1803	Моноклональные антитела CD3	APC Mouse Anti-Human CD3	BD Pharmingen™	\N	555342.0	100 test	I
1804	Моноклональные антитела CD4	FITC Mouse Anti-Human CD4	BD Pharmingen™	\N	555346.0	100 test	I
1805	Моноклональные антитела CD5	FITC Mouse Anti-Human CD5	BD Pharmingen™	\N	555352.0	100 test	I
1806	Моноклональные антитела CD8	PE Mouse Anti-Human CD8	BD Pharmingen™	\N	555635.0	100 test	I
1807	Моноклональные антитела CD11a	APC Mouse Anti-Human CD11A	BD Pharmingen™	\N	559875.0	100 test	I
1808	Моноклональные антитела CD11b	PE Mouse Anti-Human CD11b/Mac-1	BD Pharmingen™	\N	555388.0	100 test	I
1809	Моноклональные антитела CD11c	FITC Mouse Anti-Human CD11c	BD Pharmingen™	\N	561355.0	100 test	I
1810	Моноклональные антитела CD14	PE-Cy™7 Mouse Anti-Human CD14	BD Pharmingen™	\N	557742.0	100 test	I
1811	Моноклональные антитела CD16	PE-Cy™7 Mouse Anti-Human CD16	BD Pharmingen™	\N	557744.0	100 test	I
1812	Моноклональные антитела CD19	FITC Mouse Anti-Human CD19	BD Pharmingen™	\N	555412.0	100 test	I
1813	Моноклональные антитела CD20	PE Mouse Anti-Human CD20	BD Pharmingen™	\N	555623.0	100 test	I
1814	Моноклональные антитела CD21	PE Mouse Anti-Human CD21	BD Pharmingen™	\N	555422.0	100 test	I
1815	Моноклональные антитела CD22	FITC Mouse Anti-Human CD22	BD Pharmingen™	\N	555424.0	100 test	I
1816	Моноклональные антитела CD25	PE-Cy™7 Mouse Anti-Human CD25	BD Pharmingen™	\N	557741.0	100 test	I
1817	Моноклональные антитела CD34	PE Mouse Anti-Human CD34	BD Pharmingen™	\N	555822.0	100 test	I
1818	Моноклональные антитела CD45	PE Mouse Anti-Human CD45	BD Pharmingen™	\N	555483.0	100 test	I
1819	Моноклональные антитела CD54	PE Mouse Anti-Human CD54	BD Pharmingen™	\N	555511.0	100 test	I
1820	Моноклональные антитела CD56	PE Mouse Anti-Human CD56	BD Pharmingen™	\N	555516.0	100 test	I
1821	Моноклональные антитела CD80	FITC Mouse Anti-Human CD80	BD Pharmingen™	\N	557226.0	100 test	I
1822	Моноклональные антитела CD83	FITC Mouse Anti-Human CD83	BD Pharmingen™	\N	556910.0	100 test	I
1823	Моноклональные антитела CD86	FITC Mouse Anti-Human CD86	BD Pharmingen™	\N	555657.0	100 test	I
1824	Моноклональные антитела CD105	FITC Mouse anti-Human CD105 (Endoglin)	BD Pharmingen™	\N	561443.0	100 test	I
1825	Моноклональные антитела CD123	FITC Mouse anti-Human CD123	BD Pharmingen™	\N	558663.0	100 test	I
1826	Моноклональные антитела CD205	PE Conjugated Mouse Anti-human CD205 (DEC-205)	BD Pharmingen™	\N	558069.0	100 test	I
1827	Моноклональные антитела HLA-ABC	APC Mouse Anti-Human HLA-ABC	BD Pharmingen™	\N	555555.0	100 test	I
1828	Моноклональные антитела HLA-DR	APC Mouse Anti-Human HLA-DR	BD Pharmingen™	\N	559866.0	100 test	I
1829	Моноклональные антитела β2-микроглобулину	PE Mouse Anti-Human β2-Microglobulin	BD Pharmingen™	\N	551337.0	100 tests	I
1830	Изотипический контроль IgG1APC	APC Mouse IgG1, κ Isotype Control	BD Pharmingen™	\N	555751.0	100 test	I
1831	Изотипический контроль IgG1FITC	FITC Mouse IgG1, κ Isotype Control	BD Pharmingen™	\N	555909.0	100 test	I
1832	Изотипический контроль IgG1PE	PE Mouse IgG1, κ Isotype Control	BD Pharmingen™	\N	555749.0	100 test	I
1833	Изотипический контроль IgG1PE-Cy™7	PE-Cy™7 Mouse IgG1 κ Isotype Control	BD Pharmingen™	\N	557872.0	100 test	I
1834	Изотипический контроль IgG2aAPC	APC Mouse IgG2a, κ Isotype Control	BD Pharmingen™	\N	555576.0	100 test	I
1835	Изотипический контроль IgG2aFITC	FITC Mouse IgG2a, κ Isotype Control	BD Pharmingen™	\N	555573.0	100 test	I
1836	Изотипический контроль IgG2aPE-Cy™7	PE-Cy™7 Mouse IgG2a, κ Isotype Control	BD Pharmingen™	\N	557907.0	100 test	I
1837	Изотипический контроль IgG2bPE	PE Mouse IgG2b κ Isotype Control	BD Pharmingen™	\N	555743.0	100 test	I
1838	Изотипический контроль IgGMPE	PE Mouse IgM, κ Isotype Control	BD Pharmingen™	\N	555584.0	100 test	I
1839	Коктейль антител для определения Т - и В-лимфоцитов	Simultest™ CD5/CD19	BD Simultest™	\N	340396.0	50 Tests	I
1840	Моноклональные антитела CD90w			\N			I
1841	Моноклональные антитела CD133			\N			I
1842	Простагландин Е2			\N			I
1843	Агароза для гель-эелктрофореза ДНК	Agarose LE2	LE BioWhittaker	\N	B-5000-0,5	500g	W
1844	Агароза для гель-эелктрофореза ДНК	SeaKem® LE Agarose, 500 g	Lonza	\N	LNZ-50004	500g	W
1845	Агароза для молекулярной биологии	Certified Molecular Biology Agarose	BioRad	\N	161-3101	125g	W
1846	Агароза для молекулярной биологии	Certified Molecular Biology Agarose	BioRad	\N	161-3102	500g	W
1847	Раствор акриламида-бисакриламида 19:1	30% acrylamide and bis-acrylamide solution, 19:1 \n	BioRad	\N	161-0142	2*500 ml	W
1848	Раствор акриламида-бисакриламида 29:1 	40% acrylamide and bis-acrylamide solution, 29:1	BioRad	\N	161-0147	2*500 ml	W
1849	белковый стандарт 	Precision Plus Protein Dual Color Standards	BioRad	\N	161-0374	500 мкл	W
1850	тетраметилэтилендиамин	 TEMED for catalyst for polyacrylamide gels	BioRad	\N	161-0800	5 ml	W
1851	20% раствор лаурилсульфата	20% (w/v) sodium dodecyl sulfate (SDS) solution 	BioRad	\N	161-0418	1 л	W
1852	детергент Tween-20	Tween-20 \nenzyme immunoassay grade polysorbate surfactant (detergent) \n	BioRad	\N	170-6531	100 ml, 	W
1853	трис основной	≥99.8% pure Tris base 	BioRad	\N	161-0719	1 кг	W
1854	глицин 	glycine (aminoacetic acid) powder 	BioRad	\N	161-0724	2 кг	W
1855	10-кратный буфер для электрофореза	10x premixed electrophoresis buffer 	BioRad	\N	161-0771	5 л	W
1856	буфер для нанесения образцов восстанавливающий	Laemmli Sample Buffer	BioRad	\N	161-0737	30 мл	W
1857	буфер для нанесения образцов не восстанавливающий	Native Sample Buffer\n	BioRad	\N	161-0738	30 мл	W
1858	дитиотриэтол	dithiothreitol (DTT) reducing agent	BioRad	\N	161-0611	5 г	W
1859	персульфат аммония	ammonium persulfate (APS) catalyst	BioRad	\N	161-0700	10 g	W
1860	Гребенка для камеры MiniProteanIII, 0,75 mm, 15-well	15-well, 0.75 mm, comb for Mini-PROTEAN electrophoresis cell	BioRad	\N	165-3355	5.0	W
1861	Гребенка для камеры MiniProteanIII, 0,75 mm, 10-well (2 шт/уп)	10-well, 0.75 mm, comb for Mini-PROTEAN electrophoresis cell 	BioRad	\N	165-3354	5.0	W
1862	Стекла для камеры Mini Protean III, (5 шт/уп)	short plate for Mini-PROTEAN Tetra system and Mini-PROTEAN 3 multi-casting chamber \n	BioRad	\N	165-3308	5.0	W
1863	Стекла со спейсерами 0,75 мм, 5	spacer plate with 0.75 mm integrated spacer, for Mini-PROTEAN Tetra system and Mini-PROTEAN 3 multi-casting chamber 	BioRad	\N	165-3310	5.0	W
1864	чип и расходные материалы для ДНК Experion	Experion DNA 1K Analysis Kit for 10 Chips	BioRad	\N	700-7107	1.0	W
1865	чип и расходные материалы для белка Experion	Experion Pro260  Analysis Kit for 25 Chips	BioRad	\N	700-7102	1.0	W
1866	расходные материалы для белка Experion	Experion Pro260 Reagents and Supplies	BioRad	\N	700-7152 	1.0	W
1867	белковый стандарт Experion	Experion Protein Ladder 	BioRad	\N	700-7256	1.0	W
1868	чип и расходные материалы для РНК Experion	Experion RNA STDSens  Analysis Kit for 10 Chips	BioRad	\N	700-7103	1.0	W
1869	чип и расходные материалы для РНК Experion высокочувств	Experion RNA HighSens  Analysis Kit for 10 Chips	BioRad	\N	700-7105	1.0	W
1870	реагент для определения концентрации белка	Bradford Reagent, 500 ml	Sigma	\N	B6916	500 мл	W
1871	коктейль ингибиторов протеаз	Смесь ингибиторов протеаз III 	Сalbiochem	\N	CB535140-1	 1ml 	W
1872	коктейль ингибиторов фосфатаз	Phosphatase Inhibitor Cocktail 1	Sigma	\N	P0044-1ML	1ml	W
1873	Мембрана для блоттинга в рулоне	Hybond-P PVDF transfer membrane, 0.3m x 3 m	GE Healthcare	\N	RPN303F	1.0	W
1874	блокирующий реагент	ECL Blocking Agent	GE Healthcare	\N	RPN2125	40 г	W
1875	пероксидазный субстрат для блоттинга	Immobilon™ Western, Chemiluminiscent HRP Substrate, 500 ml	Millipore	\N	WBKLS0500	1.0	W
1876	концентрационные ячейки 	Microcon YM-3, 3 kDa NMWL	Millipore	\N	42420.0		W
1877	концентрационные ячейки 	Microcon YM-10, 10 kDa NMWL	Millipore	\N	42406.0	24.0	W
1878	концентрационные ячейки	Microcon YM-30 30kDa	Millipore	\N	42409.0	24.0	W
1879	концентрационные ячейки	Microcon YM-50, 50 kDa NMWL	Millipore	\N	42423.0	8.0	W
1880	концентрационные ячейки	Microcon YM-100, 100 kDa NMWL	Millipore	\N	42424.0		W
1881	концентрационные ячейки	Amicon Ultra-4, PLBC Ultracel-3 Membrane, 3 kDa	Millipore	\N	UFC800308 		W
1882	концентрационные ячейки	Amicon Ultra-4, PLGC Ultracel-PL Membrane, 10 kDa	Millipore	\N	UFC801008		W
1883	концентрационные ячейки	Amicon Ultra-4, PLTK Ultracel-PL Membrane, 30 kDa	Millipore	\N	UFC803008		W
1884	концентрационные ячейки	Amicon Ultra-4, PLQK Ultracel-PL Membrane, 50 kDa	Millipore	\N	UFC805008		W
1885	концентрационные ячейки	Amicon Ultra-4, PLHK Ultracel-PL Membrane, 100 kDa	Millipore	\N	UFC810008		W
1886	концентрационные ячейки	Amicon Ultra-15, PLBC Ultracel-PL Membrane, 3 kDa	Millipore	\N	UFC900308		W
1887	концентрационные ячейки	Amicon Ultra-15, PLGC Ultracel-PL Membrane, 10 kDa	Millipore	\N	UFC901008		W
1888	концентрационные ячейки	Amicon Ultra-15, PLTK Ultracel-PL Membrane, 30 kDa	Millipore	\N	UFC903008		W
1889	концентрационные ячейки	Amicon Ultra-15, PLQK Ultracel-PL Membrane, 50 kDa 	Millipore	\N	UFC905008		W
1890	концентрационные ячейки	Amicon Ultra-15, PLHK Ultracel-PL Membrane, 100 kDa	Millipore	\N	UFC910008		W
1891	концентрационные ячейки	Centricon Plus-70, Ultracel-PL Membrane, 10 kDa	Millipore	\N	UFC701008		W
1892	концентрационные ячейки	Centricon Plus-70, Ultracel-PL Membrane, 30 kDa	Millipore	\N	UFC703008		W
1893	концентрационные ячейки	Centricon Plus-70, Ultracel-PL Membrane, 100 kDa 	Millipore	\N	UFC710008		W
1894	концентрационные ячейки	Amicon Ultra-15 Centrifugal Filter Unit with\nUltracel-30	Millipore	\N	UFC903024	24.0	W
1895	концентрационные ячейки	Amicon Ultra-15 PLGC Ultracel-PL 10kDa	Millipore	\N	UFC901024	24.0	W
1896	диализная мембрана	Dialysis tubing cellulose membrane\navg. flat width 10 mm	Sigma	\N	D9277-100FT	1.0	W
1897	диализная мембрана	Dialysis tubing cellulose membrane\navg. flat width 25 mm	Sigma	\N	D9777-100FT	1.0	W
1898	диализная мембрана	Dialysis tubing cellulose membrane\navg. flat width 33 mm	Sigma	\N	D9652-100FT	1.0	W
1899	диализная мембрана	Dialysis tubing cellulose membrane\navg. flat width 43 mm	Sigma	\N	D9527-100FT	1.0	W
1900	зажимы для диализных мембран	Dialysis tubing closures\nblue, size 50 mm	Sigma	\N	Z371092-10EA	10.0	W
1901	зажимы для диализных мембран	Dialysis tubing closures\ngreen, size 70 mm	Sigma	\N	Z371149-10EA	10.0	W
1902	зажимы для диализных мембран	Dialysis tubing closures\nyellow, size 110 mm	Sigma	\N	Z371076-10EA	10.0	W
1903	зажимы для диализных мембран	Dialysis tubing closures\nred, size 150 mm	Sigma	\N	Z371025-10EA	10.0	W
1904	плот для ячеек для диализа в малом объеме	Slide-A-Lyzer MINI Dialysis Device Floats, 25-unit capacity 	Pierce 	\N	69588.0	25.0	W
1905	ячейка для диализа в малом объеме	Slide-A-Lyzer MINI Dialysis Device, 3.5K MWCO, 0.1mL 	Pierce 	\N	69550.0	50.0	W
1906	ячейка для диализа в малом объеме	Slide-A-Lyzer MINI Dialysis Device, 10K MWCO, 0.1mL 	Pierce 	\N	69570.0	50.0	W
1907	ячейка для диализа в малом объеме	Slide-A-Lyzer MINI Dialysis Device, 20K MWCO, 0.1mL 	Pierce 	\N	69590.0	50.0	W
1908	пробирки для афинной хроматографии в малом объеме	SigmaPrep™ spin column	Sigma	\N	SC1000-1KT	25.0	W
1909	Разделитель листов 12 цв.пл. А4 файлы-вкладыши с ярлыками-карм.Dur6633 		комус	\N	107353.0	уп. 	O
1910	Папка на 2-х кольцах Linear 35 мм,синий 102Q-2K 		комус	\N	107935.0	шт. 	O
1911	Папка скорос-тель с пружин. механ-м ATTACHE F612/045 зелен. 		комус	\N	112327.0	шт. 	O
1912	Папка скорос-тель с пружин. механ-м ATTACHE F612/045 красн. 		комус	\N	112328.0	шт. 	O
1913	Папка скорос-тель с пружин. механ-м ATTACHE F612/045 черн.1 		комус	\N	112330.0	шт. 	O
1914	Скрепки 28 мм 100 шт./уп. ATTACHE С28-100П цветные, к/кор. 		комус	\N	115673.0	уп. 	O
1915	Скрепки 50 мм 50 шт./уп. ATTACHE Г50-50 гофриров., к/кор. 		комус	\N	115674.0	уп. 	O
1916	Папка с арочн.мех. BANTEX 50мм 1451-24 лайм Россия-Дания 		комус	\N	118113.0	шт. 	O
1917	Планшет BANTEX 4201-01 A4 синий Россия 		комус	\N	12635.0	шт. 	O
1918	Тетрадь 60л. клетка А4 Графо обл. картон (П) 15шт/уп. 		комус	\N	129818.0	шт. 	O
1919	Разделитель листов 1-20 цв.карт.REXEL 75699,A4 		комус	\N	130774.0	уп. 	O
1920	Блокнот ATTACHE спираль А6 40л. клетка офис 60шт/уп. (БК) 		комус	\N	132001.0	шт. 	O
1921	Блок-кубик запасной 9х9х5 ATTACHE (ЭК) цветной блок 24шт./уп. 		комус	\N	138529.0	шт. 	O
1922	Блок-кубик на склейке 9х9х5 ATTACHE (ЭК) цветной блок 24шт/уп 		комус	\N	139541.0	шт. 	O
1923	Клейкая лента двусторонняя 3M SCOTCH 136R2 12ммх6,3м, 2 шт. блистер 		комус	\N	141302.0	уп. 	O
1924	Маркер перманент SCHNEIDER 1-3мм, черный, Германия 		комус	\N	141394.0	шт. 	O
1925	Папка с арочн.мех. Attache 50мм черная (фикс.мех-м) 		комус	\N	142070.0	шт. 	O
1926	Папка с арочн.мех. Attache 50мм синяя (фикс.мех-м) 		комус	\N	142071.0	шт. 	O
1927	Папка с арочн.мех. Attache 75мм синяя (фикс.мех-м) 		комус	\N	142075.0	шт. 	O
1928	Папка с арочн.мех. Attache 75мм зеленая (фикс.мех-м) 		комус	\N	142076.0	шт. 	O
1929	Папка файл-вкладыш А4 40мкм Attache с перфорацией,100 шт. 		комус	\N	142363.0	уп. 	O
1930	Папка файл-вкладыш А4 30мкм Attache с перфорацией,100 шт. 		комус	\N	143505.0	уп. 	O
1931	Клейкая лента упаковочная Attache 50x50 коричневая 40 мкр. 		комус	\N	143756.0	шт. 	O
1932	Клейкая лента упаковочная Attache 50x50 прозрачная 40 мкр. 		комус	\N	143757.0	шт. 	O
1933	Тетрадь 60л. клетка А4 ATTACHE спираль обл.мел.карт. лакир. Полин 		комус	\N	15142.0	шт. 	O
1934	Тетрадь бл.120л. клетка А4 спираль обл.мел.карт. (лакир.) ATTACHE 		комус	\N	15145.0	шт. 	O
1935	Носители информации CD-RW VS 80 4-12x CB/10 		комус	\N	166393.0	уп. 	O
1936	Клей -карандаш 20г KORES 		комус	\N	17152.0	шт. 	O
1937	Маркер перманент ICO TOP B 3мм 4шт./уп. Венгрия 		комус	\N	19203.0	уп. 	O
1938	Папка с арочн.мех. CRONA 50мм Чехия (разборн.) 		комус	\N	25954.0	шт. 	O
1939	Папка с арочн.мех. CRONA 75мм Чехия (разборн.) 		комус	\N	25955.0	шт. 	O
1940	Папка файлов ATTACHE KT-80/1 синяя Россия 		комус	\N	26631.0	шт. 	O
1941	Папка с арочн.мех. LEITZ L-1080 80мм серый корешок Россия 		комус	\N	27927.0	шт. 	O
1942	Папка с арочн.мех. ATTACHE 75мм черн.с реестром Чехия (разборн.) 		комус	\N	3356.0	шт. 	O
1943	Вертикальный накопитель 2 отдел. 240мм Attache черный '1С54 		комус	\N	33568.0	шт. 	O
1944	Вертикальный накопитель 3 отдел. 240мм Attache черный '1С55 		комус	\N	33569.0	шт. 	O
1945	Степлер KW-trio 50LB особо мощный на 240л. 		комус	\N	3655.0	шт. 	O
1946	Разделитель листов 12л. цифровые пластик. 6211 Bantex/6412 IPL Дания 		комус	\N	3696.0	уп. 	O
1947	Карандаш чернографитный KOH-I-NOOR 1500/HB Чехия 		комус	\N	43314.0	шт. 	O
1948	Маркер перманент EDDING E-370/3 круглый наконечник 1мм синий Герман 		комус	\N	43839.0	шт. 	O
1949	Бумага для офис.техники HP OFFICE (А4,80г,153%CIE,Светогорск) 500л/пач. 		комус	\N	47372.0	пач. 	O
1950	Планшет BANTEX 4201-10 A4 черный Россия 		комус	\N	48801.0	шт. 	O
1951	Папка конверт с кнопкой КНК 180 синий прз. Россия 		комус	\N	49093.0	шт. 	O
1952	Папка конверт с кнопкой КНК 180 красный прз. Россия 		комус	\N	49094.0	шт. 	O
1953	Папка конверт с кнопкой КНК 180 желтый прз. Россия 		комус	\N	49095.0	шт. 	O
1954	Папка конверт с кнопкой КНК 180 зеленый прз. Россия 		комус	\N	49096.0	шт. 	O
1955	Блок-кубик запасной 9х9х9 ATTACHE цветной блок 12шт./уп. 		комус	\N	49757.0	шт. 	O
1956	Папка файлов ATTACHE KT-30/07 серая Россия 		комус	\N	50846.0	шт. 	O
1957	Анти-степлер SAX 700 красный Австрия 		комус	\N	50961.0	шт. 	O
1958	Разделитель листов разделительные полоски Bantex 1999-04 зелен.100шт./уп. 		комус	\N	56873.0	уп. 	O
1959	Клей жидкий 30г KORES с поролоновым дозатором 		комус	\N	5780.0	шт. 	O
1960	Блокнот на спирали А5 60л. ATTACHE синий картон д/лог.клет.32 		комус	\N	61355.0	шт. 	O
1961	Клейкая лента монтажные квадраты 3M SCOTCH 111, 25х25мм, 16шт.(до 900г) 		комус	\N	62008.0	уп. 	O
1962	Разделитель листов 5 цв. пласт. ESSELTE 100211 прозр. титульный лист 		комус	\N	62141.0	уп. 	O
1963	Ручка гелевая MORRIS с резин.корпусом синяя Корея 		комус	\N	6355.0	шт. 	O
1964	Стержень гелев. 130мм MORRIS 0,7мм синий Корея 		комус	\N	6370.0	шт. 	O
1965	Скрепки 25 мм 100 шт./уп. KORES никелиров. круглые 		комус	\N	65494.0	уп. 	O
1966	Освежитель воздуха Гигиен. блок д/унитаза ТУАЛЕТНЫЙ УТЕНОК ассорт. (зап.бло 		комус	\N	70999.0	шт. 	O
1967	Зажим для бумаг 32мм 12шт./уп. Тайвань/Китай 		комус	\N	73594.0	уп. 	O
1968	Зажим для бумаг 51мм 12шт./уп. Тайвань/Китай 		комус	\N	73598.0	уп. 	O
1969	Папка с арочн.мех. ATTACHE 50мм красн.с реестром Чехия (разборн. 		комус	\N	77909.0	шт. 	O
1970	Папка с арочн.мех. ATTACHE 75мм зел.с реестром Чехия (разборн.) 		комус	\N	77913.0	шт. 	O
1971	Стержень микрографический 0,5 PILOT PPL-5 12 грифелей 		комус	\N	78176.0	уп. 	O
1972	Разделитель листов 10 цв. картон 100193 Esselte 		комус	\N	87624.0	уп. 	O
1973	Скрепки 25 мм 100 шт./кп. SDI 731 треугольные никелиров. Тайвань 		комус	\N	9142.0	уп. 	O
1974	Тетрадь 60л. клетка А4 ATTACHE classic обл. лакир. картон 15шт/уп. 		комус	\N	95562.0	шт. 	O
1975	эндонуклеаза рестрикции	Apa I   5000 u	Fermentas	\N	ER1415	1.0	F
1976	эндонуклеаза рестрикции	BamH1 4000 u	Fermentas	\N	ER0051	1.0	F
1977	эндонуклеаза рестрикции	Bcl I  1000 u	Fermentas	\N	ER0721	1.0	F
1978	эндонуклеаза рестрикции	BcuI (SpeI) 400 u	Fermentas	\N	ER1251	1.0	F
1979	эндонуклеаза рестрикции	Bgl II    2500 u	Fermentas	\N	ER0082	1.0	F
1980	эндонуклеаза рестрикции	Cfr42I (Sac II) 1200 u	Fermentas	\N	ER0201	1.0	F
1981	эндонуклеаза рестрикции	Cfr9I  1500 u	Fermentas	\N	ER0172	1.0	F
1982	эндонуклеаза рестрикции	Eco147I 1000 u	Fermentas	\N	ER0421	1.0	F
1983	эндонуклеаза рестрикции	Eco32I  (EcoRV) 2000 u	Fermentas	\N	ER0301	1.0	F
1984	эндонуклеаза рестрикции	EcoR I 5000 u	Fermentas	\N	ER0271	1.0	F
1985	эндонуклеаза рестрикции	EheI 500 u	Fermentas	\N	ER0441	1.0	F
1986	эндонуклеаза рестрикции	Hind III 5000 u	Fermentas	\N	ER0501	1.0	F
1987	эндонуклеаза рестрикции	Kpn2I 500 u	Fermentas	\N	ER0531	1.0	F
1988	эндонуклеаза рестрикции	KpnI  4000 u	Fermentas	\N	ER0521	1.0	F
1989	эндонуклеаза рестрикции	NcoI 500 u	Fermentas	\N	ER0571	1.0	F
1990	эндонуклеаза рестрикции	NdeI 500 u	Fermentas	\N	ER0581	1.0	F
1991	эндонуклеаза рестрикции	NheI 500 u	Fermentas	\N	ER0971	1.0	F
1992	эндонуклеаза рестрикции	NotI 1500 u	Fermentas	\N	ER0592	1.0	F
1993	эндонуклеаза рестрикции	PstI 3000 u	Fermentas	\N	ER0611	1.0	F
1994	эндонуклеаза рестрикции	PvuI 300 u	Fermentas	\N	ER0621	1.0	F
1995	эндонуклеаза рестрикции	PvuII 5000 u 	Fermentas	\N	ER0635	1.0	F
1996	эндонуклеаза рестрикции	SacI 2000 u	Fermentas	\N	ER1135	1.0	F
1997	эндонуклеаза рестрикции	SalI 1500 u	Fermentas	\N	ER0641	1.0	F
1998	эндонуклеаза рестрикции	ScaI 1000 u	Fermentas	\N	ER0431	1.0	F
1999	эндонуклеаза рестрикции	SmaI 1200 u	Fermentas	\N	ER0661	1.0	F
2000	эндонуклеаза рестрикции	XbaI 1500 u 	Fermentas	\N	ER0681	1.0	F
2001	эндонуклеаза рестрикции	XhoI 2000 u	Fermentas	\N	ER0691	1.0	F
2002	Taq ДНК-полимераза (рекомбинантная)	Taq DNA Polymerase (recombinant)  100 u	Fermentas	\N	EP0401	1.0	F
2003	Taq ДНК-полимераза (рекомбинантная)	Taq DNA Polymerase (recombinant)  500 u	Fermentas	\N	EP0405	5.0	F
2004	обратная транскриптаза RevertAid™ M-MuLV 	RevertAid™ Reverse Transcriptase 10000u	Fermentas	\N	EP0441	1.0	F
2005	Фрагмент Кленова (ДНК-полимераза I, Большой фрагмент) 	Klenow Fragment	Fermentas	\N	EP0052	1.0	F
2006	5-бромо-4-хлоро-3-индоил-бета-D-галактопиранозид	X-Gal	Fermentas	\N	R0401	0,5 g	F
2007	Изопропил-β-D-1-тиогалактопиранозид	IPTG	Fermentas	\N	R0392	5 g	F
2008	Смесь dNTP, 10 мM\n	dNTP Mix, 10 mM each	Fermentas	\N	R0192	1 ml	F
2009	ДНК-маркер в растворе для нанесения на гель  100 п.н.	GeneRuler™ 100 bp Plus DNA Ladder, ready-to-use, 100-3000 bp 	Fermentas	\N	SM0324	5 х 50 мкг	F
2010	50 п.н. ДНК-маркер	GeneRuler™ 50 bp DNA Ladder, 50-1000 bp 	Fermentas	\N	SM0372	5 х 50 мкг	F
2011	ДНК-маркер в растворе для нанесения на гель 1000 п.н.	GeneRuler™ 1 kb DNA Ladder, ready-to-use, 250-10,000 bp	Fermentas	\N	SM0313	5 х 50 мкг	F
2012	Гексамер произв. послед. (компонент RT наборов) 	Random Hexamer Primer 	Fermentas	\N	SO142	120мкл	F
2013	Раствор с красителями для нанесения образцов на гель	6xOrange loading buffer	Fermentas	\N	R0631	5*1ml	F
2014	T4 ДНК-лигаза	T4 DNA Ligase 250 u	Invitrogen	\N	15224-041	1.0	F
2015	Набор для измерения количества ДНК на 1000 измерений	Quant-iT™ dsDNA HS assay kit 1000	Invitrogen	\N	Q33120	1.0	F
2016	Набор для измерения концентрации РНК на 100 измерений	Quant-iT™ RNA assay kit 100	Invitrogen	\N	Q32852	1.0	F
2017	ДНК-полимераза	AccuPrime™ Pfx DNA Polymerase	Invitrogen	\N	12344-024	1.0	F
2018	Протеиназа К	Proteinase K  lyophilized  from Tritirachium album 	Applichem	\N	A3830,0025	25 mg	F
2019	РНазин  (препарат для ингибирования рибонуклез)	RNasin® Plus RNase Inhibitor 10000 u	Promega	\N	N2615	1.0	F
2020	набор для двойного люциферазного теста	Dual-Luciferase® Reporter Assay System 10-Pack	Promega	\N	E1960	1*10	F
2021	дезоксирибонуклеаза 1	RQ1 RNase-Free DNase 1000 u	Promega	\N	M6101	1.0	F
2022	Гексамер произв. послед. мечен.	Pd(N6) Random Hexamer 5’-Posphate, Sodium Salt 50 A260 units	GE Healthcare	\N	27-2166-01	1.0	F
2023	ДНК-полимераза	PfuUltra Hotstart DNA Polymerase, 1000U 	Agilent Technologies	\N	600394.0	1.0	F
2024	вода для молекулярной биологии	HyPure™ Water, molecular biology grade, DNase, RNase, protease free (no activity\nwithin assay detectability limits), deionised, distilled, 0.1μm sterile filtered (SH30538.02)	HyClone	\N	HYC-001-219A	  500mL	F
2025	набор для очистки ПЦР продуктов	MinElute® PCR Purification Kit (50)	QIAGEN	\N	28004.0	1.0	F
2026	набор для выделения и стабилизации РНК	RNeasy Protect Mini Kit (50)	QIAGEN	\N	74124.0	1.0	F
2027	 набор для выделения РНК из тканей с большим содержанием жира 	RNeasy Lipid Tissue Midi Kit (50)	QIAGEN	\N	74804.0	1.0	F
2028	набор для выделения РНК	Qiagen RNeasy Plus Mini Kit (50) 	QIAGEN	\N	74134.0	1.0	F
2029	Раствор для стабилизации РНК	RNAlater RNA Stabilization Reagent 	QIAGEN	\N	76106.0	250 ml	F
2030	набор для выделения РНК	RNeasy® Mini Kit (50)	QIAGEN	\N	74104.0	1.0	F
2031	набор для выделения ДНК из геля	QIAquick Gel Extraction Kit (250)	QIAGEN	\N	28706.0	1.0	F
2032	набор для выделения ДНК	HiSpeed Plasmid Midi Kit (25)	QIAGEN	\N	12643.0	1.0	F
2033	набор для выделения фрагментов ДНК из геля	JetSorb Gel Extraction Kit/ 150	Genomed	\N	110150.0	1.0	F
2034	набор для серебрения ПААГ	Silver stain kit for proteins	Sigma	\N	85181-1EA	1.0	F
2035	Набор для выделения плазмидной ДНК GenElute Plasmid Miniprep Kit, 350 выделений	GenElute™ Plasmid Miniprep Kit - sufficient for 350 purifications	Sigma	\N	PLN350	1.0	F
2036	Набор для определения белка BCA	Bicinchoninic Acid solution	Sigma	\N	B9643	1 L	F
2037	Инулин	Inulin from chicory	Sigma	\N	I2255	10 g	F
2038	D-маннитол	D-mannitol	Sigma	\N	M9546	250 g	F
2039	полимер 3100	3100 POP-4 TM  Performance Optimized Polymer	Applied Biosystems	\N	4316355.0	7 ml	F
2040	капилляр	3130xl and 3100 Capillary Array, 16 x 36 cm Capillaries	Applied Biosystems	\N	4315931.0	1/Pkg	F
2041	буфер для ген анализа	Genetic Analyzer 10X Running Buffer with EDTA	Applied Biosystems	\N	402824.0	25 ml	F
2042	формамид для ген анализа	Hi-Di TM  Formamide, Genetic Analysis Grade	Applied Biosystems	\N	4311320.0	25 ml	F
2043	96-луночный планшет	MicroAmp ®  96 Well Reaction Plate (no barcode)	Applied Biosystems	\N	N8010560	10/Pkg	F
2044	крышка для 96-луночный планшета	96 Well Plate Septa	Applied Biosystems	\N	4315933.0	20/Pkg	F
2045	стандарт для  GeneScan	GeneScan-500 LIZ Size Standard	Applied Biosystems	\N	4322682.0	800 Loads	F
2046	набор реагентов для амплицикации ДНК	GenePak® PCR Core	Isogene Lab. Ltd	\N	U1010-08	12*8	F
2047	ДНКаза 	Deoxyribonuclease I from bovine pancreas\nStandardized vial containing 2,000 Kunitz units of DNase I (D4527), vial of ≥0.5 mg total protein	Sigma	\N	D4263-5VL	5*0,5g	F
2048	пленка лабораторная	DuraSeal™ laboratory stretch film roll size 4 in. × 250 ft	Sigma	\N	D3172-1EA	1.0	U
\.


--
-- Data for Name: orders_wish; Type: TABLE DATA; Schema: public; Owner: annndrey
--

COPY orders_wish (id, stuff_id, pieces, price_man, price_rus, order_date, user_id, urgent, status, comment) FROM stdin;
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_key; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_message_pkey; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_key; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_key; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_key; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_key; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: orders_stuff_pkey; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY orders_stuff
    ADD CONSTRAINT orders_stuff_pkey PRIMARY KEY (id);


--
-- Name: orders_wish_pkey; Type: CONSTRAINT; Schema: public; Owner: annndrey; Tablespace: 
--

ALTER TABLE ONLY orders_wish
    ADD CONSTRAINT orders_wish_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_message_user_id; Type: INDEX; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE INDEX auth_message_user_id ON auth_message USING btree (user_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: orders_wish_stuff_id; Type: INDEX; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE INDEX orders_wish_stuff_id ON orders_wish USING btree (stuff_id);


--
-- Name: orders_wish_user_id; Type: INDEX; Schema: public; Owner: annndrey; Tablespace: 
--

CREATE INDEX orders_wish_user_id ON orders_wish USING btree (user_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: annndrey
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: annndrey
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: annndrey
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: annndrey
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: annndrey
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: annndrey
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: annndrey
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: annndrey
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_wish_stuff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: annndrey
--

ALTER TABLE ONLY orders_wish
    ADD CONSTRAINT orders_wish_stuff_id_fkey FOREIGN KEY (stuff_id) REFERENCES orders_stuff(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_wish_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: annndrey
--

ALTER TABLE ONLY orders_wish
    ADD CONSTRAINT orders_wish_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_7ceef80f; Type: FK CONSTRAINT; Schema: public; Owner: annndrey
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_7ceef80f FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_dfbab7d; Type: FK CONSTRAINT; Schema: public; Owner: annndrey
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_dfbab7d FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

