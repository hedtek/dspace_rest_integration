--
-- Name: getnextid(character varying); Type: FUNCTION; Schema: public; Owner: dspace-integ
--

CREATE FUNCTION getnextid(character varying) RETURNS integer
    LANGUAGE sql
    AS $_$SELECT CAST (nextval($1 || '_seq') AS INTEGER) AS RESULT $_$;

--
-- Name: bi_2_dis; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE bi_2_dis (
    id integer NOT NULL,
    value text,
    sort_value text
);


--
-- Name: bi_2_dis_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE bi_2_dis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bi_2_dis_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('bi_2_dis_seq', 1, false);


--
-- Name: bi_2_dmap; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE bi_2_dmap (
    map_id integer NOT NULL,
    item_id integer,
    distinct_id integer
);


--
-- Name: bi_2_dmap_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE bi_2_dmap_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bi_2_dmap_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('bi_2_dmap_seq', 1, false);


--
-- Name: bi_4_dis; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE bi_4_dis (
    id integer NOT NULL,
    value text,
    sort_value text
);


--
-- Name: bi_4_dis_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE bi_4_dis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bi_4_dis_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('bi_4_dis_seq', 1, false);


--
-- Name: bi_4_dmap; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE bi_4_dmap (
    map_id integer NOT NULL,
    item_id integer,
    distinct_id integer
);


--
-- Name: bi_4_dmap_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE bi_4_dmap_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bi_4_dmap_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('bi_4_dmap_seq', 1, false);


--
-- Name: bi_item; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE bi_item (
    id integer NOT NULL,
    item_id integer,
    sort_1 text,
    sort_2 text,
    sort_3 text
);


--
-- Name: bi_item_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE bi_item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bi_item_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('bi_item_seq', 1, false);


--
-- Name: bi_withdrawn; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE bi_withdrawn (
    id integer NOT NULL,
    item_id integer,
    sort_1 text,
    sort_2 text,
    sort_3 text
);


--
-- Name: bi_withdrawn_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE bi_withdrawn_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bi_withdrawn_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('bi_withdrawn_seq', 1, false);


--
-- Name: bitstream; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE bitstream (
    bitstream_id integer NOT NULL,
    bitstream_format_id integer,
    name character varying(256),
    size_bytes bigint,
    checksum character varying(64),
    checksum_algorithm character varying(32),
    description text,
    user_format_description text,
    source character varying(256),
    internal_id character varying(256),
    deleted boolean,
    store_number integer,
    sequence_id integer
);


--
-- Name: bitstream_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE bitstream_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bitstream_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('bitstream_seq', 1, false);


--
-- Name: bitstreamformatregistry; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE bitstreamformatregistry (
    bitstream_format_id integer NOT NULL,
    mimetype character varying(256),
    short_description character varying(128),
    description text,
    support_level integer,
    internal boolean
);


--
-- Name: bitstreamformatregistry_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE bitstreamformatregistry_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bitstreamformatregistry_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('bitstreamformatregistry_seq', 73, true);


--
-- Name: bundle; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE bundle (
    bundle_id integer NOT NULL,
    name character varying(16),
    primary_bitstream_id integer
);


--
-- Name: bundle2bitstream; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE bundle2bitstream (
    id integer NOT NULL,
    bundle_id integer,
    bitstream_id integer
);


--
-- Name: bundle2bitstream_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE bundle2bitstream_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bundle2bitstream_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('bundle2bitstream_seq', 1, false);


--
-- Name: bundle_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE bundle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bundle_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('bundle_seq', 1, false);


--
-- Name: checksum_history; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE checksum_history (
    check_id bigint NOT NULL,
    bitstream_id integer,
    process_start_date timestamp without time zone,
    process_end_date timestamp without time zone,
    checksum_expected character varying,
    checksum_calculated character varying,
    result character varying
);


--
-- Name: checksum_history_check_id_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE checksum_history_check_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: checksum_history_check_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dspace-integ
--

ALTER SEQUENCE checksum_history_check_id_seq OWNED BY checksum_history.check_id;


--
-- Name: checksum_history_check_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('checksum_history_check_id_seq', 1, false);


--
-- Name: checksum_results; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE checksum_results (
    result_code character varying NOT NULL,
    result_description character varying
);


--
-- Name: collection; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE collection (
    collection_id integer NOT NULL,
    name character varying(128),
    short_description character varying(512),
    introductory_text text,
    logo_bitstream_id integer,
    template_item_id integer,
    provenance_description text,
    license text,
    copyright_text text,
    side_bar_text text,
    workflow_step_1 integer,
    workflow_step_2 integer,
    workflow_step_3 integer,
    submitter integer,
    admin integer
);


--
-- Name: collection2item; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE collection2item (
    id integer NOT NULL,
    collection_id integer,
    item_id integer
);


--
-- Name: collection2item_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE collection2item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: collection2item_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('collection2item_seq', 1, false);


--
-- Name: collection_item_count; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE collection_item_count (
    collection_id integer NOT NULL,
    count integer
);


--
-- Name: collection_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE collection_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: collection_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('collection_seq', 1, false);


--
-- Name: communities2item; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE communities2item (
    id integer NOT NULL,
    community_id integer,
    item_id integer
);


--
-- Name: communities2item_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE communities2item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: communities2item_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('communities2item_seq', 1, false);


--
-- Name: community; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE community (
    community_id integer NOT NULL,
    name character varying(128),
    short_description character varying(512),
    introductory_text text,
    logo_bitstream_id integer,
    copyright_text text,
    side_bar_text text
);


--
-- Name: community2collection; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE community2collection (
    id integer NOT NULL,
    community_id integer,
    collection_id integer
);


--
-- Name: community2collection_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE community2collection_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: community2collection_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('community2collection_seq', 1, false);


--
-- Name: community2community; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE community2community (
    id integer NOT NULL,
    parent_comm_id integer,
    child_comm_id integer
);


--
-- Name: community2community_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE community2community_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: community2community_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('community2community_seq', 1, false);


--
-- Name: community2item; Type: VIEW; Schema: public; Owner: dspace-integ
--

CREATE VIEW community2item AS
    SELECT community2collection.community_id, collection2item.item_id FROM community2collection, collection2item WHERE (collection2item.collection_id = community2collection.collection_id);


--
-- Name: community_item_count; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE community_item_count (
    community_id integer NOT NULL,
    count integer
);


--
-- Name: community_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE community_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: community_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('community_seq', 1, false);


--
-- Name: dctyperegistry_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE dctyperegistry_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dctyperegistry_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('dctyperegistry_seq', 1, false);


--
-- Name: metadatafieldregistry_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE metadatafieldregistry_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metadatafieldregistry_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('metadatafieldregistry_seq', 71, true);


--
-- Name: metadatafieldregistry; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE metadatafieldregistry (
    metadata_field_id integer DEFAULT nextval('metadatafieldregistry_seq'::regclass) NOT NULL,
    metadata_schema_id integer NOT NULL,
    element character varying(64),
    qualifier character varying(64),
    scope_note text
);


--
-- Name: metadatavalue_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE metadatavalue_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metadatavalue_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('metadatavalue_seq', 1, false);


--
-- Name: metadatavalue; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE metadatavalue (
    metadata_value_id integer DEFAULT nextval('metadatavalue_seq'::regclass) NOT NULL,
    item_id integer,
    metadata_field_id integer,
    text_value text,
    text_lang character varying(24),
    place integer
);


--
-- Name: dcvalue; Type: VIEW; Schema: public; Owner: dspace-integ
--

CREATE VIEW dcvalue AS
    SELECT metadatavalue.metadata_value_id AS dc_value_id, metadatavalue.item_id, metadatavalue.metadata_field_id AS dc_type_id, metadatavalue.text_value, metadatavalue.text_lang, metadatavalue.place FROM metadatavalue, metadatafieldregistry WHERE ((metadatavalue.metadata_field_id = metadatafieldregistry.metadata_field_id) AND (metadatafieldregistry.metadata_schema_id = 1));


--
-- Name: dcvalue_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE dcvalue_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dcvalue_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('dcvalue_seq', 1, false);


--
-- Name: eperson; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE eperson (
    eperson_id integer NOT NULL,
    email character varying(64),
    password character varying(64),
    firstname character varying(64),
    lastname character varying(64),
    can_log_in boolean,
    require_certificate boolean,
    self_registered boolean,
    last_active timestamp without time zone,
    sub_frequency integer,
    phone character varying(32),
    netid character varying(64),
    language character varying(64)
);


--
-- Name: eperson_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE eperson_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eperson_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('eperson_seq', 1, true);


--
-- Name: epersongroup; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE epersongroup (
    eperson_group_id integer NOT NULL,
    name character varying(256)
);


--
-- Name: epersongroup2eperson; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE epersongroup2eperson (
    id integer NOT NULL,
    eperson_group_id integer,
    eperson_id integer
);


--
-- Name: epersongroup2eperson_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE epersongroup2eperson_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: epersongroup2eperson_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('epersongroup2eperson_seq', 1, true);


--
-- Name: epersongroup2workspaceitem_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE epersongroup2workspaceitem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: epersongroup2workspaceitem_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('epersongroup2workspaceitem_seq', 1, false);


--
-- Name: epersongroup2workspaceitem; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE epersongroup2workspaceitem (
    id integer DEFAULT nextval('epersongroup2workspaceitem_seq'::regclass) NOT NULL,
    eperson_group_id integer,
    workspace_item_id integer
);


--
-- Name: epersongroup_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE epersongroup_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: epersongroup_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('epersongroup_seq', 1, true);


--
-- Name: fileextension; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE fileextension (
    file_extension_id integer NOT NULL,
    bitstream_format_id integer,
    extension character varying(16)
);


--
-- Name: fileextension_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE fileextension_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fileextension_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('fileextension_seq', 89, true);


--
-- Name: group2group; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE group2group (
    id integer NOT NULL,
    parent_id integer,
    child_id integer
);


--
-- Name: group2group_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE group2group_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: group2group_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('group2group_seq', 1, false);


--
-- Name: group2groupcache; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE group2groupcache (
    id integer NOT NULL,
    parent_id integer,
    child_id integer
);


--
-- Name: group2groupcache_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE group2groupcache_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: group2groupcache_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('group2groupcache_seq', 1, false);


--
-- Name: handle; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE handle (
    handle_id integer NOT NULL,
    handle character varying(256),
    resource_type_id integer,
    resource_id integer
);


--
-- Name: handle_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE handle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: handle_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('handle_seq', 1, false);


--
-- Name: history_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: history_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('history_seq', 1, false);


--
-- Name: historystate_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE historystate_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: historystate_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('historystate_seq', 1, false);


--
-- Name: item; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE item (
    item_id integer NOT NULL,
    submitter_id integer,
    in_archive boolean,
    withdrawn boolean,
    last_modified timestamp with time zone,
    owning_collection integer
);


--
-- Name: item2bundle; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE item2bundle (
    id integer NOT NULL,
    item_id integer,
    bundle_id integer
);


--
-- Name: item2bundle_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE item2bundle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item2bundle_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('item2bundle_seq', 1, false);


--
-- Name: item_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('item_seq', 1, false);


--
-- Name: metadataschemaregistry_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE metadataschemaregistry_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metadataschemaregistry_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('metadataschemaregistry_seq', 1, true);


--
-- Name: metadataschemaregistry; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE metadataschemaregistry (
    metadata_schema_id integer DEFAULT nextval('metadataschemaregistry_seq'::regclass) NOT NULL,
    namespace character varying(256),
    short_id character varying(32)
);


--
-- Name: most_recent_checksum; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE most_recent_checksum (
    bitstream_id integer NOT NULL,
    to_be_processed boolean NOT NULL,
    expected_checksum character varying NOT NULL,
    current_checksum character varying NOT NULL,
    last_process_start_date timestamp without time zone NOT NULL,
    last_process_end_date timestamp without time zone NOT NULL,
    checksum_algorithm character varying NOT NULL,
    matched_prev_checksum boolean NOT NULL,
    result character varying
);


--
-- Name: registrationdata; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE registrationdata (
    registrationdata_id integer NOT NULL,
    email character varying(64),
    token character varying(48),
    expires timestamp without time zone
);


--
-- Name: registrationdata_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE registrationdata_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: registrationdata_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('registrationdata_seq', 1, false);


--
-- Name: resourcepolicy; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE resourcepolicy (
    policy_id integer NOT NULL,
    resource_type_id integer,
    resource_id integer,
    action_id integer,
    eperson_id integer,
    epersongroup_id integer,
    start_date date,
    end_date date
);


--
-- Name: resourcepolicy_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE resourcepolicy_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resourcepolicy_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('resourcepolicy_seq', 1, false);


--
-- Name: subscription; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE subscription (
    subscription_id integer NOT NULL,
    eperson_id integer,
    collection_id integer
);


--
-- Name: subscription_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE subscription_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscription_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('subscription_seq', 1, false);


--
-- Name: tasklistitem; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE tasklistitem (
    tasklist_id integer NOT NULL,
    eperson_id integer,
    workflow_id integer
);


--
-- Name: tasklistitem_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE tasklistitem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tasklistitem_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('tasklistitem_seq', 1, false);


--
-- Name: workflowitem; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE workflowitem (
    workflow_id integer NOT NULL,
    item_id integer,
    collection_id integer,
    state integer,
    owner integer,
    multiple_titles boolean,
    published_before boolean,
    multiple_files boolean
);


--
-- Name: workflowitem_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE workflowitem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workflowitem_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('workflowitem_seq', 1, false);


--
-- Name: workspaceitem; Type: TABLE; Schema: public; Owner: dspace-integ; Tablespace: 
--

CREATE TABLE workspaceitem (
    workspace_item_id integer NOT NULL,
    item_id integer,
    collection_id integer,
    multiple_titles boolean,
    published_before boolean,
    multiple_files boolean,
    stage_reached integer,
    page_reached integer
);


--
-- Name: workspaceitem_seq; Type: SEQUENCE; Schema: public; Owner: dspace-integ
--

CREATE SEQUENCE workspaceitem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workspaceitem_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace-integ
--

SELECT pg_catalog.setval('workspaceitem_seq', 1, false);


--
-- Name: check_id; Type: DEFAULT; Schema: public; Owner: dspace-integ
--

ALTER TABLE checksum_history ALTER COLUMN check_id SET DEFAULT nextval('checksum_history_check_id_seq'::regclass);


--
-- Data for Name: bi_2_dis; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: bi_2_dmap; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: bi_4_dis; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: bi_4_dmap; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: bi_item; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: bi_withdrawn; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: bitstream; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: bitstreamformatregistry; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: bundle; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: bundle2bitstream; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: checksum_history; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: checksum_results; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: collection2item; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: collection_item_count; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: communities2item; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: community; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: community2collection; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: community2community; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: community_item_count; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: eperson; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: epersongroup; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: epersongroup2eperson; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: epersongroup2workspaceitem; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: fileextension; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: group2group; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: group2groupcache; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: handle; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: item2bundle; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: metadatafieldregistry; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: metadataschemaregistry; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: metadatavalue; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: most_recent_checksum; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: registrationdata; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: resourcepolicy; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: subscription; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: tasklistitem; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--



--
-- Data for Name: workflowitem; Type: TABLE DATA; Schema: public; Owner: dspace-integ
--

