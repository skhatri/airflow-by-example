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
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO postgres;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO postgres;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO postgres;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO postgres;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO postgres;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO postgres;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO postgres;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO postgres;

--
-- Name: client_default_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_default_roles (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_default_roles OWNER TO postgres;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO postgres;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO postgres;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO postgres;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO postgres;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_client (
    client_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO postgres;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO postgres;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO postgres;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO postgres;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO postgres;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO postgres;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO postgres;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO postgres;

--
-- Name: component; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO postgres;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO postgres;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO postgres;

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
-- Name: credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO postgres;

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
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO postgres;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO postgres;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO postgres;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO postgres;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO postgres;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO postgres;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO postgres;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO postgres;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO postgres;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO postgres;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO postgres;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO postgres;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO postgres;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO postgres;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO postgres;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO postgres;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO postgres;

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
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO postgres;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO postgres;

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
-- Name: migration_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO postgres;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO postgres;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO postgres;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO postgres;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO postgres;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO postgres;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.realm OWNER TO postgres;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_attribute OWNER TO postgres;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO postgres;

--
-- Name: realm_default_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_default_roles (
    realm_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_roles OWNER TO postgres;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO postgres;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO postgres;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO postgres;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO postgres;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO postgres;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO postgres;

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
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO postgres;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO postgres;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO postgres;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO postgres;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO postgres;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO postgres;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO postgres;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO postgres;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO postgres;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO postgres;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO postgres;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO postgres;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO postgres;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO postgres;

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
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO postgres;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO postgres;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO postgres;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO postgres;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO postgres;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO postgres;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO postgres;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO postgres;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO postgres;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO postgres;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO postgres;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO postgres;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO postgres;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO postgres;

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
-- Name: web_origins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO postgres;

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
5	can_userinfo
6	resetmypassword
7	menu_access
8	can_this_form_get
9	can_this_form_post
10	userinfoedit
11	can_show
12	can_list
13	can_download
14	can_add
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
25	5	12
26	6	13
27	7	14
28	1	15
29	5	13
30	8	16
31	1	17
32	1	18
33	7	4
34	9	19
35	7	3
36	7	20
37	7	21
38	7	17
39	10	13
40	1	22
41	9	16
42	5	23
43	7	5
44	1	14
45	7	24
46	7	22
47	5	25
48	5	26
49	8	19
50	4	4
51	3	4
52	2	3
53	3	2
54	7	1
55	7	7
56	7	27
57	3	9
58	7	9
59	7	8
60	1	28
61	7	28
62	8	34
63	9	34
64	3	26
65	11	26
66	12	26
67	2	26
68	13	26
69	14	26
70	10	26
71	7	36
72	7	37
73	3	38
74	11	38
75	12	38
76	2	38
77	13	38
78	14	38
79	15	38
80	7	39
81	16	40
82	7	41
83	12	42
84	11	42
85	3	42
86	12	43
87	7	44
88	12	45
89	7	46
90	12	47
91	7	48
92	17	49
93	18	3
94	7	11
95	4	9
96	7	52
97	7	53
98	7	54
99	7	55
100	2	56
101	1	56
102	2	57
103	1	57
104	2	58
105	1	58
106	2	59
107	1	59
108	2	60
109	1	60
110	2	61
111	1	61
112	2	62
113	1	62
\.


--
-- Data for Name: ab_permission_view_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_permission_view_role (id, permission_view_id, role_id) FROM stdin;
1	25	3
2	8	3
3	26	3
4	27	3
5	24	3
6	7	3
7	28	3
8	29	3
9	30	3
10	31	3
11	32	3
12	22	3
13	33	3
14	34	3
15	35	3
16	36	3
17	37	3
18	12	3
19	38	3
20	39	3
21	40	3
22	41	3
23	5	3
24	42	3
25	43	3
26	44	3
27	23	3
28	45	3
29	46	3
30	47	3
31	13	3
32	48	3
33	49	3
34	25	4
35	8	4
36	26	4
37	27	4
38	50	4
39	24	4
40	51	4
41	6	4
42	7	4
43	11	4
44	28	4
45	29	4
46	10	4
47	30	4
48	31	4
49	32	4
50	22	4
51	33	4
52	34	4
53	35	4
54	9	4
55	36	4
56	37	4
57	12	4
58	38	4
59	52	4
60	39	4
61	40	4
62	41	4
63	5	4
64	42	4
65	43	4
66	44	4
67	53	4
68	23	4
69	45	4
70	46	4
71	47	4
72	13	4
73	48	4
74	49	4
75	25	5
76	8	5
77	26	5
78	54	5
79	27	5
80	50	5
81	55	5
82	24	5
83	51	5
84	6	5
85	7	5
86	11	5
87	3	5
88	28	5
89	29	5
90	10	5
91	16	5
92	30	5
93	31	5
94	56	5
95	32	5
96	22	5
97	33	5
98	34	5
99	35	5
100	9	5
101	57	5
102	36	5
103	37	5
104	12	5
105	38	5
106	52	5
107	39	5
108	40	5
109	58	5
110	19	5
111	21	5
112	41	5
113	18	5
114	5	5
115	42	5
116	43	5
117	2	5
118	44	5
119	4	5
120	53	5
121	23	5
122	1	5
123	59	5
124	17	5
125	45	5
126	15	5
127	46	5
128	47	5
129	14	5
130	13	5
131	48	5
132	49	5
133	20	5
134	25	1
135	8	1
136	26	1
137	54	1
138	27	1
139	60	1
140	50	1
141	55	1
142	24	1
143	51	1
144	6	1
145	7	1
146	11	1
147	3	1
148	28	1
149	29	1
150	10	1
151	16	1
152	30	1
153	31	1
154	56	1
155	32	1
156	61	1
157	22	1
158	33	1
159	34	1
160	35	1
161	9	1
162	57	1
163	36	1
164	37	1
165	12	1
166	38	1
167	52	1
168	39	1
169	40	1
170	58	1
171	19	1
172	21	1
173	41	1
174	18	1
175	5	1
176	42	1
177	43	1
178	2	1
179	44	1
180	4	1
181	53	1
182	23	1
183	1	1
184	59	1
185	17	1
186	45	1
187	15	1
188	46	1
189	47	1
190	14	1
191	13	1
192	48	1
193	49	1
194	20	1
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
1	Admin	User	admin	pbkdf2:sha256:150000$jV1BgVaX$12f23f715ee42a12ef1fc6de2646859d3ae1c9fd1ef4d9c37bb82a4b14a7ba7f	t	admin@gmail.com	\N	\N	\N	2021-04-04 06:03:28.007707	2021-04-04 06:03:28.007729	\N	\N
2	Airflow	Admin	airflow	pbkdf2:sha256:150000$M1ybl7Iv$ce1baaedb58aecc40d429f3ee396f7028a371801db0d52f084ef7e630a4a0338	t	airflow@gmail.com	2021-04-04 06:05:21.075461	1	0	2021-04-04 06:05:21.066471	2021-04-04 06:05:21.06649	\N	\N
\.


--
-- Data for Name: ab_user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_user_role (id, user_id, role_id) FROM stdin;
1	1	1
3	2	1
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
12	UserLDAPModelView
13	UserDBModelView
14	Jobs
15	Website
16	UserInfoEditView
17	SLA Misses
18	Task Logs
19	ResetMyPasswordView
20	Browse
21	Docs
22	Plugins
23	UserOIDModelView
24	Documentation
25	UserRemoteUserModelView
26	UserOAuthModelView
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
56	DAG:k8s-pod-operator-spark-init
57	DAG:download_rocket_launches
58	DAG:process_etl_linear
59	DAG:eod_processing
60	DAG:k8s-pod-operator-spark
61	DAG:kube-pod-operator
62	DAG:etl_conditional
\.


--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
e959f08ac86c
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
4368f5ed-5245-403a-ae26-640263ad94d5	09bdb556-ebab-4c5c-a8eb-6af95d4c556c
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
39980cfb-f97f-463a-b18b-f3414e09ab22	\N	auth-cookie	master	9a7e18fb-f8e1-48c9-8333-4c37a402ee3c	2	10	f	\N	\N
96099cb4-5ab0-4771-87be-9203214275e7	\N	auth-spnego	master	9a7e18fb-f8e1-48c9-8333-4c37a402ee3c	3	20	f	\N	\N
1e3f8983-f69d-4720-a70a-eb4892b7b2b8	\N	identity-provider-redirector	master	9a7e18fb-f8e1-48c9-8333-4c37a402ee3c	2	25	f	\N	\N
e7e47044-c9c3-44bd-98cc-f9d0329fda0e	\N	\N	master	9a7e18fb-f8e1-48c9-8333-4c37a402ee3c	2	30	t	beaf0595-2c7b-40dc-b596-7cb4c6ac8771	\N
08c06331-ae92-4967-8d58-7455026b563f	\N	auth-username-password-form	master	beaf0595-2c7b-40dc-b596-7cb4c6ac8771	0	10	f	\N	\N
943161fe-03bc-4fd2-8c52-239d9fe75e37	\N	\N	master	beaf0595-2c7b-40dc-b596-7cb4c6ac8771	1	20	t	019de274-c85a-4c06-8b4f-1afaede8bcf4	\N
858e9999-f012-4fdc-812e-fa4c9be2b112	\N	conditional-user-configured	master	019de274-c85a-4c06-8b4f-1afaede8bcf4	0	10	f	\N	\N
1b98c2da-37e0-4097-9098-5e427444b7ec	\N	auth-otp-form	master	019de274-c85a-4c06-8b4f-1afaede8bcf4	0	20	f	\N	\N
880dbae5-0bcc-46bc-aa74-769eea61284e	\N	direct-grant-validate-username	master	20debb71-73ee-4c03-a7be-20bf10bf2809	0	10	f	\N	\N
ff230ce2-69eb-418b-a530-a9b4b0000c99	\N	direct-grant-validate-password	master	20debb71-73ee-4c03-a7be-20bf10bf2809	0	20	f	\N	\N
3c4390e6-161a-46e6-abf1-1e226fc2425f	\N	\N	master	20debb71-73ee-4c03-a7be-20bf10bf2809	1	30	t	f26ea9a4-401e-4817-8156-0a6c994dbf00	\N
d550363b-128b-4355-8666-ee2373deb288	\N	conditional-user-configured	master	f26ea9a4-401e-4817-8156-0a6c994dbf00	0	10	f	\N	\N
96da2fa4-8de3-4090-bfda-d15036576200	\N	direct-grant-validate-otp	master	f26ea9a4-401e-4817-8156-0a6c994dbf00	0	20	f	\N	\N
71895525-11e6-4597-af04-2aed3d522785	\N	registration-page-form	master	138b6ffa-9966-44ec-93fe-2065c8549d8f	0	10	t	6aac78da-68d4-4b4a-b12d-83f00b7e993b	\N
655aa878-90e5-485c-819f-ac10b3afb2d6	\N	registration-user-creation	master	6aac78da-68d4-4b4a-b12d-83f00b7e993b	0	20	f	\N	\N
2d154269-2dac-4e57-82da-b0f859fefaa5	\N	registration-profile-action	master	6aac78da-68d4-4b4a-b12d-83f00b7e993b	0	40	f	\N	\N
781e43ef-5abc-4c4e-9fd8-20bcb71804b5	\N	registration-password-action	master	6aac78da-68d4-4b4a-b12d-83f00b7e993b	0	50	f	\N	\N
41b9c5a0-ee95-45d6-b669-dd4a2a5cbcb8	\N	registration-recaptcha-action	master	6aac78da-68d4-4b4a-b12d-83f00b7e993b	3	60	f	\N	\N
8ffa48e6-fc95-4ea0-b39d-43a00756a14f	\N	reset-credentials-choose-user	master	50804530-365f-4907-b9d8-6048670f1e5c	0	10	f	\N	\N
0ad9d48a-6784-45d0-8602-e1953509d766	\N	reset-credential-email	master	50804530-365f-4907-b9d8-6048670f1e5c	0	20	f	\N	\N
97131f84-7c4d-4ad6-8483-fd4510f88748	\N	reset-password	master	50804530-365f-4907-b9d8-6048670f1e5c	0	30	f	\N	\N
25974a11-0093-4fad-af0c-9033424bdbca	\N	\N	master	50804530-365f-4907-b9d8-6048670f1e5c	1	40	t	597faf2b-bef7-4078-a054-c1fbe0596b11	\N
ceede447-4044-4ff2-bf84-3c7c40391491	\N	conditional-user-configured	master	597faf2b-bef7-4078-a054-c1fbe0596b11	0	10	f	\N	\N
b834b83e-ba52-4cbb-ad03-bc4ad247cec8	\N	reset-otp	master	597faf2b-bef7-4078-a054-c1fbe0596b11	0	20	f	\N	\N
5fdae240-8620-497f-8981-684bb69454f6	\N	client-secret	master	7a3194ee-5e9a-479c-bc1b-e607b674aa30	2	10	f	\N	\N
f8cc95f1-9fdc-430b-afc6-3e9a35e48ca7	\N	client-jwt	master	7a3194ee-5e9a-479c-bc1b-e607b674aa30	2	20	f	\N	\N
c241d3f8-fca5-466c-8fec-7d62f9efbf42	\N	client-secret-jwt	master	7a3194ee-5e9a-479c-bc1b-e607b674aa30	2	30	f	\N	\N
3fa3a5c4-9c17-406e-951f-4f6202420c83	\N	client-x509	master	7a3194ee-5e9a-479c-bc1b-e607b674aa30	2	40	f	\N	\N
533bad9a-8fbf-4d45-ad6c-d2cbcce28efa	\N	idp-review-profile	master	6ed847af-040d-4ba4-876e-b6449ee3264e	0	10	f	\N	56640b59-be43-4954-9aae-178e034a193c
f94fe539-dfee-4490-bcd7-59249bd1b428	\N	\N	master	6ed847af-040d-4ba4-876e-b6449ee3264e	0	20	t	ff3188dd-d7ec-4765-8ec3-31a2d5292a41	\N
c03a7df7-d881-4fec-bd74-1290f543549d	\N	idp-create-user-if-unique	master	ff3188dd-d7ec-4765-8ec3-31a2d5292a41	2	10	f	\N	4bc0c220-ef56-48c4-b7ef-9b3e044d90f7
48cf4b8b-639f-4625-b1c7-a0b7f15ecc27	\N	\N	master	ff3188dd-d7ec-4765-8ec3-31a2d5292a41	2	20	t	9e57a2ca-bd59-44e8-bb1c-51d379f663d7	\N
7b606251-0b14-41b3-a00c-a851d4a48f7d	\N	idp-confirm-link	master	9e57a2ca-bd59-44e8-bb1c-51d379f663d7	0	10	f	\N	\N
c653be0d-933b-4063-903a-09bc902af389	\N	\N	master	9e57a2ca-bd59-44e8-bb1c-51d379f663d7	0	20	t	433d21df-0c90-45fa-8a38-1399a3735478	\N
0b130edd-5009-420e-95e8-48509f5bca02	\N	idp-email-verification	master	433d21df-0c90-45fa-8a38-1399a3735478	2	10	f	\N	\N
76952e4b-c383-409e-ab87-9bb5e2a46239	\N	\N	master	433d21df-0c90-45fa-8a38-1399a3735478	2	20	t	9cc8a022-b6ea-4d67-8b57-a49725c6f04c	\N
47b35205-3ca1-41f1-a054-7dc87528d59e	\N	idp-username-password-form	master	9cc8a022-b6ea-4d67-8b57-a49725c6f04c	0	10	f	\N	\N
73f6dff8-d0fd-46b6-8fed-963f69584968	\N	\N	master	9cc8a022-b6ea-4d67-8b57-a49725c6f04c	1	20	t	bac55953-99e3-4d72-9889-93bf91684c77	\N
1a9cbc04-789c-4f4a-8c5e-12f0a0e551db	\N	conditional-user-configured	master	bac55953-99e3-4d72-9889-93bf91684c77	0	10	f	\N	\N
a1859501-15d0-4e44-859d-fe66308b92d1	\N	auth-otp-form	master	bac55953-99e3-4d72-9889-93bf91684c77	0	20	f	\N	\N
483e3474-73ef-449e-a6c4-3d6a217bdaa0	\N	http-basic-authenticator	master	d27c443e-55b6-4711-9434-ac12fc2468d6	0	10	f	\N	\N
f37bdcc0-8ffc-458c-ae3f-0659f31bdf1c	\N	docker-http-basic-authenticator	master	0f7b7acb-dae6-4d38-ac49-ea7d6d2988a1	0	10	f	\N	\N
c82dd7ed-3435-4f45-858a-d8919f50adee	\N	no-cookie-redirect	master	6a2e1243-8da5-457d-9b0f-593775656a2d	0	10	f	\N	\N
a7202504-0039-4573-8a24-00a15676aedc	\N	\N	master	6a2e1243-8da5-457d-9b0f-593775656a2d	0	20	t	dbf04c9c-4a64-4128-913a-086ee661dc11	\N
997ec81a-128a-4d61-bcb4-d60e9299f888	\N	basic-auth	master	dbf04c9c-4a64-4128-913a-086ee661dc11	0	10	f	\N	\N
bfd15aa6-a247-4b5e-9e0f-0cedd9ae9657	\N	basic-auth-otp	master	dbf04c9c-4a64-4128-913a-086ee661dc11	3	20	f	\N	\N
26cd7277-41fc-4928-b595-b0bf93da0f3e	\N	auth-spnego	master	dbf04c9c-4a64-4128-913a-086ee661dc11	3	30	f	\N	\N
f869d66c-8ee8-46a9-945a-3ab40c705fb8	\N	auth-cookie	airflow	b5f1e165-67d8-4742-8888-ecd46e00b7b6	2	10	f	\N	\N
5b703d0d-f3a1-4b00-8f31-906bb4328244	\N	auth-spnego	airflow	b5f1e165-67d8-4742-8888-ecd46e00b7b6	3	20	f	\N	\N
52416007-f4de-497a-8618-b982587f0a70	\N	identity-provider-redirector	airflow	b5f1e165-67d8-4742-8888-ecd46e00b7b6	2	25	f	\N	\N
79036839-0186-4f1c-a32e-c8eb03a22fe1	\N	\N	airflow	b5f1e165-67d8-4742-8888-ecd46e00b7b6	2	30	t	815cb140-c8be-4a5a-85ec-8b661e513b4c	\N
2b86032b-3201-461f-842a-eb8f4a773ab1	\N	auth-username-password-form	airflow	815cb140-c8be-4a5a-85ec-8b661e513b4c	0	10	f	\N	\N
d4b74cf5-d519-429e-a800-30a4264557c2	\N	\N	airflow	815cb140-c8be-4a5a-85ec-8b661e513b4c	1	20	t	3d4bff8e-c5dc-4043-89d8-50981170312b	\N
a4b52953-a742-40ae-b797-f9c57a6f1e4e	\N	conditional-user-configured	airflow	3d4bff8e-c5dc-4043-89d8-50981170312b	0	10	f	\N	\N
0eb965a4-e6be-4d3f-b457-98cc7610d93e	\N	auth-otp-form	airflow	3d4bff8e-c5dc-4043-89d8-50981170312b	0	20	f	\N	\N
0f57773b-771c-4b4b-b6c4-715127e878a2	\N	direct-grant-validate-username	airflow	207e8132-4d37-48d1-bdc6-f4f890e98ebf	0	10	f	\N	\N
cb70b5d5-f149-4eed-b2db-ec4b51b08e1a	\N	direct-grant-validate-password	airflow	207e8132-4d37-48d1-bdc6-f4f890e98ebf	0	20	f	\N	\N
c38dec27-e1a9-4127-84ea-021a860afb44	\N	\N	airflow	207e8132-4d37-48d1-bdc6-f4f890e98ebf	1	30	t	d075f767-f31a-414b-99d9-9cc894c1e5e3	\N
a1f8103c-d71e-4ce3-a6ca-a46c7a908105	\N	conditional-user-configured	airflow	d075f767-f31a-414b-99d9-9cc894c1e5e3	0	10	f	\N	\N
0d7bbb7e-863d-4bc5-98c2-927b3a35f7e3	\N	direct-grant-validate-otp	airflow	d075f767-f31a-414b-99d9-9cc894c1e5e3	0	20	f	\N	\N
e4547c82-99e2-497f-93d5-49dc9fb6d30e	\N	registration-page-form	airflow	021d8b86-20a5-4ad3-9f09-b071e37e1357	0	10	t	a1c57b38-a0a8-4531-b9a6-584e7f3fb69a	\N
f1cd0305-8bf7-4fa8-b957-877da1d2efa9	\N	registration-user-creation	airflow	a1c57b38-a0a8-4531-b9a6-584e7f3fb69a	0	20	f	\N	\N
d3049aa4-fe23-4583-b1ef-ab4b7999eca2	\N	registration-profile-action	airflow	a1c57b38-a0a8-4531-b9a6-584e7f3fb69a	0	40	f	\N	\N
4b2abebd-8a8e-47a6-8b70-04ccb67bbe87	\N	registration-password-action	airflow	a1c57b38-a0a8-4531-b9a6-584e7f3fb69a	0	50	f	\N	\N
39a3d2ff-c022-4638-8dd9-f396bcd5cbbd	\N	registration-recaptcha-action	airflow	a1c57b38-a0a8-4531-b9a6-584e7f3fb69a	3	60	f	\N	\N
62714a4d-9f53-40ae-973a-1187451b688f	\N	reset-credentials-choose-user	airflow	1bde9102-5865-4e8b-8dcc-abff6befc3ec	0	10	f	\N	\N
6683d7cd-b639-4914-880d-db42283a9c47	\N	reset-credential-email	airflow	1bde9102-5865-4e8b-8dcc-abff6befc3ec	0	20	f	\N	\N
0775463c-fa74-4934-83fb-88a42f35c8b2	\N	reset-password	airflow	1bde9102-5865-4e8b-8dcc-abff6befc3ec	0	30	f	\N	\N
b1ac2131-a091-4e80-8b9c-6fccd82e7742	\N	\N	airflow	1bde9102-5865-4e8b-8dcc-abff6befc3ec	1	40	t	c2bff6e3-b42e-4af9-93fb-13be71e50c2a	\N
9e111692-f6f8-46e9-bd10-627f1e3dee55	\N	conditional-user-configured	airflow	c2bff6e3-b42e-4af9-93fb-13be71e50c2a	0	10	f	\N	\N
05aeeb4d-0303-417f-a17f-2e3be4122f94	\N	reset-otp	airflow	c2bff6e3-b42e-4af9-93fb-13be71e50c2a	0	20	f	\N	\N
31b4f38e-dd72-46d1-a406-b4319a88cdd4	\N	client-secret	airflow	0efc09ac-2073-4f9d-a3ca-d26ba7edd190	2	10	f	\N	\N
344a08ec-84d2-4cd2-96a7-9bb715df7b3b	\N	client-jwt	airflow	0efc09ac-2073-4f9d-a3ca-d26ba7edd190	2	20	f	\N	\N
2b00b626-6b0c-4d35-b3d2-e1d29b4f0247	\N	client-secret-jwt	airflow	0efc09ac-2073-4f9d-a3ca-d26ba7edd190	2	30	f	\N	\N
3ff2e68c-0d93-46c1-ae2c-5f923b8704d4	\N	client-x509	airflow	0efc09ac-2073-4f9d-a3ca-d26ba7edd190	2	40	f	\N	\N
6f536246-1415-483b-b162-5a36deee6a02	\N	idp-review-profile	airflow	60949ee5-9967-4f73-bab3-6cd5d1b54145	0	10	f	\N	c066e7a0-2ba7-4d65-a6a4-806312efddb5
05f10adb-9422-4d3c-bf5f-a0ea1c32d394	\N	\N	airflow	60949ee5-9967-4f73-bab3-6cd5d1b54145	0	20	t	1ff88a29-9d3a-4164-97c4-01a6ca17a3e7	\N
b6b513f9-57c7-4334-83d9-2d4d0590640f	\N	idp-create-user-if-unique	airflow	1ff88a29-9d3a-4164-97c4-01a6ca17a3e7	2	10	f	\N	22e51c20-e316-4c8e-905e-89181f94c2fe
408e6824-e619-49e4-8158-31131dbc8e6d	\N	\N	airflow	1ff88a29-9d3a-4164-97c4-01a6ca17a3e7	2	20	t	706ab40a-74a2-49b2-99e2-ca0026a6ad76	\N
88ae20b7-60a2-4433-a374-01ba8795eaf1	\N	idp-confirm-link	airflow	706ab40a-74a2-49b2-99e2-ca0026a6ad76	0	10	f	\N	\N
e8642c1e-1c44-4442-8f37-c2525f97bd58	\N	\N	airflow	706ab40a-74a2-49b2-99e2-ca0026a6ad76	0	20	t	36596468-4d78-4794-9483-2bd230168ccc	\N
1836119f-028d-4f1e-8814-d9fd1f2bfe28	\N	idp-email-verification	airflow	36596468-4d78-4794-9483-2bd230168ccc	2	10	f	\N	\N
8d9b4574-b706-49b0-88b6-3c2fa1a486f5	\N	\N	airflow	36596468-4d78-4794-9483-2bd230168ccc	2	20	t	17d1f539-7867-4448-8b2c-271bec6a929e	\N
7333f9ec-4254-4118-94e1-48d5a4342735	\N	idp-username-password-form	airflow	17d1f539-7867-4448-8b2c-271bec6a929e	0	10	f	\N	\N
b4a0a7bd-8ee3-403d-8ed0-02b17a30f543	\N	\N	airflow	17d1f539-7867-4448-8b2c-271bec6a929e	1	20	t	cf236a09-971e-4584-a57b-c635bc47b0f5	\N
b2f4fbe2-b958-4287-8c7b-82dde44dca5c	\N	conditional-user-configured	airflow	cf236a09-971e-4584-a57b-c635bc47b0f5	0	10	f	\N	\N
5483082c-8285-44f0-b5a6-0fe20627f7ab	\N	auth-otp-form	airflow	cf236a09-971e-4584-a57b-c635bc47b0f5	0	20	f	\N	\N
8473647d-2999-4c63-9697-9940b5223727	\N	http-basic-authenticator	airflow	d21e5229-acdd-450f-aeda-7a6d77e95c6e	0	10	f	\N	\N
018126c7-1617-4c08-b52c-80ca78170568	\N	docker-http-basic-authenticator	airflow	66cf6213-0b4c-496e-ab0b-0303a22e213c	0	10	f	\N	\N
63cb3d67-67a1-4649-8085-7dc7a5deab62	\N	no-cookie-redirect	airflow	ab0a979b-e5e5-4122-9a24-ef3ee5d220be	0	10	f	\N	\N
f56ef70b-fc38-4230-8db4-3e481ac1e182	\N	\N	airflow	ab0a979b-e5e5-4122-9a24-ef3ee5d220be	0	20	t	9be0b1af-93a3-4f6b-930b-9f4885822440	\N
2fa28913-a90b-496d-b557-68486abf8042	\N	basic-auth	airflow	9be0b1af-93a3-4f6b-930b-9f4885822440	0	10	f	\N	\N
af5a06a9-e68a-40fd-b559-5f08f1bdafa8	\N	basic-auth-otp	airflow	9be0b1af-93a3-4f6b-930b-9f4885822440	3	20	f	\N	\N
e230e831-0802-4967-9a9d-23624eda54c7	\N	auth-spnego	airflow	9be0b1af-93a3-4f6b-930b-9f4885822440	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
9a7e18fb-f8e1-48c9-8333-4c37a402ee3c	browser	browser based authentication	master	basic-flow	t	t
beaf0595-2c7b-40dc-b596-7cb4c6ac8771	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
019de274-c85a-4c06-8b4f-1afaede8bcf4	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
20debb71-73ee-4c03-a7be-20bf10bf2809	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
f26ea9a4-401e-4817-8156-0a6c994dbf00	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
138b6ffa-9966-44ec-93fe-2065c8549d8f	registration	registration flow	master	basic-flow	t	t
6aac78da-68d4-4b4a-b12d-83f00b7e993b	registration form	registration form	master	form-flow	f	t
50804530-365f-4907-b9d8-6048670f1e5c	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
597faf2b-bef7-4078-a054-c1fbe0596b11	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	master	basic-flow	f	t
7a3194ee-5e9a-479c-bc1b-e607b674aa30	clients	Base authentication for clients	master	client-flow	t	t
6ed847af-040d-4ba4-876e-b6449ee3264e	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
ff3188dd-d7ec-4765-8ec3-31a2d5292a41	User creation or linking	Flow for the existing/non-existing user alternatives	master	basic-flow	f	t
9e57a2ca-bd59-44e8-bb1c-51d379f663d7	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
433d21df-0c90-45fa-8a38-1399a3735478	Account verification options	Method with which to verity the existing account	master	basic-flow	f	t
9cc8a022-b6ea-4d67-8b57-a49725c6f04c	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
bac55953-99e3-4d72-9889-93bf91684c77	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
d27c443e-55b6-4711-9434-ac12fc2468d6	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
0f7b7acb-dae6-4d38-ac49-ea7d6d2988a1	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
6a2e1243-8da5-457d-9b0f-593775656a2d	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
dbf04c9c-4a64-4128-913a-086ee661dc11	Authentication Options	Authentication options.	master	basic-flow	f	t
b5f1e165-67d8-4742-8888-ecd46e00b7b6	browser	browser based authentication	airflow	basic-flow	t	t
815cb140-c8be-4a5a-85ec-8b661e513b4c	forms	Username, password, otp and other auth forms.	airflow	basic-flow	f	t
3d4bff8e-c5dc-4043-89d8-50981170312b	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	airflow	basic-flow	f	t
207e8132-4d37-48d1-bdc6-f4f890e98ebf	direct grant	OpenID Connect Resource Owner Grant	airflow	basic-flow	t	t
d075f767-f31a-414b-99d9-9cc894c1e5e3	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	airflow	basic-flow	f	t
021d8b86-20a5-4ad3-9f09-b071e37e1357	registration	registration flow	airflow	basic-flow	t	t
a1c57b38-a0a8-4531-b9a6-584e7f3fb69a	registration form	registration form	airflow	form-flow	f	t
1bde9102-5865-4e8b-8dcc-abff6befc3ec	reset credentials	Reset credentials for a user if they forgot their password or something	airflow	basic-flow	t	t
c2bff6e3-b42e-4af9-93fb-13be71e50c2a	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	airflow	basic-flow	f	t
0efc09ac-2073-4f9d-a3ca-d26ba7edd190	clients	Base authentication for clients	airflow	client-flow	t	t
60949ee5-9967-4f73-bab3-6cd5d1b54145	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	airflow	basic-flow	t	t
1ff88a29-9d3a-4164-97c4-01a6ca17a3e7	User creation or linking	Flow for the existing/non-existing user alternatives	airflow	basic-flow	f	t
706ab40a-74a2-49b2-99e2-ca0026a6ad76	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	airflow	basic-flow	f	t
36596468-4d78-4794-9483-2bd230168ccc	Account verification options	Method with which to verity the existing account	airflow	basic-flow	f	t
17d1f539-7867-4448-8b2c-271bec6a929e	Verify Existing Account by Re-authentication	Reauthentication of existing account	airflow	basic-flow	f	t
cf236a09-971e-4584-a57b-c635bc47b0f5	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	airflow	basic-flow	f	t
d21e5229-acdd-450f-aeda-7a6d77e95c6e	saml ecp	SAML ECP Profile Authentication Flow	airflow	basic-flow	t	t
66cf6213-0b4c-496e-ab0b-0303a22e213c	docker auth	Used by Docker clients to authenticate against the IDP	airflow	basic-flow	t	t
ab0a979b-e5e5-4122-9a24-ef3ee5d220be	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	airflow	basic-flow	t	t
9be0b1af-93a3-4f6b-930b-9f4885822440	Authentication Options	Authentication options.	airflow	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
56640b59-be43-4954-9aae-178e034a193c	review profile config	master
4bc0c220-ef56-48c4-b7ef-9b3e044d90f7	create unique user config	master
c066e7a0-2ba7-4d65-a6a4-806312efddb5	review profile config	airflow
22e51c20-e316-4c8e-905e-89181f94c2fe	create unique user config	airflow
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
56640b59-be43-4954-9aae-178e034a193c	missing	update.profile.on.first.login
4bc0c220-ef56-48c4-b7ef-9b3e044d90f7	false	require.password.update.after.registration
c066e7a0-2ba7-4d65-a6a4-806312efddb5	missing	update.profile.on.first.login
22e51c20-e316-4c8e-905e-89181f94c2fe	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
95915671-4449-4859-8227-f86ac88e1e7f	t	t	master-realm	0	f	969184b8-32f6-4784-9ccc-f51023e1523a	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
5b3b9d57-2c61-4590-8b35-c1897ec1af72	t	f	account	0	f	4ab4e250-784f-4c4b-82a4-96c0b2fb6711	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
51eba8bc-a057-4358-8da0-7a13e46e57c7	t	f	account-console	0	t	0741687a-06c1-48e7-a9b1-0e9c6b5188eb	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
a20a6234-7b36-41c7-b4b7-145da911b380	t	f	broker	0	f	73f601e1-7574-4e40-b3ed-ae611b5e8e82	\N	f	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
6284fc76-4ef0-4085-9135-c7fd24d3a945	t	f	security-admin-console	0	t	c394eeb8-a109-4cab-ac94-7ed76508a868	/admin/master/console/	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
27f48cdf-fcb8-479f-80d5-eba9c30746eb	t	f	admin-cli	0	t	5563b024-6a00-440e-a850-aa10b9810568	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	t	airflow-realm	0	f	9c931278-573c-48fb-97c1-198552ee78e2	\N	t	\N	f	master	\N	0	f	f	airflow Realm	f	client-secret	\N	\N	\N	t	f	f	f
3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	f	realm-management	0	f	75763e39-ff50-4caa-b3d8-31c1a02dda4a	\N	t	\N	f	airflow	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
ed32d811-13cd-4bb9-802a-c62403a1066c	t	f	account	0	f	deb44695-cf70-40ba-aefb-f1451cb709cc	/realms/airflow/account/	f	\N	f	airflow	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
21b3d652-6bd1-44eb-af0c-7a5c4869e490	t	f	account-console	0	t	14f7f325-f044-436a-a739-4b381728fefa	/realms/airflow/account/	f	\N	f	airflow	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
2ebd41f9-0c0d-4ae6-929c-e83eea3fa1fa	t	f	broker	0	f	924e436c-e693-4693-955c-a6fbf8821af2	\N	f	\N	f	airflow	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
40ba7753-19bd-4b03-a70f-8dc681d31d69	t	f	security-admin-console	0	t	2ee131a7-a70b-4f05-a594-1b26a4aff54c	/admin/airflow/console/	f	\N	f	airflow	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
57901b8b-2f07-4967-ba39-45e54ff4b098	t	f	admin-cli	0	t	92a13fc4-e8cb-474e-90be-449734c5af6a	\N	f	\N	f	airflow	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	t	t	airflow-client	0	f	9e661802-3356-44f3-8960-1dc890abd2bc	\N	f	\N	f	airflow	openid-connect	-1	f	f	\N	t	client-secret	\N	\N	\N	t	t	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
51eba8bc-a057-4358-8da0-7a13e46e57c7	S256	pkce.code.challenge.method
6284fc76-4ef0-4085-9135-c7fd24d3a945	S256	pkce.code.challenge.method
21b3d652-6bd1-44eb-af0c-7a5c4869e490	S256	pkce.code.challenge.method
40ba7753-19bd-4b03-a70f-8dc681d31d69	S256	pkce.code.challenge.method
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	false	saml.assertion.signature
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	false	saml.multivalued.roles
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	false	saml.force.post.binding
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	false	saml.encrypt
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	false	saml.server.signature
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	false	saml.server.signature.keyinfo.ext
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	false	exclude.session.state.from.auth.response
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	false	saml_force_name_id_format
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	false	saml.client.signature
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	false	tls.client.certificate.bound.access.tokens
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	false	saml.authnstatement
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	false	display.on.consent.screen
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	false	saml.onetimeuse.condition
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_default_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_default_roles (client_id, role_id) FROM stdin;
5b3b9d57-2c61-4590-8b35-c1897ec1af72	64e01b29-0804-406d-ac9e-44b1413e3d73
5b3b9d57-2c61-4590-8b35-c1897ec1af72	131aa827-ed5f-4a00-99ce-dcea528728c9
ed32d811-13cd-4bb9-802a-c62403a1066c	4d8b77f4-301f-4f60-ae55-91c91a88e049
ed32d811-13cd-4bb9-802a-c62403a1066c	6c1bf37c-e56a-480e-a15f-04399dc286e0
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
0c497609-9f9b-48ca-b4d3-76b40cc7f92a	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
e96aea5a-7eef-4c4b-bb2a-e5279a203ded	role_list	master	SAML role list	saml
cf879014-38fd-4b05-9805-5cc8293c0ec4	profile	master	OpenID Connect built-in scope: profile	openid-connect
5d34b12c-f1f7-4299-b504-97af209327ce	email	master	OpenID Connect built-in scope: email	openid-connect
19dfa0b1-8487-4c47-99d5-7bb5b4f80dff	address	master	OpenID Connect built-in scope: address	openid-connect
fe8fb693-3ac6-4d64-b482-d734893924bb	phone	master	OpenID Connect built-in scope: phone	openid-connect
9393d0a3-b793-4c27-a191-f9a2981c34af	roles	master	OpenID Connect scope for add user roles to the access token	openid-connect
9d030f7f-003a-4d97-b19b-9c3c6608b6df	web-origins	master	OpenID Connect scope for add allowed web origins to the access token	openid-connect
00b2c30a-eff0-4c3a-90ce-f6091a09d952	microprofile-jwt	master	Microprofile - JWT built-in scope	openid-connect
216b55be-f752-4e94-875b-c4cdc6235963	offline_access	airflow	OpenID Connect built-in scope: offline_access	openid-connect
cf215469-27d6-4ba5-86e1-0634d4982992	role_list	airflow	SAML role list	saml
27645cd5-26a3-40e2-bf16-fc29bbaa1757	profile	airflow	OpenID Connect built-in scope: profile	openid-connect
9e84fc64-b504-4b1e-b216-8b29e2e21b83	email	airflow	OpenID Connect built-in scope: email	openid-connect
7f24a654-4e9b-4a20-a53e-13dd307c2cc5	address	airflow	OpenID Connect built-in scope: address	openid-connect
a523ffbd-091b-4b1c-9214-de2da8dffc0b	phone	airflow	OpenID Connect built-in scope: phone	openid-connect
92fadeae-3bdc-4138-bfb0-3ff90de93ff7	roles	airflow	OpenID Connect scope for add user roles to the access token	openid-connect
f647d5db-5cc2-4aa3-beb7-8ae9bfbd9dbb	web-origins	airflow	OpenID Connect scope for add allowed web origins to the access token	openid-connect
94daf9f1-3ed2-4bf8-822c-545be76dacc0	microprofile-jwt	airflow	Microprofile - JWT built-in scope	openid-connect
025074e3-3874-4263-b026-489587d3417f	default	airflow	\N	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
0c497609-9f9b-48ca-b4d3-76b40cc7f92a	true	display.on.consent.screen
0c497609-9f9b-48ca-b4d3-76b40cc7f92a	${offlineAccessScopeConsentText}	consent.screen.text
e96aea5a-7eef-4c4b-bb2a-e5279a203ded	true	display.on.consent.screen
e96aea5a-7eef-4c4b-bb2a-e5279a203ded	${samlRoleListScopeConsentText}	consent.screen.text
cf879014-38fd-4b05-9805-5cc8293c0ec4	true	display.on.consent.screen
cf879014-38fd-4b05-9805-5cc8293c0ec4	${profileScopeConsentText}	consent.screen.text
cf879014-38fd-4b05-9805-5cc8293c0ec4	true	include.in.token.scope
5d34b12c-f1f7-4299-b504-97af209327ce	true	display.on.consent.screen
5d34b12c-f1f7-4299-b504-97af209327ce	${emailScopeConsentText}	consent.screen.text
5d34b12c-f1f7-4299-b504-97af209327ce	true	include.in.token.scope
19dfa0b1-8487-4c47-99d5-7bb5b4f80dff	true	display.on.consent.screen
19dfa0b1-8487-4c47-99d5-7bb5b4f80dff	${addressScopeConsentText}	consent.screen.text
19dfa0b1-8487-4c47-99d5-7bb5b4f80dff	true	include.in.token.scope
fe8fb693-3ac6-4d64-b482-d734893924bb	true	display.on.consent.screen
fe8fb693-3ac6-4d64-b482-d734893924bb	${phoneScopeConsentText}	consent.screen.text
fe8fb693-3ac6-4d64-b482-d734893924bb	true	include.in.token.scope
9393d0a3-b793-4c27-a191-f9a2981c34af	true	display.on.consent.screen
9393d0a3-b793-4c27-a191-f9a2981c34af	${rolesScopeConsentText}	consent.screen.text
9393d0a3-b793-4c27-a191-f9a2981c34af	false	include.in.token.scope
9d030f7f-003a-4d97-b19b-9c3c6608b6df	false	display.on.consent.screen
9d030f7f-003a-4d97-b19b-9c3c6608b6df		consent.screen.text
9d030f7f-003a-4d97-b19b-9c3c6608b6df	false	include.in.token.scope
00b2c30a-eff0-4c3a-90ce-f6091a09d952	false	display.on.consent.screen
00b2c30a-eff0-4c3a-90ce-f6091a09d952	true	include.in.token.scope
216b55be-f752-4e94-875b-c4cdc6235963	true	display.on.consent.screen
216b55be-f752-4e94-875b-c4cdc6235963	${offlineAccessScopeConsentText}	consent.screen.text
cf215469-27d6-4ba5-86e1-0634d4982992	true	display.on.consent.screen
cf215469-27d6-4ba5-86e1-0634d4982992	${samlRoleListScopeConsentText}	consent.screen.text
27645cd5-26a3-40e2-bf16-fc29bbaa1757	true	display.on.consent.screen
27645cd5-26a3-40e2-bf16-fc29bbaa1757	${profileScopeConsentText}	consent.screen.text
27645cd5-26a3-40e2-bf16-fc29bbaa1757	true	include.in.token.scope
9e84fc64-b504-4b1e-b216-8b29e2e21b83	true	display.on.consent.screen
9e84fc64-b504-4b1e-b216-8b29e2e21b83	${emailScopeConsentText}	consent.screen.text
9e84fc64-b504-4b1e-b216-8b29e2e21b83	true	include.in.token.scope
7f24a654-4e9b-4a20-a53e-13dd307c2cc5	true	display.on.consent.screen
7f24a654-4e9b-4a20-a53e-13dd307c2cc5	${addressScopeConsentText}	consent.screen.text
7f24a654-4e9b-4a20-a53e-13dd307c2cc5	true	include.in.token.scope
a523ffbd-091b-4b1c-9214-de2da8dffc0b	true	display.on.consent.screen
a523ffbd-091b-4b1c-9214-de2da8dffc0b	${phoneScopeConsentText}	consent.screen.text
a523ffbd-091b-4b1c-9214-de2da8dffc0b	true	include.in.token.scope
92fadeae-3bdc-4138-bfb0-3ff90de93ff7	true	display.on.consent.screen
92fadeae-3bdc-4138-bfb0-3ff90de93ff7	${rolesScopeConsentText}	consent.screen.text
92fadeae-3bdc-4138-bfb0-3ff90de93ff7	false	include.in.token.scope
f647d5db-5cc2-4aa3-beb7-8ae9bfbd9dbb	false	display.on.consent.screen
f647d5db-5cc2-4aa3-beb7-8ae9bfbd9dbb		consent.screen.text
f647d5db-5cc2-4aa3-beb7-8ae9bfbd9dbb	false	include.in.token.scope
94daf9f1-3ed2-4bf8-822c-545be76dacc0	false	display.on.consent.screen
94daf9f1-3ed2-4bf8-822c-545be76dacc0	true	include.in.token.scope
025074e3-3874-4263-b026-489587d3417f	true	include.in.token.scope
025074e3-3874-4263-b026-489587d3417f	false	display.on.consent.screen
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
5b3b9d57-2c61-4590-8b35-c1897ec1af72	e96aea5a-7eef-4c4b-bb2a-e5279a203ded	t
51eba8bc-a057-4358-8da0-7a13e46e57c7	e96aea5a-7eef-4c4b-bb2a-e5279a203ded	t
27f48cdf-fcb8-479f-80d5-eba9c30746eb	e96aea5a-7eef-4c4b-bb2a-e5279a203ded	t
a20a6234-7b36-41c7-b4b7-145da911b380	e96aea5a-7eef-4c4b-bb2a-e5279a203ded	t
95915671-4449-4859-8227-f86ac88e1e7f	e96aea5a-7eef-4c4b-bb2a-e5279a203ded	t
6284fc76-4ef0-4085-9135-c7fd24d3a945	e96aea5a-7eef-4c4b-bb2a-e5279a203ded	t
5b3b9d57-2c61-4590-8b35-c1897ec1af72	cf879014-38fd-4b05-9805-5cc8293c0ec4	t
5b3b9d57-2c61-4590-8b35-c1897ec1af72	9393d0a3-b793-4c27-a191-f9a2981c34af	t
5b3b9d57-2c61-4590-8b35-c1897ec1af72	9d030f7f-003a-4d97-b19b-9c3c6608b6df	t
5b3b9d57-2c61-4590-8b35-c1897ec1af72	5d34b12c-f1f7-4299-b504-97af209327ce	t
51eba8bc-a057-4358-8da0-7a13e46e57c7	cf879014-38fd-4b05-9805-5cc8293c0ec4	t
51eba8bc-a057-4358-8da0-7a13e46e57c7	9393d0a3-b793-4c27-a191-f9a2981c34af	t
51eba8bc-a057-4358-8da0-7a13e46e57c7	9d030f7f-003a-4d97-b19b-9c3c6608b6df	t
51eba8bc-a057-4358-8da0-7a13e46e57c7	5d34b12c-f1f7-4299-b504-97af209327ce	t
27f48cdf-fcb8-479f-80d5-eba9c30746eb	cf879014-38fd-4b05-9805-5cc8293c0ec4	t
27f48cdf-fcb8-479f-80d5-eba9c30746eb	9393d0a3-b793-4c27-a191-f9a2981c34af	t
27f48cdf-fcb8-479f-80d5-eba9c30746eb	9d030f7f-003a-4d97-b19b-9c3c6608b6df	t
27f48cdf-fcb8-479f-80d5-eba9c30746eb	5d34b12c-f1f7-4299-b504-97af209327ce	t
a20a6234-7b36-41c7-b4b7-145da911b380	cf879014-38fd-4b05-9805-5cc8293c0ec4	t
a20a6234-7b36-41c7-b4b7-145da911b380	9393d0a3-b793-4c27-a191-f9a2981c34af	t
a20a6234-7b36-41c7-b4b7-145da911b380	9d030f7f-003a-4d97-b19b-9c3c6608b6df	t
a20a6234-7b36-41c7-b4b7-145da911b380	5d34b12c-f1f7-4299-b504-97af209327ce	t
95915671-4449-4859-8227-f86ac88e1e7f	cf879014-38fd-4b05-9805-5cc8293c0ec4	t
95915671-4449-4859-8227-f86ac88e1e7f	9393d0a3-b793-4c27-a191-f9a2981c34af	t
95915671-4449-4859-8227-f86ac88e1e7f	9d030f7f-003a-4d97-b19b-9c3c6608b6df	t
95915671-4449-4859-8227-f86ac88e1e7f	5d34b12c-f1f7-4299-b504-97af209327ce	t
6284fc76-4ef0-4085-9135-c7fd24d3a945	cf879014-38fd-4b05-9805-5cc8293c0ec4	t
6284fc76-4ef0-4085-9135-c7fd24d3a945	9393d0a3-b793-4c27-a191-f9a2981c34af	t
6284fc76-4ef0-4085-9135-c7fd24d3a945	9d030f7f-003a-4d97-b19b-9c3c6608b6df	t
6284fc76-4ef0-4085-9135-c7fd24d3a945	5d34b12c-f1f7-4299-b504-97af209327ce	t
5b3b9d57-2c61-4590-8b35-c1897ec1af72	19dfa0b1-8487-4c47-99d5-7bb5b4f80dff	f
5b3b9d57-2c61-4590-8b35-c1897ec1af72	0c497609-9f9b-48ca-b4d3-76b40cc7f92a	f
5b3b9d57-2c61-4590-8b35-c1897ec1af72	00b2c30a-eff0-4c3a-90ce-f6091a09d952	f
5b3b9d57-2c61-4590-8b35-c1897ec1af72	fe8fb693-3ac6-4d64-b482-d734893924bb	f
51eba8bc-a057-4358-8da0-7a13e46e57c7	19dfa0b1-8487-4c47-99d5-7bb5b4f80dff	f
51eba8bc-a057-4358-8da0-7a13e46e57c7	0c497609-9f9b-48ca-b4d3-76b40cc7f92a	f
51eba8bc-a057-4358-8da0-7a13e46e57c7	00b2c30a-eff0-4c3a-90ce-f6091a09d952	f
51eba8bc-a057-4358-8da0-7a13e46e57c7	fe8fb693-3ac6-4d64-b482-d734893924bb	f
27f48cdf-fcb8-479f-80d5-eba9c30746eb	19dfa0b1-8487-4c47-99d5-7bb5b4f80dff	f
27f48cdf-fcb8-479f-80d5-eba9c30746eb	0c497609-9f9b-48ca-b4d3-76b40cc7f92a	f
27f48cdf-fcb8-479f-80d5-eba9c30746eb	00b2c30a-eff0-4c3a-90ce-f6091a09d952	f
27f48cdf-fcb8-479f-80d5-eba9c30746eb	fe8fb693-3ac6-4d64-b482-d734893924bb	f
a20a6234-7b36-41c7-b4b7-145da911b380	19dfa0b1-8487-4c47-99d5-7bb5b4f80dff	f
a20a6234-7b36-41c7-b4b7-145da911b380	0c497609-9f9b-48ca-b4d3-76b40cc7f92a	f
a20a6234-7b36-41c7-b4b7-145da911b380	00b2c30a-eff0-4c3a-90ce-f6091a09d952	f
a20a6234-7b36-41c7-b4b7-145da911b380	fe8fb693-3ac6-4d64-b482-d734893924bb	f
95915671-4449-4859-8227-f86ac88e1e7f	19dfa0b1-8487-4c47-99d5-7bb5b4f80dff	f
95915671-4449-4859-8227-f86ac88e1e7f	0c497609-9f9b-48ca-b4d3-76b40cc7f92a	f
95915671-4449-4859-8227-f86ac88e1e7f	00b2c30a-eff0-4c3a-90ce-f6091a09d952	f
95915671-4449-4859-8227-f86ac88e1e7f	fe8fb693-3ac6-4d64-b482-d734893924bb	f
6284fc76-4ef0-4085-9135-c7fd24d3a945	19dfa0b1-8487-4c47-99d5-7bb5b4f80dff	f
6284fc76-4ef0-4085-9135-c7fd24d3a945	0c497609-9f9b-48ca-b4d3-76b40cc7f92a	f
6284fc76-4ef0-4085-9135-c7fd24d3a945	00b2c30a-eff0-4c3a-90ce-f6091a09d952	f
6284fc76-4ef0-4085-9135-c7fd24d3a945	fe8fb693-3ac6-4d64-b482-d734893924bb	f
cbd875c8-4ed0-4972-a16a-2af5b1435de7	e96aea5a-7eef-4c4b-bb2a-e5279a203ded	t
cbd875c8-4ed0-4972-a16a-2af5b1435de7	cf879014-38fd-4b05-9805-5cc8293c0ec4	t
cbd875c8-4ed0-4972-a16a-2af5b1435de7	9393d0a3-b793-4c27-a191-f9a2981c34af	t
cbd875c8-4ed0-4972-a16a-2af5b1435de7	9d030f7f-003a-4d97-b19b-9c3c6608b6df	t
cbd875c8-4ed0-4972-a16a-2af5b1435de7	5d34b12c-f1f7-4299-b504-97af209327ce	t
cbd875c8-4ed0-4972-a16a-2af5b1435de7	19dfa0b1-8487-4c47-99d5-7bb5b4f80dff	f
cbd875c8-4ed0-4972-a16a-2af5b1435de7	0c497609-9f9b-48ca-b4d3-76b40cc7f92a	f
cbd875c8-4ed0-4972-a16a-2af5b1435de7	00b2c30a-eff0-4c3a-90ce-f6091a09d952	f
cbd875c8-4ed0-4972-a16a-2af5b1435de7	fe8fb693-3ac6-4d64-b482-d734893924bb	f
ed32d811-13cd-4bb9-802a-c62403a1066c	cf215469-27d6-4ba5-86e1-0634d4982992	t
21b3d652-6bd1-44eb-af0c-7a5c4869e490	cf215469-27d6-4ba5-86e1-0634d4982992	t
57901b8b-2f07-4967-ba39-45e54ff4b098	cf215469-27d6-4ba5-86e1-0634d4982992	t
2ebd41f9-0c0d-4ae6-929c-e83eea3fa1fa	cf215469-27d6-4ba5-86e1-0634d4982992	t
3ab486d0-d15f-42ec-afa2-5b862ee380fd	cf215469-27d6-4ba5-86e1-0634d4982992	t
40ba7753-19bd-4b03-a70f-8dc681d31d69	cf215469-27d6-4ba5-86e1-0634d4982992	t
ed32d811-13cd-4bb9-802a-c62403a1066c	27645cd5-26a3-40e2-bf16-fc29bbaa1757	t
ed32d811-13cd-4bb9-802a-c62403a1066c	f647d5db-5cc2-4aa3-beb7-8ae9bfbd9dbb	t
ed32d811-13cd-4bb9-802a-c62403a1066c	9e84fc64-b504-4b1e-b216-8b29e2e21b83	t
ed32d811-13cd-4bb9-802a-c62403a1066c	92fadeae-3bdc-4138-bfb0-3ff90de93ff7	t
21b3d652-6bd1-44eb-af0c-7a5c4869e490	27645cd5-26a3-40e2-bf16-fc29bbaa1757	t
21b3d652-6bd1-44eb-af0c-7a5c4869e490	f647d5db-5cc2-4aa3-beb7-8ae9bfbd9dbb	t
21b3d652-6bd1-44eb-af0c-7a5c4869e490	9e84fc64-b504-4b1e-b216-8b29e2e21b83	t
21b3d652-6bd1-44eb-af0c-7a5c4869e490	92fadeae-3bdc-4138-bfb0-3ff90de93ff7	t
57901b8b-2f07-4967-ba39-45e54ff4b098	27645cd5-26a3-40e2-bf16-fc29bbaa1757	t
57901b8b-2f07-4967-ba39-45e54ff4b098	f647d5db-5cc2-4aa3-beb7-8ae9bfbd9dbb	t
57901b8b-2f07-4967-ba39-45e54ff4b098	9e84fc64-b504-4b1e-b216-8b29e2e21b83	t
57901b8b-2f07-4967-ba39-45e54ff4b098	92fadeae-3bdc-4138-bfb0-3ff90de93ff7	t
2ebd41f9-0c0d-4ae6-929c-e83eea3fa1fa	27645cd5-26a3-40e2-bf16-fc29bbaa1757	t
2ebd41f9-0c0d-4ae6-929c-e83eea3fa1fa	f647d5db-5cc2-4aa3-beb7-8ae9bfbd9dbb	t
2ebd41f9-0c0d-4ae6-929c-e83eea3fa1fa	9e84fc64-b504-4b1e-b216-8b29e2e21b83	t
2ebd41f9-0c0d-4ae6-929c-e83eea3fa1fa	92fadeae-3bdc-4138-bfb0-3ff90de93ff7	t
3ab486d0-d15f-42ec-afa2-5b862ee380fd	27645cd5-26a3-40e2-bf16-fc29bbaa1757	t
3ab486d0-d15f-42ec-afa2-5b862ee380fd	f647d5db-5cc2-4aa3-beb7-8ae9bfbd9dbb	t
3ab486d0-d15f-42ec-afa2-5b862ee380fd	9e84fc64-b504-4b1e-b216-8b29e2e21b83	t
3ab486d0-d15f-42ec-afa2-5b862ee380fd	92fadeae-3bdc-4138-bfb0-3ff90de93ff7	t
40ba7753-19bd-4b03-a70f-8dc681d31d69	27645cd5-26a3-40e2-bf16-fc29bbaa1757	t
40ba7753-19bd-4b03-a70f-8dc681d31d69	f647d5db-5cc2-4aa3-beb7-8ae9bfbd9dbb	t
40ba7753-19bd-4b03-a70f-8dc681d31d69	9e84fc64-b504-4b1e-b216-8b29e2e21b83	t
40ba7753-19bd-4b03-a70f-8dc681d31d69	92fadeae-3bdc-4138-bfb0-3ff90de93ff7	t
ed32d811-13cd-4bb9-802a-c62403a1066c	216b55be-f752-4e94-875b-c4cdc6235963	f
ed32d811-13cd-4bb9-802a-c62403a1066c	94daf9f1-3ed2-4bf8-822c-545be76dacc0	f
ed32d811-13cd-4bb9-802a-c62403a1066c	7f24a654-4e9b-4a20-a53e-13dd307c2cc5	f
ed32d811-13cd-4bb9-802a-c62403a1066c	a523ffbd-091b-4b1c-9214-de2da8dffc0b	f
21b3d652-6bd1-44eb-af0c-7a5c4869e490	216b55be-f752-4e94-875b-c4cdc6235963	f
21b3d652-6bd1-44eb-af0c-7a5c4869e490	94daf9f1-3ed2-4bf8-822c-545be76dacc0	f
21b3d652-6bd1-44eb-af0c-7a5c4869e490	7f24a654-4e9b-4a20-a53e-13dd307c2cc5	f
21b3d652-6bd1-44eb-af0c-7a5c4869e490	a523ffbd-091b-4b1c-9214-de2da8dffc0b	f
57901b8b-2f07-4967-ba39-45e54ff4b098	216b55be-f752-4e94-875b-c4cdc6235963	f
57901b8b-2f07-4967-ba39-45e54ff4b098	94daf9f1-3ed2-4bf8-822c-545be76dacc0	f
57901b8b-2f07-4967-ba39-45e54ff4b098	7f24a654-4e9b-4a20-a53e-13dd307c2cc5	f
57901b8b-2f07-4967-ba39-45e54ff4b098	a523ffbd-091b-4b1c-9214-de2da8dffc0b	f
2ebd41f9-0c0d-4ae6-929c-e83eea3fa1fa	216b55be-f752-4e94-875b-c4cdc6235963	f
2ebd41f9-0c0d-4ae6-929c-e83eea3fa1fa	94daf9f1-3ed2-4bf8-822c-545be76dacc0	f
2ebd41f9-0c0d-4ae6-929c-e83eea3fa1fa	7f24a654-4e9b-4a20-a53e-13dd307c2cc5	f
2ebd41f9-0c0d-4ae6-929c-e83eea3fa1fa	a523ffbd-091b-4b1c-9214-de2da8dffc0b	f
3ab486d0-d15f-42ec-afa2-5b862ee380fd	216b55be-f752-4e94-875b-c4cdc6235963	f
3ab486d0-d15f-42ec-afa2-5b862ee380fd	94daf9f1-3ed2-4bf8-822c-545be76dacc0	f
3ab486d0-d15f-42ec-afa2-5b862ee380fd	7f24a654-4e9b-4a20-a53e-13dd307c2cc5	f
3ab486d0-d15f-42ec-afa2-5b862ee380fd	a523ffbd-091b-4b1c-9214-de2da8dffc0b	f
40ba7753-19bd-4b03-a70f-8dc681d31d69	216b55be-f752-4e94-875b-c4cdc6235963	f
40ba7753-19bd-4b03-a70f-8dc681d31d69	94daf9f1-3ed2-4bf8-822c-545be76dacc0	f
40ba7753-19bd-4b03-a70f-8dc681d31d69	7f24a654-4e9b-4a20-a53e-13dd307c2cc5	f
40ba7753-19bd-4b03-a70f-8dc681d31d69	a523ffbd-091b-4b1c-9214-de2da8dffc0b	f
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	f647d5db-5cc2-4aa3-beb7-8ae9bfbd9dbb	t
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	025074e3-3874-4263-b026-489587d3417f	t
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	cf215469-27d6-4ba5-86e1-0634d4982992	t
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	92fadeae-3bdc-4138-bfb0-3ff90de93ff7	t
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	27645cd5-26a3-40e2-bf16-fc29bbaa1757	t
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	9e84fc64-b504-4b1e-b216-8b29e2e21b83	t
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	7f24a654-4e9b-4a20-a53e-13dd307c2cc5	f
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	a523ffbd-091b-4b1c-9214-de2da8dffc0b	f
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	216b55be-f752-4e94-875b-c4cdc6235963	f
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	94daf9f1-3ed2-4bf8-822c-545be76dacc0	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
0c497609-9f9b-48ca-b4d3-76b40cc7f92a	6b4545aa-6694-4d2d-866c-730b5b2875a9
216b55be-f752-4e94-875b-c4cdc6235963	4b50a98f-907a-4cf7-a464-7a153de3ed47
025074e3-3874-4263-b026-489587d3417f	c62203d8-47b6-462b-bf62-f58c9d9077e7
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
294f3024-c39f-4be3-b3bb-5c1b07a8a198	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
bbdfb7c1-d9e5-4609-82b8-883ab47d0ecd	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
d722ccb2-cb38-4f35-b201-b1f44f03328c	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
07a028dd-f1e7-4d21-a9df-cbf80c07e483	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
9ca4d80b-ab31-487f-bf8c-12ead3df655b	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
99a5c746-0a6b-40e1-91d6-083f06d82f09	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
a949758e-8c04-45cc-9f6a-4ef3203e6728	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
a14523bb-d7df-49b5-a50c-28fc465fc3bf	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
bacea10b-914a-4118-b60f-cb3453424c9a	fallback-RS256	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
fadef857-ffb6-48a9-b971-6b6e015c3383	fallback-HS256	master	hmac-generated	org.keycloak.keys.KeyProvider	master	\N
b6f208cf-5d44-46a4-80a3-a837922c07bb	rsa-generated	airflow	rsa-generated	org.keycloak.keys.KeyProvider	airflow	\N
7cef0519-fb64-447c-82c0-4dd2c3e400f6	hmac-generated	airflow	hmac-generated	org.keycloak.keys.KeyProvider	airflow	\N
ab9703cf-bc6e-4379-9f09-77022ddc1030	aes-generated	airflow	aes-generated	org.keycloak.keys.KeyProvider	airflow	\N
7b5749f1-1a1f-4db4-ac45-45365dfdb955	Trusted Hosts	airflow	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	anonymous
6bc175fa-4b0c-44fe-afb9-bd32758d0bd7	Consent Required	airflow	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	anonymous
9ee43cc3-ea21-4316-bacb-c2fa132aca5f	Full Scope Disabled	airflow	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	anonymous
88649ff2-fe75-45e3-85e1-e135e2e648b1	Max Clients Limit	airflow	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	anonymous
46f63e6b-a240-49e4-9bdd-5cb138aa4046	Allowed Protocol Mapper Types	airflow	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	anonymous
7834ee5f-9a73-4b80-9199-1493ae466d01	Allowed Client Scopes	airflow	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	anonymous
c9eb2a90-c648-49e1-b156-252b7ed85e16	Allowed Protocol Mapper Types	airflow	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	authenticated
de555ac2-b21a-4a28-9419-98e58950605d	Allowed Client Scopes	airflow	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
8c9d1c84-64d5-4c70-881c-81ae696a580a	294f3024-c39f-4be3-b3bb-5c1b07a8a198	client-uris-must-match	true
ab5c15b3-fd78-4f21-a44d-ba86e8334d2f	294f3024-c39f-4be3-b3bb-5c1b07a8a198	host-sending-registration-request-must-match	true
637d58ac-da59-439a-8941-ae0afeb039ce	07a028dd-f1e7-4d21-a9df-cbf80c07e483	max-clients	200
c99dc15d-35f3-4695-86fb-96197e77290e	9ca4d80b-ab31-487f-bf8c-12ead3df655b	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
2e9842c8-d945-4371-b500-b5fd1c9eb63d	9ca4d80b-ab31-487f-bf8c-12ead3df655b	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
3b58d8ab-0707-4f1a-87ce-13dfd1367908	9ca4d80b-ab31-487f-bf8c-12ead3df655b	allowed-protocol-mapper-types	saml-role-list-mapper
299d84e5-e921-4658-a301-ebbc4659e70e	9ca4d80b-ab31-487f-bf8c-12ead3df655b	allowed-protocol-mapper-types	saml-user-attribute-mapper
faf422aa-a7fe-4ece-9ba2-bedac0969ef3	9ca4d80b-ab31-487f-bf8c-12ead3df655b	allowed-protocol-mapper-types	oidc-address-mapper
7eea2fb5-0fc7-46c4-9a3b-85e9a9a6dce3	9ca4d80b-ab31-487f-bf8c-12ead3df655b	allowed-protocol-mapper-types	oidc-full-name-mapper
b0d2123e-a5cd-4c5f-94c3-0f6ef9484463	9ca4d80b-ab31-487f-bf8c-12ead3df655b	allowed-protocol-mapper-types	saml-user-property-mapper
3ff01671-d685-4aa2-9ad4-e11c6591a8e1	9ca4d80b-ab31-487f-bf8c-12ead3df655b	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
da79f664-ffef-414f-9201-9a5e6568dc83	a949758e-8c04-45cc-9f6a-4ef3203e6728	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
d9bc2a36-39e1-430f-a6fa-a18ba2a0ac65	a949758e-8c04-45cc-9f6a-4ef3203e6728	allowed-protocol-mapper-types	saml-user-property-mapper
023a63f9-5aa3-4203-9b32-547e8a54cdfc	a949758e-8c04-45cc-9f6a-4ef3203e6728	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
8e9f4ed0-93ce-49ad-812c-f9cd0ab3e7d1	a949758e-8c04-45cc-9f6a-4ef3203e6728	allowed-protocol-mapper-types	saml-role-list-mapper
54d4074a-d710-4082-8d75-f4f635066897	a949758e-8c04-45cc-9f6a-4ef3203e6728	allowed-protocol-mapper-types	oidc-address-mapper
63ce09be-6efc-4a3c-b9ee-87111f086bd5	a949758e-8c04-45cc-9f6a-4ef3203e6728	allowed-protocol-mapper-types	saml-user-attribute-mapper
377eab6f-8f9e-4414-88da-c58c372644e3	a949758e-8c04-45cc-9f6a-4ef3203e6728	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
8e1c2b0a-1d8b-4b78-96a7-f12d211abc0c	a949758e-8c04-45cc-9f6a-4ef3203e6728	allowed-protocol-mapper-types	oidc-full-name-mapper
9e4732ad-82d3-4e5d-98a4-11355032897d	a14523bb-d7df-49b5-a50c-28fc465fc3bf	allow-default-scopes	true
f3e70a14-82ed-4630-a816-d13636c0bba2	99a5c746-0a6b-40e1-91d6-083f06d82f09	allow-default-scopes	true
8eb1b649-cbaa-4c52-b262-ca1ea7a78caa	bacea10b-914a-4118-b60f-cb3453424c9a	priority	-100
910c634b-a64a-4bcf-a69f-2169e132f058	bacea10b-914a-4118-b60f-cb3453424c9a	privateKey	MIIEowIBAAKCAQEAhky0U6N6nMXB8xEOFcuTDkct7kRidlxMH63rqxcFQZRBCaazj0QlcIMwzpG7+bSvvmfqJUexvXKtAyo1DsJZtHbq2FzEaN85MvVZ54ODfytZIT+DZ0H1KjKig9RJNjSevMQBL8yKpyaHVHgl0Sqhb9vGR3kYf41T2i43krJ4kMAM6hLIAbm/bW4Ncy1b+orC/JzwPk8WXuL799VeTTRX5mTMd/fs/4yJLwlHqkmk7VmMNM43ejt/Bilf1MnhwG/5p7NpoGy1jK3+8nfXXBlMsrUhgzLgL1kX4WZzgWbBvRUhHWrWRhZvGzObKpDoUxLiX6QFS6CgXSZnR4uLmRXbhwIDAQABAoIBACAAJvfG/HBertg8OB75YxED5O3hXZTWaU0jJASgd6Aos1aZYi/BDSrCF98g2qmlZDr6h9BaRP/fU1pttDbQGI/nxg3IDQTwK7D4xXNk4vBqY9KIT8dK8CAd8Jt4+fjwkOJp0d6R3nf1tklqV5h/j/gXZiehszSxeEmEubk6zX+v6wBoaLlUkhggDnKL5V4TkPFFbDKGmrR2uxJ1vfW/jvY++EKkEz2MxaPo9FL7Zw+too8RQaIQlkgJ4KnmkO5SY70mstnOpXgU9cIGdvYLSgEuAzTQNxHmxoRwbDE1QRkEYOMtKJO+bUG/gmJzJxtp7YQlL965Fomn/sTZtwH6mAECgYEAvc0K+SlZnBmG6YTE1Pc30W9CYhgOdJhdznAy6Rm+fgobGcS+kB67McbM+Wkr+AVIEXugMxDk1EgAXGK6mV2w5WcL9JsvNpe+MwSzDiKgRQ2Ft5gSL4kqlr+KtROO72fVN/tK5924BjGKoD0fJekuH9GcPWZQLjnx0v4VB5lOE50CgYEAtSQOeluRQx6fKevgyoWJx4FyNA1J24+tUQ0hI7OAQ/6utMWlEdXNF6iFWdypUGWhcVW1FnSUsa7xyfDkWeEeQilmq5HOS2/IObdF8z+7IJ8FX+epact2f1/olgJHQlyBD031xXmQwQp//pFJu+E4jEqThK8idT11fYTdZzeffHMCgYEAkSbmZXbCGSdMjfoDrfsCrSCxW+OZ6oE7/EzCIpKVpD6GS0azlfRqpL6ss3FDNwKTAwvQkD0zQ0VtQTogCnokdsw/0Gl9yfpycwH9Dapdd3HH+YhLIB9+epsxsRmsDlsSLSX5OynNOq9YnQMhdxTFOYBMRIiieTfHQN0fqBgOJeECgYA3G4sUCnt88fn2JP60Xj/2ZBk8YLaRh3pw6A+m7tsc1ISOFnsLnAHTKr+3APy5qtGcyzhWZo0+KT0B9Llj5qrv8ex8UdVy+cTuWiV7xW3GlNprvOy7dNzOD32Q9Yx8UewpncwhkcRKFkmuRsEp2XD8rUuH2EghZtsxnpRE7JUmpQKBgAPHx+OcDoK8ILzkOsSRp+ltxTd6CKoWbcz2+Ayx5vyZjvZuIJuNXXyt1lBowJEVowVW5gPZH/N4N+4BnuPcZYYWNm7YKYUwDU0lOwkmlRyhMtm81h6Fr+btTIzaTqZiIXk23On+pDJ87dBiyvz/wV5NdwfwaBRsvHzy5UxvM7i/
d77f5d7b-cbeb-478b-8c3d-987f453f1850	bacea10b-914a-4118-b60f-cb3453424c9a	algorithm	RS256
9ae75e88-3d84-4230-9f51-439a5c6bde96	bacea10b-914a-4118-b60f-cb3453424c9a	certificate	MIICmzCCAYMCBgF4m3tjhzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjEwNDA0MDYwMjM4WhcNMzEwNDA0MDYwNDE4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCGTLRTo3qcxcHzEQ4Vy5MORy3uRGJ2XEwfreurFwVBlEEJprOPRCVwgzDOkbv5tK++Z+olR7G9cq0DKjUOwlm0durYXMRo3zky9Vnng4N/K1khP4NnQfUqMqKD1Ek2NJ68xAEvzIqnJodUeCXRKqFv28ZHeRh/jVPaLjeSsniQwAzqEsgBub9tbg1zLVv6isL8nPA+TxZe4vv31V5NNFfmZMx39+z/jIkvCUeqSaTtWYw0zjd6O38GKV/UyeHAb/mns2mgbLWMrf7yd9dcGUyytSGDMuAvWRfhZnOBZsG9FSEdatZGFm8bM5sqkOhTEuJfpAVLoKBdJmdHi4uZFduHAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADko8bpwPBlnKQ+OAqToCJtS1Fp6h4tXPSoAdPrznlvKMdVODW3G4Z4sNMWl+2bOai5Fgs1ci2c2DRlA+RHPwEJBRJmWiHFbyaILf2u5arUnDwVfmc2Hwj5ugFcsNvGBVc84YFZhctZ8GWhjygujThuWb5d2BE6FvtJRZ10NVXzOmj4a6F1PmHvwiQDzc2bijbmmXNgqkoLQddQKFlvdVDh0u1pgb3AVLtWuqXlT18jJedjWb9IHA9Wx6s9BM1rqqEHZiwIQ4wO08DxZ2MdN8xafWsYHEAPvn7tn4Lzd5UxJ6vMnoOpVEmlOxxnz052Jn1Oqf41woySvmkWb6QNBSvA=
971d7588-9da3-4d37-b84a-c5b7e9b3948d	fadef857-ffb6-48a9-b971-6b6e015c3383	kid	b5db4204-bf91-4927-ba40-9c272310ffdd
b0aafedf-3d46-43ef-9a44-dadd52f41684	fadef857-ffb6-48a9-b971-6b6e015c3383	priority	-100
dda18e76-3ad5-40f7-9dfb-cd35e855f365	fadef857-ffb6-48a9-b971-6b6e015c3383	algorithm	HS256
ff7312ef-f3f2-4d9f-802a-9d7a154d1899	fadef857-ffb6-48a9-b971-6b6e015c3383	secret	JQXKoEoHyeoy-O7qs7dZXq0y8j8uPRPE5n_jrpYXnS25ZkJgqCOpdzYKKQbipfCL8EBXAMdBKZQoqOUWtjAw_g
89c1de56-e19e-4f01-8552-ca3998ff7202	ab9703cf-bc6e-4379-9f09-77022ddc1030	kid	64a6a3ef-5c01-40d4-9276-5cab78d6405d
c8a25696-556d-49d8-a8f4-507af2303126	ab9703cf-bc6e-4379-9f09-77022ddc1030	secret	kKchFCwh7tusdVqWO5IXsg
9b50abfc-e113-455f-a60b-6acf85fc5ba4	ab9703cf-bc6e-4379-9f09-77022ddc1030	priority	100
1cbc902b-aefd-4d2a-b335-4e135abc540d	7cef0519-fb64-447c-82c0-4dd2c3e400f6	priority	100
95fcf84f-a845-4441-911b-88bf074d02e3	7cef0519-fb64-447c-82c0-4dd2c3e400f6	kid	910877f1-f666-4f7b-8965-0ba06c2db69e
86a31456-16da-4873-a375-5389061fdf29	7cef0519-fb64-447c-82c0-4dd2c3e400f6	algorithm	HS256
5e2b37d2-f976-47d2-8fd0-9b2b6e08ad6e	7cef0519-fb64-447c-82c0-4dd2c3e400f6	secret	En3XkIg_npahb8MFpV7twnDB-0rI7sENd1274evkD97IfG4lrBrTLeMojEEjiViIqMyMwJ8uk7rTAJfgF5wCvw
5e7b527d-7176-443e-aa3d-59fdf343019a	b6f208cf-5d44-46a4-80a3-a837922c07bb	priority	100
ee79ff33-a64a-4a06-9a98-b8d72c8e659c	b6f208cf-5d44-46a4-80a3-a837922c07bb	certificate	MIICnTCCAYUCBgF4m3t3ZzANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdhaXJmbG93MB4XDTIxMDQwNDA2MDI0M1oXDTMxMDQwNDA2MDQyM1owEjEQMA4GA1UEAwwHYWlyZmxvdzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAM9WO0tZA8SGPUBkEbM3KtTmXFpt87Eq1syi1w/GpJPKkDxDTD2eaZE1vO0de/hBfXz4QtqLNKYmxcIZuqjkbIiymU0proBApAwQ0Nk5UCU+bFpAVqgAmQQOi2kcE7BOVogC80cRag2bJGMt8M9UGF2j0zNdQrpmIx2vDphrB2U8/ceqp8e9K76X4T4skpll14P4H221/68H0hmxn7yA86+jgyVVdnOEmCvLeUoDwTXgoo/LiMf+paHkxfhFkH4NcVpbTfKOlvNM73h4TU7cB0WK/cbCCGS34QEOQv/qvxwg1PqQeduJYq5MLs4Bz9jowBK/NGY3Or0ledSV+qyc93MCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEARZEQwBVsaiWNA21jE2HmaCWQXJrvpRqcsYyk6okK09PWIIeD5nwjPtu3Q/HneE3glOlH4BsML30lqf0iJZspd49284Crua8eTg0AQF4wzgBI1KypwEzRNNF1ZD/X1Rs/eotkRKM9MUPIWKhpeaiGDotUeiCsPcM88WBS7NIf6fi1ztajixXxnuqiTPv1h3w3swv4Tl95LgYs1vzM0v38fvcHmnuEPrW07OT8W3bzyLgyjXhaujBTyM2TZ53p3mxsRFuI3CGevF9sPa5UHJgEZB1P2QWyDzhwBQbzuAJ1yL1KeIGIfg1GSGwDDt8heLwNh/n8prPekeKM0E4r6TJhrg==
e2d34458-71aa-4cc2-94d8-b3439a96ae76	b6f208cf-5d44-46a4-80a3-a837922c07bb	privateKey	MIIEpAIBAAKCAQEAz1Y7S1kDxIY9QGQRszcq1OZcWm3zsSrWzKLXD8akk8qQPENMPZ5pkTW87R17+EF9fPhC2os0pibFwhm6qORsiLKZTSmugECkDBDQ2TlQJT5sWkBWqACZBA6LaRwTsE5WiALzRxFqDZskYy3wz1QYXaPTM11CumYjHa8OmGsHZTz9x6qnx70rvpfhPiySmWXXg/gfbbX/rwfSGbGfvIDzr6ODJVV2c4SYK8t5SgPBNeCij8uIx/6loeTF+EWQfg1xWltN8o6W80zveHhNTtwHRYr9xsIIZLfhAQ5C/+q/HCDU+pB524lirkwuzgHP2OjAEr80Zjc6vSV51JX6rJz3cwIDAQABAoIBAE775J6xjFPjZ5YOCQgirfhowSnZ1Qna7fUK266w16VNd2Ddqj+XB1RACnax0rYiDLH8yUsD2Myq3I8yyf7o9celce0JQeatuVC3XzhBMxzdCN3gwKJDiAcZm1YxUfbKAQDTTuX15lbEkToPGDuDJ70UWbKphnAH1LzMIV1C+JBB2bA+REvpy7DhJCagAowOuS7lcaCT2TsXMG9cahtP1CF2VrZlz+4QgqQAZwmj6hEFw2VUsWFl1bRo5P3j0cMNLBOSas+IWu82p9k7yj79UKpxjo0ipfdoVunvbEeqf778BZ5V5zrIJQbPtUrRJdNGKUWKXjOhaW7FnyZVDzE6qdECgYEA+ldTzaSga523hUfiUX2+2aYH0XHoue7jJGFqqbQDAIbKk+xFsK3wSrygDWabaJcxui0s6u1I81siPIm0eSWXYdDiiQi37SxR0T/fHJGuLUsRpIAiIxcLTojGdfwlu+c4tUuFI25n3hilvFqam1bkQMQPZUemS+K2mrj20VylAJUCgYEA1AYMHaW0otDTWL6mhx8LKPU6rm6XArNc0EUd3mPv9Xv2CIrnOZ9EHAFHE2/1fAcCNN5SgSmxlWDW/UXe7BXiCy6DomtvurNhLMhnR45ntTCSUTBMuZR8FpQwMa1CYh9a9jaQubKt+nmBfaSJGRriLpdkE3jjCSR57RMBmqgSbecCgYEAg/6lfilOOE/ZYtnrF6KgjWvAdYuE9PxjIVyH++ChMJbhmysZ97VOnGlmToqKaJRHsO1+4IOqUj38CEVnNfU/I2EbALvrFo+muBjgT9T0LIeHTuAMn8nXuVneonkHgFLDELw3/92HwI/oWy6+lCc1hHybzYAAy8RHGb9qzCr4CR0CgYB3DRo6f3QJRBaYKx0YnA7JJcGYdlJm2s3PyC94U0dG4R8KNuyUx2AYFYOSX3hI9yp/AyLykbW8Oc8eEeCVUchGHQ0e4xKuk9CJs9GCNWz4KVjPK765Ka3vg6/4BOBUdmS+AW+MRc846IcURJISvaypGqq/4E4jMQ8hVl29OIh4mwKBgQCoIf4J0NcIvtEodsUjnaWlLpKzovTpLOrBSxnJB+2KCxeJXBfiH7pWmwcohbiqtthX3mMzmabDGEOxJ+HZwcy2rupR6i6HBJkmSCfSaHN0MOAh4NHct2gUQ0uI+sIk21DD34hMn1Vu5g8hsbDLii7EZMnKJbrVBiJe5G28p96kBw==
f5b2d94c-aa7a-4f90-b589-088dd3932cdb	88649ff2-fe75-45e3-85e1-e135e2e648b1	max-clients	200
a9ec698f-7e7d-4200-b018-5a9b6c3b9613	7b5749f1-1a1f-4db4-ac45-45365dfdb955	host-sending-registration-request-must-match	true
3efe5757-df61-4717-976c-d0e43a680113	7b5749f1-1a1f-4db4-ac45-45365dfdb955	client-uris-must-match	true
1ad9fb78-9536-4268-b657-991df7247b10	7834ee5f-9a73-4b80-9199-1493ae466d01	allow-default-scopes	true
6628f629-a0b1-4d51-a0e6-d8eb56252fbf	de555ac2-b21a-4a28-9419-98e58950605d	allow-default-scopes	true
e014a964-f6f5-4077-9d15-4c5f821fb84f	46f63e6b-a240-49e4-9bdd-5cb138aa4046	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
84ac724d-94bc-436d-9a3e-3da6e10bb5a6	46f63e6b-a240-49e4-9bdd-5cb138aa4046	allowed-protocol-mapper-types	oidc-full-name-mapper
59c5b933-536e-484f-baa4-f84b566ee15c	46f63e6b-a240-49e4-9bdd-5cb138aa4046	allowed-protocol-mapper-types	oidc-address-mapper
b9cea410-2880-42e1-9975-e41934b81e64	46f63e6b-a240-49e4-9bdd-5cb138aa4046	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
61ca05a6-e23c-4288-b106-7516175d8815	46f63e6b-a240-49e4-9bdd-5cb138aa4046	allowed-protocol-mapper-types	saml-user-attribute-mapper
833d3d19-5724-4d3b-a997-09f2cfb8d1fb	46f63e6b-a240-49e4-9bdd-5cb138aa4046	allowed-protocol-mapper-types	saml-user-property-mapper
4a228d20-2669-4762-9c53-af9028f6e915	46f63e6b-a240-49e4-9bdd-5cb138aa4046	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
2a221113-742d-45f2-a49c-764e1b5a5012	46f63e6b-a240-49e4-9bdd-5cb138aa4046	allowed-protocol-mapper-types	saml-role-list-mapper
d640975d-91de-4c87-9b33-a13c6667fe58	c9eb2a90-c648-49e1-b156-252b7ed85e16	allowed-protocol-mapper-types	oidc-address-mapper
e2da0427-0ea9-4463-956c-9fe1821e92e1	c9eb2a90-c648-49e1-b156-252b7ed85e16	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
1a4c4234-a11b-4f26-8bdb-d6649322a093	c9eb2a90-c648-49e1-b156-252b7ed85e16	allowed-protocol-mapper-types	saml-user-property-mapper
2b0bf510-f777-4ecf-a498-3df521278deb	c9eb2a90-c648-49e1-b156-252b7ed85e16	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
90df8340-86ed-450e-999f-49205c6e75cc	c9eb2a90-c648-49e1-b156-252b7ed85e16	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
529c96d3-a237-4e0c-9e7f-f6356e887595	c9eb2a90-c648-49e1-b156-252b7ed85e16	allowed-protocol-mapper-types	oidc-full-name-mapper
d38bc71c-1593-4f44-bf59-5dc11c358983	c9eb2a90-c648-49e1-b156-252b7ed85e16	allowed-protocol-mapper-types	saml-user-attribute-mapper
e0d86c47-e287-4955-a7b3-110406bd4968	c9eb2a90-c648-49e1-b156-252b7ed85e16	allowed-protocol-mapper-types	saml-role-list-mapper
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.composite_role (composite, child_role) FROM stdin;
e808384c-bb5f-424f-9671-4a59c559af85	6aa953a8-a0c5-4ab7-99e3-579cc4974110
e808384c-bb5f-424f-9671-4a59c559af85	25abbc31-0e34-4622-9eed-0a1c020f22d4
e808384c-bb5f-424f-9671-4a59c559af85	ba3a851d-f907-43ac-9a57-4ae46d8f8a27
e808384c-bb5f-424f-9671-4a59c559af85	7a362cfb-413f-48fa-923a-efd2283109e3
e808384c-bb5f-424f-9671-4a59c559af85	7946f363-ba9f-4f92-97fc-22e1b871e8c4
e808384c-bb5f-424f-9671-4a59c559af85	6f273e5a-70cd-47a1-8a1b-75f9a9950e11
e808384c-bb5f-424f-9671-4a59c559af85	0f82efa1-3a97-489a-ade3-c633bac8eb18
e808384c-bb5f-424f-9671-4a59c559af85	8b8c2409-05f1-450a-a3c3-48ba123779f7
e808384c-bb5f-424f-9671-4a59c559af85	a76aefff-8f80-4248-b493-0ff02f142dd1
e808384c-bb5f-424f-9671-4a59c559af85	61c2f59a-b575-4d3a-b641-0dc9eee59cc9
e808384c-bb5f-424f-9671-4a59c559af85	d895ed12-8e33-4597-a264-b966b4edfff0
e808384c-bb5f-424f-9671-4a59c559af85	9dad5107-a894-48c4-9c54-8035c824b75a
e808384c-bb5f-424f-9671-4a59c559af85	bd8144b1-1645-4496-9c7b-d5d81abfeff7
e808384c-bb5f-424f-9671-4a59c559af85	5c086c8c-c9c4-4f92-902a-c030764fed44
e808384c-bb5f-424f-9671-4a59c559af85	b57a8325-e454-4bb3-bec6-2727f38eba63
e808384c-bb5f-424f-9671-4a59c559af85	adb207fd-3ae0-4d7c-afa6-9dcbfd631c63
e808384c-bb5f-424f-9671-4a59c559af85	c37a9a5d-51db-479d-a690-42d7f65c8311
e808384c-bb5f-424f-9671-4a59c559af85	ee9ef748-cb39-48de-a336-8b71ac51cb18
7946f363-ba9f-4f92-97fc-22e1b871e8c4	adb207fd-3ae0-4d7c-afa6-9dcbfd631c63
7a362cfb-413f-48fa-923a-efd2283109e3	ee9ef748-cb39-48de-a336-8b71ac51cb18
7a362cfb-413f-48fa-923a-efd2283109e3	b57a8325-e454-4bb3-bec6-2727f38eba63
131aa827-ed5f-4a00-99ce-dcea528728c9	09fbb88f-e9d2-43db-a288-f61ba57db692
c9e47d4f-4e29-43e7-865a-5a8a8f1d24cc	cdbe0be2-374b-4c71-b22a-0cd212738edb
e808384c-bb5f-424f-9671-4a59c559af85	7bc40be7-7ca9-483e-88bf-8c0e8fe2837d
e808384c-bb5f-424f-9671-4a59c559af85	c2bf0dcf-19a0-42e2-92cc-8b78a9f6ed85
e808384c-bb5f-424f-9671-4a59c559af85	2e45b666-9c25-4755-9fb2-f50c02952338
e808384c-bb5f-424f-9671-4a59c559af85	0ba73a94-d2dc-47f8-aa4a-e444ad2bdd5e
e808384c-bb5f-424f-9671-4a59c559af85	f6e1bb6f-2e34-493b-9b8f-d96629aec454
e808384c-bb5f-424f-9671-4a59c559af85	d203cb78-6b3c-4c52-8f00-9cafa6b6ed13
e808384c-bb5f-424f-9671-4a59c559af85	4a918582-c5a3-424a-b7c6-c7f178998ff2
e808384c-bb5f-424f-9671-4a59c559af85	6f206d1e-e061-4bba-9358-299ae02e30a6
e808384c-bb5f-424f-9671-4a59c559af85	dd592aa6-a723-4a69-837a-8d7fa8be3633
e808384c-bb5f-424f-9671-4a59c559af85	effc3e61-4d8b-4fc7-b058-6029f63adcdb
e808384c-bb5f-424f-9671-4a59c559af85	a5dc3ef8-b609-476a-86e1-179f5e4f43fe
e808384c-bb5f-424f-9671-4a59c559af85	b2516ffa-bf76-405c-862a-88452a6603f6
e808384c-bb5f-424f-9671-4a59c559af85	b5f79555-0e69-4913-aad3-bd16c8aa750e
e808384c-bb5f-424f-9671-4a59c559af85	f1b8b757-3e1c-4444-9e53-ae74fb98b0ab
e808384c-bb5f-424f-9671-4a59c559af85	ccbbe8cb-229c-4c9b-a5cd-68164894bf70
e808384c-bb5f-424f-9671-4a59c559af85	d691e7b7-ca82-497d-822e-1b01cbae80c6
e808384c-bb5f-424f-9671-4a59c559af85	76881586-21c0-4d95-84b5-5b494c46a254
e808384c-bb5f-424f-9671-4a59c559af85	1fc43568-cb08-472f-af7f-fe64274f512c
f6e1bb6f-2e34-493b-9b8f-d96629aec454	d691e7b7-ca82-497d-822e-1b01cbae80c6
0ba73a94-d2dc-47f8-aa4a-e444ad2bdd5e	1fc43568-cb08-472f-af7f-fe64274f512c
0ba73a94-d2dc-47f8-aa4a-e444ad2bdd5e	ccbbe8cb-229c-4c9b-a5cd-68164894bf70
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	a54a5859-6603-49ff-be9c-5154e23c2c10
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	25d5d317-ca13-4ef2-9f36-43a991ac746f
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	d4c418f9-d734-46d9-a718-29cd0fdc58b6
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	fdda3c77-1f34-4a3e-82f2-273bf0b198f9
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	cb042a5e-08af-4c94-a32c-e78cd7bc2f61
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	d71492bf-e975-4988-9dbb-e4e68a3ee7f0
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	e2c275a8-5745-4b82-ad08-063bf8ad9669
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	31c36937-e18f-40a1-8fd5-069be9dc99f8
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	460a1578-41ea-405c-b548-f1ada7dcb0be
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	9cf5d81c-4b02-4eaf-8b88-2d049e7cdb0a
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	4726ca9f-62c8-4057-9a83-5ded0aa8e556
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	1f6343d1-1701-404d-beac-43edb1801f60
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	1b15cf28-cbb5-466b-a941-c41266595477
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	a274c37f-38bd-49d8-9f6e-dabf614fa4d5
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	7c6e921d-3ad2-4a83-9a4c-3213e82f4b24
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	48bc2a82-dada-4948-b30c-096b50537e32
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	1aafbe59-0724-4014-b1a6-67f8995acef5
fdda3c77-1f34-4a3e-82f2-273bf0b198f9	7c6e921d-3ad2-4a83-9a4c-3213e82f4b24
d4c418f9-d734-46d9-a718-29cd0fdc58b6	a274c37f-38bd-49d8-9f6e-dabf614fa4d5
d4c418f9-d734-46d9-a718-29cd0fdc58b6	1aafbe59-0724-4014-b1a6-67f8995acef5
6c1bf37c-e56a-480e-a15f-04399dc286e0	3e8cb93b-fd14-4aae-8058-8680f09faef3
fa2df100-e9eb-4c00-806a-7e6bed7b1132	6fdbbebe-7729-40dd-bb8b-615d2c35d44b
e808384c-bb5f-424f-9671-4a59c559af85	3ca74fb8-afdb-43b2-b472-775faab451bc
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	d95471f3-acce-46e5-8a93-71535156fbd8
\.


--
-- Data for Name: connection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.connection (id, conn_id, conn_type, host, schema, login, password, port, extra, is_encrypted, is_extra_encrypted, description) FROM stdin;
1	airflow_db	mysql	mysql	airflow	root	\N	\N	\N	f	f	\N
2	aws_default	aws	\N	\N	\N	\N	\N	\N	f	f	\N
3	azure_batch_default	azure_batch	\N	\N	<ACCOUNT_NAME>	\N	\N	gAAAAABgaVao1b9uphvJIZS42AAoTssHPxzbbINeIDd7p8cPnFcx_UNmML2QYDEC_GqyuwF-oXHjPDvUe_Jk2Sm8PeYDfdrY3pxoCFFY1-n4EOEt3u3CANeIxstWFE0-POp4Zn-U1Cdg	f	t	\N
4	azure_container_instances_default	azure_container_instances	\N	\N	\N	\N	\N	gAAAAABgaVaoFPSTJj_38xxZmtreML2aQluJOsEl_d4m3cUfFXZp61qnYeWPh5u0To79CTnB9rEis7NnSLDcrNEltS6pWzwH7TeqKuTjT78eFCTQCIVeRCpjvpzUoHPVxgLOcpIUeHKzl6c9nGqaDygC8DO9j8qD3h5IpNvB8-022Bh_0GTYmeU=	f	t	\N
5	azure_cosmos_default	azure_cosmos	\N	\N	\N	\N	\N	gAAAAABgaVaoQVVDT82e4tZf-URcZWgPSn5JztGhXFhxCxkMtTvPautrmP1B47M9Lr1f4LpJbCWTJ9_aDobz-BRNG9rbe_565py472P9Sfr1KkidPMcrX5Jvv71hnAGar-5mjw_HbzM7-pqBhpYuCR4pLcC__LqKbz3N4XPgoFVF_unCndeQobo=	f	t	\N
6	azure_data_explorer_default	azure_data_explorer	https://<CLUSTER>.kusto.windows.net	\N	\N	\N	\N	gAAAAABgaVaoY77KhrqPw4ah8PuGy5IyvtlTYE8yMyCJH5TO9bT76yDGM8OkGYozwNbezAfYC05F1VDiLI-WtGAlEUsTNmPCfhIwak9zut1ib9vqPvgh4a6r4YzhVWkugcm6i1UBfF0ateBxNn_R3NnylQFbehPoqDlnm9BO1EIgur3z43LkP8mt6Xq3J3tgLyFJzQIEnB_kRZWTtN0tWKcv15qipGfp7fnOOz_YWEX5VXAbiHVc-IGFAebfinPwC7Rcltl1FI8e0gpQOkWHXxYnPdwfOb71WJq-xVyVl0RPnWE7KGQ2zVIG5xNczgAs7pJIWCtxglwHOUioBVbmJn5P_PHv7wvSrLFhlrWBYwwP_vphjEQxsA7ymAGi01JtuDSy4bWTKJ8V	f	t	\N
7	azure_data_lake_default	azure_data_lake	\N	\N	\N	\N	\N	gAAAAABgaVaoZmkxyuZNIr2TFw4yKqfVxdrHqkIbCuVKxQxzyqBueEU3f3w7oJcWrR5Ct_bBqNJCFmBEcWwsb_wXHgtBwVRTYGXq47Yr7u24-Q9fIz-zrStYVKkKV-sdLdJuoGSL9hvtANHdEct0tJUHU_w_nZ6taQ==	f	t	\N
8	cassandra_default	cassandra	cassandra	\N	\N	\N	9042	\N	f	f	\N
9	databricks_default	databricks	localhost	\N	\N	\N	\N	\N	f	f	\N
10	dingding_default	http		\N	\N	\N	\N	\N	f	f	\N
11	druid_broker_default	druid	druid-broker	\N	\N	\N	8082	gAAAAABgaVaorEBND3yOwaNTOzmcf7xMZTUxv8-LhMrDWSMk4tyfYqnuoC6UqSb_lV8nMU1NQQ-3zPVXmkU7J4wsATqj0pa0-dNmUINpytF0n8_zGpnxIF4=	f	t	\N
12	druid_ingest_default	druid	druid-overlord	\N	\N	\N	8081	gAAAAABgaVaofPNmpPbjdAyhYWGb3iyeWAwzwQ2GQt4sNnppoUJxwfgzBJIWrt1rhhH-LG3oihkeWUzeZBtAW1XcfWepneIg0hILx9F2KA_ly26CKBurp1VWTmzZE3gXm1dH8PiUMCSu	f	t	\N
13	elasticsearch_default	elasticsearch	localhost	http	\N	\N	9200	\N	f	f	\N
14	emr_default	emr	\N	\N	\N	\N	\N	gAAAAABgaVaoOaVWHQ_D52GxLsct-p10wsmUw4aXGmH54RiaKc0NgXkD-W5kogrsgRI79LjqfyZdpYJpII9TQ0BKsmvMFETngwrI7wQkIgjTHnSfG_H9VqGhycs0Xah7xOHe3qQAzVSDi3ulULat1Pd-wuiuhZz-m-qgQwtkHIuc4B_IQSdbifKNnKQn8W0Gd3VXWD1CMAdgFwXGzdPQ0jR-LXeUsxLBoFmd-bp0zJCwMrISkAvmXVKGXPtxzDOMySg_qIWXrj0MvHCGcTwdK3isOQhADVkKQnOpECbvuL_ZJeaWBM2__F4TEBM14SvTlRQyixCHHgYtdZWjYVPQyqURfgAmWdIR3zKL2lILrmFFewPu0fD-YHt6lK1hILE4ltBYPqsbKbUK1bVPi102I1HGtQPO4oWNnKJYOlT1IfcP_tb4fVrgF_HTURnGWwzAw2bFsOb7BzHOlhfFHCmvbIBy4a1nY4q2MqKqrbkB02mZMKzoJYaNi4c6WE3O0TLTxbDbdFglQkA2U1e7xCwLpO5ReulbMDapRn0RO0YpWuyDeZTqAc6dkogCEbgtF2zssZNJQdzY96vmuZmayWxReloXEUeeSGShcwrcPaEGZC36ckrV2DOR4NKmHdXlLKhrseIqqzK_ng_4vbltSCqx0LhZLXijkMxq6w00YVZWqJ2nYJL3jBX8Dn0o6AS1V1Tp_0_Ctoy_aHi67RWQcS2Ied1XJWqqcIswOrbcHJ3IyfiLLF65Vv0uCouZ6oAo_WGSBQ-BVFwIyipB7YX4lA1B7v48dD8VfQxyicCdKbDAxaiBbXQWsfR2G51J_bIQGa_Oxy8kItDlTK9sliOd0EL-PHrOZroEG6KDo1Pd1uk6_SnAQNFQXjTTJu4jdiVYDImdhHDvjmTuQYV0PhAklZKuy1GHjMv1Ma68Qi0d2kDkmrDgMfIuZb7P95PV7PyFe-D8o085ahcE37SUNrj9fCx4r-ukZ3MGq_WFdnqVPUumDxiiDIEtjiaO9PaUaNOfe7GHO4HJEguB7rmRiXbBXURrav2RgrtBROnBfTOBIUBPUYQa4ODmgtswRW86vhIxvCWExrSncUIISIZpoIZJsWrIzpOdZL3AL5d1GQyMUuEz0WvW_42jcZRbc-Gpvmej5yfoCfz6sK79Ej6RbQrOklhG6PmSLvYTzuNc97SGMlpBIyGf_r5AcEENrWICfOAl86lkHB5jfJL6tNgKO_nPYCYMofwHtnQfzftgKeVXZ9E_a9RoUIrupn1ba54w4NlLW4Bfz4PGsW2e-exLqsdsHNEKSwgFTQdad_G2XvaPlawKIY_DK4iXCmIgEYiAV979gJggbawPdE8lJJBHadHxb8rCjofiZlOlNtavTK3l-Fn46VlB4v1-i-H6pswGcXV441GvPaocovs6xJbBUb5DLNUbcRvBXeyY0bbymBxwC49G_Cx26rmj8anObgBXWqdG3qgPe_Kh4Lcf7c_TRZJtPkRZMKAdK6lp5l7t73_5ksJskwuOj_eFSKxleJEoXDqQaFo4nAuI739cNR-jNqdiOtx0GGpSD9HP-LqhoLCAZsmDLyPcPmXvu27BimtxL0EkS4VCUPWljIxlp_lWn1VuU6TR0NzyWPZTlfyRemxhxRNrKLLowdJlmKwrAFN-Xp8JCBjuvcvCMXYRqzhq6yMXA0gCd2nTU9eP3w5ui5rP2JU5Q_D7sJbvCpZ_0PdDmXevAqD2uKKHhPVO_oDp4zHrji4dVCzX3bXUnrekFsjNnin1Mrd3zRYQ7CAMEhxwwjpuXDaT17Qs7JQ86Ggb0KT7DRsOaaBWQ5fPDAfDGAyxBEWQSs2DBrVIX3avIrDph54Yf-GQwaMjmw0eSnbFXeK-a2e5ZHcFXVsdrfUhV1ipQ_0ubK6rnlzj4dxNhujRKHQJEpMmVgkHF_E05NRk6fpXPQXAZSbhKfEB1CbKzD-G2bPk71tak_b86bi45wP2YoG2-Sc7bsfHdyhaJXMVHuBHRBZJlJVGdyB0jbfVCUcENGBSzVIevGO0BUAsxZFhThABudjPvAbqPzDDeiCm3FNxUoz_s9wRrO8raEEA-Pm007mZmWUih112yyn5J60xI_dvtDKnt_aUJwdtMZC6a1af_tq5S-zWa_2V_EhPzE3FWbWm6kqoH06CY1NQrrUxxpDM2241Pb8F4374xRjU8vGYDKpqxFXXnO_u84bKLCRu0AvJow-zONS1HONJmL9p-O-7Cn1WjrZ__pUcuBpvWca6u1HclUYJNYo63Ci7CsAuSW9lpNBEyNucLdxaj6YBaR_cCUknrtHoWemg4fjs7EgCoIT-1371dvw7S1hQCGXRUB0Fub76VmS-U7XDkk_Ik-KNK6ToC-bAICiCcCL_iyYxYZpOfEpm5LjUoMq3Iqfjl9rsz9Fh96lioJREGZxHuh0sdDhKhtVnKOKUEvZchANcFdI56KbmK52m3ht87_PHTJ_kqBZ48M4Lud4p4BvWA2CKeHF9PkrzOnZjvzp3_Ff_glyorZMvs1UB30BaMtAS90xh3LzxHNFhwoVbFzk=	f	t	\N
15	facebook_default	facebook_social	\N	\N	\N	\N	\N	gAAAAABgaVaoJ5LofOFq1BDBWEmdkA6zcgTRXqbbCM73OJDjNh3qLDzHIK10rq_W_NGb80Ny8SIYrSKCkvJWSbwYcf1hKqAEOua-1gBoA1002cT09VpVwb72W57YXG9HtpDbkOXbioHwln4Jam8sFyDeQhX4UXb4HDbLdOzxqqiQXcO2PiRqcgwub3zJIYmVvfunqpOhXHffCuISDTfT-RWPCW91g5W3AAjqYuVbnPYGG-aNqPkDByC--1fTufQ4Kt1C3mUh2dYtldw9NaC_NPfuxGlAE9Xd4EokFDRMC2HCSw6uHFu3MfLetNaj-gAQqJdbTpwbR50YrlhcNyL8EGdLWfCaSJ4dHJohAL8PR_wVLFKui_Zb4QjbeHsD-Vty2s8706dCzzA97BjcSLdKbERFJvBAwlY9FfmNCV4DoY0qbKi_Ju6iOHE=	f	t	\N
16	fs_default	fs	\N	\N	\N	\N	\N	gAAAAABgaVaoYvRXCCz8-a4ps2G7CM-dBVNzZ6ozR3O6evAccAOSbxThqnhddB-Bqz8xmeAvw6m9HkGKX3-8dmpzJeJn5OY-_g==	f	t	\N
17	google_cloud_default	google_cloud_platform	\N	default	\N	\N	\N	\N	f	f	\N
18	hive_cli_default	hive_cli	localhost	default	\N	\N	10000	gAAAAABgaVaoAiHMaObQRj5nmrnqwCjRR9cr372-kv1TlbX_x52LPDH7sSSvtWWVO58pRqsBbGOIU3dhg8bxaSv-fTBbNPEiTCfgoExQo6_-jK1otSDx6qmMwkwSkLS9gRjTXMCJ_d5g	f	t	\N
19	hiveserver2_default	hiveserver2	localhost	default	\N	\N	10000	\N	f	f	\N
20	http_default	http	https://www.httpbin.org/	\N	\N	\N	\N	\N	f	f	\N
21	kubernetes_default	kubernetes	\N	\N	\N	\N	\N	\N	f	f	\N
22	kylin_default	kylin	localhost	\N	ADMIN	gAAAAABgaVaodQpnBoGazO3WFsgWyZn38s67dvAsVH_6PEC2DZa2FVJz0a7W4pDUYCfcwY0m46noVZIeqyRkZn0k4xR-BjV4Yw==	7070	\N	t	f	\N
23	livy_default	livy	livy	\N	\N	\N	8998	\N	f	f	\N
24	local_mysql	mysql	localhost	airflow	airflow	gAAAAABgaVaoAelOQ-JkHK0--Z-isJLzeaQG0bxiNK3yaPVfCP7CEhuV_xb11bp0_6n9kARbTeNcoanjok6XPEeGJ6nUnvXriw==	\N	\N	t	f	\N
25	metastore_default	hive_metastore	localhost	\N	\N	\N	9083	gAAAAABgaVaol2AA9n5yjGGknp2Ify1OmEaI-S-IYfGrhBrSGdo8FO-K4CM0J54YT70pdoGZAhTcKWNkf59HAwetLfSlt6TSXxwuaTarF3y5xygkX1AFBHo=	f	t	\N
26	mongo_default	mongo	mongo	\N	\N	\N	27017	\N	f	f	\N
27	mssql_default	mssql	localhost	\N	\N	\N	1433	\N	f	f	\N
28	mysql_default	mysql	mysql	airflow	root	\N	\N	\N	f	f	\N
29	opsgenie_default	http		\N	\N	\N	\N	\N	f	f	\N
30	pig_cli_default	pig_cli	\N	default	\N	\N	\N	\N	f	f	\N
31	pinot_admin_default	pinot	localhost	\N	\N	\N	9000	\N	f	f	\N
32	pinot_broker_default	pinot	localhost	\N	\N	\N	9000	gAAAAABgaVao_fvX8YjaN29IGvucY6xv-KRk9XHdLp-Or9bD-4Op-zfzKKRaXdpiJ839cAzlQ5tpeXL9GXSG_8GGs6Jo4_5yqMhmEd0tBC00-yoz8O6PAQRZSi7DoSg6c0xad7TVlFEF	f	t	\N
33	postgres_default	postgres	postgres	airflow	postgres	gAAAAABgaVaoR8oKzr18211C2rfN4cdnEgVCxjNGJVIt1hL6BMUDVJOJmVntlZNQFGJUB1f2s0dZLT_aahxi8Bfd1Vv9Hh7gDQ==	\N	\N	t	f	\N
34	presto_default	presto	localhost	hive	\N	\N	3400	\N	f	f	\N
35	qubole_default	qubole	localhost	\N	\N	\N	\N	\N	f	f	\N
36	redis_default	redis	redis	\N	\N	\N	6379	gAAAAABgaVaoZU3cnZYpcXb-7XDmNDfgbRSCBjNvvBqvj5N0ueBTCCQLkETU2Mv-iS3ca8Uqa5Bf4ZtPm3E8k5WVpPHPr6zdyQ==	f	t	\N
37	segment_default	segment	\N	\N	\N	\N	\N	gAAAAABgaVao4vrY16_98ij45zcekMiwZN6PzQD1VTdPyMWnx10UGUrv_xKrHrw1it0_jZGOHOK7I2C34PE87aM9SUKxFdZuaOo-XrqzCYhTQPChhV_vmdCACJfURqQOLai7Fj-VFhzA	f	t	\N
38	sftp_default	sftp	localhost	\N	airflow	\N	22	gAAAAABgaVaoCmjaahV9HjZD2uxj4CJuznHqOzcdL96eqK6NZXMx3THMlOeIoxMnIggAtIaqXJ34gDPYlCLQClXJZsVS6wKmE6GXXU6vCbTuDKY4VynsjfmrxGDy3nSFGq5eAo5D97sQ3P8AYvm4e2NPqT_pwiQKug==	f	t	\N
39	spark_default	spark	yarn	\N	\N	\N	\N	gAAAAABgaVao7onvZtel0YjywYz3AQxjIbaybYNr5SpjsSFckKG9-Z0Jej7dRAm0WIDj3RHwLbD0CeBM-w0ajUydpY3ZQIXEvUBE1jqRAiNKlNRM92OWOEI=	f	t	\N
40	sqlite_default	sqlite	/tmp/sqlite_default.db	\N	\N	\N	\N	\N	f	f	\N
41	sqoop_default	sqoop	rdbms	\N	\N	\N	\N	\N	f	f	\N
42	ssh_default	ssh	localhost	\N	\N	\N	\N	\N	f	f	\N
43	tableau_default	tableau	https://tableau.server.url	\N	user	gAAAAABgaVaouphjmpDSNXtzi4mWAFWICJ_bMOccE00d1cyn0g4T4t6t0b_55JEuYX26-OqmoO4veYqsPdrQp472nebZPQrxJg==	\N	gAAAAABgaVao0QnvUGQoFGtr6Bv7a8s7R3oxWf27aaEenw9MajdP0BeE3EzfKYYRB7eFPl90mmjtM8xv24s29SWmd54fqK9F8biU85MHNBU5dqnNBNcesVs=	t	t	\N
44	vertica_default	vertica	localhost	\N	\N	\N	5433	\N	f	f	\N
45	wasb_default	wasb	\N	\N	\N	\N	\N	gAAAAABgaVapjMgYZa9dxfVmW6-7tCNn89X4d9t1HoWbEGcWE1LrvY-PpKwlRfVpUGpDgv7NcS5BgKtVt3TGF0weRSmZz3g1KkuoDbSGHt0FrMWdhS3Nyqo=	f	t	\N
46	webhdfs_default	hdfs	localhost	\N	\N	\N	50070	\N	f	f	\N
47	yandexcloud_default	yandexcloud	\N	default	\N	\N	\N	\N	f	f	\N
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
44d66863-48ff-4cf0-83f1-a528e8af8f48	\N	password	4196880b-9c99-4f65-a6f5-03f4ffa59ca8	1617516239009	\N	{"value":"od+x0IVLW7jVxUzf4+A3N/3QLZGXI0pat3q7bT4v5XhF4DfsSfhya1fhy5unfuYbJPr/Q4qy50MQkrThu0C0UA==","salt":"RQJ8lpohjO2+f1dbQ1bOiQ=="}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}	10
fafb567b-fd5a-4173-b083-8eb6489a0ed3	\N	password	7d0c2452-b870-422c-9b47-6ecbb91a087b	1617516292558	\N	{"value":"7VI8f4YtgK7KuHkVGK2qejgOg7YgRHw1aKd2kRQ0dZ52E1bVerEPFLFdrfGT9YZ8X+dxCZmai4JljzZiWqxtpg==","salt":"eTOFuVWRznPNMGz0dbzLmg=="}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}	10
\.


--
-- Data for Name: dag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dag (dag_id, is_paused, is_subdag, is_active, last_scheduler_run, last_pickled, last_expired, scheduler_lock, pickle_id, fileloc, owners, description, default_view, schedule_interval, root_dag_id, next_dagrun, next_dagrun_create_after, concurrency, has_task_concurrency_limits) FROM stdin;
k8s-pod-operator-spark-init	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/k8s-pod-operator-spark-init.py	airflow	\N	tree	"@daily"	\N	2021-04-02 00:00:00+00	2021-04-03 00:00:00+00	16	f
download_rocket_launches	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/excluded/first.py	airflow	\N	tree	"@daily"	\N	2021-03-21 00:00:00+00	2021-03-22 00:00:00+00	16	f
process_etl_linear	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/etl-linear.py	airflow	\N	tree	"@daily"	\N	2021-03-28 00:00:00+00	2021-03-29 00:00:00+00	16	f
eod_processing	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/excluded/eod.py	airflow	\N	tree	"@daily"	\N	2021-03-21 00:00:00+00	2021-03-22 00:00:00+00	16	f
k8s-pod-operator-spark	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/k8s-pod-operator-spark.py	airflow	\N	tree	"@daily"	\N	2021-04-02 00:00:00+00	2021-04-03 00:00:00+00	16	f
kube-pod-operator	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/k8s-pod-operator.py	airflow	\N	tree	"@daily"	\N	2021-04-02 00:00:00+00	2021-04-03 00:00:00+00	16	f
etl_conditional	t	f	t	\N	\N	\N	\N	\N	/opt/airflow/dags/etl-conditional.py	airflow	\N	tree	"@daily"	\N	2021-03-20 00:00:00+00	2021-03-21 00:00:00+00	16	f
\.


--
-- Data for Name: dag_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dag_code (fileloc_hash, fileloc, source_code, last_updated) FROM stdin;
21628937650928228	/opt/airflow/dags/k8s-pod-operator-spark.py	import json\nimport pathlib\n\nimport airflow\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\nfrom kubernetes.client import models as k8s\n\nfrom airflow.contrib.operators import kubernetes_pod_operator\n\n\nimport datetime\n\nfrom airflow import models\n\ndag = DAG(\n   dag_id="k8s-pod-operator-spark",\n   start_date=airflow.utils.dates.days_ago(2),\n   schedule_interval="@daily",\n)\n\n\nk8s_pod_dag_start = BashOperator(\n   task_id="start_kube_spark_process",\n   bash_command="echo trigger execution of bunch of spark containers",\n   dag=dag,\n)\nk8s_pod_dag_finish = BashOperator(\n   task_id="finish_kube_spark_process",\n   bash_command="echo end of execution",\n   dag=dag,\n)\nin_cluster=False\n\nspark_env_vars=[\n    {\n        "name": "SPARK_USER",\n        "value": "spark_user"\n    },\n    {\n        "name": "HADOOP_USER_NAME",\n        "value": "spark_user"\n    },\n    {\n        "name": "HADOOP_PROXY_USER",\n        "value": "spark_user"\n    },\n    {\n        "name": "SPARK_LOCAL_DIRS",\n        "value": "/tmp/data/spark-workdir"\n    },\n    {\n        "name": "SPARK_CONF_DIR",\n        "value": "/opt/spark/conf"\n    },\n    {\n        "name": "SPARK_APPLICATION_ID",\n        "value": "spark-406656d05d7f456f81fcde9530ae1d70"\n    },\n    {\n        "name": "SPARK_DRIVER_BIND_ADDRESS",\n        "valueFrom": {\n            "fieldRef": {\n                "apiVersion": "v1",\n                "fieldPath": "status.podIP"\n            }\n        }\n    },\n    {\n        "name": "EOD_DATE",\n        "value": "{{ ds }}"\n    }\n]\n\nk8s_spark_launcher = kubernetes_pod_operator.KubernetesPodOperator(\n    task_id='k8s-spark-launcher',\n    name='k8s-spark-launcher',\n    cmds=['/opt/spark/bin/spark-submit'],\n    arguments=[\n        '--master',\n        'k8s://https://kubernetes.default.svc.cluster.local:443',\n        '--deploy-mode',\n        'cluster',\n        '--name',\n        'hello',\n        '--class',\n        'demo.Count',\n        '--conf',\n        'spark.executor.instances=2',\n        '--conf',\n        'spark.kubernetes.container.image=skhatri/spark-k8s-hello:1.0.7',\n        '--conf',\n        'spark.jars.ivy=/tmp/.ivy',\n        '--conf',\n        'spark.app.name=hello',\n        '--conf',\n        'spark.kubernetes.authenticate.driver.serviceAccountName=job-trigger-sa',\n        '--conf',\n        'spark.authenticate=false',\n        'local:///tmp/jars/spark-k8s-hello.jar'\n    ],\n    namespace='default',\n    image='skhatri/spark:v3.0.1',\n    in_cluster=in_cluster,\n    config_file='/tmp/k8s/minikube/config',\n    env_vars=spark_env_vars,\n    service_account_name='job-trigger-sa'\n)\n\n\nk8s_pod = kubernetes_pod_operator.KubernetesPodOperator(\n    task_id='k8s-pod',\n    name='k8s-pod',\n    cmds=['echo'],\n    namespace='default',\n    image='ubuntu:latest',\n    in_cluster=in_cluster,\n    config_file='/tmp/k8s/minikube/config'\n)\n\n\n\nk8s_pod_dag_start >> k8s_pod >> k8s_spark_launcher >> k8s_pod_dag_finish\n\n	2021-04-04 06:03:21.217538+00
14390090851810004	/opt/airflow/dags/k8s-pod-operator.py	import json\nimport pathlib\n\nimport airflow\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\nfrom kubernetes.client import models as k8s\n\nfrom airflow.contrib.operators import kubernetes_pod_operator\n\n\nimport datetime\n\nfrom airflow import models\n\ndag = DAG(\n   dag_id="kube-pod-operator",\n   start_date=airflow.utils.dates.days_ago(2),\n   schedule_interval="@daily",\n)\n\n\nstart_kube_process = BashOperator(\n   task_id="start_kube_process",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\n\nkube_files_volume_config = {\n    'name': 'minikube'\n}\n\nkube_files_volume = k8s.V1Volume(name='kube-files-volume', config_map=kube_files_volume_config)\nkube_files_volume_mount=k8s.V1VolumeMount(name='kube-files-volume', mount_path='/tmp/k8s')\nin_cluster=False\nkubernetes_min_pod = kubernetes_pod_operator.KubernetesPodOperator(\n    task_id='pod-ex-minimum',\n    name='pod-ex-minimum',\n    cmds=['echo'],\n    namespace='default',\n    image='ubuntu:latest',\n    in_cluster=in_cluster,\n    config_file='/tmp/k8s/minikube/config',\n    volumes=[kube_files_volume],\n    volume_mounts=[kube_files_volume_mount]\n    )\n\n\nrun_another_pod = kubernetes_pod_operator.KubernetesPodOperator(\n    task_id='run-another-pod',\n    name='run-another-pod',\n    cmds=['echo'],\n    namespace='default',\n    image='ubuntu:latest',\n    in_cluster=in_cluster,\n    config_file='/tmp/k8s/minikube/config'\n    )\n\n\n\n\nstart_kube_process >> kubernetes_min_pod >> run_another_pod\n\n	2021-04-04 06:03:21.219391+00
41676207298935373	/opt/airflow/dags/etl-conditional.py	import json\nimport pathlib\n\nimport airflow\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\nfrom airflow.operators.python_operator import BranchPythonOperator\n\ndag = DAG(\n   dag_id="etl_conditional",\n   start_date=airflow.utils.dates.days_ago(15),\n   schedule_interval="@daily",\n)\n\nec_upload_input_to_s3 = BashOperator(\n   task_id="ec_upload_input_to_s3",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\ndef _ec_convert_to_parquet():\n    print("convert raw to parquet")\n\nec_convert_to_parquet = PythonOperator(\n    task_id="ec_convert_to_parquet",\n    python_callable=_ec_convert_to_parquet,\n    dag=dag,\n)\n\n\ndef _ec_load_into_database():\n    print("save data to a table")\n\nec_load_into_database = PythonOperator(\n    task_id="ec_load_into_database",\n    python_callable=_ec_load_into_database,\n    dag=dag,\n)\n\n\ndef _ec_upload_output_to_s3():\n    print("upload data to s3")\n\nec_upload_output_to_s3 = PythonOperator(\n    task_id="ec_upload_output_to_s3",\n    python_callable=_ec_upload_output_to_s3,\n    dag=dag,\n)\n\ndef _choose_save_medium(execution_date):\n    if execution_date.day % 2 == 0:\n        return "ec_load_into_database"\n    return "ec_upload_output_to_s3"\n\n\nsave_output = BranchPythonOperator(\n    task_id='save-output-decision',\n    provide_context=True,\n    python_callable=_choose_save_medium\n)\n\nec_summary = BashOperator(\n    task_id="ec-summary",\n    bash_command='echo "Finished processing input file"',\n    dag=dag,\n)\n\n\nsave_output >> [ec_load_into_database, ec_upload_output_to_s3]\nec_upload_input_to_s3 >> ec_convert_to_parquet >> save_output >> ec_summary\n\n\n	2021-04-04 06:03:21.221394+00
41227235438583639	/opt/airflow/dags/k8s-pod-operator-spark-init.py	import json\nimport pathlib\n\nimport airflow\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\nfrom kubernetes.client import models as k8s\nfrom airflow.contrib.operators import kubernetes_pod_operator\n\n\nimport datetime\n\nfrom airflow import models\n\ndag = DAG(\n   dag_id="k8s-pod-operator-spark-init",\n   start_date=airflow.utils.dates.days_ago(2),\n   schedule_interval="@daily",\n)\n\n\nk8s_init_pod_dag_start = BashOperator(\n   task_id="start_kube_init_spark_process",\n   bash_command="echo trigger execution of bunch of spark containers",\n   dag=dag,\n)\nk8s_init_pod_dag_finish = BashOperator(\n   task_id="finish_kube_init_spark_process",\n   bash_command="echo end of execution",\n   dag=dag,\n)\nin_cluster=False\n\n\ndata_share_volume = k8s.V1Volume(name='data-shared-dir', empty_dir={})\n\ndata_write_secrets_mount= k8s.V1VolumeMount(mount_path="/tmp/out", name="data-shared-dir")\nconfiguring_init_container = k8s.V1Container(\n    name='secret-resolver',\n    image='ubuntu:latest',\n    command=['sh', '-c', 'echo {"user": "user1", "password": "secret"}|tee /tmp/out/hello'],\n    volume_mounts=[\n            data_write_secrets_mount\n    ],\n)\n\ndata_read_for_secrets_mount=k8s.V1VolumeMount(name='data-shared-dir', mount_path='/tmp/secrets')\n\nk8s_pod_with_init = kubernetes_pod_operator.KubernetesPodOperator(\n    task_id='k8s-pod-with-init',\n    name='k8s-pod',\n    cmds=['sh', '-c', 'cat /tmp/secrets/hello'],\n    namespace='default',\n    image='ubuntu:latest',\n    in_cluster=in_cluster,\n    config_file='/tmp/k8s/minikube/config',\n    init_containers=[configuring_init_container],\n    volumes=[data_share_volume],\n    volume_mounts=[\n        data_read_for_secrets_mount\n    ]    \n)\n\n\n\nk8s_init_pod_dag_start >> k8s_pod_with_init >> k8s_init_pod_dag_finish\n\n	2021-04-04 06:03:21.223476+00
18336183563814790	/opt/airflow/dags/etl-linear.py	import json\nimport pathlib\n\nimport airflow\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\n\ndag = DAG(\n   dag_id="process_etl_linear",\n   start_date=airflow.utils.dates.days_ago(7),\n   schedule_interval="@daily",\n)\n\nupload_input_to_s3 = BashOperator(\n   task_id="upload_input_to_s3",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\ndef _convert_to_parquet():\n    print("convert raw to parquet")\n\nconvert_to_parquet = PythonOperator(\n    task_id="convert_to_parquet",\n    python_callable=_convert_to_parquet,\n    dag=dag,\n)\n\n\ndef _load_into_database():\n    print("save data to a table")\n\nload_into_database = PythonOperator(\n    task_id="load_into_database",\n    python_callable=_load_into_database,\n    dag=dag,\n)\n\n\nsummary = BashOperator(\n    task_id="summary",\n    bash_command='echo "Finished processing input file"',\n    dag=dag,\n)\n\n\nupload_input_to_s3 >> convert_to_parquet >> load_into_database >> summary\n\n\n	2021-04-04 06:03:21.225555+00
59017706735592835	/opt/airflow/dags/excluded/eod.py	import json\nimport pathlib\n\nimport airflow\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\n\ndag = DAG(\n   dag_id="eod_processing",\n   start_date=airflow.utils.dates.days_ago(14),\n   schedule_interval="@daily",\n)\n\n\nreceive_account_file_from_ebbs = BashOperator(\n   task_id="receive_account_file_from_ebbs",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\ndef _convert_to_parquet():\n    print("convert raw to parquet")\n\nconvert_account_file_to_parquet = PythonOperator(\n    task_id="convert_account_file_to_parquet",\n    python_callable=_convert_to_parquet,\n    dag=dag,\n)\n\n\nreceive_txn_file_from_ebbs = BashOperator(\n   task_id="receive_txn_file_from_ebbs",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\nconvert_txn_file_to_parquet = PythonOperator(\n    task_id="convert_txn_file_to_parquet",\n    python_callable=_convert_to_parquet,\n    dag=dag,\n)\n\n\nreceive_staffhist_file_from_ebbs = BashOperator(\n   task_id="receive_staffhist_file_from_ebbs",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\nconvert_staffhist_file_to_parquet = PythonOperator(\n    task_id="convert_staffhist_file_to_parquet",\n    python_callable=_convert_to_parquet,\n    dag=dag,\n)\n\n\nreceive_balance_file_from_ebbs = BashOperator(\n   task_id="receive_balance_file_from_ebbs",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\nconvert_balance_file_to_parquet = PythonOperator(\n    task_id="convert_balance_file_to_parquet",\n    python_callable=_convert_to_parquet,\n    dag=dag,\n)\n\n\nreceive_bonus_exception_file_from_ebbs = BashOperator(\n   task_id="receive_bonus_exception_file_from_ebbs",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\nreceive_freetransfer_exception_file_from_ebbs = BashOperator(\n   task_id="receive_freetransfer_exception_file_from_ebbs",\n   bash_command="echo upload to s3",\n   dag=dag,\n)\n\n\ndef _load_account_table():\n    print("save data to account table")\n\nload_account_table = PythonOperator(\n    task_id="load_account_table",\n    python_callable=_load_account_table,\n    dag=dag,\n)\n\n\ndef _load_transaction_table():\n    print("save data to transaction table")\n\nload_transaction_table = PythonOperator(\n    task_id="load_transaction_table",\n    python_callable=_load_transaction_table,\n    dag=dag,\n)\n\ndef _load_historical_balance():\n    print("save data to account table")\n\nload_historical_balance = PythonOperator(\n    task_id="load_historical_balance",\n    python_callable=_load_historical_balance,\n    dag=dag,\n)\n\n\ndef _free_transfer_quota_monthly():\n    print("save data to account table")\n\nfree_transfer_quota_monthly = PythonOperator(\n    task_id="free_transfer_quota_monthly",\n    python_callable=_free_transfer_quota_monthly,\n    dag=dag,\n)\n\n\ndef _bonus_interest_calc():\n    print("save data to account table")\n\nbonus_interest_calc = PythonOperator(\n    task_id="bonus_interest_calc",\n    python_callable=_bonus_interest_calc,\n    dag=dag,\n)\n\n\ndef _free_transfer_refund_daily():\n    print("save data to account table")\n\nfree_transfer_refund_daily = PythonOperator(\n    task_id="free_transfer_refund_daily",\n    python_callable=_free_transfer_refund_daily,\n    dag=dag,\n)\n\n\ndef _daily_account_summary():\n    print("save data to account table")\n\ndaily_account_summary = PythonOperator(\n    task_id="daily_account_summary",\n    python_callable=_daily_account_summary,\n    dag=dag,\n)\n\n\ngenerate_bonus_interest_file = BashOperator(\n    task_id="generate_bonus_interest_file",\n    bash_command='echo "Finished processing account file"',\n    dag=dag,\n)\n\ngenerate_free_transfer_file = BashOperator(\n    task_id="generate_free_transfer_file",\n    bash_command='echo "Generate Free Transfer File"',\n    dag=dag,\n)\n\n\n\n\n\n\nstart_eod_processing = BashOperator(\n    task_id="start_eod_processing",\n    bash_command='echo "Start processing EOD"',\n    dag=dag,\n)\n\nfinish_eod_processing = BashOperator(\n   task_id="finish_eod_processing",\n   bash_command='echo "Finish Processing EOD"',\n   dag=dag,\n)\n\n\nstart_eod_processing >> [ \n                            receive_account_file_from_ebbs, \n                            receive_txn_file_from_ebbs, \n                            receive_staffhist_file_from_ebbs,\n                            receive_balance_file_from_ebbs,\n                            receive_bonus_exception_file_from_ebbs,\n                            receive_freetransfer_exception_file_from_ebbs\n                        ]\n\n\nreceive_account_file_from_ebbs >> convert_account_file_to_parquet >> load_account_table\nreceive_txn_file_from_ebbs >> convert_txn_file_to_parquet >> [load_transaction_table, free_transfer_refund_daily]\nreceive_staffhist_file_from_ebbs >> convert_staffhist_file_to_parquet\nreceive_balance_file_from_ebbs >> convert_balance_file_to_parquet >> load_historical_balance\n\n[convert_account_file_to_parquet, convert_txn_file_to_parquet, convert_staffhist_file_to_parquet] >> bonus_interest_calc >> generate_bonus_interest_file\n[convert_account_file_to_parquet, convert_staffhist_file_to_parquet] >> free_transfer_quota_monthly\nfree_transfer_refund_daily >> generate_free_transfer_file\n[convert_account_file_to_parquet, convert_txn_file_to_parquet, convert_balance_file_to_parquet] >> daily_account_summary\n\n[load_historical_balance, generate_bonus_interest_file, free_transfer_quota_monthly, generate_free_transfer_file, daily_account_summary] >> finish_eod_processing\n\n	2021-04-04 06:03:21.227878+00
68711774077157549	/opt/airflow/dags/excluded/first.py	import json\nimport pathlib\n \nimport airflow\nimport requests\nimport requests.exceptions as requests_exceptions\nfrom airflow import DAG\nfrom airflow.operators.bash_operator import BashOperator\nfrom airflow.operators.python_operator import PythonOperator\n \ndag = DAG(\n   dag_id="download_rocket_launches",\n   start_date=airflow.utils.dates.days_ago(14),\n   schedule_interval="@daily",\n)\n \ndownload_launches = BashOperator(\n   task_id="download_launches",\n   bash_command="curl -o /tmp/launches.json 'https://launchlibrary.net/1.4/launch?next=5&mode=verbose'",\n   dag=dag,\n)\n \n \ndef _get_pictures():\n   # Ensure directory exists\n   pathlib.Path("/tmp/images").mkdir(parents=True, exist_ok=True)\n \n   # Download all pictures in launches.json\n   with open("/tmp/launches.json") as f:\n       launches = json.load(f)\n       image_urls = [launch["rocket"]["imageURL"] for launch in launches["launches"]]\n       for image_url in image_urls:\n           try:\n               response = requests.get(image_url)\n               image_filename = image_url.split("/")[-1]\n               target_file = f"/tmp/images/{image_filename}"\n               with open(target_file, "wb") as f:\n                   f.write(response.content)\n               print(f"Downloaded {image_url} to {target_file}")\n           except requests_exceptions.MissingSchema:\n               print(f"{image_url} appears to be an invalid URL.")\n           except requests_exceptions.ConnectionError:\n               print(f"Could not connect to {image_url}.")\n \n \nget_pictures = PythonOperator(\n   task_id="get_pictures",\n   python_callable=_get_pictures,\n   dag=dag,\n)\n \nnotify = BashOperator(\n   task_id="notify",\n   bash_command='echo "There are now $(ls /tmp/images/ | wc -l) images."',\n   dag=dag,\n)\n \ndownload_launches >> get_pictures >> notify\n\n\n	2021-04-04 06:03:21.22943+00
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
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2021-04-04 06:03:47.506195	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7516227105
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2021-04-04 06:03:47.546422	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7516227105
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2021-04-04 06:03:47.616005	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	7516227105
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2021-04-04 06:03:47.626781	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	7516227105
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2021-04-04 06:03:47.820651	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7516227105
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2021-04-04 06:03:47.837154	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7516227105
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2021-04-04 06:03:47.976551	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7516227105
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2021-04-04 06:03:47.983759	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7516227105
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2021-04-04 06:03:47.999472	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	7516227105
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2021-04-04 06:03:48.120156	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	7516227105
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2021-04-04 06:03:48.178677	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7516227105
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2021-04-04 06:03:48.188826	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7516227105
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2021-04-04 06:03:48.213748	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7516227105
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-04-04 06:03:48.237867	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	7516227105
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-04-04 06:03:48.241824	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7516227105
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-04-04 06:03:48.245611	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	7516227105
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-04-04 06:03:48.249656	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	7516227105
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2021-04-04 06:03:48.295392	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	7516227105
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2021-04-04 06:03:48.337663	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7516227105
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2021-04-04 06:03:48.344683	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7516227105
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-04-04 06:03:48.832686	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7516227105
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2021-04-04 06:03:48.348734	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7516227105
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2021-04-04 06:03:48.353551	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7516227105
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2021-04-04 06:03:48.375097	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	7516227105
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2021-04-04 06:03:48.380775	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7516227105
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2021-04-04 06:03:48.383788	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7516227105
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2021-04-04 06:03:48.414907	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	7516227105
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2021-04-04 06:03:48.496861	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	7516227105
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2021-04-04 06:03:48.502928	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7516227105
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2021-04-04 06:03:48.565927	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	7516227105
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2021-04-04 06:03:48.579961	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	7516227105
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2021-04-04 06:03:48.597348	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	7516227105
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2021-04-04 06:03:48.603074	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	7516227105
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-04-04 06:03:48.612974	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7516227105
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-04-04 06:03:48.619281	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7516227105
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-04-04 06:03:48.659257	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7516227105
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2021-04-04 06:03:48.666512	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	7516227105
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-04-04 06:03:48.674653	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7516227105
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2021-04-04 06:03:48.68165	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	7516227105
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2021-04-04 06:03:48.688694	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	7516227105
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-04-04 06:03:48.694204	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7516227105
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-04-04 06:03:48.697242	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7516227105
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2021-04-04 06:03:48.703875	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	7516227105
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-04-04 06:03:48.820535	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	7516227105
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2021-04-04 06:03:48.825316	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	7516227105
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-04-04 06:03:48.837714	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	7516227105
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-04-04 06:03:48.84017	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7516227105
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-04-04 06:03:48.881046	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	7516227105
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-04-04 06:03:48.889255	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	7516227105
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2021-04-04 06:03:49.008815	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	7516227105
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2021-04-04 06:03:49.036054	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	7516227105
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2021-04-04 06:03:49.041821	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	7516227105
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2021-04-04 06:03:49.045718	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	7516227105
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2021-04-04 06:03:49.048947	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	7516227105
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-04-04 06:03:49.055864	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	7516227105
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-04-04 06:03:49.062569	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	7516227105
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-04-04 06:03:49.083552	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	7516227105
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-04-04 06:03:49.192375	58	EXECUTED	7:6d4893e36de22369cf73bcb051ded875	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	7516227105
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2021-04-04 06:03:49.222543	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	7516227105
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2021-04-04 06:03:49.23506	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7516227105
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2021-04-04 06:03:49.244113	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	7516227105
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2021-04-04 06:03:49.249553	62	EXECUTED	7:9ac9e58545479929ba23f4a3087a0346	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	3.5.4	\N	\N	7516227105
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2021-04-04 06:03:49.253576	63	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7516227105
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2021-04-04 06:03:49.259683	64	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7516227105
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2021-04-04 06:03:49.264628	65	EXECUTED	7:7d3182f65a34fcc61e8d23def037dc3f	update tableName=RESOURCE_SERVER_RESOURCE		\N	3.5.4	\N	\N	7516227105
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2021-04-04 06:03:49.276372	66	EXECUTED	7:b30039e00a0b9715d430d1b0636728fa	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	3.5.4	\N	\N	7516227105
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2021-04-04 06:03:49.281951	67	EXECUTED	7:3797315ca61d531780f8e6f82f258159	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	3.5.4	\N	\N	7516227105
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2021-04-04 06:03:49.286608	68	EXECUTED	7:c7aa4c8d9573500c2d347c1941ff0301	addColumn tableName=REALM		\N	3.5.4	\N	\N	7516227105
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2021-04-04 06:03:49.297101	69	EXECUTED	7:b207faee394fc074a442ecd42185a5dd	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	3.5.4	\N	\N	7516227105
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2021-04-04 06:03:49.305678	70	EXECUTED	7:ab9a9762faaba4ddfa35514b212c4922	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	3.5.4	\N	\N	7516227105
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2021-04-04 06:03:49.313448	71	EXECUTED	7:b9710f74515a6ccb51b72dc0d19df8c4	addColumn tableName=RESOURCE_SERVER		\N	3.5.4	\N	\N	7516227105
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-04-04 06:03:49.32487	72	EXECUTED	7:ec9707ae4d4f0b7452fee20128083879	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7516227105
8.0.0-updating-credential-data-not-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-04-04 06:03:49.33312	73	EXECUTED	7:03b3f4b264c3c68ba082250a80b74216	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7516227105
8.0.0-updating-credential-data-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-04-04 06:03:49.335372	74	MARK_RAN	7:64c5728f5ca1f5aa4392217701c4fe23	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7516227105
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-04-04 06:03:49.354741	75	EXECUTED	7:b48da8c11a3d83ddd6b7d0c8c2219345	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	3.5.4	\N	\N	7516227105
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-04-04 06:03:49.361863	76	EXECUTED	7:a73379915c23bfad3e8f5c6d5c0aa4bd	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	3.5.4	\N	\N	7516227105
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-04-04 06:03:49.365899	77	EXECUTED	7:39e0073779aba192646291aa2332493d	addColumn tableName=CLIENT		\N	3.5.4	\N	\N	7516227105
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-04-04 06:03:49.368231	78	MARK_RAN	7:81f87368f00450799b4bf42ea0b3ec34	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	3.5.4	\N	\N	7516227105
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-04-04 06:03:49.395694	79	EXECUTED	7:20b37422abb9fb6571c618148f013a15	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	3.5.4	\N	\N	7516227105
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-04-04 06:03:49.398812	80	MARK_RAN	7:1970bb6cfb5ee800736b95ad3fb3c78a	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	3.5.4	\N	\N	7516227105
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-04-04 06:03:49.406757	81	EXECUTED	7:45d9b25fc3b455d522d8dcc10a0f4c80	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	3.5.4	\N	\N	7516227105
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-04-04 06:03:49.40904	82	MARK_RAN	7:890ae73712bc187a66c2813a724d037f	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7516227105
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-04-04 06:03:49.415192	83	EXECUTED	7:0a211980d27fafe3ff50d19a3a29b538	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7516227105
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-04-04 06:03:49.417815	84	MARK_RAN	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7516227105
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-04-04 06:03:49.423092	85	EXECUTED	7:01c49302201bdf815b0a18d1f98a55dc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	7516227105
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2021-04-04 06:03:49.43174	86	EXECUTED	7:3dace6b144c11f53f1ad2c0361279b86	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	3.5.4	\N	\N	7516227105
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
master	0c497609-9f9b-48ca-b4d3-76b40cc7f92a	f
master	e96aea5a-7eef-4c4b-bb2a-e5279a203ded	t
master	cf879014-38fd-4b05-9805-5cc8293c0ec4	t
master	5d34b12c-f1f7-4299-b504-97af209327ce	t
master	19dfa0b1-8487-4c47-99d5-7bb5b4f80dff	f
master	fe8fb693-3ac6-4d64-b482-d734893924bb	f
master	9393d0a3-b793-4c27-a191-f9a2981c34af	t
master	9d030f7f-003a-4d97-b19b-9c3c6608b6df	t
master	00b2c30a-eff0-4c3a-90ce-f6091a09d952	f
airflow	216b55be-f752-4e94-875b-c4cdc6235963	f
airflow	cf215469-27d6-4ba5-86e1-0634d4982992	t
airflow	27645cd5-26a3-40e2-bf16-fc29bbaa1757	t
airflow	9e84fc64-b504-4b1e-b216-8b29e2e21b83	t
airflow	7f24a654-4e9b-4a20-a53e-13dd307c2cc5	f
airflow	a523ffbd-091b-4b1c-9214-de2da8dffc0b	f
airflow	92fadeae-3bdc-4138-bfb0-3ff90de93ff7	t
airflow	f647d5db-5cc2-4aa3-beb7-8ae9bfbd9dbb	t
airflow	94daf9f1-3ed2-4bf8-822c-545be76dacc0	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
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
1	\N	failed	SchedulerJob	2021-04-04 06:03:29.82401+00	\N	2021-04-04 06:06:31.427635+00	SequentialExecutor	28844c705c63	airflow
2	\N	running	SchedulerJob	2021-04-04 06:07:04.160145+00	\N	2021-04-04 06:09:10.594685+00	SequentialExecutor	e7d2b26334df	airflow
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
e808384c-bb5f-424f-9671-4a59c559af85	master	f	${role_admin}	admin	master	\N	master
6aa953a8-a0c5-4ab7-99e3-579cc4974110	master	f	${role_create-realm}	create-realm	master	\N	master
25abbc31-0e34-4622-9eed-0a1c020f22d4	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_create-client}	create-client	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
ba3a851d-f907-43ac-9a57-4ae46d8f8a27	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_view-realm}	view-realm	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
7a362cfb-413f-48fa-923a-efd2283109e3	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_view-users}	view-users	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
7946f363-ba9f-4f92-97fc-22e1b871e8c4	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_view-clients}	view-clients	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
6f273e5a-70cd-47a1-8a1b-75f9a9950e11	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_view-events}	view-events	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
0f82efa1-3a97-489a-ade3-c633bac8eb18	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_view-identity-providers}	view-identity-providers	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
8b8c2409-05f1-450a-a3c3-48ba123779f7	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_view-authorization}	view-authorization	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
a76aefff-8f80-4248-b493-0ff02f142dd1	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_manage-realm}	manage-realm	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
61c2f59a-b575-4d3a-b641-0dc9eee59cc9	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_manage-users}	manage-users	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
d895ed12-8e33-4597-a264-b966b4edfff0	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_manage-clients}	manage-clients	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
9dad5107-a894-48c4-9c54-8035c824b75a	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_manage-events}	manage-events	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
bd8144b1-1645-4496-9c7b-d5d81abfeff7	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_manage-identity-providers}	manage-identity-providers	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
5c086c8c-c9c4-4f92-902a-c030764fed44	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_manage-authorization}	manage-authorization	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
b57a8325-e454-4bb3-bec6-2727f38eba63	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_query-users}	query-users	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
adb207fd-3ae0-4d7c-afa6-9dcbfd631c63	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_query-clients}	query-clients	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
c37a9a5d-51db-479d-a690-42d7f65c8311	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_query-realms}	query-realms	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
ee9ef748-cb39-48de-a336-8b71ac51cb18	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_query-groups}	query-groups	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
64e01b29-0804-406d-ac9e-44b1413e3d73	5b3b9d57-2c61-4590-8b35-c1897ec1af72	t	${role_view-profile}	view-profile	master	5b3b9d57-2c61-4590-8b35-c1897ec1af72	\N
131aa827-ed5f-4a00-99ce-dcea528728c9	5b3b9d57-2c61-4590-8b35-c1897ec1af72	t	${role_manage-account}	manage-account	master	5b3b9d57-2c61-4590-8b35-c1897ec1af72	\N
09fbb88f-e9d2-43db-a288-f61ba57db692	5b3b9d57-2c61-4590-8b35-c1897ec1af72	t	${role_manage-account-links}	manage-account-links	master	5b3b9d57-2c61-4590-8b35-c1897ec1af72	\N
2c4adddb-bb94-41e3-bf13-5c621cfbf95f	5b3b9d57-2c61-4590-8b35-c1897ec1af72	t	${role_view-applications}	view-applications	master	5b3b9d57-2c61-4590-8b35-c1897ec1af72	\N
cdbe0be2-374b-4c71-b22a-0cd212738edb	5b3b9d57-2c61-4590-8b35-c1897ec1af72	t	${role_view-consent}	view-consent	master	5b3b9d57-2c61-4590-8b35-c1897ec1af72	\N
c9e47d4f-4e29-43e7-865a-5a8a8f1d24cc	5b3b9d57-2c61-4590-8b35-c1897ec1af72	t	${role_manage-consent}	manage-consent	master	5b3b9d57-2c61-4590-8b35-c1897ec1af72	\N
551f96fa-f1a8-4dcb-9d16-6f86cf0efd46	a20a6234-7b36-41c7-b4b7-145da911b380	t	${role_read-token}	read-token	master	a20a6234-7b36-41c7-b4b7-145da911b380	\N
7bc40be7-7ca9-483e-88bf-8c0e8fe2837d	95915671-4449-4859-8227-f86ac88e1e7f	t	${role_impersonation}	impersonation	master	95915671-4449-4859-8227-f86ac88e1e7f	\N
6b4545aa-6694-4d2d-866c-730b5b2875a9	master	f	${role_offline-access}	offline_access	master	\N	master
13e30320-64ff-4391-9c31-36a40405a7d5	master	f	${role_uma_authorization}	uma_authorization	master	\N	master
c2bf0dcf-19a0-42e2-92cc-8b78a9f6ed85	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_create-client}	create-client	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
2e45b666-9c25-4755-9fb2-f50c02952338	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_view-realm}	view-realm	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
0ba73a94-d2dc-47f8-aa4a-e444ad2bdd5e	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_view-users}	view-users	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
f6e1bb6f-2e34-493b-9b8f-d96629aec454	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_view-clients}	view-clients	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
d203cb78-6b3c-4c52-8f00-9cafa6b6ed13	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_view-events}	view-events	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
4a918582-c5a3-424a-b7c6-c7f178998ff2	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_view-identity-providers}	view-identity-providers	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
6f206d1e-e061-4bba-9358-299ae02e30a6	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_view-authorization}	view-authorization	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
dd592aa6-a723-4a69-837a-8d7fa8be3633	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_manage-realm}	manage-realm	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
effc3e61-4d8b-4fc7-b058-6029f63adcdb	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_manage-users}	manage-users	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
a5dc3ef8-b609-476a-86e1-179f5e4f43fe	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_manage-clients}	manage-clients	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
b2516ffa-bf76-405c-862a-88452a6603f6	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_manage-events}	manage-events	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
b5f79555-0e69-4913-aad3-bd16c8aa750e	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_manage-identity-providers}	manage-identity-providers	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
f1b8b757-3e1c-4444-9e53-ae74fb98b0ab	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_manage-authorization}	manage-authorization	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
ccbbe8cb-229c-4c9b-a5cd-68164894bf70	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_query-users}	query-users	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
d691e7b7-ca82-497d-822e-1b01cbae80c6	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_query-clients}	query-clients	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
76881586-21c0-4d95-84b5-5b494c46a254	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_query-realms}	query-realms	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
1fc43568-cb08-472f-af7f-fe64274f512c	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_query-groups}	query-groups	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
0a3bc571-d7fa-4f33-b990-d975ab9d9c1b	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_realm-admin}	realm-admin	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
a54a5859-6603-49ff-be9c-5154e23c2c10	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_create-client}	create-client	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
25d5d317-ca13-4ef2-9f36-43a991ac746f	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_view-realm}	view-realm	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
d4c418f9-d734-46d9-a718-29cd0fdc58b6	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_view-users}	view-users	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
fdda3c77-1f34-4a3e-82f2-273bf0b198f9	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_view-clients}	view-clients	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
cb042a5e-08af-4c94-a32c-e78cd7bc2f61	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_view-events}	view-events	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
d71492bf-e975-4988-9dbb-e4e68a3ee7f0	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_view-identity-providers}	view-identity-providers	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
e2c275a8-5745-4b82-ad08-063bf8ad9669	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_view-authorization}	view-authorization	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
31c36937-e18f-40a1-8fd5-069be9dc99f8	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_manage-realm}	manage-realm	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
460a1578-41ea-405c-b548-f1ada7dcb0be	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_manage-users}	manage-users	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
9cf5d81c-4b02-4eaf-8b88-2d049e7cdb0a	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_manage-clients}	manage-clients	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
4726ca9f-62c8-4057-9a83-5ded0aa8e556	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_manage-events}	manage-events	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
1f6343d1-1701-404d-beac-43edb1801f60	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_manage-identity-providers}	manage-identity-providers	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
1b15cf28-cbb5-466b-a941-c41266595477	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_manage-authorization}	manage-authorization	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
a274c37f-38bd-49d8-9f6e-dabf614fa4d5	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_query-users}	query-users	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
7c6e921d-3ad2-4a83-9a4c-3213e82f4b24	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_query-clients}	query-clients	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
48bc2a82-dada-4948-b30c-096b50537e32	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_query-realms}	query-realms	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
1aafbe59-0724-4014-b1a6-67f8995acef5	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_query-groups}	query-groups	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
4d8b77f4-301f-4f60-ae55-91c91a88e049	ed32d811-13cd-4bb9-802a-c62403a1066c	t	${role_view-profile}	view-profile	airflow	ed32d811-13cd-4bb9-802a-c62403a1066c	\N
6c1bf37c-e56a-480e-a15f-04399dc286e0	ed32d811-13cd-4bb9-802a-c62403a1066c	t	${role_manage-account}	manage-account	airflow	ed32d811-13cd-4bb9-802a-c62403a1066c	\N
3e8cb93b-fd14-4aae-8058-8680f09faef3	ed32d811-13cd-4bb9-802a-c62403a1066c	t	${role_manage-account-links}	manage-account-links	airflow	ed32d811-13cd-4bb9-802a-c62403a1066c	\N
ad590da5-40c3-4b50-9cfc-5fa1fb165798	ed32d811-13cd-4bb9-802a-c62403a1066c	t	${role_view-applications}	view-applications	airflow	ed32d811-13cd-4bb9-802a-c62403a1066c	\N
6fdbbebe-7729-40dd-bb8b-615d2c35d44b	ed32d811-13cd-4bb9-802a-c62403a1066c	t	${role_view-consent}	view-consent	airflow	ed32d811-13cd-4bb9-802a-c62403a1066c	\N
fa2df100-e9eb-4c00-806a-7e6bed7b1132	ed32d811-13cd-4bb9-802a-c62403a1066c	t	${role_manage-consent}	manage-consent	airflow	ed32d811-13cd-4bb9-802a-c62403a1066c	\N
3ca74fb8-afdb-43b2-b472-775faab451bc	cbd875c8-4ed0-4972-a16a-2af5b1435de7	t	${role_impersonation}	impersonation	master	cbd875c8-4ed0-4972-a16a-2af5b1435de7	\N
d95471f3-acce-46e5-8a93-71535156fbd8	3ab486d0-d15f-42ec-afa2-5b862ee380fd	t	${role_impersonation}	impersonation	airflow	3ab486d0-d15f-42ec-afa2-5b862ee380fd	\N
a4c8d67c-4ea7-4a50-bfb5-eb2951fbb718	2ebd41f9-0c0d-4ae6-929c-e83eea3fa1fa	t	${role_read-token}	read-token	airflow	2ebd41f9-0c0d-4ae6-929c-e83eea3fa1fa	\N
4b50a98f-907a-4cf7-a464-7a153de3ed47	airflow	f	${role_offline-access}	offline_access	airflow	\N	airflow
552706f3-8124-43d7-a6fd-1304733fa98d	airflow	f	\N	uma_authorization	airflow	\N	airflow
e9d3cdff-54f8-4eda-8ab4-bcbaf6159f63	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	t	\N	uma_protection	airflow	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
c62203d8-47b6-462b-bf62-f58c9d9077e7	airflow	f	Admin	Admin	airflow	\N	airflow
9c40be09-6079-4171-986f-f52f104a4507	airflow	f	User	User	airflow	\N	airflow
6933793c-2fc2-4d0e-be5f-a75bdb57539b	airflow	f	Viewer	Viewer	airflow	\N	airflow
407c85c4-7560-40a4-b408-65be170eb49b	airflow	f	Public	Public	airflow	\N	airflow
\.


--
-- Data for Name: log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log (id, dttm, dag_id, task_id, event, execution_date, owner, extra) FROM stdin;
1	2021-04-04 06:03:24.583932+00	\N	\N	cli_users_create	\N	airflow	{"host_name": "28844c705c63", "full_command": "['/home/airflow/.local/bin/airflow', 'users', 'create', '-u', 'admin', '-p', '********', '-r', 'Admin', '-e', 'admin@gmail.com', '-f', 'Admin', '-l', 'User']"}
2	2021-04-04 06:03:29.806414+00	\N	\N	cli_scheduler	\N	airflow	{"host_name": "28844c705c63", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}
3	2021-04-04 06:03:33.181962+00	\N	\N	cli_webserver	\N	airflow	{"host_name": "28844c705c63", "full_command": "['/home/airflow/.local/bin/airflow', 'webserver']"}
4	2021-04-04 06:06:59.651476+00	\N	\N	cli_users_create	\N	airflow	{"host_name": "e7d2b26334df", "full_command": "['/home/airflow/.local/bin/airflow', 'users', 'create', '-u', 'admin', '-p', '********', '-r', 'Admin', '-e', 'admin@gmail.com', '-f', 'Admin', '-l', 'User']"}
5	2021-04-04 06:07:04.14241+00	\N	\N	cli_scheduler	\N	airflow	{"host_name": "e7d2b26334df", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}
6	2021-04-04 06:07:07.422986+00	\N	\N	cli_webserver	\N	airflow	{"host_name": "e7d2b26334df", "full_command": "['/home/airflow/.local/bin/airflow', 'webserver']"}
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migration_model (id, version, update_time) FROM stdin;
usyut	11.0.3	1617516235
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
09bdb556-ebab-4c5c-a8eb-6af95d4c556c	code	// by default, grants any permission associated with this policy\n$evaluation.grant();\n
4368f5ed-5245-403a-ae26-640263ad94d5	defaultResourceType	urn:airflow-client:resources:default
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
80f63e15-90aa-4fbf-a591-ceca6abd408f	audience resolve	openid-connect	oidc-audience-resolve-mapper	51eba8bc-a057-4358-8da0-7a13e46e57c7	\N
141a521d-fe7d-4deb-8c04-aed62ffe70f4	locale	openid-connect	oidc-usermodel-attribute-mapper	6284fc76-4ef0-4085-9135-c7fd24d3a945	\N
a4b89bb2-0ba0-49c5-8128-b7721255a41b	role list	saml	saml-role-list-mapper	\N	e96aea5a-7eef-4c4b-bb2a-e5279a203ded
95aa77ee-b47f-4298-8193-f25b311cfaa5	full name	openid-connect	oidc-full-name-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
b2da0043-f00f-4632-9c94-118bc68c686a	family name	openid-connect	oidc-usermodel-property-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
9d630575-b41d-40a5-8161-9bf4751e9f76	given name	openid-connect	oidc-usermodel-property-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
ec09526a-19a1-42e4-be03-894842eb02fb	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
cf850461-7e73-4417-a875-54d81a4b0c93	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
8896455f-ced4-427f-9760-345dc32f1071	username	openid-connect	oidc-usermodel-property-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
841bb14c-675e-40cc-b40d-7277e09952f9	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
0b18ab15-ecb2-470f-bb08-d6888ae12f44	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
54f609a4-d5bb-441e-ba23-ceb2f8b50bd8	website	openid-connect	oidc-usermodel-attribute-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
6e66e121-4914-4839-939f-053ef63521ff	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
c0b7970d-d5f9-427a-bb92-a0206ae31709	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
3cd76dc9-4acc-4470-ae81-e375d4a5a356	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
d1fea228-e19b-4ae6-8c30-793b7a709462	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
e7d29b9f-d5f6-4459-a278-bd8043e8b2a6	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	cf879014-38fd-4b05-9805-5cc8293c0ec4
deda3b2f-b0e1-448e-aae7-2dbd0fb8080d	email	openid-connect	oidc-usermodel-property-mapper	\N	5d34b12c-f1f7-4299-b504-97af209327ce
e8031a38-567f-42c0-804f-20c3e19725e2	email verified	openid-connect	oidc-usermodel-property-mapper	\N	5d34b12c-f1f7-4299-b504-97af209327ce
c58d0981-981b-4580-8cc8-62f56b26f847	address	openid-connect	oidc-address-mapper	\N	19dfa0b1-8487-4c47-99d5-7bb5b4f80dff
a4ba614c-a64b-4897-acc6-2beedc6886f8	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	fe8fb693-3ac6-4d64-b482-d734893924bb
b80c6741-bf92-497b-b768-dcffbaed08c2	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	fe8fb693-3ac6-4d64-b482-d734893924bb
1a492e10-c506-4344-b898-c694a0e903cf	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	9393d0a3-b793-4c27-a191-f9a2981c34af
66dac702-473d-40db-b730-ebc3d019bbf5	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	9393d0a3-b793-4c27-a191-f9a2981c34af
36a5f6bc-6a9d-4dd1-9753-201a5d39d9d2	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	9393d0a3-b793-4c27-a191-f9a2981c34af
21ded2ca-9e5b-48ec-9ecf-99f9ca6b5632	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	9d030f7f-003a-4d97-b19b-9c3c6608b6df
62167ce1-3d91-4eeb-9b8c-bed6a83186de	upn	openid-connect	oidc-usermodel-property-mapper	\N	00b2c30a-eff0-4c3a-90ce-f6091a09d952
bcdecf22-0676-4bfc-b698-d2359a375980	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	00b2c30a-eff0-4c3a-90ce-f6091a09d952
fca3c090-c946-4c11-a4de-f8dff5478868	audience resolve	openid-connect	oidc-audience-resolve-mapper	21b3d652-6bd1-44eb-af0c-7a5c4869e490	\N
198d3ce2-758f-4fc0-a022-3714141d8aae	role list	saml	saml-role-list-mapper	\N	cf215469-27d6-4ba5-86e1-0634d4982992
bf8a6e52-9418-43a2-9f6d-a542d72e1a5f	full name	openid-connect	oidc-full-name-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
0a972e43-e4b7-4d25-9b64-c68caddff15a	family name	openid-connect	oidc-usermodel-property-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
b84f515b-82b1-475e-b169-1dd76278b38f	given name	openid-connect	oidc-usermodel-property-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
6564b1c8-204d-4a82-9247-ee403405b352	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
dacd5947-b673-4023-945d-357a65c76c44	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
8d6a19d1-7468-4a3c-ad1a-fc6308b80937	username	openid-connect	oidc-usermodel-property-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
4be6db77-e231-4bae-9c40-6a10be9ec7c1	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
23071432-509f-4b2c-ae83-ea0ba3aae66d	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
bf4461ca-c3a0-4491-a003-f488b11db193	website	openid-connect	oidc-usermodel-attribute-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
e15cbd0e-7c78-46fb-a3a6-d8bb8335e858	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
b70de522-7dfa-4074-a0ef-f394772a57a9	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
433a8e03-3cca-477f-b85a-49ccb86d4183	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
0fa487cf-531d-40b4-bbaf-248cbf1237ed	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
de95f695-0d0f-4b1c-9dc4-72981e69fa61	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	27645cd5-26a3-40e2-bf16-fc29bbaa1757
a5abaf85-6912-4bb3-be5e-e46ec52b7d42	email	openid-connect	oidc-usermodel-property-mapper	\N	9e84fc64-b504-4b1e-b216-8b29e2e21b83
58ad69e8-e79d-45ea-9c27-794d5ab85c8d	email verified	openid-connect	oidc-usermodel-property-mapper	\N	9e84fc64-b504-4b1e-b216-8b29e2e21b83
53d9b8a4-2e92-4d54-b6f5-8b2034c6a111	address	openid-connect	oidc-address-mapper	\N	7f24a654-4e9b-4a20-a53e-13dd307c2cc5
a9766eb4-a466-4198-b1b0-d2277e44f744	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	a523ffbd-091b-4b1c-9214-de2da8dffc0b
416a234c-0a6f-4268-9fd5-44bec2c34a6d	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	a523ffbd-091b-4b1c-9214-de2da8dffc0b
e4422047-6859-48be-99dd-84c2afdc92b4	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	92fadeae-3bdc-4138-bfb0-3ff90de93ff7
fcc02efc-ccc5-4b20-b4e3-3fbd8aa99742	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	92fadeae-3bdc-4138-bfb0-3ff90de93ff7
af285b10-0792-4eba-b54b-596a6747f5f1	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	92fadeae-3bdc-4138-bfb0-3ff90de93ff7
fa9efba5-a801-403d-b996-de6d5fa3b690	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	f647d5db-5cc2-4aa3-beb7-8ae9bfbd9dbb
6426103b-7ec5-4257-967d-2ca35870181b	upn	openid-connect	oidc-usermodel-property-mapper	\N	94daf9f1-3ed2-4bf8-822c-545be76dacc0
2572ba3f-5407-40d3-8cd4-917e539763b8	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	94daf9f1-3ed2-4bf8-822c-545be76dacc0
50ec4684-1b3f-4b27-959e-eb69c077ae78	locale	openid-connect	oidc-usermodel-attribute-mapper	40ba7753-19bd-4b03-a70f-8dc681d31d69	\N
0b998258-a682-4ccf-9486-24e553344b92	realm-roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	025074e3-3874-4263-b026-489587d3417f
f5594f19-9730-4389-8e71-d5ec38737664	realm-roles	openid-connect	oidc-usermodel-realm-role-mapper	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
8df9d14e-6246-4d35-9268-d1fc15556b27	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
432857fe-1090-4331-8b7f-faab10282ecb	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
a22cc46e-8f58-4f97-91e1-b956f16dc89e	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
141a521d-fe7d-4deb-8c04-aed62ffe70f4	true	userinfo.token.claim
141a521d-fe7d-4deb-8c04-aed62ffe70f4	locale	user.attribute
141a521d-fe7d-4deb-8c04-aed62ffe70f4	true	id.token.claim
141a521d-fe7d-4deb-8c04-aed62ffe70f4	true	access.token.claim
141a521d-fe7d-4deb-8c04-aed62ffe70f4	locale	claim.name
141a521d-fe7d-4deb-8c04-aed62ffe70f4	String	jsonType.label
a4b89bb2-0ba0-49c5-8128-b7721255a41b	false	single
a4b89bb2-0ba0-49c5-8128-b7721255a41b	Basic	attribute.nameformat
a4b89bb2-0ba0-49c5-8128-b7721255a41b	Role	attribute.name
95aa77ee-b47f-4298-8193-f25b311cfaa5	true	userinfo.token.claim
95aa77ee-b47f-4298-8193-f25b311cfaa5	true	id.token.claim
95aa77ee-b47f-4298-8193-f25b311cfaa5	true	access.token.claim
b2da0043-f00f-4632-9c94-118bc68c686a	true	userinfo.token.claim
b2da0043-f00f-4632-9c94-118bc68c686a	lastName	user.attribute
b2da0043-f00f-4632-9c94-118bc68c686a	true	id.token.claim
b2da0043-f00f-4632-9c94-118bc68c686a	true	access.token.claim
b2da0043-f00f-4632-9c94-118bc68c686a	family_name	claim.name
b2da0043-f00f-4632-9c94-118bc68c686a	String	jsonType.label
9d630575-b41d-40a5-8161-9bf4751e9f76	true	userinfo.token.claim
9d630575-b41d-40a5-8161-9bf4751e9f76	firstName	user.attribute
9d630575-b41d-40a5-8161-9bf4751e9f76	true	id.token.claim
9d630575-b41d-40a5-8161-9bf4751e9f76	true	access.token.claim
9d630575-b41d-40a5-8161-9bf4751e9f76	given_name	claim.name
9d630575-b41d-40a5-8161-9bf4751e9f76	String	jsonType.label
ec09526a-19a1-42e4-be03-894842eb02fb	true	userinfo.token.claim
ec09526a-19a1-42e4-be03-894842eb02fb	middleName	user.attribute
ec09526a-19a1-42e4-be03-894842eb02fb	true	id.token.claim
ec09526a-19a1-42e4-be03-894842eb02fb	true	access.token.claim
ec09526a-19a1-42e4-be03-894842eb02fb	middle_name	claim.name
ec09526a-19a1-42e4-be03-894842eb02fb	String	jsonType.label
cf850461-7e73-4417-a875-54d81a4b0c93	true	userinfo.token.claim
cf850461-7e73-4417-a875-54d81a4b0c93	nickname	user.attribute
cf850461-7e73-4417-a875-54d81a4b0c93	true	id.token.claim
cf850461-7e73-4417-a875-54d81a4b0c93	true	access.token.claim
cf850461-7e73-4417-a875-54d81a4b0c93	nickname	claim.name
cf850461-7e73-4417-a875-54d81a4b0c93	String	jsonType.label
8896455f-ced4-427f-9760-345dc32f1071	true	userinfo.token.claim
8896455f-ced4-427f-9760-345dc32f1071	username	user.attribute
8896455f-ced4-427f-9760-345dc32f1071	true	id.token.claim
8896455f-ced4-427f-9760-345dc32f1071	true	access.token.claim
8896455f-ced4-427f-9760-345dc32f1071	preferred_username	claim.name
8896455f-ced4-427f-9760-345dc32f1071	String	jsonType.label
841bb14c-675e-40cc-b40d-7277e09952f9	true	userinfo.token.claim
841bb14c-675e-40cc-b40d-7277e09952f9	profile	user.attribute
841bb14c-675e-40cc-b40d-7277e09952f9	true	id.token.claim
841bb14c-675e-40cc-b40d-7277e09952f9	true	access.token.claim
841bb14c-675e-40cc-b40d-7277e09952f9	profile	claim.name
841bb14c-675e-40cc-b40d-7277e09952f9	String	jsonType.label
0b18ab15-ecb2-470f-bb08-d6888ae12f44	true	userinfo.token.claim
0b18ab15-ecb2-470f-bb08-d6888ae12f44	picture	user.attribute
0b18ab15-ecb2-470f-bb08-d6888ae12f44	true	id.token.claim
0b18ab15-ecb2-470f-bb08-d6888ae12f44	true	access.token.claim
0b18ab15-ecb2-470f-bb08-d6888ae12f44	picture	claim.name
0b18ab15-ecb2-470f-bb08-d6888ae12f44	String	jsonType.label
54f609a4-d5bb-441e-ba23-ceb2f8b50bd8	true	userinfo.token.claim
54f609a4-d5bb-441e-ba23-ceb2f8b50bd8	website	user.attribute
54f609a4-d5bb-441e-ba23-ceb2f8b50bd8	true	id.token.claim
54f609a4-d5bb-441e-ba23-ceb2f8b50bd8	true	access.token.claim
54f609a4-d5bb-441e-ba23-ceb2f8b50bd8	website	claim.name
54f609a4-d5bb-441e-ba23-ceb2f8b50bd8	String	jsonType.label
6e66e121-4914-4839-939f-053ef63521ff	true	userinfo.token.claim
6e66e121-4914-4839-939f-053ef63521ff	gender	user.attribute
6e66e121-4914-4839-939f-053ef63521ff	true	id.token.claim
6e66e121-4914-4839-939f-053ef63521ff	true	access.token.claim
6e66e121-4914-4839-939f-053ef63521ff	gender	claim.name
6e66e121-4914-4839-939f-053ef63521ff	String	jsonType.label
c0b7970d-d5f9-427a-bb92-a0206ae31709	true	userinfo.token.claim
c0b7970d-d5f9-427a-bb92-a0206ae31709	birthdate	user.attribute
c0b7970d-d5f9-427a-bb92-a0206ae31709	true	id.token.claim
c0b7970d-d5f9-427a-bb92-a0206ae31709	true	access.token.claim
c0b7970d-d5f9-427a-bb92-a0206ae31709	birthdate	claim.name
c0b7970d-d5f9-427a-bb92-a0206ae31709	String	jsonType.label
3cd76dc9-4acc-4470-ae81-e375d4a5a356	true	userinfo.token.claim
3cd76dc9-4acc-4470-ae81-e375d4a5a356	zoneinfo	user.attribute
3cd76dc9-4acc-4470-ae81-e375d4a5a356	true	id.token.claim
3cd76dc9-4acc-4470-ae81-e375d4a5a356	true	access.token.claim
3cd76dc9-4acc-4470-ae81-e375d4a5a356	zoneinfo	claim.name
3cd76dc9-4acc-4470-ae81-e375d4a5a356	String	jsonType.label
d1fea228-e19b-4ae6-8c30-793b7a709462	true	userinfo.token.claim
d1fea228-e19b-4ae6-8c30-793b7a709462	locale	user.attribute
d1fea228-e19b-4ae6-8c30-793b7a709462	true	id.token.claim
d1fea228-e19b-4ae6-8c30-793b7a709462	true	access.token.claim
d1fea228-e19b-4ae6-8c30-793b7a709462	locale	claim.name
d1fea228-e19b-4ae6-8c30-793b7a709462	String	jsonType.label
e7d29b9f-d5f6-4459-a278-bd8043e8b2a6	true	userinfo.token.claim
e7d29b9f-d5f6-4459-a278-bd8043e8b2a6	updatedAt	user.attribute
e7d29b9f-d5f6-4459-a278-bd8043e8b2a6	true	id.token.claim
e7d29b9f-d5f6-4459-a278-bd8043e8b2a6	true	access.token.claim
e7d29b9f-d5f6-4459-a278-bd8043e8b2a6	updated_at	claim.name
e7d29b9f-d5f6-4459-a278-bd8043e8b2a6	String	jsonType.label
deda3b2f-b0e1-448e-aae7-2dbd0fb8080d	true	userinfo.token.claim
deda3b2f-b0e1-448e-aae7-2dbd0fb8080d	email	user.attribute
deda3b2f-b0e1-448e-aae7-2dbd0fb8080d	true	id.token.claim
deda3b2f-b0e1-448e-aae7-2dbd0fb8080d	true	access.token.claim
deda3b2f-b0e1-448e-aae7-2dbd0fb8080d	email	claim.name
deda3b2f-b0e1-448e-aae7-2dbd0fb8080d	String	jsonType.label
e8031a38-567f-42c0-804f-20c3e19725e2	true	userinfo.token.claim
e8031a38-567f-42c0-804f-20c3e19725e2	emailVerified	user.attribute
e8031a38-567f-42c0-804f-20c3e19725e2	true	id.token.claim
e8031a38-567f-42c0-804f-20c3e19725e2	true	access.token.claim
e8031a38-567f-42c0-804f-20c3e19725e2	email_verified	claim.name
e8031a38-567f-42c0-804f-20c3e19725e2	boolean	jsonType.label
c58d0981-981b-4580-8cc8-62f56b26f847	formatted	user.attribute.formatted
c58d0981-981b-4580-8cc8-62f56b26f847	country	user.attribute.country
c58d0981-981b-4580-8cc8-62f56b26f847	postal_code	user.attribute.postal_code
c58d0981-981b-4580-8cc8-62f56b26f847	true	userinfo.token.claim
c58d0981-981b-4580-8cc8-62f56b26f847	street	user.attribute.street
c58d0981-981b-4580-8cc8-62f56b26f847	true	id.token.claim
c58d0981-981b-4580-8cc8-62f56b26f847	region	user.attribute.region
c58d0981-981b-4580-8cc8-62f56b26f847	true	access.token.claim
c58d0981-981b-4580-8cc8-62f56b26f847	locality	user.attribute.locality
a4ba614c-a64b-4897-acc6-2beedc6886f8	true	userinfo.token.claim
a4ba614c-a64b-4897-acc6-2beedc6886f8	phoneNumber	user.attribute
a4ba614c-a64b-4897-acc6-2beedc6886f8	true	id.token.claim
a4ba614c-a64b-4897-acc6-2beedc6886f8	true	access.token.claim
a4ba614c-a64b-4897-acc6-2beedc6886f8	phone_number	claim.name
a4ba614c-a64b-4897-acc6-2beedc6886f8	String	jsonType.label
b80c6741-bf92-497b-b768-dcffbaed08c2	true	userinfo.token.claim
b80c6741-bf92-497b-b768-dcffbaed08c2	phoneNumberVerified	user.attribute
b80c6741-bf92-497b-b768-dcffbaed08c2	true	id.token.claim
b80c6741-bf92-497b-b768-dcffbaed08c2	true	access.token.claim
b80c6741-bf92-497b-b768-dcffbaed08c2	phone_number_verified	claim.name
b80c6741-bf92-497b-b768-dcffbaed08c2	boolean	jsonType.label
1a492e10-c506-4344-b898-c694a0e903cf	true	multivalued
1a492e10-c506-4344-b898-c694a0e903cf	foo	user.attribute
1a492e10-c506-4344-b898-c694a0e903cf	true	access.token.claim
1a492e10-c506-4344-b898-c694a0e903cf	realm_access.roles	claim.name
1a492e10-c506-4344-b898-c694a0e903cf	String	jsonType.label
66dac702-473d-40db-b730-ebc3d019bbf5	true	multivalued
66dac702-473d-40db-b730-ebc3d019bbf5	foo	user.attribute
66dac702-473d-40db-b730-ebc3d019bbf5	true	access.token.claim
66dac702-473d-40db-b730-ebc3d019bbf5	resource_access.${client_id}.roles	claim.name
66dac702-473d-40db-b730-ebc3d019bbf5	String	jsonType.label
62167ce1-3d91-4eeb-9b8c-bed6a83186de	true	userinfo.token.claim
62167ce1-3d91-4eeb-9b8c-bed6a83186de	username	user.attribute
62167ce1-3d91-4eeb-9b8c-bed6a83186de	true	id.token.claim
62167ce1-3d91-4eeb-9b8c-bed6a83186de	true	access.token.claim
62167ce1-3d91-4eeb-9b8c-bed6a83186de	upn	claim.name
62167ce1-3d91-4eeb-9b8c-bed6a83186de	String	jsonType.label
bcdecf22-0676-4bfc-b698-d2359a375980	true	multivalued
bcdecf22-0676-4bfc-b698-d2359a375980	foo	user.attribute
bcdecf22-0676-4bfc-b698-d2359a375980	true	id.token.claim
bcdecf22-0676-4bfc-b698-d2359a375980	true	access.token.claim
bcdecf22-0676-4bfc-b698-d2359a375980	groups	claim.name
bcdecf22-0676-4bfc-b698-d2359a375980	String	jsonType.label
198d3ce2-758f-4fc0-a022-3714141d8aae	false	single
198d3ce2-758f-4fc0-a022-3714141d8aae	Basic	attribute.nameformat
198d3ce2-758f-4fc0-a022-3714141d8aae	Role	attribute.name
bf8a6e52-9418-43a2-9f6d-a542d72e1a5f	true	userinfo.token.claim
bf8a6e52-9418-43a2-9f6d-a542d72e1a5f	true	id.token.claim
bf8a6e52-9418-43a2-9f6d-a542d72e1a5f	true	access.token.claim
0a972e43-e4b7-4d25-9b64-c68caddff15a	true	userinfo.token.claim
0a972e43-e4b7-4d25-9b64-c68caddff15a	lastName	user.attribute
0a972e43-e4b7-4d25-9b64-c68caddff15a	true	id.token.claim
0a972e43-e4b7-4d25-9b64-c68caddff15a	true	access.token.claim
0a972e43-e4b7-4d25-9b64-c68caddff15a	family_name	claim.name
0a972e43-e4b7-4d25-9b64-c68caddff15a	String	jsonType.label
b84f515b-82b1-475e-b169-1dd76278b38f	true	userinfo.token.claim
b84f515b-82b1-475e-b169-1dd76278b38f	firstName	user.attribute
b84f515b-82b1-475e-b169-1dd76278b38f	true	id.token.claim
b84f515b-82b1-475e-b169-1dd76278b38f	true	access.token.claim
b84f515b-82b1-475e-b169-1dd76278b38f	given_name	claim.name
b84f515b-82b1-475e-b169-1dd76278b38f	String	jsonType.label
6564b1c8-204d-4a82-9247-ee403405b352	true	userinfo.token.claim
6564b1c8-204d-4a82-9247-ee403405b352	middleName	user.attribute
6564b1c8-204d-4a82-9247-ee403405b352	true	id.token.claim
6564b1c8-204d-4a82-9247-ee403405b352	true	access.token.claim
6564b1c8-204d-4a82-9247-ee403405b352	middle_name	claim.name
6564b1c8-204d-4a82-9247-ee403405b352	String	jsonType.label
dacd5947-b673-4023-945d-357a65c76c44	true	userinfo.token.claim
dacd5947-b673-4023-945d-357a65c76c44	nickname	user.attribute
dacd5947-b673-4023-945d-357a65c76c44	true	id.token.claim
dacd5947-b673-4023-945d-357a65c76c44	true	access.token.claim
dacd5947-b673-4023-945d-357a65c76c44	nickname	claim.name
dacd5947-b673-4023-945d-357a65c76c44	String	jsonType.label
8d6a19d1-7468-4a3c-ad1a-fc6308b80937	true	userinfo.token.claim
8d6a19d1-7468-4a3c-ad1a-fc6308b80937	username	user.attribute
8d6a19d1-7468-4a3c-ad1a-fc6308b80937	true	id.token.claim
8d6a19d1-7468-4a3c-ad1a-fc6308b80937	true	access.token.claim
8d6a19d1-7468-4a3c-ad1a-fc6308b80937	preferred_username	claim.name
8d6a19d1-7468-4a3c-ad1a-fc6308b80937	String	jsonType.label
4be6db77-e231-4bae-9c40-6a10be9ec7c1	true	userinfo.token.claim
4be6db77-e231-4bae-9c40-6a10be9ec7c1	profile	user.attribute
4be6db77-e231-4bae-9c40-6a10be9ec7c1	true	id.token.claim
4be6db77-e231-4bae-9c40-6a10be9ec7c1	true	access.token.claim
4be6db77-e231-4bae-9c40-6a10be9ec7c1	profile	claim.name
4be6db77-e231-4bae-9c40-6a10be9ec7c1	String	jsonType.label
23071432-509f-4b2c-ae83-ea0ba3aae66d	true	userinfo.token.claim
23071432-509f-4b2c-ae83-ea0ba3aae66d	picture	user.attribute
23071432-509f-4b2c-ae83-ea0ba3aae66d	true	id.token.claim
23071432-509f-4b2c-ae83-ea0ba3aae66d	true	access.token.claim
23071432-509f-4b2c-ae83-ea0ba3aae66d	picture	claim.name
23071432-509f-4b2c-ae83-ea0ba3aae66d	String	jsonType.label
bf4461ca-c3a0-4491-a003-f488b11db193	true	userinfo.token.claim
bf4461ca-c3a0-4491-a003-f488b11db193	website	user.attribute
bf4461ca-c3a0-4491-a003-f488b11db193	true	id.token.claim
bf4461ca-c3a0-4491-a003-f488b11db193	true	access.token.claim
bf4461ca-c3a0-4491-a003-f488b11db193	website	claim.name
bf4461ca-c3a0-4491-a003-f488b11db193	String	jsonType.label
e15cbd0e-7c78-46fb-a3a6-d8bb8335e858	true	userinfo.token.claim
e15cbd0e-7c78-46fb-a3a6-d8bb8335e858	gender	user.attribute
e15cbd0e-7c78-46fb-a3a6-d8bb8335e858	true	id.token.claim
e15cbd0e-7c78-46fb-a3a6-d8bb8335e858	true	access.token.claim
e15cbd0e-7c78-46fb-a3a6-d8bb8335e858	gender	claim.name
e15cbd0e-7c78-46fb-a3a6-d8bb8335e858	String	jsonType.label
b70de522-7dfa-4074-a0ef-f394772a57a9	true	userinfo.token.claim
b70de522-7dfa-4074-a0ef-f394772a57a9	birthdate	user.attribute
b70de522-7dfa-4074-a0ef-f394772a57a9	true	id.token.claim
b70de522-7dfa-4074-a0ef-f394772a57a9	true	access.token.claim
b70de522-7dfa-4074-a0ef-f394772a57a9	birthdate	claim.name
b70de522-7dfa-4074-a0ef-f394772a57a9	String	jsonType.label
433a8e03-3cca-477f-b85a-49ccb86d4183	true	userinfo.token.claim
433a8e03-3cca-477f-b85a-49ccb86d4183	zoneinfo	user.attribute
433a8e03-3cca-477f-b85a-49ccb86d4183	true	id.token.claim
433a8e03-3cca-477f-b85a-49ccb86d4183	true	access.token.claim
433a8e03-3cca-477f-b85a-49ccb86d4183	zoneinfo	claim.name
433a8e03-3cca-477f-b85a-49ccb86d4183	String	jsonType.label
0fa487cf-531d-40b4-bbaf-248cbf1237ed	true	userinfo.token.claim
0fa487cf-531d-40b4-bbaf-248cbf1237ed	locale	user.attribute
0fa487cf-531d-40b4-bbaf-248cbf1237ed	true	id.token.claim
0fa487cf-531d-40b4-bbaf-248cbf1237ed	true	access.token.claim
0fa487cf-531d-40b4-bbaf-248cbf1237ed	locale	claim.name
0fa487cf-531d-40b4-bbaf-248cbf1237ed	String	jsonType.label
de95f695-0d0f-4b1c-9dc4-72981e69fa61	true	userinfo.token.claim
de95f695-0d0f-4b1c-9dc4-72981e69fa61	updatedAt	user.attribute
de95f695-0d0f-4b1c-9dc4-72981e69fa61	true	id.token.claim
de95f695-0d0f-4b1c-9dc4-72981e69fa61	true	access.token.claim
de95f695-0d0f-4b1c-9dc4-72981e69fa61	updated_at	claim.name
de95f695-0d0f-4b1c-9dc4-72981e69fa61	String	jsonType.label
a5abaf85-6912-4bb3-be5e-e46ec52b7d42	true	userinfo.token.claim
a5abaf85-6912-4bb3-be5e-e46ec52b7d42	email	user.attribute
a5abaf85-6912-4bb3-be5e-e46ec52b7d42	true	id.token.claim
a5abaf85-6912-4bb3-be5e-e46ec52b7d42	true	access.token.claim
a5abaf85-6912-4bb3-be5e-e46ec52b7d42	email	claim.name
a5abaf85-6912-4bb3-be5e-e46ec52b7d42	String	jsonType.label
58ad69e8-e79d-45ea-9c27-794d5ab85c8d	true	userinfo.token.claim
58ad69e8-e79d-45ea-9c27-794d5ab85c8d	emailVerified	user.attribute
58ad69e8-e79d-45ea-9c27-794d5ab85c8d	true	id.token.claim
58ad69e8-e79d-45ea-9c27-794d5ab85c8d	true	access.token.claim
58ad69e8-e79d-45ea-9c27-794d5ab85c8d	email_verified	claim.name
58ad69e8-e79d-45ea-9c27-794d5ab85c8d	boolean	jsonType.label
53d9b8a4-2e92-4d54-b6f5-8b2034c6a111	formatted	user.attribute.formatted
53d9b8a4-2e92-4d54-b6f5-8b2034c6a111	country	user.attribute.country
53d9b8a4-2e92-4d54-b6f5-8b2034c6a111	postal_code	user.attribute.postal_code
53d9b8a4-2e92-4d54-b6f5-8b2034c6a111	true	userinfo.token.claim
53d9b8a4-2e92-4d54-b6f5-8b2034c6a111	street	user.attribute.street
53d9b8a4-2e92-4d54-b6f5-8b2034c6a111	true	id.token.claim
53d9b8a4-2e92-4d54-b6f5-8b2034c6a111	region	user.attribute.region
53d9b8a4-2e92-4d54-b6f5-8b2034c6a111	true	access.token.claim
53d9b8a4-2e92-4d54-b6f5-8b2034c6a111	locality	user.attribute.locality
a9766eb4-a466-4198-b1b0-d2277e44f744	true	userinfo.token.claim
a9766eb4-a466-4198-b1b0-d2277e44f744	phoneNumber	user.attribute
a9766eb4-a466-4198-b1b0-d2277e44f744	true	id.token.claim
a9766eb4-a466-4198-b1b0-d2277e44f744	true	access.token.claim
a9766eb4-a466-4198-b1b0-d2277e44f744	phone_number	claim.name
a9766eb4-a466-4198-b1b0-d2277e44f744	String	jsonType.label
416a234c-0a6f-4268-9fd5-44bec2c34a6d	true	userinfo.token.claim
416a234c-0a6f-4268-9fd5-44bec2c34a6d	phoneNumberVerified	user.attribute
416a234c-0a6f-4268-9fd5-44bec2c34a6d	true	id.token.claim
416a234c-0a6f-4268-9fd5-44bec2c34a6d	true	access.token.claim
416a234c-0a6f-4268-9fd5-44bec2c34a6d	phone_number_verified	claim.name
416a234c-0a6f-4268-9fd5-44bec2c34a6d	boolean	jsonType.label
e4422047-6859-48be-99dd-84c2afdc92b4	true	multivalued
e4422047-6859-48be-99dd-84c2afdc92b4	foo	user.attribute
e4422047-6859-48be-99dd-84c2afdc92b4	true	access.token.claim
e4422047-6859-48be-99dd-84c2afdc92b4	realm_access.roles	claim.name
e4422047-6859-48be-99dd-84c2afdc92b4	String	jsonType.label
fcc02efc-ccc5-4b20-b4e3-3fbd8aa99742	true	multivalued
fcc02efc-ccc5-4b20-b4e3-3fbd8aa99742	foo	user.attribute
fcc02efc-ccc5-4b20-b4e3-3fbd8aa99742	true	access.token.claim
fcc02efc-ccc5-4b20-b4e3-3fbd8aa99742	resource_access.${client_id}.roles	claim.name
fcc02efc-ccc5-4b20-b4e3-3fbd8aa99742	String	jsonType.label
6426103b-7ec5-4257-967d-2ca35870181b	true	userinfo.token.claim
6426103b-7ec5-4257-967d-2ca35870181b	username	user.attribute
6426103b-7ec5-4257-967d-2ca35870181b	true	id.token.claim
6426103b-7ec5-4257-967d-2ca35870181b	true	access.token.claim
6426103b-7ec5-4257-967d-2ca35870181b	upn	claim.name
6426103b-7ec5-4257-967d-2ca35870181b	String	jsonType.label
2572ba3f-5407-40d3-8cd4-917e539763b8	true	multivalued
2572ba3f-5407-40d3-8cd4-917e539763b8	foo	user.attribute
2572ba3f-5407-40d3-8cd4-917e539763b8	true	id.token.claim
2572ba3f-5407-40d3-8cd4-917e539763b8	true	access.token.claim
2572ba3f-5407-40d3-8cd4-917e539763b8	groups	claim.name
2572ba3f-5407-40d3-8cd4-917e539763b8	String	jsonType.label
50ec4684-1b3f-4b27-959e-eb69c077ae78	true	userinfo.token.claim
50ec4684-1b3f-4b27-959e-eb69c077ae78	locale	user.attribute
50ec4684-1b3f-4b27-959e-eb69c077ae78	true	id.token.claim
50ec4684-1b3f-4b27-959e-eb69c077ae78	true	access.token.claim
50ec4684-1b3f-4b27-959e-eb69c077ae78	locale	claim.name
50ec4684-1b3f-4b27-959e-eb69c077ae78	String	jsonType.label
0b998258-a682-4ccf-9486-24e553344b92	true	multivalued
0b998258-a682-4ccf-9486-24e553344b92	true	userinfo.token.claim
0b998258-a682-4ccf-9486-24e553344b92	false	id.token.claim
0b998258-a682-4ccf-9486-24e553344b92	true	access.token.claim
0b998258-a682-4ccf-9486-24e553344b92	roles	claim.name
0b998258-a682-4ccf-9486-24e553344b92	String	jsonType.label
f5594f19-9730-4389-8e71-d5ec38737664	true	multivalued
f5594f19-9730-4389-8e71-d5ec38737664	true	userinfo.token.claim
f5594f19-9730-4389-8e71-d5ec38737664	false	id.token.claim
f5594f19-9730-4389-8e71-d5ec38737664	true	access.token.claim
f5594f19-9730-4389-8e71-d5ec38737664	roles	claim.name
f5594f19-9730-4389-8e71-d5ec38737664	String	jsonType.label
8df9d14e-6246-4d35-9268-d1fc15556b27	clientId	user.session.note
8df9d14e-6246-4d35-9268-d1fc15556b27	true	id.token.claim
8df9d14e-6246-4d35-9268-d1fc15556b27	true	access.token.claim
8df9d14e-6246-4d35-9268-d1fc15556b27	clientId	claim.name
8df9d14e-6246-4d35-9268-d1fc15556b27	String	jsonType.label
432857fe-1090-4331-8b7f-faab10282ecb	clientHost	user.session.note
432857fe-1090-4331-8b7f-faab10282ecb	true	id.token.claim
432857fe-1090-4331-8b7f-faab10282ecb	true	access.token.claim
432857fe-1090-4331-8b7f-faab10282ecb	clientHost	claim.name
432857fe-1090-4331-8b7f-faab10282ecb	String	jsonType.label
a22cc46e-8f58-4f97-91e1-b956f16dc89e	clientAddress	user.session.note
a22cc46e-8f58-4f97-91e1-b956f16dc89e	true	id.token.claim
a22cc46e-8f58-4f97-91e1-b956f16dc89e	true	access.token.claim
a22cc46e-8f58-4f97-91e1-b956f16dc89e	clientAddress	claim.name
a22cc46e-8f58-4f97-91e1-b956f16dc89e	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me) FROM stdin;
master	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	95915671-4449-4859-8227-f86ac88e1e7f	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	9a7e18fb-f8e1-48c9-8333-4c37a402ee3c	138b6ffa-9966-44ec-93fe-2065c8549d8f	20debb71-73ee-4c03-a7be-20bf10bf2809	50804530-365f-4907-b9d8-6048670f1e5c	7a3194ee-5e9a-479c-bc1b-e607b674aa30	2592000	f	900	t	f	0f7b7acb-dae6-4d38-ac49-ea7d6d2988a1	0	f	0	0
airflow	60	300	300	\N	\N	\N	t	f	0	\N	airflow	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	cbd875c8-4ed0-4972-a16a-2af5b1435de7	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	b5f1e165-67d8-4742-8888-ecd46e00b7b6	021d8b86-20a5-4ad3-9f09-b071e37e1357	207e8132-4d37-48d1-bdc6-f4f890e98ebf	1bde9102-5865-4e8b-8dcc-abff6befc3ec	0efc09ac-2073-4f9d-a3ca-d26ba7edd190	2592000	f	900	t	f	66cf6213-0b4c-496e-ab0b-0303a22e213c	0	f	0	0
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_attribute (name, value, realm_id) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly		master
_browser_header.xContentTypeOptions	nosniff	master
_browser_header.xRobotsTag	none	master
_browser_header.xFrameOptions	SAMEORIGIN	master
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	master
_browser_header.xXSSProtection	1; mode=block	master
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	master
bruteForceProtected	false	master
permanentLockout	false	master
maxFailureWaitSeconds	900	master
minimumQuickLoginWaitSeconds	60	master
waitIncrementSeconds	60	master
quickLoginCheckMilliSeconds	1000	master
maxDeltaTimeSeconds	43200	master
failureFactor	30	master
displayName	Keycloak	master
displayNameHtml	<div class="kc-logo-text"><span>Keycloak</span></div>	master
offlineSessionMaxLifespanEnabled	false	master
offlineSessionMaxLifespan	5184000	master
_browser_header.contentSecurityPolicyReportOnly		airflow
_browser_header.xContentTypeOptions	nosniff	airflow
_browser_header.xRobotsTag	none	airflow
_browser_header.xFrameOptions	SAMEORIGIN	airflow
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	airflow
_browser_header.xXSSProtection	1; mode=block	airflow
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	airflow
bruteForceProtected	false	airflow
permanentLockout	false	airflow
maxFailureWaitSeconds	900	airflow
minimumQuickLoginWaitSeconds	60	airflow
waitIncrementSeconds	60	airflow
quickLoginCheckMilliSeconds	1000	airflow
maxDeltaTimeSeconds	43200	airflow
failureFactor	30	airflow
offlineSessionMaxLifespanEnabled	false	airflow
offlineSessionMaxLifespan	5184000	airflow
clientSessionIdleTimeout	0	airflow
clientSessionMaxLifespan	0	airflow
clientOfflineSessionIdleTimeout	0	airflow
clientOfflineSessionMaxLifespan	0	airflow
actionTokenGeneratedByAdminLifespan	43200	airflow
actionTokenGeneratedByUserLifespan	300	airflow
webAuthnPolicyRpEntityName	keycloak	airflow
webAuthnPolicySignatureAlgorithms	ES256	airflow
webAuthnPolicyRpId		airflow
webAuthnPolicyAttestationConveyancePreference	not specified	airflow
webAuthnPolicyAuthenticatorAttachment	not specified	airflow
webAuthnPolicyRequireResidentKey	not specified	airflow
webAuthnPolicyUserVerificationRequirement	not specified	airflow
webAuthnPolicyCreateTimeout	0	airflow
webAuthnPolicyAvoidSameAuthenticatorRegister	false	airflow
webAuthnPolicyRpEntityNamePasswordless	keycloak	airflow
webAuthnPolicySignatureAlgorithmsPasswordless	ES256	airflow
webAuthnPolicyRpIdPasswordless		airflow
webAuthnPolicyAttestationConveyancePreferencePasswordless	not specified	airflow
webAuthnPolicyAuthenticatorAttachmentPasswordless	not specified	airflow
webAuthnPolicyRequireResidentKeyPasswordless	not specified	airflow
webAuthnPolicyUserVerificationRequirementPasswordless	not specified	airflow
webAuthnPolicyCreateTimeoutPasswordless	0	airflow
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	false	airflow
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_default_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_default_roles (realm_id, role_id) FROM stdin;
master	6b4545aa-6694-4d2d-866c-730b5b2875a9
master	13e30320-64ff-4391-9c31-36a40405a7d5
airflow	4b50a98f-907a-4cf7-a464-7a153de3ed47
airflow	552706f3-8124-43d7-a6fd-1304733fa98d
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
master	jboss-logging
airflow	jboss-logging
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	master
password	password	t	t	airflow
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.redirect_uris (client_id, value) FROM stdin;
5b3b9d57-2c61-4590-8b35-c1897ec1af72	/realms/master/account/*
51eba8bc-a057-4358-8da0-7a13e46e57c7	/realms/master/account/*
6284fc76-4ef0-4085-9135-c7fd24d3a945	/admin/master/console/*
ed32d811-13cd-4bb9-802a-c62403a1066c	/realms/airflow/account/*
21b3d652-6bd1-44eb-af0c-7a5c4869e490	/realms/airflow/account/*
40ba7753-19bd-4b03-a70f-8dc681d31d69	/admin/airflow/console/*
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	*
\.


--
-- Data for Name: rendered_task_instance_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rendered_task_instance_fields (dag_id, task_id, execution_date, rendered_fields, k8s_pod_yaml) FROM stdin;
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
1ffc1019-e068-43ee-aa8e-cc717cb18c9d	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
103d05d5-e15e-4ebb-b8f5-8534fd7b916f	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
25693c7b-975d-4d7f-bbac-927e6556afcc	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
824fbf05-b6ca-4826-9ff8-d89e5c3bbf84	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
ca78c29e-85cc-4a18-9bb1-f6c369b3f33c	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
2b3d523e-3329-4d10-954b-e8dfc5f86e9b	update_user_locale	Update User Locale	master	t	f	update_user_locale	1000
f3e0304e-0231-4e7f-a9d7-b338e07781d5	VERIFY_EMAIL	Verify Email	airflow	t	f	VERIFY_EMAIL	50
19863075-b0f5-4a4f-9075-397358e98422	UPDATE_PROFILE	Update Profile	airflow	t	f	UPDATE_PROFILE	40
fca360d3-5b2d-4b05-a2f5-316d0accd6ce	CONFIGURE_TOTP	Configure OTP	airflow	t	f	CONFIGURE_TOTP	10
4af89e04-bd6c-4548-9625-3d7f77df678a	UPDATE_PASSWORD	Update Password	airflow	t	f	UPDATE_PASSWORD	30
df746d09-b9e5-45e8-aee4-cd29479291b0	terms_and_conditions	Terms and Conditions	airflow	f	f	terms_and_conditions	20
ec384bfe-e7c4-4c01-ac89-66bc679c9bcf	update_user_locale	Update User Locale	airflow	t	f	update_user_locale	1000
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	t	0	1
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
09bdb556-ebab-4c5c-a8eb-6af95d4c556c	Default Policy	A policy that grants access only for users within this realm	js	0	0	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
4368f5ed-5245-403a-ae26-640263ad94d5	Default Permission	A permission that applies to the default resource type	resource	1	0	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
454f23e6-3057-47bd-a145-e802d0642cfb	Default Resource	urn:airflow-client:resources:default	\N	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	f	\N
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_uris (resource_id, value) FROM stdin;
454f23e6-3057-47bd-a145-e802d0642cfb	/*
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
51eba8bc-a057-4358-8da0-7a13e46e57c7	131aa827-ed5f-4a00-99ce-dcea528728c9
21b3d652-6bd1-44eb-af0c-7a5c4869e490	6c1bf37c-e56a-480e-a15f-04399dc286e0
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
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
process_etl_linear	/opt/airflow/dags/etl-linear.py	18336183563814790	{"__version": 1, "dag": {"timezone": "UTC", "schedule_interval": "@daily", "start_date": 1616889600.0, "fileloc": "/opt/airflow/dags/etl-linear.py", "_dag_id": "process_etl_linear", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"upload_input_to_s3": ["operator", "upload_input_to_s3"], "convert_to_parquet": ["operator", "convert_to_parquet"], "load_into_database": ["operator", "load_into_database"], "summary": ["operator", "summary"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "tasks": [{"label": "upload_input_to_s3", "task_id": "upload_input_to_s3", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "template_fields": ["bash_command", "env"], "_inlets": [], "_downstream_task_ids": ["convert_to_parquet"], "pool": "default_pool", "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"label": "convert_to_parquet", "task_id": "convert_to_parquet", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "template_fields": ["templates_dict", "op_args", "op_kwargs"], "_inlets": [], "_downstream_task_ids": ["load_into_database"], "pool": "default_pool", "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"label": "load_into_database", "task_id": "load_into_database", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "template_fields": ["templates_dict", "op_args", "op_kwargs"], "_inlets": [], "_downstream_task_ids": ["summary"], "pool": "default_pool", "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"label": "summary", "task_id": "summary", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "template_fields": ["bash_command", "env"], "_inlets": [], "_downstream_task_ids": [], "pool": "default_pool", "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"Finished processing input file\\""}]}}	2021-04-04 06:03:21.259611+00	0a3be8d92105fc82a11a2d25e2cc6145
k8s-pod-operator-spark-init	/opt/airflow/dags/k8s-pod-operator-spark-init.py	41227235438583639	{"__version": 1, "dag": {"timezone": "UTC", "schedule_interval": "@daily", "start_date": 1617321600.0, "fileloc": "/opt/airflow/dags/k8s-pod-operator-spark-init.py", "_dag_id": "k8s-pod-operator-spark-init", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"start_kube_init_spark_process": ["operator", "start_kube_init_spark_process"], "finish_kube_init_spark_process": ["operator", "finish_kube_init_spark_process"], "k8s-pod-with-init": ["operator", "k8s-pod-with-init"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "tasks": [{"label": "start_kube_init_spark_process", "task_id": "start_kube_init_spark_process", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "template_fields": ["bash_command", "env"], "_inlets": [], "_downstream_task_ids": ["k8s-pod-with-init"], "pool": "default_pool", "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo trigger execution of bunch of spark containers"}, {"label": "finish_kube_init_spark_process", "task_id": "finish_kube_init_spark_process", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "template_fields": ["bash_command", "env"], "_inlets": [], "_downstream_task_ids": [], "pool": "default_pool", "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo end of execution"}, {"label": "k8s-pod-with-init", "task_id": "k8s-pod-with-init", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {}, "template_fields": ["image", "cmds", "arguments", "env_vars", "labels", "config_file", "pod_template_file"], "_inlets": [], "_downstream_task_ids": ["finish_kube_init_spark_process"], "pool": "default_pool", "do_xcom_push": false, "ui_color": "#fff", "_task_type": "KubernetesPodOperator", "_task_module": "airflow.providers.cncf.kubernetes.operators.kubernetes_pod", "_is_dummy": false, "image": "ubuntu:latest", "cmds": ["sh", "-c", "cat /tmp/secrets/hello"], "arguments": [], "env_vars": [], "labels": {}, "config_file": "/tmp/k8s/minikube/config"}]}}	2021-04-04 06:03:21.267551+00	f706444046e4de4596212ef8032d0426
k8s-pod-operator-spark	/opt/airflow/dags/k8s-pod-operator-spark.py	21628937650928228	{"__version": 1, "dag": {"timezone": "UTC", "schedule_interval": "@daily", "start_date": 1617321600.0, "fileloc": "/opt/airflow/dags/k8s-pod-operator-spark.py", "_dag_id": "k8s-pod-operator-spark", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"start_kube_spark_process": ["operator", "start_kube_spark_process"], "finish_kube_spark_process": ["operator", "finish_kube_spark_process"], "k8s-pod": ["operator", "k8s-pod"], "k8s-spark-launcher": ["operator", "k8s-spark-launcher"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "tasks": [{"label": "start_kube_spark_process", "task_id": "start_kube_spark_process", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "template_fields": ["bash_command", "env"], "_inlets": [], "_downstream_task_ids": ["k8s-pod"], "pool": "default_pool", "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo trigger execution of bunch of spark containers"}, {"label": "finish_kube_spark_process", "task_id": "finish_kube_spark_process", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "template_fields": ["bash_command", "env"], "_inlets": [], "_downstream_task_ids": [], "pool": "default_pool", "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo end of execution"}, {"label": "k8s-pod", "task_id": "k8s-pod", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {}, "template_fields": ["image", "cmds", "arguments", "env_vars", "labels", "config_file", "pod_template_file"], "_inlets": [], "_downstream_task_ids": ["k8s-spark-launcher"], "pool": "default_pool", "do_xcom_push": false, "ui_color": "#fff", "_task_type": "KubernetesPodOperator", "_task_module": "airflow.providers.cncf.kubernetes.operators.kubernetes_pod", "_is_dummy": false, "image": "ubuntu:latest", "cmds": ["echo"], "arguments": [], "env_vars": [], "labels": {}, "config_file": "/tmp/k8s/minikube/config"}, {"label": "k8s-spark-launcher", "task_id": "k8s-spark-launcher", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {}, "template_fields": ["image", "cmds", "arguments", "env_vars", "labels", "config_file", "pod_template_file"], "_inlets": [], "_downstream_task_ids": ["finish_kube_spark_process"], "pool": "default_pool", "do_xcom_push": false, "ui_color": "#fff", "_task_type": "KubernetesPodOperator", "_task_module": "airflow.providers.cncf.kubernetes.operators.kubernetes_pod", "_is_dummy": false, "image": "skhatri/spark:v3.0.1", "cmds": ["/opt/spark/bin/spark-submit"], "arguments": ["--master", "k8s://https://kubernetes.default.svc.cluster.local:443", "--deploy-mode", "cluster", "--name", "hello", "--class", "demo.Count", "--conf", "spark.executor.instances=2", "--conf", "spark.kubernetes.container.image=skhatri/spark-k8s-hello:1.0.7", "--conf", "spark.jars.ivy=/tmp/.ivy", "--conf", "spark.app.name=hello", "--conf", "spark.kubernetes.authenticate.driver.serviceAccountName=job-trigger-sa", "--conf", "spark.authenticate=false", "local:///tmp/jars/spark-k8s-hello.jar"], "env_vars": [{"name": "SPARK_USER", "value": "spark_user"}, {"name": "HADOOP_USER_NAME", "value": "spark_user"}, {"name": "HADOOP_PROXY_USER", "value": "spark_user"}, {"name": "SPARK_LOCAL_DIRS", "value": "/tmp/data/spark-workdir"}, {"name": "SPARK_CONF_DIR", "value": "/opt/spark/conf"}, {"name": "SPARK_APPLICATION_ID", "value": "spark-406656d05d7f456f81fcde9530ae1d70"}, {"name": "SPARK_DRIVER_BIND_ADDRESS", "valueFrom": {"fieldRef": {"apiVersion": "v1", "fieldPath": "status.podIP"}}}, {"name": "EOD_DATE", "value": "{{ ds }}"}], "labels": {}, "config_file": "/tmp/k8s/minikube/config"}]}}	2021-04-04 06:03:21.272933+00	54707719a18bf5debfdca4d737dfce87
kube-pod-operator	/opt/airflow/dags/k8s-pod-operator.py	14390090851810004	{"__version": 1, "dag": {"timezone": "UTC", "schedule_interval": "@daily", "start_date": 1617321600.0, "fileloc": "/opt/airflow/dags/k8s-pod-operator.py", "_dag_id": "kube-pod-operator", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"start_kube_process": ["operator", "start_kube_process"], "pod-ex-minimum": ["operator", "pod-ex-minimum"], "run-another-pod": ["operator", "run-another-pod"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "tasks": [{"label": "start_kube_process", "task_id": "start_kube_process", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "template_fields": ["bash_command", "env"], "_inlets": [], "_downstream_task_ids": ["pod-ex-minimum"], "pool": "default_pool", "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"label": "pod-ex-minimum", "task_id": "pod-ex-minimum", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {}, "template_fields": ["image", "cmds", "arguments", "env_vars", "labels", "config_file", "pod_template_file"], "_inlets": [], "_downstream_task_ids": ["run-another-pod"], "pool": "default_pool", "do_xcom_push": false, "ui_color": "#fff", "_task_type": "KubernetesPodOperator", "_task_module": "airflow.providers.cncf.kubernetes.operators.kubernetes_pod", "_is_dummy": false, "image": "ubuntu:latest", "cmds": ["echo"], "arguments": [], "env_vars": [], "labels": {}, "config_file": "/tmp/k8s/minikube/config"}, {"label": "run-another-pod", "task_id": "run-another-pod", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {}, "template_fields": ["image", "cmds", "arguments", "env_vars", "labels", "config_file", "pod_template_file"], "_inlets": [], "_downstream_task_ids": [], "pool": "default_pool", "do_xcom_push": false, "ui_color": "#fff", "_task_type": "KubernetesPodOperator", "_task_module": "airflow.providers.cncf.kubernetes.operators.kubernetes_pod", "_is_dummy": false, "image": "ubuntu:latest", "cmds": ["echo"], "arguments": [], "env_vars": [], "labels": {}, "config_file": "/tmp/k8s/minikube/config"}]}}	2021-04-04 06:03:21.276702+00	20d7a52a1737b24a7cbc346ad3676075
download_rocket_launches	/opt/airflow/dags/excluded/first.py	68711774077157549	{"__version": 1, "dag": {"timezone": "UTC", "schedule_interval": "@daily", "start_date": 1616284800.0, "fileloc": "/opt/airflow/dags/excluded/first.py", "_dag_id": "download_rocket_launches", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"download_launches": ["operator", "download_launches"], "get_pictures": ["operator", "get_pictures"], "notify": ["operator", "notify"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "tasks": [{"label": "download_launches", "task_id": "download_launches", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "template_fields": ["bash_command", "env"], "_inlets": [], "_downstream_task_ids": ["get_pictures"], "pool": "default_pool", "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "curl -o /tmp/launches.json 'https://launchlibrary.net/1.4/launch?next=5&mode=verbose'"}, {"label": "get_pictures", "task_id": "get_pictures", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "template_fields": ["templates_dict", "op_args", "op_kwargs"], "_inlets": [], "_downstream_task_ids": ["notify"], "pool": "default_pool", "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"label": "notify", "task_id": "notify", "ui_fgcolor": "#000", "_outlets": [], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "template_fields": ["bash_command", "env"], "_inlets": [], "_downstream_task_ids": [], "pool": "default_pool", "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"There are now $(ls /tmp/images/ | wc -l) images.\\""}]}}	2021-04-04 06:03:21.286502+00	b1f1f463ffe3bc67b05732475a6dc07a
etl_conditional	/opt/airflow/dags/etl-conditional.py	41676207298935373	{"__version": 1, "dag": {"schedule_interval": "@daily", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"ec_upload_input_to_s3": ["operator", "ec_upload_input_to_s3"], "ec_convert_to_parquet": ["operator", "ec_convert_to_parquet"], "ec_load_into_database": ["operator", "ec_load_into_database"], "ec_upload_output_to_s3": ["operator", "ec_upload_output_to_s3"], "ec-summary": ["operator", "ec-summary"], "save-output-decision": ["operator", "save-output-decision"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "timezone": "UTC", "fileloc": "/opt/airflow/dags/etl-conditional.py", "start_date": 1616198400.0, "_dag_id": "etl_conditional", "tasks": [{"ui_fgcolor": "#000", "task_id": "ec_upload_input_to_s3", "pool": "default_pool", "_downstream_task_ids": ["ec_convert_to_parquet"], "label": "ec_upload_input_to_s3", "_inlets": [], "_outlets": [], "template_fields": ["bash_command", "env"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"ui_fgcolor": "#000", "task_id": "ec_convert_to_parquet", "pool": "default_pool", "_downstream_task_ids": ["save-output-decision"], "label": "ec_convert_to_parquet", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "ec_load_into_database", "pool": "default_pool", "_downstream_task_ids": [], "label": "ec_load_into_database", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "ec_upload_output_to_s3", "pool": "default_pool", "_downstream_task_ids": [], "label": "ec_upload_output_to_s3", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "ec-summary", "pool": "default_pool", "_downstream_task_ids": [], "label": "ec-summary", "_inlets": [], "_outlets": [], "template_fields": ["bash_command", "env"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"Finished processing input file\\""}, {"ui_fgcolor": "#000", "task_id": "save-output-decision", "pool": "default_pool", "_downstream_task_ids": ["ec_upload_output_to_s3", "ec_load_into_database", "ec-summary"], "label": "save-output-decision", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "BranchPythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}]}}	2021-04-04 06:07:26.876722+00	3d975b10fcd01623a85ca4f718faf99f
eod_processing	/opt/airflow/dags/excluded/eod.py	59017706735592835	{"__version": 1, "dag": {"schedule_interval": "@daily", "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"receive_account_file_from_ebbs": ["operator", "receive_account_file_from_ebbs"], "convert_account_file_to_parquet": ["operator", "convert_account_file_to_parquet"], "receive_txn_file_from_ebbs": ["operator", "receive_txn_file_from_ebbs"], "convert_txn_file_to_parquet": ["operator", "convert_txn_file_to_parquet"], "receive_staffhist_file_from_ebbs": ["operator", "receive_staffhist_file_from_ebbs"], "convert_staffhist_file_to_parquet": ["operator", "convert_staffhist_file_to_parquet"], "receive_balance_file_from_ebbs": ["operator", "receive_balance_file_from_ebbs"], "convert_balance_file_to_parquet": ["operator", "convert_balance_file_to_parquet"], "receive_bonus_exception_file_from_ebbs": ["operator", "receive_bonus_exception_file_from_ebbs"], "receive_freetransfer_exception_file_from_ebbs": ["operator", "receive_freetransfer_exception_file_from_ebbs"], "load_account_table": ["operator", "load_account_table"], "load_transaction_table": ["operator", "load_transaction_table"], "load_historical_balance": ["operator", "load_historical_balance"], "free_transfer_quota_monthly": ["operator", "free_transfer_quota_monthly"], "bonus_interest_calc": ["operator", "bonus_interest_calc"], "free_transfer_refund_daily": ["operator", "free_transfer_refund_daily"], "daily_account_summary": ["operator", "daily_account_summary"], "generate_bonus_interest_file": ["operator", "generate_bonus_interest_file"], "generate_free_transfer_file": ["operator", "generate_free_transfer_file"], "start_eod_processing": ["operator", "start_eod_processing"], "finish_eod_processing": ["operator", "finish_eod_processing"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "timezone": "UTC", "fileloc": "/opt/airflow/dags/excluded/eod.py", "start_date": 1616284800.0, "_dag_id": "eod_processing", "tasks": [{"ui_fgcolor": "#000", "task_id": "receive_account_file_from_ebbs", "pool": "default_pool", "_downstream_task_ids": ["convert_account_file_to_parquet"], "label": "receive_account_file_from_ebbs", "_inlets": [], "_outlets": [], "template_fields": ["bash_command", "env"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"ui_fgcolor": "#000", "task_id": "convert_account_file_to_parquet", "pool": "default_pool", "_downstream_task_ids": ["load_account_table", "free_transfer_quota_monthly", "bonus_interest_calc", "daily_account_summary"], "label": "convert_account_file_to_parquet", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "receive_txn_file_from_ebbs", "pool": "default_pool", "_downstream_task_ids": ["convert_txn_file_to_parquet"], "label": "receive_txn_file_from_ebbs", "_inlets": [], "_outlets": [], "template_fields": ["bash_command", "env"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"ui_fgcolor": "#000", "task_id": "convert_txn_file_to_parquet", "pool": "default_pool", "_downstream_task_ids": ["free_transfer_refund_daily", "load_transaction_table", "bonus_interest_calc", "daily_account_summary"], "label": "convert_txn_file_to_parquet", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "receive_staffhist_file_from_ebbs", "pool": "default_pool", "_downstream_task_ids": ["convert_staffhist_file_to_parquet"], "label": "receive_staffhist_file_from_ebbs", "_inlets": [], "_outlets": [], "template_fields": ["bash_command", "env"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"ui_fgcolor": "#000", "task_id": "convert_staffhist_file_to_parquet", "pool": "default_pool", "_downstream_task_ids": ["free_transfer_quota_monthly", "bonus_interest_calc"], "label": "convert_staffhist_file_to_parquet", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "receive_balance_file_from_ebbs", "pool": "default_pool", "_downstream_task_ids": ["convert_balance_file_to_parquet"], "label": "receive_balance_file_from_ebbs", "_inlets": [], "_outlets": [], "template_fields": ["bash_command", "env"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"ui_fgcolor": "#000", "task_id": "convert_balance_file_to_parquet", "pool": "default_pool", "_downstream_task_ids": ["load_historical_balance", "daily_account_summary"], "label": "convert_balance_file_to_parquet", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "receive_bonus_exception_file_from_ebbs", "pool": "default_pool", "_downstream_task_ids": [], "label": "receive_bonus_exception_file_from_ebbs", "_inlets": [], "_outlets": [], "template_fields": ["bash_command", "env"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"ui_fgcolor": "#000", "task_id": "receive_freetransfer_exception_file_from_ebbs", "pool": "default_pool", "_downstream_task_ids": [], "label": "receive_freetransfer_exception_file_from_ebbs", "_inlets": [], "_outlets": [], "template_fields": ["bash_command", "env"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo upload to s3"}, {"ui_fgcolor": "#000", "task_id": "load_account_table", "pool": "default_pool", "_downstream_task_ids": [], "label": "load_account_table", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "load_transaction_table", "pool": "default_pool", "_downstream_task_ids": [], "label": "load_transaction_table", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "load_historical_balance", "pool": "default_pool", "_downstream_task_ids": ["finish_eod_processing"], "label": "load_historical_balance", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "free_transfer_quota_monthly", "pool": "default_pool", "_downstream_task_ids": ["finish_eod_processing"], "label": "free_transfer_quota_monthly", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "bonus_interest_calc", "pool": "default_pool", "_downstream_task_ids": ["generate_bonus_interest_file"], "label": "bonus_interest_calc", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "free_transfer_refund_daily", "pool": "default_pool", "_downstream_task_ids": ["generate_free_transfer_file"], "label": "free_transfer_refund_daily", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "daily_account_summary", "pool": "default_pool", "_downstream_task_ids": ["finish_eod_processing"], "label": "daily_account_summary", "_inlets": [], "_outlets": [], "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "ui_color": "#ffefeb", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_dummy": false, "op_args": [], "op_kwargs": {}}, {"ui_fgcolor": "#000", "task_id": "generate_bonus_interest_file", "pool": "default_pool", "_downstream_task_ids": ["finish_eod_processing"], "label": "generate_bonus_interest_file", "_inlets": [], "_outlets": [], "template_fields": ["bash_command", "env"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"Finished processing account file\\""}, {"ui_fgcolor": "#000", "task_id": "generate_free_transfer_file", "pool": "default_pool", "_downstream_task_ids": ["finish_eod_processing"], "label": "generate_free_transfer_file", "_inlets": [], "_outlets": [], "template_fields": ["bash_command", "env"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"Generate Free Transfer File\\""}, {"ui_fgcolor": "#000", "task_id": "start_eod_processing", "pool": "default_pool", "_downstream_task_ids": ["receive_bonus_exception_file_from_ebbs", "receive_staffhist_file_from_ebbs", "receive_balance_file_from_ebbs", "receive_txn_file_from_ebbs", "receive_freetransfer_exception_file_from_ebbs", "receive_account_file_from_ebbs"], "label": "start_eod_processing", "_inlets": [], "_outlets": [], "template_fields": ["bash_command", "env"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"Start processing EOD\\""}, {"ui_fgcolor": "#000", "task_id": "finish_eod_processing", "pool": "default_pool", "_downstream_task_ids": [], "label": "finish_eod_processing", "_inlets": [], "_outlets": [], "template_fields": ["bash_command", "env"], "template_fields_renderers": {"bash_command": "bash", "env": "json"}, "ui_color": "#f0ede4", "_task_type": "BashOperator", "_task_module": "airflow.operators.bash", "_is_dummy": false, "bash_command": "echo \\"Finish Processing EOD\\""}]}}	2021-04-04 06:07:26.924973+00	8a7b47d5f3124d47f829a8173f0e39fc
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
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
4196880b-9c99-4f65-a6f5-03f4ffa59ca8	\N	e80da34d-07de-475a-8d43-60a03e9dd1b6	f	t	\N	\N	\N	master	admin	1617516238618	\N	0
5e4dcf43-d9d5-4881-a5b8-d94562f13c44	\N	f5302f70-8f72-4bc7-99df-a3ee72d72b59	f	t	\N	\N	\N	airflow	service-account-airflow-client	1617516267884	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	0
7d0c2452-b870-422c-9b47-6ecbb91a087b	airflow@gmail.com	airflow@gmail.com	t	t	\N	Airflow	Admin	airflow	airflow	1617516286695	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
64e01b29-0804-406d-ac9e-44b1413e3d73	4196880b-9c99-4f65-a6f5-03f4ffa59ca8
6b4545aa-6694-4d2d-866c-730b5b2875a9	4196880b-9c99-4f65-a6f5-03f4ffa59ca8
13e30320-64ff-4391-9c31-36a40405a7d5	4196880b-9c99-4f65-a6f5-03f4ffa59ca8
131aa827-ed5f-4a00-99ce-dcea528728c9	4196880b-9c99-4f65-a6f5-03f4ffa59ca8
e808384c-bb5f-424f-9671-4a59c559af85	4196880b-9c99-4f65-a6f5-03f4ffa59ca8
4d8b77f4-301f-4f60-ae55-91c91a88e049	5e4dcf43-d9d5-4881-a5b8-d94562f13c44
6c1bf37c-e56a-480e-a15f-04399dc286e0	5e4dcf43-d9d5-4881-a5b8-d94562f13c44
4b50a98f-907a-4cf7-a464-7a153de3ed47	5e4dcf43-d9d5-4881-a5b8-d94562f13c44
552706f3-8124-43d7-a6fd-1304733fa98d	5e4dcf43-d9d5-4881-a5b8-d94562f13c44
e9d3cdff-54f8-4eda-8ab4-bcbaf6159f63	5e4dcf43-d9d5-4881-a5b8-d94562f13c44
4d8b77f4-301f-4f60-ae55-91c91a88e049	7d0c2452-b870-422c-9b47-6ecbb91a087b
6c1bf37c-e56a-480e-a15f-04399dc286e0	7d0c2452-b870-422c-9b47-6ecbb91a087b
4b50a98f-907a-4cf7-a464-7a153de3ed47	7d0c2452-b870-422c-9b47-6ecbb91a087b
552706f3-8124-43d7-a6fd-1304733fa98d	7d0c2452-b870-422c-9b47-6ecbb91a087b
c62203d8-47b6-462b-bf62-f58c9d9077e7	7d0c2452-b870-422c-9b47-6ecbb91a087b
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: variable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variable (id, key, val, is_encrypted) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.web_origins (client_id, value) FROM stdin;
6284fc76-4ef0-4085-9135-c7fd24d3a945	+
40ba7753-19bd-4b03-a70f-8dc681d31d69	+
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

SELECT pg_catalog.setval('public.ab_user_id_seq', 2, true);


--
-- Name: ab_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_user_role_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.job_id_seq', 2, true);


--
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_id_seq', 6, true);


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
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


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
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: connection connection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connection
    ADD CONSTRAINT connection_pkey PRIMARY KEY (id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: client_default_roles constr_client_default_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT constr_client_default_roles PRIMARY KEY (client_id, role_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: realm_default_roles constraint_realm_default_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT constraint_realm_default_roles PRIMARY KEY (realm_id, role_id);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


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
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: xcom pk_xcom; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xcom
    ADD CONSTRAINT pk_xcom PRIMARY KEY (dag_id, task_id, key, execution_date);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: rendered_task_instance_fields rendered_task_instance_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rendered_task_instance_fields
    ADD CONSTRAINT rendered_task_instance_fields_pkey PRIMARY KEY (dag_id, task_id, execution_date);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


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
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


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
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client_default_roles uk_8aelwnibji49avxsrtuf6xjow; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT uk_8aelwnibji49avxsrtuf6xjow UNIQUE (role_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: realm_default_roles uk_h4wpd7w4hsoolni3h0sw7btje; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT uk_h4wpd7w4hsoolni3h0sw7btje UNIQUE (role_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


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
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_def_roles_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_def_roles_client ON public.client_default_roles USING btree (client_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fileloc_hash; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fileloc_hash ON public.serialized_dag USING btree (fileloc_hash);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_job_state_heartbeat; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_job_state_heartbeat ON public.job USING btree (state, latest_heartbeat);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


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
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_def_roles_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_def_roles_realm ON public.realm_default_roles USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_root_dag_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_root_dag_id ON public.dag USING btree (root_dag_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_task_fail_dag_task_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_task_fail_dag_task_date ON public.task_fail USING btree (dag_id, task_id, execution_date);


--
-- Name: idx_task_reschedule_dag_task_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_task_reschedule_dag_task_date ON public.task_reschedule USING btree (dag_id, task_id, execution_date);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


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
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: dag_tag dag_tag_dag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dag_tag
    ADD CONSTRAINT dag_tag_dag_id_fkey FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_default_roles fk_8aelwnibji49avxsrtuf6xjow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_8aelwnibji49avxsrtuf6xjow FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_client fk_c_cli_scope_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_client FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_scope_client fk_c_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_roles fk_evudb1ppw84oxfax2drs03icc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_evudb1ppw84oxfax2drs03icc FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: keycloak_group fk_group_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT fk_group_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_default_roles fk_h4wpd7w4hsoolni3h0sw7btje; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_h4wpd7w4hsoolni3h0sw7btje FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_default_roles fk_nuilts7klwqw2h8m2b5joytky; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_nuilts7klwqw2h8m2b5joytky FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_p3rh9grku11kqfrs4fltt7rnq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_p3rh9grku11kqfrs4fltt7rnq FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client fk_p56ctinxxb9gsk57fo49f9tac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_p56ctinxxb9gsk57fo49f9tac FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope fk_realm_cli_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT fk_realm_cli_scope FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- Name: task_reschedule task_reschedule_dag_task_date_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_reschedule
    ADD CONSTRAINT task_reschedule_dag_task_date_fkey FOREIGN KEY (task_id, dag_id, execution_date) REFERENCES public.task_instance(task_id, dag_id, execution_date) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

