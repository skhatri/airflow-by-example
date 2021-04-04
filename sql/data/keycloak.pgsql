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
-- Name: web_origins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO postgres;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
075ed938-5c41-4430-9da9-989cd282518d	8e0c033c-fdb8-4e1b-930e-afec4ed76ac8
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
2e263f87-f5ae-49b2-866a-418b9ca0810f	\N	auth-cookie	master	a1b02760-3349-4959-a668-55e9d5f425fa	2	10	f	\N	\N
aed63573-078f-4463-9e75-7c1d4081bfe5	\N	auth-spnego	master	a1b02760-3349-4959-a668-55e9d5f425fa	3	20	f	\N	\N
fc02880a-8646-48ed-a9ad-7ca994e01bda	\N	identity-provider-redirector	master	a1b02760-3349-4959-a668-55e9d5f425fa	2	25	f	\N	\N
08db0dbd-993c-4aae-bf19-170709e95f71	\N	\N	master	a1b02760-3349-4959-a668-55e9d5f425fa	2	30	t	e8cb8bc8-ef16-417e-99c7-536fa4c1115e	\N
a43d0246-43d2-4038-9e0f-b291973242fe	\N	auth-username-password-form	master	e8cb8bc8-ef16-417e-99c7-536fa4c1115e	0	10	f	\N	\N
b7f684bf-2c16-4527-994f-750a3e7d4898	\N	\N	master	e8cb8bc8-ef16-417e-99c7-536fa4c1115e	1	20	t	a02ca229-51ae-4284-9e6f-2c495c3e52ff	\N
adc1ac00-e3c0-47cb-9409-005b2d36c885	\N	conditional-user-configured	master	a02ca229-51ae-4284-9e6f-2c495c3e52ff	0	10	f	\N	\N
bcf1d67c-40cf-4085-ad52-37aef884755a	\N	auth-otp-form	master	a02ca229-51ae-4284-9e6f-2c495c3e52ff	0	20	f	\N	\N
8d8f85d0-24d0-4f36-b653-e77f7115ae19	\N	direct-grant-validate-username	master	1035d8f2-2553-491a-88a5-3d511c279474	0	10	f	\N	\N
617bae69-2414-4c4a-8164-e6e4ea771d14	\N	direct-grant-validate-password	master	1035d8f2-2553-491a-88a5-3d511c279474	0	20	f	\N	\N
cfd96f2a-146d-4fd3-a718-11ae6192b2b6	\N	\N	master	1035d8f2-2553-491a-88a5-3d511c279474	1	30	t	fa6b4811-24b8-493b-928e-12d8f4edc626	\N
5a43f6a1-88ff-4e24-8b62-0ed77192810d	\N	conditional-user-configured	master	fa6b4811-24b8-493b-928e-12d8f4edc626	0	10	f	\N	\N
4b44f4e7-ba81-43e4-bf47-64a41fe5374e	\N	direct-grant-validate-otp	master	fa6b4811-24b8-493b-928e-12d8f4edc626	0	20	f	\N	\N
655390fd-9a3e-4dd0-adb0-6a0c21000f79	\N	registration-page-form	master	80e3de55-e89f-46ca-b63a-4b4ebb28a0ad	0	10	t	0f3ae21b-4a7d-4dee-8e84-b0084ada6912	\N
132b46a7-4309-4c5a-8d16-f109574e270f	\N	registration-user-creation	master	0f3ae21b-4a7d-4dee-8e84-b0084ada6912	0	20	f	\N	\N
bc9236d6-2f02-4769-9217-a61aaf0ba84d	\N	registration-profile-action	master	0f3ae21b-4a7d-4dee-8e84-b0084ada6912	0	40	f	\N	\N
5df20df2-5956-4beb-925f-a1b08ac1521c	\N	registration-password-action	master	0f3ae21b-4a7d-4dee-8e84-b0084ada6912	0	50	f	\N	\N
9a913e2f-466c-49b8-a88f-a348ebc011a1	\N	registration-recaptcha-action	master	0f3ae21b-4a7d-4dee-8e84-b0084ada6912	3	60	f	\N	\N
4f562234-d4fd-4e97-b8f7-9e9e5147081d	\N	reset-credentials-choose-user	master	7c3fb01b-d886-4888-b744-4875e269df9e	0	10	f	\N	\N
860ee562-2036-4725-ab4d-0004e2e143b7	\N	reset-credential-email	master	7c3fb01b-d886-4888-b744-4875e269df9e	0	20	f	\N	\N
5ee8b030-57df-48bf-8e52-369defc8d1ba	\N	reset-password	master	7c3fb01b-d886-4888-b744-4875e269df9e	0	30	f	\N	\N
bada8911-4e2a-4adf-afb7-7646821d36fa	\N	\N	master	7c3fb01b-d886-4888-b744-4875e269df9e	1	40	t	6da76c78-1f22-428f-810e-2c09a9032ea3	\N
85e0f676-b042-444b-9278-630148c2a223	\N	conditional-user-configured	master	6da76c78-1f22-428f-810e-2c09a9032ea3	0	10	f	\N	\N
c3a28f76-a652-4d47-b038-2781985eaf28	\N	reset-otp	master	6da76c78-1f22-428f-810e-2c09a9032ea3	0	20	f	\N	\N
1d20e83f-24f1-4373-b33b-f7b356363c92	\N	client-secret	master	f7ef7396-dc1a-4f3c-af85-9f04885421b6	2	10	f	\N	\N
55314079-eb0b-49ef-aaf8-086af0750959	\N	client-jwt	master	f7ef7396-dc1a-4f3c-af85-9f04885421b6	2	20	f	\N	\N
4b6654b0-4757-4ef9-921d-28bb06096531	\N	client-secret-jwt	master	f7ef7396-dc1a-4f3c-af85-9f04885421b6	2	30	f	\N	\N
628b67ca-b930-4e4b-a5fc-fc289468bb54	\N	client-x509	master	f7ef7396-dc1a-4f3c-af85-9f04885421b6	2	40	f	\N	\N
8390a7bd-209b-4ce7-aba4-51c5566a9858	\N	idp-review-profile	master	6b1a8c0f-c432-4598-905a-830f44e0e417	0	10	f	\N	36e18eb2-fd43-4352-a2d5-1c5b4e657aa1
632cf205-3d5a-41c7-a3aa-74221fa74908	\N	\N	master	6b1a8c0f-c432-4598-905a-830f44e0e417	0	20	t	8517a42f-08a6-4c7e-b467-7d55624cf8d8	\N
ba7b55ad-c673-4bf9-9f18-8bc29a87f44b	\N	idp-create-user-if-unique	master	8517a42f-08a6-4c7e-b467-7d55624cf8d8	2	10	f	\N	085784b9-5b56-4aa8-8c67-b69edcbb28e6
072fd14c-27fd-42fb-a9f1-d85cfacf1738	\N	\N	master	8517a42f-08a6-4c7e-b467-7d55624cf8d8	2	20	t	ef016561-f864-4f0f-8022-b4d472da3f35	\N
415ee05c-773a-466b-a018-0be4c1bfa4f1	\N	idp-confirm-link	master	ef016561-f864-4f0f-8022-b4d472da3f35	0	10	f	\N	\N
98795a7e-3434-4455-8e29-30b727859903	\N	\N	master	ef016561-f864-4f0f-8022-b4d472da3f35	0	20	t	b94e7f3d-f626-4a56-91ad-d564b22f576a	\N
9cfd3dbd-dd13-42e2-a69d-92427f667973	\N	idp-email-verification	master	b94e7f3d-f626-4a56-91ad-d564b22f576a	2	10	f	\N	\N
93bd8e80-d7d1-466b-8188-2f8e5d9ee569	\N	\N	master	b94e7f3d-f626-4a56-91ad-d564b22f576a	2	20	t	ecbcd704-4091-4da2-9dc0-854547aa2f13	\N
f4a06edd-72c5-4b2b-9025-7530e46f0b8c	\N	idp-username-password-form	master	ecbcd704-4091-4da2-9dc0-854547aa2f13	0	10	f	\N	\N
89bb6310-ce0d-475b-b916-1ad6529a33af	\N	\N	master	ecbcd704-4091-4da2-9dc0-854547aa2f13	1	20	t	c7f46b98-b24c-4da7-8356-2ef626e388d7	\N
a0d879e0-258b-415b-b2d6-43c9c9aae4d5	\N	conditional-user-configured	master	c7f46b98-b24c-4da7-8356-2ef626e388d7	0	10	f	\N	\N
0e781ff1-3629-4569-94ce-da96a2a3c9a5	\N	auth-otp-form	master	c7f46b98-b24c-4da7-8356-2ef626e388d7	0	20	f	\N	\N
2b13b46f-5fee-4a48-ae6d-72e82800819a	\N	http-basic-authenticator	master	1336eef2-83d4-487d-8dbd-57caac8e909b	0	10	f	\N	\N
1167aded-cad2-49b6-8f3a-78631d942414	\N	docker-http-basic-authenticator	master	9ec72291-cb8f-42fb-9146-78c4df131fe2	0	10	f	\N	\N
fb5b9fcb-5f1d-4d02-95fa-757c8b93483a	\N	no-cookie-redirect	master	6d5eb62d-ae61-46fc-ba0b-54e4758a31b1	0	10	f	\N	\N
04f14525-19ba-4740-a5cd-d02d3cfef738	\N	\N	master	6d5eb62d-ae61-46fc-ba0b-54e4758a31b1	0	20	t	f57f9504-0928-4fb7-86d4-5ff6ea27ec28	\N
b232988f-2362-47a4-8c71-9ab465b7285c	\N	basic-auth	master	f57f9504-0928-4fb7-86d4-5ff6ea27ec28	0	10	f	\N	\N
2c8f468e-e500-4d05-b0ba-a3e756a20bd7	\N	basic-auth-otp	master	f57f9504-0928-4fb7-86d4-5ff6ea27ec28	3	20	f	\N	\N
a99b6058-862d-489b-ac32-4aad96520f00	\N	auth-spnego	master	f57f9504-0928-4fb7-86d4-5ff6ea27ec28	3	30	f	\N	\N
254ce927-4313-4512-99ec-abd94c1beb41	\N	auth-cookie	airflow	49900a2f-595f-4e49-ab41-b2bd974a6ab2	2	10	f	\N	\N
1f476810-f068-48f7-8195-3e53d2e42b02	\N	auth-spnego	airflow	49900a2f-595f-4e49-ab41-b2bd974a6ab2	3	20	f	\N	\N
73bdf57b-92f4-4fc1-aca1-10d984eb83eb	\N	identity-provider-redirector	airflow	49900a2f-595f-4e49-ab41-b2bd974a6ab2	2	25	f	\N	\N
7b5ac5ad-2fa0-43bd-987b-d93e37d8d88e	\N	\N	airflow	49900a2f-595f-4e49-ab41-b2bd974a6ab2	2	30	t	872adf14-0e69-415e-a13f-23a906953ad6	\N
4e543aa3-6206-4e5d-929c-b72b74be7baf	\N	auth-username-password-form	airflow	872adf14-0e69-415e-a13f-23a906953ad6	0	10	f	\N	\N
fa1b865e-b721-4707-8712-7bb59138a8f5	\N	\N	airflow	872adf14-0e69-415e-a13f-23a906953ad6	1	20	t	0a11a92c-0dc9-497d-9b79-76c75d3be797	\N
4adbe6d5-7b6c-4ef0-9c71-2ae9896fb73b	\N	conditional-user-configured	airflow	0a11a92c-0dc9-497d-9b79-76c75d3be797	0	10	f	\N	\N
0595d70a-1c17-4f53-8879-3578aa844629	\N	auth-otp-form	airflow	0a11a92c-0dc9-497d-9b79-76c75d3be797	0	20	f	\N	\N
b95e1083-ca4e-4d0e-b43a-8a01b857e484	\N	direct-grant-validate-username	airflow	2053bf5c-9bcd-4f3b-9e42-ce17c2178bd2	0	10	f	\N	\N
300e7a10-7cbd-43bc-879e-c0fdd218df54	\N	direct-grant-validate-password	airflow	2053bf5c-9bcd-4f3b-9e42-ce17c2178bd2	0	20	f	\N	\N
0be959fa-0672-4f47-827a-f5aa2cbd882e	\N	\N	airflow	2053bf5c-9bcd-4f3b-9e42-ce17c2178bd2	1	30	t	c04cf3dd-2bc8-425f-9435-52a818dec72c	\N
0dd43434-ef06-44b7-a378-13dfc8600249	\N	conditional-user-configured	airflow	c04cf3dd-2bc8-425f-9435-52a818dec72c	0	10	f	\N	\N
022c6095-c1ec-45ce-8aa0-0ba93908571f	\N	direct-grant-validate-otp	airflow	c04cf3dd-2bc8-425f-9435-52a818dec72c	0	20	f	\N	\N
29965449-8260-48f7-8599-6fa19e4e92b5	\N	registration-page-form	airflow	06550db8-ea83-4e4b-b958-53d865a97cd4	0	10	t	c18fcc39-f04b-4350-bfe4-044f87e7c533	\N
3bd86684-58fd-48be-9c71-9695b46b04e8	\N	registration-user-creation	airflow	c18fcc39-f04b-4350-bfe4-044f87e7c533	0	20	f	\N	\N
c10c7034-2ab4-4876-9763-53cfe9471929	\N	registration-profile-action	airflow	c18fcc39-f04b-4350-bfe4-044f87e7c533	0	40	f	\N	\N
76bdd152-7f88-4d41-b31a-4832d58f7538	\N	registration-password-action	airflow	c18fcc39-f04b-4350-bfe4-044f87e7c533	0	50	f	\N	\N
a89dcd94-5919-41d2-b9ae-b9090a9a90d3	\N	registration-recaptcha-action	airflow	c18fcc39-f04b-4350-bfe4-044f87e7c533	3	60	f	\N	\N
0aeeae6b-73b5-4680-a3a7-3bb759840c0b	\N	reset-credentials-choose-user	airflow	86d72b1d-c179-4a6c-a808-c4d2eab1c537	0	10	f	\N	\N
ec524400-d355-4268-a98a-ecdc0910965d	\N	reset-credential-email	airflow	86d72b1d-c179-4a6c-a808-c4d2eab1c537	0	20	f	\N	\N
b8e5a626-bf2a-4a5f-85b9-dd642847a7b5	\N	reset-password	airflow	86d72b1d-c179-4a6c-a808-c4d2eab1c537	0	30	f	\N	\N
6ec39bd6-da33-4196-9f7d-ebf7b0f85e24	\N	\N	airflow	86d72b1d-c179-4a6c-a808-c4d2eab1c537	1	40	t	5e7278e8-eebd-4bea-b362-a9ae9bf2c128	\N
febd1ea4-53d1-4ba9-b15f-ab922e98edf6	\N	conditional-user-configured	airflow	5e7278e8-eebd-4bea-b362-a9ae9bf2c128	0	10	f	\N	\N
db295ba8-3dcd-45b7-9c20-bb7087f2b98d	\N	reset-otp	airflow	5e7278e8-eebd-4bea-b362-a9ae9bf2c128	0	20	f	\N	\N
d9955f64-fbb5-43d9-bbf3-8541e0ee7709	\N	client-secret	airflow	df61db59-ef9e-4816-9c1d-d670e64b14ad	2	10	f	\N	\N
e61e08d3-7047-4b5d-adbb-8a72cd49e4ef	\N	client-jwt	airflow	df61db59-ef9e-4816-9c1d-d670e64b14ad	2	20	f	\N	\N
0800755b-ffc7-4bfe-97a6-0f4672826de7	\N	client-secret-jwt	airflow	df61db59-ef9e-4816-9c1d-d670e64b14ad	2	30	f	\N	\N
cea59294-c12a-4208-9cc6-0b8ba55f08c1	\N	client-x509	airflow	df61db59-ef9e-4816-9c1d-d670e64b14ad	2	40	f	\N	\N
5f0a07ab-a870-44a4-b96b-dcfe08182ad9	\N	idp-review-profile	airflow	6a151826-e4b3-46e6-9fc4-07c5b75f142b	0	10	f	\N	6969c7ae-884f-428b-8c56-57b0a9cfd461
50e435e6-96fd-49ba-b9a3-7cb25c620d8f	\N	\N	airflow	6a151826-e4b3-46e6-9fc4-07c5b75f142b	0	20	t	da872e4d-9529-4001-889c-b6e4e9b66a4e	\N
14c23578-7365-4a9e-b2f3-81b98fe0970f	\N	idp-create-user-if-unique	airflow	da872e4d-9529-4001-889c-b6e4e9b66a4e	2	10	f	\N	3f632a26-80ac-4e86-9bf5-63653161fb6b
e2128334-5996-4e5e-85da-cfa710fad4e2	\N	\N	airflow	da872e4d-9529-4001-889c-b6e4e9b66a4e	2	20	t	e7046d41-322b-468f-996b-d1ee960b2d1f	\N
28f77bac-a5e2-467c-85ec-ccbdb287f124	\N	idp-confirm-link	airflow	e7046d41-322b-468f-996b-d1ee960b2d1f	0	10	f	\N	\N
7c68df02-dabd-4f26-89bc-36973eb02955	\N	\N	airflow	e7046d41-322b-468f-996b-d1ee960b2d1f	0	20	t	960532dc-b194-43e9-8e17-7bf961f697c7	\N
438f0606-4b1e-4dfd-886e-39517e0c30bb	\N	idp-email-verification	airflow	960532dc-b194-43e9-8e17-7bf961f697c7	2	10	f	\N	\N
44cbee77-40e8-459e-8ca8-1506efef69b4	\N	\N	airflow	960532dc-b194-43e9-8e17-7bf961f697c7	2	20	t	8966bdda-4c12-463f-9894-1cd20805341d	\N
7d12018e-4732-49fe-a81c-25b69a6c21f1	\N	idp-username-password-form	airflow	8966bdda-4c12-463f-9894-1cd20805341d	0	10	f	\N	\N
8fc9b040-71b3-41a4-9f4e-3b5a6d7bc475	\N	\N	airflow	8966bdda-4c12-463f-9894-1cd20805341d	1	20	t	577464b6-b01d-4b8b-a3ed-47c05021e23b	\N
d74f0cb0-a909-4a31-ac1c-de8c67c48d4a	\N	conditional-user-configured	airflow	577464b6-b01d-4b8b-a3ed-47c05021e23b	0	10	f	\N	\N
7faf487e-d118-48fd-b9c6-a1b802047b04	\N	auth-otp-form	airflow	577464b6-b01d-4b8b-a3ed-47c05021e23b	0	20	f	\N	\N
f263308d-3e83-40bf-94e2-2babdd745571	\N	http-basic-authenticator	airflow	49139adc-dba5-49d3-ad61-2cabe4cbe98a	0	10	f	\N	\N
e4315ec5-4b4f-4c8c-aa96-82873964e180	\N	docker-http-basic-authenticator	airflow	3bfb6ebd-9307-4cb6-9ae4-79d82f6bf5da	0	10	f	\N	\N
9ac2391b-ad41-4a65-9ee7-6de33fead11c	\N	no-cookie-redirect	airflow	e0a3bdc4-1bf1-4059-9191-201d2422b8a0	0	10	f	\N	\N
3df221da-8f29-46f8-be52-947061b53f6d	\N	\N	airflow	e0a3bdc4-1bf1-4059-9191-201d2422b8a0	0	20	t	f969189b-85ba-4c32-bb4d-d618b203fdf7	\N
661178a0-c1dc-486f-bd99-25530d237775	\N	basic-auth	airflow	f969189b-85ba-4c32-bb4d-d618b203fdf7	0	10	f	\N	\N
a252e604-6d94-40d0-9597-4fc4574e9c0b	\N	basic-auth-otp	airflow	f969189b-85ba-4c32-bb4d-d618b203fdf7	3	20	f	\N	\N
3c216dd5-06f0-4beb-8404-45d1807827c7	\N	auth-spnego	airflow	f969189b-85ba-4c32-bb4d-d618b203fdf7	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
a1b02760-3349-4959-a668-55e9d5f425fa	browser	browser based authentication	master	basic-flow	t	t
e8cb8bc8-ef16-417e-99c7-536fa4c1115e	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
a02ca229-51ae-4284-9e6f-2c495c3e52ff	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
1035d8f2-2553-491a-88a5-3d511c279474	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
fa6b4811-24b8-493b-928e-12d8f4edc626	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
80e3de55-e89f-46ca-b63a-4b4ebb28a0ad	registration	registration flow	master	basic-flow	t	t
0f3ae21b-4a7d-4dee-8e84-b0084ada6912	registration form	registration form	master	form-flow	f	t
7c3fb01b-d886-4888-b744-4875e269df9e	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
6da76c78-1f22-428f-810e-2c09a9032ea3	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	master	basic-flow	f	t
f7ef7396-dc1a-4f3c-af85-9f04885421b6	clients	Base authentication for clients	master	client-flow	t	t
6b1a8c0f-c432-4598-905a-830f44e0e417	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
8517a42f-08a6-4c7e-b467-7d55624cf8d8	User creation or linking	Flow for the existing/non-existing user alternatives	master	basic-flow	f	t
ef016561-f864-4f0f-8022-b4d472da3f35	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
b94e7f3d-f626-4a56-91ad-d564b22f576a	Account verification options	Method with which to verity the existing account	master	basic-flow	f	t
ecbcd704-4091-4da2-9dc0-854547aa2f13	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
c7f46b98-b24c-4da7-8356-2ef626e388d7	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
1336eef2-83d4-487d-8dbd-57caac8e909b	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
9ec72291-cb8f-42fb-9146-78c4df131fe2	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
6d5eb62d-ae61-46fc-ba0b-54e4758a31b1	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
f57f9504-0928-4fb7-86d4-5ff6ea27ec28	Authentication Options	Authentication options.	master	basic-flow	f	t
49900a2f-595f-4e49-ab41-b2bd974a6ab2	browser	browser based authentication	airflow	basic-flow	t	t
872adf14-0e69-415e-a13f-23a906953ad6	forms	Username, password, otp and other auth forms.	airflow	basic-flow	f	t
0a11a92c-0dc9-497d-9b79-76c75d3be797	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	airflow	basic-flow	f	t
2053bf5c-9bcd-4f3b-9e42-ce17c2178bd2	direct grant	OpenID Connect Resource Owner Grant	airflow	basic-flow	t	t
c04cf3dd-2bc8-425f-9435-52a818dec72c	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	airflow	basic-flow	f	t
06550db8-ea83-4e4b-b958-53d865a97cd4	registration	registration flow	airflow	basic-flow	t	t
c18fcc39-f04b-4350-bfe4-044f87e7c533	registration form	registration form	airflow	form-flow	f	t
86d72b1d-c179-4a6c-a808-c4d2eab1c537	reset credentials	Reset credentials for a user if they forgot their password or something	airflow	basic-flow	t	t
5e7278e8-eebd-4bea-b362-a9ae9bf2c128	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	airflow	basic-flow	f	t
df61db59-ef9e-4816-9c1d-d670e64b14ad	clients	Base authentication for clients	airflow	client-flow	t	t
6a151826-e4b3-46e6-9fc4-07c5b75f142b	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	airflow	basic-flow	t	t
da872e4d-9529-4001-889c-b6e4e9b66a4e	User creation or linking	Flow for the existing/non-existing user alternatives	airflow	basic-flow	f	t
e7046d41-322b-468f-996b-d1ee960b2d1f	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	airflow	basic-flow	f	t
960532dc-b194-43e9-8e17-7bf961f697c7	Account verification options	Method with which to verity the existing account	airflow	basic-flow	f	t
8966bdda-4c12-463f-9894-1cd20805341d	Verify Existing Account by Re-authentication	Reauthentication of existing account	airflow	basic-flow	f	t
577464b6-b01d-4b8b-a3ed-47c05021e23b	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	airflow	basic-flow	f	t
49139adc-dba5-49d3-ad61-2cabe4cbe98a	saml ecp	SAML ECP Profile Authentication Flow	airflow	basic-flow	t	t
3bfb6ebd-9307-4cb6-9ae4-79d82f6bf5da	docker auth	Used by Docker clients to authenticate against the IDP	airflow	basic-flow	t	t
e0a3bdc4-1bf1-4059-9191-201d2422b8a0	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	airflow	basic-flow	t	t
f969189b-85ba-4c32-bb4d-d618b203fdf7	Authentication Options	Authentication options.	airflow	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
36e18eb2-fd43-4352-a2d5-1c5b4e657aa1	review profile config	master
085784b9-5b56-4aa8-8c67-b69edcbb28e6	create unique user config	master
6969c7ae-884f-428b-8c56-57b0a9cfd461	review profile config	airflow
3f632a26-80ac-4e86-9bf5-63653161fb6b	create unique user config	airflow
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
36e18eb2-fd43-4352-a2d5-1c5b4e657aa1	missing	update.profile.on.first.login
085784b9-5b56-4aa8-8c67-b69edcbb28e6	false	require.password.update.after.registration
6969c7ae-884f-428b-8c56-57b0a9cfd461	missing	update.profile.on.first.login
3f632a26-80ac-4e86-9bf5-63653161fb6b	false	require.password.update.after.registration
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
b25b35be-d710-4716-ac2e-8168b63e1719	t	t	master-realm	0	f	7c8309f3-a599-4c0f-b19a-6eafd8423280	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
230a2f6f-fb96-430f-84be-72a5ed31ceb1	t	f	account	0	f	040ad9c6-8f36-4499-b0aa-7ef002fec17c	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
b221355c-eb0e-40ef-b615-978acee2d959	t	f	account-console	0	t	85b25476-2641-44ed-a09e-d89591fb3f62	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
4a359931-e240-47e8-83fe-f4516af25424	t	f	broker	0	f	e1c2a895-c009-4718-a041-069338fac28a	\N	f	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
72d8f832-5e35-4759-9527-c3bc4c816ecb	t	f	security-admin-console	0	t	3653b3d8-efa2-44f3-9b41-d333a1831a62	/admin/master/console/	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
167cbb05-8cbd-47f0-8364-f044d1610cfa	t	f	admin-cli	0	t	43f95963-bc8d-4ec6-85bc-d1c163c4e83a	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
39810aa9-f3da-4610-a584-ed3dbef5a88b	t	t	airflow-realm	0	f	3476e3f5-818b-4364-a7c2-30c6887269b4	\N	t	\N	f	master	\N	0	f	f	airflow Realm	f	client-secret	\N	\N	\N	t	f	f	f
b773a45a-4b13-42d2-aebd-808e57a20824	t	f	realm-management	0	f	1259cdab-92e1-4828-968c-2016381f15f4	\N	t	\N	f	airflow	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	t	f	account	0	f	5a9e6748-0329-41bf-9e6e-ed09325c12f8	/realms/airflow/account/	f	\N	f	airflow	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	t	f	account-console	0	t	8e464d81-6827-4cc9-85e3-cf15dac37439	/realms/airflow/account/	f	\N	f	airflow	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
c6d93da9-598a-4523-a09a-c7151dc8b05e	t	f	broker	0	f	01d39b2e-eb08-4174-9c63-c371724ae334	\N	f	\N	f	airflow	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
1337333b-a8da-4cfa-8e26-4a0de11f8591	t	f	security-admin-console	0	t	47841362-b141-4e9b-a62c-584493fa8000	/admin/airflow/console/	f	\N	f	airflow	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
7dba7042-e203-443b-9378-484de7bf7477	t	f	admin-cli	0	t	0d74f09b-3867-479e-a06c-b00b2782f85c	\N	f	\N	f	airflow	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	t	t	airflow-client	0	f	9e661802-3356-44f3-8960-1dc890abd2bc	\N	f	\N	f	airflow	openid-connect	-1	f	f	\N	t	client-secret	\N	\N	\N	t	t	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
b221355c-eb0e-40ef-b615-978acee2d959	S256	pkce.code.challenge.method
72d8f832-5e35-4759-9527-c3bc4c816ecb	S256	pkce.code.challenge.method
3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	S256	pkce.code.challenge.method
1337333b-a8da-4cfa-8e26-4a0de11f8591	S256	pkce.code.challenge.method
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
230a2f6f-fb96-430f-84be-72a5ed31ceb1	e7633604-6f82-42d0-9a3a-d894c9b49fa6
230a2f6f-fb96-430f-84be-72a5ed31ceb1	4c05d63c-8c23-4a4e-9168-6b6f92f23b12
a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	8fbce5e2-3ff9-48ae-903e-57f277f644b1
a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	b16cc4b7-76f7-4daa-b36b-faa15745c0e7
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
c9e63e96-14f4-4675-a7d9-80dfb05a3492	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
bd4be3ad-9b30-47b3-8f7e-b65ecaad5dfa	role_list	master	SAML role list	saml
ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec	profile	master	OpenID Connect built-in scope: profile	openid-connect
1f37b120-c21c-4160-8cfe-7ac507587643	email	master	OpenID Connect built-in scope: email	openid-connect
dedbf05c-b63f-4295-a44c-6e0ce8db4754	address	master	OpenID Connect built-in scope: address	openid-connect
6026aa0f-85af-42ac-8999-c1bc31c40143	phone	master	OpenID Connect built-in scope: phone	openid-connect
407695e1-0a22-4fe0-b82f-cfcf386fa389	roles	master	OpenID Connect scope for add user roles to the access token	openid-connect
879a9dc3-6980-4791-a661-75afe0a2dd9c	web-origins	master	OpenID Connect scope for add allowed web origins to the access token	openid-connect
56c011cb-5911-43e1-8255-15536fef8cfe	microprofile-jwt	master	Microprofile - JWT built-in scope	openid-connect
e9fd6430-9813-473f-9806-16dcfbe1f96d	offline_access	airflow	OpenID Connect built-in scope: offline_access	openid-connect
39160860-119d-4dc8-8614-6330b917d4c2	role_list	airflow	SAML role list	saml
81935a69-a9d4-43bb-a8ee-4912739cf0a0	profile	airflow	OpenID Connect built-in scope: profile	openid-connect
f19faad6-28ec-4491-b081-514fb8a4f3ee	email	airflow	OpenID Connect built-in scope: email	openid-connect
cad7b8de-1824-4db4-9fb6-e658e81f77ff	address	airflow	OpenID Connect built-in scope: address	openid-connect
def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a	phone	airflow	OpenID Connect built-in scope: phone	openid-connect
a1ced3ca-0612-4212-ac02-5a099a251f54	roles	airflow	OpenID Connect scope for add user roles to the access token	openid-connect
c5543ae3-f54a-48b5-8b0e-fe7c7dd0c705	web-origins	airflow	OpenID Connect scope for add allowed web origins to the access token	openid-connect
8111419a-2426-42e0-91da-87c5b744724e	microprofile-jwt	airflow	Microprofile - JWT built-in scope	openid-connect
025074e3-3874-4263-b026-489587d3417f	default	airflow	\N	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
c9e63e96-14f4-4675-a7d9-80dfb05a3492	true	display.on.consent.screen
c9e63e96-14f4-4675-a7d9-80dfb05a3492	${offlineAccessScopeConsentText}	consent.screen.text
bd4be3ad-9b30-47b3-8f7e-b65ecaad5dfa	true	display.on.consent.screen
bd4be3ad-9b30-47b3-8f7e-b65ecaad5dfa	${samlRoleListScopeConsentText}	consent.screen.text
ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec	true	display.on.consent.screen
ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec	${profileScopeConsentText}	consent.screen.text
ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec	true	include.in.token.scope
1f37b120-c21c-4160-8cfe-7ac507587643	true	display.on.consent.screen
1f37b120-c21c-4160-8cfe-7ac507587643	${emailScopeConsentText}	consent.screen.text
1f37b120-c21c-4160-8cfe-7ac507587643	true	include.in.token.scope
dedbf05c-b63f-4295-a44c-6e0ce8db4754	true	display.on.consent.screen
dedbf05c-b63f-4295-a44c-6e0ce8db4754	${addressScopeConsentText}	consent.screen.text
dedbf05c-b63f-4295-a44c-6e0ce8db4754	true	include.in.token.scope
6026aa0f-85af-42ac-8999-c1bc31c40143	true	display.on.consent.screen
6026aa0f-85af-42ac-8999-c1bc31c40143	${phoneScopeConsentText}	consent.screen.text
6026aa0f-85af-42ac-8999-c1bc31c40143	true	include.in.token.scope
407695e1-0a22-4fe0-b82f-cfcf386fa389	true	display.on.consent.screen
407695e1-0a22-4fe0-b82f-cfcf386fa389	${rolesScopeConsentText}	consent.screen.text
407695e1-0a22-4fe0-b82f-cfcf386fa389	false	include.in.token.scope
879a9dc3-6980-4791-a661-75afe0a2dd9c	false	display.on.consent.screen
879a9dc3-6980-4791-a661-75afe0a2dd9c		consent.screen.text
879a9dc3-6980-4791-a661-75afe0a2dd9c	false	include.in.token.scope
56c011cb-5911-43e1-8255-15536fef8cfe	false	display.on.consent.screen
56c011cb-5911-43e1-8255-15536fef8cfe	true	include.in.token.scope
e9fd6430-9813-473f-9806-16dcfbe1f96d	true	display.on.consent.screen
e9fd6430-9813-473f-9806-16dcfbe1f96d	${offlineAccessScopeConsentText}	consent.screen.text
39160860-119d-4dc8-8614-6330b917d4c2	true	display.on.consent.screen
39160860-119d-4dc8-8614-6330b917d4c2	${samlRoleListScopeConsentText}	consent.screen.text
81935a69-a9d4-43bb-a8ee-4912739cf0a0	true	display.on.consent.screen
81935a69-a9d4-43bb-a8ee-4912739cf0a0	${profileScopeConsentText}	consent.screen.text
81935a69-a9d4-43bb-a8ee-4912739cf0a0	true	include.in.token.scope
f19faad6-28ec-4491-b081-514fb8a4f3ee	true	display.on.consent.screen
f19faad6-28ec-4491-b081-514fb8a4f3ee	${emailScopeConsentText}	consent.screen.text
f19faad6-28ec-4491-b081-514fb8a4f3ee	true	include.in.token.scope
cad7b8de-1824-4db4-9fb6-e658e81f77ff	true	display.on.consent.screen
cad7b8de-1824-4db4-9fb6-e658e81f77ff	${addressScopeConsentText}	consent.screen.text
cad7b8de-1824-4db4-9fb6-e658e81f77ff	true	include.in.token.scope
def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a	true	display.on.consent.screen
def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a	${phoneScopeConsentText}	consent.screen.text
def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a	true	include.in.token.scope
a1ced3ca-0612-4212-ac02-5a099a251f54	true	display.on.consent.screen
a1ced3ca-0612-4212-ac02-5a099a251f54	${rolesScopeConsentText}	consent.screen.text
a1ced3ca-0612-4212-ac02-5a099a251f54	false	include.in.token.scope
c5543ae3-f54a-48b5-8b0e-fe7c7dd0c705	false	display.on.consent.screen
c5543ae3-f54a-48b5-8b0e-fe7c7dd0c705		consent.screen.text
c5543ae3-f54a-48b5-8b0e-fe7c7dd0c705	false	include.in.token.scope
8111419a-2426-42e0-91da-87c5b744724e	false	display.on.consent.screen
8111419a-2426-42e0-91da-87c5b744724e	true	include.in.token.scope
025074e3-3874-4263-b026-489587d3417f	true	include.in.token.scope
025074e3-3874-4263-b026-489587d3417f	false	display.on.consent.screen
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
230a2f6f-fb96-430f-84be-72a5ed31ceb1	bd4be3ad-9b30-47b3-8f7e-b65ecaad5dfa	t
b221355c-eb0e-40ef-b615-978acee2d959	bd4be3ad-9b30-47b3-8f7e-b65ecaad5dfa	t
167cbb05-8cbd-47f0-8364-f044d1610cfa	bd4be3ad-9b30-47b3-8f7e-b65ecaad5dfa	t
4a359931-e240-47e8-83fe-f4516af25424	bd4be3ad-9b30-47b3-8f7e-b65ecaad5dfa	t
b25b35be-d710-4716-ac2e-8168b63e1719	bd4be3ad-9b30-47b3-8f7e-b65ecaad5dfa	t
72d8f832-5e35-4759-9527-c3bc4c816ecb	bd4be3ad-9b30-47b3-8f7e-b65ecaad5dfa	t
230a2f6f-fb96-430f-84be-72a5ed31ceb1	879a9dc3-6980-4791-a661-75afe0a2dd9c	t
230a2f6f-fb96-430f-84be-72a5ed31ceb1	1f37b120-c21c-4160-8cfe-7ac507587643	t
230a2f6f-fb96-430f-84be-72a5ed31ceb1	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec	t
230a2f6f-fb96-430f-84be-72a5ed31ceb1	407695e1-0a22-4fe0-b82f-cfcf386fa389	t
b221355c-eb0e-40ef-b615-978acee2d959	879a9dc3-6980-4791-a661-75afe0a2dd9c	t
b221355c-eb0e-40ef-b615-978acee2d959	1f37b120-c21c-4160-8cfe-7ac507587643	t
b221355c-eb0e-40ef-b615-978acee2d959	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec	t
b221355c-eb0e-40ef-b615-978acee2d959	407695e1-0a22-4fe0-b82f-cfcf386fa389	t
167cbb05-8cbd-47f0-8364-f044d1610cfa	879a9dc3-6980-4791-a661-75afe0a2dd9c	t
167cbb05-8cbd-47f0-8364-f044d1610cfa	1f37b120-c21c-4160-8cfe-7ac507587643	t
167cbb05-8cbd-47f0-8364-f044d1610cfa	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec	t
167cbb05-8cbd-47f0-8364-f044d1610cfa	407695e1-0a22-4fe0-b82f-cfcf386fa389	t
4a359931-e240-47e8-83fe-f4516af25424	879a9dc3-6980-4791-a661-75afe0a2dd9c	t
4a359931-e240-47e8-83fe-f4516af25424	1f37b120-c21c-4160-8cfe-7ac507587643	t
4a359931-e240-47e8-83fe-f4516af25424	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec	t
4a359931-e240-47e8-83fe-f4516af25424	407695e1-0a22-4fe0-b82f-cfcf386fa389	t
b25b35be-d710-4716-ac2e-8168b63e1719	879a9dc3-6980-4791-a661-75afe0a2dd9c	t
b25b35be-d710-4716-ac2e-8168b63e1719	1f37b120-c21c-4160-8cfe-7ac507587643	t
b25b35be-d710-4716-ac2e-8168b63e1719	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec	t
b25b35be-d710-4716-ac2e-8168b63e1719	407695e1-0a22-4fe0-b82f-cfcf386fa389	t
72d8f832-5e35-4759-9527-c3bc4c816ecb	879a9dc3-6980-4791-a661-75afe0a2dd9c	t
72d8f832-5e35-4759-9527-c3bc4c816ecb	1f37b120-c21c-4160-8cfe-7ac507587643	t
72d8f832-5e35-4759-9527-c3bc4c816ecb	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec	t
72d8f832-5e35-4759-9527-c3bc4c816ecb	407695e1-0a22-4fe0-b82f-cfcf386fa389	t
230a2f6f-fb96-430f-84be-72a5ed31ceb1	dedbf05c-b63f-4295-a44c-6e0ce8db4754	f
230a2f6f-fb96-430f-84be-72a5ed31ceb1	c9e63e96-14f4-4675-a7d9-80dfb05a3492	f
230a2f6f-fb96-430f-84be-72a5ed31ceb1	6026aa0f-85af-42ac-8999-c1bc31c40143	f
230a2f6f-fb96-430f-84be-72a5ed31ceb1	56c011cb-5911-43e1-8255-15536fef8cfe	f
b221355c-eb0e-40ef-b615-978acee2d959	dedbf05c-b63f-4295-a44c-6e0ce8db4754	f
b221355c-eb0e-40ef-b615-978acee2d959	c9e63e96-14f4-4675-a7d9-80dfb05a3492	f
b221355c-eb0e-40ef-b615-978acee2d959	6026aa0f-85af-42ac-8999-c1bc31c40143	f
b221355c-eb0e-40ef-b615-978acee2d959	56c011cb-5911-43e1-8255-15536fef8cfe	f
167cbb05-8cbd-47f0-8364-f044d1610cfa	dedbf05c-b63f-4295-a44c-6e0ce8db4754	f
167cbb05-8cbd-47f0-8364-f044d1610cfa	c9e63e96-14f4-4675-a7d9-80dfb05a3492	f
167cbb05-8cbd-47f0-8364-f044d1610cfa	6026aa0f-85af-42ac-8999-c1bc31c40143	f
167cbb05-8cbd-47f0-8364-f044d1610cfa	56c011cb-5911-43e1-8255-15536fef8cfe	f
4a359931-e240-47e8-83fe-f4516af25424	dedbf05c-b63f-4295-a44c-6e0ce8db4754	f
4a359931-e240-47e8-83fe-f4516af25424	c9e63e96-14f4-4675-a7d9-80dfb05a3492	f
4a359931-e240-47e8-83fe-f4516af25424	6026aa0f-85af-42ac-8999-c1bc31c40143	f
4a359931-e240-47e8-83fe-f4516af25424	56c011cb-5911-43e1-8255-15536fef8cfe	f
b25b35be-d710-4716-ac2e-8168b63e1719	dedbf05c-b63f-4295-a44c-6e0ce8db4754	f
b25b35be-d710-4716-ac2e-8168b63e1719	c9e63e96-14f4-4675-a7d9-80dfb05a3492	f
b25b35be-d710-4716-ac2e-8168b63e1719	6026aa0f-85af-42ac-8999-c1bc31c40143	f
b25b35be-d710-4716-ac2e-8168b63e1719	56c011cb-5911-43e1-8255-15536fef8cfe	f
72d8f832-5e35-4759-9527-c3bc4c816ecb	dedbf05c-b63f-4295-a44c-6e0ce8db4754	f
72d8f832-5e35-4759-9527-c3bc4c816ecb	c9e63e96-14f4-4675-a7d9-80dfb05a3492	f
72d8f832-5e35-4759-9527-c3bc4c816ecb	6026aa0f-85af-42ac-8999-c1bc31c40143	f
72d8f832-5e35-4759-9527-c3bc4c816ecb	56c011cb-5911-43e1-8255-15536fef8cfe	f
39810aa9-f3da-4610-a584-ed3dbef5a88b	bd4be3ad-9b30-47b3-8f7e-b65ecaad5dfa	t
39810aa9-f3da-4610-a584-ed3dbef5a88b	879a9dc3-6980-4791-a661-75afe0a2dd9c	t
39810aa9-f3da-4610-a584-ed3dbef5a88b	1f37b120-c21c-4160-8cfe-7ac507587643	t
39810aa9-f3da-4610-a584-ed3dbef5a88b	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec	t
39810aa9-f3da-4610-a584-ed3dbef5a88b	407695e1-0a22-4fe0-b82f-cfcf386fa389	t
39810aa9-f3da-4610-a584-ed3dbef5a88b	dedbf05c-b63f-4295-a44c-6e0ce8db4754	f
39810aa9-f3da-4610-a584-ed3dbef5a88b	c9e63e96-14f4-4675-a7d9-80dfb05a3492	f
39810aa9-f3da-4610-a584-ed3dbef5a88b	6026aa0f-85af-42ac-8999-c1bc31c40143	f
39810aa9-f3da-4610-a584-ed3dbef5a88b	56c011cb-5911-43e1-8255-15536fef8cfe	f
a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	39160860-119d-4dc8-8614-6330b917d4c2	t
3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	39160860-119d-4dc8-8614-6330b917d4c2	t
7dba7042-e203-443b-9378-484de7bf7477	39160860-119d-4dc8-8614-6330b917d4c2	t
c6d93da9-598a-4523-a09a-c7151dc8b05e	39160860-119d-4dc8-8614-6330b917d4c2	t
b773a45a-4b13-42d2-aebd-808e57a20824	39160860-119d-4dc8-8614-6330b917d4c2	t
1337333b-a8da-4cfa-8e26-4a0de11f8591	39160860-119d-4dc8-8614-6330b917d4c2	t
a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	a1ced3ca-0612-4212-ac02-5a099a251f54	t
a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	f19faad6-28ec-4491-b081-514fb8a4f3ee	t
a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	81935a69-a9d4-43bb-a8ee-4912739cf0a0	t
a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	c5543ae3-f54a-48b5-8b0e-fe7c7dd0c705	t
3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	a1ced3ca-0612-4212-ac02-5a099a251f54	t
3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	f19faad6-28ec-4491-b081-514fb8a4f3ee	t
3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	81935a69-a9d4-43bb-a8ee-4912739cf0a0	t
3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	c5543ae3-f54a-48b5-8b0e-fe7c7dd0c705	t
7dba7042-e203-443b-9378-484de7bf7477	a1ced3ca-0612-4212-ac02-5a099a251f54	t
7dba7042-e203-443b-9378-484de7bf7477	f19faad6-28ec-4491-b081-514fb8a4f3ee	t
7dba7042-e203-443b-9378-484de7bf7477	81935a69-a9d4-43bb-a8ee-4912739cf0a0	t
7dba7042-e203-443b-9378-484de7bf7477	c5543ae3-f54a-48b5-8b0e-fe7c7dd0c705	t
c6d93da9-598a-4523-a09a-c7151dc8b05e	a1ced3ca-0612-4212-ac02-5a099a251f54	t
c6d93da9-598a-4523-a09a-c7151dc8b05e	f19faad6-28ec-4491-b081-514fb8a4f3ee	t
c6d93da9-598a-4523-a09a-c7151dc8b05e	81935a69-a9d4-43bb-a8ee-4912739cf0a0	t
c6d93da9-598a-4523-a09a-c7151dc8b05e	c5543ae3-f54a-48b5-8b0e-fe7c7dd0c705	t
b773a45a-4b13-42d2-aebd-808e57a20824	a1ced3ca-0612-4212-ac02-5a099a251f54	t
b773a45a-4b13-42d2-aebd-808e57a20824	f19faad6-28ec-4491-b081-514fb8a4f3ee	t
b773a45a-4b13-42d2-aebd-808e57a20824	81935a69-a9d4-43bb-a8ee-4912739cf0a0	t
b773a45a-4b13-42d2-aebd-808e57a20824	c5543ae3-f54a-48b5-8b0e-fe7c7dd0c705	t
1337333b-a8da-4cfa-8e26-4a0de11f8591	a1ced3ca-0612-4212-ac02-5a099a251f54	t
1337333b-a8da-4cfa-8e26-4a0de11f8591	f19faad6-28ec-4491-b081-514fb8a4f3ee	t
1337333b-a8da-4cfa-8e26-4a0de11f8591	81935a69-a9d4-43bb-a8ee-4912739cf0a0	t
1337333b-a8da-4cfa-8e26-4a0de11f8591	c5543ae3-f54a-48b5-8b0e-fe7c7dd0c705	t
a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	e9fd6430-9813-473f-9806-16dcfbe1f96d	f
a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a	f
a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	cad7b8de-1824-4db4-9fb6-e658e81f77ff	f
a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	8111419a-2426-42e0-91da-87c5b744724e	f
3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	e9fd6430-9813-473f-9806-16dcfbe1f96d	f
3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a	f
3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	cad7b8de-1824-4db4-9fb6-e658e81f77ff	f
3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	8111419a-2426-42e0-91da-87c5b744724e	f
7dba7042-e203-443b-9378-484de7bf7477	e9fd6430-9813-473f-9806-16dcfbe1f96d	f
7dba7042-e203-443b-9378-484de7bf7477	def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a	f
7dba7042-e203-443b-9378-484de7bf7477	cad7b8de-1824-4db4-9fb6-e658e81f77ff	f
7dba7042-e203-443b-9378-484de7bf7477	8111419a-2426-42e0-91da-87c5b744724e	f
c6d93da9-598a-4523-a09a-c7151dc8b05e	e9fd6430-9813-473f-9806-16dcfbe1f96d	f
c6d93da9-598a-4523-a09a-c7151dc8b05e	def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a	f
c6d93da9-598a-4523-a09a-c7151dc8b05e	cad7b8de-1824-4db4-9fb6-e658e81f77ff	f
c6d93da9-598a-4523-a09a-c7151dc8b05e	8111419a-2426-42e0-91da-87c5b744724e	f
b773a45a-4b13-42d2-aebd-808e57a20824	e9fd6430-9813-473f-9806-16dcfbe1f96d	f
b773a45a-4b13-42d2-aebd-808e57a20824	def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a	f
b773a45a-4b13-42d2-aebd-808e57a20824	cad7b8de-1824-4db4-9fb6-e658e81f77ff	f
b773a45a-4b13-42d2-aebd-808e57a20824	8111419a-2426-42e0-91da-87c5b744724e	f
1337333b-a8da-4cfa-8e26-4a0de11f8591	e9fd6430-9813-473f-9806-16dcfbe1f96d	f
1337333b-a8da-4cfa-8e26-4a0de11f8591	def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a	f
1337333b-a8da-4cfa-8e26-4a0de11f8591	cad7b8de-1824-4db4-9fb6-e658e81f77ff	f
1337333b-a8da-4cfa-8e26-4a0de11f8591	8111419a-2426-42e0-91da-87c5b744724e	f
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	c5543ae3-f54a-48b5-8b0e-fe7c7dd0c705	t
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	025074e3-3874-4263-b026-489587d3417f	t
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	39160860-119d-4dc8-8614-6330b917d4c2	t
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	a1ced3ca-0612-4212-ac02-5a099a251f54	t
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	81935a69-a9d4-43bb-a8ee-4912739cf0a0	t
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	f19faad6-28ec-4491-b081-514fb8a4f3ee	t
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	cad7b8de-1824-4db4-9fb6-e658e81f77ff	f
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a	f
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	e9fd6430-9813-473f-9806-16dcfbe1f96d	f
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	8111419a-2426-42e0-91da-87c5b744724e	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
c9e63e96-14f4-4675-a7d9-80dfb05a3492	1c19d1f4-9d5a-4b89-aa4c-77d634e5fd20
e9fd6430-9813-473f-9806-16dcfbe1f96d	6cf01a12-5bc4-4dda-af32-c924f9b48bb8
025074e3-3874-4263-b026-489587d3417f	8921845d-3df7-4f55-ba50-dc35cad1f16f
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
0f6edc02-9e60-4c4b-873b-162d19312f4a	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
aadd92fa-fa85-43e5-ba76-2b425cc6f4d6	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
5ba0135e-7d51-4d14-938e-96c7dac0052f	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
2dad4484-37b1-4314-9ac3-91c2adf51907	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
e3c4577f-1e05-4e9c-bbe3-1f04f5679554	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
a6775d46-b6eb-41da-9258-79141c309360	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
5407c5a0-eb86-470e-b1bc-3d588d8923bf	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
138204ef-fba4-4b8e-8cb1-8be8fe57823f	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
6cca627f-8532-4ae3-8ba3-c04ff1de9fbb	fallback-RS256	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
82a4ed8d-f024-48cf-899c-57fc35c56a0d	fallback-HS256	master	hmac-generated	org.keycloak.keys.KeyProvider	master	\N
855e614f-c2bc-4fe0-8d15-4f2028d83f28	rsa-generated	airflow	rsa-generated	org.keycloak.keys.KeyProvider	airflow	\N
fcb2d8b0-b456-4ac8-8833-294f619276f5	hmac-generated	airflow	hmac-generated	org.keycloak.keys.KeyProvider	airflow	\N
eb7ad48f-2bc8-4b6d-ac79-5f58cc5be90c	aes-generated	airflow	aes-generated	org.keycloak.keys.KeyProvider	airflow	\N
9034d1c0-4656-4a6b-810c-3c13a83c6434	Trusted Hosts	airflow	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	anonymous
8c93f996-9847-4852-9088-9a5865727f8a	Consent Required	airflow	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	anonymous
ecd4f686-9b7e-4ebd-9611-06fe74bfd009	Full Scope Disabled	airflow	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	anonymous
d93ac4bc-ee2c-44d9-9a1f-28716516da3b	Max Clients Limit	airflow	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	anonymous
148bd83f-819d-48db-b53e-a821b19857df	Allowed Protocol Mapper Types	airflow	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	anonymous
e4a04d2b-d7d3-4547-a660-6901bf210f73	Allowed Client Scopes	airflow	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	anonymous
a78accec-30a6-426b-88bb-0730087ea141	Allowed Protocol Mapper Types	airflow	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	authenticated
53eb1dfd-645b-4608-918c-ae1f0418eba8	Allowed Client Scopes	airflow	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	airflow	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
555b372d-1441-4c27-b22b-755fc4a80d1a	a6775d46-b6eb-41da-9258-79141c309360	allow-default-scopes	true
e021a174-0e59-49cc-9771-ded003779f4f	138204ef-fba4-4b8e-8cb1-8be8fe57823f	allow-default-scopes	true
580b4adf-18fb-4903-9b25-a819d7c8e2cc	5407c5a0-eb86-470e-b1bc-3d588d8923bf	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
ed25afa7-e9b3-49d7-8d20-51cc3601fee9	5407c5a0-eb86-470e-b1bc-3d588d8923bf	allowed-protocol-mapper-types	saml-user-attribute-mapper
66078ca6-2261-4614-abcb-fd22d8af58ed	5407c5a0-eb86-470e-b1bc-3d588d8923bf	allowed-protocol-mapper-types	saml-user-property-mapper
e62d0a84-183f-4e50-a871-599587252ca7	5407c5a0-eb86-470e-b1bc-3d588d8923bf	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
05364508-d5d7-445f-9111-c8f998e5bb45	5407c5a0-eb86-470e-b1bc-3d588d8923bf	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
3e034825-3e8b-4199-a84f-42dbd4dbf9ce	5407c5a0-eb86-470e-b1bc-3d588d8923bf	allowed-protocol-mapper-types	oidc-full-name-mapper
752ad74b-0c7f-40b0-a2c4-fe34adff720a	5407c5a0-eb86-470e-b1bc-3d588d8923bf	allowed-protocol-mapper-types	oidc-address-mapper
0cf94564-804e-4072-8dac-daf1c92d56ec	5407c5a0-eb86-470e-b1bc-3d588d8923bf	allowed-protocol-mapper-types	saml-role-list-mapper
cf051266-9417-4a75-b74f-05688177c542	e3c4577f-1e05-4e9c-bbe3-1f04f5679554	allowed-protocol-mapper-types	saml-user-property-mapper
a26d8299-c009-4fac-a504-b3be4a32dddb	e3c4577f-1e05-4e9c-bbe3-1f04f5679554	allowed-protocol-mapper-types	oidc-full-name-mapper
f1f734f1-1165-40d6-9f7f-0732139d2d99	e3c4577f-1e05-4e9c-bbe3-1f04f5679554	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
e2380ce5-5fe3-45d4-bebd-5dba27f11e6a	e3c4577f-1e05-4e9c-bbe3-1f04f5679554	allowed-protocol-mapper-types	saml-user-attribute-mapper
37c54e05-3e74-4ceb-a7f5-ef5cae053ddf	e3c4577f-1e05-4e9c-bbe3-1f04f5679554	allowed-protocol-mapper-types	oidc-address-mapper
5f7e8ea0-212b-4473-99af-5b5aa2944204	e3c4577f-1e05-4e9c-bbe3-1f04f5679554	allowed-protocol-mapper-types	saml-role-list-mapper
6c895285-e2c1-455b-a466-7b3d2be91886	e3c4577f-1e05-4e9c-bbe3-1f04f5679554	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
0747d637-21ef-4118-98d9-a9872d851473	e3c4577f-1e05-4e9c-bbe3-1f04f5679554	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
65e25730-8f1d-4371-9556-9c85eb9e6aa3	0f6edc02-9e60-4c4b-873b-162d19312f4a	client-uris-must-match	true
d65e38e9-8034-4a4e-8c72-427e29fc5939	0f6edc02-9e60-4c4b-873b-162d19312f4a	host-sending-registration-request-must-match	true
e10de8c8-172e-47a0-b0ac-3aadedccdaca	2dad4484-37b1-4314-9ac3-91c2adf51907	max-clients	200
82874ac9-2d17-4d5c-a366-f08ca0faef15	6cca627f-8532-4ae3-8ba3-c04ff1de9fbb	algorithm	RS256
3157c312-de66-4b7e-bf99-157c6257a8f2	6cca627f-8532-4ae3-8ba3-c04ff1de9fbb	privateKey	MIIEowIBAAKCAQEAke9y71/gwClx5YcOoBSwLGBySgkNg0WR7Ic6bzJYUi3C8FC6dD4pBcfqDRBZGGADkXrg5XNKBoO/bt/w9W9WZtfmNOX7s8TDCy6v9JRQGjcBVGKt01nLg/Ad9KFOelzr1Vxd4e0QMhwus/Ci6M5SZRM6+ovpJOFqJi1tZ0ytts8rg3JkfT1ZJFqyLI1MGLNTcwKiz2w2IE22aqqZj+BlbJBAIub3jF8KttS8dqo6tNACpg1mvm4nvPxBUURHENt21fSBL6pOuIYitXq1CKNz0pc5KGNf8nLZ/8O+k0WwEfYEE2MG9b9SmuyzBIuCRqFXUkfK/9X/sYfNgn2xNdMvfQIDAQABAoIBABVdpEstk18u8jDznA2N2dk1aaYzOxo8BkhF6CU9jrbBYmgCubmpHCJviXHOMe0iqYMUJXcScQURJubZvJKCcXjvJRIblcVVCmVJuZMqX6vm37f2FpL585Tmg8w8DZxWnGSJeGlKZvOfMqs/kOpawq9vqFPkRgcTRZI/VmQoUsqPwyo222833AY4TkUsWJlp0pS4MWYj2tT7PmrSs7WgISh5tUB+zsRWx0XFGobWl6q1rn+p3vL3EKqPCqEd33ml/3x4FUlcct5ZTKTpj3QajdaV7672P4kI3MzB7y5rsSgiXyiPrmaiGQbjNZNCaZxY7wq5Je3LKYzlo0DE3Pz4OZUCgYEA3NxKVXOA9+if+Q2ENf7cnlwv83Oz907Yq3Epxlo572ugEgpgKbIao1kZwfOuaxuR0eX7VfWYVucz+kD7186dTfwlmENf2DF5vlD067cie5Z013CSK5JaXbuxcj16BUMlRG///EbyS0YCybd8Lf8yyotVg9huDhjO3PofxATXfeMCgYEAqSdvoBkmPef4ZUBeqC71XQ42ESI3YQbsS1pgjdTUrW4DDO0rSGR8Ed3yd1n/xdolvtd8el0m7zv6CCWIsTnTaDRmdkPIk22QYY8SmL31x1o1laQg91lxCukLY7l6P9miNbpqnrmRCHq2ucU6vfDCQ1yDN06mlJz8faKk5z78Gx8CgYBiCJ4uI+DhKa6oe+ltlj0TRdQ6+eauJZ9jKg3i73W74kfg+h4JI/dS/l/CiYmoHUqyoqTXWPZPzLxznpirCBkm3n9JgM5wRjXF1mWAo3944CXo4xzenk3iQUfYb5VT9KP8JsK3lj5CT0c5hmpmeFpxMTu6FD11oGliCNxEw+lrBQKBgBsu/z1XTVH9iWmcIpockcnWktHGEehB2I9zgrjITzVfzJWzN5V2sImehWywxe3h1NcKgjKX7b3cgZ31ijYQ+OxyH1U6J22p2d4TxAVP4cObt6jIq5OUiBocwXvRPtgr/Wls/91qLOiT7/GCxKHpow54O44T0aloYRs/nAidkp45AoGBAMWOPlgksPCMYsMyUM0+e3UzWt0M466CekK92SD30c6q0pjOvHW3ePOqdiK/QgDx7BUoOt7cIFDD1IlTHbKjHB7vr/Pp0WxPQHX/m2gLOU6bwvCj5wTLzYTbMV0ZwBTs1aEI2XMQ4T/w/HpOG4Rz0HrmgkEuBxEVJ+wIJuyFnkP2
522cef36-af3d-4e5a-a86c-fc59183cf09c	6cca627f-8532-4ae3-8ba3-c04ff1de9fbb	priority	-100
e72e4d34-95d0-472e-bd56-5d5ab176c917	6cca627f-8532-4ae3-8ba3-c04ff1de9fbb	certificate	MIICmzCCAYMCBgF4m4mnIzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjEwNDA0MDYxODEzWhcNMzEwNDA0MDYxOTUzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCR73LvX+DAKXHlhw6gFLAsYHJKCQ2DRZHshzpvMlhSLcLwULp0PikFx+oNEFkYYAOReuDlc0oGg79u3/D1b1Zm1+Y05fuzxMMLLq/0lFAaNwFUYq3TWcuD8B30oU56XOvVXF3h7RAyHC6z8KLozlJlEzr6i+kk4WomLW1nTK22zyuDcmR9PVkkWrIsjUwYs1NzAqLPbDYgTbZqqpmP4GVskEAi5veMXwq21Lx2qjq00AKmDWa+bie8/EFRREcQ23bV9IEvqk64hiK1erUIo3PSlzkoY1/yctn/w76TRbAR9gQTYwb1v1Ka7LMEi4JGoVdSR8r/1f+xh82CfbE10y99AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFy845ZnnOtz3Yk0Y6bXMntISNgncTq9s3te7+14rwEXFIpjBy/hRH4VcyJvlnbTLnVVmxzTjK533OOD3kuhT8qLQ+JEKp4U5ul0NlIPgHiet2qXemwfiqd4B5nBn3t9FwfQrT7ZWdlv/9V7ukROM1U8zjLYMu4PbyxeeqhGzA4984va+R8cnW1sdJc0ojqc+glX9BfH/mTJw6Y1wr3DGXx4LvAIZG/IwMXMmQzEQLhGxpgbn/11qJkFB/D8iJtCYJbQm/+lGI8HbpHuGwdI66l8b4sSBIVw5YGjpBvBaScHUvtLi1+KYjFnhv+pt0WMjNUWzvoH2dnDV7yGtxM3mco=
fac5eaee-f1c1-4cf8-9259-e7cfcdfc56d5	82a4ed8d-f024-48cf-899c-57fc35c56a0d	algorithm	HS256
27ed0adb-1558-4345-ae10-d7543ad439c2	82a4ed8d-f024-48cf-899c-57fc35c56a0d	secret	CdaQLZHIBN-SxVIOXkT0xCg-J0K2xUHk48A6X7iPZHpI1I272koqL33ZqthWdLp2yV2m4Hm9kzUkHXa8eYu_jw
22bcee01-df1b-4c0c-877c-b2ca0ebb1226	82a4ed8d-f024-48cf-899c-57fc35c56a0d	kid	b0e9e459-e13d-4e29-a045-a743af3bb980
37e1dc74-551c-4009-906b-50ff80255b51	82a4ed8d-f024-48cf-899c-57fc35c56a0d	priority	-100
50e34e54-80da-4f41-a797-fbc48dd0f5cf	fcb2d8b0-b456-4ac8-8833-294f619276f5	priority	100
6745728c-d363-4f64-b7f1-b8f578b9d48f	fcb2d8b0-b456-4ac8-8833-294f619276f5	algorithm	HS256
6c4e51f1-975e-41ee-aa96-96cc5725a203	fcb2d8b0-b456-4ac8-8833-294f619276f5	kid	411f90f1-7b23-41f7-b2bd-7d1e6d9f5004
41e20740-0fea-4fd6-b471-4c0ec1b40c87	fcb2d8b0-b456-4ac8-8833-294f619276f5	secret	fhWi6qEkJ-bYMS1hxwJ7gJyUGhkd06FHCBUok57tplUqexJTN13aXyZD1gRSIz400sqlxB7hoSm7pJL4gHdwMw
c648f319-7e22-47ed-b670-399841486474	eb7ad48f-2bc8-4b6d-ac79-5f58cc5be90c	kid	3247bbdd-42f1-4b89-be5e-1ae84ae92ac1
0f7bd679-ddff-4eb2-b4ef-37daab0b2738	eb7ad48f-2bc8-4b6d-ac79-5f58cc5be90c	priority	100
713eb31d-3c3c-4eb5-af56-375da1af53aa	eb7ad48f-2bc8-4b6d-ac79-5f58cc5be90c	secret	Oo6plu4-e3ndpd-SNmuAyQ
4aecfc86-c6cd-4f6e-aa52-bf99bc01fc91	855e614f-c2bc-4fe0-8d15-4f2028d83f28	certificate	MIICnTCCAYUCBgF4m4nEQDANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdhaXJmbG93MB4XDTIxMDQwNDA2MTgyMFoXDTMxMDQwNDA2MjAwMFowEjEQMA4GA1UEAwwHYWlyZmxvdzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMbURH8CjszAYiIyzjiFfbkdfclW6IuLGxhAjkbqrSVzubVuWCEGH0KU2XY3Ap+RR2Fw3M33TuTjceaa6LIU3yGFBuGA7i77A5LALCG91BJSi9rA4Hu6//7+UqWTZeJ9TDLbP9vz4yYnEoj0gsiua/zRSNOOB6R3mrUwG4v1MqcAXX+1cTMHwkol9VVLUJsvxKIuANLDn/pbmdKVAUT0cleoHpNA2770NgCkBqPg0XpBWrL+dnn67y55TpLdRMJ96a3j3RKdwegW9+HsRDLHL2RoYhy1zSKzh0Bg30JdOrTH5Ke37MUfE4RRJDWytB8mutyC8yolSzWkfosbmC0WvlsCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAjJcaR/+ZlYKSCuveezX9oZFBkIwDgBoRmieTx5lQk5U1N+SmszSmbtEOrrJEaxj+TRtW87YIJFORC9aXrfX7yJVGMoa7AlBMKJoUlEM3KpttAeMoHWKDWmMgJqyEyNau+ata3JcSnEUW5cS5b9EDlhSGgaOlKAyvDN4SbpZPmO6nttnG+ssvQjqRzml609gkFZJ/b6cUhx/RkSm9CeXC7bC6K5Gsr2gOKS3lbewYg9mdLs+mrQdYFB3vu3tQR4rk4gxHetnSgWvRHr9MAr9Hx4tSED6TvAXFtO/wNQ9lF3VpM8Z0gxQfqXYzPIWFjKpx8Gotd+3Am9HlYP4QHL4Djw==
a5422244-6bfe-472e-8746-0ad8275dbb7c	855e614f-c2bc-4fe0-8d15-4f2028d83f28	priority	100
6faccc49-e78d-4d67-9963-b130d06c3c5d	855e614f-c2bc-4fe0-8d15-4f2028d83f28	privateKey	MIIEpAIBAAKCAQEAxtREfwKOzMBiIjLOOIV9uR19yVboi4sbGECORuqtJXO5tW5YIQYfQpTZdjcCn5FHYXDczfdO5ONx5proshTfIYUG4YDuLvsDksAsIb3UElKL2sDge7r//v5SpZNl4n1MMts/2/PjJicSiPSCyK5r/NFI044HpHeatTAbi/UypwBdf7VxMwfCSiX1VUtQmy/Eoi4A0sOf+luZ0pUBRPRyV6gek0DbvvQ2AKQGo+DRekFasv52efrvLnlOkt1Ewn3prePdEp3B6Bb34exEMscvZGhiHLXNIrOHQGDfQl06tMfkp7fsxR8ThFEkNbK0Hya63ILzKiVLNaR+ixuYLRa+WwIDAQABAoIBAQCla6MVPI6MIR9ELprOAZoI8lVdtpXAy1oegk8dB1BI0ZBXN1fRGePWJDsMlFX1ZgxKMHk0TyZvXh+8aXNh/eVqYN/Jq9f+dE6TwJi29dVD7TN4K3JY3srvXq5qHUjt96r2wNzPZYi9jFJqaWuKBTvI2mJJyGfpWKz5Q+4XMkgTEc4vXX14NNAEyK7E6E5KA8iW/D8xPejMrS9IBBsFl+4D/yIRJX2H7DTeBcUvP0ZOXIfkcag9UxA7oMAmAlal7jvc/K8fuR/OXMsgee5QfnAm1MBmoCRMpU0WWE12Brh5FmG/KyZ/HzXQncbJKtbojl32Yzs1S1/qPk/TfmCjem5RAoGBAOeDSDJWq/aPUdtYF6sbD0JXTr/qJTaafAbntI0wKEdnvRUXad2iF0dEGieNyr9ke4B7+P1ekABTuwU8VhyuDpq5achn8J1YKyM8XsWq8H9JROo4StpegxAye+KMbqgfc7gp00t+R9T3kCT9yw4/6VnELyXbHxAWW8LgnLAs9HJJAoGBANvcAQKklsPgdgrHZUcD0cAn9v7tHIzBBQR42sbipQ82huUkdPEZx5IkuXIi9AwiJSvHOVKORu2tbSRoUyQnSUFyN+OGo+yChypguiB2YPSVK1AP332DF/2kC+RAnC0RIAHj/jqtocIUOS4ZYkKM1u4NYwoaXbpMzU7ge9D2XiuDAoGAF4thZ0UrPer7byw5U/xvg9avOpNMb44seONNmGJCZmilcSStbo3Sgjvp0QX5jZdhfAKfotzgFjhtt62YMFh/QbsDiA8SCF50HKRCGyY0SS2hZZSOAEFGYPpRYQvZIR35vcv7Ih1Yns8CiNCKuwtC5w8toFL1iMRNVrdTGBOqVIkCgYBTGaXcHN/La5TSYCl8nQnzymdGVdL7tJ0z4oY2tEXVKTP1ekElPCw9pdneNS3vRByunl+hP5u5jFp7b181hA/hR82uFx7wbymtr9/KE1R0PcmgOk+r/hfcS9weyvj848MoU8es4CIK3F/8d6W3J8q5MaAkmnCg0RSs4paKFgTkBwKBgQCBAn4qtZ6EFa4T4oQ+VcK1gOmjINxMVgk65PQaLejxVPkY1PiJZY8K8Nkq5u+ju+9X4p4XcwmFVamr413Qt2xg696NOkqMZH+w0+d6GMAjaANl0G3Y471XLxE1xayLbO0zf7p5IJf0IAroeaqDaeYbSlr4wBLcVWv1SXXYEEzzSw==
158ee900-2648-482b-828e-8af97332727c	d93ac4bc-ee2c-44d9-9a1f-28716516da3b	max-clients	200
5e205aea-bdbc-489a-b37c-89c064329540	e4a04d2b-d7d3-4547-a660-6901bf210f73	allow-default-scopes	true
c037c4eb-e49e-4653-bc1c-b58ed47edf53	53eb1dfd-645b-4608-918c-ae1f0418eba8	allow-default-scopes	true
b08a471c-d050-42ff-9929-1d1534cf7a27	9034d1c0-4656-4a6b-810c-3c13a83c6434	host-sending-registration-request-must-match	true
0139ae5f-2d89-4d9d-9e10-c72c56b3017b	9034d1c0-4656-4a6b-810c-3c13a83c6434	client-uris-must-match	true
845a0ded-7571-4eab-9c69-5de846659ed0	a78accec-30a6-426b-88bb-0730087ea141	allowed-protocol-mapper-types	oidc-address-mapper
ca481786-f9a2-4ca9-b5ef-c9c17f91b587	a78accec-30a6-426b-88bb-0730087ea141	allowed-protocol-mapper-types	saml-role-list-mapper
227e2e15-75e7-41ec-afc7-42f3242b6cee	a78accec-30a6-426b-88bb-0730087ea141	allowed-protocol-mapper-types	saml-user-attribute-mapper
7e99c974-8878-4dc7-819c-9f84f36506a2	a78accec-30a6-426b-88bb-0730087ea141	allowed-protocol-mapper-types	oidc-full-name-mapper
9bba85c0-fa6a-4cca-823a-40bfe85bb139	a78accec-30a6-426b-88bb-0730087ea141	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
8c70648e-4619-4d92-8c31-4a46576e1ce6	a78accec-30a6-426b-88bb-0730087ea141	allowed-protocol-mapper-types	saml-user-property-mapper
ca2668b8-a9ea-4d5b-ad56-94fd603fbf3a	a78accec-30a6-426b-88bb-0730087ea141	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
917369c3-ab07-456b-9f96-d0703c6bb61e	a78accec-30a6-426b-88bb-0730087ea141	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
aa4e7494-e94d-41c7-af90-4fa28e69c394	148bd83f-819d-48db-b53e-a821b19857df	allowed-protocol-mapper-types	saml-user-property-mapper
6ac7cf44-aa1b-4cc7-905c-617cf38e5d14	148bd83f-819d-48db-b53e-a821b19857df	allowed-protocol-mapper-types	saml-role-list-mapper
3bd0ef9f-1953-4a61-8c97-df5bb2564bb7	148bd83f-819d-48db-b53e-a821b19857df	allowed-protocol-mapper-types	oidc-full-name-mapper
d462f662-6cb8-4aec-bf3d-61be9a60dd25	148bd83f-819d-48db-b53e-a821b19857df	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
4ccfdc21-8f8a-4a7b-a69d-e7bd271dcc61	148bd83f-819d-48db-b53e-a821b19857df	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
f15d7b3d-2ef8-4643-8dc8-ac2bf3e2c1e6	148bd83f-819d-48db-b53e-a821b19857df	allowed-protocol-mapper-types	oidc-address-mapper
40e333a8-ccb8-4858-84c3-1b166af954d1	148bd83f-819d-48db-b53e-a821b19857df	allowed-protocol-mapper-types	saml-user-attribute-mapper
5fdfe626-d10a-43c6-9da6-c0faebbf47df	148bd83f-819d-48db-b53e-a821b19857df	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.composite_role (composite, child_role) FROM stdin;
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	b41deb32-91f7-47ae-9608-7eda1f93c57e
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	03e2c8e7-8e81-43cd-bc70-7aa42845a0ce
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	9274012e-549b-4f9d-8f0a-2d5907e93c4d
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	a13fb703-8cc8-483c-aee9-9a7880bea7cb
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	ba1e6288-4484-4e93-9151-e6af0f08f451
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	8dcf7ffe-f312-47f6-ad1f-e1a6ee425b89
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	410303dd-e599-4346-ac0c-6cc4753875b6
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	055bebf9-795e-452a-ad75-6ad1bd3d143b
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	d059deed-27b7-4ae7-a5e8-9de2afe51526
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	9348efe4-d0fe-4304-b1f2-3de4b48e08bc
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	421a8600-e64a-44ce-8590-412a8aec34e1
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	cd900d0a-654d-4485-a797-4163f938278d
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	f88445b4-9a9b-4f44-bdc0-cfbb53acd2d8
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	0fe67920-11cf-4920-936e-c880a5292315
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	a034afca-46a5-4c98-981b-99a836da9f49
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	86963755-8acd-4d83-ad41-a37141b8c470
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	b1f40d00-f2d9-4cb9-996e-10cefc54c925
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	7fa5e366-08ff-43d7-ad98-34bf2c4f44e6
ba1e6288-4484-4e93-9151-e6af0f08f451	86963755-8acd-4d83-ad41-a37141b8c470
a13fb703-8cc8-483c-aee9-9a7880bea7cb	a034afca-46a5-4c98-981b-99a836da9f49
a13fb703-8cc8-483c-aee9-9a7880bea7cb	7fa5e366-08ff-43d7-ad98-34bf2c4f44e6
4c05d63c-8c23-4a4e-9168-6b6f92f23b12	cc23f936-7731-47bb-8283-7cb981451922
0185c062-3db1-4528-8238-13c727f9369f	83b44329-ab1d-416d-824a-3c1766383ade
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	cb19de04-33fd-4e4f-8400-880008999d14
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	37ba7f7c-77a5-431c-b83e-94c85e5e8d86
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	af9a5130-e7a7-4ed8-b4f1-09e87f17fa7d
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	abcfb951-a987-499c-b941-efe49fee6368
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	96800368-664d-43d2-805f-218c43a3676d
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	cff41bb0-c720-478d-a58f-8b9c63e0d738
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	190cf722-c73d-456b-a2fd-edc0d9990b9d
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	48d51843-e2bd-4215-af04-e8a675ce257b
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	10411b05-156d-4f33-bca6-c44409bfab10
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	7317c40c-544e-421d-86b8-af3708f0ab58
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	a274968c-23e3-4064-861d-f02544844e40
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	f88ba25e-1ca8-4941-a99c-540fd043b1d9
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	5f9cdcea-b2db-456c-8fd2-f274f8a9fd04
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	b5acf30d-0b32-432e-9ee8-f5aa4dc6f8c6
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	6fbea288-a51d-472b-963f-b47a80c8065b
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	7b6f0c71-0dec-447f-9dda-f58eac3df52a
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	2ecf060a-82f5-4562-a66b-20a772f475c4
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	435f3284-1f16-4cd9-a808-3cb7622dbaa4
96800368-664d-43d2-805f-218c43a3676d	7b6f0c71-0dec-447f-9dda-f58eac3df52a
abcfb951-a987-499c-b941-efe49fee6368	435f3284-1f16-4cd9-a808-3cb7622dbaa4
abcfb951-a987-499c-b941-efe49fee6368	6fbea288-a51d-472b-963f-b47a80c8065b
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	c405e166-9b5e-4f09-9270-8cae4f0ebaf2
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	b88b98c3-ef4c-46eb-a8b5-4db4cb3cb6f0
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	73be014c-c76f-449c-8582-6b3dffbf859c
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	3f0acff4-be6b-45fa-b2ef-6bc49697f107
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	7bfafc07-45f9-45a2-aed5-47d9da66e732
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	40cf574a-d0a2-4be7-bd26-7108daddff30
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	5a224bd5-83f5-4da8-ada5-d527c85c0ca5
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	36088096-2d7a-46b8-bd6e-76b4b226e3b2
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	dba3da43-0bd0-4ce8-8fb0-b277c7b144b2
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	1fcac2e6-2ebd-45a5-8e71-2af9a7476291
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	6816dc38-681c-4d14-9862-666c228375d3
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	ef24c683-b283-464e-b25b-c5205e727bde
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	cadac2bf-60b6-4d1d-b4c1-2046901c337c
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	22f1a42a-51f7-419e-a585-461fbac00cea
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	a8521978-1cb0-41e5-bec4-24be22d6aa71
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	0adfa77f-6f9e-435b-bab9-171b3e91aa4f
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	f1b9b9ba-01c6-413d-ae03-3e0d6f51e8e2
3f0acff4-be6b-45fa-b2ef-6bc49697f107	a8521978-1cb0-41e5-bec4-24be22d6aa71
73be014c-c76f-449c-8582-6b3dffbf859c	22f1a42a-51f7-419e-a585-461fbac00cea
73be014c-c76f-449c-8582-6b3dffbf859c	f1b9b9ba-01c6-413d-ae03-3e0d6f51e8e2
b16cc4b7-76f7-4daa-b36b-faa15745c0e7	6bd231a0-92c3-4594-a621-73169483caf5
3f99c98e-6fc3-48e2-abbe-d408019c215c	29d1eac4-9b0a-406b-80e7-251daa0546ed
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	126fca1a-7c56-4eab-8ec6-6aed27f8cfec
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	9b46d234-73de-430a-8c7e-595accb4524f
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
a2c7fe5d-efc3-4eeb-8287-8788104c93bb	\N	password	fdec5e1a-d182-4e74-80c9-d683902f3567	1617517054543	\N	{"value":"9upyEx3DvbefIbaI+Wja9ZhToqWfTr5aqprx2JMyLWKsb2o2yLllqexAs6tD8XNGaFwWw5q09rvAKbqBVQfzpg==","salt":"hG0eU7ji08Q2KfhMHTNIBA=="}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}	10
cc3c9a2c-b5bc-4d78-aebd-2661dce15893	\N	password	c95c7310-43b5-4ccf-a8ae-f43cf47dede3	1617517225648	\N	{"value":"aHQGrAD527BJoMYt7SI955Q9Z8UFrR/6wPJqFy15Koqu3AjhlQCNZAiDylRELiLDFi16Wqnn1nw3k0L0bjtY2g==","salt":"qqdKuw2ovvzjzYLIUCHVaQ=="}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2021-04-04 06:17:23.781087	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7517043295
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2021-04-04 06:17:23.810265	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7517043295
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2021-04-04 06:17:23.870424	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	7517043295
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2021-04-04 06:17:23.88065	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	7517043295
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2021-04-04 06:17:23.981385	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7517043295
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2021-04-04 06:17:23.987613	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7517043295
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2021-04-04 06:17:24.167681	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7517043295
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2021-04-04 06:17:24.17535	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7517043295
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2021-04-04 06:17:24.19154	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	7517043295
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2021-04-04 06:17:24.317103	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	7517043295
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2021-04-04 06:17:24.41418	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7517043295
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2021-04-04 06:17:24.418275	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7517043295
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2021-04-04 06:17:24.451214	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7517043295
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-04-04 06:17:24.471532	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	7517043295
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-04-04 06:17:24.474787	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7517043295
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-04-04 06:17:24.479987	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	7517043295
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-04-04 06:17:24.483687	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	7517043295
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2021-04-04 06:17:24.529247	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	7517043295
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2021-04-04 06:17:24.570233	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7517043295
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2021-04-04 06:17:24.576763	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7517043295
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-04-04 06:17:25.054763	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7517043295
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2021-04-04 06:17:24.580472	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7517043295
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2021-04-04 06:17:24.58502	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7517043295
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2021-04-04 06:17:24.616211	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	7517043295
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2021-04-04 06:17:24.622439	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7517043295
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2021-04-04 06:17:24.625781	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7517043295
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2021-04-04 06:17:24.654791	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	7517043295
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2021-04-04 06:17:24.722704	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	7517043295
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2021-04-04 06:17:24.728762	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7517043295
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2021-04-04 06:17:24.813424	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	7517043295
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2021-04-04 06:17:24.82674	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	7517043295
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2021-04-04 06:17:24.844267	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	7517043295
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2021-04-04 06:17:24.849919	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	7517043295
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-04-04 06:17:24.856796	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7517043295
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-04-04 06:17:24.859665	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7517043295
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-04-04 06:17:24.890011	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7517043295
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2021-04-04 06:17:24.896844	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	7517043295
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-04-04 06:17:24.90248	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7517043295
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2021-04-04 06:17:24.906594	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	7517043295
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2021-04-04 06:17:24.910483	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	7517043295
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-04-04 06:17:24.912635	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7517043295
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-04-04 06:17:24.914606	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7517043295
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2021-04-04 06:17:24.919426	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	7517043295
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-04-04 06:17:25.045276	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	7517043295
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2021-04-04 06:17:25.05013	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	7517043295
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-04-04 06:17:25.059633	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	7517043295
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-04-04 06:17:25.062654	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7517043295
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-04-04 06:17:25.094462	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	7517043295
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-04-04 06:17:25.100291	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	7517043295
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2021-04-04 06:17:25.139613	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	7517043295
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2021-04-04 06:17:25.170183	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	7517043295
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2021-04-04 06:17:25.173788	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	7517043295
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2021-04-04 06:17:25.177515	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	7517043295
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2021-04-04 06:17:25.180665	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	7517043295
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-04-04 06:17:25.1891	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	7517043295
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-04-04 06:17:25.19386	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	7517043295
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-04-04 06:17:25.215455	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	7517043295
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-04-04 06:17:25.320014	58	EXECUTED	7:6d4893e36de22369cf73bcb051ded875	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	7517043295
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2021-04-04 06:17:25.344613	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	7517043295
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2021-04-04 06:17:25.35089	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7517043295
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2021-04-04 06:17:25.360025	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	7517043295
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2021-04-04 06:17:25.367116	62	EXECUTED	7:9ac9e58545479929ba23f4a3087a0346	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	3.5.4	\N	\N	7517043295
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2021-04-04 06:17:25.370661	63	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7517043295
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2021-04-04 06:17:25.373748	64	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7517043295
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2021-04-04 06:17:25.376715	65	EXECUTED	7:7d3182f65a34fcc61e8d23def037dc3f	update tableName=RESOURCE_SERVER_RESOURCE		\N	3.5.4	\N	\N	7517043295
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2021-04-04 06:17:25.39034	66	EXECUTED	7:b30039e00a0b9715d430d1b0636728fa	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	3.5.4	\N	\N	7517043295
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2021-04-04 06:17:25.395689	67	EXECUTED	7:3797315ca61d531780f8e6f82f258159	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	3.5.4	\N	\N	7517043295
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2021-04-04 06:17:25.399788	68	EXECUTED	7:c7aa4c8d9573500c2d347c1941ff0301	addColumn tableName=REALM		\N	3.5.4	\N	\N	7517043295
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2021-04-04 06:17:25.408902	69	EXECUTED	7:b207faee394fc074a442ecd42185a5dd	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	3.5.4	\N	\N	7517043295
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2021-04-04 06:17:25.414881	70	EXECUTED	7:ab9a9762faaba4ddfa35514b212c4922	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	3.5.4	\N	\N	7517043295
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2021-04-04 06:17:25.420343	71	EXECUTED	7:b9710f74515a6ccb51b72dc0d19df8c4	addColumn tableName=RESOURCE_SERVER		\N	3.5.4	\N	\N	7517043295
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-04-04 06:17:25.427735	72	EXECUTED	7:ec9707ae4d4f0b7452fee20128083879	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7517043295
8.0.0-updating-credential-data-not-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-04-04 06:17:25.438832	73	EXECUTED	7:03b3f4b264c3c68ba082250a80b74216	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7517043295
8.0.0-updating-credential-data-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-04-04 06:17:25.440882	74	MARK_RAN	7:64c5728f5ca1f5aa4392217701c4fe23	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7517043295
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-04-04 06:17:25.457582	75	EXECUTED	7:b48da8c11a3d83ddd6b7d0c8c2219345	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	3.5.4	\N	\N	7517043295
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-04-04 06:17:25.464919	76	EXECUTED	7:a73379915c23bfad3e8f5c6d5c0aa4bd	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	3.5.4	\N	\N	7517043295
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-04-04 06:17:25.469172	77	EXECUTED	7:39e0073779aba192646291aa2332493d	addColumn tableName=CLIENT		\N	3.5.4	\N	\N	7517043295
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-04-04 06:17:25.471441	78	MARK_RAN	7:81f87368f00450799b4bf42ea0b3ec34	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	3.5.4	\N	\N	7517043295
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-04-04 06:17:25.488448	79	EXECUTED	7:20b37422abb9fb6571c618148f013a15	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	3.5.4	\N	\N	7517043295
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-04-04 06:17:25.49098	80	MARK_RAN	7:1970bb6cfb5ee800736b95ad3fb3c78a	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	3.5.4	\N	\N	7517043295
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-04-04 06:17:25.496789	81	EXECUTED	7:45d9b25fc3b455d522d8dcc10a0f4c80	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	3.5.4	\N	\N	7517043295
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-04-04 06:17:25.499158	82	MARK_RAN	7:890ae73712bc187a66c2813a724d037f	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7517043295
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-04-04 06:17:25.505682	83	EXECUTED	7:0a211980d27fafe3ff50d19a3a29b538	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7517043295
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-04-04 06:17:25.508555	84	MARK_RAN	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7517043295
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-04-04 06:17:25.514407	85	EXECUTED	7:01c49302201bdf815b0a18d1f98a55dc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	7517043295
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2021-04-04 06:17:25.521724	86	EXECUTED	7:3dace6b144c11f53f1ad2c0361279b86	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	3.5.4	\N	\N	7517043295
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
master	c9e63e96-14f4-4675-a7d9-80dfb05a3492	f
master	bd4be3ad-9b30-47b3-8f7e-b65ecaad5dfa	t
master	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec	t
master	1f37b120-c21c-4160-8cfe-7ac507587643	t
master	dedbf05c-b63f-4295-a44c-6e0ce8db4754	f
master	6026aa0f-85af-42ac-8999-c1bc31c40143	f
master	407695e1-0a22-4fe0-b82f-cfcf386fa389	t
master	879a9dc3-6980-4791-a661-75afe0a2dd9c	t
master	56c011cb-5911-43e1-8255-15536fef8cfe	f
airflow	e9fd6430-9813-473f-9806-16dcfbe1f96d	f
airflow	39160860-119d-4dc8-8614-6330b917d4c2	t
airflow	81935a69-a9d4-43bb-a8ee-4912739cf0a0	t
airflow	f19faad6-28ec-4491-b081-514fb8a4f3ee	t
airflow	cad7b8de-1824-4db4-9fb6-e658e81f77ff	f
airflow	def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a	f
airflow	a1ced3ca-0612-4212-ac02-5a099a251f54	t
airflow	c5543ae3-f54a-48b5-8b0e-fe7c7dd0c705	t
airflow	8111419a-2426-42e0-91da-87c5b744724e	f
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
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	master	f	${role_admin}	admin	master	\N	master
b41deb32-91f7-47ae-9608-7eda1f93c57e	master	f	${role_create-realm}	create-realm	master	\N	master
03e2c8e7-8e81-43cd-bc70-7aa42845a0ce	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_create-client}	create-client	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
9274012e-549b-4f9d-8f0a-2d5907e93c4d	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_view-realm}	view-realm	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
a13fb703-8cc8-483c-aee9-9a7880bea7cb	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_view-users}	view-users	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
ba1e6288-4484-4e93-9151-e6af0f08f451	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_view-clients}	view-clients	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
8dcf7ffe-f312-47f6-ad1f-e1a6ee425b89	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_view-events}	view-events	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
410303dd-e599-4346-ac0c-6cc4753875b6	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_view-identity-providers}	view-identity-providers	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
055bebf9-795e-452a-ad75-6ad1bd3d143b	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_view-authorization}	view-authorization	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
d059deed-27b7-4ae7-a5e8-9de2afe51526	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_manage-realm}	manage-realm	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
9348efe4-d0fe-4304-b1f2-3de4b48e08bc	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_manage-users}	manage-users	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
421a8600-e64a-44ce-8590-412a8aec34e1	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_manage-clients}	manage-clients	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
cd900d0a-654d-4485-a797-4163f938278d	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_manage-events}	manage-events	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
f88445b4-9a9b-4f44-bdc0-cfbb53acd2d8	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_manage-identity-providers}	manage-identity-providers	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
0fe67920-11cf-4920-936e-c880a5292315	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_manage-authorization}	manage-authorization	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
a034afca-46a5-4c98-981b-99a836da9f49	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_query-users}	query-users	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
86963755-8acd-4d83-ad41-a37141b8c470	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_query-clients}	query-clients	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
b1f40d00-f2d9-4cb9-996e-10cefc54c925	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_query-realms}	query-realms	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
7fa5e366-08ff-43d7-ad98-34bf2c4f44e6	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_query-groups}	query-groups	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
e7633604-6f82-42d0-9a3a-d894c9b49fa6	230a2f6f-fb96-430f-84be-72a5ed31ceb1	t	${role_view-profile}	view-profile	master	230a2f6f-fb96-430f-84be-72a5ed31ceb1	\N
4c05d63c-8c23-4a4e-9168-6b6f92f23b12	230a2f6f-fb96-430f-84be-72a5ed31ceb1	t	${role_manage-account}	manage-account	master	230a2f6f-fb96-430f-84be-72a5ed31ceb1	\N
cc23f936-7731-47bb-8283-7cb981451922	230a2f6f-fb96-430f-84be-72a5ed31ceb1	t	${role_manage-account-links}	manage-account-links	master	230a2f6f-fb96-430f-84be-72a5ed31ceb1	\N
33d656d4-fe22-4cbc-a040-3ea3c0e9e0a2	230a2f6f-fb96-430f-84be-72a5ed31ceb1	t	${role_view-applications}	view-applications	master	230a2f6f-fb96-430f-84be-72a5ed31ceb1	\N
83b44329-ab1d-416d-824a-3c1766383ade	230a2f6f-fb96-430f-84be-72a5ed31ceb1	t	${role_view-consent}	view-consent	master	230a2f6f-fb96-430f-84be-72a5ed31ceb1	\N
0185c062-3db1-4528-8238-13c727f9369f	230a2f6f-fb96-430f-84be-72a5ed31ceb1	t	${role_manage-consent}	manage-consent	master	230a2f6f-fb96-430f-84be-72a5ed31ceb1	\N
cfbc588f-78aa-43f0-9450-75f318dbb6b3	4a359931-e240-47e8-83fe-f4516af25424	t	${role_read-token}	read-token	master	4a359931-e240-47e8-83fe-f4516af25424	\N
cb19de04-33fd-4e4f-8400-880008999d14	b25b35be-d710-4716-ac2e-8168b63e1719	t	${role_impersonation}	impersonation	master	b25b35be-d710-4716-ac2e-8168b63e1719	\N
1c19d1f4-9d5a-4b89-aa4c-77d634e5fd20	master	f	${role_offline-access}	offline_access	master	\N	master
5a45aad5-6a98-40b8-8a04-155c4ccca3f1	master	f	${role_uma_authorization}	uma_authorization	master	\N	master
37ba7f7c-77a5-431c-b83e-94c85e5e8d86	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_create-client}	create-client	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
af9a5130-e7a7-4ed8-b4f1-09e87f17fa7d	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_view-realm}	view-realm	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
abcfb951-a987-499c-b941-efe49fee6368	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_view-users}	view-users	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
96800368-664d-43d2-805f-218c43a3676d	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_view-clients}	view-clients	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
cff41bb0-c720-478d-a58f-8b9c63e0d738	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_view-events}	view-events	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
190cf722-c73d-456b-a2fd-edc0d9990b9d	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_view-identity-providers}	view-identity-providers	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
48d51843-e2bd-4215-af04-e8a675ce257b	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_view-authorization}	view-authorization	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
10411b05-156d-4f33-bca6-c44409bfab10	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_manage-realm}	manage-realm	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
7317c40c-544e-421d-86b8-af3708f0ab58	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_manage-users}	manage-users	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
a274968c-23e3-4064-861d-f02544844e40	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_manage-clients}	manage-clients	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
f88ba25e-1ca8-4941-a99c-540fd043b1d9	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_manage-events}	manage-events	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
5f9cdcea-b2db-456c-8fd2-f274f8a9fd04	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_manage-identity-providers}	manage-identity-providers	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
b5acf30d-0b32-432e-9ee8-f5aa4dc6f8c6	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_manage-authorization}	manage-authorization	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
6fbea288-a51d-472b-963f-b47a80c8065b	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_query-users}	query-users	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
7b6f0c71-0dec-447f-9dda-f58eac3df52a	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_query-clients}	query-clients	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
2ecf060a-82f5-4562-a66b-20a772f475c4	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_query-realms}	query-realms	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
435f3284-1f16-4cd9-a808-3cb7622dbaa4	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_query-groups}	query-groups	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
89f5c95b-84a5-4de7-9be2-b4cb18762eb3	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_realm-admin}	realm-admin	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
c405e166-9b5e-4f09-9270-8cae4f0ebaf2	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_create-client}	create-client	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
b88b98c3-ef4c-46eb-a8b5-4db4cb3cb6f0	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_view-realm}	view-realm	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
73be014c-c76f-449c-8582-6b3dffbf859c	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_view-users}	view-users	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
3f0acff4-be6b-45fa-b2ef-6bc49697f107	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_view-clients}	view-clients	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
7bfafc07-45f9-45a2-aed5-47d9da66e732	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_view-events}	view-events	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
40cf574a-d0a2-4be7-bd26-7108daddff30	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_view-identity-providers}	view-identity-providers	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
5a224bd5-83f5-4da8-ada5-d527c85c0ca5	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_view-authorization}	view-authorization	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
36088096-2d7a-46b8-bd6e-76b4b226e3b2	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_manage-realm}	manage-realm	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
dba3da43-0bd0-4ce8-8fb0-b277c7b144b2	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_manage-users}	manage-users	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
1fcac2e6-2ebd-45a5-8e71-2af9a7476291	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_manage-clients}	manage-clients	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
6816dc38-681c-4d14-9862-666c228375d3	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_manage-events}	manage-events	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
ef24c683-b283-464e-b25b-c5205e727bde	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_manage-identity-providers}	manage-identity-providers	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
cadac2bf-60b6-4d1d-b4c1-2046901c337c	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_manage-authorization}	manage-authorization	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
22f1a42a-51f7-419e-a585-461fbac00cea	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_query-users}	query-users	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
a8521978-1cb0-41e5-bec4-24be22d6aa71	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_query-clients}	query-clients	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
0adfa77f-6f9e-435b-bab9-171b3e91aa4f	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_query-realms}	query-realms	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
f1b9b9ba-01c6-413d-ae03-3e0d6f51e8e2	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_query-groups}	query-groups	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
8fbce5e2-3ff9-48ae-903e-57f277f644b1	a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	t	${role_view-profile}	view-profile	airflow	a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	\N
b16cc4b7-76f7-4daa-b36b-faa15745c0e7	a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	t	${role_manage-account}	manage-account	airflow	a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	\N
6bd231a0-92c3-4594-a621-73169483caf5	a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	t	${role_manage-account-links}	manage-account-links	airflow	a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	\N
081333c0-bed4-453a-a932-8594b49cc025	a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	t	${role_view-applications}	view-applications	airflow	a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	\N
29d1eac4-9b0a-406b-80e7-251daa0546ed	a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	t	${role_view-consent}	view-consent	airflow	a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	\N
3f99c98e-6fc3-48e2-abbe-d408019c215c	a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	t	${role_manage-consent}	manage-consent	airflow	a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	\N
126fca1a-7c56-4eab-8ec6-6aed27f8cfec	39810aa9-f3da-4610-a584-ed3dbef5a88b	t	${role_impersonation}	impersonation	master	39810aa9-f3da-4610-a584-ed3dbef5a88b	\N
9b46d234-73de-430a-8c7e-595accb4524f	b773a45a-4b13-42d2-aebd-808e57a20824	t	${role_impersonation}	impersonation	airflow	b773a45a-4b13-42d2-aebd-808e57a20824	\N
c3f03869-aa95-4afa-9818-80112b05001a	c6d93da9-598a-4523-a09a-c7151dc8b05e	t	${role_read-token}	read-token	airflow	c6d93da9-598a-4523-a09a-c7151dc8b05e	\N
6cf01a12-5bc4-4dda-af32-c924f9b48bb8	airflow	f	${role_offline-access}	offline_access	airflow	\N	airflow
7c5a7dec-b59f-443c-8fcd-fc312093e3df	airflow	f	\N	uma_authorization	airflow	\N	airflow
91a18e16-af8e-446d-8393-50a3e1e41116	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	t	\N	uma_protection	airflow	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
8921845d-3df7-4f55-ba50-dc35cad1f16f	airflow	f	Admin	Admin	airflow	\N	airflow
d71757fc-79bf-43e1-ac83-b8723abd0a1b	airflow	f	User	User	airflow	\N	airflow
ff3021e8-3627-46f6-a2c6-2d687306c220	airflow	f	Viewer	Viewer	airflow	\N	airflow
8f852dd5-b8fc-488d-abb3-ef9008b41b3d	airflow	f	Public	Public	airflow	\N	airflow
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migration_model (id, version, update_time) FROM stdin;
qkpbo	11.0.3	1617517051
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
8e0c033c-fdb8-4e1b-930e-afec4ed76ac8	code	// by default, grants any permission associated with this policy\n$evaluation.grant();\n
075ed938-5c41-4430-9da9-989cd282518d	defaultResourceType	urn:airflow-client:resources:default
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
77c478ac-82ac-46cf-97bd-c9e0bc6b0771	audience resolve	openid-connect	oidc-audience-resolve-mapper	b221355c-eb0e-40ef-b615-978acee2d959	\N
92fa0bda-3374-449a-921f-169c037e3967	locale	openid-connect	oidc-usermodel-attribute-mapper	72d8f832-5e35-4759-9527-c3bc4c816ecb	\N
9c6ec5aa-92b5-4fb1-ac11-75fa1a6175ad	role list	saml	saml-role-list-mapper	\N	bd4be3ad-9b30-47b3-8f7e-b65ecaad5dfa
94812ab1-1574-47ff-bd40-61b573cc82d5	full name	openid-connect	oidc-full-name-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
8847664c-4fbf-4245-a237-028c321f3ab9	family name	openid-connect	oidc-usermodel-property-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
2d4a4a1a-7d2c-4ae5-be1c-19bd60a5fbdb	given name	openid-connect	oidc-usermodel-property-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
741e5133-744f-4a4b-91d9-421b0ff7393f	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
dbd8717b-2a89-49a2-8e0f-2d868da704a0	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
da3cc807-8544-4748-bd90-1012cc8ba392	username	openid-connect	oidc-usermodel-property-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
c24d5fcb-bb93-4fbc-97e7-756d1a3e354c	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
96f2b12e-2f14-4f19-a7b8-3b476647377a	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
19e7d164-41c4-48c8-8028-7e7153641ed3	website	openid-connect	oidc-usermodel-attribute-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
42b1c2b2-0584-4567-b798-3176d7357725	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
75f5333c-0e4a-4ccc-b25f-a4bedd7913a3	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
6083f619-576f-487f-b058-087a6603bb1c	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
e1299ed1-47f4-43a9-ab47-8c689f78032e	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
07cb485b-7701-403e-97d9-0fb860c5688e	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	ccb0e5ee-10bf-43e9-8a85-9ac9ff1c85ec
9bb50cea-9bfe-4549-97d7-686b27f2ad0c	email	openid-connect	oidc-usermodel-property-mapper	\N	1f37b120-c21c-4160-8cfe-7ac507587643
7fca8ad3-e6fe-4c1e-8ba0-4843d1735c87	email verified	openid-connect	oidc-usermodel-property-mapper	\N	1f37b120-c21c-4160-8cfe-7ac507587643
e7ad63be-d457-4d66-a838-f84adc6ae896	address	openid-connect	oidc-address-mapper	\N	dedbf05c-b63f-4295-a44c-6e0ce8db4754
df2f5d1c-7f0f-427d-9ebc-68619fd7f250	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	6026aa0f-85af-42ac-8999-c1bc31c40143
a37328c3-1b2f-42c8-950c-b69ffe6a75f8	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	6026aa0f-85af-42ac-8999-c1bc31c40143
5f1475a0-9ca6-4219-a85c-7f2dfd17b0c4	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	407695e1-0a22-4fe0-b82f-cfcf386fa389
5d58c051-4945-4c7e-995a-29a574c4470a	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	407695e1-0a22-4fe0-b82f-cfcf386fa389
c666f0ba-ae71-499a-bd3e-6a0c5dc88b3d	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	407695e1-0a22-4fe0-b82f-cfcf386fa389
1ebebfd5-9bbf-4f21-98e5-52788a761a72	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	879a9dc3-6980-4791-a661-75afe0a2dd9c
e7fccf65-6e97-4611-842c-d21173a8a606	upn	openid-connect	oidc-usermodel-property-mapper	\N	56c011cb-5911-43e1-8255-15536fef8cfe
e257fe8d-9ea7-4fb2-9768-07df62c2514e	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	56c011cb-5911-43e1-8255-15536fef8cfe
8439437e-07ea-42e8-85ab-df8f9d2109a6	audience resolve	openid-connect	oidc-audience-resolve-mapper	3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	\N
380d7de3-4d5e-476c-8289-3458f2ee95e4	role list	saml	saml-role-list-mapper	\N	39160860-119d-4dc8-8614-6330b917d4c2
4ed95b5f-24ae-4d81-9fdc-aa8481ca86e1	full name	openid-connect	oidc-full-name-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
0f65b233-f78b-453f-96d0-b8043f5effbb	family name	openid-connect	oidc-usermodel-property-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
829d41c7-83c6-49e5-9861-8b1ce86835be	given name	openid-connect	oidc-usermodel-property-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
c576c185-0b0c-4997-8a69-84417998c656	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
15759f39-4c24-4322-92b8-56abb0ae23b3	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
118632eb-3d14-4987-9144-364aeb0453bb	username	openid-connect	oidc-usermodel-property-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
d8d19dce-efe0-4808-b05a-de2e89e8125f	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
34a00ed9-43aa-4efa-87d5-fe07aa77c838	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
aff45419-5a5a-4cb4-8480-8063cf1922be	website	openid-connect	oidc-usermodel-attribute-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
1105e7d8-8851-40bc-8d1a-7622ae144765	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
f89611ce-6a56-4681-9844-4e60d82935e0	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
3d244a74-4e07-4488-9cc8-90ad9ed36c8f	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
285b5839-2193-40e9-823d-bf20d532572e	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
bfb7bdca-7cd0-45c1-b201-5b54abc39cd0	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	81935a69-a9d4-43bb-a8ee-4912739cf0a0
3795ca42-752f-4c54-9c3f-6f177796b768	email	openid-connect	oidc-usermodel-property-mapper	\N	f19faad6-28ec-4491-b081-514fb8a4f3ee
cdb53629-e628-43f0-a9ff-43f0a05eca8e	email verified	openid-connect	oidc-usermodel-property-mapper	\N	f19faad6-28ec-4491-b081-514fb8a4f3ee
19354c11-e789-4a1a-865b-6f8f4afbef5f	address	openid-connect	oidc-address-mapper	\N	cad7b8de-1824-4db4-9fb6-e658e81f77ff
1432cc8f-343f-4198-af7a-e364e7b25850	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a
5c49d596-caba-40ff-b017-bf58f9e2710a	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	def5b7b9-06e8-4fa3-a3d5-5d1a516b4b7a
ff72aac1-2f74-4f9a-b53a-3b8201ee696e	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	a1ced3ca-0612-4212-ac02-5a099a251f54
843d56a1-c5ee-4e39-9148-c74588b8e5b0	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	a1ced3ca-0612-4212-ac02-5a099a251f54
939bd947-4a9e-4f93-9647-f0c86e3c56b6	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	a1ced3ca-0612-4212-ac02-5a099a251f54
0c1d0d3b-02ee-43d1-9baf-492028b52a48	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	c5543ae3-f54a-48b5-8b0e-fe7c7dd0c705
bd23cbba-87fe-4d1a-8599-a6bfc86273d9	upn	openid-connect	oidc-usermodel-property-mapper	\N	8111419a-2426-42e0-91da-87c5b744724e
d197c035-2336-482c-ac1f-589857dbe5fc	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	8111419a-2426-42e0-91da-87c5b744724e
79c487e7-6280-4bd2-81fd-286675f7aa9d	locale	openid-connect	oidc-usermodel-attribute-mapper	1337333b-a8da-4cfa-8e26-4a0de11f8591	\N
0b998258-a682-4ccf-9486-24e553344b92	realm-roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	025074e3-3874-4263-b026-489587d3417f
f5594f19-9730-4389-8e71-d5ec38737664	realm-roles	openid-connect	oidc-usermodel-realm-role-mapper	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
c788ef39-a5c6-4ff8-bb78-ce1e83ff62cb	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
4ae49bd8-1539-4ff8-9c97-0d32e070fd57	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
2521e014-1bfc-439d-9a41-c58650205ed7	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
92fa0bda-3374-449a-921f-169c037e3967	true	userinfo.token.claim
92fa0bda-3374-449a-921f-169c037e3967	locale	user.attribute
92fa0bda-3374-449a-921f-169c037e3967	true	id.token.claim
92fa0bda-3374-449a-921f-169c037e3967	true	access.token.claim
92fa0bda-3374-449a-921f-169c037e3967	locale	claim.name
92fa0bda-3374-449a-921f-169c037e3967	String	jsonType.label
9c6ec5aa-92b5-4fb1-ac11-75fa1a6175ad	false	single
9c6ec5aa-92b5-4fb1-ac11-75fa1a6175ad	Basic	attribute.nameformat
9c6ec5aa-92b5-4fb1-ac11-75fa1a6175ad	Role	attribute.name
94812ab1-1574-47ff-bd40-61b573cc82d5	true	userinfo.token.claim
94812ab1-1574-47ff-bd40-61b573cc82d5	true	id.token.claim
94812ab1-1574-47ff-bd40-61b573cc82d5	true	access.token.claim
8847664c-4fbf-4245-a237-028c321f3ab9	true	userinfo.token.claim
8847664c-4fbf-4245-a237-028c321f3ab9	lastName	user.attribute
8847664c-4fbf-4245-a237-028c321f3ab9	true	id.token.claim
8847664c-4fbf-4245-a237-028c321f3ab9	true	access.token.claim
8847664c-4fbf-4245-a237-028c321f3ab9	family_name	claim.name
8847664c-4fbf-4245-a237-028c321f3ab9	String	jsonType.label
2d4a4a1a-7d2c-4ae5-be1c-19bd60a5fbdb	true	userinfo.token.claim
2d4a4a1a-7d2c-4ae5-be1c-19bd60a5fbdb	firstName	user.attribute
2d4a4a1a-7d2c-4ae5-be1c-19bd60a5fbdb	true	id.token.claim
2d4a4a1a-7d2c-4ae5-be1c-19bd60a5fbdb	true	access.token.claim
2d4a4a1a-7d2c-4ae5-be1c-19bd60a5fbdb	given_name	claim.name
2d4a4a1a-7d2c-4ae5-be1c-19bd60a5fbdb	String	jsonType.label
741e5133-744f-4a4b-91d9-421b0ff7393f	true	userinfo.token.claim
741e5133-744f-4a4b-91d9-421b0ff7393f	middleName	user.attribute
741e5133-744f-4a4b-91d9-421b0ff7393f	true	id.token.claim
741e5133-744f-4a4b-91d9-421b0ff7393f	true	access.token.claim
741e5133-744f-4a4b-91d9-421b0ff7393f	middle_name	claim.name
741e5133-744f-4a4b-91d9-421b0ff7393f	String	jsonType.label
dbd8717b-2a89-49a2-8e0f-2d868da704a0	true	userinfo.token.claim
dbd8717b-2a89-49a2-8e0f-2d868da704a0	nickname	user.attribute
dbd8717b-2a89-49a2-8e0f-2d868da704a0	true	id.token.claim
dbd8717b-2a89-49a2-8e0f-2d868da704a0	true	access.token.claim
dbd8717b-2a89-49a2-8e0f-2d868da704a0	nickname	claim.name
dbd8717b-2a89-49a2-8e0f-2d868da704a0	String	jsonType.label
da3cc807-8544-4748-bd90-1012cc8ba392	true	userinfo.token.claim
da3cc807-8544-4748-bd90-1012cc8ba392	username	user.attribute
da3cc807-8544-4748-bd90-1012cc8ba392	true	id.token.claim
da3cc807-8544-4748-bd90-1012cc8ba392	true	access.token.claim
da3cc807-8544-4748-bd90-1012cc8ba392	preferred_username	claim.name
da3cc807-8544-4748-bd90-1012cc8ba392	String	jsonType.label
c24d5fcb-bb93-4fbc-97e7-756d1a3e354c	true	userinfo.token.claim
c24d5fcb-bb93-4fbc-97e7-756d1a3e354c	profile	user.attribute
c24d5fcb-bb93-4fbc-97e7-756d1a3e354c	true	id.token.claim
c24d5fcb-bb93-4fbc-97e7-756d1a3e354c	true	access.token.claim
c24d5fcb-bb93-4fbc-97e7-756d1a3e354c	profile	claim.name
c24d5fcb-bb93-4fbc-97e7-756d1a3e354c	String	jsonType.label
96f2b12e-2f14-4f19-a7b8-3b476647377a	true	userinfo.token.claim
96f2b12e-2f14-4f19-a7b8-3b476647377a	picture	user.attribute
96f2b12e-2f14-4f19-a7b8-3b476647377a	true	id.token.claim
96f2b12e-2f14-4f19-a7b8-3b476647377a	true	access.token.claim
96f2b12e-2f14-4f19-a7b8-3b476647377a	picture	claim.name
96f2b12e-2f14-4f19-a7b8-3b476647377a	String	jsonType.label
19e7d164-41c4-48c8-8028-7e7153641ed3	true	userinfo.token.claim
19e7d164-41c4-48c8-8028-7e7153641ed3	website	user.attribute
19e7d164-41c4-48c8-8028-7e7153641ed3	true	id.token.claim
19e7d164-41c4-48c8-8028-7e7153641ed3	true	access.token.claim
19e7d164-41c4-48c8-8028-7e7153641ed3	website	claim.name
19e7d164-41c4-48c8-8028-7e7153641ed3	String	jsonType.label
42b1c2b2-0584-4567-b798-3176d7357725	true	userinfo.token.claim
42b1c2b2-0584-4567-b798-3176d7357725	gender	user.attribute
42b1c2b2-0584-4567-b798-3176d7357725	true	id.token.claim
42b1c2b2-0584-4567-b798-3176d7357725	true	access.token.claim
42b1c2b2-0584-4567-b798-3176d7357725	gender	claim.name
42b1c2b2-0584-4567-b798-3176d7357725	String	jsonType.label
75f5333c-0e4a-4ccc-b25f-a4bedd7913a3	true	userinfo.token.claim
75f5333c-0e4a-4ccc-b25f-a4bedd7913a3	birthdate	user.attribute
75f5333c-0e4a-4ccc-b25f-a4bedd7913a3	true	id.token.claim
75f5333c-0e4a-4ccc-b25f-a4bedd7913a3	true	access.token.claim
75f5333c-0e4a-4ccc-b25f-a4bedd7913a3	birthdate	claim.name
75f5333c-0e4a-4ccc-b25f-a4bedd7913a3	String	jsonType.label
6083f619-576f-487f-b058-087a6603bb1c	true	userinfo.token.claim
6083f619-576f-487f-b058-087a6603bb1c	zoneinfo	user.attribute
6083f619-576f-487f-b058-087a6603bb1c	true	id.token.claim
6083f619-576f-487f-b058-087a6603bb1c	true	access.token.claim
6083f619-576f-487f-b058-087a6603bb1c	zoneinfo	claim.name
6083f619-576f-487f-b058-087a6603bb1c	String	jsonType.label
e1299ed1-47f4-43a9-ab47-8c689f78032e	true	userinfo.token.claim
e1299ed1-47f4-43a9-ab47-8c689f78032e	locale	user.attribute
e1299ed1-47f4-43a9-ab47-8c689f78032e	true	id.token.claim
e1299ed1-47f4-43a9-ab47-8c689f78032e	true	access.token.claim
e1299ed1-47f4-43a9-ab47-8c689f78032e	locale	claim.name
e1299ed1-47f4-43a9-ab47-8c689f78032e	String	jsonType.label
07cb485b-7701-403e-97d9-0fb860c5688e	true	userinfo.token.claim
07cb485b-7701-403e-97d9-0fb860c5688e	updatedAt	user.attribute
07cb485b-7701-403e-97d9-0fb860c5688e	true	id.token.claim
07cb485b-7701-403e-97d9-0fb860c5688e	true	access.token.claim
07cb485b-7701-403e-97d9-0fb860c5688e	updated_at	claim.name
07cb485b-7701-403e-97d9-0fb860c5688e	String	jsonType.label
9bb50cea-9bfe-4549-97d7-686b27f2ad0c	true	userinfo.token.claim
9bb50cea-9bfe-4549-97d7-686b27f2ad0c	email	user.attribute
9bb50cea-9bfe-4549-97d7-686b27f2ad0c	true	id.token.claim
9bb50cea-9bfe-4549-97d7-686b27f2ad0c	true	access.token.claim
9bb50cea-9bfe-4549-97d7-686b27f2ad0c	email	claim.name
9bb50cea-9bfe-4549-97d7-686b27f2ad0c	String	jsonType.label
7fca8ad3-e6fe-4c1e-8ba0-4843d1735c87	true	userinfo.token.claim
7fca8ad3-e6fe-4c1e-8ba0-4843d1735c87	emailVerified	user.attribute
7fca8ad3-e6fe-4c1e-8ba0-4843d1735c87	true	id.token.claim
7fca8ad3-e6fe-4c1e-8ba0-4843d1735c87	true	access.token.claim
7fca8ad3-e6fe-4c1e-8ba0-4843d1735c87	email_verified	claim.name
7fca8ad3-e6fe-4c1e-8ba0-4843d1735c87	boolean	jsonType.label
e7ad63be-d457-4d66-a838-f84adc6ae896	formatted	user.attribute.formatted
e7ad63be-d457-4d66-a838-f84adc6ae896	country	user.attribute.country
e7ad63be-d457-4d66-a838-f84adc6ae896	postal_code	user.attribute.postal_code
e7ad63be-d457-4d66-a838-f84adc6ae896	true	userinfo.token.claim
e7ad63be-d457-4d66-a838-f84adc6ae896	street	user.attribute.street
e7ad63be-d457-4d66-a838-f84adc6ae896	true	id.token.claim
e7ad63be-d457-4d66-a838-f84adc6ae896	region	user.attribute.region
e7ad63be-d457-4d66-a838-f84adc6ae896	true	access.token.claim
e7ad63be-d457-4d66-a838-f84adc6ae896	locality	user.attribute.locality
df2f5d1c-7f0f-427d-9ebc-68619fd7f250	true	userinfo.token.claim
df2f5d1c-7f0f-427d-9ebc-68619fd7f250	phoneNumber	user.attribute
df2f5d1c-7f0f-427d-9ebc-68619fd7f250	true	id.token.claim
df2f5d1c-7f0f-427d-9ebc-68619fd7f250	true	access.token.claim
df2f5d1c-7f0f-427d-9ebc-68619fd7f250	phone_number	claim.name
df2f5d1c-7f0f-427d-9ebc-68619fd7f250	String	jsonType.label
a37328c3-1b2f-42c8-950c-b69ffe6a75f8	true	userinfo.token.claim
a37328c3-1b2f-42c8-950c-b69ffe6a75f8	phoneNumberVerified	user.attribute
a37328c3-1b2f-42c8-950c-b69ffe6a75f8	true	id.token.claim
a37328c3-1b2f-42c8-950c-b69ffe6a75f8	true	access.token.claim
a37328c3-1b2f-42c8-950c-b69ffe6a75f8	phone_number_verified	claim.name
a37328c3-1b2f-42c8-950c-b69ffe6a75f8	boolean	jsonType.label
5f1475a0-9ca6-4219-a85c-7f2dfd17b0c4	true	multivalued
5f1475a0-9ca6-4219-a85c-7f2dfd17b0c4	foo	user.attribute
5f1475a0-9ca6-4219-a85c-7f2dfd17b0c4	true	access.token.claim
5f1475a0-9ca6-4219-a85c-7f2dfd17b0c4	realm_access.roles	claim.name
5f1475a0-9ca6-4219-a85c-7f2dfd17b0c4	String	jsonType.label
5d58c051-4945-4c7e-995a-29a574c4470a	true	multivalued
5d58c051-4945-4c7e-995a-29a574c4470a	foo	user.attribute
5d58c051-4945-4c7e-995a-29a574c4470a	true	access.token.claim
5d58c051-4945-4c7e-995a-29a574c4470a	resource_access.${client_id}.roles	claim.name
5d58c051-4945-4c7e-995a-29a574c4470a	String	jsonType.label
e7fccf65-6e97-4611-842c-d21173a8a606	true	userinfo.token.claim
e7fccf65-6e97-4611-842c-d21173a8a606	username	user.attribute
e7fccf65-6e97-4611-842c-d21173a8a606	true	id.token.claim
e7fccf65-6e97-4611-842c-d21173a8a606	true	access.token.claim
e7fccf65-6e97-4611-842c-d21173a8a606	upn	claim.name
e7fccf65-6e97-4611-842c-d21173a8a606	String	jsonType.label
e257fe8d-9ea7-4fb2-9768-07df62c2514e	true	multivalued
e257fe8d-9ea7-4fb2-9768-07df62c2514e	foo	user.attribute
e257fe8d-9ea7-4fb2-9768-07df62c2514e	true	id.token.claim
e257fe8d-9ea7-4fb2-9768-07df62c2514e	true	access.token.claim
e257fe8d-9ea7-4fb2-9768-07df62c2514e	groups	claim.name
e257fe8d-9ea7-4fb2-9768-07df62c2514e	String	jsonType.label
380d7de3-4d5e-476c-8289-3458f2ee95e4	false	single
380d7de3-4d5e-476c-8289-3458f2ee95e4	Basic	attribute.nameformat
380d7de3-4d5e-476c-8289-3458f2ee95e4	Role	attribute.name
4ed95b5f-24ae-4d81-9fdc-aa8481ca86e1	true	userinfo.token.claim
4ed95b5f-24ae-4d81-9fdc-aa8481ca86e1	true	id.token.claim
4ed95b5f-24ae-4d81-9fdc-aa8481ca86e1	true	access.token.claim
0f65b233-f78b-453f-96d0-b8043f5effbb	true	userinfo.token.claim
0f65b233-f78b-453f-96d0-b8043f5effbb	lastName	user.attribute
0f65b233-f78b-453f-96d0-b8043f5effbb	true	id.token.claim
0f65b233-f78b-453f-96d0-b8043f5effbb	true	access.token.claim
0f65b233-f78b-453f-96d0-b8043f5effbb	family_name	claim.name
0f65b233-f78b-453f-96d0-b8043f5effbb	String	jsonType.label
829d41c7-83c6-49e5-9861-8b1ce86835be	true	userinfo.token.claim
829d41c7-83c6-49e5-9861-8b1ce86835be	firstName	user.attribute
829d41c7-83c6-49e5-9861-8b1ce86835be	true	id.token.claim
829d41c7-83c6-49e5-9861-8b1ce86835be	true	access.token.claim
829d41c7-83c6-49e5-9861-8b1ce86835be	given_name	claim.name
829d41c7-83c6-49e5-9861-8b1ce86835be	String	jsonType.label
c576c185-0b0c-4997-8a69-84417998c656	true	userinfo.token.claim
c576c185-0b0c-4997-8a69-84417998c656	middleName	user.attribute
c576c185-0b0c-4997-8a69-84417998c656	true	id.token.claim
c576c185-0b0c-4997-8a69-84417998c656	true	access.token.claim
c576c185-0b0c-4997-8a69-84417998c656	middle_name	claim.name
c576c185-0b0c-4997-8a69-84417998c656	String	jsonType.label
15759f39-4c24-4322-92b8-56abb0ae23b3	true	userinfo.token.claim
15759f39-4c24-4322-92b8-56abb0ae23b3	nickname	user.attribute
15759f39-4c24-4322-92b8-56abb0ae23b3	true	id.token.claim
15759f39-4c24-4322-92b8-56abb0ae23b3	true	access.token.claim
15759f39-4c24-4322-92b8-56abb0ae23b3	nickname	claim.name
15759f39-4c24-4322-92b8-56abb0ae23b3	String	jsonType.label
118632eb-3d14-4987-9144-364aeb0453bb	true	userinfo.token.claim
118632eb-3d14-4987-9144-364aeb0453bb	username	user.attribute
118632eb-3d14-4987-9144-364aeb0453bb	true	id.token.claim
118632eb-3d14-4987-9144-364aeb0453bb	true	access.token.claim
118632eb-3d14-4987-9144-364aeb0453bb	preferred_username	claim.name
118632eb-3d14-4987-9144-364aeb0453bb	String	jsonType.label
d8d19dce-efe0-4808-b05a-de2e89e8125f	true	userinfo.token.claim
d8d19dce-efe0-4808-b05a-de2e89e8125f	profile	user.attribute
d8d19dce-efe0-4808-b05a-de2e89e8125f	true	id.token.claim
d8d19dce-efe0-4808-b05a-de2e89e8125f	true	access.token.claim
d8d19dce-efe0-4808-b05a-de2e89e8125f	profile	claim.name
d8d19dce-efe0-4808-b05a-de2e89e8125f	String	jsonType.label
34a00ed9-43aa-4efa-87d5-fe07aa77c838	true	userinfo.token.claim
34a00ed9-43aa-4efa-87d5-fe07aa77c838	picture	user.attribute
34a00ed9-43aa-4efa-87d5-fe07aa77c838	true	id.token.claim
34a00ed9-43aa-4efa-87d5-fe07aa77c838	true	access.token.claim
34a00ed9-43aa-4efa-87d5-fe07aa77c838	picture	claim.name
34a00ed9-43aa-4efa-87d5-fe07aa77c838	String	jsonType.label
aff45419-5a5a-4cb4-8480-8063cf1922be	true	userinfo.token.claim
aff45419-5a5a-4cb4-8480-8063cf1922be	website	user.attribute
aff45419-5a5a-4cb4-8480-8063cf1922be	true	id.token.claim
aff45419-5a5a-4cb4-8480-8063cf1922be	true	access.token.claim
aff45419-5a5a-4cb4-8480-8063cf1922be	website	claim.name
aff45419-5a5a-4cb4-8480-8063cf1922be	String	jsonType.label
1105e7d8-8851-40bc-8d1a-7622ae144765	true	userinfo.token.claim
1105e7d8-8851-40bc-8d1a-7622ae144765	gender	user.attribute
1105e7d8-8851-40bc-8d1a-7622ae144765	true	id.token.claim
1105e7d8-8851-40bc-8d1a-7622ae144765	true	access.token.claim
1105e7d8-8851-40bc-8d1a-7622ae144765	gender	claim.name
1105e7d8-8851-40bc-8d1a-7622ae144765	String	jsonType.label
f89611ce-6a56-4681-9844-4e60d82935e0	true	userinfo.token.claim
f89611ce-6a56-4681-9844-4e60d82935e0	birthdate	user.attribute
f89611ce-6a56-4681-9844-4e60d82935e0	true	id.token.claim
f89611ce-6a56-4681-9844-4e60d82935e0	true	access.token.claim
f89611ce-6a56-4681-9844-4e60d82935e0	birthdate	claim.name
f89611ce-6a56-4681-9844-4e60d82935e0	String	jsonType.label
3d244a74-4e07-4488-9cc8-90ad9ed36c8f	true	userinfo.token.claim
3d244a74-4e07-4488-9cc8-90ad9ed36c8f	zoneinfo	user.attribute
3d244a74-4e07-4488-9cc8-90ad9ed36c8f	true	id.token.claim
3d244a74-4e07-4488-9cc8-90ad9ed36c8f	true	access.token.claim
3d244a74-4e07-4488-9cc8-90ad9ed36c8f	zoneinfo	claim.name
3d244a74-4e07-4488-9cc8-90ad9ed36c8f	String	jsonType.label
285b5839-2193-40e9-823d-bf20d532572e	true	userinfo.token.claim
285b5839-2193-40e9-823d-bf20d532572e	locale	user.attribute
285b5839-2193-40e9-823d-bf20d532572e	true	id.token.claim
285b5839-2193-40e9-823d-bf20d532572e	true	access.token.claim
285b5839-2193-40e9-823d-bf20d532572e	locale	claim.name
285b5839-2193-40e9-823d-bf20d532572e	String	jsonType.label
bfb7bdca-7cd0-45c1-b201-5b54abc39cd0	true	userinfo.token.claim
bfb7bdca-7cd0-45c1-b201-5b54abc39cd0	updatedAt	user.attribute
bfb7bdca-7cd0-45c1-b201-5b54abc39cd0	true	id.token.claim
bfb7bdca-7cd0-45c1-b201-5b54abc39cd0	true	access.token.claim
bfb7bdca-7cd0-45c1-b201-5b54abc39cd0	updated_at	claim.name
bfb7bdca-7cd0-45c1-b201-5b54abc39cd0	String	jsonType.label
3795ca42-752f-4c54-9c3f-6f177796b768	true	userinfo.token.claim
3795ca42-752f-4c54-9c3f-6f177796b768	email	user.attribute
3795ca42-752f-4c54-9c3f-6f177796b768	true	id.token.claim
3795ca42-752f-4c54-9c3f-6f177796b768	true	access.token.claim
3795ca42-752f-4c54-9c3f-6f177796b768	email	claim.name
3795ca42-752f-4c54-9c3f-6f177796b768	String	jsonType.label
cdb53629-e628-43f0-a9ff-43f0a05eca8e	true	userinfo.token.claim
cdb53629-e628-43f0-a9ff-43f0a05eca8e	emailVerified	user.attribute
cdb53629-e628-43f0-a9ff-43f0a05eca8e	true	id.token.claim
cdb53629-e628-43f0-a9ff-43f0a05eca8e	true	access.token.claim
cdb53629-e628-43f0-a9ff-43f0a05eca8e	email_verified	claim.name
cdb53629-e628-43f0-a9ff-43f0a05eca8e	boolean	jsonType.label
19354c11-e789-4a1a-865b-6f8f4afbef5f	formatted	user.attribute.formatted
19354c11-e789-4a1a-865b-6f8f4afbef5f	country	user.attribute.country
19354c11-e789-4a1a-865b-6f8f4afbef5f	postal_code	user.attribute.postal_code
19354c11-e789-4a1a-865b-6f8f4afbef5f	true	userinfo.token.claim
19354c11-e789-4a1a-865b-6f8f4afbef5f	street	user.attribute.street
19354c11-e789-4a1a-865b-6f8f4afbef5f	true	id.token.claim
19354c11-e789-4a1a-865b-6f8f4afbef5f	region	user.attribute.region
19354c11-e789-4a1a-865b-6f8f4afbef5f	true	access.token.claim
19354c11-e789-4a1a-865b-6f8f4afbef5f	locality	user.attribute.locality
1432cc8f-343f-4198-af7a-e364e7b25850	true	userinfo.token.claim
1432cc8f-343f-4198-af7a-e364e7b25850	phoneNumber	user.attribute
1432cc8f-343f-4198-af7a-e364e7b25850	true	id.token.claim
1432cc8f-343f-4198-af7a-e364e7b25850	true	access.token.claim
1432cc8f-343f-4198-af7a-e364e7b25850	phone_number	claim.name
1432cc8f-343f-4198-af7a-e364e7b25850	String	jsonType.label
5c49d596-caba-40ff-b017-bf58f9e2710a	true	userinfo.token.claim
5c49d596-caba-40ff-b017-bf58f9e2710a	phoneNumberVerified	user.attribute
5c49d596-caba-40ff-b017-bf58f9e2710a	true	id.token.claim
5c49d596-caba-40ff-b017-bf58f9e2710a	true	access.token.claim
5c49d596-caba-40ff-b017-bf58f9e2710a	phone_number_verified	claim.name
5c49d596-caba-40ff-b017-bf58f9e2710a	boolean	jsonType.label
ff72aac1-2f74-4f9a-b53a-3b8201ee696e	true	multivalued
ff72aac1-2f74-4f9a-b53a-3b8201ee696e	foo	user.attribute
ff72aac1-2f74-4f9a-b53a-3b8201ee696e	true	access.token.claim
ff72aac1-2f74-4f9a-b53a-3b8201ee696e	realm_access.roles	claim.name
ff72aac1-2f74-4f9a-b53a-3b8201ee696e	String	jsonType.label
843d56a1-c5ee-4e39-9148-c74588b8e5b0	true	multivalued
843d56a1-c5ee-4e39-9148-c74588b8e5b0	foo	user.attribute
843d56a1-c5ee-4e39-9148-c74588b8e5b0	true	access.token.claim
843d56a1-c5ee-4e39-9148-c74588b8e5b0	resource_access.${client_id}.roles	claim.name
843d56a1-c5ee-4e39-9148-c74588b8e5b0	String	jsonType.label
bd23cbba-87fe-4d1a-8599-a6bfc86273d9	true	userinfo.token.claim
bd23cbba-87fe-4d1a-8599-a6bfc86273d9	username	user.attribute
bd23cbba-87fe-4d1a-8599-a6bfc86273d9	true	id.token.claim
bd23cbba-87fe-4d1a-8599-a6bfc86273d9	true	access.token.claim
bd23cbba-87fe-4d1a-8599-a6bfc86273d9	upn	claim.name
bd23cbba-87fe-4d1a-8599-a6bfc86273d9	String	jsonType.label
d197c035-2336-482c-ac1f-589857dbe5fc	true	multivalued
d197c035-2336-482c-ac1f-589857dbe5fc	foo	user.attribute
d197c035-2336-482c-ac1f-589857dbe5fc	true	id.token.claim
d197c035-2336-482c-ac1f-589857dbe5fc	true	access.token.claim
d197c035-2336-482c-ac1f-589857dbe5fc	groups	claim.name
d197c035-2336-482c-ac1f-589857dbe5fc	String	jsonType.label
79c487e7-6280-4bd2-81fd-286675f7aa9d	true	userinfo.token.claim
79c487e7-6280-4bd2-81fd-286675f7aa9d	locale	user.attribute
79c487e7-6280-4bd2-81fd-286675f7aa9d	true	id.token.claim
79c487e7-6280-4bd2-81fd-286675f7aa9d	true	access.token.claim
79c487e7-6280-4bd2-81fd-286675f7aa9d	locale	claim.name
79c487e7-6280-4bd2-81fd-286675f7aa9d	String	jsonType.label
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
c788ef39-a5c6-4ff8-bb78-ce1e83ff62cb	clientId	user.session.note
c788ef39-a5c6-4ff8-bb78-ce1e83ff62cb	true	id.token.claim
c788ef39-a5c6-4ff8-bb78-ce1e83ff62cb	true	access.token.claim
c788ef39-a5c6-4ff8-bb78-ce1e83ff62cb	clientId	claim.name
c788ef39-a5c6-4ff8-bb78-ce1e83ff62cb	String	jsonType.label
4ae49bd8-1539-4ff8-9c97-0d32e070fd57	clientHost	user.session.note
4ae49bd8-1539-4ff8-9c97-0d32e070fd57	true	id.token.claim
4ae49bd8-1539-4ff8-9c97-0d32e070fd57	true	access.token.claim
4ae49bd8-1539-4ff8-9c97-0d32e070fd57	clientHost	claim.name
4ae49bd8-1539-4ff8-9c97-0d32e070fd57	String	jsonType.label
2521e014-1bfc-439d-9a41-c58650205ed7	clientAddress	user.session.note
2521e014-1bfc-439d-9a41-c58650205ed7	true	id.token.claim
2521e014-1bfc-439d-9a41-c58650205ed7	true	access.token.claim
2521e014-1bfc-439d-9a41-c58650205ed7	clientAddress	claim.name
2521e014-1bfc-439d-9a41-c58650205ed7	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me) FROM stdin;
master	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	b25b35be-d710-4716-ac2e-8168b63e1719	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	a1b02760-3349-4959-a668-55e9d5f425fa	80e3de55-e89f-46ca-b63a-4b4ebb28a0ad	1035d8f2-2553-491a-88a5-3d511c279474	7c3fb01b-d886-4888-b744-4875e269df9e	f7ef7396-dc1a-4f3c-af85-9f04885421b6	2592000	f	900	t	f	9ec72291-cb8f-42fb-9146-78c4df131fe2	0	f	0	0
airflow	60	300	300	\N	\N	\N	t	f	0	\N	airflow	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	39810aa9-f3da-4610-a584-ed3dbef5a88b	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	49900a2f-595f-4e49-ab41-b2bd974a6ab2	06550db8-ea83-4e4b-b958-53d865a97cd4	2053bf5c-9bcd-4f3b-9e42-ce17c2178bd2	86d72b1d-c179-4a6c-a808-c4d2eab1c537	df61db59-ef9e-4816-9c1d-d670e64b14ad	2592000	f	900	t	f	3bfb6ebd-9307-4cb6-9ae4-79d82f6bf5da	0	f	0	0
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
master	1c19d1f4-9d5a-4b89-aa4c-77d634e5fd20
master	5a45aad5-6a98-40b8-8a04-155c4ccca3f1
airflow	6cf01a12-5bc4-4dda-af32-c924f9b48bb8
airflow	7c5a7dec-b59f-443c-8fcd-fc312093e3df
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
230a2f6f-fb96-430f-84be-72a5ed31ceb1	/realms/master/account/*
b221355c-eb0e-40ef-b615-978acee2d959	/realms/master/account/*
72d8f832-5e35-4759-9527-c3bc4c816ecb	/admin/master/console/*
a1850c5a-b2e7-466b-9895-2bd3c2ca7e34	/realms/airflow/account/*
3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	/realms/airflow/account/*
1337333b-a8da-4cfa-8e26-4a0de11f8591	/admin/airflow/console/*
10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	*
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
9a97b173-516f-477b-8e72-660167f9813f	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
0e70479d-1bd6-4da6-81e8-ad23d4509474	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
56ea7460-0cf2-41a4-bf4c-cca0e328f210	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
4cd46acc-f09a-4fc1-80ef-8a3bb479b56d	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
5404fd82-506d-42f2-9385-05d5dfde10ec	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
72c6f9a7-d86d-4188-bd43-67e24567ed7d	update_user_locale	Update User Locale	master	t	f	update_user_locale	1000
8ff12294-d16b-435e-ba32-9682b11de299	VERIFY_EMAIL	Verify Email	airflow	t	f	VERIFY_EMAIL	50
b54935a8-cba1-4858-8412-7ca3b8108376	UPDATE_PROFILE	Update Profile	airflow	t	f	UPDATE_PROFILE	40
8b38f14e-2537-4159-a695-4414b6727ffe	CONFIGURE_TOTP	Configure OTP	airflow	t	f	CONFIGURE_TOTP	10
3f7742ed-f8d3-4b0e-920d-7126cf24d521	UPDATE_PASSWORD	Update Password	airflow	t	f	UPDATE_PASSWORD	30
0e4ea3b7-3784-4c83-91dd-6747b38210e4	terms_and_conditions	Terms and Conditions	airflow	f	f	terms_and_conditions	20
c1870f02-2f35-4af9-898c-58d46dfb62d1	update_user_locale	Update User Locale	airflow	t	f	update_user_locale	1000
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
8e0c033c-fdb8-4e1b-930e-afec4ed76ac8	Default Policy	A policy that grants access only for users within this realm	js	0	0	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
075ed938-5c41-4430-9da9-989cd282518d	Default Permission	A permission that applies to the default resource type	resource	1	0	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	\N
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
c38bf8d1-56c0-432b-98fe-ed0b42035b81	Default Resource	urn:airflow-client:resources:default	\N	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	f	\N
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
c38bf8d1-56c0-432b-98fe-ed0b42035b81	/*
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
b221355c-eb0e-40ef-b615-978acee2d959	4c05d63c-8c23-4a4e-9168-6b6f92f23b12
3532cd8d-ba21-490c-ad7c-4c8ae5316fb0	b16cc4b7-76f7-4daa-b36b-faa15745c0e7
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
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
fdec5e1a-d182-4e74-80c9-d683902f3567	\N	4f00ddc9-94e4-4d8a-893b-f98c7735412d	f	t	\N	\N	\N	master	admin	1617517054158	\N	0
898f8dc8-acdc-4027-801c-01ba926fddfd	\N	0f1ad2dd-9a99-4089-80cb-8807ba090a13	f	t	\N	\N	\N	airflow	service-account-airflow-client	1617517205310	10203d60-3b6d-43b7-8ecb-8c6e2226a2f7	0
c95c7310-43b5-4ccf-a8ae-f43cf47dede3	airflow@gmail.com	airflow@gmail.com	t	t	\N	Airflow	Admin	airflow	airflow	1617517218190	\N	0
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
5a45aad5-6a98-40b8-8a04-155c4ccca3f1	fdec5e1a-d182-4e74-80c9-d683902f3567
4c05d63c-8c23-4a4e-9168-6b6f92f23b12	fdec5e1a-d182-4e74-80c9-d683902f3567
1c19d1f4-9d5a-4b89-aa4c-77d634e5fd20	fdec5e1a-d182-4e74-80c9-d683902f3567
e7633604-6f82-42d0-9a3a-d894c9b49fa6	fdec5e1a-d182-4e74-80c9-d683902f3567
4dfbc2e8-a1be-4350-83f2-ac71aa11d0a9	fdec5e1a-d182-4e74-80c9-d683902f3567
8fbce5e2-3ff9-48ae-903e-57f277f644b1	898f8dc8-acdc-4027-801c-01ba926fddfd
6cf01a12-5bc4-4dda-af32-c924f9b48bb8	898f8dc8-acdc-4027-801c-01ba926fddfd
b16cc4b7-76f7-4daa-b36b-faa15745c0e7	898f8dc8-acdc-4027-801c-01ba926fddfd
7c5a7dec-b59f-443c-8fcd-fc312093e3df	898f8dc8-acdc-4027-801c-01ba926fddfd
91a18e16-af8e-446d-8393-50a3e1e41116	898f8dc8-acdc-4027-801c-01ba926fddfd
8fbce5e2-3ff9-48ae-903e-57f277f644b1	c95c7310-43b5-4ccf-a8ae-f43cf47dede3
6cf01a12-5bc4-4dda-af32-c924f9b48bb8	c95c7310-43b5-4ccf-a8ae-f43cf47dede3
b16cc4b7-76f7-4daa-b36b-faa15745c0e7	c95c7310-43b5-4ccf-a8ae-f43cf47dede3
7c5a7dec-b59f-443c-8fcd-fc312093e3df	c95c7310-43b5-4ccf-a8ae-f43cf47dede3
8921845d-3df7-4f55-ba50-dc35cad1f16f	c95c7310-43b5-4ccf-a8ae-f43cf47dede3
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
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.web_origins (client_id, value) FROM stdin;
72d8f832-5e35-4759-9527-c3bc4c816ecb	+
1337333b-a8da-4cfa-8e26-4a0de11f8591	+
\.


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
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


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
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


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
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


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
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


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
-- PostgreSQL database dump complete
--

