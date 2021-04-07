--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-3.pgdg90+1)
-- Dumped by pg_dump version 11.5 (Debian 11.5-3.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ab_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_permission (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.ab_permission OWNER TO postgres;

--
-- Name: ab_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_id_seq OWNER TO postgres;

--
-- Name: ab_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ab_permission_id_seq OWNED BY public.ab_permission.id;


--
-- Name: ab_permission_view; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_permission_view (
    id integer NOT NULL,
    permission_id integer,
    view_menu_id integer
);


ALTER TABLE public.ab_permission_view OWNER TO postgres;

--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_permission_view_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_id_seq OWNER TO postgres;

--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ab_permission_view_id_seq OWNED BY public.ab_permission_view.id;


--
-- Name: ab_permission_view_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_permission_view_role (
    id integer NOT NULL,
    permission_view_id integer,
    role_id integer
);


ALTER TABLE public.ab_permission_view_role OWNER TO postgres;

--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_permission_view_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_role_id_seq OWNER TO postgres;

--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ab_permission_view_role_id_seq OWNED BY public.ab_permission_view_role.id;


--
-- Name: ab_register_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_register_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    email character varying(64) NOT NULL,
    registration_date timestamp without time zone,
    registration_hash character varying(256)
);


ALTER TABLE public.ab_register_user OWNER TO postgres;

--
-- Name: ab_register_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_register_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_register_user_id_seq OWNER TO postgres;

--
-- Name: ab_register_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ab_register_user_id_seq OWNED BY public.ab_register_user.id;


--
-- Name: ab_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_role (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.ab_role OWNER TO postgres;

--
-- Name: ab_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_role_id_seq OWNER TO postgres;

--
-- Name: ab_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ab_role_id_seq OWNED BY public.ab_role.id;


--
-- Name: ab_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    active boolean,
    email character varying(64) NOT NULL,
    last_login timestamp without time zone,
    login_count integer,
    fail_login_count integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.ab_user OWNER TO postgres;

--
-- Name: ab_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_id_seq OWNER TO postgres;

--
-- Name: ab_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ab_user_id_seq OWNED BY public.ab_user.id;


--
-- Name: ab_user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_user_role (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.ab_user_role OWNER TO postgres;

--
-- Name: ab_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_user_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_role_id_seq OWNER TO postgres;

--
-- Name: ab_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ab_user_role_id_seq OWNED BY public.ab_user_role.id;


--
-- Name: ab_view_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_view_menu (
    id integer NOT NULL,
    name character varying(250) NOT NULL
);


ALTER TABLE public.ab_view_menu OWNER TO postgres;

--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_view_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_view_menu_id_seq OWNER TO postgres;

--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ab_view_menu_id_seq OWNED BY public.ab_view_menu.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: connection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.connection (
    id integer NOT NULL,
    conn_id character varying(250) NOT NULL,
    conn_type character varying(500) NOT NULL,
    host character varying(500),
    schema character varying(500),
    login character varying(500),
    password character varying(5000),
    port integer,
    extra character varying(5000),
    is_encrypted boolean,
    is_extra_encrypted boolean,
    description text
);


ALTER TABLE public.connection OWNER TO postgres;

--
-- Name: connection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.connection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connection_id_seq OWNER TO postgres;

--
-- Name: connection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.connection_id_seq OWNED BY public.connection.id;


--
-- Name: dag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dag (
    dag_id character varying(250) NOT NULL,
    is_paused boolean,
    is_subdag boolean,
    is_active boolean,
    last_scheduler_run timestamp with time zone,
    last_pickled timestamp with time zone,
    last_expired timestamp with time zone,
    scheduler_lock boolean,
    pickle_id integer,
    fileloc character varying(2000),
    owners character varying(2000),
    description text,
    default_view character varying(25),
    schedule_interval text,
    root_dag_id character varying(250),
    next_dagrun timestamp with time zone,
    next_dagrun_create_after timestamp with time zone,
    concurrency integer NOT NULL,
    has_task_concurrency_limits boolean NOT NULL
);


ALTER TABLE public.dag OWNER TO postgres;

--
-- Name: dag_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dag_code (
    fileloc_hash bigint NOT NULL,
    fileloc character varying(2000) NOT NULL,
    source_code text NOT NULL,
    last_updated timestamp with time zone NOT NULL
);


ALTER TABLE public.dag_code OWNER TO postgres;

--
-- Name: dag_pickle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dag_pickle (
    id integer NOT NULL,
    pickle bytea,
    created_dttm timestamp with time zone,
    pickle_hash bigint
);


ALTER TABLE public.dag_pickle OWNER TO postgres;

--
-- Name: dag_pickle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dag_pickle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dag_pickle_id_seq OWNER TO postgres;

--
-- Name: dag_pickle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dag_pickle_id_seq OWNED BY public.dag_pickle.id;


--
-- Name: dag_run; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dag_run (
    id integer NOT NULL,
    dag_id character varying(250),
    execution_date timestamp with time zone,
    state character varying(50),
    run_id character varying(250),
    external_trigger boolean,
    conf bytea,
    end_date timestamp with time zone,
    start_date timestamp with time zone,
    run_type character varying(50) NOT NULL,
    last_scheduling_decision timestamp with time zone,
    dag_hash character varying(32),
    creating_job_id integer
);


ALTER TABLE public.dag_run OWNER TO postgres;

--
-- Name: dag_run_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dag_run_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dag_run_id_seq OWNER TO postgres;

--
-- Name: dag_run_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dag_run_id_seq OWNED BY public.dag_run.id;


--
-- Name: dag_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dag_tag (
    name character varying(100) NOT NULL,
    dag_id character varying(250) NOT NULL
);


ALTER TABLE public.dag_tag OWNER TO postgres;

--
-- Name: import_error; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.import_error (
    id integer NOT NULL,
    "timestamp" timestamp with time zone,
    filename character varying(1024),
    stacktrace text
);


ALTER TABLE public.import_error OWNER TO postgres;

--
-- Name: import_error_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.import_error_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.import_error_id_seq OWNER TO postgres;

--
-- Name: import_error_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.import_error_id_seq OWNED BY public.import_error.id;


--
-- Name: job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job (
    id integer NOT NULL,
    dag_id character varying(250),
    state character varying(20),
    job_type character varying(30),
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    latest_heartbeat timestamp with time zone,
    executor_class character varying(500),
    hostname character varying(500),
    unixname character varying(1000)
);


ALTER TABLE public.job OWNER TO postgres;

--
-- Name: job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_id_seq OWNER TO postgres;

--
-- Name: job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_id_seq OWNED BY public.job.id;


--
-- Name: log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log (
    id integer NOT NULL,
    dttm timestamp with time zone,
    dag_id character varying(250),
    task_id character varying(250),
    event character varying(30),
    execution_date timestamp with time zone,
    owner character varying(500),
    extra text
);


ALTER TABLE public.log OWNER TO postgres;

--
-- Name: log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_id_seq OWNER TO postgres;

--
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_id_seq OWNED BY public.log.id;


--
-- Name: rendered_task_instance_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rendered_task_instance_fields (
    dag_id character varying(250) NOT NULL,
    task_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    rendered_fields json NOT NULL,
    k8s_pod_yaml json
);


ALTER TABLE public.rendered_task_instance_fields OWNER TO postgres;

--
-- Name: sensor_instance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sensor_instance (
    id integer NOT NULL,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    state character varying(20),
    try_number integer,
    start_date timestamp with time zone,
    operator character varying(1000) NOT NULL,
    op_classpath character varying(1000) NOT NULL,
    hashcode bigint NOT NULL,
    shardcode integer NOT NULL,
    poke_context text NOT NULL,
    execution_context text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.sensor_instance OWNER TO postgres;

--
-- Name: sensor_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sensor_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sensor_instance_id_seq OWNER TO postgres;

--
-- Name: sensor_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sensor_instance_id_seq OWNED BY public.sensor_instance.id;


--
-- Name: serialized_dag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serialized_dag (
    dag_id character varying(250) NOT NULL,
    fileloc character varying(2000) NOT NULL,
    fileloc_hash bigint NOT NULL,
    data json NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    dag_hash character varying(32) DEFAULT 'Hash not calculated yet'::character varying NOT NULL
);


ALTER TABLE public.serialized_dag OWNER TO postgres;

--
-- Name: sla_miss; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sla_miss (
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    email_sent boolean,
    "timestamp" timestamp with time zone,
    description text,
    notification_sent boolean
);


ALTER TABLE public.sla_miss OWNER TO postgres;

--
-- Name: slot_pool; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slot_pool (
    id integer NOT NULL,
    pool character varying(256),
    slots integer,
    description text
);


ALTER TABLE public.slot_pool OWNER TO postgres;

--
-- Name: slot_pool_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.slot_pool_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slot_pool_id_seq OWNER TO postgres;

--
-- Name: slot_pool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.slot_pool_id_seq OWNED BY public.slot_pool.id;


--
-- Name: task_fail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_fail (
    id integer NOT NULL,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    duration integer
);


ALTER TABLE public.task_fail OWNER TO postgres;

--
-- Name: task_fail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_fail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_fail_id_seq OWNER TO postgres;

--
-- Name: task_fail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_fail_id_seq OWNED BY public.task_fail.id;


--
-- Name: task_instance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_instance (
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    duration double precision,
    state character varying(20),
    try_number integer,
    hostname character varying(1000),
    unixname character varying(1000),
    job_id integer,
    pool character varying(50) NOT NULL,
    queue character varying(256),
    priority_weight integer,
    operator character varying(1000),
    queued_dttm timestamp with time zone,
    pid integer,
    max_tries integer DEFAULT '-1'::integer,
    executor_config bytea,
    pool_slots integer,
    queued_by_job_id integer,
    external_executor_id character varying(250)
);


ALTER TABLE public.task_instance OWNER TO postgres;

--
-- Name: task_reschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_reschedule (
    id integer NOT NULL,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    try_number integer NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    duration integer NOT NULL,
    reschedule_date timestamp with time zone NOT NULL
);


ALTER TABLE public.task_reschedule OWNER TO postgres;

--
-- Name: task_reschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_reschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_reschedule_id_seq OWNER TO postgres;

--
-- Name: task_reschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_reschedule_id_seq OWNED BY public.task_reschedule.id;


--
-- Name: variable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variable (
    id integer NOT NULL,
    key character varying(250),
    val text,
    is_encrypted boolean
);


ALTER TABLE public.variable OWNER TO postgres;

--
-- Name: variable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.variable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variable_id_seq OWNER TO postgres;

--
-- Name: variable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.variable_id_seq OWNED BY public.variable.id;


--
-- Name: xcom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xcom (
    key character varying(512) NOT NULL,
    value bytea,
    "timestamp" timestamp with time zone NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL
);


ALTER TABLE public.xcom OWNER TO postgres;

--
-- Name: ab_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission ALTER COLUMN id SET DEFAULT nextval('public.ab_permission_id_seq'::regclass);


--
-- Name: ab_permission_view id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view ALTER COLUMN id SET DEFAULT nextval('public.ab_permission_view_id_seq'::regclass);


--
-- Name: ab_permission_view_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view_role ALTER COLUMN id SET DEFAULT nextval('public.ab_permission_view_role_id_seq'::regclass);


--
-- Name: ab_register_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_register_user ALTER COLUMN id SET DEFAULT nextval('public.ab_register_user_id_seq'::regclass);


--
-- Name: ab_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_role ALTER COLUMN id SET DEFAULT nextval('public.ab_role_id_seq'::regclass);


--
-- Name: ab_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user ALTER COLUMN id SET DEFAULT nextval('public.ab_user_id_seq'::regclass);


--
-- Name: ab_user_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user_role ALTER COLUMN id SET DEFAULT nextval('public.ab_user_role_id_seq'::regclass);


--
-- Name: ab_view_menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_view_menu ALTER COLUMN id SET DEFAULT nextval('public.ab_view_menu_id_seq'::regclass);


--
-- Name: connection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connection ALTER COLUMN id SET DEFAULT nextval('public.connection_id_seq'::regclass);


--
-- Name: dag_pickle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dag_pickle ALTER COLUMN id SET DEFAULT nextval('public.dag_pickle_id_seq'::regclass);


--
-- Name: dag_run id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dag_run ALTER COLUMN id SET DEFAULT nextval('public.dag_run_id_seq'::regclass);


--
-- Name: import_error id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.import_error ALTER COLUMN id SET DEFAULT nextval('public.import_error_id_seq'::regclass);


--
-- Name: job id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job ALTER COLUMN id SET DEFAULT nextval('public.job_id_seq'::regclass);


--
-- Name: log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log ALTER COLUMN id SET DEFAULT nextval('public.log_id_seq'::regclass);


--
-- Name: sensor_instance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_instance ALTER COLUMN id SET DEFAULT nextval('public.sensor_instance_id_seq'::regclass);


--
-- Name: slot_pool id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slot_pool ALTER COLUMN id SET DEFAULT nextval('public.slot_pool_id_seq'::regclass);


--
-- Name: task_fail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_fail ALTER COLUMN id SET DEFAULT nextval('public.task_fail_id_seq'::regclass);


--
-- Name: task_reschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_reschedule ALTER COLUMN id SET DEFAULT nextval('public.task_reschedule_id_seq'::regclass);


--
-- Name: variable id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variable ALTER COLUMN id SET DEFAULT nextval('public.variable_id_seq'::regclass);


--
-- Data for Name: ab_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_permission (id, name) FROM stdin;
1	can_read
2	can_edit
3	can_delete
4	can_create
5	menu_access
6	can_userinfo
7	can_this_form_post
8	userinfoedit
9	resetmypassword
10	can_this_form_get
11	can_add
12	can_show
13	can_list
14	can_download
15	copyrole
16	can_chart
17	can_get
18	clear
\.


--
-- Data for Name: ab_permission_view; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_permission_view (id, permission_id, view_menu_id) FROM stdin;
1	3	1
2	1	1
3	2	1
4	4	1
5	1	2
6	2	2
7	1	3
8	1	4
9	2	4
10	3	3
11	4	3
12	1	5
13	1	6
14	3	7
15	1	7
16	2	7
17	4	7
18	3	8
19	1	8
20	2	8
21	4	8
22	1	9
23	1	10
24	1	11
25	1	12
26	5	13
27	6	14
28	7	15
29	8	16
30	6	17
31	1	18
32	5	12
33	9	16
34	6	19
35	1	20
36	5	3
37	5	21
38	5	4
39	10	22
40	5	23
41	1	24
42	6	25
43	6	16
44	5	5
45	10	15
46	5	26
47	5	24
48	1	13
49	7	22
50	4	4
51	2	3
52	3	4
53	3	2
54	5	7
55	5	1
56	5	27
57	5	8
58	3	9
59	5	9
60	1	28
61	5	28
62	10	34
63	7	34
64	11	19
65	3	19
66	2	19
67	12	19
68	13	19
69	14	19
70	8	19
71	5	36
72	5	37
73	11	38
74	3	38
75	2	38
76	12	38
77	13	38
78	14	38
79	15	38
80	5	39
81	16	40
82	5	41
83	13	42
84	12	42
85	3	42
86	13	43
87	5	44
88	13	45
89	5	46
90	13	47
91	5	48
92	17	49
93	18	3
94	5	11
95	4	9
96	5	52
97	5	53
98	5	54
99	5	55
100	1	56
101	2	56
102	1	57
103	2	57
104	1	58
105	2	58
106	1	59
107	2	59
108	1	60
109	2	60
110	1	61
111	2	61
112	1	62
113	2	62
\.


--
-- Data for Name: ab_permission_view_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_permission_view_role (id, permission_view_id, role_id) FROM stdin;
1	23	3
2	25	3
3	7	3
4	26	3
5	27	3
6	28	3
7	29	3
8	30	3
9	31	3
10	8	3
11	32	3
12	13	3
13	33	3
14	34	3
15	5	3
16	22	3
17	35	3
18	12	3
19	36	3
20	24	3
21	37	3
22	38	3
23	39	3
24	40	3
25	41	3
26	42	3
27	43	3
28	44	3
29	45	3
30	46	3
31	47	3
32	48	3
33	49	3
34	23	4
35	25	4
36	7	4
37	26	4
38	27	4
39	28	4
40	29	4
41	30	4
42	31	4
43	8	4
44	32	4
45	11	4
46	10	4
47	13	4
48	33	4
49	50	4
50	34	4
51	51	4
52	5	4
53	22	4
54	35	4
55	12	4
56	36	4
57	52	4
58	24	4
59	37	4
60	9	4
61	38	4
62	39	4
63	40	4
64	41	4
65	42	4
66	53	4
67	43	4
68	6	4
69	44	4
70	45	4
71	46	4
72	47	4
73	48	4
74	49	4
75	17	5
76	23	5
77	25	5
78	16	5
79	54	5
80	2	5
81	19	5
82	7	5
83	26	5
84	27	5
85	28	5
86	29	5
87	30	5
88	31	5
89	8	5
90	4	5
91	32	5
92	1	5
93	11	5
94	21	5
95	18	5
96	10	5
97	13	5
98	3	5
99	20	5
100	33	5
101	50	5
102	55	5
103	34	5
104	51	5
105	5	5
106	22	5
107	35	5
108	12	5
109	36	5
110	52	5
111	56	5
112	24	5
113	37	5
114	9	5
115	38	5
116	39	5
117	40	5
118	57	5
119	58	5
120	41	5
121	42	5
122	53	5
123	43	5
124	6	5
125	15	5
126	59	5
127	44	5
128	45	5
129	46	5
130	47	5
131	48	5
132	14	5
133	49	5
134	17	1
135	23	1
136	25	1
137	16	1
138	54	1
139	2	1
140	19	1
141	7	1
142	26	1
143	27	1
144	28	1
145	29	1
146	30	1
147	31	1
148	8	1
149	4	1
150	32	1
151	1	1
152	11	1
153	21	1
154	18	1
155	10	1
156	13	1
157	3	1
158	20	1
159	33	1
160	50	1
161	55	1
162	34	1
163	51	1
164	5	1
165	22	1
166	35	1
167	12	1
168	36	1
169	52	1
170	56	1
171	24	1
172	37	1
173	9	1
174	38	1
175	39	1
176	60	1
177	40	1
178	57	1
179	58	1
180	41	1
181	42	1
182	53	1
183	43	1
184	6	1
185	15	1
186	59	1
187	44	1
188	45	1
189	61	1
190	46	1
191	47	1
192	48	1
193	14	1
194	49	1
195	62	1
196	63	1
197	64	1
198	65	1
199	66	1
200	67	1
201	68	1
202	69	1
203	70	1
204	71	1
205	72	1
206	73	1
207	74	1
208	75	1
209	76	1
210	77	1
211	78	1
212	79	1
213	80	1
214	81	1
215	82	1
216	83	1
217	84	1
218	85	1
219	86	1
220	87	1
221	88	1
222	89	1
223	90	1
224	91	1
225	92	1
226	93	1
227	94	1
228	95	1
229	96	1
230	97	1
231	98	1
232	99	1
\.


--
-- Data for Name: ab_register_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_register_user (id, first_name, last_name, username, password, email, registration_date, registration_hash) FROM stdin;
\.


--
-- Data for Name: ab_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_role (id, name) FROM stdin;
1	Admin
2	Public
3	Viewer
4	User
5	Op
\.


--
-- Data for Name: ab_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_user (id, first_name, last_name, username, password, active, email, last_login, login_count, fail_login_count, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
1	Admin	User	admin	pbkdf2:sha256:150000$Lc8yB7eJ$c2e711b4f5f1980efcfc37241c8a086e3396a87f1681bbc9fcc1d3fd5e727f0f	t	admin@gmail.com	\N	\N	\N	2021-04-04 06:11:54.963652	2021-04-04 06:11:54.963677	\N	\N
\.


--
-- Data for Name: ab_user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_user_role (id, user_id, role_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: ab_view_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_view_menu (id, name) FROM stdin;
1	Connections
2	DAGs
3	DAG Runs
4	Task Instances
5	Audit Logs
6	ImportError
7	Pools
8	Variables
9	XComs
10	DAG Code
11	Configurations
12	SLA Misses
13	Plugins
14	UserLDAPModelView
15	UserInfoEditView
16	UserDBModelView
17	UserOIDModelView
18	Task Logs
19	UserOAuthModelView
20	Website
21	Browse
22	ResetMyPasswordView
23	Docs
24	Jobs
25	UserRemoteUserModelView
26	Documentation
27	Admin
28	Task Reschedules
29	IndexView
30	UtilView
31	LocaleView
32	SecurityApi
33	RegisterUserOAuthView
34	ResetPasswordView
35	AuthOAuthView
36	List Users
37	Security
38	RoleModelView
39	List Roles
40	UserStatsChartView
41	User's Statistics
42	RegisterUserModelView
43	PermissionModelView
44	Base Permissions
45	ViewMenuModelView
46	Views/Menus
47	PermissionViewModelView
48	Permission on Views/Menus
49	MenuApi
50	Airflow
51	RedocView
52	Airflow Website
53	GitHub Repo
54	REST API Reference (Swagger UI)
55	REST API Reference (Redoc)
56	DAG:kube-pod-operator
57	DAG:process_etl_linear
58	DAG:eod_processing
59	DAG:download_rocket_launches
60	DAG:k8s-pod-operator-spark
61	DAG:k8s-pod-operator-spark-init
62	DAG:etl_conditional
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
e959f08ac86c
\.


--
-- Data for Name: connection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.connection (id, conn_id, conn_type, host, schema, login, password, port, extra, is_encrypted, is_extra_encrypted, description) FROM stdin;
1	airflow_db	mysql	mysql	airflow	root	\N	\N	\N	f	f	\N
2	aws_default	aws	\N	\N	\N	\N	\N	\N	f	f	\N
3	azure_batch_default	azure_batch	\N	\N	<ACCOUNT_NAME>	\N	\N	gAAAAABgaVij6LSWEPf22SdntYEimmLLp27oiZu-8_TzXRjqTgMSdThhPwBtRZrduXbpNFhdxBRmzjcMP_qBmXEJ1CFnphsbEW5tGdoIVniyri8XlIwe2-u5ImV_yVDi-Z2s2v4ruD2R	f	t	\N
4	azure_container_instances_default	azure_container_instances	\N	\N	\N	\N	\N	gAAAAABgaVijbhtgma8maa6JiPfkQrieGw1MWXuGooPNZzkom1nXnZDLv0-M9hTvgcGBLS6fid_5ehLuJCPUIJ-61OA_SGrqtWc_f0pZpgSrvg7dsDWEPRww1F6V_gzGrmMQUekBxljBEfnIeNWlQW3Opc5Bd0L_7i3MSIBvacZ_8VZSFAcSFZo=	f	t	\N
5	azure_cosmos_default	azure_cosmos	\N	\N	\N	\N	\N	gAAAAABgaVijXCQA-eOY-DKpTQQfg6lOEYHwG8I_Aq_QBN7XYFeWneqxD_b6AmTKXOVFbO5mxdBes2-ckz5z68gw15qrZN62TJAiXfaqbiVFelemSU2VSGN5-zSACOqVWZqmstMBsut7TtsPHFW3eVUrzghpQIMJqhLdnK-JpZNWrD5ntRMr-ec=	f	t	\N
6	azure_data_explorer_default	azure_data_explorer	https://<CLUSTER>.kusto.windows.net	\N	\N	\N	\N	gAAAAABgaVijU9mprIhGuqUBd5MA9coYd35rmzQWA-AwvtSDQ-e1e1YBHF4vv1g6bhpK9jf-VXIs4BHsexRyrenGutyBSS5hl14LS8LorSuuzmczdBb_6ANWEWzZ2x8BPsw1AoTtiCGXAdOdpcjo9dU-FS16CmgEeAp6sF6CD9hQ7ByChprtaE9q-8LtZUYmMYgIrD9lz5nK72iSIrcnOLXYt9pl9pChAY43zF2xORjoNwJpjvARPQ38PmrgUuddxruYWPKtWrnEfIjkS8evE2pSZ6neo1lOUyVIROmWf6eEIO_lA3YG9uqxhIHQNLlCkpIrrK5JqNiiYpMUp7sRyBd1A_GDnNfFReCJBXBKPPRtZxiOqxYGjymHF5_3DqARY1g7237kKUlh	f	t	\N
7	azure_data_lake_default	azure_data_lake	\N	\N	\N	\N	\N	gAAAAABgaVijjZBNeVXpzEyYqLDbWNfG9JPyUtYicdOMcCO6Ys8emau7xnwG3IDIp3W-ApdWupOVd-vruKxHgooQanjxwIpqMHX0lj8pgFpzK6cgHVWQRz7qit8cl5fiyVKSuNfnqEtDVZFhgCLnI9JUTg8ti4H9Rg==	f	t	\N
8	cassandra_default	cassandra	cassandra	\N	\N	\N	9042	\N	f	f	\N
9	databricks_default	databricks	localhost	\N	\N	\N	\N	\N	f	f	\N
10	dingding_default	http		\N	\N	\N	\N	\N	f	f	\N
11	druid_broker_default	druid	druid-broker	\N	\N	\N	8082	gAAAAABgaVijKys6ZYA6FYTUYLCA5baqG6z_Xy3nYbdheIY3kCvuGp_uvwHwgUMkIkR3Eb_d6y2CCkpMZeOU6OkM0bOD_LbwASaFr_73lXQ0Rv3YjiuELXc=	f	t	\N
12	druid_ingest_default	druid	druid-overlord	\N	\N	\N	8081	gAAAAABgaVijBTbaTvtazNZFYvACzXyvgmvYIAGVyfKGx1mj-APKV_Nlz8oU7FNo8jT5a8bgAB_kZ8hyDysnqAN_VJFmLDv3Wr9jBqf7jEXhIt65WEO1P9G722algRFMryvWbAo336BH	f	t	\N
13	elasticsearch_default	elasticsearch	localhost	http	\N	\N	9200	\N	f	f	\N
14	emr_default	emr	\N	\N	\N	\N	\N	gAAAAABgaVijX7IFdqfhWJlE1rH-_PbvA_K3cbnIsdRe9HGYuop6kVxmRlDt6KY54ZrbQpv7v_3HGjgL_qOoY-3VfC7RuHkMnglEdk8s63B9yQzI8ZqF2Z6AUqc-nTWM_kU60-t09kjo2Yiwn-wj0mw5F5PUaQaMUFMGy1spky39lfxACTTe5rT9Hw0DXIbOrSD9MiYrv_fYhTm_acXfQeDaE-fs6SdfgFx4NBtqRYTO9BtBUyMpI5O-MNllwCTg5dCJdHJL3HwbjZTy_DiATra5VJMg_Lk39B0GLQeBPY2KGcrptRgJ7r4fl_it0OjfyDgWjpEHBjl8JMMCd4YFXrHboSZpH27hvuzKY7C8psltUf7SAdtg66xMP4ggRd0PFz7OwigZoXKU66ZNjCI222e3XSXUjD9-GyklelOqPzK1oxNu6FBfcbDgGoPu-hcnYaxH6xwLk9t7k2znzbty1zB14k2OKNQocsQK4O9U9zEVCpjt-G37MbqYDy15UAjj7YLthg0QOob1tMxTjC1yyx1OGytuGWAlvCKA5UyjKoUGckrqciN41G6tqLy4ls0qnUdLgmv7kb4zYi7MrjQDogjVhIC4oaycHlPMsUyp_-yrmaAHv_RxUD-ugmmpVK38VhrfViF5EF6SHKr6Q5CkpFFLa7SNmooeIO3rFtikiRfR9KjfSpp2pmn7iUVFX_W4aX97_PDOJcVWtCtBF72SmyTHuoPX7NgQH0Xe7vQdY9eoRfjbrhL-IzZIt7XZtaI-DrKlVj3jPk5vuAUhOvTcZGyL5F3bhraDFWJS8PwgZrgws9dlj8nO-ll4X87JGfizskEv_FjDC1LtHGG2wH1l17ZCvYnzVa1BLoWkt7zMZ91C2TiH_fvVcpbZwVNLwje-U-AIlQjNOCvIK1WcTplKu6xoL0ifkBQxV6xluXyZZBB5oeiyf1z_LjNzKWRnIvem6e6J1v_pCfbc5hrG0gxMFKx-WGwu52naGIV3FJbhKndMGgOJV4OPH3Z74IMTW7uNMVt3t1PqBZw3odWzalsNCgjiuYLbbIGR-nxQBRtN0lqR1tO5JbrF8Au_BcngO_yPaEpMdEDJUuBuOoKHMdwLo-mn82hxnVpDVIaBoFwbdp6lKUCHedv6bZQvmhqp3pQgPn-_mhalmy0dazooNcWI3rj7RHyhhfPJIR_8SOG8LSHmoEKudb4CJgOBACtknL3FIDXCYL8-4ELldIPMJeKu9ByRKL5ZRB1Qq-7f2byE4LvydU88TjDs9vWQrO3JmxGX0XHJNtT9tI-fLDd7xHZDjs4ZhgdP51R2bAgqXgisGYZjDPFFM37LsSZ8T6bZQvEb7IyMETMWoPBoualYge397RPb9QegWaXOqg2D0NwwPcOpGOJtFcbVRW2KshBTHqQb0CbaCsywtXmk6AbjNyxh_9A-HHkLNjI0HXku98i1XPkEEZW2ZnUw_ORYRrrmGwXakwg8ASSWMvhMaINdFiDUlfUda_-CemSzyEQX3GcUSbJ6aiCt4lD2bOxVx3pNAtfhtTP4YDAOcDVMLfm4BK8atr2NCwkNKqLUIbBYKCnfEDTyey2kkoTANE5PgTYgPSqvL3FE80WFjq8VJ81ByIH2gTZl3n5s1TKcBPDXsb7RpyVenbQuOkvxgAgQFKSlbc6hNbPa_T3ekGhWF5sGkoeu9AxyPmyA_o8iUkjsfDun_ljH7q3x-fZV7ptTgQS8RMaI8eYzF4V4xGSskqLu9zHvvSpxewSprHNVnZw6SuEm3eKJcLmeEfN9t5eyNY6dM3lwaawFNJsto1kQFgHG9xHPL63ouEo5rJOVEQsPoYkXzLgrSTdIU59O0T8Nbj6fQSxbA_hiBdn4hvz6Vf39HZQU961L-Y9Dk1Crs85qglvRTFhZyHtdL-KS7lkh_81K1Y977bCl-TevNZ0LPsovDK-3hnS8tCSFA9075GrDJ0VqfI_tHauJaKq8uvsRE3PO4F64bZ6oiPosjqRZuwDwnSVflqhJVLNEZ7vRg7hLZrEebrctZlTD1ZY0gAfPGzGoyLJ0DOxAMSVMBNcitwTktvIcxZN2wfbTfbD15iCDR4VStwIW4tfmFQsPi5mogr1mWjXLtCxo4PixysOpY9VU99AF33DEtdDsemqjyQIiWkY-NxWiv-VqYq3A8p5OYWtGwQwd1PoWo6mBAv28b2Y0Etxx1EHmFcqP-L2dt7ez6oe7T-KIAZpij5IdcBI6MKHzasjNRkYfSFu-ZgLQTSGfm3PEBxYUqzU5NfWHYDpm8T86xJpAiRrUDaF-z5K7tgm1Z0aeF1BuOd52QSyQHrjamoOehUyWaH8RY9QXiSyGXCQPXipE5tGk5YgHDwgjt5JL71NQHQkeJ7E3DMOEmJClpX4pFu8apTfb60aAc8oHeQC2CsahyxJnNft23gXmExJVmsYsPpsjkEtwVF7-78I-dzcZEMDWWYmLJ88ZSMdJ5qb8OdYgf8Vswjzw6TJU1WFBVbKAZkBhRYTRYi7T24oKOHUVRLF-d-LcirhMEs8qyaVuyHrhHvzi3HjGLoY=	f	t	\N
15	facebook_default	facebook_social	\N	\N	\N	\N	\N	gAAAAABgaVijJFJ7Du4dkQXyx_rtsC38HUQymsJRP14sztQigPAcIL6HPdQfaw5FYXRzO-fIl_Qr7boHPes4SDafdPQQo4P714lejWPt7T7fMUXDPRFmSGuSrS06vArlBttOs7F1ZGWlS1gI5GGmE23bS8GjGbdDl3OUJ8h8lQQfZbOgIhA5zEABdPAyWWAJdHJilSIOxfpYSneAZlJ2PUMUwVWKV-S5fx6dan5xQMUY1AQB-mY2_RCp_aeDkKzzmXY3tNbbtL_kB2J5VCknKWxaS1HNE_n3TXVOdg6Anm2PPcvmIsVRtb-kUxQ1bkMTpgU0huNLPh7GFUJr-d0-8sNcHBizlnbiTA5T7mQE8QyDk8YQr6MsOTB5tI7IttKWa48AdW15mvgrwyvKER0cgaLRVeSI13yEolV8h00R4gN0sfRvAHb059M=	f	t	\N
16	fs_default	fs	\N	\N	\N	\N	\N	gAAAAABgaVij3jyXcbhfUh1BAXqNMpSeUGHU25Etlp5odNyJ6TFUbk1Evu7QbsjTmXrwLagk_KjmQBBTpoJDsHkZyNmoFgpZAA==	f	t	\N
17	google_cloud_default	google_cloud_platform	\N	default	\N	\N	\N	\N	f	f	\N
18	hive_cli_default	hive_cli	localhost	default	\N	\N	10000	gAAAAABgaVijt3hEIdJzuIhW4FuFQcL3R_TlUGW8uhjcFuABwhQJdT29lEogU8PxxcdCqo0Wlp71PGlt2AfkLJ7lQjMOYs3OgYuL7hKi7Bz7fPajt5QHyeBgWPa30f1yerPiQuFRWxgX	f	t	\N
19	hiveserver2_default	hiveserver2	localhost	default	\N	\N	10000	\N	f	f	\N
20	http_default	http	https://www.httpbin.org/	\N	\N	\N	\N	\N	f	f	\N
21	kubernetes_default	kubernetes	\N	\N	\N	\N	\N	\N	f	f	\N
22	kylin_default	kylin	localhost	\N	ADMIN	gAAAAABgaVijHTZGz-Xvx0sqv9groFeTVeC-h3Jy8xjoivNu2ULppCFF35UU1AjyH1Qt4AjS2LZj4kztR2y0EfBcjOnAgaeMGg==	7070	\N	t	f	\N
23	livy_default	livy	livy	\N	\N	\N	8998	\N	f	f	\N
24	local_mysql	mysql	localhost	airflow	airflow	gAAAAABgaVijQvbw7lnnHh4nto4KA1xcSjUBJQrYg_HUyc_Uj9GYbDFM0tzfmPh8bezu1p0NkUlnuslSQ6YiRlMk3pg9Waq9ig==	\N	\N	t	f	\N
25	metastore_default	hive_metastore	localhost	\N	\N	\N	9083	gAAAAABgaVijAOX3T10mnk5z05_WQeT9cHxT6_MO-ZE4N8jIN8RWzAACaH6xGC6HqLjNuPAvbf29foRKH1cHlJg4W5X9fCZso4HAX2s4UuslRc_vu46KkiE=	f	t	\N
26	mongo_default	mongo	mongo	\N	\N	\N	27017	\N	f	f	\N
27	mssql_default	mssql	localhost	\N	\N	\N	1433	\N	f	f	\N
28	mysql_default	mysql	mysql	airflow	root	\N	\N	\N	f	f	\N
29	opsgenie_default	http		\N	\N	\N	\N	\N	f	f	\N
30	pig_cli_default	pig_cli	\N	default	\N	\N	\N	\N	f	f	\N
31	pinot_admin_default	pinot	localhost	\N	\N	\N	9000	\N	f	f	\N
32	pinot_broker_default	pinot	localhost	\N	\N	\N	9000	gAAAAABgaVijP7XV7O2rta6SRTuznWE7PMOSZzaHcQCSMyjdpeKLo0WbEcvHs9UNO_anJRQ7lrHtoGKiiuemYWr8dSD7EhGlsn6dZldMU1oPyfMRtfmioUecU4i4LmenEJSYJYJ2gBja	f	t	\N
33	postgres_default	postgres	postgres	airflow	postgres	gAAAAABgaVijlmKs_Vo1972cpJsBWd4smGkHTra8AInc9T7vVeJUQWtnVO9aYlLNG2BH1fhdbta8ecjODHfJQCF3YTOSN4i0yA==	\N	\N	t	f	\N
34	presto_default	presto	localhost	hive	\N	\N	3400	\N	f	f	\N
35	qubole_default	qubole	localhost	\N	\N	\N	\N	\N	f	f	\N
36	redis_default	redis	redis	\N	\N	\N	6379	gAAAAABgaVijKCRXJUmYpaVfmuu5x2G3Jg4EtN6zxMy5HFB3Z1ibIwx0C8OjdsCOlS3F5HNjCUURNZAnfk6Gnh4Jv2UAljHg3w==	f	t	\N
37	segment_default	segment	\N	\N	\N	\N	\N	gAAAAABgaVijQJ2mKMLFqaQTRTIdRc4QpDfkT1B036LVlAIoWTRyDeAe6_ldA7Tnb8Pahts_Cs3OcNf8YRDubZQCXJB1mjALuqGKgv2ebH0_33sy_L4vWQt6Ya84oXVqWNBKgSqnedtx	f	t	\N
38	sftp_default	sftp	localhost	\N	airflow	\N	22	gAAAAABgaVijCAtezJYNJXAg-jT0PWOKBwINbgFu2rU30StoiQ0tW99pwm2JoQGEzO9qZ6d3Cf3nvVIJs_8Q4c3pWVrm8vFeOAnhLU6_Vg4AIYEykYYZVqvUUNdzVZd0soeLefui8Ikr4YmBpkOc0tWB6zJMRzVMHw==	f	t	\N
39	spark_default	spark	yarn	\N	\N	\N	\N	gAAAAABgaVijfJcChqeEoyPTg_9RDtDm7ZY1AkT0y-jJv5b0E4-ROJXt--Kl7kPwev64FEHCIPju1NUN5MZMiB3jjA8gg5NJsVKAW-C8rg86RP_oZr25O4k=	f	t	\N
40	sqlite_default	sqlite	/tmp/sqlite_default.db	\N	\N	\N	\N	\N	f	f	\N
41	sqoop_default	sqoop	rdbms	\N	\N	\N	\N	\N	f	f	\N
42	ssh_default	ssh	localhost	\N	\N	\N	\N	\N	f	f	\N
43	tableau_default	tableau	https://tableau.server.url	\N	user	gAAAAABgaVijjPhcoxBzD8Ah7NyVrMGFhxOv--jySAUClTrhaWuIOHvmSk1mAOX7m28rgqJu57bHFwfkorVOFTjz6Oo_eVtCEg==	\N	gAAAAABgaVijkSfjpslVfaf0dpPPQW-xO18dwblbB2We8X6c_eEPrkMoOuU-S3NrbK-bBeMzyWweBpEGV9RMljbkEsDvafXHT1ZVxLfL7qCM6ssRbVXJrVw=	t	t	\N
44	vertica_default	vertica	localhost	\N	\N	\N	5433	\N	f	f	\N
45	wasb_default	wasb	\N	\N	\N	\N	\N	gAAAAABgaVij1pztv42LT5LqO94Oq7rVp-ghgAkiRl5jz0jIGzjIdUaD7LtaATbhcURYH845fr35epRk1JSTUyqohgqUA8lNPzu19JIBtf-297GmL1AKvQk=	f	t	\N
46	webhdfs_default	hdfs	localhost	\N	\N	\N	50070	\N	f	f	\N
47	yandexcloud_default	yandexcloud	\N	default	\N	\N	\N	\N	f	f	\N
\.


--
-- Data for Name: dag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dag (dag_id, is_paused, is_subdag, is_active, last_scheduler_run, last_pickled, last_expired, scheduler_lock, pickle_id, fileloc, owners, description, default_view, schedule_interval, root_dag_id, next_dagrun, next_dagrun_create_after, concurrency, has_task_concurrency_limits) FROM stdin;
kube-pod-operator	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/k8s-pod-operator.py	airflow	\N	tree	"@daily"	\N	2021-04-02 00:00:00+00	2021-04-03 00:00:00+00	16	f
process_etl_linear	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/etl-linear.py	airflow	\N	tree	"@daily"	\N	2021-03-28 00:00:00+00	2021-03-29 00:00:00+00	16	f
eod_processing	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/excluded/eod.py	airflow	\N	tree	"@daily"	\N	2021-03-21 00:00:00+00	2021-03-22 00:00:00+00	16	f
download_rocket_launches	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/excluded/first.py	airflow	\N	tree	"@daily"	\N	2021-03-21 00:00:00+00	2021-03-22 00:00:00+00	16	f
k8s-pod-operator-spark	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/k8s-pod-operator-spark.py	airflow	\N	tree	"@daily"	\N	2021-04-02 00:00:00+00	2021-04-03 00:00:00+00	16	f
k8s-pod-operator-spark-init	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/k8s-pod-operator-spark-init.py	airflow	\N	tree	"@daily"	\N	2021-04-02 00:00:00+00	2021-04-03 00:00:00+00	16	f
etl_conditional	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/etl-conditional.py	airflow	\N	tree	"@daily"	\N	2021-03-20 00:00:00+00	2021-03-21 00:00:00+00	16	f
\.


--
-- Data for Name: dag_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dag_code (fileloc_hash, fileloc, source_code, last_updated) FROM stdin;
18336183563814790	/opt/airflow/dags/etl-linear.py	import json\nimport pathlib\n\nimport airflow\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\n\ndag = DAG(\n   dag_id="process_etl_linear",\n   start_date=airflow.utils.dates.days_ago(7),\n   schedule_interval="@daily",\n)\n\nupload_input_to_s3 = BashOperator(\n   task_id="upload_input_to_s3",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\ndef _convert_to_parquet():\n    print("convert raw to parquet")\n\nconvert_to_parquet = PythonOperator(\n    task_id="convert_to_parquet",\n    python_callable=_convert_to_parquet,\n    dag=dag,\n)\n\n\ndef _load_into_database():\n    print("save data to a table")\n\nload_into_database = PythonOperator(\n    task_id="load_into_database",\n    python_callable=_load_into_database,\n    dag=dag,\n)\n\n\nsummary = BashOperator(\n    task_id="summary",\n    bash_command='echo "Finished processing input file"',\n    dag=dag,\n)\n\n\nupload_input_to_s3 >> convert_to_parquet >> load_into_database >> summary\n\n\n	2021-04-04 06:11:47.89591+00
21628937650928228	/opt/airflow/dags/k8s-pod-operator-spark.py	import json\nimport pathlib\n\nimport airflow\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\nfrom kubernetes.client import models as k8s\n\nfrom airflow.contrib.operators import kubernetes_pod_operator\n\n\nimport datetime\n\nfrom airflow import models\n\ndag = DAG(\n   dag_id="k8s-pod-operator-spark",\n   start_date=airflow.utils.dates.days_ago(2),\n   schedule_interval="@daily",\n)\n\n\nk8s_pod_dag_start = BashOperator(\n   task_id="start_kube_spark_process",\n   bash_command="echo trigger execution of bunch of spark containers",\n   dag=dag,\n)\nk8s_pod_dag_finish = BashOperator(\n   task_id="finish_kube_spark_process",\n   bash_command="echo end of execution",\n   dag=dag,\n)\nin_cluster=False\n\nspark_env_vars=[\n    {\n        "name": "SPARK_USER",\n        "value": "spark_user"\n    },\n    {\n        "name": "HADOOP_USER_NAME",\n        "value": "spark_user"\n    },\n    {\n        "name": "HADOOP_PROXY_USER",\n        "value": "spark_user"\n    },\n    {\n        "name": "SPARK_LOCAL_DIRS",\n        "value": "/tmp/data/spark-workdir"\n    },\n    {\n        "name": "SPARK_CONF_DIR",\n        "value": "/opt/spark/conf"\n    },\n    {\n        "name": "SPARK_APPLICATION_ID",\n        "value": "spark-406656d05d7f456f81fcde9530ae1d70"\n    },\n    {\n        "name": "SPARK_DRIVER_BIND_ADDRESS",\n        "valueFrom": {\n            "fieldRef": {\n                "apiVersion": "v1",\n                "fieldPath": "status.podIP"\n            }\n        }\n    },\n    {\n        "name": "EOD_DATE",\n        "value": "{{ ds }}"\n    }\n]\n\nk8s_spark_launcher = kubernetes_pod_operator.KubernetesPodOperator(\n    task_id='k8s-spark-launcher',\n    name='k8s-spark-launcher',\n    cmds=['/opt/spark/bin/spark-submit'],\n    arguments=[\n        '--master',\n        'k8s://https://kubernetes.default.svc.cluster.local:443',\n        '--deploy-mode',\n        'cluster',\n        '--name',\n        'hello',\n        '--class',\n        'demo.Count',\n        '--conf',\n        'spark.executor.instances=2',\n        '--conf',\n        'spark.kubernetes.container.image=skhatri/spark-k8s-hello:1.0.7',\n        '--conf',\n        'spark.jars.ivy=/tmp/.ivy',\n        '--conf',\n        'spark.app.name=hello',\n        '--conf',\n        'spark.kubernetes.authenticate.driver.serviceAccountName=job-trigger-sa',\n        '--conf',\n        'spark.authenticate=false',\n        'local:///opt/spark/app/spark-k8s-hello.jar'\n    ],\n    namespace='default',\n    image='skhatri/spark:v3.0.1',\n    in_cluster=in_cluster,\n    config_file='/tmp/k8s/minikube/config',\n    env_vars=spark_env_vars,\n    service_account_name='job-trigger-sa'\n)\n\n\nk8s_pod = kubernetes_pod_operator.KubernetesPodOperator(\n    task_id='k8s-pod',\n    name='k8s-pod',\n    cmds=['echo'],\n    namespace='default',\n    image='ubuntu:latest',\n    in_cluster=in_cluster,\n    config_file='/tmp/k8s/minikube/config'\n)\n\n\n\nk8s_pod_dag_start >> k8s_pod >> k8s_spark_launcher >> k8s_pod_dag_finish\n\n	2021-04-04 06:11:47.901326+00
14390090851810004	/opt/airflow/dags/k8s-pod-operator.py	import json\nimport pathlib\n\nimport airflow\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\nfrom kubernetes.client import models as k8s\n\nfrom airflow.contrib.operators import kubernetes_pod_operator\n\n\nimport datetime\n\nfrom airflow import models\n\ndag = DAG(\n   dag_id="kube-pod-operator",\n   start_date=airflow.utils.dates.days_ago(2),\n   schedule_interval="@daily",\n)\n\n\nstart_kube_process = BashOperator(\n   task_id="start_kube_process",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\n\nkube_files_volume_config = {\n    'name': 'minikube'\n}\n\nkube_files_volume = k8s.V1Volume(name='kube-files-volume', config_map=kube_files_volume_config)\nkube_files_volume_mount=k8s.V1VolumeMount(name='kube-files-volume', mount_path='/tmp/k8s')\nin_cluster=False\nkubernetes_min_pod = kubernetes_pod_operator.KubernetesPodOperator(\n    task_id='pod-ex-minimum',\n    name='pod-ex-minimum',\n    cmds=['echo'],\n    namespace='default',\n    image='ubuntu:latest',\n    in_cluster=in_cluster,\n    config_file='/tmp/k8s/minikube/config',\n    volumes=[kube_files_volume],\n    volume_mounts=[kube_files_volume_mount]\n    )\n\n\nrun_another_pod = kubernetes_pod_operator.KubernetesPodOperator(\n    task_id='run-another-pod',\n    name='run-another-pod',\n    cmds=['echo'],\n    namespace='default',\n    image='ubuntu:latest',\n    in_cluster=in_cluster,\n    config_file='/tmp/k8s/minikube/config'\n    )\n\n\n\n\nstart_kube_process >> kubernetes_min_pod >> run_another_pod\n\n	2021-04-04 06:11:47.902913+00
68711774077157549	/opt/airflow/dags/excluded/first.py	import json\nimport pathlib\n \nimport airflow\nimport requests\nimport requests.exceptions as requests_exceptions\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\n \ndag = DAG(\n   dag_id="download_rocket_launches",\n   start_date=airflow.utils.dates.days_ago(14),\n   schedule_interval="@daily",\n)\n \ndownload_launches = BashOperator(\n   task_id="download_launches",\n   bash_command="curl -o /tmp/launches.json 'https://launchlibrary.net/1.4/launch?next=5&mode=verbose'",\n   dag=dag,\n)\n \n \ndef _get_pictures():\n   # Ensure directory exists\n   pathlib.Path("/tmp/images").mkdir(parents=True, exist_ok=True)\n \n   # Download all pictures in launches.json\n   with open("/tmp/launches.json") as f:\n       launches = json.load(f)\n       image_urls = [launch["rocket"]["imageURL"] for launch in launches["launches"]]\n       for image_url in image_urls:\n           try:\n               response = requests.get(image_url)\n               image_filename = image_url.split("/")[-1]\n               target_file = f"/tmp/images/{image_filename}"\n               with open(target_file, "wb") as f:\n                   f.write(response.content)\n               print(f"Downloaded {image_url} to {target_file}")\n           except requests_exceptions.MissingSchema:\n               print(f"{image_url} appears to be an invalid URL.")\n           except requests_exceptions.ConnectionError:\n               print(f"Could not connect to {image_url}.")\n \n \nget_pictures = PythonOperator(\n   task_id="get_pictures",\n   python_callable=_get_pictures,\n   dag=dag,\n)\n \nnotify = BashOperator(\n   task_id="notify",\n   bash_command='echo "There are now $(ls /tmp/images/ | wc -l) images."',\n   dag=dag,\n)\n \ndownload_launches >> get_pictures >> notify\n\n\n	2021-04-04 06:11:47.904386+00
41676207298935373	/opt/airflow/dags/etl-conditional.py	import json\nimport pathlib\n\nimport airflow\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\nfrom airflow.operators.python_operator import BranchPythonOperator\n\ndag = DAG(\n   dag_id="etl_conditional",\n   start_date=airflow.utils.dates.days_ago(15),\n   schedule_interval="@daily",\n)\n\nec_upload_input_to_s3 = BashOperator(\n   task_id="ec_upload_input_to_s3",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\ndef _ec_convert_to_parquet():\n    print("convert raw to parquet")\n\nec_convert_to_parquet = PythonOperator(\n    task_id="ec_convert_to_parquet",\n    python_callable=_ec_convert_to_parquet,\n    dag=dag,\n)\n\n\ndef _ec_load_into_database():\n    print("save data to a table")\n\nec_load_into_database = PythonOperator(\n    task_id="ec_load_into_database",\n    python_callable=_ec_load_into_database,\n    dag=dag,\n)\n\n\ndef _ec_upload_output_to_s3():\n    print("upload data to s3")\n\nec_upload_output_to_s3 = PythonOperator(\n    task_id="ec_upload_output_to_s3",\n    python_callable=_ec_upload_output_to_s3,\n    dag=dag,\n)\n\ndef _choose_save_medium(execution_date):\n    if execution_date.day % 2 == 0:\n        return "ec_load_into_database"\n    return "ec_upload_output_to_s3"\n\n\nsave_output = BranchPythonOperator(\n    task_id='save-output-decision',\n    provide_context=True,\n    python_callable=_choose_save_medium\n)\n\nec_summary = BashOperator(\n    task_id="ec-summary",\n    bash_command='echo "Finished processing input file"',\n    dag=dag,\n)\n\n\nsave_output >> [ec_load_into_database, ec_upload_output_to_s3]\nec_upload_input_to_s3 >> ec_convert_to_parquet >> save_output >> ec_summary\n\n\n	2021-04-04 06:11:47.905583+00
41227235438583639	/opt/airflow/dags/k8s-pod-operator-spark-init.py	import json\nimport pathlib\n\nimport airflow\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\nfrom kubernetes.client import models as k8s\nfrom airflow.contrib.operators import kubernetes_pod_operator\n\n\nimport datetime\n\nfrom airflow import models\n\ndag = DAG(\n   dag_id="k8s-pod-operator-spark-init",\n   start_date=airflow.utils.dates.days_ago(2),\n   schedule_interval="@daily",\n)\n\n\nk8s_init_pod_dag_start = BashOperator(\n   task_id="start_kube_init_spark_process",\n   bash_command="echo trigger execution of bunch of spark containers",\n   dag=dag,\n)\nk8s_init_pod_dag_finish = BashOperator(\n   task_id="finish_kube_init_spark_process",\n   bash_command="echo end of execution",\n   dag=dag,\n)\nin_cluster=False\n\n\ndata_share_volume = k8s.V1Volume(name='data-shared-dir', empty_dir={})\n\ndata_write_secrets_mount= k8s.V1VolumeMount(mount_path="/tmp/out", name="data-shared-dir")\nconfiguring_init_container = k8s.V1Container(\n    name='secret-resolver',\n    image='ubuntu:latest',\n    command=['sh', '-c', 'echo {"user": "user1", "password": "secret"}|tee /tmp/out/hello'],\n    volume_mounts=[\n            data_write_secrets_mount\n    ],\n)\n\ndata_read_for_secrets_mount=k8s.V1VolumeMount(name='data-shared-dir', mount_path='/tmp/secrets')\n\nk8s_pod_with_init = kubernetes_pod_operator.KubernetesPodOperator(\n    task_id='k8s-pod-with-init',\n    name='k8s-pod',\n    cmds=['sh', '-c', 'cat /tmp/secrets/hello'],\n    namespace='default',\n    image='ubuntu:latest',\n    in_cluster=in_cluster,\n    config_file='/tmp/k8s/minikube/config',\n    init_containers=[configuring_init_container],\n    volumes=[data_share_volume],\n    volume_mounts=[\n        data_read_for_secrets_mount\n    ]    \n)\n\n\n\nk8s_init_pod_dag_start >> k8s_pod_with_init >> k8s_init_pod_dag_finish\n\n	2021-04-04 06:11:47.906977+00
59017706735592835	/opt/airflow/dags/excluded/eod.py	import json\nimport pathlib\n\nimport airflow\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\n\ndag = DAG(\n   dag_id="eod_processing",\n   start_date=airflow.utils.dates.days_ago(14),\n   schedule_interval="@daily",\n)\n\n\nreceive_account_file_from_ebbs = BashOperator(\n   task_id="receive_account_file_from_ebbs",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\ndef _convert_to_parquet():\n    print("convert raw to parquet")\n\nconvert_account_file_to_parquet = PythonOperator(\n    task_id="convert_account_file_to_parquet",\n    python_callable=_convert_to_parquet,\n    dag=dag,\n)\n\n\nreceive_txn_file_from_ebbs = BashOperator(\n   task_id="receive_txn_file_from_ebbs",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\nconvert_txn_file_to_parquet = PythonOperator(\n    task_id="convert_txn_file_to_parquet",\n    python_callable=_convert_to_parquet,\n    dag=dag,\n)\n\n\nreceive_staffhist_file_from_ebbs = BashOperator(\n   task_id="receive_staffhist_file_from_ebbs",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\nconvert_staffhist_file_to_parquet = PythonOperator(\n    task_id="convert_staffhist_file_to_parquet",\n    python_callable=_convert_to_parquet,\n    dag=dag,\n)\n\n\nreceive_balance_file_from_ebbs = BashOperator(\n   task_id="receive_balance_file_from_ebbs",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\nconvert_balance_file_to_parquet = PythonOperator(\n    task_id="convert_balance_file_to_parquet",\n    python_callable=_convert_to_parquet,\n    dag=dag,\n)\n\n\nreceive_bonus_exception_file_from_ebbs = BashOperator(\n   task_id="receive_bonus_exception_file_from_ebbs",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\nreceive_freetransfer_exception_file_from_ebbs = BashOperator(\n   task_id="receive_freetransfer_exception_file_from_ebbs",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\n\ndef _load_account_table():\n    print("save data to account table")\n\nload_account_table = PythonOperator(\n    task_id="load_account_table",\n    python_callable=_load_account_table,\n    dag=dag,\n)\n\n\ndef _load_transaction_table():\n    print("save data to transaction table")\n\nload_transaction_table = PythonOperator(\n    task_id="load_transaction_table",\n    python_callable=_load_transaction_table,\n    dag=dag,\n)\n\ndef _load_historical_balance():\n    print("save data to account table")\n\nload_historical_balance = PythonOperator(\n    task_id="load_historical_balance",\n    python_callable=_load_historical_balance,\n    dag=dag,\n)\n\n\ndef _free_transfer_quota_monthly():\n    print("save data to account table")\n\nfree_transfer_quota_monthly = PythonOperator(\n    task_id="free_transfer_quota_monthly",\n    python_callable=_free_transfer_quota_monthly,\n    dag=dag,\n)\n\n\ndef _bonus_interest_calc():\n    print("save data to account table")\n\nbonus_interest_calc = PythonOperator(\n    task_id="bonus_interest_calc",\n    python_callable=_bonus_interest_calc,\n    dag=dag,\n)\n\n\ndef _free_transfer_refund_daily():\n    print("save data to account table")\n\nfree_transfer_refund_daily = PythonOperator(\n    task_id="free_transfer_refund_daily",\n    python_callable=_free_transfer_refund_daily,\n    dag=dag,\n)\n\n\ndef _daily_account_summary():\n    print("save data to account table")\n\ndaily_account_summary = PythonOperator(\n    task_id="daily_account_summary",\n    python_callable=_daily_account_summary,\n    dag=dag,\n)\n\n\ngenerate_bonus_interest_file = BashOperator(\n    task_id="generate_bonus_interest_file",\n    bash_command='echo "Finished processing account file"',\n    dag=dag,\n)\n\ngenerate_free_transfer_file = BashOperator(\n    task_id="generate_free_transfer_file",\n    bash_command='echo "Generate Free Transfer File"',\n    dag=dag,\n)\n\n\n\n\n\n\nstart_eod_processing = BashOperator(\n    task_id="start_eod_processing",\n    bash_command='echo "Start processing EOD"',\n    dag=dag,\n)\n\nfinish_eod_processing = BashOperator(\n   task_id="finish_eod_processing",\n   bash_command='echo "Finish Processing EOD"',\n   dag=dag,\n)\n\n\nstart_eod_processing >> [ \n                            receive_account_file_from_ebbs, \n                            receive_txn_file_from_ebbs, \n                            receive_staffhist_file_from_ebbs,\n                            receive_balance_file_from_ebbs,\n                            receive_bonus_exception_file_from_ebbs,\n                            receive_freetransfer_exception_file_from_ebbs\n                        ]\n\n\nreceive_account_file_from_ebbs >> convert_account_file_to_parquet >> load_account_table\nreceive_txn_file_from_ebbs >> convert_txn_file_to_parquet >> [load_transaction_table, free_transfer_refund_daily]\nreceive_staffhist_file_from_ebbs >> convert_staffhist_file_to_parquet\nreceive_balance_file_from_ebbs >> convert_balance_file_to_parquet >> load_historical_balance\n\n[convert_account_file_to_parquet, convert_txn_file_to_parquet, convert_staffhist_file_to_parquet] >> bonus_interest_calc >> generate_bonus_interest_file\n[convert_account_file_to_parquet, convert_staffhist_file_to_parquet] >> free_transfer_quota_monthly\nfree_transfer_refund_daily >> generate_free_transfer_file\n[convert_account_file_to_parquet, convert_txn_file_to_parquet, convert_balance_file_to_parquet] >> daily_account_summary\n\n[load_historical_balance, generate_bonus_interest_file, free_transfer_quota_monthly, generate_free_transfer_file, daily_account_summary] >> finish_eod_processing\n\n	2021-04-04 06:11:47.908682+00
\.


--
-- Data for Name: dag_pickle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dag_pickle (id, pickle, created_dttm, pickle_hash) FROM stdin;
\.


--
-- Data for Name: dag_run; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dag_run (id, dag_id, execution_date, state, run_id, external_trigger, conf, end_date, start_date, run_type, last_scheduling_decision, dag_hash, creating_job_id) FROM stdin;
\.


--
-- Data for Name: dag_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dag_tag (name, dag_id) FROM stdin;
\.


--
-- Data for Name: import_error; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.import_error (id, "timestamp", filename, stacktrace) FROM stdin;
\.


--
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job (id, dag_id, state, job_type, start_date, end_date, latest_heartbeat, executor_class, hostname, unixname) FROM stdin;
2	\N	failed	SchedulerJob	2021-04-04 06:16:56.694987+00	\N	2021-04-04 06:17:42.513451+00	SequentialExecutor	6f3b6fb84bb7	airflow
3	\N	running	SchedulerJob	2021-04-04 06:19:07.520521+00	\N	2021-04-04 06:21:09.343018+00	SequentialExecutor	860f2796a82f	airflow
1	\N	failed	SchedulerJob	2021-04-04 06:11:56.8126+00	\N	2021-04-04 06:16:24.203567+00	SequentialExecutor	315547c4f294	airflow
\.


--
-- Data for Name: log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log (id, dttm, dag_id, task_id, event, execution_date, owner, extra) FROM stdin;
1	2021-04-04 06:11:51.34487+00	\N	\N	cli_users_create	\N	airflow	{"host_name": "315547c4f294", "full_command": "['/home/airflow/.local/bin/airflow', 'users', 'create', '-u', 'admin', '-p', '********', '-r', 'Admin', '-e', 'admin@gmail.com', '-f', 'Admin', '-l', 'User']"}
2	2021-04-04 06:11:56.789021+00	\N	\N	cli_scheduler	\N	airflow	{"host_name": "315547c4f294", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}
3	2021-04-04 06:11:59.701992+00	\N	\N	cli_webserver	\N	airflow	{"host_name": "315547c4f294", "full_command": "['/home/airflow/.local/bin/airflow', 'webserver']"}
4	2021-04-04 06:16:52.126086+00	\N	\N	cli_users_create	\N	airflow	{"host_name": "6f3b6fb84bb7", "full_command": "['/home/airflow/.local/bin/airflow', 'users', 'create', '-u', 'admin', '-p', '********', '-r', 'Admin', '-e', 'admin@gmail.com', '-f', 'Admin', '-l', 'User']"}
5	2021-04-04 06:16:56.67086+00	\N	\N	cli_scheduler	\N	airflow	{"host_name": "6f3b6fb84bb7", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}
6	2021-04-04 06:17:00.053853+00	\N	\N	cli_webserver	\N	airflow	{"host_name": "6f3b6fb84bb7", "full_command": "['/home/airflow/.local/bin/airflow', 'webserver']"}
7	2021-04-04 06:19:02.544489+00	\N	\N	cli_users_create	\N	airflow	{"host_name": "860f2796a82f", "full_command": "['/home/airflow/.local/bin/airflow', 'users', 'create', '-u', 'admin', '-p', '********', '-r', 'Admin', '-e', 'admin@gmail.com', '-f', 'Admin', '-l', 'User']"}
8	2021-04-04 06:19:07.500018+00	\N	\N	cli_scheduler	\N	airflow	{"host_name": "860f2796a82f", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}
9	2021-04-04 06:19:11.09326+00	\N	\N	cli_webserver	\N	airflow	{"host_name": "860f2796a82f", "full_command": "['/home/airflow/.local/bin/airflow', 'webserver']"}
\.


--
-- Data for Name: rendered_task_instance_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rendered_task_instance_fields (dag_id, task_id, execution_date, rendered_fields, k8s_pod_yaml) FROM stdin;
\.


--
-- Data for Name: sensor_instance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sensor_instance (id, task_id, dag_id, execution_date, state, try_number, start_date, operator, op_classpath, hashcode, shardcode, poke_context, execution_context, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: serialized_dag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serialized_dag (dag_id, fileloc, fileloc_hash, data, last_updated, dag_hash) FROM stdin;
process_etl_linear	/opt/airflow/dags/etl-linear.py	18336183563814790	{"__version": 1, "dag": {"fileloc": "/opt/airflow/dags/etl-linear.py", "schedule_interval": "@daily", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"upload_input_to_s3": ["operator", "upload_input_to_s3"], "convert_to_parquet": ["operator", "convert_to_parquet"], "load_into_database": ["operator", "load_into_database"], "summary": ["operator", "summary"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "start_date": 1616889600.0, "_dag_id": "process_etl_linear", "timezone": "UTC", "tasks": [{"template_fields": ["bash_command", "env"], "pool": "default_pool", "_downstream_task_ids": ["convert_to_parquet"], "label": "upload_input_to_s3", "ui_color": "#f0ede4", "_inlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "task_id": "upload_input_to_s3", "ui_fgcolor": "#000", "_outlets": [], "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "pool": "default_pool", "_downstream_task_ids": ["load_into_database"], "label": "convert_to_parquet", "ui_color": "#ffefeb", "_inlets": [], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "task_id": "convert_to_parquet", "ui_fgcolor": "#000", "_outlets": [], "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "pool": "default_pool", "_downstream_task_ids": ["summary"], "label": "load_into_database", "ui_color": "#ffefeb", "_inlets": [], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "task_id": "load_into_database", "ui_fgcolor": "#000", "_outlets": [], "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["bash_command", "env"], "pool": "default_pool", "_downstream_task_ids": [], "label": "summary", "ui_color": "#f0ede4", "_inlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "task_id": "summary", "ui_fgcolor": "#000", "_outlets": [], "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"Finished processing input file\\""}]}}	2021-04-04 06:11:47.933129+00	0a3be8d92105fc82a11a2d25e2cc6145
k8s-pod-operator-spark-init	/opt/airflow/dags/k8s-pod-operator-spark-init.py	41227235438583639	{"__version": 1, "dag": {"fileloc": "/opt/airflow/dags/k8s-pod-operator-spark-init.py", "schedule_interval": "@daily", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"start_kube_init_spark_process": ["operator", "start_kube_init_spark_process"], "finish_kube_init_spark_process": ["operator", "finish_kube_init_spark_process"], "k8s-pod-with-init": ["operator", "k8s-pod-with-init"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "start_date": 1617321600.0, "_dag_id": "k8s-pod-operator-spark-init", "timezone": "UTC", "tasks": [{"template_fields": ["bash_command", "env"], "pool": "default_pool", "_downstream_task_ids": ["k8s-pod-with-init"], "label": "start_kube_init_spark_process", "ui_color": "#f0ede4", "_inlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "task_id": "start_kube_init_spark_process", "ui_fgcolor": "#000", "_outlets": [], "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo trigger execution of bunch of spark containers"}, {"template_fields": ["bash_command", "env"], "pool": "default_pool", "_downstream_task_ids": [], "label": "finish_kube_init_spark_process", "ui_color": "#f0ede4", "_inlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "task_id": "finish_kube_init_spark_process", "ui_fgcolor": "#000", "_outlets": [], "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo end of execution"}, {"template_fields": ["image", "cmds", "arguments", "env_vars", "labels", "config_file", "pod_template_file"], "pool": "default_pool", "_downstream_task_ids": ["finish_kube_init_spark_process"], "label": "k8s-pod-with-init", "ui_color": "#fff", "_inlets": [], "template_fields_renderers": {}, "task_id": "k8s-pod-with-init", "ui_fgcolor": "#000", "_outlets": [], "do_xcom_push": false, "_task_type": "KubernetesPodOperator", "_task_module": "airflow.providers.cncf.kubernetes.operators.kubernetes_pod", "_is_dummy": false, "image": "ubuntu:latest", "cmds": ["sh", "-c", "cat /tmp/secrets/hello"], "arguments": [], "env_vars": [], "labels": {}, "config_file": "/tmp/k8s/minikube/config"}]}}	2021-04-04 06:11:47.939433+00	f706444046e4de4596212ef8032d0426
k8s-pod-operator-spark	/opt/airflow/dags/k8s-pod-operator-spark.py	21628937650928228	{"__version": 1, "dag": {"fileloc": "/opt/airflow/dags/k8s-pod-operator-spark.py", "schedule_interval": "@daily", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"start_kube_spark_process": ["operator", "start_kube_spark_process"], "finish_kube_spark_process": ["operator", "finish_kube_spark_process"], "k8s-pod": ["operator", "k8s-pod"], "k8s-spark-launcher": ["operator", "k8s-spark-launcher"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "start_date": 1617321600.0, "_dag_id": "k8s-pod-operator-spark", "timezone": "UTC", "tasks": [{"template_fields": ["bash_command", "env"], "pool": "default_pool", "_downstream_task_ids": ["k8s-pod"], "label": "start_kube_spark_process", "ui_color": "#f0ede4", "_inlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "task_id": "start_kube_spark_process", "ui_fgcolor": "#000", "_outlets": [], "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo trigger execution of bunch of spark containers"}, {"template_fields": ["bash_command", "env"], "pool": "default_pool", "_downstream_task_ids": [], "label": "finish_kube_spark_process", "ui_color": "#f0ede4", "_inlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "task_id": "finish_kube_spark_process", "ui_fgcolor": "#000", "_outlets": [], "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo end of execution"}, {"template_fields": ["image", "cmds", "arguments", "env_vars", "labels", "config_file", "pod_template_file"], "pool": "default_pool", "_downstream_task_ids": ["k8s-spark-launcher"], "label": "k8s-pod", "ui_color": "#fff", "_inlets": [], "template_fields_renderers": {}, "task_id": "k8s-pod", "ui_fgcolor": "#000", "_outlets": [], "do_xcom_push": false, "_task_type": "KubernetesPodOperator", "_task_module": "airflow.providers.cncf.kubernetes.operators.kubernetes_pod", "_is_dummy": false, "image": "ubuntu:latest", "cmds": ["echo"], "arguments": [], "env_vars": [], "labels": {}, "config_file": "/tmp/k8s/minikube/config"}, {"template_fields": ["image", "cmds", "arguments", "env_vars", "labels", "config_file", "pod_template_file"], "pool": "default_pool", "_downstream_task_ids": ["finish_kube_spark_process"], "label": "k8s-spark-launcher", "ui_color": "#fff", "_inlets": [], "template_fields_renderers": {}, "task_id": "k8s-spark-launcher", "ui_fgcolor": "#000", "_outlets": [], "do_xcom_push": false, "_task_type": "KubernetesPodOperator", "_task_module": "airflow.providers.cncf.kubernetes.operators.kubernetes_pod", "_is_dummy": false, "image": "skhatri/spark:v3.0.1", "cmds": ["/opt/spark/bin/spark-submit"], "arguments": ["--master", "k8s://https://kubernetes.default.svc.cluster.local:443", "--deploy-mode", "cluster", "--name", "hello", "--class", "demo.Count", "--conf", "spark.executor.instances=2", "--conf", "spark.kubernetes.container.image=skhatri/spark-k8s-hello:1.0.7", "--conf", "spark.jars.ivy=/tmp/.ivy", "--conf", "spark.app.name=hello", "--conf", "spark.kubernetes.authenticate.driver.serviceAccountName=job-trigger-sa", "--conf", "spark.authenticate=false", "local:///opt/spark/app/spark-k8s-hello.jar"], "env_vars": [{"name": "SPARK_USER", "value": "spark_user"}, {"name": "HADOOP_USER_NAME", "value": "spark_user"}, {"name": "HADOOP_PROXY_USER", "value": "spark_user"}, {"name": "SPARK_LOCAL_DIRS", "value": "/tmp/data/spark-workdir"}, {"name": "SPARK_CONF_DIR", "value": "/opt/spark/conf"}, {"name": "SPARK_APPLICATION_ID", "value": "spark-406656d05d7f456f81fcde9530ae1d70"}, {"name": "SPARK_DRIVER_BIND_ADDRESS", "valueFrom": {"fieldRef": {"apiVersion": "v1", "fieldPath": "status.podIP"}}}, {"name": "EOD_DATE", "value": "{{ ds }}"}], "labels": {}, "config_file": "/tmp/k8s/minikube/config"}]}}	2021-04-04 06:11:47.943977+00	54707719a18bf5debfdca4d737dfce87
kube-pod-operator	/opt/airflow/dags/k8s-pod-operator.py	14390090851810004	{"__version": 1, "dag": {"fileloc": "/opt/airflow/dags/k8s-pod-operator.py", "schedule_interval": "@daily", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"start_kube_process": ["operator", "start_kube_process"], "pod-ex-minimum": ["operator", "pod-ex-minimum"], "run-another-pod": ["operator", "run-another-pod"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "start_date": 1617321600.0, "_dag_id": "kube-pod-operator", "timezone": "UTC", "tasks": [{"template_fields": ["bash_command", "env"], "pool": "default_pool", "_downstream_task_ids": ["pod-ex-minimum"], "label": "start_kube_process", "ui_color": "#f0ede4", "_inlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "task_id": "start_kube_process", "ui_fgcolor": "#000", "_outlets": [], "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"template_fields": ["image", "cmds", "arguments", "env_vars", "labels", "config_file", "pod_template_file"], "pool": "default_pool", "_downstream_task_ids": ["run-another-pod"], "label": "pod-ex-minimum", "ui_color": "#fff", "_inlets": [], "template_fields_renderers": {}, "task_id": "pod-ex-minimum", "ui_fgcolor": "#000", "_outlets": [], "do_xcom_push": false, "_task_type": "KubernetesPodOperator", "_task_module": "airflow.providers.cncf.kubernetes.operators.kubernetes_pod", "_is_dummy": false, "image": "ubuntu:latest", "cmds": ["echo"], "arguments": [], "env_vars": [], "labels": {}, "config_file": "/tmp/k8s/minikube/config"}, {"template_fields": ["image", "cmds", "arguments", "env_vars", "labels", "config_file", "pod_template_file"], "pool": "default_pool", "_downstream_task_ids": [], "label": "run-another-pod", "ui_color": "#fff", "_inlets": [], "template_fields_renderers": {}, "task_id": "run-another-pod", "ui_fgcolor": "#000", "_outlets": [], "do_xcom_push": false, "_task_type": "KubernetesPodOperator", "_task_module": "airflow.providers.cncf.kubernetes.operators.kubernetes_pod", "_is_dummy": false, "image": "ubuntu:latest", "cmds": ["echo"], "arguments": [], "env_vars": [], "labels": {}, "config_file": "/tmp/k8s/minikube/config"}]}}	2021-04-04 06:11:47.948461+00	20d7a52a1737b24a7cbc346ad3676075
download_rocket_launches	/opt/airflow/dags/excluded/first.py	68711774077157549	{"__version": 1, "dag": {"fileloc": "/opt/airflow/dags/excluded/first.py", "schedule_interval": "@daily", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"download_launches": ["operator", "download_launches"], "get_pictures": ["operator", "get_pictures"], "notify": ["operator", "notify"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "start_date": 1616284800.0, "_dag_id": "download_rocket_launches", "timezone": "UTC", "tasks": [{"template_fields": ["bash_command", "env"], "pool": "default_pool", "_downstream_task_ids": ["get_pictures"], "label": "download_launches", "ui_color": "#f0ede4", "_inlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "task_id": "download_launches", "ui_fgcolor": "#000", "_outlets": [], "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "curl -o /tmp/launches.json 'https://launchlibrary.net/1.4/launch?next=5&mode=verbose'"}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "pool": "default_pool", "_downstream_task_ids": ["notify"], "label": "get_pictures", "ui_color": "#ffefeb", "_inlets": [], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "task_id": "get_pictures", "ui_fgcolor": "#000", "_outlets": [], "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["bash_command", "env"], "pool": "default_pool", "_downstream_task_ids": [], "label": "notify", "ui_color": "#f0ede4", "_inlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "task_id": "notify", "ui_fgcolor": "#000", "_outlets": [], "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"There are now $(ls /tmp/images/ | wc -l) images.\\""}]}}	2021-04-04 06:11:47.962008+00	b1f1f463ffe3bc67b05732475a6dc07a
etl_conditional	/opt/airflow/dags/etl-conditional.py	41676207298935373	{"__version": 1, "dag": {"schedule_interval": "@daily", "start_date": 1616198400.0, "_dag_id": "etl_conditional", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"ec_upload_input_to_s3": ["operator", "ec_upload_input_to_s3"], "ec_convert_to_parquet": ["operator", "ec_convert_to_parquet"], "ec_load_into_database": ["operator", "ec_load_into_database"], "ec_upload_output_to_s3": ["operator", "ec_upload_output_to_s3"], "ec-summary": ["operator", "ec-summary"], "save-output-decision": ["operator", "save-output-decision"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "timezone": "UTC", "fileloc": "/opt/airflow/dags/etl-conditional.py", "tasks": [{"template_fields": ["bash_command", "env"], "_outlets": [], "_inlets": [], "task_id": "ec_upload_input_to_s3", "ui_color": "#f0ede4", "label": "ec_upload_input_to_s3", "pool": "default_pool", "_downstream_task_ids": ["ec_convert_to_parquet"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_fgcolor": "#000", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "ec_convert_to_parquet", "ui_color": "#ffefeb", "label": "ec_convert_to_parquet", "pool": "default_pool", "_downstream_task_ids": ["save-output-decision"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "ec_load_into_database", "ui_color": "#ffefeb", "label": "ec_load_into_database", "pool": "default_pool", "_downstream_task_ids": [], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "ec_upload_output_to_s3", "ui_color": "#ffefeb", "label": "ec_upload_output_to_s3", "pool": "default_pool", "_downstream_task_ids": [], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["bash_command", "env"], "_outlets": [], "_inlets": [], "task_id": "ec-summary", "ui_color": "#f0ede4", "label": "ec-summary", "pool": "default_pool", "_downstream_task_ids": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_fgcolor": "#000", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"Finished processing input file\\""}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "save-output-decision", "ui_color": "#ffefeb", "label": "save-output-decision", "pool": "default_pool", "_downstream_task_ids": ["ec_upload_output_to_s3", "ec-summary", "ec_load_into_database"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "BranchPythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}]}}	2021-04-04 06:19:29.365164+00	861c339041020a5da043c3f51daf9afe
eod_processing	/opt/airflow/dags/excluded/eod.py	59017706735592835	{"__version": 1, "dag": {"schedule_interval": "@daily", "start_date": 1616284800.0, "_dag_id": "eod_processing", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"receive_account_file_from_ebbs": ["operator", "receive_account_file_from_ebbs"], "convert_account_file_to_parquet": ["operator", "convert_account_file_to_parquet"], "receive_txn_file_from_ebbs": ["operator", "receive_txn_file_from_ebbs"], "convert_txn_file_to_parquet": ["operator", "convert_txn_file_to_parquet"], "receive_staffhist_file_from_ebbs": ["operator", "receive_staffhist_file_from_ebbs"], "convert_staffhist_file_to_parquet": ["operator", "convert_staffhist_file_to_parquet"], "receive_balance_file_from_ebbs": ["operator", "receive_balance_file_from_ebbs"], "convert_balance_file_to_parquet": ["operator", "convert_balance_file_to_parquet"], "receive_bonus_exception_file_from_ebbs": ["operator", "receive_bonus_exception_file_from_ebbs"], "receive_freetransfer_exception_file_from_ebbs": ["operator", "receive_freetransfer_exception_file_from_ebbs"], "load_account_table": ["operator", "load_account_table"], "load_transaction_table": ["operator", "load_transaction_table"], "load_historical_balance": ["operator", "load_historical_balance"], "free_transfer_quota_monthly": ["operator", "free_transfer_quota_monthly"], "bonus_interest_calc": ["operator", "bonus_interest_calc"], "free_transfer_refund_daily": ["operator", "free_transfer_refund_daily"], "daily_account_summary": ["operator", "daily_account_summary"], "generate_bonus_interest_file": ["operator", "generate_bonus_interest_file"], "generate_free_transfer_file": ["operator", "generate_free_transfer_file"], "start_eod_processing": ["operator", "start_eod_processing"], "finish_eod_processing": ["operator", "finish_eod_processing"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "timezone": "UTC", "fileloc": "/opt/airflow/dags/excluded/eod.py", "tasks": [{"template_fields": ["bash_command", "env"], "_outlets": [], "_inlets": [], "task_id": "receive_account_file_from_ebbs", "ui_color": "#f0ede4", "label": "receive_account_file_from_ebbs", "pool": "default_pool", "_downstream_task_ids": ["convert_account_file_to_parquet"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_fgcolor": "#000", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "convert_account_file_to_parquet", "ui_color": "#ffefeb", "label": "convert_account_file_to_parquet", "pool": "default_pool", "_downstream_task_ids": ["daily_account_summary", "free_transfer_quota_monthly", "bonus_interest_calc", "load_account_table"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["bash_command", "env"], "_outlets": [], "_inlets": [], "task_id": "receive_txn_file_from_ebbs", "ui_color": "#f0ede4", "label": "receive_txn_file_from_ebbs", "pool": "default_pool", "_downstream_task_ids": ["convert_txn_file_to_parquet"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_fgcolor": "#000", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "convert_txn_file_to_parquet", "ui_color": "#ffefeb", "label": "convert_txn_file_to_parquet", "pool": "default_pool", "_downstream_task_ids": ["load_transaction_table", "daily_account_summary", "bonus_interest_calc", "free_transfer_refund_daily"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["bash_command", "env"], "_outlets": [], "_inlets": [], "task_id": "receive_staffhist_file_from_ebbs", "ui_color": "#f0ede4", "label": "receive_staffhist_file_from_ebbs", "pool": "default_pool", "_downstream_task_ids": ["convert_staffhist_file_to_parquet"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_fgcolor": "#000", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "convert_staffhist_file_to_parquet", "ui_color": "#ffefeb", "label": "convert_staffhist_file_to_parquet", "pool": "default_pool", "_downstream_task_ids": ["free_transfer_quota_monthly", "bonus_interest_calc"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["bash_command", "env"], "_outlets": [], "_inlets": [], "task_id": "receive_balance_file_from_ebbs", "ui_color": "#f0ede4", "label": "receive_balance_file_from_ebbs", "pool": "default_pool", "_downstream_task_ids": ["convert_balance_file_to_parquet"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_fgcolor": "#000", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "convert_balance_file_to_parquet", "ui_color": "#ffefeb", "label": "convert_balance_file_to_parquet", "pool": "default_pool", "_downstream_task_ids": ["load_historical_balance", "daily_account_summary"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["bash_command", "env"], "_outlets": [], "_inlets": [], "task_id": "receive_bonus_exception_file_from_ebbs", "ui_color": "#f0ede4", "label": "receive_bonus_exception_file_from_ebbs", "pool": "default_pool", "_downstream_task_ids": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_fgcolor": "#000", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"template_fields": ["bash_command", "env"], "_outlets": [], "_inlets": [], "task_id": "receive_freetransfer_exception_file_from_ebbs", "ui_color": "#f0ede4", "label": "receive_freetransfer_exception_file_from_ebbs", "pool": "default_pool", "_downstream_task_ids": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_fgcolor": "#000", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "load_account_table", "ui_color": "#ffefeb", "label": "load_account_table", "pool": "default_pool", "_downstream_task_ids": [], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "load_transaction_table", "ui_color": "#ffefeb", "label": "load_transaction_table", "pool": "default_pool", "_downstream_task_ids": [], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "load_historical_balance", "ui_color": "#ffefeb", "label": "load_historical_balance", "pool": "default_pool", "_downstream_task_ids": ["finish_eod_processing"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "free_transfer_quota_monthly", "ui_color": "#ffefeb", "label": "free_transfer_quota_monthly", "pool": "default_pool", "_downstream_task_ids": ["finish_eod_processing"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "bonus_interest_calc", "ui_color": "#ffefeb", "label": "bonus_interest_calc", "pool": "default_pool", "_downstream_task_ids": ["generate_bonus_interest_file"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "free_transfer_refund_daily", "ui_color": "#ffefeb", "label": "free_transfer_refund_daily", "pool": "default_pool", "_downstream_task_ids": ["generate_free_transfer_file"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["templates_dict", "op_args", "op_kwargs"], "_outlets": [], "_inlets": [], "task_id": "daily_account_summary", "ui_color": "#ffefeb", "label": "daily_account_summary", "pool": "default_pool", "_downstream_task_ids": ["finish_eod_processing"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_fgcolor": "#000", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"template_fields": ["bash_command", "env"], "_outlets": [], "_inlets": [], "task_id": "generate_bonus_interest_file", "ui_color": "#f0ede4", "label": "generate_bonus_interest_file", "pool": "default_pool", "_downstream_task_ids": ["finish_eod_processing"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_fgcolor": "#000", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"Finished processing account file\\""}, {"template_fields": ["bash_command", "env"], "_outlets": [], "_inlets": [], "task_id": "generate_free_transfer_file", "ui_color": "#f0ede4", "label": "generate_free_transfer_file", "pool": "default_pool", "_downstream_task_ids": ["finish_eod_processing"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_fgcolor": "#000", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"Generate Free Transfer File\\""}, {"template_fields": ["bash_command", "env"], "_outlets": [], "_inlets": [], "task_id": "start_eod_processing", "ui_color": "#f0ede4", "label": "start_eod_processing", "pool": "default_pool", "_downstream_task_ids": ["receive_balance_file_from_ebbs", "receive_staffhist_file_from_ebbs", "receive_freetransfer_exception_file_from_ebbs", "receive_account_file_from_ebbs", "receive_bonus_exception_file_from_ebbs", "receive_txn_file_from_ebbs"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_fgcolor": "#000", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"Start processing EOD\\""}, {"template_fields": ["bash_command", "env"], "_outlets": [], "_inlets": [], "task_id": "finish_eod_processing", "ui_color": "#f0ede4", "label": "finish_eod_processing", "pool": "default_pool", "_downstream_task_ids": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_fgcolor": "#000", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"Finish Processing EOD\\""}]}}	2021-04-04 06:19:29.644857+00	fa317bfbb91ee09ec7dfcaf823bd88bd
\.


--
-- Data for Name: sla_miss; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sla_miss (task_id, dag_id, execution_date, email_sent, "timestamp", description, notification_sent) FROM stdin;
\.


--
-- Data for Name: slot_pool; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.slot_pool (id, pool, slots, description) FROM stdin;
1	default_pool	128	Default pool
\.


--
-- Data for Name: task_fail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task_fail (id, task_id, dag_id, execution_date, start_date, end_date, duration) FROM stdin;
\.


--
-- Data for Name: task_instance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task_instance (task_id, dag_id, execution_date, start_date, end_date, duration, state, try_number, hostname, unixname, job_id, pool, queue, priority_weight, operator, queued_dttm, pid, max_tries, executor_config, pool_slots, queued_by_job_id, external_executor_id) FROM stdin;
\.


--
-- Data for Name: task_reschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task_reschedule (id, task_id, dag_id, execution_date, try_number, start_date, end_date, duration, reschedule_date) FROM stdin;
\.


--
-- Data for Name: variable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variable (id, key, val, is_encrypted) FROM stdin;
\.


--
-- Data for Name: xcom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xcom (key, value, "timestamp", execution_date, task_id, dag_id) FROM stdin;
\.


--
-- Name: ab_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_permission_id_seq', 18, true);


--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_permission_view_id_seq', 113, true);


--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_permission_view_role_id_seq', 232, true);


--
-- Name: ab_register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_register_user_id_seq', 1, false);


--
-- Name: ab_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_role_id_seq', 5, true);


--
-- Name: ab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_user_id_seq', 1, true);


--
-- Name: ab_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_user_role_id_seq', 1, true);


--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_view_menu_id_seq', 62, true);


--
-- Name: connection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.connection_id_seq', 47, true);


--
-- Name: dag_pickle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dag_pickle_id_seq', 1, false);


--
-- Name: dag_run_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dag_run_id_seq', 1, false);


--
-- Name: import_error_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.import_error_id_seq', 1, false);


--
-- Name: job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_id_seq', 3, true);


--
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_id_seq', 9, true);


--
-- Name: sensor_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sensor_instance_id_seq', 1, false);


--
-- Name: slot_pool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.slot_pool_id_seq', 1, true);


--
-- Name: task_fail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_fail_id_seq', 1, false);


--
-- Name: task_reschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_reschedule_id_seq', 1, false);


--
-- Name: variable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.variable_id_seq', 1, false);


--
-- Name: ab_permission ab_permission_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_name_key UNIQUE (name);


--
-- Name: ab_permission ab_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view ab_permission_view_permission_id_view_menu_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_view_menu_id_key UNIQUE (permission_id, view_menu_id);


--
-- Name: ab_permission_view ab_permission_view_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_role_id_key UNIQUE (permission_view_id, role_id);


--
-- Name: ab_permission_view_role ab_permission_view_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_username_key UNIQUE (username);


--
-- Name: ab_role ab_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_name_key UNIQUE (name);


--
-- Name: ab_role ab_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user ab_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_email_key UNIQUE (email);


--
-- Name: ab_user ab_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_user_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_role_id_key UNIQUE (user_id, role_id);


--
-- Name: ab_user ab_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_username_key UNIQUE (username);


--
-- Name: ab_view_menu ab_view_menu_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_name_key UNIQUE (name);


--
-- Name: ab_view_menu ab_view_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: connection connection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connection
    ADD CONSTRAINT connection_pkey PRIMARY KEY (id);


--
-- Name: dag_code dag_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dag_code
    ADD CONSTRAINT dag_code_pkey PRIMARY KEY (fileloc_hash);


--
-- Name: dag_pickle dag_pickle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dag_pickle
    ADD CONSTRAINT dag_pickle_pkey PRIMARY KEY (id);


--
-- Name: dag dag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dag
    ADD CONSTRAINT dag_pkey PRIMARY KEY (dag_id);


--
-- Name: dag_run dag_run_dag_id_execution_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT dag_run_dag_id_execution_date_key UNIQUE (dag_id, execution_date);


--
-- Name: dag_run dag_run_dag_id_run_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT dag_run_dag_id_run_id_key UNIQUE (dag_id, run_id);


--
-- Name: dag_run dag_run_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT dag_run_pkey PRIMARY KEY (id);


--
-- Name: dag_tag dag_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dag_tag
    ADD CONSTRAINT dag_tag_pkey PRIMARY KEY (name, dag_id);


--
-- Name: import_error import_error_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.import_error
    ADD CONSTRAINT import_error_pkey PRIMARY KEY (id);


--
-- Name: job job_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- Name: log log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY (id);


--
-- Name: xcom pk_xcom; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xcom
    ADD CONSTRAINT pk_xcom PRIMARY KEY (dag_id, task_id, key, execution_date);


--
-- Name: rendered_task_instance_fields rendered_task_instance_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rendered_task_instance_fields
    ADD CONSTRAINT rendered_task_instance_fields_pkey PRIMARY KEY (dag_id, task_id, execution_date);


--
-- Name: sensor_instance sensor_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_instance
    ADD CONSTRAINT sensor_instance_pkey PRIMARY KEY (id);


--
-- Name: serialized_dag serialized_dag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serialized_dag
    ADD CONSTRAINT serialized_dag_pkey PRIMARY KEY (dag_id);


--
-- Name: sla_miss sla_miss_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sla_miss
    ADD CONSTRAINT sla_miss_pkey PRIMARY KEY (task_id, dag_id, execution_date);


--
-- Name: slot_pool slot_pool_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slot_pool
    ADD CONSTRAINT slot_pool_pkey PRIMARY KEY (id);


--
-- Name: slot_pool slot_pool_pool_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slot_pool
    ADD CONSTRAINT slot_pool_pool_key UNIQUE (pool);


--
-- Name: task_fail task_fail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_fail
    ADD CONSTRAINT task_fail_pkey PRIMARY KEY (id);


--
-- Name: task_instance task_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_instance
    ADD CONSTRAINT task_instance_pkey PRIMARY KEY (task_id, dag_id, execution_date);


--
-- Name: task_reschedule task_reschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_reschedule
    ADD CONSTRAINT task_reschedule_pkey PRIMARY KEY (id);


--
-- Name: connection unique_conn_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connection
    ADD CONSTRAINT unique_conn_id UNIQUE (conn_id);


--
-- Name: variable variable_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variable
    ADD CONSTRAINT variable_key_key UNIQUE (key);


--
-- Name: variable variable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variable
    ADD CONSTRAINT variable_pkey PRIMARY KEY (id);


--
-- Name: dag_id_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dag_id_state ON public.dag_run USING btree (dag_id, state);


--
-- Name: idx_fileloc_hash; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fileloc_hash ON public.serialized_dag USING btree (fileloc_hash);


--
-- Name: idx_job_state_heartbeat; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_job_state_heartbeat ON public.job USING btree (state, latest_heartbeat);


--
-- Name: idx_last_scheduling_decision; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_last_scheduling_decision ON public.dag_run USING btree (last_scheduling_decision);


--
-- Name: idx_log_dag; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_log_dag ON public.log USING btree (dag_id);


--
-- Name: idx_next_dagrun_create_after; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_next_dagrun_create_after ON public.dag USING btree (next_dagrun_create_after);


--
-- Name: idx_root_dag_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_root_dag_id ON public.dag USING btree (root_dag_id);


--
-- Name: idx_task_fail_dag_task_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_task_fail_dag_task_date ON public.task_fail USING btree (dag_id, task_id, execution_date);


--
-- Name: idx_task_reschedule_dag_task_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_task_reschedule_dag_task_date ON public.task_reschedule USING btree (dag_id, task_id, execution_date);


--
-- Name: job_type_heart; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX job_type_heart ON public.job USING btree (job_type, latest_heartbeat);


--
-- Name: si_hashcode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX si_hashcode ON public.sensor_instance USING btree (hashcode);


--
-- Name: si_shardcode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX si_shardcode ON public.sensor_instance USING btree (shardcode);


--
-- Name: si_state_shard; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX si_state_shard ON public.sensor_instance USING btree (state, shardcode);


--
-- Name: si_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX si_updated_at ON public.sensor_instance USING btree (updated_at);


--
-- Name: sm_dag; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sm_dag ON public.sla_miss USING btree (dag_id);


--
-- Name: ti_dag_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ti_dag_date ON public.task_instance USING btree (dag_id, execution_date);


--
-- Name: ti_dag_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ti_dag_state ON public.task_instance USING btree (dag_id, state);


--
-- Name: ti_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ti_job_id ON public.task_instance USING btree (job_id);


--
-- Name: ti_pool; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ti_pool ON public.task_instance USING btree (pool, state, priority_weight);


--
-- Name: ti_primary_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ti_primary_key ON public.sensor_instance USING btree (dag_id, task_id, execution_date);


--
-- Name: ti_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ti_state ON public.task_instance USING btree (state);


--
-- Name: ti_state_lkp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ti_state_lkp ON public.task_instance USING btree (dag_id, task_id, execution_date, state);


--
-- Name: ab_permission_view ab_permission_view_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.ab_permission(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_fkey FOREIGN KEY (permission_view_id) REFERENCES public.ab_permission_view(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_permission_view ab_permission_view_view_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_view_menu_id_fkey FOREIGN KEY (view_menu_id) REFERENCES public.ab_view_menu(id);


--
-- Name: ab_user ab_user_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user ab_user_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user_role ab_user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_user_role ab_user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: dag_tag dag_tag_dag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dag_tag
    ADD CONSTRAINT dag_tag_dag_id_fkey FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id);


--
-- Name: task_reschedule task_reschedule_dag_task_date_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_reschedule
    ADD CONSTRAINT task_reschedule_dag_task_date_fkey FOREIGN KEY (task_id, dag_id, execution_date) REFERENCES public.task_instance(task_id, dag_id, execution_date) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

