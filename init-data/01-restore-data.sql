--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-06-26 21:50:35

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
-- TOC entry 282 (class 1259 OID 20277)
-- Name: bgmap_commune; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bgmap_commune (
    gid integer NOT NULL,
    ten_xa character varying(200),
    tinh_id integer
);


ALTER TABLE public.bgmap_commune OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 20276)
-- Name: bgmap_commune_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bgmap_commune_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bgmap_commune_gid_seq OWNER TO postgres;

--
-- TOC entry 5464 (class 0 OID 0)
-- Dependencies: 281
-- Name: bgmap_commune_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bgmap_commune_gid_seq OWNED BY public.bgmap_commune.gid;


--
-- TOC entry 317 (class 1259 OID 40600)
-- Name: bgmap_province; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bgmap_province (
    gid integer NOT NULL,
    ten_tinh character varying,
    code character varying,
    tinh_seo text
);


ALTER TABLE public.bgmap_province OWNER TO postgres;

--
-- TOC entry 318 (class 1259 OID 40603)
-- Name: bgmap_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bgmap_ogc_fid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bgmap_ogc_fid_seq OWNER TO postgres;

--
-- TOC entry 5465 (class 0 OID 0)
-- Dependencies: 318
-- Name: bgmap_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bgmap_ogc_fid_seq OWNED BY public.bgmap_province.gid;


--
-- TOC entry 285 (class 1259 OID 20296)
-- Name: iw_thongsoquantrac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iw_thongsoquantrac (
    tskt_id integer NOT NULL,
    tskt_ten character varying(450),
    tskt_stt integer,
    tskt_deletedstatus integer,
    tskt_maloaithongso character varying(450),
    tskt_nguong_min real,
    tskt_nguong_max real,
    station_id character varying,
    tskt_nhaplieuthucong boolean,
    tskt_key uuid DEFAULT public.uuid_generate_v4(),
    nguon_dulieu character varying(250)
);


ALTER TABLE public.iw_thongsoquantrac OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 20295)
-- Name: iw_thongsoquantrac_tskt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iw_thongsoquantrac_tskt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.iw_thongsoquantrac_tskt_id_seq OWNER TO postgres;

--
-- TOC entry 5466 (class 0 OID 0)
-- Dependencies: 284
-- Name: iw_thongsoquantrac_tskt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iw_thongsoquantrac_tskt_id_seq OWNED BY public.iw_thongsoquantrac.tskt_id;


--
-- TOC entry 310 (class 1259 OID 20421)
-- Name: map_layer_coquan_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_layer_coquan_access (
    id integer NOT NULL,
    cq_id integer,
    layer_id integer
);


ALTER TABLE public.map_layer_coquan_access OWNER TO postgres;

--
-- TOC entry 309 (class 1259 OID 20420)
-- Name: map_layer_coquan_access_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_layer_coquan_access_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.map_layer_coquan_access_id_seq OWNER TO postgres;

--
-- TOC entry 5467 (class 0 OID 0)
-- Dependencies: 309
-- Name: map_layer_coquan_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_layer_coquan_access_id_seq OWNED BY public.map_layer_coquan_access.id;


--
-- TOC entry 312 (class 1259 OID 20428)
-- Name: map_layer_member_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_layer_member_access (
    id integer NOT NULL,
    mem_id uuid,
    layer_id integer
);


ALTER TABLE public.map_layer_member_access OWNER TO postgres;

--
-- TOC entry 311 (class 1259 OID 20427)
-- Name: map_layer_member_access_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_layer_member_access_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.map_layer_member_access_id_seq OWNER TO postgres;

--
-- TOC entry 5468 (class 0 OID 0)
-- Dependencies: 311
-- Name: map_layer_member_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_layer_member_access_id_seq OWNED BY public.map_layer_member_access.id;


--
-- TOC entry 308 (class 1259 OID 20408)
-- Name: map_layers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_layers (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    source_layer character varying(50),
    filter text,
    layout text,
    visible_by_default boolean DEFAULT true,
    is_public boolean DEFAULT false,
    sort_order integer,
    paint jsonb,
    layer_type character varying(20),
    source_id integer,
    parent_id integer,
    is_group boolean DEFAULT false,
    min_zoom integer,
    max_zoom integer
);


ALTER TABLE public.map_layers OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 20407)
-- Name: map_layers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_layers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.map_layers_id_seq OWNER TO postgres;

--
-- TOC entry 5469 (class 0 OID 0)
-- Dependencies: 307
-- Name: map_layers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_layers_id_seq OWNED BY public.map_layers.id;


--
-- TOC entry 316 (class 1259 OID 40387)
-- Name: map_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_sources (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    source_url text,
    bounds jsonb,
    scheme character varying,
    source_type character varying(20),
    active boolean DEFAULT false,
    apikey_id integer
);


ALTER TABLE public.map_sources OWNER TO postgres;

--
-- TOC entry 315 (class 1259 OID 40386)
-- Name: map_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.map_sources_id_seq OWNER TO postgres;

--
-- TOC entry 5470 (class 0 OID 0)
-- Dependencies: 315
-- Name: map_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_sources_id_seq OWNED BY public.map_sources.id;


--
-- TOC entry 314 (class 1259 OID 20435)
-- Name: mapbox_apikeys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapbox_apikeys (
    id integer NOT NULL,
    key_value text NOT NULL,
    description text,
    created_by character varying(100),
    created_at timestamp without time zone DEFAULT now(),
    active boolean DEFAULT true
);


ALTER TABLE public.mapbox_apikeys OWNER TO postgres;

--
-- TOC entry 313 (class 1259 OID 20434)
-- Name: mapbox_apikeys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapbox_apikeys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mapbox_apikeys_id_seq OWNER TO postgres;

--
-- TOC entry 5471 (class 0 OID 0)
-- Dependencies: 313
-- Name: mapbox_apikeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mapbox_apikeys_id_seq OWNED BY public.mapbox_apikeys.id;


--
-- TOC entry 287 (class 1259 OID 20306)
-- Name: monitoring_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitoring_data (
    data_id integer NOT NULL,
    tskt_id integer NOT NULL,
    data_thoigian timestamp without time zone NOT NULL,
    data_thoigiancapnhat timestamp without time zone,
    data_giatri_sothuc real DEFAULT 0,
    data_giatri_chuoi character varying(250),
    createby character varying(150),
    data_tonghop character varying(250),
    data_maloaithongso character varying(100)
);


ALTER TABLE public.monitoring_data OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 20305)
-- Name: monitoring_data_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monitoring_data_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.monitoring_data_data_id_seq OWNER TO postgres;

--
-- TOC entry 5472 (class 0 OID 0)
-- Dependencies: 286
-- Name: monitoring_data_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monitoring_data_data_id_seq OWNED BY public.monitoring_data.data_id;


SELECT create_hypertable(
    'public.monitoring_data', 
    'data_thoigian',
    if_not_exists => TRUE
);

--
-- TOC entry 283 (class 1259 OID 20285)
-- Name: monitoring_stations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitoring_stations (
    key uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    station_id character varying NOT NULL,
    station_name character varying,
    commune_id integer,
    luuvuc character varying,
    lat double precision,
    lon double precision,
    description character varying,
    infor_data jsonb
);


ALTER TABLE public.monitoring_stations OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 20323)
-- Name: sys_coquan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_coquan (
    cq_id integer NOT NULL,
    cq_ten character varying(450),
    cq_mota character varying(450),
    cq_diachi character varying(450),
    cq_nguoidaidien character varying(450),
    cq_dienthoai character varying(150),
    cq_email character varying(150),
    cq_ghichu character varying(450),
    cq_active boolean DEFAULT true,
    cq_pid integer,
    cq_stt integer,
    cq_loai character varying(150),
    cq_xaid text,
    cq_tinhid text
);


ALTER TABLE public.sys_coquan OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 20322)
-- Name: sys_coquan_cq_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_coquan_cq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_coquan_cq_id_seq OWNER TO postgres;

--
-- TOC entry 5473 (class 0 OID 0)
-- Dependencies: 290
-- Name: sys_coquan_cq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_coquan_cq_id_seq OWNED BY public.sys_coquan.cq_id;


--
-- TOC entry 300 (class 1259 OID 20364)
-- Name: sys_danhmuc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_danhmuc (
    dm_id integer NOT NULL,
    dm_ten character varying(150),
    dm_ldm_id integer,
    dm_ma character varying(150),
    dm_pid integer,
    dm_stt integer,
    dm_mota character varying(1000),
    dm_icon_url character varying(250),
    functionid integer
);


ALTER TABLE public.sys_danhmuc OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 20363)
-- Name: sys_danhmuc_dm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_danhmuc_dm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_danhmuc_dm_id_seq OWNER TO postgres;

--
-- TOC entry 5474 (class 0 OID 0)
-- Dependencies: 299
-- Name: sys_danhmuc_dm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_danhmuc_dm_id_seq OWNED BY public.sys_danhmuc.dm_id;


--
-- TOC entry 298 (class 1259 OID 20355)
-- Name: sys_danhmuc_phanloai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_danhmuc_phanloai (
    ldm_id integer NOT NULL,
    ldm_ten character varying(200),
    ldm_ma character varying(150),
    ldm_mota character varying,
    ldm_pid integer,
    ldm_stt integer,
    ldm_url character varying(250)
);


ALTER TABLE public.sys_danhmuc_phanloai OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 20354)
-- Name: sys_danhmuc_phanloai_ldm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_danhmuc_phanloai_ldm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_danhmuc_phanloai_ldm_id_seq OWNER TO postgres;

--
-- TOC entry 5475 (class 0 OID 0)
-- Dependencies: 297
-- Name: sys_danhmuc_phanloai_ldm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_danhmuc_phanloai_ldm_id_seq OWNED BY public.sys_danhmuc_phanloai.ldm_id;


--
-- TOC entry 306 (class 1259 OID 20399)
-- Name: sys_function; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_function (
    fn_id integer NOT NULL,
    fn_thutu integer,
    fn_ten character varying(500),
    fn_mota character varying(500),
    fn_ma character varying(50),
    fn_active boolean,
    fn_ngaytao timestamp without time zone,
    fn_ngaycapnhat timestamp without time zone,
    fn_nguoitao character varying(50),
    fn_dmid integer,
    fn_url character varying(250)
);


ALTER TABLE public.sys_function OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 20398)
-- Name: sys_function_fn_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_function_fn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_function_fn_id_seq OWNER TO postgres;

--
-- TOC entry 5476 (class 0 OID 0)
-- Dependencies: 305
-- Name: sys_function_fn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_function_fn_id_seq OWNED BY public.sys_function.fn_id;


--
-- TOC entry 294 (class 1259 OID 20339)
-- Name: sys_member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_member (
    mem_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    mem_username character varying(150) NOT NULL,
    mem_password character varying(450),
    mem_hoten character varying(450),
    mem_cq_id integer,
    mem_email character varying(150),
    mem_active boolean,
    mem_create_at timestamp without time zone,
    mem_update_at timestamp without time zone,
    mem_lastlogin_at timestamp without time zone,
    mem_delete_at timestamp without time zone,
    mem_delete_by character varying(150),
    mem_update_by character varying(150)
);


ALTER TABLE public.sys_member OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 20316)
-- Name: sys_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_role (
    role_id bigint NOT NULL,
    role_ten character varying(150),
    role_stt integer,
    role_nguoitao character varying(150),
    role_ma character varying(150),
    role_type integer
);


ALTER TABLE public.sys_role OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 20333)
-- Name: sys_role_coquan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_role_coquan (
    id integer NOT NULL,
    cq_id integer,
    role_id bigint
);


ALTER TABLE public.sys_role_coquan OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 20332)
-- Name: sys_role_coquan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_role_coquan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_role_coquan_id_seq OWNER TO postgres;

--
-- TOC entry 5477 (class 0 OID 0)
-- Dependencies: 292
-- Name: sys_role_coquan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_role_coquan_id_seq OWNED BY public.sys_role_coquan.id;


--
-- TOC entry 296 (class 1259 OID 20348)
-- Name: sys_role_member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_role_member (
    id integer NOT NULL,
    mem_id uuid,
    role_id bigint
);


ALTER TABLE public.sys_role_member OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 20347)
-- Name: sys_role_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_role_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_role_member_id_seq OWNER TO postgres;

--
-- TOC entry 5478 (class 0 OID 0)
-- Dependencies: 295
-- Name: sys_role_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_role_member_id_seq OWNED BY public.sys_role_member.id;


--
-- TOC entry 288 (class 1259 OID 20315)
-- Name: sys_role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_role_role_id_seq OWNER TO postgres;

--
-- TOC entry 5479 (class 0 OID 0)
-- Dependencies: 288
-- Name: sys_role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_role_role_id_seq OWNED BY public.sys_role.role_id;


--
-- TOC entry 302 (class 1259 OID 20373)
-- Name: weather_stations_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weather_stations_report (
    id integer NOT NULL,
    name_file character varying,
    file_ref character varying,
    request_time timestamp without time zone NOT NULL,
    ngaybatdau timestamp without time zone NOT NULL,
    ngayketthuc timestamp without time zone NOT NULL,
    tansuat character varying NOT NULL,
    email character varying,
    trangthai integer,
    created_by uuid,
    is_public boolean DEFAULT false,
    rp_type character varying
);


ALTER TABLE public.weather_stations_report OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 20372)
-- Name: weather_stations_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weather_stations_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.weather_stations_report_id_seq OWNER TO postgres;

--
-- TOC entry 5480 (class 0 OID 0)
-- Dependencies: 301
-- Name: weather_stations_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weather_stations_report_id_seq OWNED BY public.weather_stations_report.id;


--
-- TOC entry 304 (class 1259 OID 20390)
-- Name: weather_stations_report_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weather_stations_report_list (
    id integer NOT NULL,
    weather_stations_report_id integer,
    provine_id integer,
    station_id character varying
);


ALTER TABLE public.weather_stations_report_list OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 20389)
-- Name: weather_stations_report_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weather_stations_report_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.weather_stations_report_list_id_seq OWNER TO postgres;

--
-- TOC entry 5481 (class 0 OID 0)
-- Dependencies: 303
-- Name: weather_stations_report_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weather_stations_report_list_id_seq OWNED BY public.weather_stations_report_list.id;


--
-- TOC entry 5160 (class 2604 OID 52767)
-- Name: bgmap_commune gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bgmap_commune ALTER COLUMN gid SET DEFAULT nextval('public.bgmap_commune_gid_seq'::regclass);


--
-- TOC entry 5189 (class 2604 OID 52768)
-- Name: bgmap_province gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bgmap_province ALTER COLUMN gid SET DEFAULT nextval('public.bgmap_ogc_fid_seq'::regclass);


--
-- TOC entry 5162 (class 2604 OID 52769)
-- Name: iw_thongsoquantrac tskt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iw_thongsoquantrac ALTER COLUMN tskt_id SET DEFAULT nextval('public.iw_thongsoquantrac_tskt_id_seq'::regclass);


--
-- TOC entry 5182 (class 2604 OID 52770)
-- Name: map_layer_coquan_access id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_layer_coquan_access ALTER COLUMN id SET DEFAULT nextval('public.map_layer_coquan_access_id_seq'::regclass);


--
-- TOC entry 5183 (class 2604 OID 52771)
-- Name: map_layer_member_access id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_layer_member_access ALTER COLUMN id SET DEFAULT nextval('public.map_layer_member_access_id_seq'::regclass);


--
-- TOC entry 5178 (class 2604 OID 52772)
-- Name: map_layers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_layers ALTER COLUMN id SET DEFAULT nextval('public.map_layers_id_seq'::regclass);


--
-- TOC entry 5187 (class 2604 OID 52773)
-- Name: map_sources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_sources ALTER COLUMN id SET DEFAULT nextval('public.map_sources_id_seq'::regclass);


--
-- TOC entry 5184 (class 2604 OID 52774)
-- Name: mapbox_apikeys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapbox_apikeys ALTER COLUMN id SET DEFAULT nextval('public.mapbox_apikeys_id_seq'::regclass);


--
-- TOC entry 5164 (class 2604 OID 20309)
-- Name: monitoring_data data_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitoring_data ALTER COLUMN data_id SET DEFAULT nextval('public.monitoring_data_data_id_seq'::regclass);


--
-- TOC entry 5167 (class 2604 OID 52775)
-- Name: sys_coquan cq_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_coquan ALTER COLUMN cq_id SET DEFAULT nextval('public.sys_coquan_cq_id_seq'::regclass);


--
-- TOC entry 5173 (class 2604 OID 52776)
-- Name: sys_danhmuc dm_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_danhmuc ALTER COLUMN dm_id SET DEFAULT nextval('public.sys_danhmuc_dm_id_seq'::regclass);


--
-- TOC entry 5172 (class 2604 OID 52777)
-- Name: sys_danhmuc_phanloai ldm_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_danhmuc_phanloai ALTER COLUMN ldm_id SET DEFAULT nextval('public.sys_danhmuc_phanloai_ldm_id_seq'::regclass);


--
-- TOC entry 5177 (class 2604 OID 52778)
-- Name: sys_function fn_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_function ALTER COLUMN fn_id SET DEFAULT nextval('public.sys_function_fn_id_seq'::regclass);


--
-- TOC entry 5166 (class 2604 OID 52779)
-- Name: sys_role role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_role ALTER COLUMN role_id SET DEFAULT nextval('public.sys_role_role_id_seq'::regclass);


--
-- TOC entry 5169 (class 2604 OID 52780)
-- Name: sys_role_coquan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_role_coquan ALTER COLUMN id SET DEFAULT nextval('public.sys_role_coquan_id_seq'::regclass);


--
-- TOC entry 5171 (class 2604 OID 52781)
-- Name: sys_role_member id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_role_member ALTER COLUMN id SET DEFAULT nextval('public.sys_role_member_id_seq'::regclass);


--
-- TOC entry 5174 (class 2604 OID 52782)
-- Name: weather_stations_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather_stations_report ALTER COLUMN id SET DEFAULT nextval('public.weather_stations_report_id_seq'::regclass);


--
-- TOC entry 5176 (class 2604 OID 52783)
-- Name: weather_stations_report_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather_stations_report_list ALTER COLUMN id SET DEFAULT nextval('public.weather_stations_report_list_id_seq'::regclass);


--
-- TOC entry 5422 (class 0 OID 20277)
-- Dependencies: 282
-- Data for Name: bgmap_commune; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bgmap_commune (gid, ten_xa, tinh_id) FROM stdin;
334	Xã Phú Nhuận	2
1522	Xã An Xuyên	4
1	Xã Na Sang	31
3104	Xã Phù Long	24
5973	Xã Hà Lâm	11
5984	Xã Mỹ Đức	11
3848	Xã Chí Cà	28
8994	Xã Bến Củi	29
3517	Phường 14	21
3451	Phường 8	21
7128	Xã Phúc Thành	13
5768	Xã Khánh Long	12
5769	Xã Kim Đồng	12
2698	Xã Ia Pếch	5
1232	Xã Đak Ơ	33
1233	Xã Phú Nghĩa	33
1234	Xã Phú Văn	33
1235	Xã Phước Minh	33
10013	Xã Nam Động	26
10014	Xã Nam Tiến	26
10015	Xã Nam Xuân	26
10037	Xã Trung Hạ	26
10038	Xã Trung Thượng	26
10039	Xã Trung Tiến	26
3522	Phường 4	21
5537	Xã Ngok Tem	16
5538	Xã Pờ Ê	16
10252	Xã Minh Sơn	26
5620	Xã Hồng Thái	12
5621	Xã Hòa Bình	12
5622	Xã Hoa Thám	12
1045	Phường Ghềnh Ráng	5
3998	Xã Thủy Xuân Tiên	23
4002	Xã Trần Phú	23
4006	Thị trấn Xuân Mai	23
5777	Xã Trung Thành	12
5778	Xã Vĩnh Tiến	12
5785	Xã Hoàng Việt	12
5985	Xã Quảng Trị	11
5986	Xã Quốc Oai	11
8050	Xã Tam Đại	25
8051	Xã Tam Dân	25
8052	Xã Tam Đàn	25
8053	Xã Tam Lộc	25
8054	Xã Tam Lãnh	25
8055	Xã Tam Phước	25
1130	Xã Long Nguyên	21
1133	Xã An Lập	21
1134	Thị trấn Dầu Tiếng	21
1137	Xã Định Thành	21
1138	Xã Long Hoà	21
1139	Xã Long Tân	21
1140	Xã Minh Hoà	21
11031	Xã Hát Lìu	10
5887	Xã Phăng Sô Lin	9
4649	Xã Đức Vĩnh	6
8042	Xã Tam Sơn	25
9175	Xã Lộc Tiến	22
9176	Xã Lộc Trì	22
5563	Phường Thống Nhất	16
562	Xã Cổ Linh	27
8822	Xã Chiềng Lao	19
3404	Phường 28	21
8893	Xã Bó Sinh	19
3439	Phường 11	21
3438	Phường 10	21
8833	Xã Pi Toong	19
8247	Phường Nguyễn Nghiêm	16
10399	Xã Dưỡng Điềm	34
10593	Phường 6	30
2420	Xã Hòa Sơn	25
3507	Phường 5	21
9085	Xã Sơn Thủy	22
9125	Xã Bình Điền	22
9126	Xã Bình Thành	22
9168	Xã Lộc An	22
9169	Xã Lộc Bổn	22
9171	Xã Lộc Điền	22
9172	Xã Lộc Hòa	22
9173	Xã Lộc Sơn	22
3508	Phường 6	21
8429	Xã Quảng Trung	17
10076	Xã Thành Vân	26
10077	Xã Thành Vinh	26
3509	Phường 7	21
3513	Phường 10	21
4876	Phường Đồng Tiến	15
2837	Phường Bến Tắm	24
2842	Xã Hoàng Hoa Thám	24
2843	Phường Hoàng Tân	24
87	Xã Phú Bình	1
88	Xã Phú Hiệp	1
9448	Xã Đông Trà	7
8065	Xã Phước Kim	25
9378	Phường Lê Hồng Phong	7
8333	Xã Minh Cầm	17
8376	Xã Bình Khê	17
8377	Phường Đức Chính	17
8380	Xã Hồng Thái Đông	17
8381	Xã Hồng Thái Tây	17
9059	Xã Gia Lộc	29
9068	Xã A Roằng	22
9070	Xã Đông Sơn	22
9071	Xã Hồng Bắc	22
9072	Xã Hồng Hạ	22
9073	Xã Hồng Kim	22
9077	Xã Hồng Thượng	22
9080	Xã Hương Lâm	22
7749	Xã Hòa Trạch	18
7752	Xã Hưng Trạch	18
7755	Xã Lý Trạch	18
7760	Xã Phú Định	18
7762	Xã Phúc Trạch	18
7764	Xã Sơn Trạch	18
7765	Xã Tân Trạch	18
7768	Xã Thượng Trạch	18
7770	Xã Vạn Trạch	18
7771	Xã Xuân Trạch	18
7777	Xã Quảng Minh	18
7780	Xã Quảng Sơn	18
265	Xã An Hà	2
266	Xã Đại Lâm	2
493	Xã Đại Sảo	27
2780	Phường Đống Đa	5
296	Xã Đan Hội	2
297	Xã Đông Hưng	2
365	Xã Tuấn Đạo	2
7890	Xã Mai Hóa	18
9036	Xã Tân Hội	29
366	Xã Tuấn Mậu	2
544	Xã Văn Minh	27
545	Xã Vũ Loan	27
548	Xã Bằng Vân	27
549	Xã Cốc Đán	27
1450	Xã Thới Hưng	20
1463	Phường An Cư	20
8854	Xã Suối Tọ	19
8855	Xã Tân Lang	19
8856	Xã Tân Phong	19
9616	Xã Phấn Mễ	27
9617	Xã Phủ Lý	27
9624	Xã Yên Trạch	27
9627	Xã Bình Sơn	27
9857	Xã Mường Lý	26
9858	Xã Nhi Sơn	26
9859	Xã Pù Nhi	26
9860	Xã Quang Chiểu	26
9861	Xã Tam Chung	26
1576	Xã Tam Giang Tây	4
1517	Xã Thạnh Tiến	20
1531	Phường 6	4
6913	Xã Hạnh Dịch	13
2781	Phường Diên Hồng	5
7229	Phường Bích Đào	14
1808	Xã Đình Phong	3
9039	Xã Tân Hòa	29
9040	Xã Tân Hưng	29
7566	Xã Thục Luyện	15
7568	Xã Thượng Cửu	15
7570	Xã Văn Miếu	15
1422	Xã Măng Tố	11
1423	Xã Nghị Đức	11
2702	Xã Chư Mố	5
2703	Xã Chư Răng	5
2704	Xã Ia Broăi	5
2705	Xã Ia KDăm	5
2406	Phường Nam Dương	25
5241	Phường Cam Thuận	8
5245	Xã Diên Điền	8
10461	Phường 3	34
7193	Xã Như Hòa	14
2495	Phường Thanh Trường	31
2496	Xã ẳng Cang	31
2497	Xã ẳng Nưa	31
578	Phường Đáp Cầu	2
8518	Xã Cam Hiếu	18
8519	Thị trấn Cam Lộ	18
8520	Xã Cam Nghĩa	18
8521	Xã Cam Thủy	18
8522	Xã Cam Thanh	18
8523	Xã Cam Thành	18
2347	Xã Hoà Bình	34
4157	Phường Hàng Gai	23
4298	Xã Đông Xuân	23
4299	Xã Đông Yên	23
6865	Xã Nghi Mỹ	13
10484	Xã Tân Hòa Tây	34
5237	Phường Cam Phúc Nam	8
5696	Xã Đô Lương	12
5698	Xã Hữu Liên	12
5700	Xã Hòa Bình	12
2044	Xã Đắk Ha	11
2046	Xã Đắk R'Măng	11
2047	Xã Đắk Som	11
2048	Xã Quảng Hoà	11
5352	Xã Hưng Yên	1
3487	Phường Bến Nghé	21
7310	Xã Phước Hữu	8
7311	Xã Phước Sơn	8
1467	Phường An Lạc	20
2400	Phường Hải Châu I	25
5292	Phường Phương Sơn	8
6690	Phường Thu Thuỷ	13
5374	Xã Mong Thọ	1
5421	Phường Tô Châu	1
5667	Xã Gia Lộc	12
5688	Xã Đình Lập (Xã)	12
5689	Xã Kiên Mộc	12
5690	Xã Lâm Ca	12
5692	Xã Thái Bình	12
5693	Xã Cai Kinh	12
5694	Xã Đồng Tân	12
5718	Xã Yên Vượng	12
5721	Xã Hoàng Đồng	12
5723	Xã Mai Pha	12
5724	Xã Quảng Lạc	12
5727	Xã ái Quốc	12
5730	Xã Đông Quan	12
5731	Xã Hữu Khánh	12
5732	Xã Hữu Lân	12
5736	Xã Lợi Bác	12
5738	Xã Mẫu Sơn	12
5739	Xã Minh Phát	12
5741	Xã Nam Quan	12
5743	Xã Nhượng Bạn	12
5744	Xã Quan Bản	12
5745	Xã Sàn Viên	12
5746	Xã Tam Gia	12
5747	Xã Tĩnh Bắc	12
5748	Xã Tú Đoạn	12
5749	Xã Tú Mịch	12
6435	Xã Bình Hòa	14
5468	Phường Vĩnh Thanh Vân	1
3521	Phường 3	21
5471	Xã Tân Hội	1
5483	Xã Minh Thuận	1
2530	Xã Nậm Chua	31
2531	Xã Nậm Khăn	31
1832	Xã Ea Tu	32
1834	Xã Hòa Phú	32
1392	Phường Đức Nghĩa	11
909	Xã Châu Pha	21
910	Xã Hắc Dịch	21
911	Xã Mỹ Xuân	21
912	Thị trấn Phú Mỹ	21
913	Xã Phước Hòa	21
914	Xã Sông Xoài	21
1518	Thị trấn Thanh An	20
5470	Xã Tân An	1
943	Xã Hòa Hưng	21
1017	Xã Cát Tân	5
6376	Xã Bắc Hòa	29
4540	Thị trấn Vĩnh Trụ	14
2462	Xã Pa Thơm	31
2463	Xã Phu Luông	31
976	Xã Ân Hảo Tây	5
2524	Xã Quảng Lâm	31
2525	Xã Sen Thượng	31
2526	Xã Sín Thầu	31
2527	Xã Chà Cang	31
2528	Xã Chà Nưa	31
4428	Phường Kim Giang	23
5274	Xã Khánh Nam	8
1152	Xã An Bình	21
1153	Xã An Linh	21
1154	Xã An Long	21
3506	Phường 4	21
5479	Xã Thạnh Đông B	1
7071	Xã Tam Thái	13
7072	Xã Thạch Giám	13
1287	Xã Lộc Thạnh	33
1288	Xã Lộc Thịnh	33
7812	Xã Thanh Thủy	18
2104	Phường Thanh Bình	33
2694	Thị trấn Ia Kha	5
2695	Xã Ia Khai	5
2696	Xã Ia KRai	5
8261	Thị trấn Di Lăng	16
6487	Xã Hải Vân	14
6518	Phường Thống Nhất	14
7491	Xã Hồng Đà	15
1635	Xã Phan Thanh	3
711	Phường 1	30
1696	Xã Vân An	3
1697	Thị trấn Xuân Hòa	3
6414	Xã Long Thành	29
1729	Xã Quang Thành	3
1730	Xã Tam Kim	3
6744	Xã Bồi Sơn	13
6746	Xã Đại Sơn	13
7377	Xã Tùng Khê	15
2039	Xã Nam Bình	11
2040	Xã Nâm N'Jang	11
3647	Phường 1	21
6837	Thị trấn Nam Đàn	13
10755	Xã Thành Lợi	30
1762	Xã Quốc Dân	3
1716	Xã Quang Trung	3
1717	Xã Trương Lương	3
1718	Xã Trương Vương	3
1720	Xã Ca Thành	3
1721	Xã Hoa Thám	3
1737	Xã Vũ Nông	3
6450	Xã Giao Xuân	14
6454	Thị trấn Ngô Đồng	14
2075	Xã Quảng Tân	11
5405	Xã Định Hòa	1
5409	Xã Vĩnh Hòa Hưng Bắc	1
5410	Xã Vĩnh Hòa Hưng Nam	1
5414	Xã Vĩnh Tuy	1
5420	Xã Tiên Hải	1
9289	Xã Tây Đô	7
3124	Phường Đằng Lâm	24
5283	Phường Lộc Thọ	8
1872	Xã Quảng Hiệp	32
1874	Xã Quảng Tiến	32
1877	Xã Dlê Yang	32
1879	Xã Ea H'leo	32
1880	Xã Ea Hiao	32
2090	Phường Quang Vinh	33
10468	Phường Tân Long	34
6689	Phường Nghi Thuỷ	13
6554	Xã Nghĩa Hồng	14
3399	Phường 22	21
3400	Phường 24	21
3444	Phường 16	21
3445	Phường 17	21
2083	Xã Hiệp Hòa	33
2178	Xã Núi Tượng	33
2179	Xã Phú An	33
2180	Xã Phú Bình	33
2181	Xã Phú Điền	33
2183	Xã Phú Lộc	33
3640	Phường Phước Bình	21
7243	Phường Bắc Sơn	14
2121	Xã Gia Canh	33
2123	Xã Ngọc Định	33
2128	Xã Phú Tân	33
2129	Xã Phú Túc	33
2186	Xã Phú Thịnh	33
2187	Xã Phú Thanh	33
2190	Xã Tà Lài	33
2364	Xã Tân Thành B	34
9713	Xã Văn Nho	26
9715	Xã Cẩm Châu	26
7820	Xã Hóa Sơn	18
10487	Xã Tân Lập 2	34
2476	Xã Keo Lôm	31
2477	Xã Luân Giới	31
2478	Xã Mường Luân	31
10828	Xã Hiếu Nhơn	30
5858	Xã Huổi Luông	9
5859	Xã Khổng Lào	9
7248	Phường Tây Sơn	14
2562	Xã Mùn Chung	31
2307	Phường An Lộc	34
2632	Xã Ia Dreng	5
2633	Xã Ia Hla	5
2634	Xã Ia Hrú	5
2635	Xã Ia Le	5
2636	Xã Ia Phang	5
2642	Xã Bar Măih	5
10837	Xã Trung An	30
7068	Xã Tam Đình	13
7632	Xã Phú Mỡ	32
7633	Xã Xuân Lãnh	32
7634	Xã Xuân Long	32
7663	Xã Krông Pa	32
7664	Xã Phước Tân	32
7743	Xã Cự Nẫm	18
8432	Xã Đồng Lâm	17
8433	Xã Đồng Sơn	17
3354	Xã Vị Bình	20
7081	Phường Đội Cung	13
9711	Xã Thiết ống	26
7565	Xã Thắng Sơn	15
4363	Phường Yên Phụ	23
1731	Xã Thể Dục	3
2011	Xã Nam Dong	11
1848	Phường Thành Công	32
8624	Xã Triệu Lăng	18
8668	Xã An Thạnh Đông	20
11022	Phường Cầu Thia	10
4552	Phường Lương Khánh Thiện	14
3401	Phường 25	21
2499	Xã Búng Lao	31
3780	Xã Niêm Sơn	28
3782	Xã Pả Vi	28
3784	Xã Sủng Máng	28
3785	Xã Sủng Trà	28
3836	Xã Thuận Hoà	28
3837	Xã Thượng Sơn	28
3838	Xã Trung Thành	28
3839	Xã Tùng Bá	28
3841	Xã Việt Lâm	28
3842	Xã Xín Chải	28
3443	Phường 15	21
2616	Xã Ia Drăng	5
2617	Xã Ia Ga	5
10425	Phường 3	34
10820	Phường 5	30
3393	Phường 14	21
3558	Phường 4	21
3560	Phường 6	21
7187	Xã Kim Hải	14
7200	Xã Yên Lộc	14
7201	Xã Yên Mật	14
7817	Xã Hồng Hóa	18
7231	Phường Nam Bình	14
3624	Phường 15	21
7232	Phường Nam Thành	14
6372	Xã Vĩnh Châu B	29
7662	Xã Eachà Rang	32
3552	Phường 11	21
7230	Phường Đông Thành	14
3568	Phường 14	21
35	Phường Châu Phú A	1
3574	Phường 4	21
1051	Phường Nguyễn Văn Cừ	5
163	Phường 3	4
462	Xã Nguyên Phúc	27
2432	Phường An Hải Đông	25
2389	Xã Thạnh Lợi	34
2598	Xã Hà Tây	5
2599	Xã Hòa Phú	5
2600	Xã Ia Ka	5
2601	Xã Ia Khươl	5
2602	Xã Ia Kreng	5
2603	Thị trấn Ia Ly	5
2604	Xã Ia Mơ Nông	5
2605	Xã Ia Nhin	5
2606	Xã Ia Phí	5
2673	Xã HNol	5
3866	Xã Đường Thượng	28
3867	Xã Hữu Vinh	28
3592	Phường 8	21
3674	Phường Bình Thọ	21
3791	Xã Bát Đại Sơn	28
3792	Xã Cán Tỷ	28
3863	Xã Đông Minh	28
3864	Xã Du Già	28
4249	Xã Hồng Thái	23
7329	Phường Mỹ Bình	8
4678	Phường Trần Phú	6
4717	Xã Sơn Lĩnh	6
4945	Xã Tự Do	15
4981	Xã Liên Sơn	15
5781	Xã Gia Miễn	12
5782	Xã Hồng Thái	12
5365	Thị trấn Thứ Mười Một	1
5466	Phường Vĩnh Quang	1
3597	Phường 12	21
6274	Thị trấn Cần Giuộc	29
6562	Xã Nghĩa Phúc	14
53	Xã Thạnh Mỹ Tây	1
7907	Xã Trà Giáp	25
8150	Xã Ba Dinh	16
5612	Xã Trấn Yên	12
3621	Phường 12	21
3622	Phường 13	21
3623	Phường 14	21
3629	Phường 5	21
3510	Phường 8	21
3527	Phường 9	21
10531	Thị trấn Châu Thành	30
3652	Phường 14	21
5232	Phường Cam Linh	8
7676	Phường Xuân Đài	32
3403	Phường 27	21
3450	Phường 7	21
3660	Phường 8	21
3662	Phường Hiệp Tân	21
804	Xã Hưng Phong	30
3912	Phường Đông Ngạc	23
1855	Xã Ea Ning	32
1856	Xã Ea Tiêu	32
1857	Xã Hòa Hiệp	32
1858	Xã Cư Dliê M'nông	32
1859	Xã Cư M'gar	32
1860	Xã Cư Suê	32
1861	Xã Cuor Đăng	32
1862	Xã Ea D'Rơng	32
2005	Phường Thiện An	32
2061	Thị trấn Đắk Mâm	11
2063	Xã Đắk Sôr	11
2064	Xã Đức Xuyên	11
2631	Xã Ia BLứ	5
2672	Xã Hà Đông	5
2674	Xã Ia Băng	5
2722	Xã Sơ Pai	5
2728	Xã Đắk Kơ Ning	5
2754	Xã Đăk Djrăng	5
7088	Phường Hưng Dũng	13
2910	Xã Kim Xuyên	24
3139	Phường Thượng Lý	24
3612	Phường Tân Kiểng	21
3872	Xã Na Khê	28
4152	Phường Hàng Bồ	23
7102	Phường Trung Đô	13
7129	Xã Quang Thành	13
5272	Xã Khánh Đông	8
5273	Xã Khánh Hiệp	8
5783	Xã Hội Hoan	12
6692	Xã Bình Chuẩn	13
6700	Xã Mậu Đức	13
6701	Xã Môn Sơn	13
5947	Xã Lộc Lâm	11
5948	Xã Lộc Nam	11
5949	Xã Lộc Ngãi	11
5950	Xã Lộc Phú	11
5951	Xã Lộc Quảng	11
5952	Xã Lộc Tân	11
5953	Thị trấn Lộc Thắng	11
5954	Xã Lộc Thành	11
5955	Xã Tân Lạc	11
5956	Thị trấn Cát Tiên	11
5957	Xã Đồng Nai Thượng	11
5970	Xã Đạ Ploa	11
6073	Xã Phú Sơn	11
50	Xã Mỹ Đức	1
3396	Phường 19	21
43	Xã Bình Long	1
10744	Phường Thành Phước	30
11085	Xã Suối Bu	10
11086	Xã Suối Giàng	10
269	Xã Hương Lạc	2
464	Xã Phương Linh	27
519	Xã Tân Sơn	27
520	Xã Thanh Bình	27
521	Xã Thanh Mai	27
7175	Xã Ân Hòa	14
7445	Xã Bản Nguyên	15
6382	Xã Nhơn Ninh	29
11028	Phường Trung Tâm	10
7328	Phường Kinh Dinh	8
7332	Phường Mỹ Hương	8
4855	Xã Cao Sơn	15
7346	Xã Nhị Hà	8
7347	Xã Phước Diêm	8
5608	Xã Tân Hương	12
5609	Xã Tân Lập	12
5610	Xã Tân Thành	12
5611	Xã Tân Tri	12
8238	Phường Chánh Lộ	16
3288	Xã Đông Phước	20
3306	Xã Lương Nghĩa	20
3307	Xã Lương Tâm	20
3309	Xã Thuận Hưng	20
7519	Xã Thu Cúc	15
7520	Xã Thu Ngạc	15
7988	Xã Tân Hiệp	25
7482	Phường Phong Châu	15
7736	Phường 4	32
6818	Xã Mỹ Lý	13
6823	Xã Nậm Cắn	13
7590	Phường Bạch Hạc	15
4123	Phường Thanh Lương	23
19	Thị trấn Chợ Mới	1
7773	Xã Quảng Hải	18
8259	Phường Trần Phú	16
9634	Phường Thắng Lợi	27
7778	Phường Quảng Phong	18
7779	Phường Quảng Phúc	18
40	Phường Vĩnh Ngươn	1
47	Thị trấn Cái Dầu	1
3488	Phường Bến Thành	21
3490	Phường Cầu Ông Lãnh	21
51	Xã Mỹ Phú	1
3502	Phường 14	21
8008	Xã La Dêê	25
8016	Xã Trà Don	25
8017	Xã Trà Leng	25
7665	Xã Sơn Định	32
7977	Phường Cẩm An	25
7986	Phường Sơn Phong	25
3489	Phường Cầu kho	21
1205	Xã Hưng Phước	33
555	Xã Thượng Ân	27
7803	Xã Ngư Thủy Nam	18
7996	Xã Quế Bình	25
11053	Xã Minh Quân	10
11056	Xã Quy Mông	10
11061	Xã Việt Thành	10
11071	Xã Minh An	10
11072	Xã Nậm Búng	10
11073	Xã Nậm Lành	10
11080	Xã Phù Nham	10
11081	Xã Phúc Sơn	10
11082	Xã Sơn A	10
8205	Xã An Bình	16
8005	Xã Đắc Pre	25
8006	Xã Đắc Pring	25
8007	Xã Đắc Tôi	25
8011	Xã Tà Pơơ	25
8013	Xã Zuôich	25
8014	Xã Trà Cang	25
8015	Xã Trà Dơn	25
8356	Xã Cộng Hòa	17
8358	Xã Dương Huy	17
8363	Xã Thanh Lân	17
8364	Xã Đại Bình	17
8366	Xã Đầm Hà (Xã)	17
8367	Xã Dực Yên	17
8368	Xã Quảng An	17
4011	Phường Kim Liên	23
8894	Xã Chiềng Cang	19
10577	Xã Long Hiệp	30
10579	Xã Ngọc Biên	30
10583	Xã Tân Hiệp	30
9568	Xã Tân Long	27
7524	Xã Xuân Sơn	15
7669	Xã Sơn Nguyên	32
9922	Xã Thanh Tân	26
2595	Xã Chư Đăng Ya	5
11007	Thị trấn Yên Thế	10
3634	Phường Hiệp Phú	21
3664	Phường Phú Thạnh	21
8117	Xã Bình Minh	25
10847	Xã Bá Hiến	15
10848	Xã Đạo Đức	15
5385	Xã Hoà Lợi	1
9093	Phường Kim Long	22
1142	Xã Minh Thạnh	21
1968	Xã Tân Tiến	32
9207	Xã Quảng Công	22
1969	Xã Vụ Bổn	32
3573	Phường 3	21
3832	Xã Phương Tiến	28
6902	Xã Nghĩa Sơn	13
6928	Xã Châu Nga	13
6929	Xã Châu Phong	13
4741	Xã Kỳ Lạc	6
4742	Xã Kỳ Lâm	6
9441	Xã Đông Hải	7
4086	Xã Văn Đức	23
5497	Xã Đắk KRoong	16
5498	Xã Đắk Long	16
5499	Xã Đắk Man	16
5500	Xã Đắk Môn	16
5501	Xã Đắk Nhoong	16
5502	Xã Đắk Pék	16
5503	Xã Đắk Plô	16
5504	Xã Mường Hoong	16
5505	Xã Ngọc Linh	16
5506	Xã Xốp	16
3556	Phường 2	21
6012	Phường 7	11
5913	Xã Pắc Ta	9
5583	Xã Ya ly	16
5584	Xã Ya Tăng	16
5585	Xã Ya Xiêr	16
5586	Xã Đắk Hà	16
7069	Xã Tam Hợp	13
7075	Xã Yên Hòa	13
7076	Xã Yên Na	13
9451	Xã Nam Chính	7
2017	Xã Đắk N'Drót	11
2018	Xã Đắk R'La	11
2030	Xã Kiến Thành	11
2031	Xã Nghĩa Thắng	11
2032	Xã Nhân Cơ	11
2033	Xã Nhân Đạo	11
2034	Xã Quảng Tín	11
2035	Xã Đắk Hòa	11
2036	Xã Đắk Môl	11
1529	Phường 4	4
3576	Phường 6	21
7290	Xã Phước Đại	8
4771	Xã ích Hậu	6
3677	Phường Linh Chiểu	21
2223	Xã Hiếu Liêm	33
2225	Xã Phú Lý	33
2226	Xã Tân An	33
2229	Xã Thiện Tân	33
2232	Xã Vĩnh Tân	33
2233	Xã Bảo Hoà	33
2235	Xã Lang Minh	33
2236	Xã Suối Cao	33
2237	Xã Suối Cát	33
2238	Xã Xuân Bắc	33
2240	Xã Xuân Hiệp	33
2241	Xã Xuân Hòa	33
3679	Phường Linh Tây	21
3728	Xã Phố Cáo	28
3811	Xã Tiên Nguyên	28
3827	Xã Ngọc Linh	28
4158	Phường Hàng Mã	23
5461	Phường Rạch Sỏi	1
5860	Xã Lả Nhì Thàng	9
5861	Xã Mồ Sì San	9
6686	Phường Nghi Hương	13
6930	Xã Châu Thắng	13
6931	Xã Châu Thuận	13
7005	Xã Tân Hương	13
1396	Phường Lạc Đạo	11
4837	Xã Hương Minh	6
4838	Xã Hương Quang	6
5425	Xã Lình Huỳnh	1
1794	Thị trấn Hùng Quốc	3
1795	Xã Lưu Ngọc	3
1796	Xã Quốc Toản	3
1800	Xã Tri Phương	3
2159	Xã Phước Bình	33
1799	Xã Quang Vinh	3
1801	Xã Xuân Nội	3
1875	Xã Cư A Mung	32
1885	Xã Ea Tir	32
1897	Xã Ea Ô	32
1929	Xã Hòa Tân	32
8311	Xã Trà Tân	16
1970	Xã Bông Krang	32
1971	Xã Buôn Triết	32
1972	Xã Buôn Tría	32
1973	Xã Đắk Liêng	32
1977	Xã Krông Nô	32
1979	Xã Nam Ka	32
2006	Xã Cư Knia	11
8766	Xã Bắc Ngà	19
10422	Xã Long Thuận	34
10428	Xã Tân Trung	34
10537	Xã Long Hòa	30
10567	Xã Tân Hòa	30
2207	Xã Bình Minh	33
392	Xã Việt Lập	2
5087	Phường Quang Trung	7
1008	Xã Cát Hanh	5
1022	Xã Cát Tường	5
1253	Xã Tân Tiến	33
1254	Xã Thuận Lợi	33
1255	Xã Thuận Phú	33
10197	Xã Xuân Chinh	26
8843	Xã Kim Bon	19
9356	Xã Quỳnh Hồng	7
9461	Xã Nam Trung	7
10640	Xã Yên Thuận	28
10641	Xã Bình An	28
10642	Xã Hồng Quang	28
10643	Xã Khuôn Hà	28
10644	Xã Lăng Can	28
10645	Xã Phúc Yên	28
10646	Xã Thổ Bình	28
3480	Phường 2	21
3482	Phường 4	21
3484	Phường 7	21
2838	Xã Cổ Thành	24
5294	Phường Vạn Thạnh	8
10856	Xã Tân Phong	15
10859	Xã Trung Mỹ	15
10860	Xã Bắc Bình	15
10861	Xã Bàn Giản	15
10862	Xã Đồng ích	15
10868	Xã Liên Hòa	15
10872	Xã Tử Du	15
4115	Phường Lê Đại Hành	23
5893	Xã Tả Phìn	9
9641	Phường Đồng Quang	27
4332	Xã Tân Dân	23
4339	Xã Xuân Giang	23
4341	Xã Cổ Đông	23
3655	Phường 3	21
7321	Xã Quảng Sơn	8
3483	Phường 5	21
3561	Phường 7	21
2076	Xã Quảng Trực	11
4668	Phường Nguyễn Du	6
9538	Thị trấn Chợ Chu	27
3599	Phường 14	21
3600	Phường 2	21
3605	Phường 7	21
3618	Phường 1	21
3577	Phường 8	21
7666	Xã Sơn Hội	32
3625	Phường 16	21
3626	Phường 2	21
6524	Phường Vị Hoàng	14
10090	Xã Thọ Lập	26
3557	Phường 3	21
3569	Phường 15	21
3581	Phường 11	21
3594	Phường 1	21
3602	Phường 4	21
4424	Phường Hạ Đình	23
7874	Phường Hải Thành	18
3586	Phường 2	21
3175	Phường Hồ Nam	24
5231	Phường Cam Lợi	8
4150	Phường Đồng Xuân	23
4151	Phường Hàng Bạc	23
5846	Xã Mường Mô	9
5863	Xã Ma Ly Pho	9
5864	Xã Mù Sang	9
5865	Xã Mường So	9
5866	Xã Nậm Xe	9
5923	Xã Mường Mít	9
5924	Xã Mường Than	9
5925	Xã Pha Mu	9
5926	Xã Phúc Than	9
5927	Xã Tà Gia	9
5928	Xã Tà Hừa	9
5929	Xã Tà Mung	9
6783	Xã Quỳnh Trang	13
6368	Thị trấn Tân Hưng	29
7440	Xã Vô Tranh	15
7672	Xã Suối Bạc	32
7675	Xã Xuân Cảnh	32
4726	Xã Sơn Tây	6
4728	Xã Sơn Thủy	6
4729	Xã Sơn Tiến	6
4740	Xã Kỳ Khang	6
6329	Xã Mỹ Bình	29
10503	Xã Hiệp Hòa	30
10504	Xã Hiệp Mỹ Đông	30
6935	Xã Bắc Sơn	13
6936	Xã Châu Cường	13
6937	Xã Châu Đình	13
6939	Xã Châu Lộc	13
6940	Xã Châu Lý	13
6941	Xã Châu Quang	13
6942	Xã Châu Thái	13
6943	Xã Châu Thành	13
6945	Xã Đồng Hợp	13
6946	Xã Hạ Sơn	13
6952	Xã Tam Hợp	13
6954	Xã Văn Lợi	13
6955	Xã Yên Hợp	13
7382	Xã Yên Dưỡng	15
5448	Thị trấn An Thới	1
5449	Xã Bãi Thơm	1
5450	Xã Cửa Cạn	1
5657	Xã Xuất Lễ	12
7826	Xã Tân Hóa	18
7827	Xã Thượng Hóa	18
7829	Xã Trung Hóa	18
7830	Xã Xuân Hóa	18
8825	Xã Hua Trai	19
10208	Xã Hải Bình	26
6001	Xã Tân Hội	11
6002	Xã Tân Thành	11
10186	Xã Bát Mọt	26
10187	Xã Luận Khê	26
10188	Xã Luận Thành	26
10189	Xã Lương Sơn	26
10190	Xã Ngọc Phụng	26
10358	Xã Thạnh Lộc	34
10043	Phường Quảng Cư	26
9907	Xã Nga Tiến	26
2267	Phường Hoà Thuận	34
2282	Xã An Khánh	34
2287	Xã Phú Hựu	34
2290	Xã Tân Nhuận Đông	34
6421	Xã Tân Lập	29
8116	Xã Bình Lãnh	25
8122	Xã Bình Quế	25
8123	Xã Bình Quý	25
8127	Xã Bình Trung	25
8128	Xã Bình Tú	25
8130	Xã Tiên An	25
8131	Xã Tiên Cảnh	25
8133	Xã Tiên Châu	25
6010	Phường 5	11
8139	Xã Tiên Lãnh	25
8141	Xã Tiên Ngọc	25
8163	Xã Ba Vinh	16
8164	Xã Ba Xa	16
8165	Xã Bình An	16
8167	Xã Bình Châu	16
8171	Xã Bình Hải	16
8172	Xã Bình Hiệp	16
8173	Xã Bình Hòa	16
8174	Xã Bình Khương	16
8175	Xã Bình Long	16
8177	Xã Bình Minh	16
8178	Xã Bình Nguyên	16
8180	Xã Bình Phước	16
8186	Xã Bình Thuận	16
8192	Xã Phổ Châu	16
8193	Xã Phổ Cường	16
8195	Xã Phổ Khánh	16
8198	Xã Phổ Ninh	16
8199	Xã Phổ Phong	16
8227	Xã Hành Đức	16
8230	Xã Hành Nhân	16
8233	Xã Hành Thiện	16
8235	Xã Hành Tín Đông	16
8685	Xã Xuân Hòa	20
5839	Xã Pa Vệ Sử	9
5840	Xã Tá Bạ	9
5841	Xã Tà Tổng	9
5847	Xã Nậm Ban	9
5848	Xã Nậm Chà	9
5849	Xã Nậm Hàng	9
5850	Xã Nậm Manh	9
5898	Xã Bình Lư	9
6754	Xã Hiến Sơn	13
5911	Xã Nậm Cần	9
5912	Xã Nậm Sỏ	9
6019	Xã Đạ K' Nàng	11
6020	Xã Đạ Long	11
6021	Xã Đạ M' Rong	11
6022	Xã Đạ Rsal	11
6023	Xã Đạ Tông	11
6024	Xã Liêng Srônh	11
6025	Xã Phi Liêng	11
6026	Xã Rô Men	11
6027	Xã Bảo Thuận	11
6028	Thị trấn Di Linh	11
6029	Xã Đinh Lạc	11
6030	Xã Đinh Trang Hòa	11
6064	Thị trấn Đinh Văn	11
7239	Phường Phúc Thành	14
1739	Xã Cách Linh	3
1740	Xã Đại Sơn	3
8911	Xã Yên Hưng	19
8912	Xã Bản Lầm	19
5894	Xã Tủa Sín Chải	9
5895	Xã Bản Bo	9
5918	Xã Trung Đồng	9
2485	Xã Tìa Dình	31
10572	Thị trấn Định An (Thị trấn )	30
9893	Xã Nga Liên	26
8087	Phường An Sơn	25
6646	Xã Yên Minh	14
10464	Phường 6	34
10466	Phường 8	34
2747	Xã Ia RSai	5
3118	Phường Hải Thành	24
2716	Xã Kon Pne	5
6362	Phường 7	29
9180	Xã Vinh Giang	22
10193	Thị trấn Thường Xuân	26
10357	Xã Tân Phong	34
7306	Xã An Hải	8
10624	Xã Bằng Cốc	28
8435	Xã Hòa Bình	17
9148	Xã Thượng Lộ	22
3346	Phường I	20
3964	Xã Vật Lại	23
383	Xã Ngọc Vân	2
10608	Xã Nhân Lý	28
10609	Xã Phú Bình	28
10610	Xã Phúc Sơn	28
10615	Xã Tri Phú	28
10616	Xã Trung Hà	28
10617	Xã Trung Hòa	28
10620	Xã Xuân Quang	28
10621	Xã Yên Lập	28
8434	Xã Dân Chủ	17
6520	Phường Trần Hưng Đạo	14
8347	Xã Cẩm Hải	17
8349	Phường Cẩm Sơn	17
8373	Xã Tân Lập	17
8374	Xã An Sinh	17
289	Xã Bảo Sơn	2
291	Xã Bình Sơn	2
292	Xã Cẩm Lý	2
341	Xã Tân Quang	2
342	Xã Tân Sơn	2
343	Xã Thanh Hải	2
344	Xã Trù Hựu	2
348	Xã An Châu (Xã)	2
349	Xã An Lạc	2
3649	Phường 11	21
1358	Xã Hàm Hiệp	11
1359	Xã Hàm Liêm	11
1362	Xã Hàm Trí	11
2749	Xã Krông Năng	5
8888	Xã Chiềng Xôm	19
8889	Xã Hua La	19
8925	Xã Long Hẹ	19
8926	Xã Muội Nọi	19
8927	Xã Mường Bám	19
8947	Xã Mường Tè	19
8948	Xã Quang Minh	19
7092	Phường Lê Lợi	13
11089	Xã Tân Thịnh	10
523	Xã Yên Cư	27
1417	Xã Gia An	11
373	Xã Cao Xá	2
8752	Thị trấn Trần Đề	20
8789	Xã Mường Sang	19
8790	Xã Nà Mường	19
550	Xã Đức Vân	27
554	Xã Thuần Mang	27
8858	Xã Tường Phong	19
3406	Phường 5	21
1328	Xã Đức Chính	11
1329	Xã Đức Hạnh	11
2759	Xã Đê Ar	5
1355	Xã Hồng Sơn	11
1356	Xã Hàm Chính	11
7908	Xã Trà Ka	25
8277	Xã Tịnh Đông	16
8279	Xã Tịnh Hà	16
8280	Xã Tịnh Hiệp	16
8282	Xã Tịnh Phong	16
8283	Xã Tịnh Sơn	16
8284	Xã Tịnh Thọ	16
445	Xã Đông Sơn	2
7100	Phường Quang Trung	13
2730	Xã Đăk Pơ Pho	5
2731	Xã Đăk Song	5
2732	Xã Đăk Tơ Pang	5
2733	Thị trấn Kông Chro	5
2734	Xã Kông Yang	5
2735	Xã SRó	5
2736	Xã Ya Ma	5
2737	Xã Yang Nam	5
2738	Xã Yang Trung	5
2755	Xã Đak Jơ Ta	5
2756	Xã Đak Ta Ley	5
1315	Xã Hồng Thái	11
1321	Xã Phan Lâm	11
1324	Xã Phan Thanh	11
1325	Xã Phan Tiến	11
1326	Xã Sông Bình	11
1327	Xã Sông Lũy	11
1332	Xã Đa Kai	11
1338	Xã Trà Tân	11
1339	Thị trấn Võ Xu	11
1342	Xã Sông Phan	11
1344	Xã Tân Hà	11
2001	Xã Ea Blang	32
1366	Xã Thuận Hòa	11
1367	Xã Thuận Minh	11
1368	Xã Hàm Cần	11
1369	Xã Hàm Cường	11
1370	Xã Hàm Kiệm	11
1371	Xã Hàm Mỹ	11
1372	Xã Hàm Minh	11
1373	Xã Hàm Thạnh	11
1374	Xã Mỹ Thạnh	11
1375	Xã Mương Mán	11
1829	Xã Cư ÊBur	32
5046	Xã Lạc Sỹ	15
5050	Xã Yên Lạc	15
8318	Xã Nghĩa Kỳ	16
8322	Xã Nghĩa Sơn	16
8326	Xã Nghĩa Thương	16
8327	Xã Nghĩa Trung	16
3465	Xã Hiệp Phước	21
4806	Xã Thạch Điền	6
4809	Thị trấn Thạch Hà	6
4811	Xã Thạch Kênh	6
8335	Xã Thanh Lâm	17
8339	Xã Đồng Văn	17
8340	Xã Hoành Mô	17
8341	Xã Húc Động	17
8342	Xã Lục Hồn	17
8343	Xã Tình Húc	17
8344	Xã Vô Ngại	17
9096	Phường Phú Hậu	22
195	Xã Ninh Thạnh Lợi	4
197	Xã Vĩnh Lộc	4
1410	Xã Tam Thanh	11
1415	Xã Đức Tân	11
1416	Xã Đức Thuận	11
303	Xã Lan Mẫu	2
304	Xã Nghĩa Phương	2
311	Xã Trường Sơn	2
312	Xã Vô Tranh	2
314	Xã Yên Sơn	2
315	Xã Biển Động	2
317	Trung tâm huấn lu Cấm Sơn (Trung tâm huấn luyện)	2
318	Xã Cấm Sơn (Xã)	2
320	Xã Đồng Cốc	2
321	Xã Đèo Gia	2
393	Xã Việt Ngọc	2
399	Xã Minh Đức	2
401	Xã Nghĩa Trung	2
405	Xã Tự Lạn	2
407	Xã Thượng Lan	2
412	Xã Việt Tiến	2
8792	Xã Phiêng Luông	19
8793	Xã Quy Hướng	19
8794	Xã Tà Lai	19
513	Xã Hoà Mục	27
514	Xã Mai Lạp	27
515	Xã Như Cố	27
528	Xã Cư Lễ	27
530	Xã Đổng Xá	27
531	Xã Dương Sơn	27
532	Xã Hảo Nghĩa	27
536	Xã Lạng San	27
537	Xã Lam Sơn	27
538	Xã Liêm Thuỷ	27
541	Xã Lương Thượng	27
1449	Xã Thới Đông	20
558	Xã Vân Tùng	27
559	Xã An Thắng	27
560	Xã Bằng Thành	27
563	Xã Cao Tân	27
564	Xã Công Bằng	27
566	Xã Nghiên Loan	27
570	Xã Dương Quang	27
571	Phường Huyền Tụng	27
8829	Xã Mường Trai	19
8830	Xã Nậm Giôn	19
8831	Xã Nậm Păm	19
8832	Xã Ngọc Chiến	19
8844	Xã Mường Bang	19
8845	Xã Mường Cơi	19
8846	Xã Mường Do	19
8847	Xã Mường Lang	19
8848	Xã Mường Thải	19
8849	Xã Nam Phong	19
8851	Xã Quang Huy	19
8852	Xã Sập Xa	19
9872	Xã Minh Tiến	26
9873	Xã Ngọc Khê	26
9875	Xã Ngọc Liên	26
9877	Xã Ngọc Trung	26
9103	Phường Tây Lộc	22
4105	Phường Yết Kiêu	23
1566	Xã Đất Mới	4
1575	Thị trấn Rạch Gốc	4
1804	Xã Chí Viễn	3
1805	Xã Đức Hồng	3
1806	Xã Đàm Thuỷ	3
1811	Xã Lăng Hiếu	3
620	Thị trấn Thứa	2
622	Xã Trung Chính	2
4122	Phường Quỳnh Mai	23
7995	Xã Phước Trà	25
8001	Xã Thăng Phước	25
8002	Xã Cà Dy	25
1606	Xã Khánh Hải	4
1607	Xã Khánh Hưng	4
1609	Xã Lợi An	4
1688	Xã Phù Ngọc	3
1689	Xã Quý Quân	3
1690	Xã Sĩ Hai	3
1691	Xã Sóc Hà	3
1692	Xã Tổng Cọt	3
1693	Xã Thượng Thôn	3
1694	Xã Trường Hà	3
1700	Xã Bình Dương	3
1706	Xã Dân Chủ	3
1707	Xã Hồng Nam	3
1736	Xã Triệu Nguyên	3
10581	Xã Phước Hưng	30
1744	Xã Mỹ Hưng	3
1746	Xã Tiên Thành	3
1747	Xã Triệu ẩu	3
1749	Xã Cai Bộ	3
1750	Xã Chí Thảo	3
1751	Xã Độc Lập	3
1753	Xã Hạnh Phúc	3
1754	Xã Hồng Định	3
1755	Xã Hồng Quang	3
1756	Xã Hoàng Hải	3
1757	Xã Ngọc Động	3
1758	Xã Phi Hải	3
1760	Xã Quảng Hưng	3
2886	Phường Nguyễn Trãi	24
6814	Xã Hữu Kiệm	13
1824	Xã Ea Huar	32
1825	Xã Ea Nuôl	32
1826	Xã Ea Wer	32
1827	Xã Krông Na	32
1851	Xã Dray Bhăng	32
1852	Xã Ea BHốk	32
1864	Xã Ea Kiết	32
8569	Xã Hải An	18
7192	Xã Lưu Phương	14
7294	Xã Phước Thành	8
7295	Xã Phước Tiến	8
3330	Thị trấn Búng Tàu	20
10757	Xã An Bình	30
446	Xã Hồng Kỳ	2
4978	Xã Hợp Thanh	15
5030	Xã Phú Cường	15
5047	Xã Lạc Thịnh	15
1900	Xã Ea Sô	32
1901	Xã Ea Tih	32
1902	Xã Xuân Phú	32
1903	Xã Cư KBang	32
1904	Xã Cư M'Lan	32
1905	Xã Ea Bung	32
1906	Xã Ea Lê	32
1907	Xã Ea Rốk	32
1908	Thị trấn Ea Súp	32
1909	Xã Ia JLơi	32
1981	Xã Cư K Róa	32
1982	Xã Cư M'ta	32
1983	Xã Cư Prao	32
1984	Xã Cư San	32
1985	Xã Ea H'MLay	32
1986	Xã Ea Lai	32
1987	Xã Ea M' Doal	32
1997	Xã Bình Thuận	32
1998	Xã Cư Bao	32
5299	Xã Vĩnh Lương	8
5301	Phường Vĩnh Nguyên	8
5303	Xã Vĩnh Phương	8
5306	Xã Vĩnh Thái	8
5309	Phường Xương Huân	8
1390	Phường Bình Hưng	11
2050	Xã Quảng Sơn	11
2051	Xã Đắk Nia	11
2052	Xã Đăk R'Moan	11
2053	Phường Nghĩa Đức	11
2012	Xã Tâm Thắng	11
2013	Xã Trúc Sơn	11
2028	Xã Hưng Bình	11
2081	Phường Bình Đa	33
7300	Xã Phương Hải	8
7304	Xã Vĩnh Hải	8
7312	Xã Phước Thái	8
7314	Xã Phước Vinh	8
2106	Phường Trung Dũng	33
2131	Xã Suối Nho	33
2132	Xã Thanh Sơn	33
2148	Phường Xuân Trung	33
2154	Xã Lộc An	33
2155	Xã Long An	33
2163	Xã Tân Hiệp	33
2170	Xã Phú Hữu	33
6999	Xã Nghĩa Hoàn	13
7000	Xã Nghĩa Phúc	13
7001	Xã Nghĩa Thái	13
7002	Xã Phú Sơn	13
7003	Xã Tân An	13
7004	Xã Tân Hợp	13
390	Xã Song Vân	2
2210	Xã Đông Hoà	33
8791	Thị trấn NT Mộc Châu	19
8823	Xã Chiềng Muôn	19
5281	Xã Sơn Thái	8
2611	Xã Bình Giáo	5
5899	Xã Giang Ma	9
5901	Xã Khun Há	9
2836	Xã Bắc An	24
7179	Xã Chính Tâm	14
10100	Xã Xuân Châu	26
215	Thị trấn Châu Hưng	4
216	Xã Châu Hưng A	4
217	Xã Châu Thới	4
218	Xã Hưng Hội	4
219	Xã Hưng Thành	4
2394	Phường Hòa Thọ Đông	25
2433	Phường An Hải Tây	25
10827	Xã Hiếu Nghĩa	30
2504	Xã Ngối Cáy	31
2505	Xã Xuân Lao	31
2506	Xã Hừa Ngài	31
2507	Xã Huổi Lèng	31
2511	Xã Mường Tùng	31
2554	Xã Lay Nưa	31
2556	Phường Sông Đà	31
10489	Xã Thạnh Mỹ	34
10495	Xã Hoà Tân	30
10497	Xã Phong Phú	30
10498	Xã Phong Thạnh	30
10836	Xã Thanh Bình	30
2667	Xã Đăk Sơmei	5
2677	Xã Kon Gang	5
2680	Xã Trang	5
2681	Xã An Thành	5
2682	Xã Cư An	5
2683	Thị trấn Đak Pơ	5
2684	Xã Hà Tam	5
2685	Xã Phú An	5
2713	Xã Đak SMar	5
2714	Xã Đông	5
7045	Xã Thanh Mỹ	13
7046	Xã Thanh Mai	13
7055	Xã Thanh Tùng	13
7057	Xã Thanh Xuân	13
7059	Xã Võ Liệt	13
7061	Xã Hữu Khuông	13
7063	Xã Lưỡng Minh	13
7064	Xã Lưu Kiền	13
3333	Xã Hòa An	20
3336	Xã Long Thạnh	20
4818	Xã Thạch Ngọc	6
4819	Xã Thạch Sơn	6
4827	Xã Thạch Xuân	6
4835	Xã Đức Lĩnh	6
4840	Xã Sơn Thọ	6
4841	Thị trấn Vũ Quang	6
4842	Xã Bắc Phong	15
4844	Thị trấn Cao Phong	15
4849	Xã Tây Phong	15
4850	Xã Thu Phong	15
4851	Xã Thung Nai	15
888	Xã Quảng Thành	21
889	Xã Sơn Bình	21
3173	Phường Dư Hàng	24
5464	Phường Vĩnh Lạc	1
3352	Phường VII	20
871	Phường Long Tâm	21
2508	Xã Huổi Mí	31
2509	Xã Ma Thì Hồ	31
2559	Xã Mường Khong	31
2560	Xã Mường Mùn	31
2592	Xã Ia RTô	5
3757	Xã Nậm Khòa	28
3758	Xã Nậm Tỵ	28
3766	Xã Tụ Nhân	28
3767	Xã Tân Tiến	28
3768	Xã Thàng Tín	28
3770	Xã Thông Nguyên	28
3771	Xã Túng Sán	28
3774	Xã Giàng Chu Phìn	28
3775	Xã Khâu Vai	28
3799	Xã Tả Ván	28
3801	Xã Thái An	28
3802	Xã Thanh Vân	28
3803	Xã Tùng Vài	28
3805	Xã Bằng Lang	28
3806	Xã Hương Sơn	28
3808	Xã Tân Bắc	28
3809	Xã Tân Nam	28
3810	Xã Tân Trịnh	28
3816	Thị trấn Yên Bình	28
3817	Xã Yên Hà	28
3818	Xã Yên Thành	28
3819	Xã Bạch Ngọc	28
3820	Xã Cao Bồ	28
3821	Xã Đạo Đức	28
3980	Xã Đông Sơn	23
3986	Xã Hoàng Văn Thụ	23
3988	Xã Mỹ Lương	23
3989	Xã Nam Phương Tiến	23
3991	Xã Phụng Châu	23
3996	Xã Tân Tiến	23
8020	Xã Trà Nam	25
4018	Phường Phương Mai	23
4110	Phường Bùi Thị Xuân	23
7099	Phường Quán Bàu	13
7108	Xã Đồng Thành	13
7117	Xã Kim Thành	13
7118	Xã Lăng Thành	13
7122	Xã Mỹ Thành	13
9023	Xã Mỏ Công	29
9127	Xã Hải Dương	22
11083	Xã Sơn Lương	10
11084	Xã Sơn Thịnh	10
1060	Phường Thị Nại	5
873	Phường Phước Hiệp	21
875	Phường Phước Nguyên	21
916	Xã Tân Hòa	21
5534	Xã Hiếu	16
15	Xã Vĩnh Lộc	1
5615	Xã Vũ Lăng	12
5619	Xã Hồng Phong	12
1034	Xã Mỹ Lợi	5
1035	Xã Mỹ Phong	5
1036	Xã Mỹ Quang	5
1037	Xã Mỹ Tài	5
1039	Xã Mỹ Thọ	5
1040	Xã Mỹ Thành	5
1041	Xã Mỹ Trinh	5
1042	Thị trấn Phù Mỹ	5
1043	Phường Bùi Thị Xuân	5
1054	Xã Nhơn Hải	5
1056	Xã Nhơn Lý	5
1058	Xã Phước Mỹ	5
1064	Xã Bình Hòa	5
1065	Xã Bình Nghi	5
1066	Xã Bình Tân	5
1067	Xã Bình Thành	5
1068	Xã Bình Thuận	5
5772	Xã Tân Minh	12
5773	Xã Tân Tiến	12
5774	Xã Tân Yên	12
5776	Xã Tri Phương	12
38	Xã Vĩnh Châu	1
5921	Xã Mường Cang	9
5922	Xã Mường Kim	9
5932	Xã Đại Lào	11
5933	Xã Đạm Bri	11
5934	Xã Lộc Châu	11
5935	Xã Lộc Nga	11
5936	Phường Lộc Phát	11
5963	Xã Phước Cát 2	11
5965	Xã Tiên Hoàng	11
5966	Xã Tư Nghĩa	11
5967	Thị trấn Đạ M'ri (Thị trấn )	11
5968	Xã Đạ M'ri (Xã)	11
10092	Xã Thọ Lâm	26
10098	Xã Thọ Xương	26
4078	Xã Kim Lan	23
4120	Phường Phố Huế	23
4167	Phường Giáp Bát	23
4890	Xã Độc Lập	15
4891	Xã Dân Hạ	15
4893	Xã Hợp Thịnh	15
4185	Phường Ngọc Lâm	23
9579	Xã Minh Đức	27
9581	Xã Phúc Tân	27
9582	Xã Phúc Thuận	27
9583	Xã Tân Hương	27
9585	Xã Thành Công	27
32	Thị trấn Mỹ Luông	1
25	Xã Long Điền A	1
58	Xã Bình Thạnh	1
117	Phường Long Hưng	1
120	Phường Long Thạnh	1
6277	Xã Long Hậu	29
6283	Xã Phước Lâm	29
640	Xã Phương Liễu	2
642	Xã Việt Hùng	2
668	Xã Ninh Xá	2
8575	Xã Hải Lâm	18
8577	Xã Hải Phú	18
8593	Xã Hướng Lập	18
8595	Xã Hướng Linh	18
8596	Xã Hướng Phùng	18
713	Phường 3	30
8749	Xã Tài Văn	20
466	Xã Quang Thuận	27
467	Xã Sĩ Bình	27
496	Xã Lương Bằng	27
567	Xã Nhạn Môn	27
568	Xã Xuân La	27
758	Xã Thạnh Trị	30
1433	Xã Phú Lạc	11
863	Xã Thạnh Hải	30
864	Xã Thạnh Phong	30
867	Xã Hòa Long	21
868	Phường Kim Dinh	21
4294	Xã Cấn Hữu	23
4297	Xã Đồng Quang	23
1419	Xã Huy Khiêm	11
1420	Thị trấn Lạc Tánh	11
1421	Xã La Ngâu	11
2676	Xã K' Dang	5
2693	Xã Ia Hrung	5
2729	Xã Đăk Pling	5
4316	Xã Bắc Sơn	23
4319	Xã Hồng Kỳ	23
4322	Xã Mai Đình	23
4323	Xã Minh Phú	23
4365	Xã Bình Yên	23
4366	Xã Cần Kiệm	23
11076	Xã Nghĩa Tâm	10
11077	Thị trấn NT Liên Sơn	10
11078	Thị trấn NT Nghĩa Lộ	10
11079	Thị trấn NT Trần Phú	10
1817	Xã Phong Nậm	3
1818	Xã Thân Giáp	3
1831	Phường Ea Tam	32
1863	Xã Ea H'đinh	32
1891	Xã Cư Prông	32
1892	Xã Cư Yang	32
1893	Xã Ea Đar	32
1894	Thị trấn Ea Kar	32
1895	Xã Ea Kmút	32
476	Xã Chu Hương	27
477	Xã Địa Linh	27
479	Xã Hà Hiệu	27
481	Xã Khang Ninh	27
482	Xã Mỹ Phương	27
483	Xã Nam Mẫu	27
484	Xã Phúc Lộc	27
485	Xã Quảng Khê	27
486	Xã Thượng Giáo	27
487	Xã Yến Dương	27
488	Xã Bản Thi	27
489	Xã Bằng Lãng	27
490	Thị trấn Bằng Lũng	27
501	Xã Phương Viên	27
11100	Xã Đông An	10
11106	Xã Mậu Đông	10
11107	Xã Mỏ Vàng	10
11108	Xã Nà Hẩu	10
11109	Xã Ngòi A	10
11110	Xã Phong Dụ Hạ	10
11111	Xã Phong Dụ Thượng	10
11112	Xã Quang Minh	10
11113	Xã Tân Hợp	10
11116	Xã Xuân Tầm	10
11120	Xã Yên Thái	10
4798	Xã Xuân Yên	6
4799	Xã Bắc Sơn	6
4801	Xã Ngọc Sơn	6
783	Xã Phú An Hòa	30
4902	Thị trấn Bo	15
947	Xã Tân Lâm	21
948	Xã Xuyên Mộc	21
949	Xã An Dũng	5
953	Xã An Nghĩa	5
954	Xã An Quang	5
955	Xã An Tân	5
956	Xã An Toàn	5
957	Xã An Trung	5
958	Xã An Vinh	5
961	Xã Nhơn An	5
962	Xã Nhơn Hạnh	5
964	Phường Nhơn Hoà	5
5473	Xã Tân Hiệp A	1
825	Xã Tân Bình	30
828	Xã Tân Thanh Tây	30
830	Xã Thành An	30
839	Xã Đa Phước Hội	30
847	Xã Thành Thới A	30
851	Xã An Quy	30
8895	Xã Chiềng En	19
8896	Xã Chiềng Khoong	19
8897	Xã Chiềng Khương	19
1499	Xã Đông Bình	20
2475	Xã Háng Lìa	31
5554	Xã Ia Chim	16
5566	Xã Vinh Quang	16
5567	Xã Đắk Ang	16
898	Xã Long Tân	21
7733	Phường 1	32
5489	Xã Tân Thuận	1
5520	Xã Đắk Trăm	16
5521	Xã Diên Bình	16
5529	Xã Ia Tơi	16
5530	Xã Đắk Long	16
5531	Xã Đắk Nên	16
5532	Xã Đắk Ring	16
8608	Xã Thanh	18
5592	Xã Ngọk Lây	16
5593	Xã Ngok Yêu	16
5595	Xã Tu Mơ Rông	16
5596	Xã Văn Xuôi	16
6480	Xã Hải Sơn	14
981	Xã Ân Sơn	5
985	Xã Ân Tường Tây	5
986	Xã Bok Tới	5
987	Xã Dak Mang	5
990	Xã Hoài Châu	5
991	Xã Hoài Châu Bắc	5
992	Xã Hoài Đức	5
994	Xã Hoài Hảo	5
996	Xã Hoài Mỹ	5
997	Xã Hoài Phú	5
998	Xã Hoài Sơn	5
999	Xã Hoài Tân	5
1003	Thị trấn Tam Quan	5
1006	Xã Cát Chánh	5
1007	Xã Cát Hải	5
1019	Xã Cát Thành	5
1021	Xã Cát Trinh	5
1025	Xã Mỹ An	5
1048	Phường Lê Lợi	5
1073	Xã Tây Giang	5
1074	Xã Tây Phú	5
1075	Xã Tây Thuận	5
1077	Xã Tây Xuân	5
1078	Xã Vĩnh An	5
1080	Xã Phước An	5
1081	Xã Phước Hiệp	5
1082	Xã Phước Hòa	5
1083	Xã Phước Hưng	5
1086	Xã Phước Quang	5
1087	Xã Phước Sơn	5
1088	Xã Phước Thắng	5
1089	Xã Phước Thành	5
1099	Xã Vĩnh Hảo	5
1100	Xã Vĩnh Hiệp	5
1104	Xã Vĩnh Sơn	5
1106	Xã Vĩnh Thịnh	5
5807	Xã Phú Mỹ	12
6484	Xã Hải Toàn	14
3187	Phường Đổng Quốc Bình	24
1278	Xã Lộc Điền	33
1281	Xã Lộc Hưng	33
1282	Xã Lộc Khánh	33
1285	Xã Lộc Quang	33
1290	Xã Lộc Thành	33
1291	Xã Lộc Thiện	33
1294	Xã Bình Tân	33
1295	Xã Bù Nho	33
1296	Xã Long Bình	33
1297	Xã Long Hà	33
1298	Xã Long Hưng	33
1299	Xã Long Tân	33
1306	Phường Phước Bình	33
1307	Xã Phước Tín	33
1308	Phường Sơn Giang	33
5828	Xã San Thàng	9
5830	Xã Bum Nưa	9
5831	Xã Bum Tở	9
5832	Xã Ka Lăng	9
36	Phường Châu Phú B	1
37	Phường Núi Sam	1
3189	Phường Gia Viên	24
6043	Xã Tân Lâm	11
9948	Xã Công Bình	26
6047	Xã Đạ Ròn	11
6048	Xã Ka Đô	11
6049	Xã Ka Đơn	11
6050	Xã Lạc Lâm	11
6051	Xã Lạc Xuân	11
6052	Xã Pró	11
6053	Xã Quảng Lập	11
6054	Thị trấn Thạnh Mỹ	11
6055	Xã Tu Tra	11
6056	Xã Đạ Chais	11
6057	Xã Đạ Nhim	11
6058	Xã Đạ Sar	11
6059	Xã Đưng KNớ	11
6060	Thị trấn Lạc Dương	11
6061	Xã Lát	11
6074	Xã Phúc Thọ	11
9550	Xã Quy Kỳ	27
9552	Xã Tân Dương	27
9553	Xã Tân Thịnh	27
9557	Xã Cây Thị	27
9558	Xã Hợp Tiến	27
9560	Xã Hóa Thượng	27
9564	Xã Nam Hòa	27
9566	Thị trấn Sông Cầu	27
9567	Xã Tân Lợi	27
9570	Xã Văn Hán	27
6489	Thị trấn Thịnh Long	14
7636	Xã Xuân Quang 1	32
9707	Xã Lương Trung	26
99	Xã An Cư	1
2628	Xã Ia Vê	5
108	Xã Tân Lập	1
52	Xã Ô Long Vỹ	1
170	Xã An Trạch	4
176	Xã Long Điền	4
243	Xã Đức Thắng	2
247	Xã Hợp Thịnh	2
9722	Xã Cẩm Phú	26
255	Xã Lương Phong	2
694	Xã Hòa Tiến	2
9931	Xã Bình Lương	26
9936	Xã Thanh Hòa	26
936	Xã Bàu Lâm	21
945	Xã Phước Tân	21
6476	Xã Hải Phú	14
4348	Xã Sơn Đông	23
4350	Xã Thanh Mỹ	23
4351	Phường Trung Hưng	23
7624	Xã Thượng Long	15
7625	Xã Trung Sơn	15
4626	Xã Vĩnh Lộc	6
4983	Thị trấn Lương Sơn	15
4986	Xã Tân Vinh	15
4987	Xã Thành Lập	15
7867	Phường Bắc Nghĩa	18
5250	Xã Diên Lâm	8
5253	Xã Diên Sơn	8
7873	Phường Hải Đình	18
7877	Xã Nghĩa Ninh	18
6824	Xã Nậm Càn	13
6825	Xã Na Loi	13
6826	Xã Na Ngoi	13
6827	Xã Phà Đánh	13
6976	Xã Quỳnh Tam	13
6977	Xã Quỳnh Tân	13
6979	Xã Quỳnh Thắng	13
6986	Xã Tân Sơn	13
6987	Xã Tân Thắng	13
6989	Xã Đồng Văn	13
6990	Xã Giai Xuân	13
6993	Xã Kỳ Tân	13
7015	Xã Nghĩa Mỹ	13
7016	Xã Nghĩa Thuận	13
7017	Xã Nghĩa Tiến	13
7020	Xã Tây Hiếu	13
7023	Xã Hạnh Lâm	13
7024	Xã Ngọc Lâm	13
7025	Xã Ngọc Sơn	13
7856	Xã Quảng Lưu	18
7857	Xã Quảng Phú	18
7859	Xã Quảng Thạch	18
7861	Xã Quảng Tiến	18
7508	Xã Đồng Sơn	15
7510	Xã Kim Thượng	15
7512	Xã Long Cốc	15
6665	Xã Cẩm Sơn	13
6666	Xã Cao Sơn	13
6667	Xã Đỉnh Sơn	13
6668	Xã Đức Sơn	13
4320	Xã Hiền Ninh	23
6894	Xã Nghĩa Lộc	13
6895	Xã Nghĩa Lợi	13
6896	Xã Nghĩa Lâm	13
7878	Phường Phú Hải	18
3179	Phường Nghĩa Xá	24
8047	Xã Tam Xuân II	25
7729	Xã Hòa Kiến	32
7499	Xã Tề Lễ	15
7500	Xã Tứ Mỹ	15
7644	Xã Hòa Tâm	32
7645	Xã Hòa Tân Đông	32
7653	Xã Hòa Định Tây	32
7654	Xã Hòa Hội	32
7655	Xã Hòa Quang Bắc	32
7656	Xã Hòa Quang Nam	32
7723	Xã An Thọ	32
3178	Phường Lam Sơn	24
3181	Phường Trại Cau	24
8039	Xã Tam Mỹ Tây	25
8043	Xã Tam Thạnh	25
8045	Xã Tam Trà	25
2440	Phường Hòa Khê	25
2464	Xã Pom Lót	31
1144	Xã Thanh Tuyền	21
9022	Xã Hòa Hiệp	29
9025	Xã Tân Bình	29
9026	Xã Tân Lập	29
9027	Xã Tân Phong	29
9028	Xã Thạnh Bắc	29
9029	Xã Thạnh Bình	29
9611	Xã Động Đạt	27
10108	Xã Xuân Minh	26
10110	Xã Xuân Phú	26
10112	Xã Xuân Sơn	26
10114	Xã Xuân Thắng	26
10117	Xã Xuân Tín	26
10170	Xã Thiệu Ngọc	26
9246	Xã Hồng Việt	7
9264	Xã Chí Hòa	7
9333	Xã An ấp	7
9503	Xã An Khánh	27
9602	Xã Tân Hòa	27
9603	Xã Tân Khánh	27
9604	Xã Tân Kim	27
9605	Xã Tân Thành	27
9666	Phường Trưng Vương	27
10730	Xã Thắng Quân	28
10060	Xã Thạch Quảng	26
10061	Xã Thạch Sơn	26
10072	Xã Thành Tân	26
10073	Xã Thành Thọ	26
10033	Xã Sơn Lư	26
10034	Xã Sơn Thủy	26
10035	Xã Tam Lư	26
10036	Xã Tam Thanh	26
10054	Xã Thạch Bình	26
10055	Xã Thạch Cẩm	26
10057	Xã Thạch Đồng	26
10058	Xã Thạch Lâm	26
10303	Thị trấn Thống Nhất	26
10311	Xã Yên Phú	26
10405	Xã Nhị Bình	34
10412	Xã Tân Lý Đông	34
10897	Xã Lãng Công	15
10899	Xã Nhân Đạo	15
10906	Xã Yên Thạch	15
10908	Xã Đại Đình	15
10909	Xã Đạo Trù	15
10911	Xã Hợp Châu	15
10914	Xã Tam Quan	15
7953	Xã A Ting	25
7997	Xã Quế Lưu	25
7998	Xã Quế Thọ	25
7999	Xã Sông Trà	25
11019	Xã Nậm Có	10
11020	Xã Nậm Khắt	10
11021	Xã Púng Luông	10
11032	Xã Làng Nhì	10
11033	Xã Pá Hu	10
11034	Xã Pá Lau	10
11035	Xã Phình Hồ	10
11036	Xã Tà Si Láng	10
3184	Phường Cầu Đất	24
7558	Xã Khả Cửu	15
3190	Phường Lạc Viên	24
3390	Phường 11	21
71	Phường Mỹ Bình	1
8682	Xã Phong Nẫm	20
1528	Phường 2	4
8531	Xã Hải Phúc	18
8532	Xã Hướng Hiệp	18
8533	Xã Húc Nghì	18
137	Xã Thoại Giang	1
8806	Xã Chiềng Sung	19
8807	Xã Chiềng Ve	19
8808	Xã Cò Nòi	19
8809	Thị trấn Hát Lót (Thị trấn )	19
139	Xã Vọng Thê	1
8772	Xã Háng Đồng	19
8773	Xã Hua Nhàn	19
8898	Xã Chiềng Phung	19
8899	Xã Chiềng Sơ	19
8900	Xã Đứa Mòn	19
8901	Xã Huổi Một	19
8909	Xã Pú Pẩu	19
8916	Xã Chiềng La	19
8917	Xã Chiềng Ly	19
133	Thị trấn óc Eo	1
126	Xã Vĩnh Xương	1
132	Thị trấn Núi Sập	1
4013	Phường Láng Thượng	23
183	Xã Phong Thạnh	4
8648	Xã Vĩnh Ô	18
229	Phường Mỹ Độ	2
237	Phường Trần Phú	2
9105	Phường Thuận Lộc	22
3	Thị trấn An Phú	1
4	Xã Đa Phước	1
3524	Phường 6	21
8879	Xã Sốp Cộp	19
8880	Xã Sam Kha	19
8803	Xã Chiềng Mai	19
8804	Xã Chiềng Mung	19
8805	Xã Chiềng Nơi	19
8771	Xã Hang Chú	19
3192	Phường Lê Lợi	24
8951	Xã Tân Xuân	19
1062	Phường Trần Phú	5
9188	Xã Phú Diên	22
8779	Xã Tạ Khoa	19
8796	Xã Tân Lập	19
8797	Xã Chiềng Ban	19
8798	Xã Chiềng Chăn	19
8799	Xã Chiềng Chung	19
8800	Xã Chiềng Dong	19
8801	Xã Chiềng Kheo	19
8802	Xã Chiềng Lương	19
592	Phường Vệ An	2
1439	Phường Bùi Hữu Nghĩa	20
8768	Xã Chiềng Sại	19
8769	Xã Chim Vàn	19
8770	Xã Hồng Ngài	19
8864	Xã Chiềng Khay	19
8865	Xã Chiềng Khoang	19
8866	Xã Chiềng Ơn	19
8867	Xã Mường Chiên	19
8868	Xã Mường Giàng	19
8869	Xã Mường Giôn	19
8870	Xã Mường Sại	19
8871	Xã Nậm ét	19
8872	Xã Pá Ma Pha Khinh	19
8873	Xã Dồm Cang	19
8874	Xã Mường Lạn	19
8875	Xã Mường Lèo	19
8949	Xã Song Khủa	19
8950	Xã Suối Bàng	19
3928	Phường Ngọc Hà	23
3932	Phường Quán Thánh	23
9689	Phường Phú Sơn	26
2398	Phường Bình Hiên	25
2399	Phường Bình Thuận	25
1472	Phường Tân An	20
751	Xã Long Định	30
5	Xã Khánh An	1
9572	Phường Bắc Sơn	27
9677	Xã Phương Giao	27
9678	Xã Sảng Mộc	27
9680	Xã Thượng Nung	27
9681	Xã Tràng Xá	27
2442	Phường Tân Chính	25
2443	Phường Thạc Gián	25
6482	Xã Hải Tây	14
4432	Phường Thanh Xuân Nam	23
1593	Xã Tân Bằng	4
9978	Xã Vạn Thiện	26
9513	Xã Ký Phú	27
4022	Phường Thổ Quan	23
3937	Xã Ba Vì	23
3938	Xã Cẩm Lĩnh	23
9881	Xã Phùng Minh	26
8463	Phường Đông Mai	17
8466	Xã Hoàng Tân	17
4203	Xã Hợp Tiến	23
4205	Xã Hương Sơn	23
7050	Xã Thanh Sơn	13
8469	Phường Minh Thành	17
10700	Phường Minh Xuân	28
4869	Xã Tiền Phong	15
4905	Xã Đú Sáng	15
5451	Xã Cửa Dương	1
4026	Phường Văn Chương	23
5626	Xã Mông Ân	12
5790	Xã Tân Mỹ	12
5920	Xã Khoen On	9
6042	Xã Tân Châu	11
9548	Xã Phượng Tiến	27
2097	Phường Tân Hiệp	33
2103	Phường Thống Nhất	33
9621	Xã Yên Đổ	27
9622	Xã Yên Lạc	27
9623	Xã Yên Ninh	27
10176	Xã Thiệu Tân	26
1646	Xã Quảng Lâm	3
3298	Thị trấn Một Ngàn	20
9674	Xã Liên Minh	27
9675	Xã Nghinh Tường	27
9676	Xã Phú Thượng	27
3342	Xã Tân Phước Hưng	20
2408	Phường Thạch Thang	25
4113	Phường Đồng Nhân	23
2791	Phường Tây Sơn	5
4097	Phường Nguyễn Trãi	23
2846	Xã Kênh Giang	24
9918	Xã Phú Nhuận	26
9919	Xã Phượng Nghi	26
4109	Phường Bách Khoa	23
3394	Phường 15	21
4112	Phường Đống Mác	23
3005	Xã Ngọc Sơn	24
4118	Phường Nguyễn Du	23
3476	Phường 13	21
1640	Xã Đức Hạnh	3
1641	Xã Lý Bôn	3
1643	Xã Nam Cao	3
4119	Phường Phạm Đình Hổ	23
3666	Phường Phú Trung	21
1639	Xã Xuân Trường	3
10658	Xã Thượng Giáp	28
3669	Phường Tân Sơn Nhì	21
2112	Xã Sông Ray	33
2113	Xã Thừa Đức	33
2114	Xã Xuân Bảo	33
2115	Xã Xuân Đông	33
3106	Xã Văn Phong	24
3670	Phường Tân Thới Hoà	21
4124	Phường Thanh Nhàn	23
10669	Xã Hợp Hòa	28
444	Xã Đồng Vương	2
450	Xã Tam Tiến	2
6393	Xã Đức Tân	29
3122	Phường Cát Bi	24
10202	Xã Yên Nhân	26
3170	Phường An Dương	24
3222	Thị trấn Núi Đèo	24
3228	Xã Tân Dương	24
2407	Phường Phước Ninh	25
3340	Xã Tân Bình	20
3381	Phường Bình Hưng Hòa	21
2151	Xã Bình An	33
2152	Xã Bình Sơn	33
2346	Xã An Long	34
4553	Phường Minh Khai	14
7181	Xã Đồng Hướng	14
7735	Phường 3	32
62	Xã Vĩnh An	1
3496	Phường Tân Định	21
1565	Xã Trần Phán	4
1578	Xã Tân Ân Tây	4
1813	Xã Ngọc Chung	3
7994	Xã Phước Gia	25
3798	Xã Quyết Tiến	28
3874	Xã Ngam La	28
3876	Xã Sủng Thài	28
7091	Phường Hưng Phúc	13
3578	Phường 9	21
3598	Phường 13	21
7987	Phường Tân An	25
3619	Phường 10	21
3550	Phường 1	21
3135	Phường Phan Bội Châu	24
3395	Phường 17	21
3718	Xã Vĩnh Phúc	28
3793	Xã Cao Mã Pờ	28
4162	Phường Phúc Tân	23
4227	Xã Tiến Thắng	23
5653	Xã Tân Thành	12
4792	Xã Xuân Lĩnh	6
6514	Phường Ngô Quyền	14
4746	Xã Kỳ Tân	6
7891	Xã Nam Hóa	18
7909	Xã Trà Kót	25
8352	Phường Cẩm Thịnh	17
4774	Xã Tân Lộc	6
5436	Xã An Sơn	1
2401	Phường Hải Châu II	25
2472	Xã Thanh Yên	31
2473	Xã Chiềng Sơ	31
6525	Phường Vị Xuyên	14
6538	Xã Nam Lợi	14
6794	Thị trấn Hưng Nguyên	13
6906	Xã Nghĩa Thọ	13
7822	Xã Hóa Tiến	18
7823	Xã Minh Hóa	18
7883	Xã Đồng Hóa	18
8244	Xã Nghĩa Hà	16
10587	Xã Long Đức	30
8258	Phường Trần Hưng Đạo	16
8262	Xã Sơn Ba	16
8263	Xã Sơn Bao	16
8264	Xã Sơn Cao	16
8268	Xã Sơn Kỳ	16
8269	Xã Sơn Linh	16
8924	Xã Liệp Tè	19
10191	Xã Tân Thành	26
5904	Xã Sơn Bình	9
8303	Xã Trà Xinh	16
8458	Xã Vạn Ninh	17
9150	Xã Thượng Nhật	22
9151	Xã Thượng Quảng	22
9157	Xã Phong An	22
9158	Xã Phong Bình	22
10122	Phường Ba Đình	26
1645	Thị trấn Pác Miầu	3
1648	Xã Thạch Lâm	3
10196	Xã Xuân Cao	26
1650	Xã Thái Sơn	3
1651	Xã Vĩnh Phong	3
1683	Xã Kéo Yên	3
1684	Xã Lũng Nặm	3
1685	Xã Mã Ba	3
1686	Xã Nội Thôn	3
1776	Xã Thị Ngân	3
1777	Xã Thụy Hùng	3
1778	Xã Thái Cường	3
1779	Xã Trọng Con	3
5019	Xã Gia Mô	15
5022	Xã Mỹ Hòa	15
5023	Xã Mãn Đức	15
5025	Xã Nam Sơn	15
5026	Xã Ngọc Mỹ	15
5027	Xã Ngổ Luông	15
5029	Xã Phong Phú	15
8407	Phường Hà Phong	17
8409	Phường Hà Tu	17
8413	Phường Việt Hưng	17
5514	Xã Đăk Ngọk	16
8780	Xã Tà Xùa	19
8781	Xã Xín Vàng	19
1537	Xã Tân Thành (Xã)	4
6949	Xã Nam Sơn	13
6994	Xã Nghĩa Bình	13
7011	Xã Đông Hiếu	13
7047	Xã Thanh Ngọc	13
5264	Xã Sơn Hiệp	8
5295	Phường Vạn Thắng	8
7551	Xã Yên Nội	15
7552	Xã Cự Đồng	15
98	Xã Tân Trung	1
6272	Xã Tân Lân	29
6273	Xã Tân Trạch	29
8702	Xã Mỹ Thuận	20
1237	Xã Minh Hưng	33
1238	Xã Minh Lập	33
1481	Phường Trường Lạc	20
3239	Xã Đông Hưng	24
3413	Xã Lý Nhơn	21
3414	Xã Tam Thôn Hiệp	21
3415	Xã Thạnh An	21
3416	Xã An Nhơn Tây	21
7475	Xã Trị Quận	15
7479	Xã Hà Lộc	15
7486	Phường Trường Thịnh	15
7488	Xã Cổ Tiết	15
4961	Xã Đồng Môn	15
4962	Xã Đồng Tâm	15
4963	Xã Hưng Thi	15
4966	Xã Liên Hòa	15
4968	Xã Phú Thành	15
4970	Xã Thanh Nông	15
86	Xã Phú An	1
89	Xã Phú Hưng	1
7688	Xã Đức Bình Đông	32
9225	Xã Đông Động	7
9366	Xã Quỳnh Nguyên	7
7927	Xã Đại Quang	25
7928	Xã Đại Sơn	25
7929	Xã Đại Tân	25
7932	Phường Điện An	25
7934	Xã Điện Hồng	25
7935	Xã Điện Hòa	25
8495	Phường Phương Đông	17
8497	Phường Quang Trung	17
8506	Xã Đài Xuyên	17
8508	Xã Đông Xá	17
8509	Xã Hạ Long	17
8705	Xã Thuận Hưng	20
1334	Xã Mê Pu	11
1335	Xã Nam Chính	11
9372	Phường Đề Thám	7
10227	Xã Tân Trường	26
5235	Xã Cam Phước Đông	8
9082	Xã Hương Phong	22
10816	Phường 1	30
3923	Phường Đội Cấn	23
2272	Phường 1	34
3389	Phường 1	21
6008	Phường 3	11
6009	Phường 4	11
10423	Phường 1	34
3969	Phường Mai Dịch	23
5648	Xã Lộc Yên	12
5650	Xã Phú Xá	12
5659	Xã Yên Trạch	12
4067	Xã Xuân Nộn	23
7337	Phường Thanh Sơn	8
4681	Xã Hà Linh	6
4919	Xã Nuông Dăm	15
3971	Phường Nghĩa Tân	23
3972	Phường Quan Hoa	23
10449	Xã Thạnh Nhựt	34
6559	Xã Nghĩa Minh	14
4108	Phường Bạch Mai	23
4153	Phường Hàng Bài	23
4156	Phường Hàng Đào	23
4161	Phường Phan Chu Trinh	23
4148	Phường Cửa Nam	23
4149	Phường Chương Dương Độ	23
6425	Xã Khánh Hưng	29
8422	Xã Quảng Long	17
8428	Xã Quảng Thành	17
8476	Xã Tiền An	17
4255	Thị trấn Phú Minh	23
9467	Xã Tây Phong	7
1802	Xã Cảnh Tiên	3
2168	Xã Phú Đông	33
10633	Xã Tân Thành	28
10634	Thị trấn Tân Yên	28
1624	Xã Bảo Toàn	3
1637	Xã Sơn Lộ	3
1638	Xã Thượng Hà	3
1678	Xã Vinh Quý	3
1680	Xã Đào Ngạn	3
1773	Xã Lê Lai	3
1774	Xã Minh Khai	3
1775	Xã Quang Trọng	3
9371	Phường Bồ Xuyên	7
6101	Xã Nghĩa Đô	10
10028	Xã Mường Mìn	26
10029	Xã Na Mèo	26
10031	Xã Sơn Điện	26
10652	Xã Khau Tinh	28
10653	Thị trấn Nà Hang	28
10654	Xã Năng Khả	28
10655	Xã Sinh Long	28
10656	Xã Sơn Phú	28
10657	Xã Thanh Tương	28
6	Xã Khánh Bình	1
7	Thị trấn Long Bình	1
10713	Xã Hùng Lợi	28
3121	Phường Tân Thành	24
4289	Xã Vân Hà	23
3948	Xã Phong Vân	23
4014	Phường Nam Đồng	23
3689	Xã Minh Ngọc	28
3382	Phường Bình Hưng Hoà A	21
3966	Xã Yên Bài	23
3933	Phường Thành Công	23
85	Xã Long Hoà	1
710	Phường Phú Tân	30
4226	Xã Thanh Lâm	23
3475	Phường 12	21
3477	Phường 14	21
3478	Phường 15	21
3447	Phường 4	21
5321	Xã Ninh Lộc	8
1202	Phường Phú Thịnh	33
2094	Xã Tam Phước	33
2326	Xã Hòa Thành	34
10	Xã Phú Hữu	1
5342	Xã Vạn Long	8
5343	Xã Vạn Lương	8
3169	Phường An Biên	24
3479	Phường 17	21
3481	Phường 3	21
3485	Phường 8	21
5344	Xã Vạn Phú	8
5345	Xã Vạn Phước	8
5346	Xã Vạn Thạnh	8
5347	Xã Vạn Thắng	8
3193	Phường Lương Khánh Thiện	24
5348	Xã Vạn Thọ	8
6703	Xã Yên Khê	13
1209	Thị trấn Thanh Bình	33
1224	Xã Phú Sơn	33
1225	Xã Phước Sơn	33
1226	Xã Thọ Sơn	33
1227	Xã Thống Nhất	33
1228	Xã Bình Thắng	33
1229	Xã Bù Gia Mập	33
1231	Xã Đa Kia	33
3486	Phường 9	21
1251	Thị trấn Tân Phú	33
1252	Xã Tân Phước	33
3492	Phường Đa Kao	21
6100	Xã Minh Tân	10
2310	Xã Tân Hội	34
2323	Xã Vĩnh Thạnh	34
3140	Phường Trại Chuối	24
3493	Phường Nguyễn Cư Trinh	21
157	Xã Vĩnh Gia	1
3494	Phường Nguyễn Thái Bình	21
3497	Phường 1	21
3499	Phường 11	21
2306	Phường An Lạc	34
6235	Xã Nậm Xé	10
2441	Phường Tam Thuận	25
3448	Phường 5	21
3500	Phường 12	21
6107	Xã Vĩnh Yên	10
1428	Xã Hòa Phú	11
3501	Phường 13	21
3503	Phường 15	21
3512	Phường 1	21
2437	Phường Thọ Quang	25
2470	Xã Thanh Nưa	31
2471	Xã Thanh Xương	31
3514	Phường 11	21
3515	Phường 12	21
3516	Phường 13	21
3518	Phường 15	21
3519	Phường 16	21
18	Xã Bình Phước Xuân	1
3520	Phường 2	21
3523	Phường 5	21
3143	Phường Lãm Hà	24
3525	Phường 7	21
3593	Phường 9	21
3526	Phường 8	21
3596	Phường 11	21
3185	Phường Cầu Tre	24
785	Xã Phú Túc	30
786	Xã Phước Thạnh	30
3449	Phường 6	21
3452	Phường 9	21
1170	Xã Thạnh Hội	21
3491	Phường Cô Giang	21
4154	Phường Hàng Bông	23
3504	Phường 2	21
3505	Phường 3	21
3685	Xã Đường Âm	28
3686	Xã Đường Hồng	28
3687	Xã Giáp Trung	28
3748	Xã Bản Luốc	28
3752	Xã Bản Phùng	28
3753	Xã Chiến Phố	28
6521	Phường Trần Quang Khải	14
3194	Phường Máy Chai	24
3195	Phường Máy Tơ	24
2308	Phường An Thạnh	34
7982	Phường Cẩm Phô	25
1256	Phường Tân Bình	33
3339	Xã Phương Phú	20
287	Xã Yên Mỹ	2
7196	Xã Tân Thành	14
7985	Phường Minh An	25
3930	Phường Nguyễn Trung Trực	23
1469	Phường An Phú	20
3956	Xã Tản Lĩnh	23
3957	Thị trấn Tây Đằng	23
2382	Thị trấn Mỹ An (Thị trấn )	34
9032	Xã Suối Dây	29
9033	Xã Suối Ngô	29
3369	Xã Lê Minh Xuân	21
8541	Phường Đông Lương	18
8545	Phường 3	18
8549	Xã Gio An	18
8558	Xã Gio Quang	18
8563	Xã Linh Hải	18
8564	Xã Linh Thượng	18
3495	Phường Phạm Ngũ Lão	21
7911	Xã Trà Nú	25
10709	Xã Công Đa	28
6522	Phường Trần Tế Xương	14
10551	Xã Ngũ Lạc	30
10994	Xã Minh Tiến	10
10995	Xã Minh Xuân	10
10996	Xã Mường Lai	10
10997	Xã Phan Thanh	10
3530	Phường Hiệp Thành	21
3531	Xã Tân Chánh Hiệp	21
9867	Xã Kiên Thọ	26
720	Xã An Bình Tây	30
722	Xã An Hiệp	30
740	Xã Tân Thủy	30
746	Xã Bình Thới	30
748	Xã Đại Hòa Lộc	30
1620	Xã Khánh Tiến	4
1735	Thị trấn Tĩnh Túc	3
1742	Thị trấn Hoà Thuận	3
1781	Xã Bình Lãng	3
7343	Xã Phước Chiến	8
1782	Xã Cần Nông	3
1821	Xã Trung Phúc	3
1898	Xã Ea Păl	32
1899	Xã Ea Sar	32
2023	Xã Thuận An	11
2570	Xã Quài Tở	31
2646	Xã H Bông	5
7307	Thị trấn Phước Dân	8
7637	Xã Xuân Quang 2	32
8431	Xã Bằng Cả	17
1816	Xã Phong Châu	3
2607	Xã Nghĩa Hòa	5
4313	Xã Tuyết Nghĩa	23
4862	Xã Hào Lý	15
890	Xã Suối Nghệ	21
2466	Xã Thanh An	31
2491	Xã Tà Lèng	31
2649	Xã Ia HLốp	5
2657	Xã Ia Dom	5
3532	Phường Tân Hưng Thuận	21
5787	Xã Nam La	12
454	Xã Xuân Lương	2
4750	Xã Kỳ Thượng	6
4751	Xã Kỳ Tiến	6
4756	Xã Kỳ Hoa	6
4757	Xã Kỳ Hưng	6
4758	Xã Kỳ Lợi	6
4764	Phường Kỳ Thịnh	6
5439	Xã Nam Du	1
5440	Xã Bình An	1
5453	Xã Dương Tơ	1
1312	Thị trấn Chợ Lầu	11
5631	Xã Thiện Hòa	12
7821	Xã Hóa Thanh	18
10515	Xã Trường Thọ	30
2216	Xã Sông Trầu	33
2217	Xã Tây Hoà	33
8491	Xã Yên Than	17
8571	Xã Hải Chánh	18
8619	Xã Triệu Đại	18
11096	Xã Châu Quế Hạ	10
3608	Phường Bình Thuận	21
11102	Xã Hoàng Thắng	10
11103	Xã Lâm Giang	10
11104	Xã Lang Thíp	10
3835	Xã Thanh Thủy	28
3851	Xã Nà Chì	28
3873	Xã Ngọc Long	28
4789	Xã Xuân Hội	6
4903	Xã Cuối Hạ	15
6062	Xã Đạ Đờn	11
4330	Xã Quang Tiến	23
6515	Phường Nguyễn Du	14
7077	Xã Yên Thắng	13
7078	Xã Yên Tĩnh	13
1268	Xã Minh Tâm	33
3105	Xã Trân Châu	24
3180	Phường Niệm Nghĩa	24
3196	Phường Vạn Mỹ	24
4612	Thị trấn Nghèn	6
8713	Xã Ngọc Tố	20
10336	Xã Mỹ Lương	34
10386	Xã Phú Kiết	34
10389	Xã Tân Bình Thạnh	34
10391	Xã Thanh Bình	34
10926	Xã Kim Long	15
10811	Xã Tích Thiện	30
10812	Xã Trà Côn	30
10814	Xã Vĩnh Xuân	30
4581	Xã Cẩm Duệ	6
4585	Xã Cẩm Hưng	6
4628	Xã Xuân Lộc	6
6909	Xã Căm Muộn	13
6910	Xã Châu Kim	13
6915	Xã Mường Nọc	13
6916	Xã Nậm Giải	13
6917	Xã Nậm Nhoóng	13
7040	Xã Thanh Lâm	13
7044	Xã Thanh Lương	13
7385	Xã Bằng Luân	15
7409	Xã Vân Đồn	15
7518	Xã Thạch Kiệt	15
10512	Xã Nhị Trường	30
8223	Xã Long Môn	16
8253	Xã Tịnh Hòa	16
8257	Xã Tịnh Thiện	16
2658	Xã Ia Kla	5
2659	Xã Ia Krêl	5
2712	Xã Đăk Roong	5
8270	Xã Sơn Nham	16
3208	Xã Hoàng Động	24
8276	Xã Tịnh Bình	16
8369	Xã Quảng Lợi	17
8415	Xã Cái Chiên	17
2612	Thị trấn Chư Prông	5
2618	Xã Ia Kly	5
2619	Xã Ia Lâu	5
2620	Xã Ia Me	5
2621	Xã Ia Mơ	5
2622	Xã Ia O	5
2623	Xã Ia Phìn	5
2624	Xã Ia Pia	5
8657	Xã An Hiệp	20
8658	Xã An Ninh	20
8939	Xã Tòng Cọ	19
8940	Xã Tòng Lệnh	19
3310	Xã Vĩnh Thuận Đông	20
3311	Xã Vĩnh Viễn	20
8942	Xã Chiềng Xuân	19
8943	Xã Chiềng Yên	19
8945	Xã Lóng Luông	19
8946	Xã Mường Men	19
8958	Xã Chiềng On	19
8965	Xã Sập Vạt	19
9046	Phường Ninh Sơn	29
9052	Xã Tân Bình	29
6040	Xã Sơn Điền	11
8288	Xã Sơn Lập	16
8289	Xã Sơn Liên	16
8290	Xã Sơn Long	16
8291	Xã Sơn Màu	16
8292	Xã Sơn Mùa	16
8293	Xã Sơn Tân	16
8294	Xã Sơn Tinh	16
8295	Xã Trà Khê	16
8296	Xã Trà Lãnh	16
8301	Xã Trà Thanh	16
8302	Xã Trà Trung	16
8306	Xã Trà Giang	16
1167	Phường Tân Hiệp	21
1172	Phường Thái Hòa	21
1174	Xã Vĩnh Tân	21
1180	Phường Hoà Phú	21
924	Phường 12	21
9161	Xã Phong Hải	22
9166	Xã Phong Thu	22
9167	Xã Phong Xuân	22
1270	Xã Tân Hiệp	33
1271	Xã Tân Hưng	33
1272	Xã Tân Khai	33
1273	Xã Tân Lợi	33
1274	Xã Tân Quan	33
1275	Xã Thanh An	33
1363	Xã La Dạ	11
1364	Thị trấn Ma Lâm	11
2776	Xã Biển Hồ	5
2778	Xã Chư á	5
3498	Phường 10	21
5018	Xã Đông Lai	15
8756	Xã Hòa Đông	20
8814	Xã Nà ớt	19
8881	Phường Chiềng An	19
8882	Xã Chiềng Cọ	19
8883	Phường Chiềng Cơi	19
8886	Xã Chiềng Ngần	19
8887	Phường Chiềng Sinh	19
9000	Xã Phan	29
5490	Xã Vĩnh Bình Bắc	1
5510	Xã Đắk Mar	16
5511	Xã Đắk PXi	16
5512	Xã Đắk Ui	16
5513	Xã Đăk Long	16
556	Xã Thượng Quan	27
1457	Phường Hưng Thạnh	20
1459	Phường Phú Thứ	20
1524	Xã Hòa Tân	4
1525	Xã Hòa Thành	4
6948	Xã Minh Hợp	13
8782	Xã Chiềng Hắc	19
8783	Xã Chiềng Khừa	19
8784	Xã Chiềng Sơn	19
8785	Xã Đông Sang	19
1543	Xã Hưng Mỹ	4
1548	Xã Thạnh Phú	4
1549	Xã Trần Thới	4
1550	Thị trấn Đầm Dơi	4
1552	Xã Nguyễn Huân	4
1555	Xã Tạ An Khương	4
1587	Xã Tân Hưng Tây	4
1589	Xã Việt Thắng	4
7912	Xã Trà Sơn	25
7913	Xã Trà Tân	25
1786	Xã Lương Thông	3
1787	Xã Ngọc Động	3
1790	Xã Vị Quang	3
1791	Xã Yên Sơn	3
1792	Xã Cao Chương	3
2026	Xã Đắk Sin	11
2027	Xã Đắk Wer	11
2111	Xã Sông Nhạn	33
1149	Phường Đông Hòa	21
1157	Xã Phước Sang	21
1158	Thị trấn Phước Vĩnh	21
1159	Xã Tam Lập	21
1160	Xã Tân Hiệp	21
2580	Xã Cửu An	5
2582	Xã Song An	5
2585	Xã Tú An	5
2586	Xã Xuân An	5
3690	Xã Minh Sơn	28
3725	Xã Lũng Táo	28
3727	Xã Má Lé	28
3741	Xã Ngọc Đường	28
7089	Xã Hưng Hòa	13
7136	Xã Tiến Thành	13
7137	Xã Trung Thành	13
7143	Xã Gia Hòa	14
7205	Xã Gia Lâm	14
7208	Xã Gia Tường	14
7209	Xã Kỳ Phú	14
8026	Xã Quế Lâm	25
8029	Xã Quế Trung	25
8069	Xã Phước Thành	25
8070	Xã Phước Xuân	25
1430	Xã Phan Dũng	11
7349	Xã Phước Hà	8
7476	Xã Trung Giáp	15
7635	Xã Xuân Phước	32
8612	Xã Hải Lệ	18
8617	Xã Triệu ái	18
8748	Xã Liêu Tú	20
11012	Xã Hồ Bốn	10
11013	Xã Khao Mang	10
2	Xã Mường Mươn	31
5462	Phường Vĩnh Bảo	1
5515	Xã Hà Mòn	16
5516	Xã Ngok Réo	16
5517	Xã Ngok Wang	16
5518	Xã Đắk Rơ Nga	16
1764	Xã Tự Do	3
48	Xã Đào Hữu Cảnh	1
6305	Xã An Ninh Tây	29
1214	Xã Đồng Nai	33
1215	Xã Đức Liễu	33
1217	Xã Đak Nhau	33
1218	Xã Đăng Hà	33
1219	Xã Đoàn Kết	33
1220	Xã Đường 10	33
1221	Xã Minh Hưng	33
17	Xã An Thạnh Trung	1
20	Xã Hội An	1
1482	Xã Giai Xuân	20
3370	Xã Phạm Văn Hai	21
3421	Xã Nhuận Đức	21
3428	Xã Tân An Hội	21
7577	Xã Đào Xá	15
5224	Xã Sơn Tân	8
5225	Xã Suối Cát	8
6367	Xã Hưng Thạnh	29
5277	Xã Khánh Thượng	8
6656	Xã Yên Thắng	14
6267	Xã Phước Đông	29
6269	Xã Phước Vân	29
6728	Xã Diễn Phú	13
6730	Xã Diễn Quảng	13
42	Xã Bình Chánh	1
4691	Xã Hương Trạch	6
4692	Xã Hương Trà	6
4693	Xã Hương Vĩnh	6
5265	Xã Sơn Lâm	8
5266	Xã Sơn Trung	8
5267	Xã Thành Sơn	8
5269	Xã Cầu Bà	8
6300	Xã Thanh Phú Long	29
6304	Xã An Ninh Đông	29
7417	Xã Đại Phạm	15
7553	Xã Cự Thắng	15
7554	Xã Địch Quả	15
7555	Xã Đông Cửu	15
7560	Xã Sơn Hùng	15
7562	Xã Tân Lập	15
7679	Xã Xuân Lộc	32
7680	Xã Xuân Lâm	32
7682	Xã Xuân Phương	32
7683	Xã Xuân Thịnh	32
7690	Xã Ea Bá	32
7692	Xã EaBar	32
7694	Xã Ealy	32
7695	Xã EaTrol	32
7885	Xã Đức Hóa	18
7886	Xã Hương Hóa	18
7887	Xã Kim Hóa	18
7888	Xã Lâm Hóa	18
7892	Xã Ngư Hóa	18
7893	Xã Phong Hóa	18
7916	Xã Đại Chánh	25
7918	Xã Đại Đồng	25
7919	Xã Đại Hồng	25
7922	Xã Đại Hưng	25
902	Xã An Ngãi	21
7948	Xã Điện Thọ	25
7959	Xã Sông Kôn	25
8077	Xã Quế Hiệp	25
8078	Xã Quế Long	25
8098	Xã A Nông	25
8099	Xã A Tiêng	25
8100	Xã A Vương	25
8101	Xã A Xan	25
8102	Xã Bha Lê	25
8103	Xã Ch'ơm	25
8104	Xã Dang	25
8105	Xã Ga Ri	25
8106	Xã Lăng	25
8694	Xã Tân Hưng	20
8695	Xã Tân Thạnh	20
8696	Xã Trường Khánh	20
8700	Xã Mỹ Hương	20
8704	Xã Phú Mỹ	20
8440	Xã Tân Dân	17
8441	Xã Thống Nhất	17
8707	Xã Gia Hòa 1	20
8708	Xã Gia Hòa 2	20
8709	Xã Hòa Tú 1	20
8710	Xã Hòa Tú 2	20
9650	Xã Phúc Trìu	27
9656	Xã Sơn Cẩm	27
29	Xã Mỹ An	1
76	Phường Mỹ Phước	1
10711	Xã Đội Bình	28
10721	Xã Nhữ Khê	28
1206	Xã Phước Thiện	33
1207	Xã Tân Thành	33
1210	Xã Thanh Hòa	33
1211	Xã Thiện Hưng	33
1212	Xã Bình Minh	33
1213	Xã Bom Bo	33
10289	Xã Định Bình	26
10722	Xã Phú Lâm	28
10723	Xã Phú Thịnh	28
10884	Xã Ngọc Thanh	15
2204	Xã An Viễn	33
2205	Xã Bắc Sơn	33
2212	Xã Hố Nai 3	33
2213	Xã Hưng Thịnh	33
10785	Xã Bình Ninh	30
10790	Xã Loan Mỹ	30
10793	Xã Mỹ Thạnh Trung	30
10801	Xã Tường Lộc	30
3171	Phường Cát Dài	24
10465	Phường 7	34
2276	Phường 4	34
3214	Xã Lâm Động	24
774	Xã Vĩnh Thành	30
9963	Xã Thăng Bình	26
4682	Xã Hòa Hải	6
4683	Xã Hương Bình	6
4684	Xã Hương Đô	6
4685	Xã Hương Giang	6
3379	Phường An Lạc	21
1203	Xã Thanh Lương	33
158	Xã Vĩnh Phước	1
159	Xã Hiệp Thành	4
3380	Phường An Lạc A	21
3967	Phường Dịch Vọng	23
1516	Xã Thạnh Thắng	20
2194	Xã Bàu Hàm 2	33
2195	Xã Gia Kiệm	33
2197	Xã Gia Tân 2	33
582	Phường Khúc Xuyên	2
3533	Phường Tân Thới Hiệp	21
3534	Phường Tân Thới Nhất	21
161	Phường 1	4
165	Phường 7	4
3232	Xã Thuỷ Triều	24
7441	Xã Xuân áng	15
7443	Xã Yên Kỳ	15
4434	Phường Thượng Đình	23
231	Xã Song Khê	2
236	Phường Trần Nguyên Hãn	2
6465	Xã Hải Giang	14
3535	Phường Thạnh Lộc	21
787	Xã Qưới Sơn	30
4595	Xã Cẩm Quan	6
4634	Xã Đức Dũng	6
5170	Xã Thủ Sỹ	7
4659	Phường Đậu Liêu	6
4680	Xã Gia Phố	6
260	Thị trấn Thắng	2
4916	Xã Mi Hòa	15
5665	Xã Chiến Thắng	12
6236	Xã Sơn Thuỷ	10
6237	Xã Tân An	10
6238	Xã Tân Thượng	10
6239	Xã Thẩm Dương	10
6241	Xã Võ Lao	10
11200	Xã Hoàng Liên	10
271	Thị trấn Kép	2
279	Xã Tân Hưng	2
6560	Xã Nghĩa Phong	14
5220	Xã Cam Hòa	8
5221	Xã Cam Phước Tây	8
1059	Phường Quang Trung	5
1061	Phường Trần Hưng Đạo	5
6606	Xã Tân Khánh	14
8216	Xã Đức Phú	16
8217	Xã Đức Tân	16
8222	Xã Long Mai	16
5640	Xã Cao Lâu	12
5643	Xã Gia Cát	12
5644	Xã Hải Yến	12
5646	Xã Hợp Thành	12
5647	Xã Hòa Cư	12
5458	Phường An Bình	1
612	Xã Lai Hạ	2
5459	Phường An Hòa	1
2084	Xã Hóa An	33
2085	Phường Hòa Bình	33
10508	Xã Mỹ Hòa	30
81	Xã Bình Thạnh Đông	1
4107	Phường Bạch Đằng	23
10319	Xã An Hữu	34
10321	Xã An Thái Trung	34
10323	Xã Đông Hòa Hiệp	34
10325	Xã Hậu Mỹ Bắc B	34
10330	Xã Hòa Khánh	34
6117	Xã Cốc Lầu	10
6118	Xã Cốc Ly	10
6523	Phường Trường Thi	14
4147	Phường Cửa Đông	23
82	Thị trấn Chợ Vàm	1
83	Xã Hiệp Xương	1
1258	Phường Tân Phú	33
1259	Xã Tân Thành	33
6526	Phường Văn Miếu	14
6527	Xã Bình Minh	14
6626	Xã Xuân Thượng	14
3539	Phường An Khánh	21
3540	Phường An Lợi Đông	21
1429	Thị trấn Liên Hương	11
8201	Xã Phổ Thạnh	16
8212	Xã Đức Lân	16
8399	Phường Đại Yên	17
1431	Thị trấn Phan Rí Cửa	11
1432	Xã Phong Phú	11
3543	Phường Bình Khánh	21
105	Xã Nhơn Hưng	1
106	Xã Núi Voi	1
6627	Xã Xuân Tiến	14
109	Xã Tân Lợi	1
643	Xã Việt Thống	2
9114	Phường Phú Bài	22
9115	Xã Phú Sơn	22
9120	Xã Thủy Phù	22
9121	Phường Thủy Phương	22
1437	Phường An Thới	20
1438	Phường Bình Thủy	20
7787	Xã Quảng Văn	18
10359	Xã Long Khánh	34
33	Xã Nhơn Mỹ	1
44	Xã Bình Mỹ	1
45	Xã Bình Phú	1
10710	Xã Đạo Viện	28
4667	Phường Nam Hà	6
46	Xã Bình Thủy	1
10004	Xã Quảng Trường	26
10010	Xã Hồi Xuân	26
10011	Xã Hiền Chung	26
10018	Xã Phú Sơn	26
10019	Xã Phú Thanh	26
10022	Xã Thành Sơn	26
10023	Xã Thanh Xuân	26
10024	Xã Thiên Phủ	26
10025	Xã Trung Sơn	26
10026	Xã Trung Thành	26
6108	Xã Xuân Hoà	10
6109	Xã Xuân Thượng	10
6110	Xã Yên Sơn	10
6111	Xã Bản Cái	10
6113	Xã Bản Liền	10
49	Xã Khánh Hòa	1
54	Xã Vĩnh Thạnh Trung	1
3987	Xã Lam Điền	23
10268	Xã Triệu Thành	26
10269	Xã Văn Sơn	26
63	Xã Vĩnh Bình	1
10445	Xã Đồng Sơn	34
3997	Xã Thụy Hương	23
10070	Xã Thành Minh	26
788	Xã Quới Thành	30
789	Xã Sơn Hòa	30
4009	Phường Khâm Thiên	23
3511	Phường 9	21
4010	Phường Khương Thượng	23
1444	Phường Trà Nóc	20
5282	Xã Sông Cầu	8
11164	\N	25
790	Xã Tam Phước	30
4012	Phường Láng Hạ	23
4015	Phường Ngã Tư Sở	23
3108	Xã Xuân Đám	24
1105	Thị trấn Vĩnh Thạnh	5
6550	Xã Nghĩa Bình	14
5454	Xã Gành Dầu	1
5455	Xã Hàm Ninh	1
5456	Xã Hòn Thơm	1
5457	Xã Thổ Châu	1
1460	Phường Tân Phú	20
1465	Phường An Hòa	20
8446	Xã Hải Đông	17
8447	Phường Hải Hoà	17
8448	Xã Hải Sơn	17
8449	Xã Hải Tiến	17
8504	Xã Bình Dân	17
8505	Thị trấn Cái Rồng	17
8512	Xã Quan Lạn	17
8513	Xã Thắng Lợi	17
8514	Xã Vạn Yên	17
8574	Xã Hải Khê	18
31	Xã Mỹ Hiệp	1
3388	Phường Tân Tạo A	21
64	Xã Vĩnh Hanh	1
3391	Phường 12	21
3453	Xã Bà Điểm	21
6088	Thị trấn Tằng Loỏng	10
6089	Xã Thái Niên	10
6090	Xã Trì Quang	10
6091	Xã Xuân Giao	10
6092	Xã Xuân Quang	10
6093	Xã Bảo Hà	10
6094	Xã Cam Cọn	10
6103	Xã Tân Dương	10
6104	Xã Tân Tiến	10
6105	Xã Thượng Hà	10
6106	Xã Việt Tiến	10
4016	Phường Ô Chợ Dừa	23
4017	Phường Phương Liên	23
4019	Phường Quốc Tử Giám	23
4020	Phường Quang Trung	23
6153	Xã Trung Lèng Hồ	10
6158	Phường Cốc Lếu	10
4021	Phường Thịnh Quang	23
6168	Xã Tả Phời	10
2372	Xã Tân Huề	34
6180	Xã Nấm Lư	10
6181	Xã Nậm Chảy	10
6182	Xã Pha Long	10
4023	Phường Trung Liệt	23
4024	Phường Trung Phụng	23
66	Xã Vĩnh Nhuận	1
3555	Phường 14	21
3137	Phường Quang Trung	24
3566	Phường 12	21
3567	Phường 13	21
3575	Phường 5	21
4025	Phường Trung Tự	23
4027	Phường Văn Miếu	23
6233	Xã Nậm Tha	10
6234	Xã Nậm Xây	10
3606	Phường 8	21
3617	Phường Tân Thuận Tây	21
3663	Phường Hoà Thạnh	21
3130	Phường Hạ Lý	24
118	Phường Long Phú	1
119	Phường Long Sơn	1
123	Xã Tân An	1
124	Xã Tân Thạnh	1
129	Xã Định Mỹ	1
136	Xã Tây Phú	1
138	Xã Vọng Đông	1
144	Xã An Tức	1
151	Xã Lương Phi	1
6587	Xã Trực Thái	14
2888	Phường Phạm Ngũ Lão	24
1527	Phường 1	4
1530	Phường 5	4
8	Xã Nhơn Hội	1
1532	Phường 7	4
9	Xã Phú Hội	1
11	Xã Phước Hưng	1
1541	Xã Đông Thới	4
12	Xã Quốc Thái	1
13	Xã Vĩnh Hậu	1
14	Xã Vĩnh Hội Đông	1
16	Xã Vĩnh Trường	1
21	Xã Hòa An	1
22	Xã Hòa Bình	1
23	Xã Kiến An	1
2280	Xã Tân Thuận Tây	34
24	Xã Kiến Thành	1
2281	Xã An Hiệp	34
26	Xã Long Điền B	1
2296	Xã Phú Thuận A	34
27	Xã Long Giang	1
5096	Xã Đại Tập	7
28	Xã Long Kiến	1
30	Xã Mỹ Hội Đông	1
835	Xã Bình Khánh Đông	30
34	Xã Tấn Mỹ	1
39	Phường Vĩnh Mỹ	1
41	Xã Vĩnh Tế	1
55	Thị trấn An Châu	1
68	Phường Bình Đức	1
56	Xã An Hòa	1
7158	Xã Gia Trung	14
57	Xã Bình Hòa	1
6440	Xã Giao Hương	14
59	Xã Cần Đăng	1
60	Xã Hòa Bình Thạnh	1
61	Xã Tân Phú	1
65	Xã Vĩnh Lợi	1
67	Xã Vĩnh Thành	1
69	Phường Bình Khánh	1
70	Phường Đông Xuyên	1
72	Phường Mỹ Hòa	1
73	Xã Mỹ Hoà Hưng	1
74	Xã Mỹ Khánh	1
75	Phường Mỹ Long	1
77	Phường Mỹ Quý	1
78	Phường Mỹ Thạnh	1
79	Phường Mỹ Thới	1
80	Phường Mỹ Xuyên	1
84	Xã Hoà Lạc	1
90	Xã Phú Lâm	1
844	Xã Phước Hiệp	30
91	Xã Phú Long	1
92	Thị trấn Phú Mỹ	1
93	Xã Phú Thạnh	1
94	Xã Phú Thọ	1
95	Xã Phú Thành	1
96	Xã Phú Xuân	1
845	Xã Tân Hội	30
97	Xã Tân Hòa	1
112	Xã Vĩnh Trung	1
100	Xã An Hảo	1
6466	Xã Hải Hà	14
101	Xã An Nông	1
102	Xã An Phú	1
103	Thị trấn Chi Lăng	1
104	Thị trấn Nhà Bàng	1
6467	Xã Hải Hòa	14
107	Thị trấn Tịnh Biên	1
110	Xã Thới Sơn	1
111	Xã Văn Giáo	1
113	Xã Châu Phong	1
2373	Xã Tân Long	34
114	Xã Lê Chánh	1
6474	Xã Hải Ninh	14
115	Xã Long An	1
116	Phường Long Châu	1
121	Xã Phú Lộc	1
122	Xã Phú Vĩnh	1
125	Xã Vĩnh Hòa	1
127	Xã An Bình	1
128	Xã Bình Thành	1
130	Xã Định Thành	1
131	Xã Mỹ Phú Đông	1
6475	Xã Hải Phong	14
134	Thị trấn Phú Hoà	1
135	Xã Phú Thuận	1
140	Xã Vĩnh Chánh	1
6479	Xã Hải Quang	14
141	Xã Vĩnh Khánh	1
142	Xã Vĩnh Phú	1
6481	Xã Hải Tân	14
143	Xã Vĩnh Trạch	1
145	Thị trấn Ba Chúc	1
146	Xã Châu Lăng	1
147	Xã Cô Tô	1
153	Xã Ô Lâm	1
148	Xã Lạc Quới	1
154	Xã Tà Đảnh	1
155	Xã Tân Tuyến	1
149	Xã Lê Trì	1
150	Xã Lương An Trà	1
152	Xã Núi Tô	1
156	Thị trấn Tri Tôn	1
160	Phường Nhà Mát	4
162	Phường 2	4
164	Phường 5	4
166	Phường 8	4
167	Xã Vĩnh Trạch	4
171	Xã An Trạch A	4
168	Xã Vĩnh Trạch Đông	4
169	Xã An Phúc	4
172	Xã Định Thành	4
175	Thị trấn Gành Hào	4
173	Xã Định Thành A	4
184	Xã Phong Thạnh A	4
174	Xã Điền Hải	4
6483	Xã Hải Thanh	14
177	Xã Long Điền Đông	4
178	Xã Long Điền Đông A	4
179	Xã Long Điền Tây	4
180	Phường Hộ Phòng	4
181	Phường Láng Tròn	4
6485	Xã Hải Triều	14
182	Xã Phong Tân	4
8207	Xã An Vĩnh	16
185	Xã Phong Thạnh Đông	4
284	Thị trấn Vôi	2
186	Xã Phong Thạnh Tây	4
302	Xã Lục Sơn	2
187	Phường 1	4
188	Xã Tân Phong	4
189	Xã Tân Thạnh	4
190	Xã Lộc Ninh	4
191	Thị trấn Ngan Dừa	4
192	Xã Ninh Hòa	4
202	Xã Vĩnh Hậu	4
193	Xã Ninh Quới	4
194	Xã Ninh Quới A	4
196	Xã Ninh Thạnh Lợi A	4
198	Xã Vĩnh Lộc A	4
206	Xã Vĩnh Thịnh	4
199	Thị trấn Hòa Bình	4
200	Xã Minh Diệu	4
1179	Phường Hiệp Thành	21
201	Xã Vĩnh Bình	4
1183	Phường Phú Lợi	21
203	Xã Vĩnh Hậu A	4
204	Xã Vĩnh Mỹ A	4
205	Xã Vĩnh Mỹ B	4
4034	Xã Liên Trung	23
207	Xã Hưng Phú	4
209	Xã Phong Thạnh Tây B	4
208	Xã Phong Thạnh Tây A	4
213	Xã Vĩnh Phú Tây	4
210	Thị trấn Phước Long (Thị trấn )	4
211	Xã Phước Long (Xã)	4
214	Xã Vĩnh Thanh	4
220	Xã Long Thạnh	4
212	Xã Vĩnh Phú Đông	4
221	Xã Vĩnh Hưng	4
222	Xã Vĩnh Hưng A	4
227	Phường Hoàng Văn Thụ	2
223	Xã Đồng Sơn	2
228	Phường Lê Lợi	2
224	Phường Đa Mai	2
230	Phường Ngô Quyền	2
225	Phường Dĩnh Kế	2
226	Xã Dĩnh Trì	2
232	Xã Song Mai	2
233	Xã Tân Mỹ	2
234	Xã Tân Tiến	2
2889	Phường Quang Trung	24
235	Phường Thọ Xương	2
238	Phường Xương Giang	2
241	Xã Đại Thành	2
239	Xã Bắc Lý	2
240	Xã Châu Minh	2
242	Xã Đồng Tân	2
248	Xã Hòa Sơn	2
244	Xã Danh Thắng	2
245	Xã Đoan Bái	2
246	Xã Đông Lỗ	2
249	Xã Hoàng An	2
250	Xã Hoàng Lương	2
251	Xã Hoàng Thanh	2
252	Xã Hoàng Vân	2
253	Xã Hùng Sơn	2
254	Xã Hương Lâm	2
256	Xã Mai Đình	2
257	Xã Mai Trung	2
258	Xã Ngọc Sơn	2
259	Xã Quang Minh	2
261	Xã Thái Sơn	2
2386	Xã Mỹ Quý	34
262	Xã Thanh Vân	2
319	Thị trấn Chũ	2
322	Xã Giáp Sơn	2
323	Xã Hồng Giang	2
324	Xã Hộ Đáp	2
263	Xã Thường Thắng	2
325	Xã Kiên Lao	2
326	Xã Kiên Thành	2
2387	Xã Phú Điền	34
264	Xã Xuân Cẩm	2
333	Xã Phong Vân	2
335	Xã Phượng Sơn	2
336	Xã Quý Sơn	2
337	Xã Sơn Hải	2
267	Xã Đào Mỹ	2
268	Xã Dương Đức	2
270	Xã Hương Sơn	2
272	Xã Mỹ Hà	2
273	Xã Mỹ Thái	2
347	Thị trấn An Châu (Thị trấn )	2
350	Xã An Lập	2
351	Xã Bồng Am	2
352	Trung tâm huấn lu Cấm Sơn	2
274	Xã Nghĩa Hòa	2
275	Xã Nghĩa Hưng	2
2397	Phường Khuê Trung	25
276	Xã Phi Mô	2
277	Xã Quang Thịnh	2
278	Xã Tân Dĩnh	2
280	Xã Tân Thịnh	2
281	Xã Tân Thanh	2
282	Xã Thái Đào	2
283	Xã Tiên Lục	2
285	Xã Xuân Hương	2
286	Xã Xương Lâm	2
288	Xã Bảo Đài	2
290	Xã Bắc Lũng	2
293	Xã Chu Điện	2
294	Xã Cương Sơn	2
295	Thị trấn Đồi Ngô	2
298	Xã Đông Phú	2
299	Xã Huyền Sơn	2
384	Thị trấn Nhã Nam (Thị trấn )	2
300	Xã Khám Lạng	2
301	Thị trấn Lục Nam	2
305	Xã Phương Sơn	2
306	Xã Tam Dị	2
307	Xã Thanh Lâm	2
308	Xã Tiên Hưng	2
309	Xã Tiên Nha	2
310	Xã Trường Giang	2
313	Xã Vũ Xá	2
7791	Xã Hồng Thủy	18
316	Xã Biên Sơn	2
327	Xã Kim Sơn	2
328	Xã Mỹ An	2
329	Xã Nam Dương	2
330	Xã Nghĩa Hồ	2
331	Xã Phì Điền	2
332	Xã Phong Minh	2
338	Xã Tân Hoa	2
339	Xã Tân Lập	2
340	Xã Tân Mộc	2
345	Xã Xa Lý	2
346	Xã An Bá	2
353	Xã Cẩm Đàn	2
354	Xã Chiên Sơn	2
355	Xã Dương Hưu	2
2402	Phường Hòa Cường Bắc	25
356	Xã Giáo Liêm	2
357	Xã Hữu Sản	2
358	Xã Lệ Viễn	2
359	Xã Long Sơn	2
360	Xã Phúc Thắng	2
2403	Phường Hòa Cường Nam	25
361	Xã Quế Sơn	2
362	Xã Thạch Sơn	2
363	Xã Thanh Luận	2
1283	Thị trấn Lộc Ninh	33
364	Thị trấn Thanh Sơn	2
367	Xã Vân Sơn	2
1301	Xã Phú Trung	33
1302	Xã Phước Tân	33
1303	Xã Long Giang	33
2404	Phường Hòa Thuận Đông	25
368	Xã Vĩnh Khương	2
369	Xã Yên Định	2
370	Xã An Dương	2
371	Thị trấn Cao Thượng (Thị trấn )	2
404	Xã Quang Châu	2
372	Xã Cao Thượng (Xã)	2
374	Xã Đại Hóa	2
406	Xã Tăng Tiến	2
375	Xã Hợp Đức	2
376	Xã Lam Cốt	2
377	Xã Lan Giới	2
378	Xã Liên Chung	2
410	Xã Vân Hà	2
379	Xã Liên Sơn	2
380	Xã Ngọc Châu	2
381	Xã Ngọc Lý	2
382	Xã Ngọc Thiện	2
385	Xã Nhã Nam (Xã)	2
386	Xã Phúc Hòa	2
387	Xã Phúc Sơn	2
388	Xã Quế Nham	2
389	Xã Quang Tiến	2
2410	Phường Thuận Phước	25
2411	Xã Hòa Bắc	25
391	Xã Tân Trung	2
394	Thị trấn Bích Động	2
2429	Phường Khuê Mỹ	25
2430	Phường Mỹ An	25
395	Xã Bích Sơn	2
396	Xã Hồng Thái	2
397	Xã Hoàng Ninh	2
651	Xã Phù Chẩn	2
398	Xã Hương Mai	2
400	Thị trấn Nếnh	2
420	Xã Nội Hoàng	2
402	Xã Ninh Sơn	2
403	Xã Quảng Minh	2
408	Xã Tiên Sơn	2
409	Xã Trung Sơn	2
411	Xã Vân Trung	2
435	Thị trấn Bố Hạ (Thị trấn )	2
436	Xã Bố Hạ (Xã)	2
413	Xã Cảnh Thụy	2
414	Xã Đồng Phúc	2
415	Xã Đồng Việt	2
2431	Phường An Hải Bắc	25
416	Xã Đức Giang	2
417	Xã Hương Gián	2
2434	Phường Mân Thái	25
418	Xã Lãng Sơn	2
419	Xã Lão Hộ	2
421	Thị trấn Neo	2
437	Thị trấn Cầu Gồ	2
438	Xã Canh Nậu	2
439	Xã Đồng Hưu	2
422	Xã Nham Sơn	2
423	Xã Quỳnh Sơn	2
424	Xã Tân An	2
425	Thị trấn Tân Dân	2
463	Thị trấn Phủ Thông	27
426	Xã Tân Liễu	2
427	Xã Thắng Cương	2
428	Xã Tiến Dũng	2
429	Xã Tiền Phong	2
430	Xã Trí Yên	2
431	Xã Tư Mại	2
432	Xã Xuân Phú	2
512	Thị trấn Chợ Mới	27
516	Xã Nông Hạ	27
517	Xã Nông Thịnh	27
518	Xã Quảng Chu	27
433	Xã Yên Lư	2
522	Xã Thanh Vận	27
524	Xã Yên Đĩnh	27
525	Xã Yên Hân	27
434	Xã An Thượng	2
553	Thị trấn Nà Phặc	27
440	Xã Đồng Kỳ	2
441	Xã Đồng Lạc	2
442	Xã Đồng Tâm	2
443	Xã Đồng Tiến	2
447	Xã Hương Vĩ	2
448	Xã Phồn Xương	2
574	Phường Phùng Chí Kiên	27
449	Xã Tam Hiệp	2
451	Xã Tân Hiệp	2
452	Xã Tân Sỏi	2
453	Xã Tiến Thắng	2
455	Xã Cẩm Giàng	27
456	Xã Cao Sơn	27
457	Xã Đôn Phong	27
458	Xã Dương Phong	27
807	Xã Lương Phú	30
459	Xã Hà Vị	27
460	Xã Lục Bình	27
461	Xã Mỹ Thanh	27
465	Xã Quân Bình	27
2436	Phường Phước Mỹ	25
468	Xã Tân Tiến	27
2438	Phường An Khê	25
469	Xã Tú Trĩ	27
470	Xã Vi Hương	27
471	Xã Vũ Muộn	27
472	Xã Bành Trạch	27
473	Xã Cao Thượng	27
474	Xã Cao Trĩ	27
475	Thị trấn Chợ Rã	27
478	Xã Đồng Phúc	27
480	Xã Hoàng Trĩ	27
491	Xã Bằng Phúc	27
492	Xã Bình Trung	27
494	Xã Đồng Lạc	27
495	Xã Đông Viên	27
497	Xã Nam Cường	27
498	Xã Ngọc Phái	27
499	Xã Nghĩa Tá	27
500	Xã Phong Huân	27
502	Xã Quảng Bạch	27
503	Xã Rã Bản	27
504	Xã Tân Lập	27
505	Xã Xuân Lạc	27
506	Xã Yên Mỹ	27
507	Xã Yên Nhuận	27
508	Xã Yên Thịnh	27
509	Xã Yên Thượng	27
510	Xã Bình Văn	27
511	Xã Cao Kỳ	27
526	Xã Ân Tình	27
527	Xã Côn Minh	27
529	Xã Cường Lợi	27
533	Xã Hữu Thác	27
534	Xã Kim Hỷ	27
535	Xã Kim Lư	27
539	Xã Lương Hạ	27
540	Xã Lương Thành	27
542	Xã Quang Phong	27
543	Xã Văn Học	27
546	Xã Xuân Dương	27
547	Thị trấn Yến Lạc	27
577	Phường Đại Phúc	2
551	Xã Hương Nê	27
552	Xã Lãng Ngâm	27
557	Xã Trung Hoà	27
561	Xã Bộc Bố	27
565	Xã Giáo Hiệu	27
569	Phường Đức Xuân	27
572	Phường Nguyễn Thị Minh Khai	27
573	Xã Nông Thượng	27
575	Phường Sông Cầu	27
576	Phường Xuất Hóa	27
579	Phường Hạp Lĩnh	2
580	Xã Hòa Long	2
581	Phường Khắc Niệm	2
583	Xã Kim Chân	2
584	Phường Kinh Bắc	2
585	Xã Nam Sơn	2
586	Phường Ninh Xá	2
587	Phường Phong Khê	2
588	Phường Suối Hoa	2
589	Phường Thị Cầu	2
590	Phường Tiền An	2
591	Phường Vạn An	2
593	Phường Vân Dương	2
594	Phường Võ Cường	2
595	Phường Vũ Ninh	2
596	Xã Bình Dương	2
2439	Phường Chính Gián	25
597	Xã Cao Đức	2
2444	Phường Thanh Khê Đông	25
598	Xã Đại Bái	2
2445	Phường Thanh Khê Tây	25
599	Xã Đại Lai	2
614	Xã Mỹ Hương	2
600	Xã Đông Cứu	2
601	Thị trấn Gia Bình	2
2446	Phường Vĩnh Trung	25
602	Xã Giang Sơn	2
603	Xã Lãng Ngâm	2
2447	Phường Xuân Hà	25
2448	Xã Hẹ Muông	31
2449	Xã Hua Thanh	31
2450	Xã Mường Lói	31
2451	Xã Mường Nhà	31
604	Xã Nhân Thắng	2
605	Xã Quỳnh Phú	2
2452	Xã Mường Pồn	31
2453	Xã Mường Phăng	31
2454	Xã Nà Nhạn	31
2455	Xã Nà Tấu	31
2456	Xã Na Tông	31
2457	Xã Na Ư	31
2458	Xã Noọng Hẹt	31
2459	Xã Noong Luống	31
2460	Xã Núa Ngam	31
2461	Xã Pá Khoang	31
606	Xã Song Giang	2
2481	Xã Phì Nhừ	31
2482	Xã Phình Giàng	31
2483	Xã Pú Hồng	31
2484	Xã Pú Nhi	31
2486	Xã Xa Dung	31
607	Xã Thái Bảo	2
608	Xã Vạn Ninh	2
615	Xã Minh Tân	2
609	Xã Xuân Lai	2
610	Xã An Thịnh	2
611	Xã Bình Định	2
613	Xã Lâm Thao	2
630	Xã Đức Long	2
616	Xã Phú Hòa	2
617	Xã Phú Lương	2
632	Xã Hán Quảng	2
618	Xã Quảng Phú	2
619	Xã Tân Lãng	2
621	Xã Trừng Xá	2
2488	Phường Mường Thanh	31
623	Xã Trung Kênh	2
624	Xã Bằng An	2
625	Xã Bồng Lai	2
626	Xã Cách Bi	2
627	Xã Châu Phong	2
628	Xã Chi Lăng	2
636	Thị trấn Phố Mới	2
629	Xã Đại Xuân	2
631	Xã Đào Viên	2
633	Xã Mộ Đạo	2
634	Xã Ngọc Xá	2
635	Xã Nhân Hòa	2
2493	Phường Thanh Bình	31
637	Xã Phù Lãng	2
2549	Xã Tả Sìn Thàng	31
638	Xã Phù Lương	2
639	Xã Phượng Mao	2
641	Xã Quế Tân	2
644	Xã Yên Giả	2
645	Phường Châu Khê	2
646	Phường Đồng Kỵ	2
652	Xã Phù Khê	2
647	Phường Đồng Nguyên	2
2891	Phường Tân Bình	24
648	Phường Đình Bảng	2
649	Phường Đông Ngàn	2
658	Xã Đại Đồng Thành	2
650	Xã Hương Mạc	2
3320	Phường Thuận An	20
653	Xã Tam Sơn	2
661	Thị trấn Hồ	2
654	Phường Tân Hồng	2
3321	Phường Trà Lồng	20
655	Phường Trang Hạ	2
669	Xã Song Hồ	2
656	Xã Tương Giang	2
3455	Thị trấn Hóc Môn	21
657	Xã An Bình	2
659	Xã Đình Tổ	2
2589	Phường Đoàn Kết	5
660	Xã Gia Đông	2
662	Xã Hà Mãn	2
663	Xã Hoài Thượng	2
664	Xã Mão Điền	2
3456	Xã Nhị Bình	21
665	Xã Nghĩa Đạo	2
666	Xã Ngũ Thái	2
667	Xã Nguyệt Đức	2
670	Xã Song Liễu	2
671	Xã Thanh Khương	2
674	Xã Xuân Lâm	2
672	Xã Trạm Lộ	2
673	Xã Trí Quả	2
2665	Thị trấn Đăk Đoa	5
2666	Xã Đăk Krong	5
675	Xã Cảnh Hưng	2
676	Xã Đại Đồng	2
677	Xã Hiên Vân	2
693	Xã Dũng Liệt	2
678	Xã Hoàn Sơn	2
679	Xã Lạc Vệ	2
680	Xã Liên Bão	2
681	Thị trấn Lim	2
682	Xã Minh Đạo	2
683	Xã Nội Duệ	2
707	Xã Phú Hưng	30
684	Xã Phật Tích	2
685	Xã Phú Lâm	2
686	Xã Tân Chi	2
708	Phường Phú Khương	30
687	Xã Tri Phương	2
709	Xã Phú Nhuận	30
688	Xã Việt Đoàn	2
712	Phường 2	30
689	Thị trấn Chờ	2
714	Phường 4	30
690	Xã Đông Phong	2
715	Phường 5	30
691	Xã Đông Thọ	2
716	Phường 6	30
692	Xã Đông Tiến	2
717	Phường 7	30
695	Xã Long Châu	2
696	Xã Tam Đa	2
2679	Xã Tân Bình	5
697	Xã Tam Giang	2
2707	Xã Ia Trok	5
2708	Xã Ia Tul	5
2709	Xã Kim Tân	5
2710	Xã Pờ Tó	5
698	Xã Thụy Hòa	2
699	Xã Trung Nghĩa	2
700	Xã Văn Môn	2
718	Phường 8	30
701	Xã Yên Phụ	2
726	Xã An Phú Trung	30
702	Xã Yên Trung	2
703	Xã Bình Phú	30
752	Xã Long Hòa	30
704	Xã Mỹ Thạnh An	30
705	Xã Mỹ Thành	30
706	Xã Nhơn Thạnh	30
719	Xã Sơn Đông	30
721	Xã An Đức	30
753	Xã Phú Long	30
723	Xã An Hòa Tây	30
724	Xã An Ngãi Tây	30
725	Xã An Ngãi Trung	30
727	Xã An Thủy	30
754	Xã Phú Thuận	30
728	Xã Bảo Thạnh	30
755	Xã Phú Vang	30
729	Xã Bảo Thuận	30
756	Xã Tam Hiệp	30
757	Xã Thạnh Phước	30
730	Thị trấn Ba Tri	30
3457	Xã Tân Hiệp	21
731	Xã Mỹ Chánh	30
732	Xã Mỹ Hòa	30
733	Xã Mỹ Nhơn	30
776	Xã An Hóa	30
734	Xã Mỹ Thạnh	30
735	Xã Phú Lễ	30
779	Thị trấn Châu Thành	30
736	Xã Phú Ngãi	30
737	Xã Phước Tuy	30
738	Xã Tân Hưng	30
739	Xã Tân Mỹ	30
741	Xã Tân Xuân	30
742	Xã Vĩnh An	30
743	Xã Vĩnh Hòa	30
744	Thị trấn Bình Đại	30
745	Xã Bình Thắng	30
747	Xã Châu Hưng	30
4175	Phường Trần Phú	23
749	Xã Định Trung	30
750	Xã Lộc Thuận	30
759	Xã Thới Lai	30
760	Xã Thới Thuận	30
761	Xã Thừa Đức	30
762	Xã Vang Quới Đông	30
763	Xã Vang Quới Tây	30
764	Thị trấn Chợ Lách	30
765	Xã Hòa Nghĩa	30
766	Xã Hưng Khánh Trung B	30
767	Xã Long Thới	30
768	Xã Phú Phụng	30
780	Xã Giao Hòa	30
769	Xã Phú Sơn	30
775	Xã An Hiệp	30
770	Xã Sơn Định	30
784	Xã Phú Đức	30
771	Xã Tân Thiềng	30
772	Xã Vĩnh Bình	30
773	Xã Vĩnh Hòa	30
777	Xã An Khánh	30
778	Xã An Phước	30
781	Xã Giao Long	30
782	Xã Hữu Định	30
791	Xã Tân Phú	30
792	Xã Tân Thạch	30
793	Xã Thành Triệu	30
794	Xã Tiên Long	30
795	Xã Tiên Thủy	30
796	Xã Tường Đa	30
797	Xã Bình Hoà	30
813	Xã Sơn Phú	30
798	Xã Bình Thành	30
799	Xã Châu Bình	30
800	Xã Châu Hòa	30
801	Thị trấn Giồng Trôm	30
802	Xã Hưng Lễ	30
831	Xã Thanh Tân	30
803	Xã Hưng Nhượng	30
4176	Phường Tương Mai	23
805	Xã Long Mỹ	30
806	Xã Lương Hòa	30
808	Xã Lương Quới	30
810	Xã Phong Mỹ	30
809	Xã Mỹ Thạnh	30
811	Xã Phong Nẫm	30
812	Xã Phước Long	30
814	Xã Tân Hào	30
815	Xã Tân Lợi Thạnh	30
816	Xã Tân Thanh	30
817	Xã Thạnh Phú Đông	30
818	Xã Thuận Điền	30
819	Xã Hòa Lộc	30
820	Xã Hưng Khánh Trung A	30
821	Xã Khánh Thạnh Tân	30
822	Xã Nhuận Phú Tân	30
823	Xã Phú Mỹ	30
824	Xã Phước Mỹ Trung	30
826	Xã Tân Phú Tây	30
827	Xã Tân Thành Bình	30
829	Xã Thạnh Ngãi	30
832	Xã An Định	30
833	Xã An Thạnh	30
4180	Phường Cự Khối	23
834	Xã An Thới	30
836	Xã Bình Khánh Tây	30
837	Xã Cẩm Sơn	30
838	Xã Định Thủy	30
846	Xã Tân Trung	30
840	Xã Hương Mỹ	30
858	Xã Mỹ An	30
841	Thị trấn Mỏ Cày	30
3544	Phường Bình Trưng Đông	21
842	Xã Minh Đức	30
843	Xã Ngãi Đăng	30
848	Xã Thành Thới B	30
3545	Phường Bình Trưng Tây	21
849	Xã An Điền	30
3549	Phường Thủ Thiêm	21
3551	Phường 10	21
3553	Phường 12	21
850	Xã An Nhơn	30
852	Xã An Thạnh	30
853	Xã An Thuận	30
3554	Phường 13	21
3559	Phường 5	21
3562	Phường 8	21
854	Xã Bình Thạnh	30
2313	Xã Định An	34
855	Xã Đại Điền	30
865	Thị trấn Thạnh Phú	30
856	Xã Giao Thạnh	30
874	Phường Phước Hưng	21
857	Xã Hòa Lợi	30
3563	Phường 9	21
3564	Phường 1	21
3565	Phường 10	21
859	Xã Mỹ Hưng	30
907	Xã Phước Tỉnh	21
860	Xã Phú Khánh	30
3570	Phường 16	21
3571	Phường 18	21
3572	Phường 2	21
861	Xã Quới Điền	30
3579	Phường 1	21
3580	Phường 10	21
3582	Phường 12	21
3583	Phường 13	21
3584	Phường 14	21
3585	Phường 15	21
3587	Phường 3	21
862	Xã Tân Phong	30
3588	Phường 4	21
3589	Phường 5	21
3590	Phường 6	21
3591	Phường 7	21
866	Xã Thới Thạnh	30
869	Phường Long Hương	21
870	Xã Long Phước	21
872	Phường Long Toàn	21
876	Phường Phước Trung	21
877	Xã Tân Hưng	21
878	Xã Bàu Chinh	21
879	Xã Bình Ba	21
880	Xã Bình Giã	21
881	Xã Bình Trung	21
882	Xã Cù Bị	21
883	Xã Đá Bạc	21
884	Xã Kim Long	21
885	Xã Láng Lớn	21
3595	Phường 10	21
3601	Phường 3	21
3603	Phường 5	21
886	Thị trấn Ngãi Giao	21
887	Xã Nghĩa Thành	21
891	Xã Suối Rao	21
892	Xã Xà Bang	21
893	Xã Xuân Sơn	21
894	Thị trấn Đất Đỏ	21
895	Xã Lộc An	21
896	Xã Láng Dài	21
3604	Phường 6	21
3607	Phường 9	21
897	Xã Long Mỹ	21
899	Thị trấn Phước Hải	21
900	Xã Phước Hội	21
901	Xã Phước Long Thọ	21
903	Xã An Nhứt	21
904	Thị trấn Long Điền	21
922	Phường 10	21
905	Thị trấn Long Hải	21
926	Phường 3	21
927	Phường 4	21
906	Xã Phước Hưng	21
940	Xã Hòa Bình	21
941	Xã Hòa Hội	21
942	Xã Hòa Hiệp	21
908	Xã Tam Phước	21
915	Xã Tân Hải	21
917	Xã Tân Phước	21
918	Xã Tóc Tiên	21
919	Xã Long Sơn	21
920	Phường Nguyễn An Ninh	21
921	Phường 1	21
923	Phường 11	21
925	Phường 2	21
928	Phường 5	21
929	Phường 7	21
930	Phường 8	21
931	Phường 9	21
932	Phường Rạch Dừa	21
933	Phường Thắng Nhất	21
934	Phường Thắng Nhì	21
935	Phường Thắng Tam	21
937	Xã Bình Châu	21
938	Xã Bông Trang	21
939	Xã Bưng Riềng	21
944	Thị trấn Phước Bửu	21
946	Xã Phước Thuận	21
950	Xã An Hòa	5
951	Xã An Hưng	5
3609	Phường Phú Mỹ	21
952	Thị trấn An Lão	5
1466	Phường An Khánh	20
959	Phường Bình Định	5
1038	Xã Mỹ Thắng	5
960	Phường Đập Đá	5
1468	Phường An Nghiệp	20
1470	Phường Cái Khế	20
963	Xã Nhơn Hậu	5
965	Phường Nhơn Hưng	5
966	Xã Nhơn Khánh	5
1471	Phường Hưng Lợi	20
967	Xã Nhơn Lộc	5
1473	Phường Thới Bình	20
3610	Phường Phú Thuận	21
968	Xã Nhơn Mỹ	5
969	Xã Nhơn Phong	5
970	Xã Nhơn Phúc	5
971	Xã Nhơn Tân	5
972	Xã Nhơn Thọ	5
973	Phường Nhơn Thành	5
974	Xã Ân Đức	5
975	Xã Ân Hảo Đông	5
977	Xã Ân Hữu	5
978	Xã Ân Mỹ	5
979	Xã Ân Nghĩa	5
3611	Phường Tân Hưng	21
980	Xã Ân Phong	5
982	Xã Ân Thạnh	5
983	Xã Ân Tín	5
984	Xã Ân Tường Đông	5
988	Thị trấn Tăng Bạt Hổ	5
1474	Phường Xuân Khánh	20
989	Thị trấn Bồng Sơn	5
993	Xã Hoài Hải	5
1044	Phường Đống Đa	5
995	Xã Hoài Hương	5
2316	Thị trấn Lấp Vò	34
1000	Xã Hoài Thanh	5
1001	Xã Hoài Thanh Tây	5
1002	Xã Hoài Xuân	5
2322	Xã Tân Mỹ	34
1004	Xã Tam Quan Bắc	5
1046	Phường Hải Cảng	5
1005	Xã Tam Quan Nam	5
1009	Xã Cát Hiệp	5
1010	Xã Cát Hưng	5
1011	Xã Cát Khánh	5
1012	Xã Cát Lâm	5
1013	Xã Cát Minh	5
1014	Xã Cát Nhơn	5
1015	Xã Cát Sơn	5
1016	Xã Cát Tài	5
1018	Xã Cát Thắng	5
1020	Xã Cát Tiến	5
1023	Thị trấn Ngô Mây	5
1024	Thị trấn Bình Dương	5
1026	Xã Mỹ Cát	5
1027	Xã Mỹ Chánh	5
1028	Xã Mỹ Chánh Tây	5
1029	Xã Mỹ Châu	5
1030	Xã Mỹ Đức	5
1031	Xã Mỹ Hiệp	5
1047	Phường Lê Hồng Phong	5
1049	Phường Lý Thường Kiệt	5
1032	Xã Mỹ Hòa	5
1033	Xã Mỹ Lộc	5
1050	Phường Ngô Mây	5
1052	Phường Nhơn Bình	5
1053	Xã Nhơn Châu	5
1055	Xã Nhơn Hội	5
1057	Phường Nhơn Phú	5
1063	Phường Trần Quang Diệu	5
1131	Xã Tân Hưng	21
1069	Xã Bình Tường	5
1070	Thị trấn Phú Phong	5
1071	Xã Tây An	5
1072	Xã Tây Bình	5
4182	Phường Gia Thụy	23
1076	Xã Tây Vinh	5
1079	Thị trấn Diêu Trì	5
1084	Xã Phước Lộc	5
1085	Xã Phước Nghĩa	5
1090	Xã Phước Thuận	5
1091	Thị trấn Tuy Phước	5
1092	Xã Canh Hiển	5
1093	Xã Canh Hiệp	5
1094	Xã Canh Hòa	5
1095	Xã Canh Liên	5
1096	Xã Canh Thuận	5
1097	Xã Canh Vinh	5
1098	Thị trấn Vân Canh	5
1101	Xã Vĩnh Hòa	5
1102	Xã Vĩnh Kim	5
1103	Xã Vĩnh Quang	5
1107	Xã Vĩnh Thuận	5
1108	Xã Bình Mỹ	21
1145	Phường An Bình	21
1109	Xã Đất Cuốc	21
1110	Xã Hiếu Liêm	21
1111	Xã Lạc An	21
1112	Xã Tân Bình	21
1113	Xã Tân Định	21
1114	Xã Tân Lập	21
1115	Xã Tân Mỹ	21
4238	Phường Phú Đô	23
1116	Xã Tân Thành	21
1117	Xã Thường Tân	21
1118	Xã An Điền	21
1119	Xã An Tây	21
1120	Phường Chánh Phú Hòa	21
1121	Phường Hòa Lợi	21
1122	Phường Mỹ Phước	21
4243	Xã Bạch Hạ	23
1123	Xã Phú An	21
1124	Phường Tân Định	21
1125	Phường Thới Hòa	21
1126	Xã Cây Trường II	21
1127	Xã Hưng Hòa	21
1128	Xã Lai Hưng	21
1129	Xã Lai Uyên	21
1132	Xã Trừ Văn Thố	21
1135	Xã Định An	21
1136	Xã Định Hiệp	21
2550	Thị trấn Tủa Chùa	31
2551	Xã Tủa Thàng	31
1141	Xã Minh Tân	21
1143	Xã Thanh An	21
2552	Xã Trung Thu	31
2553	Xã Xín Chải	31
1146	Phường Bình An	21
5487	Xã Bình Minh	1
1147	Phường Bình Thắng	21
5492	Xã Vĩnh Phong	1
1148	Phường Dĩ An	21
1150	Phường Tân Bình	21
1151	Phường Tân Đông Hiệp	21
1155	Xã An Thái	21
1156	Xã Phước Hoà	21
1161	Xã Tân Long	21
1162	Xã Vĩnh Hoà	21
1163	Xã Bạch Đằng	21
1166	Xã Phú Chánh	21
1168	Phường Tân Phước Khánh	21
1164	Xã Hội Nghĩa	21
1165	Phường Khánh Bình	21
1169	Xã Tân Vĩnh Hiệp	21
1171	Phường Thạnh Phước	21
1173	Phường Uyên Hưng	21
1175	Phường Chánh Mỹ	21
1176	Phường Chánh Nghĩa	21
1177	Phường Định Hoà	21
1178	Phường Hiệp An	21
1181	Phường Phú Cường	21
1182	Phường Phú Hòa	21
6551	Xã Nghĩa Châu	14
1184	Phường Phú Mỹ	21
1185	Phường Phú Tân	21
1186	Phường Phú Thọ	21
1187	Phường Tân An	21
1188	Phường Tương Bình Hiệp	21
1189	Phường An Phú	21
1190	Xã An Sơn	21
1191	Phường An Thạnh	21
1192	Phường Bình Chuẩn	21
1193	Phường Bình Hòa	21
2892	Xã Tân Hưng	24
1194	Phường Bình Nhâm	21
1195	Phường Hưng Định	21
1196	Phường Lái Thiêu	21
1200	Phường Hưng Chiến	33
1197	Phường Thuận Giao	21
1201	Phường Phú Đức	33
1198	Phường Vĩnh Phú	21
1199	Phường An Lộc	33
1204	Xã Thanh Phú	33
1208	Xã Tân Tiến	33
1216	Thị trấn Đức Phong	33
1222	Xã Nghĩa Bình	33
1223	Xã Nghĩa Trung	33
1230	Xã Đức Hạnh	33
1236	Thị trấn Chơn Thành	33
1239	Xã Minh Long	33
6441	Xã Giao Lạc	14
1240	Xã Minh Thắng	33
1241	Xã Minh Thành	33
1242	Xã Nha Bích	33
1243	Xã Quang Minh	33
1244	Xã Thành Tâm	33
1245	Xã Đồng Tâm	33
1246	Xã Đồng Tiến	33
1247	Xã Tân Hòa	33
1248	Xã Tân Hưng	33
1249	Xã Tân Lập	33
1250	Xã Tân Lợi	33
1257	Phường Tân Đồng	33
1260	Phường Tân Thiện	33
1311	Xã Bình Tân	11
1261	Phường Tân Xuân	33
1262	Xã Tiến Hưng	33
1263	Xã Tiến Thành	33
1264	Xã An Khương	33
1265	Xã An Phú	33
1266	Xã Đồng Nơ	33
1267	Xã Minh Đức	33
1269	Xã Phước An	33
1276	Xã Thanh Bình	33
1277	Xã Lộc An	33
1279	Xã Lộc Hiệp	33
1280	Xã Lộc Hòa	33
1314	Xã Hồng Phong	11
1284	Xã Lộc Phú	33
1286	Xã Lộc Tấn	33
1289	Xã Lộc Thái	33
6442	Xã Giao Long	14
1292	Xã Lộc Thuận	33
1293	Xã Bình Sơn	33
1300	Xã Phú Riềng	33
1304	Phường Long Phước	33
1318	Xã Phan Điền	11
1319	Xã Phan Hiệp	11
1305	Phường Long Thủy	33
1309	Phường Thác Mơ	33
1310	Xã Bình An	11
1313	Xã Hải Ninh	11
1316	Xã Hòa Thắng	11
1317	Thị trấn Lương Sơn	11
1320	Xã Phan Hòa	11
1322	Xã Phan Rí Thành	11
1323	Xã Phan Sơn	11
1330	Thị trấn Đức Tài	11
1331	Xã Đức Tín	11
1333	Xã Đông Hà	11
1336	Xã Sùng Nhơn	11
1345	Thị trấn Tân Minh	11
1337	Xã Tân Hà	11
1376	Xã Tân Lập	11
1377	Xã Tân Thành	11
1378	Xã Tân Thuận	11
1379	Thị trấn Thuận Nam	11
1340	Xã Vũ Hoà	11
1341	Xã Sơn Mỹ	11
1343	Xã Tân Đức	11
1346	Thị trấn Tân Nghĩa	11
1383	Phường Phước Lộc	11
1347	Xã Tân Phúc	11
1348	Xã Tân Thắng	11
1349	Xã Tân Xuân	11
1350	Xã Thắng Hải	11
1351	Xã Đa Mi	11
1352	Xã Đông Giang	11
1353	Xã Đông Tiến	11
1354	Xã Hồng Liêm	11
1357	Xã Hàm Đức	11
1360	Xã Hàm Phú	11
1361	Xã Hàm Thắng	11
1365	Thị trấn Phú Long	11
1380	Xã Thuận Quí	11
1394	Phường Hàm Tiến	11
1381	Phường Bình Tân	11
1382	Phường Phước Hội	11
1384	Phường Tân An	11
1395	Phường Hưng Long	11
1385	Xã Tân Bình	11
1386	Xã Tân Hải	11
1387	Xã Tân Phước	11
1388	Phường Tân Thiện	11
1389	Xã Tân Tiến	11
1391	Phường Đức Long	11
1393	Phường Đức Thắng	11
1397	Phường Mũi Né	11
1398	Xã Phong Nẫm	11
1403	Phường Thanh Hải	11
1399	Phường Phú Hài	11
1400	Phường Phú Tài	11
1401	Phường Phú Thủy	11
1402	Phường Phú Trinh	11
1404	Xã Thiện Nghiệp	11
1426	Xã Chí Công	11
1405	Xã Tiến Lợi	11
8211	Xã Đức Lợi	16
1406	Xã Tiến Thành	11
1407	Phường Xuân An	11
1408	Xã Long Hải	11
8239	Phường Lê Hồng Phong	16
1409	Xã Ngũ Phụng	11
1411	Xã Bắc Ruộng	11
1412	Xã Đồng Kho	11
1413	Xã Đức Bình	11
1414	Xã Đức Phú	11
1418	Xã Gia Huynh	11
1427	Xã Hòa Minh	11
1424	Xã Suối Kiết	11
1425	Xã Bình Thạnh	11
1434	Xã Phước Thể	11
1569	Xã Hiệp Tùng	4
1435	Xã Vĩnh Hảo	11
1436	Xã Vĩnh Tân	11
1440	Phường Long Hòa	20
1441	Phường Long Tuyền	20
1442	Phường Thới An Đông	20
1443	Phường Trà An	20
1445	Thị trấn Cờ Đỏ	20
1446	Xã Đông Hiệp	20
1447	Xã Đông Thắng	20
1448	Xã Thạnh Phú	20
1451	Xã Thới Xuân	20
1452	Xã Trung An	20
1453	Xã Trung Hưng	20
1454	Xã Trung Thạnh	20
3326	Phường Lái Hiếu	20
1455	Phường Ba Láng	20
1476	Phường Long Hưng	20
1456	Phường Hưng Phú	20
1458	Phường Lê Bình	20
1461	Phường Thường Thạnh	20
1479	Phường Thới Hòa	20
1462	Phường An Bình	20
1464	Phường An Hội	20
1475	Phường Châu Văn Liêm	20
1477	Phường Phước Thới	20
3327	Phường Ngã Bảy	20
1478	Phường Thới An	20
1480	Phường Thới Long	20
1483	Xã Mỹ Khánh	20
1484	Xã Nhơn ái	20
1485	Xã Nhơn Nghĩa	20
1486	Thị trấn Phong Điền	20
1487	Xã Tân Thới	20
1488	Xã Trường Long	20
1489	Phường Tân Hưng	20
1490	Phường Tân Lộc	20
1491	Phường Thạnh Hoà	20
1500	Xã Đông Thuận	20
1492	Phường Thốt Nốt	20
1493	Phường Thới Thuận	20
1501	Xã Tân Thạnh	20
1494	Phường Thuận An	20
1495	Phường Thuận Hưng	20
1496	Phường Trung Kiên	20
1497	Phường Trung Nhứt	20
1509	Xã Trường Xuân B	20
1498	Xã Định Môn	20
1502	Thị trấn Thới Lai	20
1503	Xã Thới Tân	20
1504	Xã Thới Thạnh	20
1505	Xã Trường Thắng	20
1506	Xã Trường Thành	20
1507	Xã Trường Xuân	20
1508	Xã Trường Xuân A	20
1510	Xã Xuân Thắng	20
1511	Xã Thạnh An	20
1512	Xã Thạnh Lộc	20
1513	Xã Thạnh Lợi	20
1514	Xã Thạnh Mỹ	20
1515	Xã Thạnh Qưới	20
1519	Xã Vĩnh Bình	20
1520	Thị trấn Vĩnh Thạnh	20
1521	Xã Vĩnh Trinh	20
1523	Xã Định Bình	4
1526	Xã Lý Văn Lâm	4
1533	Phường 8	4
1534	Phường 9	4
1581	Thị trấn Cái Đôi Vàm	4
1535	Xã Tắc Vân	4
1591	Xã Biển Bạch Đông	4
1592	Xã Hồ Thị Kỷ	4
1536	Phường Tân Thành (Phường)	4
1601	Xã Trí Phải	4
1538	Phường Tân Xuyên	4
1539	Thị trấn Cái Nước	4
1540	Xã Đông Hưng	4
1542	Xã Hoà Mỹ	4
1544	Xã Lương Thế Trân	4
1545	Xã Phú Hưng	4
1546	Xã Tân Hưng	4
1547	Xã Tân Hưng Đông	4
1605	Xã Khánh Bình Tây Bắc	4
1551	Xã Ngọc Chánh	4
1553	Xã Quách Phẩm	4
1554	Xã Quách Phẩm Bắc	4
1556	Xã Tạ An Khương Đông	4
1557	Xã Tạ An Khương Nam	4
1558	Xã Tân Đức	4
1559	Xã Tân Dân	4
1560	Xã Tân Duyệt	4
1561	Xã Tân Thuận	4
1562	Xã Tân Tiến	4
1563	Xã Tân Trung	4
1564	Xã Thanh Tùng	4
3331	Thị trấn Cây Dương	20
1567	Xã Hàm Rồng	4
1568	Xã Hàng Vịnh	4
1616	Xã Khánh Hội	4
1570	Xã Lâm Hải	4
1571	Thị trấn Năm Căn	4
1572	Xã Tam Giang	4
1573	Xã Tam Giang Đông	4
1574	Xã Đất Mũi	4
1577	Xã Tân Ân	4
1579	Xã Viên An	4
1580	Xã Viên An Đông	4
1582	Xã Phú Mỹ	4
1621	Xã Nguyễn Phích	4
1583	Xã Phú Tân	4
1584	Xã Phú Thuận	4
1585	Xã Rạch Chèo	4
1586	Xã Tân Hải	4
1588	Xã Việt Khái	4
1590	Xã Biển Bạch	4
1594	Xã Tân Lộc	4
1595	Xã Tân Lộc Bắc	4
1596	Xã Tân Lộc Đông	4
1597	Xã Tân Phú	4
1598	Thị trấn Thới Bình (Thị trấn )	4
1599	Xã Thới Bình (Xã)	4
1600	Xã Trí Lực	4
1602	Xã Khánh Bình	4
1603	Xã Khánh Bình Đông	4
1622	Thị trấn U Minh	4
1604	Xã Khánh Bình Tây	4
1608	Xã Khánh Lộc	4
1610	Xã Phong Điền	4
1611	Xã Phong Lạc	4
1612	Thị trấn Sông Đốc	4
1613	Xã Trần Hợi	4
1614	Thị trấn Trần Văn Thời	4
1615	Xã Khánh An	4
1715	Thị trấn Nước Hai	3
1617	Xã Khánh Hòa	4
1780	Xã Vân Trình	3
1783	Xã Cần Yên	3
1784	Xã Đa Thông	3
1618	Xã Khánh Lâm	4
1619	Xã Khánh Thuận	4
1623	Thị trấn Bảo Lạc	3
1625	Xã Cốc Pàng	3
1626	Xã Cô Ba	3
1627	Xã Đình Phùng	3
1628	Xã Hồng An	3
1629	Xã Hồng Trị	3
1630	Xã Hưng Đạo	3
1631	Xã Hưng Thịnh	3
1632	Xã Huy Giáp	3
1633	Xã Khánh Xuân	3
1634	Xã Kim Cúc	3
1636	Xã Sơn Lập	3
1642	Xã Mông Ân	3
1644	Xã Nam Quang	3
1807	Xã Đình Minh	3
1809	Xã Đoài Côn	3
1810	Xã Khâm Thành	3
1812	Xã Lăng Yên	3
1814	Xã Ngọc Côn	3
1815	Xã Ngọc Khê	3
1647	Xã Tân Việt	3
1837	Xã Hòa Xuân	32
1838	Phường Khánh Xuân	32
1649	Xã Thái Học	3
1652	Xã Vĩnh Quang	3
1653	Xã Yên Thổ	3
1654	Xã Chu Trinh	3
1655	Phường Đề Thám	3
1656	Phường Duyệt Trung	3
1657	Phường Hợp Giang	3
1658	Phường Hoà Chung	3
1659	Xã Hưng Đạo	3
1660	Phường Ngọc Xuân	3
2971	Xã Hồng Phúc	24
1661	Phường Sông Bằng	3
1844	Phường Tân Thành	32
1662	Phường Sông Hiến	3
1663	Phường Tân Giang	3
1845	Phường Tân Tiến	32
1846	Phường Thắng Lợi	32
1664	Xã Vĩnh Quang	3
1665	Xã An Lạc	3
1666	Xã Cô Ngân	3
1667	Xã Đồng Loan	3
1668	Xã Đức Quang	3
1669	Xã Kim Loan	3
1670	Xã Lý Quốc	3
1671	Xã Minh Long	3
1672	Xã Quang Long	3
1673	Xã Thắng Lợi	3
1674	Xã Thị Hoa	3
1675	Xã Thái Đức	3
1676	Thị trấn Thanh Nhật	3
1677	Xã Việt Chu	3
1679	Xã Cải Viên	3
1681	Xã Hạ Thôn	3
1682	Xã Hồng Sĩ	3
1687	Xã Nà Sác	3
1695	Xã Vần Dính	3
1698	Xã Bạch Đằng	3
1699	Xã Bế Triều	3
1701	Xã Bình Long	3
1702	Xã Công Trừng	3
1847	Phường Thống Nhất	32
1703	Xã Đại Tiến	3
1704	Xã Đức Long	3
1956	Xã Ea Kly	32
1957	Xã Ea KNuec	32
1958	Xã Ea Kuăng	32
1959	Xã Ea Phê	32
1705	Xã Đức Xuân	3
1960	Xã Ea Uy	32
1961	Xã Ea Yiêng	32
1962	Xã Ea Yông	32
1963	Xã Hòa An	32
1964	Xã Hòa Đông	32
1965	Xã Hòa Tiến	32
1966	Xã KRông Búk	32
1708	Xã Hồng Việt	3
1709	Xã Hà Trì	3
1710	Xã Hoàng Tung	3
1711	Xã Lê Chung	3
1712	Xã Nam Tuấn	3
1713	Xã Ngũ Lão	3
1714	Xã Nguyễn Huệ	3
1719	Xã Bắc Hợp	3
1722	Xã Hưng Đạo	3
1723	Xã Lang Môn	3
1724	Xã Mai Long	3
1725	Xã Minh Tâm	3
2079	Phường Bửu Hòa	33
1726	Xã Minh Thanh	3
1727	Thị trấn Nguyên Bình	3
1728	Xã Phan Thanh	3
1732	Xã Thịnh Vượng	3
1733	Xã Thái Học	3
1734	Xã Thành Công	3
1738	Xã Yên Lạc	3
1741	Xã Hồng Đại	3
1743	Xã Lương Thiện	3
1745	Thị trấn Tà Lùng	3
1748	Xã Bình Lăng	3
1752	Xã Đoài Khôn	3
2080	Phường Bửu Long	33
1759	Xã Phúc Sen	3
1761	Thị trấn Quảng Uyên	3
1763	Xã Quốc Phong	3
1765	Xã Canh Tân	3
1766	Xã Đức Long	3
1767	Xã Đức Thông	3
1768	Xã Đức Xuân	3
1769	Xã Danh Sỹ	3
1770	Thị trấn Đông Khê	3
1771	Xã Kim Đồng	3
1772	Xã Lê Lợi	3
1785	Xã Lương Can	3
1788	Xã Thanh Long	3
1789	Thị trấn Thông Nông	3
1793	Xã Cô Mười	3
1797	Xã Quang Hán	3
1798	Xã Quang Trung	3
2141	Xã Suối Tre	33
1803	Xã Cao Thăng	3
1819	Xã Thông Hoè	3
2142	Phường Xuân An	33
1820	Thị trấn Trùng Khánh	3
2086	Phường Long Bình	33
1822	Xã Cuôr KNia	32
1823	Xã Ea Bar	32
1828	Xã Tân Hoà	32
1830	Xã Ea Kao	32
1833	Xã Hòa Khánh	32
1835	Xã Hòa Thắng	32
1836	Xã Hòa Thuận	32
1839	Phường Tự An	32
2092	Phường Tam Hiệp	33
2143	Phường Xuân Bình	33
1840	Phường Tân An	32
2093	Phường Tam Hòa	33
1841	Phường Tân Hòa	32
2095	Phường Tân Biên	33
1842	Phường Tân Lập	32
2144	Phường Xuân Hoà	33
2145	Xã Xuân Lập	33
1843	Phường Tân Lợi	32
1849	Phường Thành Nhất	32
2147	Phường Xuân Thanh	33
2149	Xã An Phước	33
2150	Xã Bàu Cạn	33
2153	Xã Cẩm Đường	33
1850	Xã Cư Ê Wi	32
1853	Xã Ea Hu	32
1854	Xã Ea Ktur	32
1865	Xã Ea KPam	32
1866	Xã Ea Kuêh	32
1867	Xã Ea M'DRóh	32
1868	Xã Ea M'nang	32
1869	Thị trấn Ea Pốk	32
1870	Xã Ea Tar	32
1871	Xã Ea Tul	32
2158	Thị trấn Long Thành	33
1873	Thị trấn Quảng Phú	32
2102	Phường Tân Vạn	33
1876	Xã Cư Mốt	32
2134	Xã Bảo Quang	33
1878	Thị trấn Ea Drăng	32
1881	Xã Ea Khal	32
1882	Xã Ea Nam	32
1883	Xã Ea Ral	32
1884	Xã Ea Sol	32
1886	Xã Ea Wy	32
1887	Xã Cư Bông	32
1888	Xã Cư ELang	32
1889	Xã Cư Huê	32
1890	Xã Cư Ni	32
1896	Thị trấn Ea Knốp	32
1910	Xã Ia Lốp	32
1911	Xã Ia RVê	32
1912	Xã Ya Tờ Mốt	32
1913	Xã Băng A Drênh	32
1914	Xã Bình Hòa	32
1915	Thị trấn Buôn Trấp	32
1916	Xã Dray Sáp	32
1917	Xã Dur KMăl	32
1918	Xã Ea Bông	32
1919	Xã Ea Na	32
1920	Xã Quảng Điền	32
1921	Xã Cư Drăm	32
1922	Xã Cư KTy	32
1923	Xã Cư Pui	32
1924	Xã Dang Kang	32
1925	Xã Ea Trul	32
1926	Xã Hòa Lễ	32
1927	Xã Hòa Phong	32
1928	Xã Hòa Sơn	32
1930	Xã Hòa Thành	32
1931	Xã Khuê Ngọc Điền	32
1932	Thị trấn Krông Kmar	32
1933	Xã Yang Mao	32
1934	Xã Yang Reh	32
1935	Xã Chư KBô	32
1936	Xã Cư Né	32
1937	Xã Cư Pơng	32
1938	Xã Ea Ngai	32
1939	Xã Ea Sin	32
1940	Xã Pơng Drang	32
1941	Xã Tân Lập	32
1942	Xã Cư Klông	32
1943	Xã ĐLiê Ya	32
1944	Xã Ea Dăh	32
1945	Xã Ea Hồ	32
1946	Xã Ea Puk	32
1947	Xã Ea Tam	32
1948	Xã Ea Tân	32
1949	Xã Ea Tóh	32
1950	Thị trấn Krông Năng	32
1951	Xã Phú Lộc	32
1952	Xã Phú Xuân	32
1953	Xã Tam Giang	32
1954	Xã Ea Hiu	32
1955	Xã Ea Kênh	32
1967	Thị trấn Phước An	32
1974	Xã Đắk Nuê	32
1975	Xã Đắk Phơi	32
1976	Xã Ea R'Bin	32
3216	Xã Lưu Kỳ	24
1978	Thị trấn Liên Sơn	32
1980	Xã Yang Tao	32
1988	Xã Ea Pil	32
1989	Xã Ea Riêng	32
1990	Xã Ea Trang	32
1991	Xã Krông á	32
1992	Xã Krông Jing	32
1993	Thị trấn M'Đrắk	32
2191	Thị trấn Tân Phú	33
1994	Phường An Bình	32
2140	Phường Phú Bình	33
1995	Phường An Lạc	32
1996	Phường Bình Tân	32
1999	Phường Đạt Hiếu	32
2000	Phường Đoàn Kết	32
8240	Xã Nghĩa An	16
2002	Xã Ea Drông	32
2003	Xã Ea Siên	32
2004	Phường Thống Nhất	32
2007	Xã Đắk DRông	11
2008	Xã Đắk Wil	11
2009	Xã Ea Pô	11
2010	Thị trấn Ea T'Ling	11
2014	Xã Đắk Gằn	11
2015	Xã Đắk Lao	11
2016	Thị trấn Đắk Mil	11
2019	Xã Đắk Sắk	11
2020	Xã Đức Mạnh	11
2021	Xã Đức Minh	11
2022	Xã Long Sơn	11
2024	Xã Đạo Nghĩa	11
2025	Xã Đắk Ru	11
2029	Thị trấn Kiến Đức	11
2037	Xã Đắk N'Dung	11
2252	Xã Bình Thạnh	34
2038	Thị trấn Đức An	11
2041	Xã Thuận Hạnh	11
2042	Xã Thuận Hà	11
2043	Xã Trường Xuân	11
2045	Xã Đắk Plao	11
2049	Xã Quảng Khê	11
2054	Phường Nghĩa Phú	11
2055	Phường Nghĩa Tân	11
2056	Phường Nghĩa Thành	11
2057	Phường Nghĩa Trung	11
2058	Xã Quảng Thành	11
2059	Xã Buôn Choah	11
2060	Xã Đắk Drô	11
2062	Xã Đắk Nang	11
2065	Xã Nam Đà	11
2066	Xã Nâm N'Đir	11
2067	Xã Nâm Nung	11
2068	Xã Nam Xuân	11
2069	Xã Quảng Phú	11
2070	Xã Tân Thành	11
2071	Xã Đắk Búk So	11
2072	Xã Đắk Ngo	11
2073	Xã Đắk R'Tíh	11
2074	Xã Quảng Tâm	11
2077	Phường An Bình	33
2082	Phường Hố Nai	33
2078	Xã An Hoà	33
2087	Phường Long Bình Tân	33
2088	Xã Long Hưng	33
2089	Xã Phước Tân	33
2091	Phường Quyết Thắng	33
2096	Xã Tân Hạnh	33
2098	Phường Tân Hòa	33
2099	Phường Tân Mai	33
2100	Phường Tân Phong	33
2101	Phường Tân Tiến	33
2105	Phường Trảng Dài	33
2107	Xã Bảo Bình	33
2108	Xã Lâm San	33
2109	Xã Long Giao	33
2110	Xã Nhân Nghĩa	33
2116	Xã Xuân Đường	33
2117	Xã Xuân Mỹ	33
2118	Xã Xuân Quế	33
2119	Xã Xuân Tây	33
2120	Thị trấn Định Quán	33
2122	Xã La Ngà	33
2253	Xã Gáo Giồng	34
2124	Xã Phú Cường	33
2125	Xã Phú Hòa	33
2126	Xã Phú Lợi	33
2127	Xã Phú Ngọc	33
2130	Xã Phú Vinh	33
2133	Xã Túc Trưng	33
2135	Xã Bảo Vinh	33
2136	Xã Bàu Sen	33
2255	Xã Mỹ Hiệp	34
2137	Xã Bàu Trâm	33
2138	Xã Bình Lộc	33
2139	Xã Hàng Gòn	33
2146	Xã Xuân Tân	33
2156	Xã Long Đức	33
2157	Xã Long Phước	33
2160	Xã Phước Thái	33
2161	Xã Suối Trầu	33
2162	Xã Tam An	33
2164	Xã Đại Phước	33
2165	Xã Hiệp Phước	33
2166	Xã Long Tân	33
2167	Xã Long Thọ	33
2169	Xã Phú Hội	33
2171	Xã Phú Thạnh	33
2172	Xã Phước An	33
2173	Xã Phước Khánh	33
2174	Xã Phước Thiền	33
2175	Xã Vĩnh Thanh	33
2176	Xã Dak Lua	33
2177	Xã Nam Cát Tiên	33
2182	Xã Phú Lập	33
2184	Xã Phú Lâm	33
2185	Xã Phú Sơn	33
2188	Xã Phú Trung	33
2189	Xã Phú Xuân	33
2192	Xã Thanh Sơn	33
2193	Xã Trà Cổ	33
2196	Xã Gia Tân 1	33
2198	Xã Gia Tân 3	33
2199	Xã Hưng Lộc	33
2200	Xã Lộ 25	33
2201	Xã Quang Trung	33
2202	Xã Xuân Thạnh	33
2203	Xã Xuân Thiện	33
2206	Xã Bàu Hàm	33
2208	Xã Cây Gáo	33
2209	Xã Đồi 61	33
2284	Xã An Phú Thuận	34
2211	Xã Giang Điền	33
2214	Xã Quảng Tiến	33
2215	Xã Sông Thao	33
2270	Xã Mỹ Tân	34
2218	Xã Thanh Bình	33
2219	Thị trấn Trảng Bom	33
2220	Xã Trung Hoà	33
2221	Xã Bình Hòa	33
2258	Xã Mỹ Thọ (Xã)	34
2222	Xã Bình Lợi	33
2224	Xã Mã Đà	33
2275	Phường 3	34
2227	Xã Tân Bình	33
2228	Xã Thạnh Phú	33
2230	Xã Trị An	33
2231	Thị trấn Vĩnh An	33
2234	Thị trấn Gia Ray	33
2279	Xã Tân Thuận Đông	34
2239	Xã Xuân Định	33
2242	Xã Xuân Hưng	33
2243	Xã Xuân Phú	33
2244	Xã Xuân Tâm	33
2245	Xã Xuân Thọ	33
2246	Xã Xuân Thành	33
2247	Xã Xuân Trường	33
2248	Xã An Bình	34
2249	Xã Ba Sao	34
2250	Xã Bình Hàng Tây	34
2291	Xã Tân Phú	34
2251	Xã Bình Hàng Trung	34
2254	Xã Mỹ Hội	34
2256	Xã Mỹ Long	34
2259	Xã Mỹ Xương	34
2257	Thị trấn Mỹ Thọ (Thị trấn )	34
2261	Xã Phong Mỹ	34
2260	Xã Nhị Mỹ	34
2262	Xã Phương Thịnh	34
2293	Xã Long Khánh A	34
2263	Xã Phương Trà	34
2294	Xã Long Khánh B	34
2264	Xã Tân Hội Trung	34
2269	Phường Mỹ Phú	34
2265	Xã Tân Nghĩa	34
2266	Xã Hòa An	34
2268	Xã Mỹ Ngãi	34
2271	Xã Mỹ Trà	34
2273	Phường 11	34
2274	Phường 2	34
2277	Phường 6	34
2278	Xã Tịnh Thới	34
2283	Xã An Nhơn	34
2285	Thị trấn Cái Tàu Hạ	34
2286	Xã Hòa Tân	34
2288	Xã Phú Long	34
2289	Xã Tân Bình	34
2292	Xã Tân Phú Trung	34
2295	Xã Long Thuận	34
2297	Xã Phú Thuận B	34
2298	Xã Thường Lạc	34
2299	Xã Thường Phước 1	34
2301	Xã Thường Thới Hậu A	34
2300	Xã Thường Phước 2	34
2302	Xã Thường Thới Hậu B	34
2303	Xã Thường Thới Tiền	34
2304	Xã An Bình A	34
2305	Xã An Bình B	34
2309	Xã Bình Thạnh	34
2311	Xã Bình Thạnh Trung	34
2715	Thị trấn KBang	5
2312	Xã Bình Thành	34
2786	Phường Hoa Lư	5
2314	Xã Định Yên	34
2789	Phường Phù Đổng	5
2315	Xã Hội An Đông	34
2317	Xã Long Hưng A	34
2330	Xã Phong Hòa	34
2331	Xã Tân Dương	34
2318	Xã Long Hưng B	34
2319	Xã Mỹ An Hưng A	34
2320	Xã Mỹ An Hưng B	34
2321	Xã Tân Khánh Trung	34
2796	Phường Yên Đỗ	5
2797	Phường Yên Thế	5
2324	Xã Định Hòa	34
2332	Xã Tân Hòa	34
2325	Xã Hòa Long	34
2338	Phường 2	34
2339	Phường 3	34
2340	Phường 4	34
2327	Thị trấn Lai Vung	34
2804	Thị trấn Kẻ Sặt	24
2328	Xã Long Hậu	34
2839	Phường Cộng Hoà	24
2329	Xã Long Thắng	34
2848	Xã Nhân Huệ	24
2333	Xã Tân Phước	34
2334	Xã Tân Thành	34
2335	Xã Vĩnh Thới	34
2336	Phường An Hoà	34
2337	Phường 1	34
2341	Xã Tân Khánh Đông	34
2350	Xã Phú Hiệp	34
2351	Xã Phú Ninh	34
2342	Xã Tân Phú Đông	34
2360	Xã Tân Công Chí	34
2343	Phường Tân Quy Đông	34
2344	Xã Tân Quy Tây	34
2345	Xã An Hòa	34
2348	Xã Phú Cường	34
2349	Xã Phú Đức	34
2352	Xã Phú Thọ	34
2353	Xã Phú Thành A	34
2354	Xã Phú Thành B	34
2355	Xã Tân Công Sính	34
2356	Thị trấn Tràm Chim	34
2357	Xã An Phước	34
2358	Xã Bình Phú	34
2359	Thị trấn Sa Rài	34
2361	Xã Tân Hộ Cơ	34
2362	Xã Tân Phước	34
2363	Xã Tân Thành A	34
2368	Xã Bình Thành	34
2365	Xã Thông Bình	34
2371	Xã Tân Hòa	34
2366	Xã An Phong	34
2367	Xã Bình Tấn	34
2369	Xã Phú Lợi	34
2370	Xã Tân Bình	34
2374	Xã Tân Mỹ	34
2380	Xã Hưng Thạnh	34
2375	Xã Tân Phú	34
2376	Xã Tân Quới	34
2381	Xã Láng Biển	34
2377	Xã Tân Thạnh	34
2378	Thị trấn Thanh Bình	34
2379	Xã Đốc Binh Kiều	34
2383	Xã Mỹ An (Xã)	34
2384	Xã Mỹ Đông	34
2385	Xã Mỹ Hòa	34
2388	Xã Tân Kiều	34
2390	Xã Thanh Mỹ	34
2391	Xã Trường Xuân	34
2392	Phường Hòa An	25
2393	Phường Hòa Phát	25
2576	Phường An Bình	5
2395	Phường Hòa Thọ Tây	25
2577	Phường An Phú	5
2396	Phường Hòa Xuân	25
2405	Phường Hòa Thuận Tây	25
2409	Phường Thanh Bình	25
2412	Xã Hòa Châu	25
2413	Xã Hòa Khương	25
2414	Xã Hòa Liên	25
2415	Xã Hòa Nhơn	25
2416	Xã Hòa Ninh	25
2417	Xã Hòa Phong	25
2418	Xã Hòa Phú	25
2419	Xã Hòa Phước	25
2421	Xã Hòa Tiến	25
2422	Phường Hòa Hiệp Bắc	25
2423	Phường Hòa Hiệp Nam	25
2424	Phường Hòa Khánh Bắc	25
2425	Phường Hòa Khánh Nam	25
2579	Phường An Tân	5
2426	Phường Hòa Minh	25
2427	Phường Hoà Hải	25
2428	Phường Hoà Quý	25
2435	Phường Nại Hiên Đông	25
2465	Xã Sam Mứn	31
2467	Xã Thanh Chăn	31
2468	Xã Thanh Hưng	31
2469	Xã Thanh Luông	31
2474	Thị trấn Điện Biên Đông	31
2479	Xã Na Son	31
2480	Xã Nong U	31
2487	Phường Him Lam	31
2489	Phường Nam Thanh	31
2490	Phường Noong Bua	31
2492	Phường Tân Thanh	31
2494	Xã Thanh Minh	31
2498	Xã ẳng Tở	31
2500	Thị trấn Mường ảng	31
2501	Xã Mường Đăng	31
2502	Xã Mường Lạn	31
2503	Xã Nặm Lịch	31
9107	Phường Thuỷ Biều	22
2510	Thị trấn Mường Chà	31
2583	Phường Tây Sơn	5
2512	Xã Nậm Nèn	31
2513	Xã Pa Ham	31
2514	Xã Sa Lông	31
2515	Xã Xá Tổng	31
2516	Xã Chung Chải	31
2517	Xã Huổi Lếnh	31
2518	Xã Leng Su Sìn	31
2519	Xã Mường Nhé	31
2520	Xã Mường Toong	31
2521	Xã Nậm Kè	31
2522	Xã Nậm Vì	31
2523	Xã Pá Mỳ	31
2529	Xã Chà Tở	31
2532	Xã Nậm Nhừ	31
2533	Xã Nậm Tin	31
2534	Xã Nà Bủng	31
2535	Xã Na Cô Sa	31
2536	Xã Nà Hỳ	31
2537	Xã Nà Khoa	31
2538	Xã Pa Tần	31
2539	Xã Phìn Hồ	31
2540	Xã Si Pa Phìn	31
2541	Xã Vàng Đán	31
2542	Xã Huổi Só	31
2543	Xã Lao Xả Phình	31
2544	Xã Mường Báng	31
2545	Xã Mường Đun	31
2546	Xã Sáng Nhè	31
2547	Xã Sính Phình	31
2548	Xã Tả Phìn	31
2555	Phường Na Lay	31
9110	Phường Vĩ Dạ	22
2557	Xã Chiềng Đông	31
2558	Xã Chiềng Sinh	31
2561	Xã Mường Thín	31
9111	Phường Vĩnh Ninh	22
2563	Xã Nà Sáy	31
2564	Xã Nà Tòng	31
2565	Xã Phình Sáng	31
2566	Xã Pú Nhung	31
2567	Xã Pú Xi	31
2568	Xã Quài Cang	31
2569	Xã Quài Nưa	31
2571	Xã Rạng Đông	31
2572	Xã Tỏa Tình	31
2573	Xã Ta Ma	31
2574	Xã Tênh Phông	31
2575	Thị trấn Tuần Giáo	31
2578	Phường An Phước	5
2581	Phường Ngô Mây	5
2584	Xã Thành An	5
2587	Phường Cheo Reo	5
2588	Xã Chư Băh	5
2590	Phường Hòa Bình	5
2591	Xã Ia RBol	5
2593	Xã Ia Sao	5
2594	Phường Sông Bờ	5
2596	Xã Chư Jôr	5
2597	Xã Đăk Tơ Ver	5
2608	Xã Nghĩa Hưng	5
2609	Thị trấn Phú Hòa	5
2610	Xã Bàu Cạn	5
2613	Xã Ia Băng	5
2614	Xã Ia Bang	5
2615	Xã Ia Boòng	5
2625	Xã Ia Piơr	5
2626	Xã Ia Púch	5
2627	Xã Ia Tôr	5
2629	Xã Thăng Hưng	5
2630	Xã Chư Don	5
2637	Xã Ia Rong	5
2638	Thị trấn Nhơn Hoà	5
2639	Xã AL Bá	5
3631	Phường 7	21
2640	Xã AYun	5
2641	Xã Bờ Ngoong	5
2643	Xã Chư Pơng	5
2644	Thị trấn Chư Sê	5
2645	Xã Dun	5
3632	Phường 8	21
3633	Phường 9	21
2647	Xã Ia Blang	5
2648	Xã Ia Glai	5
2650	Xã Ia Ko	5
2651	Xã Ia Pal	5
2652	Xã Ia Tiêm	5
2653	Xã Kông HTok	5
2654	Thị trấn Chư Ty	5
2655	Xã Ia Din	5
2656	Xã Ia Dơk	5
2660	Xã Ia Kriêng	5
2661	Xã Ia Lang	5
2662	Xã Ia Nan	5
2663	Xã Ia Pnôn	5
2664	Xã A Dơk	5
2668	Xã Glar	5
2669	Xã H'Neng	5
2670	Xã Hải Yang	5
2671	Xã Hà Bầu	5
2675	Xã Ia Pết	5
2678	Xã Nam Yang	5
2686	Xã Tân An	5
2687	Xã Ya Hội	5
2688	Xã Yang Bắc	5
2689	Xã Ia Bă	5
2690	Xã Ia Chia	5
2691	Xã Ia Dêr	5
2692	Xã Ia Grăng	5
2697	Xã Ia O	5
2699	Xã Ia Sao	5
2700	Xã Ia Tô	5
2701	Xã Ia Yok	5
2706	Xã Ia Ma Rơn	5
2711	Xã Đăk HLơ	5
3641	Phường Phước Long A	21
2717	Xã Kông Lơng Khơng	5
2718	Xã Kông Pla	5
2719	Xã KRong	5
2720	Xã Lơ Ku	5
2721	Xã Nghĩa An	5
2723	Xã Sơn Lang	5
2724	Xã Tơ Tung	5
2725	Xã An Trung	5
2726	Xã Chơ Long	5
2727	Xã Chư Krêy	5
2739	Xã Chư Drăng	5
2740	Xã Chư Gu	5
2741	Xã Chư Ngọc	5
2742	Xã Chư Rcăm	5
2743	Xã Đất Bằng	5
2744	Xã Ia HDreh	5
2745	Xã Ia Mláh	5
2746	Xã Ia RMok	5
2748	Xã Ia RSươm	5
2750	Xã Phú Cần	5
2751	Thị trấn Phú Túc	5
2752	Xã Uar	5
2753	Xã Ayun	5
2757	Xã Đăk Trôi	5
2758	Xã Đăk Yă	5
2760	Xã Hà Ra	5
2761	Xã Kon Chiêng	5
2762	Thị trấn Kon Dơng	5
2763	Xã Kon Thụp	5
2764	Xã Lơ Pang	5
2765	Xã Ayun Hạ	5
2766	Xã Chrôh Pơnan	5
2767	Xã Chư A Thai	5
2768	Xã Ia Ake	5
2769	Xã Ia Hiao	5
2770	Xã Ia Peng	5
2771	Xã Ia Piar	5
2772	Xã Ia Sol	5
2773	Xã Ia Yeng	5
2774	Thị trấn Phú Thiện	5
3458	Xã Tân Thới Nhì	21
2775	Xã An Phú	5
2777	Phường Chi Lăng	5
2779	Xã Chư HDrông	5
2782	Xã Diên Phú	5
2783	Xã Gào	5
2784	Phường Hội Phú	5
2785	Phường Hội Thương	5
2787	Xã Ia Kênh	5
2788	Phường Ia Kring	5
2790	Xã Tân Sơn	5
3459	Xã Tân Xuân	21
2792	Phường Thắng Lợi	5
2972	Xã Hồng Thái	24
2793	Phường Thống Nhất	5
2794	Phường Trà Bá	5
2795	Xã Trà Đa	5
2798	Xã Bình Minh	24
3462	Xã Xuân Thới Đông	21
2799	Xã Bình Xuyên	24
2973	Xã Hiệp Lực	24
2800	Xã Cổ Bi	24
3650	Phường 12	21
2801	Xã Hồng Khê	24
3651	Phường 13	21
2802	Xã Hùng Thắng	24
2803	Xã Hưng Thịnh	24
2805	Xã Long Xuyên	24
3044	Xã Cao Thắng	24
2806	Xã Nhân Quyền	24
3659	Phường 7	21
3661	Phường 9	21
3665	Phường Phú Thọ Hòa	21
2807	Xã Tân Hồng	24
3667	Phường Sơn Kỳ	21
2808	Xã Tân Việt	24
3668	Phường Tân Quý	21
2809	Xã Thái Dương	24
3671	Phường Tân Thành	21
2810	Xã Thái Học	24
3672	Phường Tây Thạnh	21
2811	Xã Thái Hòa	24
2812	Xã Thúc Kháng	24
2813	Xã Tráng Liệt	24
2942	Xã Thái Thịnh	24
2814	Xã Vĩnh Hồng	24
2815	Xã Vĩnh Tuy	24
3675	Phường Hiệp Bình Chánh	21
2816	Xã Cẩm Định	24
3681	Phường Linh Xuân	21
2817	Xã Cẩm Điền	24
2849	Phường Phả Lại	24
2818	Xã Cẩm Đoài	24
2858	Xã Gia Hòa	24
2819	Xã Cẩm Đông	24
2820	Thị trấn Cẩm Giàng	24
2821	Xã Cẩm Hoàng	24
2870	Xã Phương Hưng	24
2822	Xã Cẩm Hưng	24
2823	Xã Cẩm Phúc	24
2824	Xã Cẩm Sơn	24
2825	Xã Cẩm Văn	24
2826	Xã Cẩm Vũ	24
2827	Xã Cao An	24
2828	Xã Đức Chính	24
2829	Xã Kim Giang	24
3684	Phường Trường Thọ	21
3688	Xã Lạc Nông	28
2830	Thị trấn Lai Cách	24
3712	Xã Thượng Bình	28
3713	Xã Tiên Kiều	28
3714	Xã Việt Hồng	28
3715	Thị trấn Việt Quang	28
3716	Xã Việt Vinh	28
3717	Xã Vĩnh Hảo	28
3719	Thị trấn Vĩnh Tuy	28
3720	Xã Vô Điếm	28
2831	Xã Lương Điền	24
2832	Xã Ngọc Liên	24
3148	Phường Trần Thành Ngọ	24
2833	Xã Tân Trường	24
2834	Xã Thạch Lỗi	24
2835	Xã An Lạc	24
2840	Phường Chí Minh	24
2841	Xã Đồng Lạc	24
2844	Xã Hoàng Tiến	24
2952	Xã Hiệp Cát	24
2845	Xã Hưng Đạo	24
2847	Xã Lê Lợi	24
2850	Phường Sao Đỏ	24
2851	Xã Tân Dân	24
2852	Phường Thái Học	24
2853	Phường Văn An	24
2854	Xã Văn Đức	24
2855	Xã Đồng Quang	24
3921	Phường Xuân Tảo	23
2856	Xã Đức Xương	24
3922	Phường Cống Vị	23
2857	Xã Đoàn Thượng	24
2859	Xã Gia Khánh	24
3287	Xã Đông Phú	20
3289	Xã Đông Phước A	20
2860	Thị trấn Gia Lộc	24
2861	Xã Gia Lương	24
2979	Thị trấn Ninh Giang	24
2862	Xã Gia Tân	24
2893	Phường Thạch Khôi	24
2863	Xã Gia Xuyên	24
2896	Phường Trần Hưng Đạo	24
2864	Xã Hồng Hưng	24
2865	Xã Hoàng Diệu	24
2866	Xã Lê Lợi	24
2897	Phường Trần Phú	24
2867	Xã Liên Hồng	24
2914	Thị trấn Phú Thái	24
2868	Xã Nhật Tân	24
2876	Xã Trùng Khánh	24
2869	Xã Phạm Trấn	24
2871	Xã Quang Minh	24
2915	Xã Phúc Thành A	24
2916	Xã Tam Kỳ	24
2872	Xã Tân Tiến	24
2987	Xã Tân Quang	24
2873	Xã Thống Kênh	24
2874	Xã Thống Nhất	24
2989	Xã Văn Giang	24
2875	Xã Toàn Thắng	24
2990	Xã Văn Hội	24
2877	Xã Yết Kiêu	24
2881	Phường Cẩm Thượng	24
2878	Phường ái Quốc	24
2885	Phường Ngọc Châu	24
2879	Xã An Châu	24
2887	Phường Nhị Châu	24
2880	Phường Bình Hàn	24
2882	Phường Hải Tân	24
2883	Phường Lê Thanh Nghị	24
2884	Xã Nam Đồng	24
2890	Phường Tứ Minh	24
2894	Phường Thanh Bình	24
2895	Xã Thượng Đạt	24
2898	Phường Việt Hoà	24
2899	Xã Bình Dân	24
2900	Xã Cẩm La	24
2992	Xã An Thanh	24
2901	Xã Cổ Dũng	24
2902	Xã Cộng Hòa	24
2903	Xã Đại Đức	24
2904	Xã Đồng Gia	24
2998	Xã Đông Kỳ	24
2905	Xã Kim Anh	24
3924	Phường Điện Biên	23
2906	Xã Kim Đính	24
3925	Phường Giảng Võ	23
3926	Phường Kim Mã	23
2907	Xã Kim Khê	24
2956	Xã Nam Hưng	24
2908	Xã Kim Lương	24
2909	Xã Kim Tân	24
2911	Xã Lai Vu	24
2912	Xã Liên Hòa	24
2913	Xã Ngũ Phúc	24
3927	Phường Liễu Giai	23
2917	Xã Thượng Vũ	24
2919	Xã Việt Hưng	24
2918	Xã Tuấn Hưng	24
2922	Xã Bạch Đằng	24
2920	Xã An Phụ	24
2921	Xã An Sinh	24
2923	Xã Duy Tân	24
2934	Thị trấn Minh Tân	24
2924	Xã Hiến Thành	24
2925	Xã Hiệp An	24
3929	Phường Ngọc Khánh	23
3931	Phường Phúc Xá	23
2926	Xã Hiệp Hòa	24
3934	Phường Trúc Bạch	23
2927	Xã Hiệp Sơn	24
2928	Xã Hoành Sơn	24
2929	Thị trấn Kinh Môn	24
2939	Xã Tân Dân	24
2930	Xã Lạc Long	24
3935	Phường Vĩnh Phúc	23
3936	Xã Ba Trại	23
2931	Xã Lê Ninh	24
2932	Xã Long Xuyên	24
2933	Xã Minh Hòa	24
3939	Xã Cổ Đô	23
2935	Xã Phạm Mệnh	24
2940	Xã Thất Hùng	24
2936	Thị trấn Phú Thứ	24
3941	Xã Châu Sơn	23
2937	Xã Phúc Thành B	24
3946	Xã Minh Châu	23
3947	Xã Minh Quang	23
2938	Xã Quang Trung	24
3955	Xã Tản Hồng	23
2941	Xã Thái Sơn	24
2943	Xã Thăng Long	24
2944	Xã Thượng Quận	24
2945	Xã An Bình	24
3068	Xã Bắc Sơn	24
2946	Xã An Lâm	24
2947	Xã An Sơn	24
3293	Xã Phú An	20
2948	Xã Cộng Hòa	24
2958	Xã Nam Tân	24
2949	Xã Đồng Lạc	24
2950	Xã Hồng Phong	24
2951	Xã Hợp Tiến	24
2953	Xã Minh Tân	24
2963	Xã Thanh Quang	24
2954	Xã Nam Chính	24
2955	Xã Nam Hồng	24
2968	Xã Hồng Dụ	24
2957	Thị trấn Nam Sách	24
2970	Xã Hồng Phong	24
2959	Xã Nam Trung	24
6443	Xã Giao Nhân	14
2960	Xã Phú Điền	24
2961	Xã Quốc Tuấn	24
2962	Xã Thái Tân	24
2964	Xã ứng Hoè	24
2965	Xã An Đức	24
2966	Xã Đồng Tâm	24
2967	Xã Đông Xuyên	24
2969	Xã Hồng Đức	24
2974	Xã Hoàng Hanh	24
2975	Xã Hưng Long	24
2976	Xã Hưng Thái	24
3073	Xã Hồng Thái	24
2977	Xã Kiến Quốc	24
2978	Xã Nghĩa An	24
2980	Xã Ninh Hải	24
2981	Xã Ninh Hòa	24
3076	Xã Nam Sơn	24
2982	Xã Ninh Thành	24
3110	Phường Hợp Đức	24
2983	Xã Quang Hưng	24
3111	Phường Minh Đức	24
2984	Xã Quyết Thắng	24
3112	Phường Ngọc Hải	24
2985	Xã Tân Hương	24
2986	Xã Tân Phong	24
2988	Xã Vạn Phúc	24
2991	Xã Vĩnh Hòa	24
2993	Xã Bình Lăng	24
3116	Phường Anh Dũng	24
2994	Xã Cộng Lạc	24
3119	Phường Hoà Nghĩa	24
2995	Xã Đại Đồng	24
2996	Xã Đại Hợp	24
2997	Xã Dân Chủ	24
2999	Xã Hà Kỳ	24
3297	Thị trấn Cái Tắc	20
3000	Xã Hà Thanh	24
3001	Xã Hưng Đạo	24
3002	Xã Kỳ Sơn	24
3010	Xã Quang Phục	24
3003	Xã Minh Đức	24
3004	Xã Ngọc Kỳ	24
3006	Xã Nguyên Giáp	24
3007	Xã Phượng Kỳ	24
3011	Xã Quang Trung	24
3008	Xã Quảng Nghiệp	24
3012	Thị trấn Tứ Kỳ	24
3009	Xã Quang Khải	24
3022	Xã Hợp Đức	24
3023	Xã Liên Mạc	24
3013	Xã Tứ Xuyên	24
3014	Xã Tái Sơn	24
3041	Xã Trường Thành	24
3015	Xã Tân Kỳ	24
3016	Xã Tây Kỳ	24
3017	Xã Tiên Động	24
3018	Xã Văn Tố	24
3019	Xã An Lương	24
3043	Xã Vĩnh Lập	24
3020	Xã Cẩm Chế	24
3021	Xã Hồng Lạc	24
3024	Xã Phượng Hoàng	24
3335	Thị trấn Kinh Cùng	20
3025	Xã Quyết Thắng	24
3026	Xã Tân An	24
3027	Xã Tân Việt	24
3347	Phường III	20
3028	Xã Thanh An	24
3029	Xã Thanh Bính	24
3030	Xã Thanh Cường	24
3031	Xã Thanh Hải	24
3032	Xã Thanh Hồng	24
3033	Thị trấn Thanh Hà	24
3034	Xã Thanh Khê	24
3035	Xã Thanh Lang	24
3036	Xã Thanh Sơn	24
3037	Xã Thanh Thủy	24
3038	Xã Thanh Xá	24
3039	Xã Thanh Xuân	24
3040	Xã Tiền Tiến	24
3042	Xã Việt Hồng	24
3045	Xã Chi Lăng Bắc	24
3350	Phường V	20
3351	Xã Vị Tân	20
3046	Xã Chi Lăng Nam	24
3047	Xã Diên Hồng	24
3048	Xã Đoàn Kết	24
3049	Xã Đoàn Tùng	24
3050	Xã Hồng Quang	24
3051	Xã Hùng Sơn	24
3353	Thị trấn Nàng Mau	20
3052	Xã Lam Sơn	24
3128	Phường Thành Tô	24
3053	Xã Lê Hồng	24
3054	Xã Ngô Quyền	24
3055	Xã Ngũ Hùng	24
3056	Xã Phạm Kha	24
3057	Xã Tứ Cường	24
3058	Xã Tân Trào	24
3059	Xã Thanh Giang	24
3132	Phường Hùng Vương	24
3133	Phường Minh Khai	24
3060	Thị trấn Thanh Miện	24
3134	Phường Phạm Hồng Thái	24
3061	Xã Thanh Tùng	24
3062	Xã Tiền Phong	24
3141	Phường Bắc Sơn	24
3063	Xã An Đồng	24
3064	Thị trấn An Dương	24
3142	Phường Đồng Hoà	24
3065	Xã An Hồng	24
3066	Xã An Hoà	24
3088	Xã Quang Hưng	24
3067	Xã An Hưng	24
3069	Xã Đại Bản	24
3070	Xã Đặng Cương	24
3071	Xã Đồng Thái	24
3072	Xã Hồng Phong	24
3074	Xã Lê Lợi	24
3075	Xã Lê Thiện	24
3077	Xã Quốc Tuấn	24
3078	Xã Tân Tiến	24
3079	Thị trấn An Lão	24
3080	Xã An Thắng	24
3091	Xã Tân Viên	24
3092	Xã Thái Sơn	24
3081	Xã An Thọ	24
3093	Thị trấn Trường Sơn	24
3082	Xã An Thái	24
3083	Xã An Tiến	24
3084	Xã Bát Trang	24
3085	Xã Chiến Thắng	24
3086	Xã Mỹ Đức	24
3098	Thị trấn Cát Hải	24
3087	Xã Quốc Tuấn	24
3099	Xã Đồng Bài	24
3100	Xã Gia Luận	24
3089	Xã Quang Trung	24
3103	Xã Nghĩa Lộ	24
3107	Xã Việt Hải	24
3090	Xã Tân Dân	24
3094	Xã Trường Thọ	24
3109	Phường Bàng La	24
3095	Xã Trường Thành	24
7989	Phường Thanh Hà	25
3096	Đảo Bạch Long Vĩ	24
3097	Thị trấn Cát Bà	24
3101	Xã Hiền Hào	24
3102	Xã Hoàng Châu	24
3113	Phường Ngọc Xuyên	24
3114	Phường Vạn Hương	24
3115	Phường Vạn Sơn	24
3117	Phường Đa Phúc	24
3120	Phường Hưng Đạo	24
3123	Phường Đằng Hải	24
3125	Phường Đông Hải 1	17
3126	Phường Đông Hải 2	17
3127	Phường Nam Hải	24
3358	Xã Vị Thuỷ	20
3129	Phường Tràng Cát	24
3131	Phường Hoàng Văn Thụ	24
3136	Phường Quán Toan	24
3138	Phường Sở Dầu	24
3144	Phường Nam Sơn	24
3145	Phường Ngọc Sơn	24
3146	Phường Phù Liễn	24
3147	Phường Quán Trữ	24
3149	Phường Tràng Minh	24
3150	Phường Văn Đẩu	24
3151	Xã Đại Đồng	24
3152	Xã Đại Hợp	24
3153	Xã Đại Hà	24
3154	Xã Đoàn Xá	24
3155	Xã Đông Phương	24
3156	Xã Du Lễ	24
3164	Xã Tân Trào	24
3157	Xã Hữu Bằng	24
3174	Phường Dư Hàng Kênh	24
3158	Xã Kiến Quốc	24
3176	Phường Hàng Kênh	24
3159	Xã Minh Tân	24
3177	Phường Kênh Dương	24
3160	Xã Ngũ Đoan	24
3182	Phường Trần Nguyên Hãn	24
3161	Xã Ngũ Phúc	24
3162	Thị trấn Núi Đối	24
3183	Phường Vĩnh Niệm	24
3163	Xã Tân Phong	24
3165	Xã Thanh Sơn	24
3166	Xã Thuận Thiên	24
3167	Xã Thuỵ Hương	24
3191	Phường Lạch Tray	24
3168	Xã Tú Sơn	24
3172	Phường Đông Hải	24
3186	Phường Đằng Giang	24
3188	Phường Đông Khê	24
3197	Xã An Lư	24
3198	Xã An Sơn	24
3392	Phường 13	21
3199	Xã Cao Nhân	24
3397	Phường 2	21
3398	Phường 21	21
3200	Xã Chính Mỹ	24
3201	Xã Đông Sơn	24
3202	Xã Dương Quan	24
3203	Xã Gia Đức	24
3204	Xã Gia Minh	24
3205	Xã Hợp Thành	24
3402	Phường 26	21
3206	Xã Hoà Bình	24
3207	Xã Hoa Động	24
3209	Xã Kỳ Sơn	24
3405	Phường 3	21
3407	Phường 6	21
3408	Phường 7	21
3409	Xã An Thới Đông	21
3410	Xã Bình Khánh	21
3210	Xã Kênh Giang	24
3217	Xã Lưu Kiếm	24
3211	Xã Kiền Bái	24
3212	Xã Lại Xuân	24
3213	Xã Lập Lễ	24
3215	Xã Liên Khê	24
3218	Xã Mỹ Đồng	24
3227	Xã Tam Hưng	24
3219	Thị trấn Minh Đức	24
3220	Xã Minh Tân	24
3221	Xã Ngũ Lão	24
3223	Xã Phả Lễ	24
3418	Xã Bình Mỹ	21
3224	Xã Phục Lễ	24
3225	Xã Phù Ninh	24
3231	Xã Thuỷ Sơn	24
3226	Xã Quảng Thanh	24
3229	Xã Thiên Hương	24
3230	Xã Thuỷ Đường	24
8998	Thị trấn Dương Minh Châu	29
3233	Xã Trung Hà	24
3237	Xã Đại Thắng	24
8999	Xã Lộc Ninh	29
3234	Xã Bạch Đằng	24
3235	Xã Bắc Hưng	24
3241	Xã Khởi Nghĩa	24
3236	Xã Cấp Tiến	24
3238	Xã Đoàn Lập	24
3240	Xã Hùng Thắng	24
3242	Xã Kiến Thiết	24
3243	Xã Nam Hưng	24
3244	Xã Quang Phục	24
3247	Xã Tây Hưng	24
3245	Xã Quyết Tiến	24
3246	Xã Tự Cường	24
3248	Xã Tiên Cường	24
3249	Xã Tiên Hưng	24
3250	Thị trấn Tiên Lãng	24
3255	Xã Toàn Thắng	24
3251	Xã Tiên Minh	24
3252	Xã Tiên Thắng	24
3253	Xã Tiên Thanh	24
3254	Xã Tiên Tiến	24
3256	Xã Vinh Quang	24
3257	Xã An Hoà	24
3258	Xã Cổ Am	24
3259	Xã Cộng Hiền	24
3260	Xã Cao Minh	24
3265	Xã Hoà Bình	24
3261	Xã Đồng Minh	24
3262	Xã Dũng Tiến	24
3263	Xã Giang Biên	24
3264	Xã Hiệp Hoà	24
3268	Xã Liên Am	24
3266	Xã Hưng Nhân	24
3269	Xã Lý Học	24
3267	Xã Hùng Tiến	24
3270	Xã Nhân Hoà	24
3279	Xã Trung Lập	24
3271	Xã Tam Cường	24
3272	Xã Tam Đa	24
3273	Xã Tân Hưng	24
3274	Xã Tân Liên	24
3275	Xã Thắng Thuỷ	24
3276	Xã Thanh Lương	24
3284	Xã Vĩnh Phong	24
3277	Xã Tiền Phong	24
3278	Xã Trấn Dương	24
3280	Xã Việt Tiến	24
3286	Xã Vĩnh Tiến	24
3281	Xã Vĩnh An	24
3282	Thị trấn Vĩnh Bảo	24
3283	Xã Vĩnh Long	24
3285	Xã Vinh Quang	24
3290	Xã Đông Thạnh	20
3291	Thị trấn Mái Dầm	20
3292	Thị trấn Ngã Sáu	20
3294	Xã Phú Hữu	20
3300	Thị trấn Rạch Gòi	20
3295	Xã Phú Tân	20
3296	Thị trấn Bảy Ngàn	20
3299	Xã Nhơn Nghĩa A	20
3301	Xã Tân Hoà	20
3302	Xã Tân Phú Thạnh	20
3303	Xã Thạnh Xuân	20
3304	Xã Trường Long A	20
3305	Xã Trường Long Tây	20
3308	Xã Thuận Hòa	20
3312	Xã Vĩnh Viễn A	20
3313	Xã Xà Phiên	20
3314	Phường Bình Thạnh	20
3315	Xã Long Bình	20
3316	Xã Long Phú	20
3319	Xã Tân Phú	20
3317	Xã Long Trị	20
3318	Xã Long Trị A	20
3322	Phường Vĩnh Tường	20
3323	Xã Đại Thành	20
3324	Xã Hiệp Lợi	20
3325	Phường Hiệp Thành	20
3328	Xã Tân Thành	20
3329	Xã Bình Thành	20
3332	Xã Hiệp Hưng	20
3334	Xã Hòa Mỹ	20
3337	Xã Phụng Hiệp	20
3338	Xã Phương Bình	20
3341	Xã Tân Long	20
3431	Xã Tân Thạnh Tây	21
3343	Xã Thạnh Hòa	20
3359	Xã Vị Trung	20
3344	Xã Hoả Lựu	20
3362	Xã Vĩnh Tường	20
3345	Xã Hoả Tiến	20
3348	Phường IV	20
3613	Phường Tân Phong	21
3349	Xã Tân Tiến	20
3355	Xã Vị Đông	20
3356	Xã Vị Thắng	20
3357	Xã Vị Thanh	20
3360	Xã Vĩnh Thuận Tây	20
3361	Xã Vĩnh Trung	20
3363	Xã An Phú Tây	21
3364	Xã Bình Chánh	21
3366	Xã Bình Lợi	21
3365	Xã Bình Hưng	21
3367	Xã Đa Phước	21
3368	Xã Hưng Long	21
3371	Xã Phong Phú	21
3372	Xã Quy Đức	21
3373	Xã Tân Kiên	21
3374	Xã Tân Nhựt	21
3375	Xã Tân Quý Tây	21
3614	Phường Tân Phú	21
3615	Phường Tân Quy	21
3376	Thị trấn Tân Túc	21
3377	Xã Vĩnh Lộc A	21
3378	Xã Vĩnh Lộc B	21
3383	Phường Bình Hưng Hoà B	21
3384	Phường Bình Trị Đông	21
3385	Phường Bình Trị Đông A	21
3386	Phường Bình Trị Đông B	21
3387	Phường Tân Tạo	21
3411	Thị trấn Cần Thạnh	21
3412	Xã Long Hoà	21
3616	Phường Tân Thuận Đông	21
3620	Phường 11	21
3417	Xã An Phú	21
3419	Thị trấn Củ Chi	21
3433	Xã Thái Mỹ	21
3420	Xã Hòa Phú	21
3437	Phường 1	21
3440	Phường 12	21
3422	Xã Phạm Văn Cội	21
3423	Xã Phú Hoà Đông	21
3627	Phường 3	21
3424	Xã Phú Mỹ Hưng	21
3425	Xã Phước Hiệp	21
3441	Phường 13	21
3426	Xã Phước Thạnh	21
3628	Phường 4	21
3427	Xã Phước Vĩnh An	21
3442	Phường 14	21
3429	Xã Tân Phú Trung	21
3430	Xã Tân Thạnh Đông	21
3432	Xã Tân Thông Hội	21
3446	Phường 3	21
3434	Xã Trung An	21
3435	Xã Trung Lập Hạ	21
3436	Xã Trung Lập Thượng	21
3454	Xã Đông Thạnh	21
3630	Phường 6	21
3460	Xã Thới Tam Thôn	21
3461	Xã Trung Chánh	21
3463	Xã Xuân Thới Sơn	21
3467	Thị trấn Nhà Bè	21
3464	Xã Xuân Thới Thượng	21
3468	Xã Nhơn Đức	21
9007	Thị trấn Gò Dầu	29
9008	Xã Hiệp Thạnh	29
3466	Xã Long Thới	21
9014	Xã Hiệp Tân	29
3469	Xã Phú Xuân	21
3471	Xã Phước Lộc	21
3470	Xã Phước Kiển	21
3472	Phường 1	21
3473	Phường 10	21
3474	Phường 11	21
3528	Phường An Phú Đông	21
3529	Phường Đông Hưng Thuận	21
3536	Phường Thạnh Xuân	21
3537	Phường Thới An	21
3538	Phường Trung Mỹ Tây	21
9015	Thị trấn Hòa Thành	29
3541	Phường An Phú	21
3542	Phường Bình An	21
3546	Phường Cát Lái	21
3547	Phường Thạnh Mỹ Lợi	21
3548	Phường Thảo Điền	21
3635	Phường Long Bình	21
3636	Phường Long Phước	21
3637	Phường Long Thạnh Mỹ	21
3638	Phường Long Trường	21
3639	Phường Phú Hữu	21
3642	Phường Phước Long B	21
3643	Phường Tân Phú	21
3644	Phường Tăng Nhơn Phú A	21
3743	Phường Nguyễn Trãi	28
3645	Phường Tăng Nhơn Phú B	21
3747	Phường Trần Phú	28
3749	Xã Bản Máy	28
3646	Phường Trường Thạnh	21
3648	Phường 10	21
3653	Phường 15	21
3654	Phường 2	21
3656	Phường 4	21
3657	Phường 5	21
3658	Phường 6	21
3673	Phường Bình Chiểu	21
3676	Phường Hiệp Bình Phước	21
3882	Xã Đại Hùng	23
3883	Xã Đồng Tân	23
3678	Phường Linh Đông	21
3680	Phường Linh Trung	21
3682	Phường Tam Bình	21
3683	Phường Tam Phú	21
3691	Xã Phiêng Luông	28
3692	Xã Phú Nam	28
3693	Xã Thượng Tân	28
3694	Xã Yên Cường	28
3695	Xã Yên Định	28
3696	Xã Yên Phong	28
3697	Thị trấn Yên Phú	28
3698	Xã Bằng Hành	28
3699	Xã Đồng Tâm	28
3700	Xã Đồng Tiến	28
3701	Xã Đồng Yên	28
3702	Xã Đức Xuân	28
3703	Xã Đông Thành	28
3704	Xã Hữu Sản	28
3705	Xã Hùng An	28
3706	Xã Kim Ngọc	28
3707	Xã Liên Hiệp	28
3708	Xã Quang Minh	28
3709	Xã Tân Lập	28
3710	Xã Tân Quang	28
3711	Xã Tân Thành	28
3721	Thị trấn Đồng Văn	28
3722	Xã Hố Quáng Phìn	28
3723	Xã Lũng Cú	28
3724	Xã Lũng Phìn	28
3726	Xã Lũng Thầu	28
3729	Xã Phố Là	28
3730	Thị trấn Phó Bảng	28
3731	Xã Sảng Tủng	28
3732	Xã Sủng Là	28
3733	Xã Sủng Trái	28
3734	Xã Sính Lủng	28
3735	Xã Tả Lủng	28
3884	Xã Đồng Tiến	23
3736	Xã Tả Phìn	28
3737	Xã Thài Phìn Tủng	28
3738	Xã Vần Chải	28
3739	Xã Xà Phìn	28
3740	Phường Minh Khai	28
3742	Phường Ngọc Hà	28
3744	Xã Phương Độ	28
3745	Xã Phương Thiện	28
3746	Phường Quang Trung	28
3750	Xã Bản Nhùng	28
3751	Xã Bản Péo	28
3754	Xã Đản Ván	28
3755	Xã Hồ Thầu	28
3756	Xã Nậm Dịch	28
3759	Xã Nam Sơn	28
3760	Xã Nàng Đôn	28
3761	Xã Ngàm Đăng Vài	28
3762	Xã Pố Lồ	28
3763	Xã Pờ Ly Ngài	28
3764	Xã Sán Xả Hồ	28
3765	Xã Tả Sử Choóng	28
3769	Xã Thèn Chu Phìn	28
3772	Thị trấn Vinh Quang	28
3892	Xã Hòa Xá	23
3773	Xã Cán Chu Phìn	28
3776	Xã Lũng Chinh	28
3777	Xã Lũng Pù	28
3778	Thị trấn Mèo Vạc	28
3779	Xã Nậm Ban	28
3781	Xã Niêm Tòng	28
3783	Xã Pải Lủng	28
3786	Xã Sơn Vĩ	28
3787	Xã Tả Lủng	28
3788	Xã Tát Ngà	28
3789	Xã Thượng Phùng	28
3790	Xã Xín Cái	28
3794	Xã Đông Hà	28
3795	Xã Lùng Tám	28
3796	Xã Nghĩa Thuận	28
3797	Xã Quản Bạ	28
3800	Thị trấn Tam Sơn	28
3804	Xã Bản Rịa	28
3807	Xã Nà Khương	28
3812	Xã Tiên Yên	28
3813	Xã Vĩ Thượng	28
3814	Xã Xuân Giang	28
3815	Xã Xuân Minh	28
3822	Xã Kim Linh	28
3823	Xã Kim Thạch	28
3824	Xã Lao Chải	28
3825	Xã Linh Hồ	28
3826	Xã Minh Tân	28
3828	Xã Ngọc Minh	28
3829	Thị trấn Nông Trường Việt Lâm	28
3830	Xã Phong Quang	28
3831	Xã Phú Linh	28
3833	Xã Quảng Ngần	28
3834	Xã Thanh Đức	28
3840	Thị trấn Vị Xuyên	28
3843	Xã Bản Díu	28
3844	Xã Bản Ngò	28
3845	Thị trấn Cốc Pài	28
3846	Xã Cốc Rế	28
3847	Xã Chế Là	28
3849	Xã Khuôn Lùng	28
3850	Xã Nấm Dẩn	28
3852	Xã Nàn Ma	28
3853	Xã Nàn Xỉn	28
3854	Xã Ngán Chiên	28
3855	Xã Pà Vầy Sủ	28
3856	Xã Quảng Nguyên	28
3857	Xã Tả Nhìu	28
3858	Xã Thèn Phàng	28
3859	Xã Thu Tà	28
3860	Xã Trung Thịnh	28
3861	Xã Xín Mần	28
3862	Xã Bạch Đích	28
3865	Xã Du Tiến	28
3868	Xã Lao Và Chải	28
3869	Xã Lũng Hồ	28
3870	Xã Mậu Duệ	28
3871	Xã Mậu Long	28
3875	Xã Phú Lũng	28
3877	Xã Sủng Tráng	28
3878	Xã Thắng Mố	28
3879	Thị trấn Yên Minh	28
3880	Xã Cao Thành	23
3881	Xã Đại Cường	23
3885	Xã Đội Bình	23
3886	Xã Đông Lỗ	23
3887	Xã Hồng Quang	23
3888	Xã Hòa Lâm	23
3889	Xã Hòa Nam	23
3890	Xã Hòa Phú	23
3891	Xã Hoa Sơn	23
3893	Xã Kim Đường	23
3894	Xã Liên Bạt	23
3895	Xã Lưu Hoàng	23
3896	Xã Minh Đức	23
3897	Xã Phù Lưu	23
3900	Xã Sơn Công	23
3898	Xã Phương Tú	23
3899	Xã Quảng Phú Cầu	23
3901	Xã Tảo Dương Văn	23
3902	Xã Trầm Lộng	23
3903	Xã Trường Thịnh	23
3904	Xã Trung Tú	23
3905	Xã Vạn Thái	23
3906	Thị trấn Vân Đình	23
3913	Phường Liên Mạc	23
3907	Xã Viên An	23
3915	Phường Phú Diễn	23
3908	Xã Viên Nội	23
3916	Phường Phúc Diễn	23
3909	Phường Cổ Nhuế 1	23
3918	Phường Thụy Phương	23
3910	Phường Cổ Nhuế 2	23
3911	Phường Đức Thắng	23
3914	Phường Minh Khai	23
3917	Phường Tây Tựu	23
3919	Phường Thượng Cát	23
3920	Phường Xuân Đỉnh	23
3940	Xã Cam Thượng	23
3942	Xã Chu Minh	23
3943	Xã Đồng Thái	23
3944	Xã Đông Quang	23
3945	Xã Khánh Thượng	23
3949	Xã Phú Châu	23
3950	Xã Phú Cường	23
3951	Xã Phú Đông	23
3952	Xã Phú Phương	23
3953	Xã Phú Sơn	23
3954	Xã Sơn Đà	23
3958	Xã Thụy An	23
3959	Xã Thái Hòa	23
3960	Xã Thuần Mỹ	23
3970	Phường Nghĩa Đô	23
3961	Xã Tiên Phong	23
3981	Xã Hồng Phong	23
3962	Xã Tòng Bạt	23
3963	Xã Vạn Thắng	23
3965	Xã Vân Hòa	23
3968	Phường Dịch Vọng Hậu	23
3973	Phường Trung Hoà	23
3974	Phường Yên Hoà	23
3975	Thị trấn Chúc Sơn	23
3976	Xã Đại Yên	23
3977	Xã Đồng Lạc	23
3978	Xã Đồng Phú	23
3982	Xã Hợp Đồng	23
3979	Xã Đông Phương Yên	23
3983	Xã Hữu Văn	23
3984	Xã Hòa Chính	23
3985	Xã Hoàng Diệu	23
3990	Xã Ngọc Hòa	23
3992	Xã Phú Nam An	23
3993	Xã Phú Nghĩa	23
3994	Xã Quảng Bị	23
4050	Xã Hải Bối	23
3995	Xã Tốt Động	23
3999	Xã Thanh Bình	23
4000	Xã Thượng Vực	23
4183	Phường Giang Biên	23
4001	Xã Tiên Phương	23
4003	Xã Trường Yên	23
4004	Xã Trung Hòa	23
4005	Xã Văn Võ	23
4007	Phường Cát Linh	23
4008	Phường Hàng Bột	23
4028	Xã Đồng Tháp	23
4033	Xã Liên Hà	23
4029	Xã Đan Phượng	23
4030	Xã Hạ Mỗ	23
4031	Xã Hồng Hà	23
4032	Xã Liên Hồng	23
4035	Thị trấn Phùng	23
4036	Xã Phương Đình	23
4037	Xã Song Phượng	23
4038	Xã Tân Hội	23
4052	Xã Kim Nỗ	23
4039	Xã Tân Lập	23
4040	Xã Thọ An	23
4068	Xã Bát Tràng	23
4041	Xã Thọ Xuân	23
4074	Xã Dương Hà	23
4042	Xã Thượng Mỗ	23
4456	Thị trấn Thường Tín	23
4043	Xã Trung Châu	23
4076	Xã Dương Xá	23
4044	Xã Bắc Hồng	23
4045	Xã Cổ Loa	23
4046	Xã Đại Mạch	23
4047	Xã Dục Tú	23
4048	Thị trấn Đông Anh	23
4049	Xã Đông Hội	23
4051	Xã Kim Chung	23
4081	Xã Ninh Hiệp	23
4053	Xã Liên Hà	23
4085	Xã Trung Mầu	23
4054	Xã Mai Lâm	23
4090	Phường Biên Giang	23
4055	Xã Nam Hồng	23
4098	Phường Phú La	23
4056	Xã Nguyên Khê	23
4057	Xã Tầm Xá	23
4104	Phường Văn Quán	23
4058	Xã Thuỵ Lâm	23
4059	Xã Tiên Dương	23
4060	Xã Uy Nỗ	23
4061	Xã Vân Hà	23
4114	Phường Đồng Tâm	23
4062	Xã Vân Nội	23
4116	Phường Minh Khai	23
4117	Phường Ngô Thì Nhậm	23
4063	Xã Việt Hùng	23
4064	Xã Vĩnh Ngọc	23
4065	Xã Võng La	23
4066	Xã Xuân Canh	23
4121	Phường Quỳnh Lôi	23
4069	Xã Cổ Bi	23
4125	Phường Trương Định	23
4070	Xã Đặng Xá	23
4071	Xã Đa Tốn	23
4072	Xã Đình Xuyên	23
4073	Xã Đông Dư	23
4075	Xã Dương Quang	23
4126	Phường Vĩnh Tuy	23
4077	Xã Kiêu Kỵ	23
4079	Xã Kim Sơn	23
4080	Xã Lệ Chi	23
4459	Xã Vạn Điểm	23
4082	Xã Phù Đổng	23
4083	Xã Phú Thị	23
4084	Thị trấn Trâu Quỳ	23
4087	Xã Yên Thường	23
4088	Thị trấn Yên Viên (Thị trấn )	23
4188	Phường Phúc Lợi	23
4089	Xã Yên Viên (Xã)	23
4189	Phường Sài Đồng	23
4091	Phường Đồng Mai	23
4092	Phường Dương Nội	23
4093	Phường Hà Cầu	23
4094	Phường Kiến Hưng	23
4199	Xã Đốc Tín	23
4095	Phường La Khê	23
4096	Phường Mộ Lao	23
4099	Phường Phú Lãm	23
4129	Xã Cát Quế	23
4100	Phường Phú Lương	23
4101	Phường Phúc La	23
4102	Phường Quang Trung	23
4103	Phường Vạn Phúc	23
4106	Phường Yên Nghĩa	23
4111	Phường Cầu Dền	23
4127	Xã An Khánh	23
4128	Xã An Thượng	23
4130	Xã Đắc Sở	23
4132	Xã Đức Thượng	23
4131	Xã Đức Giang	23
5460	Xã Phi Thông	1
4133	Xã Di Trạch	23
4134	Xã Đông La	23
4135	Xã Dương Liễu	23
4139	Xã Minh Khai	23
4136	Xã Kim Chung	23
4140	Xã Sơn Đồng	23
4137	Xã Lại Yên	23
4138	Xã La Phù	23
4141	Xã Song Phương	23
4163	Phường Trần Hưng Đạo	23
4142	Xã Tiền Yên	23
4143	Thị trấn Trạm Trôi	23
4144	Xã Vân Canh	23
4164	Phường Tràng Tiền	23
4145	Xã Vân Côn	23
4146	Xã Yên Sở	23
4155	Phường Hàng Buồm	23
4159	Phường Hàng Trống	23
4160	Phường Lý Thái Tổ	23
4165	Phường Đại Kim	23
4166	Phường Định Công	23
4168	Phường Hoàng Liệt	23
5469	Phường Vĩnh Thông	1
4169	Phường Hoàng Văn Thụ	23
4171	Phường Mai Động	23
4170	Phường Lĩnh Nam	23
4172	Phường Tân Mai	23
4173	Phường Thịnh Liệt	23
4174	Phường Thanh Trì	23
4177	Phường Vĩnh Hưng	23
4206	Xã Lê Thanh	23
4178	Phường Yên Sở	23
4179	Phường Bồ Đề	23
5472	Thị trấn Tân Hiệp	1
5474	Xã Tân Hiệp B	1
4181	Phường Đức Giang	23
5475	Xã Tân Hoà	1
4184	Phường Long Biên	23
4186	Phường Ngọc Thụy	23
4187	Phường Phúc Đồng	23
5476	Xã Tân Thành	1
4190	Phường Thạch Bàn	23
4207	Xã Mỹ Thành	23
4191	Phường Thượng Thanh	23
4211	Xã Thượng Lâm	23
4192	Phường Việt Hưng	23
4193	Xã An Mỹ	23
4194	Xã An Phú	23
4195	Xã An Tiến	23
4196	Xã Bột Xuyên	23
4197	Xã Đại Hưng	23
4198	Thị trấn Đại Nghĩa	23
4200	Xã Đồng Tâm	23
4201	Xã Hồng Sơn	23
4202	Xã Hợp Thanh	23
4204	Xã Hùng Tiến	23
4208	Xã Phù Lưu Tế	23
4216	Xã Chu Phan	23
4209	Xã Phúc Lâm	23
4210	Xã Phùng Xá	23
4212	Xã Tuy Lai	23
4218	Xã Hoàng Kim	23
4213	Xã Vạn Kim	23
4214	Xã Xuy Xá	23
4215	Thị trấn Chi Đông	23
4217	Xã Đại Thịnh	23
4219	Xã Kim Hoa	23
4224	Xã Tam Đồng	23
4220	Xã Liên Mạc	23
4221	Xã Mê Linh	23
4222	Thị trấn Quang Minh	23
4223	Xã Tự Lập	23
4225	Xã Thạch Đà	23
4228	Xã Tiến Thịnh	23
4244	Xã Châu Can	23
4229	Xã Tiền Phong	23
4230	Xã Tráng Việt	23
4231	Xã Vạn Yên	23
4258	Xã Phú Yên	23
4232	Xã Văn Khê	23
4233	Phường Cầu Diễn	23
4234	Phường Đại Mỗ	23
4407	Xã Xuân Dương	23
4235	Phường Mễ Trì	23
4413	Xã Ngọc Hồi	23
4236	Phường Mỹ Đình 1	23
4237	Phường Mỹ Đình 2	23
4239	Phường Phương Canh	23
4259	Xã Phượng Dực	23
4240	Phường Tây Mỗ	23
4241	Phường Trung Văn	23
4242	Phường Xuân Phương	23
4245	Xã Chuyên Mỹ	23
4267	Xã Tri Trung	23
4246	Xã Đại Thắng	23
4247	Xã Đại Xuyên	23
4248	Xã Hồng Minh	23
4268	Xã Văn Hoàng	23
4250	Xã Hoàng Long	23
4251	Xã Khai Thái	23
4252	Xã Minh Tân	23
4269	Xã Văn Nhân	23
4253	Xã Nam Phong	23
4272	Xã Hát Môn	23
4254	Xã Nam Triều	23
4256	Xã Phú Túc	23
4257	Thị trấn Phú Xuyên	23
4260	Xã Phúc Tiến	23
4261	Xã Quang Lãng	23
4262	Xã Quang Trung	23
4263	Xã Sơn Hà	23
4264	Xã Tân Dân	23
4265	Xã Thụy Phú	23
4266	Xã Tri Thủy	23
4270	Xã Vân Từ	23
4271	Xã Cẩm Đình	23
4273	Xã Hiệp Thuận	23
4277	Xã Phụng Thượng	23
4274	Xã Liên Hiệp	23
4280	Xã Phương Độ	23
4275	Xã Long Xuyên	23
4276	Xã Ngọc Tảo	23
4278	Xã Phúc Hòa	23
4284	Xã Thọ Lộc	23
4279	Thị trấn Phúc Thọ	23
4281	Xã Sen Chiểu	23
4290	Xã Vân Nam	23
4282	Xã Tam Hiệp	23
4283	Xã Tam Thuấn	23
4285	Xã Thanh Đa	23
4493	Xã Mộc Bắc	14
4286	Xã Thượng Cốc	23
4291	Xã Vân Phúc	23
4287	Xã Tích Giang	23
4288	Xã Trạch Mỹ Lộc	23
4494	Xã Mộc Nam	14
4292	Xã Võng Xuyên	23
4495	Xã Tiền Phong	14
4293	Xã Xuân Phú	23
4500	Xã Yên Nam	14
4295	Xã Cộng Hòa	23
4296	Xã Đại Thành	23
4300	Xã Hòa Thạch	23
4301	Xã Liệp Tuyết	23
4302	Xã Ngọc Liệp	23
4303	Xã Ngọc Mỹ	23
4304	Xã Nghĩa Hương	23
4331	Thị trấn Sóc Sơn	23
4305	Xã Phú Cát	23
4306	Xã Phú Mãn	23
4307	Xã Phượng Cách	23
4358	Phường Phú Thượng	23
4308	Thị trấn Quốc Oai	23
4309	Xã Sài Sơn	23
4310	Xã Tân Hòa	23
4369	Xã Chàng Sơn	23
4311	Xã Tân Phú	23
4312	Xã Thạch Thán	23
4314	Xã Yên Sơn	23
4315	Xã Bắc Phú	23
4317	Xã Đức Hoà	23
4374	Xã Hữu Bằng	23
4318	Xã Đông Xuân	23
4321	Xã Kim Lũ	23
4324	Xã Minh Trí	23
4325	Xã Nam Sơn	23
4326	Xã Phú Cường	23
4327	Xã Phù Lỗ	23
4328	Xã Phù Linh	23
4329	Xã Phú Minh	23
4333	Xã Tân Hưng	23
4334	Xã Tân Minh	23
4335	Xã Thanh Xuân	23
4336	Xã Tiên Dược	23
4337	Xã Trung Giã	23
4338	Xã Việt Long	23
4340	Xã Xuân Thu	23
4342	Xã Đường Lâm	23
4343	Xã Kim Sơn	23
4344	Phường Lê Lợi	23
4345	Phường Ngô Quyền	23
4346	Phường Phú Thịnh	23
4347	Phường Quang Trung	23
4349	Phường Sơn Lộc	23
4352	Phường Trung Sơn Trầm	23
5485	Xã Thạnh Yên A	1
4353	Phường Viên Sơn	23
4354	Phường Xuân Khanh	23
4355	Xã Xuân Sơn	23
4356	Phường Bưởi	23
4357	Phường Nhật Tân	23
4359	Phường Quảng An	23
4360	Phường Tứ Liên	23
4361	Phường Thụy Khuê	23
4362	Phường Xuân La	23
4364	Xã Bình Phú	23
4367	Xã Cẩm Yên	23
4368	Xã Canh Nậu	23
4370	Xã Đại Đồng	23
4371	Xã Dị Nậu	23
4372	Xã Đồng Trúc	23
4373	Xã Hạ Bằng	23
4375	Xã Hương Ngải	23
4390	Xã Cao Dương	23
4376	Xã Kim Quan	23
4377	Xã Lại Thượng	23
4378	Thị trấn Liên Quan	23
6339	Phường 3	29
4379	Xã Phú Kim	23
4380	Xã Phùng Xá	23
4381	Xã Tân Xã	23
4382	Xã Thạch Hoà	23
4383	Xã Thạch Xá	23
4395	Xã Kim An	23
4384	Xã Tiến Xuân	23
4385	Xã Yên Bình	23
4386	Xã Yên Trung	23
5097	Xã Đồng Tiến	7
4387	Xã Bích Hòa	23
4388	Xã Bình Minh	23
6453	Xã Hoành Sơn	14
4389	Xã Cự Khê	23
6457	Xã Hải An	14
4391	Xã Cao Viên	23
6461	Xã Hải Chính	14
4392	Xã Đỗ Động	23
5354	Xã Nam Thái A	1
5355	Xã Nam Yên	1
4393	Xã Dân Hòa	23
6462	Xã Hải Cường	14
4394	Xã Hồng Dương	23
4396	Thị trấn Kim Bài	23
5368	Xã Vân Khánh Đông	1
4397	Xã Kim Thư	23
4399	Xã Mỹ Hưng	23
4398	Xã Liên Châu	23
4400	Xã Phương Trung	23
5369	Xã Vân Khánh Tây	1
4401	Xã Tam Hưng	23
4402	Xã Tân Ước	23
4403	Xã Thanh Cao	23
7477	Xã Vĩnh Phú	15
4404	Xã Thanh Mai	23
4406	Xã Thanh Văn	23
4405	Xã Thanh Thùy	23
7921	Xã Đại Hòa	25
4408	Xã Đại áng	23
4414	Xã Ngũ Hiệp	23
4409	Xã Đông Mỹ	23
4416	Xã Tứ Hiệp	23
7923	Xã Đại Lãnh	25
4410	Xã Duyên Hà	23
4423	Xã Yên Mỹ	23
4411	Xã Hữu Hoà	23
4412	Xã Liên Ninh	23
4415	Xã Tả Thanh Oai	23
4417	Xã Tam Hiệp	23
4425	Phường Khương Đình	23
4418	Xã Tân Triều	23
4426	Phường Khương Mai	23
4419	Xã Thanh Liệt	23
4420	Xã Vạn Phúc	23
4421	Thị trấn Văn Điển	23
4427	Phường Khương Trung	23
4422	Xã Vĩnh Quỳnh	23
4433	Phường Thanh Xuân Trung	23
4429	Phường Nhân Chính	23
4430	Phường Phương Liệt	23
4431	Phường Thanh Xuân Bắc	23
4435	Xã Chương Dương	23
4441	Xã Hòa Bình	23
4436	Xã Dũng Tiến	23
5390	Xã Ngọc Thành	1
4437	Xã Duyên Thái	23
4438	Xã Hồng Vân	23
4439	Xã Hà Hồi	23
4440	Xã Hiền Giang	23
8241	Phường Nghĩa Chánh	16
4442	Xã Khánh Hà	23
4445	Xã Minh Cường	23
4443	Xã Lê Lợi	23
8246	Xã Nghĩa Phú	16
4444	Xã Liên Phương	23
4448	Xã Nhị Khê	23
4446	Xã Nghiêm Xuyên	23
4452	Xã Tân Minh	23
4447	Xã Nguyễn Trãi	23
4449	Xã Ninh Sở	23
4450	Xã Quất Động	23
4451	Xã Tự Nhiên	23
4453	Xã Thắng Lợi	23
4454	Xã Thống Nhất	23
4455	Xã Thư Phú	23
4457	Xã Tiền Phong	23
8254	Xã Tịnh Kỳ	16
4458	Xã Tô Hiệu	23
4460	Xã Văn Bình	23
4461	Xã Văn Phú	23
5391	Xã Ngọc Thuận	1
4462	Xã Vân Tảo	23
4463	Xã Văn Tự	23
4464	Xã An Đổ	14
4472	Xã Bình Nghĩa	14
4465	Xã An Lão	14
4466	Xã An Mỹ	14
4485	Xã Châu Sơn	14
4467	Xã An Nội	14
4468	Xã An Ninh	14
4469	Xã Bối Cầu	14
4470	Xã Bồ Đề	14
5395	Xã Thạnh Lộc	1
4471	Thị trấn Bình Mỹ	14
5396	Xã Thạnh Phước	1
4473	Xã Đồn Xá	14
5400	Xã Phú Mỹ	1
4474	Xã Đồng Du	14
4475	Xã Hưng Công	14
4476	Xã La Sơn	14
4477	Xã Mỹ Thọ	14
4478	Xã Ngọc Lũ	14
4479	Xã Tiêu Động	14
4480	Xã Tràng An	14
8256	Xã Tịnh Long	16
4481	Xã Trung Lương	14
8307	Xã Trà Hiệp	16
8308	Xã Trà Lâm	16
4482	Xã Vũ Bản	14
4483	Xã Bạch Thượng	14
4486	Xã Chuyên Ngoại	14
4484	Xã Châu Giang	14
4487	Xã Đọi Sơn	14
4489	Xã Duy Hải	14
4488	Thị trấn Đồng Văn	14
4490	Xã Duy Minh	14
4491	Thị trấn Hòa Mạc	14
4492	Xã Hoàng Đông	14
4496	Xã Tiên Nội	14
4497	Xã Tiên Ngoại	14
4498	Xã Trác Văn	14
4755	Xã Kỳ Hà	6
4499	Xã Yên Bắc	14
4501	Thị trấn Ba Sao	14
4502	Xã Đại Cương	14
4759	Phường Kỳ Liên	6
4503	Xã Đồng Hóa	14
4504	Xã Hoàng Tây	14
4505	Xã Khả Phong	14
4506	Xã Lê Hồ	14
4507	Xã Liên Sơn	14
4508	Xã Ngọc Sơn	14
4509	Xã Nguyễn úy	14
9112	Phường Xuân Phú	22
4510	Xã Nhật Tựu	14
4524	Xã Đồng Lý	14
9113	Xã Dương Hòa	22
9116	Xã Thủy Bằng	22
4511	Xã Nhật Tân	14
4512	Thị trấn Quế	14
4513	Xã Tân Sơn	14
4526	Xã Hợp Lý	14
4514	Xã Thụy Lôi	14
4515	Xã Thanh Sơn	14
4527	Xã Hòa Hậu	14
4516	Xã Thi Sơn	14
4517	Xã Tượng Lĩnh	14
9124	Xã Thủy Vân	22
4518	Xã Văn Xá	14
4519	Xã Bắc Lý	14
4535	Xã Nhân Nghĩa	14
9128	Xã Hồng Tiến	22
4520	Xã Chân Lý	14
4521	Xã Chính Lý	14
4522	Xã Công Lý	14
4541	Xã Xuân Khê	14
4523	Xã Đạo Lý	14
4542	Phường Châu Sơn	14
4525	Xã Đức Lý	14
4528	Xã Nguyên Lý	14
4529	Xã Nhân Bình	14
4530	Xã Nhân Chính	14
4531	Xã Nhân Đạo	14
5427	Xã Mỹ Lâm	1
4532	Xã Nhân Hưng	14
5432	Thị trấn Sóc Sơn	1
4533	Xã Nhân Khang	14
4549	Xã Liêm Chung	14
4534	Xã Nhân Mỹ	14
4536	Xã Nhân Thịnh	14
4558	Xã Tiên Hải	14
4537	Xã Phú Phúc	14
5433	Xã Sơn Bình	1
4538	Xã Tiến Thắng	14
4539	Xã Văn Lý	14
4543	Xã Đinh Xá	14
4544	Phường Hai Bà Trưng	14
4545	Xã Kim Bình	14
4546	Phường Lam Hà	14
4547	Phường Lê Hồng Phong	14
4548	Phường Liêm Chính	14
4550	Xã Liêm Tiết	14
6552	Xã Nghĩa Đồng	14
4551	Xã Liêm Tuyền	14
6553	Xã Nghĩa Hải	14
4554	Xã Phù Vân	14
6555	Xã Nghĩa Hùng	14
4555	Phường Quang Trung	14
4560	Xã Tiên Tân	14
4556	Phường Thanh Châu	14
4557	Phường Thanh Tuyền	14
4559	Xã Tiên Hiệp	14
4561	Phường Trần Hưng Đạo	14
4562	Xã Trịnh Xá	14
4582	Xã Cẩm Dương	6
4563	Thị trấn Kiện Khê	14
6556	Xã Nghĩa Lạc	14
4564	Xã Liêm Cần	14
5493	Thị trấn Vĩnh Thuận (Thị trấn )	1
4565	Xã Liêm Phong	14
4566	Xã Liêm Sơn	14
5494	Xã Vĩnh Thuận (Xã)	1
5495	Xã Đắk Choong	16
5496	Thị trấn Đắk Glei	16
4567	Xã Liêm Thuận	14
5545	Xã Tân Lập	16
4568	Xã Liêm Túc	14
5548	Xã Đắk Cấm	16
5549	Xã Đắk Rơ Wa	16
4569	Xã Thanh Bình	14
4570	Xã Thanh Hải	14
4571	Xã Thanh Hà	14
4572	Xã Thanh Hương	14
4573	Xã Thanh Lưu	14
4574	Xã Thanh Nghị	14
4575	Xã Thanh Nguyên	14
4576	Xã Thanh Phong	14
4577	Xã Thanh Tâm	14
4578	Xã Thanh Tân	14
5552	Phường Duy Tân	16
5553	Xã Hòa Bình	16
4579	Xã Thanh Thủy	14
5556	Phường Lê Lợi	16
4580	Xã Cẩm Bình	6
4583	Xã Cẩm Hà	6
6557	Xã Nghĩa Lợi	14
4584	Xã Cẩm Hòa	6
4630	Xã Bùi Xá	6
4586	Xã Cẩm Huy	6
4587	Xã Cẩm Lạc	6
4588	Xã Cẩm Lộc	6
4589	Xã Cẩm Lĩnh	6
4590	Xã Cẩm Mỹ	6
4591	Xã Cẩm Minh	6
4592	Xã Cẩm Nam	6
4593	Xã Cẩm Nhượng	6
4594	Xã Cẩm Phúc	6
4596	Xã Cẩm Quang	6
4597	Xã Cẩm Sơn	6
4598	Xã Cẩm Thạch	6
4599	Xã Cẩm Thịnh	6
4600	Xã Cẩm Thăng	6
4601	Xã Cẩm Thành	6
4602	Xã Cẩm Trung	6
4603	Xã Cẩm Vĩnh	6
4639	Xã Đức La	6
4604	Thị trấn Cẩm Xuyên	6
4605	Xã Cẩm Yên	6
4651	Xã Liên Minh	6
4606	Thị trấn Thiên Cầm	6
6558	Xã Nghĩa Lâm	14
4607	Xã Đồng Lộc	6
4608	Xã Gia Hanh	6
4609	Xã Khánh Lộc	6
4610	Xã Kim Lộc	6
4611	Xã Mỹ Lộc	6
4613	Xã Phú Lộc	6
6561	Xã Nghĩa Phú	14
4614	Xã Quang Lộc	6
4615	Xã Sơn Lộc	6
4616	Xã Song Lộc	6
5560	Phường Quang Trung	16
4617	Xã Thanh Lộc	6
4618	Xã Thiên Lộc	6
4619	Xã Thuần Thiện	6
4620	Xã Thường Nga	6
4621	Xã Thượng Lộc	6
4658	Phường Bắc Hồng	6
4622	Xã Tiến Lộc	6
4623	Xã Trường Lộc	6
4669	Phường Tân Giang	6
4624	Xã Trung Lộc	6
4625	Xã Tùng Lộc	6
4627	Xã Vượng Lộc	6
4629	Xã Yên Lộc	6
4670	Xã Thạch Bình	6
4631	Xã Đức An	6
4632	Xã Đức Châu	6
5561	Phường Quyết Thắng	16
4633	Xã Đức Đồng	6
4635	Xã Đức Hòa	6
4671	Xã Thạch Đồng	6
4636	Xã Đức Lạc	6
4637	Xã Đức Lạng	6
4638	Xã Đức Lập	6
4672	Xã Thạch Hạ	6
4640	Xã Đức Lâm	6
5562	Phường Thắng Lợi	16
4641	Xã Đức Long	6
5571	Xã Đắk Xú	16
5572	Xã Pờ Y	16
5573	Thị trấn Plei Cần	16
5574	Xã Sa Loong	16
5575	Xã Hơ Moong	16
5576	Xã Mô Rai	16
5577	Xã Rơ Kơi	16
5578	Xã Sa Bình	16
5579	Xã Sa Nghĩa	16
5580	Xã Sa Nhơn	16
5581	Xã Sa Sơn	16
5582	Thị trấn Sa Thầy	16
5587	Xã Đắk Na	16
5588	Xã Đắk Rơ Ông	16
5589	Xã Đắk Sao	16
5590	Xã Đắk Tơ Kan	16
4642	Xã Đức Nhân	6
4643	Xã Đức Quang	6
4644	Xã Đức Thịnh	6
4645	Thị trấn Đức Thọ	6
4646	Xã Đức Thủy	6
4675	Xã Thạch Môn	6
4647	Xã Đức Thanh	6
4648	Xã Đức Tùng	6
4650	Xã Đức Yên	6
4652	Xã Tân Hương	6
4676	Phường Thạch Quý	6
4653	Xã Thái Yên	6
4735	Xã Kỳ Châu	6
4736	Xã Kỳ Đồng	6
4654	Xã Trường Sơn	6
5098	Xã Dân Tiến	7
4655	Xã Trung Lễ	6
4656	Xã Tùng ảnh	6
4657	Xã Yên Hồ	6
4660	Phường Đức Thuận	6
4661	Phường Nam Hồng	6
6563	Xã Nghĩa Sơn	14
4662	Xã Thuận Lộc	6
4663	Phường Trung Lương	6
4664	Phường Bắc Hà	6
4665	Phường Đại Nài	6
4666	Phường Hà Huy Tập	6
4673	Xã Thạch Hưng	6
6564	Xã Nghĩa Tân	14
4674	Phường Thạch Linh	6
4677	Xã Thạch Trung	6
4679	Phường Văn Yên	6
4686	Thị trấn Hương Khê	6
4687	Xã Hương Lâm	6
4688	Xã Hương Liên	6
4689	Xã Hương Long	6
4690	Xã Hương Thủy	6
4694	Xã Hương Xuân	6
4695	Xã Lộc Yên	6
4696	Xã Phú Gia	6
4697	Xã Phú Phong	6
4698	Xã Phúc Đồng	6
4699	Xã Phúc Trạch	6
4700	Xã Phương Điền	6
4701	Xã Phương Mỹ	6
4702	Thị trấn Phố Châu	6
5101	Xã Đông Tảo	7
4703	Xã Sơn An	6
4704	Xã Sơn Bằng	6
4705	Xã Sơn Bình	6
4706	Xã Sơn Châu	6
5102	Xã Hồng Tiến	7
4707	Xã Sơn Diệm	6
4708	Xã Sơn Giang	6
4709	Xã Sơn Hồng	6
4710	Xã Sơn Hà	6
4711	Xã Sơn Hàm	6
5103	Xã Hàm Tử	7
4712	Xã Sơn Hòa	6
4713	Xã Sơn Kim 1	6
4714	Xã Sơn Kim 2	6
4715	Xã Sơn Lễ	6
4716	Xã Sơn Lâm	6
4718	Xã Sơn Long	6
5104	Thị trấn Khoái Châu	7
4719	Xã Sơn Mỹ	6
5110	Xã Tân Châu	7
4720	Xã Sơn Mai	6
4721	Xã Sơn Ninh	6
4772	Xã Mai Phụ	6
4722	Xã Sơn Phú	6
4723	Xã Sơn Phúc	6
4785	Xã Xuân Đan	6
4724	Xã Sơn Quang	6
4725	Xã Sơn Tân	6
5123	Xã Nghĩa Dân	7
4727	Xã Sơn Thịnh	6
4788	Xã Xuân Hồng	6
4730	Xã Sơn Trà	6
4794	Xã Xuân Phổ	6
4731	Xã Sơn Trường	6
4732	Xã Sơn Trung	6
4733	Thị trấn Tây Sơn	6
4749	Xã Kỳ Thư	6
4734	Xã Kỳ Bắc	6
4737	Xã Kỳ Giang	6
4738	Xã Kỳ Hải	6
4796	Xã Xuân Trường	6
4797	Xã Xuân Viên	6
4739	Xã Kỳ Hợp	6
4743	Xã Kỳ Phong	6
4744	Xã Kỳ Phú	6
4745	Xã Kỳ Sơn	6
4747	Xã Kỳ Tây	6
4748	Xã Kỳ Thọ	6
4752	Xã Kỳ Trung	6
4753	Xã Kỳ Văn	6
4754	Xã Kỳ Xuân	6
4760	Phường Kỳ Long	6
4761	Xã Kỳ Nam	6
4762	Xã Kỳ Ninh	6
4763	Phường Kỳ Phương	6
4765	Phường Kỳ Trinh	6
4766	Phường Sông Trí	6
4767	Xã An Lộc	6
4768	Xã Bình Lộc	6
4769	Xã Hồng Lộc	6
4770	Xã Hộ Độ	6
4773	Xã Phù Lưu	6
4775	Xã Thạch Bằng	6
4824	Xã Thạch Trị	6
4776	Xã Thạch Châu	6
4777	Xã Thạch Kim	6
4778	Xã Thạch Mỹ	6
4779	Xã Thịnh Lộc	6
4780	Xã Cỗ Đạm	6
4781	Xã Cương Gián	6
4782	Thị trấn Nghi Xuân	6
4783	Xã Tiên Điền	6
4784	Thị trấn Xuân An	6
4786	Xã Xuân Giang	6
4787	Xã Xuân Hải	6
4790	Xã Xuân Lam	6
5597	Thị trấn Bắc Sơn (Thị trấn )	12
4791	Xã Xuân Liên	6
5599	Xã Chiến Thắng	12
5600	Xã Chiêu Vũ	12
5601	Xã Đồng ý	12
4793	Xã Xuân Mỹ	6
4795	Xã Xuân Thành	6
4800	Xã Nam Hương	6
4802	Xã Phù Việt	6
4803	Xã Thạch Bàn	6
4804	Xã Thạch Đỉnh	6
4805	Xã Thạch Đài	6
4807	Xã Thạch Hải	6
4877	Xã Dân Chủ	15
4808	Xã Thạch Hội	6
4878	Phường Hữu Nghị	15
4810	Xã Thạch Hương	6
5617	Thị trấn Bình Gia	12
5618	Xã Bình La	12
5623	Xã Hoàng Văn Thụ	12
5624	Xã Hưng Đạo	12
5625	Xã Minh Khai	12
5627	Xã Quang Trung	12
5628	Xã Quý Hòa	12
5629	Xã Tân Hòa	12
5630	Xã Tân Văn	12
4812	Xã Thạch Khê	6
5632	Xã Thiện Long	12
5633	Xã Thiện Thuật	12
5634	Xã Tô Hiệu	12
5635	Xã Vĩnh Yên	12
5636	Xã Yên Lỗ	12
5637	Xã Bảo Lâm	12
4813	Xã Thạch Lạc	6
4814	Xã Thạch Lâm	6
4815	Xã Thạch Liên	6
4816	Xã Thạch Long	6
4817	Xã Thạch Lưu	6
8319	Xã Nghĩa Lâm	16
4820	Xã Thạch Tân	6
8336	Xã Thanh Sơn	17
4821	Xã Thạch Thắng	6
4822	Xã Thạch Thanh	6
4823	Xã Thạch Tiến	6
4825	Xã Thạch Văn	6
4881	Xã Sủ Ngòi	15
4826	Xã Thạch Vĩnh	6
4828	Xã Tượng Sơn	6
4829	Xã Việt Xuyên	6
4830	Xã Ân Phú	6
4882	Phường Tân Hòa	15
4831	Xã Đức Bồng	6
4832	Xã Đức Giang	6
4833	Xã Đức Hương	6
4834	Xã Đức Liên	6
4836	Xã Hương Điền	6
4839	Xã Hương Thọ	6
4843	Xã Bình Thanh	15
4845	Xã Đông Phong	15
4883	Phường Tân Thịnh	15
4846	Xã Dũng Phong	15
4884	Phường Thịnh Lang	15
4847	Xã Nam Phong	15
4848	Xã Tân Phong	15
4899	Xã Yên Quang	15
4852	Xã Xuân Phong	15
4853	Xã Yên Lập	15
4854	Xã Yên Thượng	15
4856	Xã Đồng Chum	15
4857	Xã Đồng Nghê	15
4858	Xã Đồng Ruộng	15
4859	Thị trấn Đà Bắc	15
4860	Xã Đoàn Kết	15
4908	Xã Hợp Kim	15
4861	Xã Giáp Đắt	15
4863	Xã Hiền Lương	15
4864	Xã Mường Chiềng	15
4865	Xã Mường Tuổng	15
4866	Xã Suối Nánh	15
4867	Xã Tân Minh	15
4868	Xã Tân Pheo	15
4870	Xã Toàn Sơn	15
4871	Xã Trung Thành	15
4872	Xã Tu Lý	15
4873	Xã Vầy Nưa	15
4874	Xã Yên Hòa	15
8337	Thị trấn Bình Liêu	17
8338	Xã Đồng Tâm	17
4875	Phường Chăm Mát	15
4879	Xã Hòa Bình	15
4880	Phường Phương Lâm	15
4885	Xã Thống Nhất	15
4886	Phường Thái Bình	15
4887	Xã Thái Thịnh	15
4975	Xã Cư Yên	15
4888	Xã Trung Minh	15
5639	Thị trấn Cao Lộc	12
4889	Xã Yên Mông	15
5666	Thị trấn Đồng Mỏ	12
5668	Xã Hữu Kiên	12
4892	Xã Dân Hòa	15
5669	Xã Hòa Bình	12
5670	Xã Lâm Sơn	12
4894	Xã Hợp Thành	15
5684	Xã Châu Sơn	12
5685	Xã Cường Lợi	12
5686	Xã Đồng Thắng	12
4895	Thị trấn Kỳ Sơn	15
4896	Xã Mông Hóa	15
4897	Xã Phú Minh	15
5707	Xã Nhật Tiến	12
4898	Xã Phúc Tiến	15
5719	Phường Chi Lăng	12
4900	Xã Bắc Sơn	15
4901	Xã Bình Sơn	15
4904	Xã Đông Bắc	15
4906	Xã Hạ Bì	15
5002	Xã Nà Phòn	15
4907	Xã Hợp Đồng	15
4909	Xã Hùng Tiến	15
4910	Xã Kim Bình	15
5006	Xã Piềng Vế	15
4911	Xã Kim Bôi	15
5036	Xã Thanh Hối	15
5037	Xã Trung Hòa	15
4912	Xã Kim Sơn	15
4913	Xã Kim Tiến	15
4914	Xã Kim Truy	15
4915	Xã Lập Chiệng	15
4917	Xã Nật Sơn	15
8345	Phường Cẩm Bình	17
4918	Xã Nam Thượng	15
4920	Xã Sào Báy	15
4921	Xã Sơn Thủy	15
4922	Xã Thượng Bì	15
4923	Xã Thượng Tiến	15
4924	Xã Trung Bì	15
4925	Xã Tú Sơn	15
4926	Xã Vĩnh Đồng	15
4927	Xã Vĩnh Tiến	15
4928	Xã Ân Nghĩa	15
4929	Xã Bình Cảng	15
4930	Xã Bình Chân	15
4931	Xã Bình Hẻm	15
4932	Xã Chí Đạo	15
4933	Xã Chí Thiện	15
4934	Xã Định Cư	15
4935	Xã Hương Nhượng	15
4936	Xã Liên Vũ	15
4937	Xã Mỹ Thành	15
4938	Xã Miền Đồi	15
5055	Xã Cẩm Ninh	7
4939	Xã Ngọc Lâu	15
4940	Xã Ngọc Sơn	15
4941	Xã Nhân Nghĩa	15
4942	Xã Phú Lương	15
4943	Xã Phúc Tuy	15
5720	Phường Đông Kinh	12
4944	Xã Quý Hòa	15
4946	Xã Tân Lập	15
4947	Xã Tân Mỹ	15
4948	Xã Thượng Cốc	15
4949	Xã Tuân Đạo	15
4950	Thị trấn Vụ Bản	15
4951	Xã Văn Nghĩa	15
4952	Xã Văn Sơn	15
4953	Xã Vũ Lâm	15
4954	Xã Xuất Hóa	15
4955	Xã Yên Nghiệp	15
4956	Xã Yên Phú	15
4957	Xã An Bình	15
4958	Xã An Lạc	15
4959	Xã Cố Nghĩa	15
4960	Thị trấn Chi Nê	15
4964	Xã Khoan Dụ	15
4965	Xã Lạc Long	15
4967	Xã Phú Lão	15
4969	Thị trấn Thanh Hà	15
4971	Xã Yên Bồng	15
4972	Xã Cao Dương	15
4973	Xã Cao Răm	15
4974	Xã Cao Thắng	15
4976	Xã Hợp Châu	15
4977	Xã Hợp Hòa	15
4979	Xã Hòa Sơn	15
4980	Xã Lâm Sơn	15
4982	Xã Long Sơn	15
4984	Xã Nhuận Trạch	15
4985	Xã Tân Thành	15
4988	Xã Thanh Lương	15
4989	Xã Tiến Sơn	15
4990	Xã Trường Sơn	15
4991	Xã Trung Sơn	15
5068	Xã Tân Phúc	7
4992	Xã Ba Khan	15
4993	Xã Bao La	15
4994	Xã Chiềng Châu	15
6576	Xã Trực Chính	14
4995	Xã Cun Pheo	15
4996	Xã Đồng Bảng	15
4997	Xã Hang Kia	15
5071	Xã Văn Nhuệ	7
4998	Thị trấn Mai Châu	15
4999	Xã Mai Hạ	15
5000	Xã Mai Hịch	15
5001	Xã Nà Mèo	15
5073	Phường An Tảo	7
5003	Xã Nong Luông	15
5004	Xã Pà Cò	15
5005	Xã Phúc Sạn	15
5007	Xã Pù Pin	15
5008	Xã Săm Khóe	15
5009	Xã Tân Dân	15
5010	Xã Tân Mai	15
5011	Xã Tân Sơn	15
5079	Xã Hùng Cường	7
5012	Xã Thung Khe	15
5013	Xã Tòng Đậu	15
5014	Xã Vạn Mai	15
5084	Xã Phú Cường	7
5015	Xã Bắc Sơn	15
5086	Xã Quảng Châu	7
5016	Xã Địch Giáo	15
5017	Xã Do Nhân	15
5020	Xã Lỗ Sơn	15
5021	Xã Lũng Vân	15
5024	Thị trấn Mường Khến	15
5028	Xã Ngòi Hoa	15
5031	Xã Phú Vinh	15
5032	Xã Quy Hậu	15
5033	Xã Quy Mỹ	15
5034	Xã Quyết Chiến	15
5088	Xã Tân Hưng	7
5035	Xã Tử Nê	15
5038	Xã Tuân Lộ	15
5039	Xã Bảo Hiệu	15
5040	Xã Đa Phúc	15
5041	Xã Đoàn Kết	15
5042	Xã Hữu Lợi	15
5043	Thị trấn Hàng Trạm	15
5092	Xã Bình Minh	7
5044	Xã Lạc Hưng	15
5045	Xã Lạc Lương	15
5048	Xã Ngọc Lương	15
5049	Xã Phú Lai	15
6359	Phường 4	29
5051	Xã Yên Trị	15
6364	Xã Hưng Điền	29
5052	Thị trấn Ân Thi	7
5053	Xã Bắc Sơn	7
5054	Xã Bãi Sậy	7
5056	Xã Đặng Lễ	7
6369	Xã Thạnh Hưng	29
5057	Xã Đa Lộc	7
5058	Xã Đào Dương	7
5059	Xã Hạ Lễ	7
6370	Xã Vĩnh Bửu	29
5060	Xã Hồ Tùng Mậu	7
5061	Xã Hồng Quang	7
5062	Xã Hồng Vân	7
5179	Xã Phụng Công	7
5063	Xã Hoàng Hoa Thám	7
6371	Xã Vĩnh Châu A	29
5064	Xã Nguyễn Trãi	7
5065	Xã Phù ủng	7
5066	Xã Quảng Lãng	7
5194	Xã Trưng Trắc	7
5067	Xã Quang Vinh	7
5069	Xã Tiền Phong	7
5070	Xã Vân Du	7
5072	Xã Xuân Trúc	7
5074	Xã Bảo Khê	7
5075	Phường Hồng Châu	7
5201	Xã Minh Châu	7
5076	Xã Hồng Nam	7
5077	Phường Hiến Nam	7
5078	Xã Hoàng Hanh	7
5080	Phường Lam Sơn	7
5081	Phường Lê Lợi	7
5082	Xã Liên Phương	7
5083	Phường Minh Khai	7
5085	Xã Phương Chiểu	7
5089	Xã Trung Nghĩa	7
5094	Xã Dạ Trạch	7
5090	Xã An Vĩ	7
5091	Xã Bình Kiều	7
5093	Xã Chí Tân	7
5095	Xã Đại Hưng	7
5099	Xã Đông Kết	7
5100	Xã Đông Ninh	7
5105	Xã Liên Khê	7
5208	Xã Trung Hưng	7
5106	Xã Nhuế Dương	7
5107	Xã Ông Đình	7
5108	Xã Phùng Hưng	7
5109	Xã Tứ Dân	7
5111	Xã Tân Dân	7
5112	Xã Thành Công	7
5113	Xã Thuần Hưng	7
5114	Xã Việt Hòa	7
5115	Xã Chính Nghĩa	7
5116	Xã Đồng Thanh	7
6375	Xã Vĩnh Thạnh	29
5117	Xã Đức Hợp	7
6377	Xã Hậu Thạnh Đông	29
5118	Xã Hiệp Cường	7
6378	Xã Hậu Thạnh Tây	29
5119	Xã Hùng An	7
5120	Thị trấn Lương Bằng	7
5121	Xã Mai Động	7
6385	Xã Tân Lập	29
5122	Xã Ngọc Thanh	7
6386	Xã Tân Ninh	29
5124	Xã Nhân La	7
6387	Thị trấn Tân Thạnh	29
5125	Xã Phạm Ngũ Lão	7
5126	Xã Phú Thịnh	7
5127	Xã Song Mai	7
5130	Xã Vĩnh Xá	7
5128	Xã Thọ Vinh	7
5129	Xã Toàn Thắng	7
5131	Xã Vũ Xá	7
5151	Xã Nhật Quang	7
5132	Xã Bạch Sam	7
5158	Thị trấn Trần Cao	7
5133	Thị trấn Bần Yên Nhân	7
5134	Xã Cẩm Xá	7
5135	Xã Dị Sử	7
5136	Xã Dương Quang	7
5137	Xã Hòa Phong	7
5138	Xã Hưng Long	7
6588	Xã Trực Thanh	14
5139	Xã Minh Đức	7
5140	Xã Ngọc Lâm	7
5161	Xã Dị Chế	7
5141	Xã Nhân Hòa	7
5142	Xã Phan Đình Phùng	7
5143	Xã Phùng Chí Kiên	7
5144	Xã Xuân Dục	7
5162	Xã Đức Thắng	7
5145	Xã Đình Cao	7
5146	Xã Đoàn Đào	7
5147	Xã Minh Hoàng	7
5148	Xã Minh Tân	7
5149	Xã Minh Tiến	7
5150	Xã Nguyên Hòa	7
5152	Xã Phan Sào Nam	7
5153	Xã Quang Hưng	7
5154	Xã Tống Phan	7
5155	Xã Tống Trân	7
5156	Xã Tam Đa	7
5157	Xã Tiền Tiến	7
5159	Xã An Viên	7
5163	Xã Hải Triều	7
5160	Xã Cương Chính	7
5164	Xã Hưng Đạo	7
6628	Thị trấn Xuân Trường	14
5165	Xã Lệ Xá	7
5169	Xã Thụy Lôi	7
5166	Xã Minh Phượng	7
5171	Xã Thiện Phiến	7
5167	Xã Ngô Quyền	7
5173	Thị trấn Vương	7
5168	Xã Nhật Tân	7
5172	Xã Trung Dũng	7
5174	Xã Cửu Cao	7
5176	Xã Long Hưng	7
5175	Xã Liên Nghĩa	7
5177	Xã Mễ Sở	7
5178	Xã Nghĩa Trụ	7
5180	Xã Tân Tiến	7
5181	Xã Thắng Lợi	7
5182	Thị trấn Văn Giang	7
5183	Xã Vĩnh Khúc	7
5184	Xã Xuân Quan	7
5217	Xã Cam Hải Tây	8
5185	Xã Chỉ Đạo	7
5186	Xã Đại Đồng	7
5187	Xã Đình Dù	7
5188	Xã Lạc Đạo	7
5189	Xã Lạc Hồng	7
5190	Xã Lương Tài	7
5191	Xã Minh Hải	7
5192	Thị trấn Như Quỳnh	7
5193	Xã Tân Quang	7
5195	Xã Việt Hưng	7
5196	Xã Đồng Than	7
5197	Xã Giai Phạm	7
5198	Xã Hoàn Long	7
5227	Phường Ba Ngòi	8
5199	Xã Liêu Xá	7
5200	Xã Lý Thường Kiệt	7
5228	Xã Cam Bình	8
5202	Xã Ngọc Long	7
5230	Phường Cam Lộc	8
5233	Phường Cam Nghĩa	8
5203	Xã Nghĩa Hiệp	7
5234	Phường Cam Phú	8
5204	Xã Tân Lập	7
5205	Xã Tân Việt	7
5206	Xã Thanh Long	7
5207	Xã Trung Hòa	7
5209	Xã Việt Cường	7
5236	Phường Cam Phúc Bắc	8
5210	Xã Yên Hòa	7
6402	Xã Tân Tây	29
5211	Thị trấn Yên Mỹ	7
5212	Xã Yên Phú	7
6403	Xã Thạnh An	29
5213	Xã Cam An Bắc	8
6404	Thị trấn Thạnh Hóa	29
5214	Xã Cam An Nam	8
6408	Xã Thủy Tây	29
5215	Thị trấn Cam Đức	8
5216	Xã Cam Hải Đông	8
6409	Xã Thuận Bình	29
5218	Xã Cam Hiệp Bắc	8
5219	Xã Cam Hiệp Nam	8
5222	Xã Cam Tân	8
5223	Xã Cam Thành Bắc	8
5226	Xã Suối Tân	8
5229	Xã Cam Lập	8
5238	Xã Cam Thịnh Đông	8
5239	Xã Cam Thịnh Tây	8
5247	Thị trấn Diên Khánh	8
5240	Xã Cam Thành Nam	8
5242	Xã Diên An	8
5243	Xã Diên Bình	8
5255	Xã Diên Thạnh	8
5256	Xã Diên Thọ	8
5244	Xã Diên Đồng	8
5246	Xã Diên Hòa	8
5248	Xã Diên Lạc	8
5284	Phường Ngọc Hiệp	8
5285	Xã Phước Đồng	8
5249	Xã Diên Lộc	8
5286	Phường Phước Hải	8
5251	Xã Diên Phú	8
5252	Xã Diên Phước	8
5254	Xã Diên Tân	8
5257	Xã Diên Toàn	8
5258	Xã Diên Xuân	8
5259	Xã Suối Hiệp	8
5260	Xã Suối Tiên	8
5261	Xã Ba Cụm Bắc	8
5262	Xã Ba Cụm Nam	8
5263	Xã Sơn Bình	8
5287	Phường Phước Hòa	8
5268	Thị trấn Tô Hạp	8
5270	Xã Giang Ly	8
5271	Xã Khánh Bình	8
5275	Xã Khánh Phú	8
5276	Xã Khánh Thành	8
5278	Xã Khánh Trung	8
5279	Thị trấn Khánh Vĩnh	8
5280	Xã Liên Sang	8
5288	Phường Phước Long	8
5289	Phường Phước Tân	8
5290	Phường Phước Tiến	8
5291	Phường Phương Sài	8
5293	Phường Tân Lập	8
5296	Phường Vĩnh Hải	8
5302	Phường Vĩnh Phước	8
5297	Xã Vĩnh Hiệp	8
5304	Xã Vĩnh Thạnh	8
5298	Phường Vĩnh Hòa	8
5305	Phường Vĩnh Thọ	8
5300	Xã Vĩnh Ngọc	8
5307	Phường Vĩnh Trường	8
5308	Xã Vĩnh Trung	8
5310	Xã Ninh An	8
5311	Xã Ninh Bình	8
5312	Phường Ninh Đa	8
5313	Phường Ninh Diêm	8
5314	Xã Ninh Đông	8
5315	Phường Ninh Giang	8
5316	Phường Ninh Hải	8
5318	Phường Ninh Hiệp	8
5319	Xã Ninh Hưng	8
5317	Phường Ninh Hà	8
5320	Xã Ninh ích	8
5322	Xã Ninh Phụng	8
5323	Xã Ninh Phú	8
5324	Xã Ninh Phước	8
5325	Xã Ninh Quang	8
5326	Xã Ninh Sim	8
5327	Xã Ninh Sơn	8
5328	Xã Ninh Tân	8
5329	Xã Ninh Tây	8
5330	Xã Ninh Thọ	8
5331	Phường Ninh Thủy	8
5332	Xã Ninh Thân	8
5333	Xã Ninh Thượng	8
5334	Xã Ninh Trung	8
5335	Xã Ninh Vân	8
5336	Xã Ninh Xuân	8
5337	Xã Đại Lãnh	8
5338	Xã Vạn Bình	8
5339	Thị trấn Vạn Giã	8
5340	Xã Vạn Hưng	8
5341	Xã Vạn Khánh	8
5349	Xã Xuân Sơn	8
5350	Xã Đông Thái	1
6413	Xã Long Thạnh	29
5351	Xã Đông Yên	1
6415	Xã Long Thuận	29
5353	Xã Nam Thái	1
6424	Xã Hưng Điền A	29
5356	Xã Tây Yên	1
5357	Xã Tây Yên A	1
5358	Thị trấn Thứ Ba	1
5359	Xã Đông Hòa	1
5360	Xã Đông Hưng	1
5722	Phường Hoàng Văn Thụ	12
5361	Xã Đông Hưng A	1
5725	Phường Tam Thanh	12
5362	Xã Đông Hưng B	1
5726	Phường Vĩnh Trại	12
5363	Xã Đông Thạnh	1
5364	Xã Tân Thạnh	1
5366	Xã Thuận Hoà	1
5367	Xã Vân Khánh	1
5370	Xã Bình An	1
5371	Xã Giục Tượng	1
5372	Xã Minh Hòa	1
5373	Thị trấn Minh Lương	1
5375	Xã Mong Thọ A	1
5376	Xã Mong Thọ B	1
5377	Xã Thạnh Lộc	1
5378	Xã Vĩnh Hòa Hiệp	1
5379	Xã Vĩnh Hoà Phú	1
5380	Xã Bàn Tân Định	1
5775	Thị trấn Thất Khê	12
5779	Xã An Hùng	12
5780	Xã Bắc La	12
5381	Xã Bàn Thạch	1
5382	Thị trấn Giồng Riềng	1
5383	Xã Hoà An	1
5384	Xã Hòa Hưng	1
5386	Xã Hòa Thuận	1
5387	Xã Long Thạnh	1
5388	Xã Ngọc Chúc	1
5389	Xã Ngọc Hoà	1
5392	Xã Thạnh Bình	1
5393	Xã Thạnh Hòa	1
5394	Xã Thạnh Hưng	1
5397	Xã Vĩnh Phú	1
5398	Xã Vĩnh Thạnh	1
5786	Thị trấn Na Sầm	12
5399	Xã Phú Lợi	1
5795	Xã Thành Hòa	12
5796	Xã Thanh Long	12
5797	Xã Trùng Khánh	12
5798	Xã Trùng Quán	12
5799	Xã Bình Phúc	12
5401	Xã Tân Khánh Hòa	1
5402	Xã Vĩnh Điều	1
5403	Xã Vĩnh Phú	1
5404	Xã Định An	1
5406	Thị trấn Gò Quao	1
5407	Xã Thới Quản	1
5408	Xã Thủy Liễu	1
5411	Xã Vĩnh Phước A	1
5412	Xã Vĩnh Phước B	1
5823	Phường Đoàn Kết	9
5413	Xã Vĩnh Thắng	1
5415	Phường Bình San	1
5416	Phường Đông Hồ	1
5417	Xã Mỹ Đức	1
5418	Phường Pháo Đài	1
5419	Xã Thuận Yên	1
5422	Xã Bình Giang	1
5423	Xã Bình Sơn	1
5424	Thị trấn Hòn Đất	1
5426	Xã Mỹ Hiệp Sơn	1
5428	Xã Mỹ Phước	1
5429	Xã Mỹ Thái	1
5430	Xã Mỹ Thuận	1
5431	Xã Nam Thái Sơn	1
5434	Xã Sơn Kiên	1
5435	Xã Thổ Sơn	1
5437	Xã Hòn Tre	1
5444	Xã Hòn Nghệ	1
5438	Xã Lại Sơn	1
5441	Xã Bình Trị	1
5829	Phường Tân Phong	9
5833	Xã Kan Hồ	9
5834	Xã Mù Cả	9
5442	Xã Dương Hòa	1
5890	Xã Sà Dề Phìn	9
5443	Xã Hòa Điền	1
5940	Phường 1	11
5445	Xã Kiên Bình	1
5452	Thị trấn Dương Đông	1
5977	Xã An Nhơn	11
5978	Xã Đạ Kho	11
5979	Xã Đạ Lây	11
5446	Thị trấn Kiên Lương	1
5447	Xã Sơn Hải	1
5980	Xã Đạ Pal	11
5981	Thị trấn Đạ Tẻh	11
5982	Xã Hà Đông	11
5983	Xã Hương Lâm	11
5987	Xã Triệu Hải	11
5988	Xã Bình Thạnh	11
5989	Xã Đà Loan	11
5990	Xã Đa Quyn	11
5991	Xã Hiệp An	11
5992	Xã Hiệp Thạnh	11
5993	Xã Liên Hiệp	11
5463	Phường Vĩnh Hiệp	1
5465	Phường Vĩnh Lợi	1
5467	Phường Vĩnh Thanh	1
5994	Thị trấn Liên Nghĩa	11
5995	Xã N'Thol Hạ	11
5996	Xã Ninh Gia	11
5997	Xã Ninh Loan	11
5998	Xã Phú Hội	11
5999	Xã Tà Hine	11
6000	Xã Tà Năng	11
5477	Xã Thạnh Đông	1
6003	Phường 1	11
6004	Phường 10	11
5478	Xã Thạnh Đông A	1
6005	Phường 11	11
5480	Xã Thạnh Trị	1
5481	Xã An Minh Bắc	1
5486	Xã Vĩnh Hòa	1
5482	Xã Hoà Chánh	1
5484	Xã Thạnh Yên	1
5488	Xã Phong Đông	1
5491	Xã Vĩnh Bình Nam	1
5507	Thị trấn Đắk Hà	16
5508	Xã Đắk HRing	16
5509	Xã Đắk La	16
5519	Thị trấn Đắk Tô	16
5522	Xã Kon Đào	16
5523	Xã Ngọk Tụ	16
5524	Xã Pô Kô	16
5525	Xã Tân Cảnh	16
5526	Xã Văn Lem	16
5527	Xã Ia Dal	16
5528	Xã Ia Dom	16
5533	Xã Đắk Tăng	16
5535	Xã Măng Buk	16
5536	Xã Măng Cành	16
5539	Xã Đắk Kôi	16
5540	Xã Đắk Pne	16
5541	Xã Đắk Ruồng	16
5542	Thị trấn Đắk Rve	16
5543	Xã Đắk Tờ Re	16
5544	Xã Đắk Tơ Lung	16
5546	Xã Chư Hreng	16
5547	Xã Đắk Blà	16
5550	Xã Đăk Năng	16
5551	Xã Đoàn Kết	16
5555	Xã Kroong	16
5557	Xã Ngọk Bay	16
5558	Phường Ngô Mây	16
5559	Phường Nguyễn Trãi	16
5564	Phường Trần Hưng Đạo	16
5565	Phường Trường Chinh	16
5568	Xã Đắk Dục	16
5569	Xã Đắk Kan	16
5570	Xã Đắk Nông	16
5591	Xã Măng Ri	16
5594	Xã Tê Xăng	16
5598	Xã Bắc Sơn (Xã)	12
5602	Xã Hữu Vĩnh	12
5603	Xã Hưng Vũ	12
5604	Xã Long Đống	12
5605	Xã Nhất Hòa	12
5606	Xã Nhất Tiến	12
5607	Xã Quỳnh Sơn	12
5613	Xã Vạn Thủy	12
5614	Xã Vũ Lễ	12
5616	Xã Vũ Sơn	12
5638	Xã Bình Trung	12
5641	Xã Công Sơn	12
5642	Thị trấn Đồng Đăng	12
5645	Xã Hồng Phong	12
5649	Xã Mẫu Sơn	12
5651	Xã Song Giáp	12
5652	Xã Tân Liên	12
5654	Xã Thạch Đạn	12
5655	Xã Thụy Hùng	12
5656	Xã Thanh Lòa	12
5658	Xã Xuân Long	12
5660	Xã Bắc Thủy	12
5661	Xã Bằng Hữu	12
5662	Xã Bằng Mạc	12
5663	Thị trấn Chi Lăng (Thị trấn )	12
5664	Xã Chi Lăng (Xã)	12
5671	Xã Liên Sơn	12
5672	Xã Mai Sao	12
5673	Xã Nhân Lý	12
5674	Xã Quan Sơn	12
5675	Xã Quang Lang	12
5676	Xã Thượng Cường	12
5677	Xã Vạn Linh	12
5678	Xã Vân An	12
5679	Xã Vân Thủy	12
5680	Xã Y Tịch	12
5681	Xã Bắc Lãng	12
5682	Xã Bắc Xa	12
5683	Xã Bính Xá	12
5687	Thị trấn Đình Lập (Thị trấn )	12
5691	Thị trấn NT Thái Bình	12
5695	Xã Đồng Tiến	12
5697	Xã Hồ Sơn	12
5699	Thị trấn Hữu Lũng	12
5701	Xã Hòa Lạc	12
5702	Xã Hòa Sơn	12
5703	Xã Hòa Thắng	12
5704	Xã Minh Hòa	12
5705	Xã Minh Sơn	12
5706	Xã Minh Tiến	12
5708	Xã Quyết Thắng	12
5709	Xã Sơn Hà	12
5710	Xã Tân Lập	12
5711	Xã Tân Thành	12
5712	Xã Thanh Sơn	12
5713	Xã Thiện Kỵ	12
5714	Xã Vân Nham	12
5715	Xã Yên Bình	12
5716	Xã Yên Sơn	12
5717	Xã Yên Thịnh	12
5728	Xã Bằng Khánh	12
5729	Xã Đồng Bục	12
5733	Xã Hiệp Hạ	12
5734	Xã Khuất Xá	12
5735	Thị trấn Lộc Bình	12
5737	Xã Lục Thôn	12
5740	Thị trấn Na Dương	12
5742	Xã Như Khuê	12
6007	Phường 2	11
5750	Xã Vân Mộng	12
5751	Xã Xuân Dương	12
5752	Xã Xuân Lễ	12
6011	Phường 6	11
6013	Phường 8	11
5753	Xã Xuân Mãn	12
6046	Thị trấn D'Ran	11
6063	Xã Đan Phượng	11
5754	Xã Xuân Tình	12
5755	Xã Yên Khoái	12
5756	Xã Bắc ái	12
5757	Xã Cao Minh	12
5758	Xã Chi Lăng	12
5759	Xã Chí Minh	12
5760	Xã Đại Đồng	12
5761	Xã Đề Thám	12
5762	Xã Đội Cấn	12
5763	Xã Đào Viên	12
5764	Xã Đoàn Kết	12
5765	Xã Hùng Sơn	12
5766	Xã Hùng Việt	12
5767	Xã Kháng Chiến	12
5770	Xã Quốc Khánh	12
5771	Xã Quốc Việt	12
6082	Thị trấn Phố Lu (Thị trấn )	10
6084	Xã Phong Niên	10
6085	Xã Phú Nhuận	10
5784	Xã Hoàng Văn Thụ	12
5788	Xã Nhạc Kỳ	12
5789	Xã Tân Lang	12
5791	Xã Tân Tác	12
5792	Xã Tân Thanh	12
5793	Xã Tân Việt	12
5794	Xã Thụy Hùng	12
5800	Xã Chu Túc	12
5801	Xã Đại An	12
5802	Xã Đồng Giáp	12
5803	Xã Hữu Lễ	12
5804	Xã Hòa Bình	12
5805	Xã Khánh Khê	12
5806	Xã Lương Năng	12
6116	Thị trấn Bắc Hà	10
5808	Xã Song Giang	12
5809	Xã Tân Đoàn	12
5810	Xã Trấn Ninh	12
5811	Xã Tràng Các	12
5812	Xã Tràng Phái	12
5813	Xã Tràng Sơn	12
5814	Xã Tri Lễ	12
5815	Xã Tú Xuyên	12
5816	Xã Văn An	12
5817	Xã Vân Mộng	12
5818	Thị trấn Văn Quan	12
5819	Xã Việt Yên	12
6139	Xã Cốc San	10
5820	Xã Vĩnh Lại	12
5821	Xã Xuân Mai	12
5822	Xã Yên Phúc	12
5824	Phường Đông Phong	9
6161	Phường Duyên Hải	10
5825	Xã Nậm Loỏng	9
5826	Phường Quyết Thắng	9
6163	Phường Kim Tân	10
5827	Phường Quyết Tiến	9
6169	Xã Thống Nhất	10
5835	Thị trấn Mường Tè (Thị trấn )	9
5836	Xã Mường Tè (Xã)	9
5837	Xã Nậm Khao	9
5838	Xã Pa ủ	9
5842	Xã Thu Lũm	9
5843	Xã Vàng San	9
5844	Xã Hua Bun	9
5845	Xã Lê Lợi	9
5851	Thị trấn Nậm Nhùn	9
5852	Xã Nậm Pì	9
5853	Xã Pú Đao	9
5854	Xã Trung Chải	9
5855	Xã Bản Lang	9
5856	Xã Dào San	9
5857	Xã Hoang Thèn	9
5862	Xã Ma Li Chải	9
5867	Xã Pa Vây Sử	9
5868	Thị trấn Phong Thổ	9
5869	Xã Sì Lờ Lầu	9
5870	Xã Sin Suối Hồ	9
5871	Xã Tông Qua Lìn	9
5872	Xã Vàng Ma Chải	9
5873	Xã Căn Co	9
5874	Xã Chăn Nưa	9
5875	Xã Hồng Thu	9
5876	Xã Làng Mô	9
5877	Xã Lùng Thàng	9
5878	Xã Ma Quai	9
5879	Xã Nậm Cha	9
5880	Xã Nậm Cuổi	9
5881	Xã Nậm Hăn	9
5882	Xã Nậm Mạ	9
5883	Xã Nậm Tăm	9
5884	Xã Noong Hẻo	9
5885	Xã Pa Khoá	9
5886	Xã Pa Tần	9
5888	Xã Phìn Hồ	9
5889	Xã Pu Sam Cáp	9
5891	Thị trấn Sìn Hồ	9
5892	Xã Tả Ngảo	9
5896	Xã Bản Giang	9
5897	Xã Bản Hon	9
6171	Phường Xuân Tăng	10
6172	Xã Bản Lầu	10
5900	Xã Hồ Thầu	9
6229	Xã Minh Lương	10
6230	Xã Nậm Chầy	10
6231	Xã Nậm Mả	10
5902	Xã Nà Tăm	9
5903	Xã Nùng Nàng	9
5905	Xã Sùng Phài	9
5906	Xã Tả Lèng	9
5907	Thị trấn Tam Đường	9
5908	Xã Thèn Sin	9
5909	Xã Hố Mít	9
5910	Xã Mường Khoa	9
5914	Xã Phúc Khoa	9
5915	Xã Tà Mít	9
5916	Thị trấn Tân Uyên	9
5917	Xã Thân Thuộc	9
5919	Xã Hua Nà	9
5930	Thị trấn Than Uyên	9
5931	Phường B'lao	11
5937	Phường Lộc Sơn	11
5938	Xã Lộc Thanh	11
5939	Phường Lộc Tiến	11
5941	Phường 2	11
5942	Xã B' Lá	11
5943	Xã Lộc An	11
5944	Xã Lộc Bảo	11
5945	Xã Lộc Bắc	11
5946	Xã Lộc Đức	11
5958	Xã Đức Phổ	11
5959	Xã Gia Viễn	11
5960	Xã Mỹ Lâm	11
5961	Xã Nam Ninh	11
5962	Xã Phước Cát 1	11
5964	Xã Quảng Ngãi	11
5969	Xã Đạ Oai	11
5971	Xã Đạ Tồn	11
5972	Xã Đoàn Kết	11
5974	Thị trấn Ma Đa Guôi (Thị trấn )	11
5975	Xã Ma Đa Guôi (Xã)	11
5976	Xã Phước Lộc	11
6006	Phường 12	11
6014	Phường 9	11
6015	Xã Tà Nung	11
6016	Xã Trạm Hành	11
6017	Xã Xuân Thọ	11
6018	Xã Xuân Trường	11
6031	Xã Đinh Trang Thượng	11
6032	Xã Gia Bắc	11
6033	Xã Gia Hiệp	11
6034	Xã Gung Ré	11
6035	Xã Hòa Bắc	11
6036	Xã Hòa Nam	11
6037	Xã Hòa Ninh	11
6038	Xã Hòa Trung	11
6039	Xã Liên Đầm	11
6041	Xã Tam Bố	11
6044	Xã Tân Nghĩa	11
6045	Xã Tân Thượng	11
6065	Xã Đông Thanh	11
6066	Xã Gia Lâm	11
6067	Xã Hoài Đức	11
6068	Xã Liên Hà	11
6069	Xã Mê Linh	11
6070	Thị trấn Nam Ban	11
6071	Xã Nam Hà	11
6072	Xã Phi Tô	11
6075	Xã Tân Hà	11
6076	Xã Tân Thanh	11
6077	Xã Tân Văn	11
6078	Xã Bản Cầm	10
6079	Xã Bản Phiệt	10
6080	Xã Gia Phú	10
6081	Thị trấn N.T Phong Hải	10
6086	Xã Sơn Hải	10
6087	Xã Sơn Hà	10
6095	Xã Điện Quan	10
6096	Xã Kim Sơn	10
6097	Xã Phúc Khánh	10
6099	Xã Lương Sơn	10
6102	Thị trấn Phố Ràng	10
6114	Xã Bản Phố	10
6115	Xã Bảo Nhai	10
6119	Xã Hoàng Thu Phố	10
6121	Xã Lùng Cải	10
6122	Xã Lùng Phình	10
6123	Xã Nậm Đét	10
6124	Xã Nậm Khánh	10
6125	Xã Nậm Lúc	10
6126	Xã Nậm Mòn	10
6127	Xã Na Hối	10
6128	Xã Tả Củ Tỷ	10
6129	Xã Tả Van Chư	10
6130	Xã Tà Chải	10
6131	Xã Thải Giàng Phố	10
6132	Xã A Lù	10
6133	Xã A Mú Sung	10
6134	Xã Bản Qua	10
6135	Xã Bản Vược	10
6136	Xã Bản Xèo	10
6137	Thị trấn Bát Xát	10
6138	Xã Cốc Mỳ	10
6140	Xã Dền Sáng	10
6577	Xã Trực Cường	14
6141	Xã Dền Thàng	10
6142	Xã Mường Hum	10
6143	Xã Mường Vi	10
6144	Xã Nậm Chạc	10
6145	Xã Nậm Pung	10
6147	Xã Pa Cheo	10
6148	Xã Phìn Ngan	10
6149	Xã Quang Kim	10
6150	Xã Sàng Ma Sáo	10
6151	Xã Tòng Sành	10
6152	Xã Trịnh Tường	10
6154	Xã Y Tý	10
6155	Phường Bắc Cường	10
6156	Phường Bắc Lệnh	10
6246	Xã Lương Bình	29
6157	Phường Bình Minh	10
6159	Xã Cam Đường	10
6160	Xã Đồng Tuyển	10
6162	Xã Hợp Thành	10
6164	Phường Lào Cai	10
6165	Phường Nam Cường	10
6167	Phường Pom Hán	10
6170	Xã Vạn Hoà	10
6173	Xã Bản Sen	10
6174	Xã Cao Sơn	10
6175	Xã Dìn Chin	10
6176	Xã La Pan Tẩn	10
6177	Xã Lùng Khấu Nhin	10
6178	Xã Lùng Vai	10
6179	Thị trấn Mường Khương	10
6183	Xã Tả Gia Khâu	10
6184	Xã Tả Ngải Chồ	10
6185	Xã Tả Thàng	10
6186	Xã Thanh Bình	10
6187	Xã Tung Chung Phố	10
6188	Xã Bản Hồ	10
6190	Xã Thanh Bình	10
6191	Xã Mường Hoa	10
6193	Xã Liên Minh	10
6196	Phường Sa Pả	10
6200	Xã Ngũ Chỉ Sơn	10
6252	Xã Tân Hòa	29
6201	Xã Tả Phìn	10
6202	Xã Tả Van	10
6204	Xã Mường Bo	10
6307	Xã Đức Hòa Đông	29
6205	Xã Trung Chải	10
6206	Xã Bản Mế	10
6310	Xã Đức Lập Hạ	29
6207	Xã Cán Cấu	10
6209	Xã Lùng Thần	10
6211	Xã Quan Hồ Thần	10
6212	Xã Nàn Sán	10
6213	Xã Nàn Xín	10
6215	Xã Sán Chải	10
6216	Thị trấn Si Ma Cai	10
6217	Xã Sín Chéng	10
6218	Xã Thào Chư Phìn	10
6219	Xã Chiềng Ken	10
6220	Xã Dần Thàng	10
6221	Xã Dương Quỳ	10
6222	Xã Hoà Mạc	10
6223	Thị trấn Khánh Yên	10
6224	Xã Khánh Yên Hạ	10
6225	Xã Khánh Yên Thượng	10
6226	Xã Khánh Yên Trung	10
6227	Xã Làng Giàng	10
6228	Xã Liêm Phú	10
6232	Xã Nậm Rạng	10
6242	Xã An Thạnh	29
6243	Thị trấn Bến Lức	29
6244	Xã Bình Đức	29
6245	Xã Long Hiệp	29
6247	Xã Lương Hòa	29
6311	Xã Đức Lập Thượng	29
6312	Thị trấn Hậu Nghĩa	29
6248	Xã Mỹ Yên	29
6249	Xã Nhựt Chánh	29
6314	Thị trấn Hiệp Hòa (Thị trấn )	29
6250	Xã Phước Lợi	29
6251	Xã Tân Bửu	29
6253	Xã Thạnh Đức	29
6254	Xã Thạnh Hòa	29
6255	Xã Thạnh Lợi	29
6256	Xã Thạnh Phú	29
6257	Thị trấn Cần Đước	29
6258	Xã Long Cang	29
6316	Xã Hòa Khánh Đông	29
6259	Xã Long Định	29
6260	Xã Long Hựu Đông	29
6261	Xã Long Hựu Tây	29
6262	Xã Long Hòa	29
6317	Xã Hòa Khánh Nam	29
6263	Xã Long Khê	29
6264	Xã Long Sơn	29
6265	Xã Long Trạch	29
6266	Xã Mỹ Lệ	29
6268	Xã Phước Tuy	29
6270	Xã Tân Ân	29
6271	Xã Tân Chánh	29
6275	Xã Đông Thạnh	29
6276	Xã Long An	29
6278	Xã Long Phụng	29
6279	Xã Long Thượng	29
6280	Xã Mỹ Lộc	29
6281	Xã Phước Hậu	29
6282	Xã Phước Lại	29
6284	Xã Phước Lý	29
6285	Xã Phước Vĩnh Đông	29
6286	Xã Phước Vĩnh Tây	29
6287	Xã Tân Kim	29
6288	Xã Tân Tập	29
6289	Xã Thuận Thành	29
6290	Xã Trường Bình	29
6291	Xã An Lục Long	29
6292	Xã Bình Quới	29
6320	Xã Mỹ Hạnh Bắc	29
6293	Xã Dương Xuân Hội	29
6294	Xã Hiệp Thạnh	29
6295	Xã Hòa Phú	29
6296	Xã Long Trì	29
6325	Xã Bình Hòa Hưng	29
6297	Xã Phú Ngãi Trị	29
6298	Xã Phước Tân Hưng	29
6299	Thị trấn Tầm Vu	29
6301	Xã Thanh Vĩnh Đông	29
6302	Xã Thuận Mỹ	29
6303	Xã Vĩnh Công	29
6306	Thị trấn Đức Hòa	29
6308	Xã Đức Hòa Hạ	29
6328	Thị trấn Đông Thành	29
6330	Xã Mỹ Quý Đông	29
6309	Xã Đức Hòa Thượng	29
6313	Xã Hựu Thạnh	29
6315	Xã Hiệp Hòa (Xã)	29
6318	Xã Hòa Khánh Tây	29
6319	Xã Lộc Giang	29
6321	Xã Mỹ Hạnh Nam	29
6334	Xã Mỹ Thạnh Tây	29
6335	Xã Bình Hiệp	29
6322	Xã Tân Mỹ	29
6323	Xã Tân Phú	29
6324	Xã Bình Hòa Bắc	29
6326	Xã Bình Hòa Nam	29
6327	Xã Bình Thành	29
6331	Xã Mỹ Quý Tây	29
6338	Phường 2	29
6332	Xã Mỹ Thạnh Bắc	29
6333	Xã Mỹ Thạnh Đông	29
6336	Xã Bình Tân	29
6337	Phường 1	29
6340	Xã Thạnh Hưng	29
6344	Xã Bình Hòa Tây	29
6341	Xã Thạnh Trị	29
6342	Xã Tuyên Thạnh	29
6343	Xã Bình Hòa Đông	29
6345	Xã Bình Hòa Trung	29
6349	Xã Tân Thành	29
6346	Xã Bình Phong Thạnh	29
6353	Phường Khánh Hậu	29
6347	Xã Bình Thạnh	29
6357	Phường 2	29
6348	Xã Tân Lập	29
6358	Phường 3	29
6350	Xã An Vĩnh Ngãi	29
6351	Xã Bình Tâm	29
6352	Xã Hướng Thọ Phú	29
6354	Xã Lợi Bình Nhơn	29
6355	Xã Nhơn Thạnh Trung	29
6356	Phường 1	29
6360	Phường 5	29
6361	Phường 6	29
6363	Phường Tân Khánh	29
6365	Xã Hưng Điền B	29
6366	Xã Hưng Hà	29
6373	Xã Vĩnh Đại	29
6374	Xã Vĩnh Lợi	29
6379	Xã Kiến Bình	29
6380	Xã Nhơn Hòa	29
6381	Xã Nhơn Hòa Lập	29
6383	Xã Tân Bình	29
6384	Xã Tân Hòa	29
6388	Xã Tân Thành	29
6390	Xã Bình Lãng	29
6389	Xã An Nhựt Tân	29
6391	Xã Bình Tịnh	29
6392	Xã Bình Trinh Đông	29
6394	Xã Lạc Tấn	29
6395	Xã Mỹ Bình	29
6396	Xã Nhựt Ninh	29
6397	Xã Quê Mỹ Thạnh	29
6398	Xã Tân Phước Tây	29
6399	Thị trấn Tân Trụ	29
6400	Xã Tân Đông	29
6401	Xã Tân Hiệp	29
6405	Xã Thạnh Phú	29
6430	Xã Vĩnh Bình	29
6406	Xã Thạnh Phước	29
6407	Xã Thủy Đông	29
6410	Xã Thuận Nghĩa Hòa	29
6431	Thị trấn Vĩnh Hưng	29
6411	Xã Bình An	29
6412	Xã Bình Thạnh	29
6416	Xã Mỹ An	29
6417	Xã Mỹ Lạc	29
6418	Xã Mỹ Phú	29
7335	Phường Tấn Tài	8
6419	Xã Mỹ Thạnh	29
6420	Xã Nhị Thành	29
6422	Xã Tân Thành	29
6423	Thị trấn Thủ Thừa	29
6426	Xã Thái Bình Trung	29
6427	Xã Thái Trị	29
6428	Xã Tuyên Bình	29
6429	Xã Tuyên Bình Tây	29
6436	Xã Giao An	14
6432	Xã Vĩnh Thuận	29
6439	Xã Giao Hà	14
6433	Xã Vĩnh Trị	29
6434	Xã Bạch Long	14
6437	Xã Giao Châu	14
6438	Xã Giao Hải	14
6444	Xã Giao Phong	14
6445	Xã Giao Tân	14
6446	Xã Giao Thịnh	14
6447	Xã Giao Thanh	14
6448	Xã Giao Thiện	14
6449	Xã Giao Tiến	14
6451	Xã Giao Yến	14
6452	Xã Hồng Thuận	14
6455	Thị trấn Quất Lâm	14
6456	Thị trấn Cồn	14
6458	Xã Hải Anh	14
6463	Xã Hải Đông	14
6464	Xã Hải Đường	14
6459	Xã Hải Bắc	14
6460	Xã Hải Châu	14
6468	Xã Hải Hưng	14
7353	Xã Cấp Dẫn	15
6469	Xã Hải Lộc	14
6470	Xã Hải Long	14
6471	Xã Hải Lý	14
6472	Xã Hải Minh	14
6488	Xã Hải Xuân	14
6473	Xã Hải Nam	14
6477	Xã Hải Phúc	14
6478	Xã Hải Phương	14
6486	Xã Hải Trung	14
7354	Xã Cát Trù	15
6490	Thị trấn Yên Định	14
6491	Xã Mỹ Hà	14
6492	Xã Mỹ Hưng	14
6500	Xã Mỹ Tiến	14
6493	Thị trấn Mỹ Lộc	14
6504	Phường Cửa Nam	14
6494	Xã Mỹ Phúc	14
6505	Phường Hạ Long	14
6495	Xã Mỹ Tân	14
6496	Xã Mỹ Thắng	14
6497	Xã Mỹ Thịnh	14
6498	Xã Mỹ Thành	14
7356	Xã Đồng Cam	15
7357	Xã Đồng Lương	15
6499	Xã Mỹ Thuận	14
6501	Xã Mỹ Trung	14
6502	Phường Bà Triệu	14
6503	Phường Cửa Bắc	14
6506	Xã Lộc An	14
6507	Phường Lộc Hạ	14
6511	Xã Nam Phong	14
6508	Xã Lộc Hòa	14
6512	Xã Nam Vân	14
6513	Phường Năng Tĩnh	14
6516	Phường Phan Đình Phùng	14
6509	Phường Lộc Vượng	14
6517	Phường Quang Trung	14
6510	Xã Mỹ Xá	14
6519	Phường Trần Đăng Ninh	14
6528	Xã Đồng Sơn	14
7359	Xã Hiền Đa	15
6529	Xã Điền Xá	14
6530	Xã Hồng Quang	14
6531	Xã Nam Cường	14
6532	Xã Nam Dương	14
6533	Thị trấn Nam Giang	14
6534	Xã Nam Hải	14
6535	Xã Nam Hồng	14
6536	Xã Nam Hoa	14
6537	Xã Nam Hùng	14
7365	Xã Phùng Xá	15
6539	Xã Nam Mỹ	14
6540	Xã Nam Thắng	14
6541	Xã Nam Thái	14
6542	Xã Nam Thanh	14
6543	Xã Nam Tiến	14
6544	Xã Nam Toàn	14
7368	Xã Sơn Nga	15
6545	Xã Nghĩa An	14
6546	Xã Tân Thịnh	14
6547	Xã Hoàng Nam	14
6548	Thị trấn Liễu Đề	14
6549	Xã Nam Điền	14
6565	Xã Nghĩa Thắng	14
6566	Xã Nghĩa Thịnh	14
6567	Xã Nghĩa Thái	14
6568	Xã Nghĩa Thành	14
6569	Xã Nghĩa Trung	14
6570	Thị trấn Quỹ Nhất	14
6571	Thị trấn Rạng Đông	14
6572	Thị trấn Cổ Lễ	14
6579	Xã Trực Đạo	14
6573	Thị trấn Cát Thành	14
6581	Xã Trực Hùng	14
6574	Xã Liêm Hải	14
6575	Xã Phương Định	14
6578	Xã Trực Đại	14
6583	Xã Trực Mỹ	14
6580	Xã Trực Hưng	14
6582	Xã Trực Khang	14
6586	Xã Trực Thắng	14
6584	Xã Trực Nội	14
6585	Xã Trực Phú	14
6589	Xã Trực Thuận	14
6590	Xã Trực Tuấn	14
6591	Xã Trung Đông	14
6592	Xã Việt Hùng	14
6593	Xã Cộng Hòa	14
6594	Xã Đại An	14
7373	Xã Thụy Liễu	15
6595	Xã Đại Thắng	14
6596	Thị trấn Gôi	14
7381	Xã Xương Thịnh	15
6597	Xã Hợp Hưng	14
6610	Xã Vĩnh Hào	14
6598	Xã Hiển Khánh	14
6599	Xã Kim Thái	14
6600	Xã Liên Bảo	14
6601	Xã Liên Minh	14
6602	Xã Minh Tân	14
6603	Xã Minh Thuận	14
6604	Xã Quang Trung	14
6614	Xã Xuân Đài	14
6605	Xã Tam Thanh	14
6607	Xã Tân Thành	14
6618	Xã Xuân Ngọc	14
6608	Xã Thành Lợi	14
6609	Xã Trung Thành	14
6621	Xã Xuân Phú	14
6611	Xã Thọ Nghiệp	14
6624	Xã Xuân Thủy	14
6612	Xã Xuân Bắc	14
6613	Xã Xuân Châu	14
6615	Xã Xuân Hồng	14
6625	Xã Xuân Thành	14
6616	Xã Xuân Hòa	14
6617	Xã Xuân Kiên	14
6619	Xã Xuân Ninh	14
6620	Xã Xuân Phong	14
6622	Xã Xuân Phương	14
6623	Xã Xuân Tân	14
6629	Xã Xuân Trung	14
6630	Xã Xuân Vinh	14
6631	Thị trấn Lâm	14
6743	Xã Bắc Sơn	13
6632	Xã Yên Bằng	14
6758	Xã Lưu Sơn	13
6633	Xã Yên Bình	14
6762	Xã Ngọc Sơn	13
6763	Xã Nhân Sơn	13
6764	Xã Quang Sơn	13
6634	Xã Yên Chính	14
6635	Xã Yên Cường	14
6653	Xã Yên Phương	14
6636	Xã Yên Đồng	14
6637	Xã Yên Dương	14
6780	Xã Quỳnh Liên	13
6638	Xã Yên Hồng	14
6639	Xã Yên Hưng	14
6658	Xã Yên Thành	14
6640	Xã Yên Khang	14
6660	Xã Yên Trị	14
6641	Xã Yên Khánh	14
6662	Xã Yên Xá	14
6642	Xã Yên Lộc	14
6781	Phường Quỳnh Phương	13
6782	Phường Quỳnh Thiện	13
6784	Xã Quỳnh Vinh	13
6643	Xã Yên Lợi	14
6644	Xã Yên Lương	14
6788	Xã Hưng Khánh	13
6645	Xã Yên Mỹ	14
6795	Xã Hưng Nhân	13
6647	Xã Yên Nghĩa	14
6796	Xã Hưng Phú	13
6648	Xã Yên Nhân	14
6649	Xã Yên Ninh	14
6679	Xã Thạch Sơn	13
6680	Xã Thọ Sơn	13
6650	Xã Yên Phong	14
6651	Xã Yên Phú	14
6684	Phường Nghi Hải	13
6652	Xã Yên Phúc	14
6696	Thị trấn Con Cuông	13
6697	Xã Đôn Phục	13
6698	Xã Lạng Khê	13
6699	Xã Lục Dạ	13
6702	Xã Thạch Ngàn	13
6654	Xã Yên Quang	14
6655	Xã Yên Tân	14
6657	Xã Yên Thọ	14
6659	Xã Yên Tiến	14
6661	Xã Yên Trung	14
6663	Thị trấn Anh Sơn	13
6705	Xã Diễn Bích	13
6664	Xã Bình Sơn	13
6669	Xã Hội Sơn	13
6670	Xã Hoa Sơn	13
6671	Xã Hùng Sơn	13
6672	Xã Khai Sơn	13
6708	Thị trấn Diễn Châu	13
6673	Xã Lạng Sơn	13
6674	Xã Lĩnh Sơn	13
6675	Xã Long Sơn	13
6676	Xã Phúc Sơn	13
6677	Xã Tam Sơn	13
7390	Thị trấn Đoan Hùng	15
6678	Xã Tào Sơn	13
6681	Xã Thành Sơn	13
6682	Xã Tường Sơn	13
6683	Xã Vĩnh Sơn	13
6685	Phường Nghi Hòa	13
6687	Phường Nghi Tân	13
6688	Phường Nghi Thu	13
6691	Xã Bồng Khê	13
6693	Xã Cam Lâm	13
6694	Xã Châu Khê	13
6695	Xã Chi Khê	13
6704	Xã Diễn An	13
6706	Xã Diễn Bình	13
6712	Xã Diễn Hải	13
6707	Xã Diễn Cát	13
6709	Xã Diễn Đồng	13
6710	Xã Diễn Đoài	13
6711	Xã Diễn Hạnh	13
6713	Xã Diễn Hồng	13
6714	Xã Diễn Hoa	13
6725	Xã Diễn Ngọc	13
6715	Xã Diễn Hoàng	13
6716	Xã Diễn Hùng	13
7418	Xã Động Lâm	15
6717	Xã Diễn Kỷ	13
6718	Xã Diễn Kim	13
6727	Xã Diễn Phong	13
6719	Xã Diễn Lộc	13
6720	Xã Diễn Lợi	13
6721	Xã Diễn Lâm	13
6722	Xã Diễn Liên	13
6723	Xã Diễn Mỹ	13
6724	Xã Diễn Minh	13
6726	Xã Diễn Nguyên	13
6729	Xã Diễn Phúc	13
6731	Xã Diễn Tân	13
6732	Xã Diễn Thắng	13
6733	Xã Diễn Thịnh	13
7431	Xã Mai Tùng	15
6734	Xã Diễn Thọ	13
6735	Xã Diễn Thái	13
6736	Xã Diễn Thành	13
7433	Xã Minh Hạc	15
6737	Xã Diễn Tháp	13
6738	Xã Diễn Trường	13
7437	Xã Vụ Cầu	15
6739	Xã Diễn Trung	13
6740	Xã Diễn Vạn	13
6741	Xã Diễn Xuân	13
6742	Xã Diễn Yên	13
6745	Xã Bài Sơn	13
6747	Xã Đặng Sơn	13
6748	Xã Đà Sơn	13
6749	Thị trấn Đô Lương	13
7588	Xã Xuân Lộc	15
6750	Xã Đông Sơn	13
7594	Phường Gia Cẩm	15
6751	Xã Giang Sơn Đông	13
6752	Xã Giang Sơn Tây	13
6753	Xã Hồng Sơn	13
6755	Xã Hòa Sơn	13
6756	Xã Lạc Sơn	13
7595	Xã Hùng Lô	15
6757	Xã Lam Sơn	13
6759	Xã Mỹ Sơn	13
6760	Xã Minh Sơn	13
6761	Xã Nam Sơn	13
6765	Xã Tân Sơn	13
8403	Phường Hồng Hà	17
6766	Xã Thịnh Sơn	13
6767	Xã Thái Sơn	13
6768	Xã Thuận Sơn	13
6801	Xã Hưng Thịnh	13
6769	Xã Thượng Sơn	13
6770	Xã Tràng Sơn	13
6771	Xã Trù Sơn	13
8414	Phường Yết Kiêu	17
6772	Xã Trung Sơn	13
8416	Xã Đường Hoa	17
8417	Xã Phú Hải	17
6773	Xã Văn Sơn	13
8421	Thị trấn Quảng Hà	17
6774	Xã Xuân Sơn	13
8423	Xã Quảng Minh	17
8424	Xã Quảng Phong	17
8425	Xã Quảng Sơn	17
6775	Xã Yên Sơn	13
6776	Phường Mai Hùng	13
6777	Phường Quỳnh Dị	13
6778	Xã Quỳnh Lập	13
6779	Xã Quỳnh Lộc	13
6785	Phường Quỳnh Xuân	13
6786	Xã Hưng Châu	13
6805	Xã Hưng Xá	13
6787	Xã Hưng Đạo	13
6789	Xã Hưng Lợi	13
6790	Xã Hưng Lam	13
6822	Thị trấn Mường Xén	13
6828	Xã Tà Cạ	13
6829	Xã Tây Sơn	13
6791	Xã Hưng Lĩnh	13
6792	Xã Hưng Long	13
6848	Xã Nam Thượng	13
6793	Xã Hưng Mỹ	13
6797	Xã Hưng Phúc	13
6798	Xã Hưng Tân	13
6858	Xã Nghi Hợp	13
6799	Xã Hưng Tây	13
6800	Xã Hưng Thắng	13
6802	Xã Hưng Thông	13
6803	Xã Hưng Tiến	13
6804	Xã Hưng Trung	13
6806	Xã Hưng Xuân	13
6807	Xã Hưng Yên	13
6808	Xã Hưng Yên Bắc	13
6809	Xã Bảo Nam	13
6810	Xã Bảo Thắng	13
6811	Xã Bắc Lý	13
6812	Xã Chiêu Lưu	13
6813	Xã Đoọc Mạy	13
6815	Xã Hữu Lập	13
6816	Xã Huồi Tụ	13
6817	Xã Keng Đu	13
6819	Xã Mường ải	13
6820	Xã Mường Lống	13
6821	Xã Mường Típ	13
6830	Xã Hồng Long	13
6831	Xã Hùng Tiến	13
6832	Xã Khánh Sơn	13
6833	Xã Kim Liên	13
6834	Xã Nam Anh	13
6835	Xã Nam Cát	13
6836	Xã Nam Cường	13
6838	Xã Nam Giang	13
6839	Xã Nam Hưng	13
6840	Xã Nam Kim	13
6841	Xã Nam Lộc	13
6842	Xã Nam Lĩnh	13
6843	Xã Nam Nghĩa	13
6880	Xã Nghi Xuân	13
6881	Xã Nghi Yên	13
6844	Xã Nam Phúc	13
6893	Xã Nghĩa Lạc	13
6845	Xã Nam Tân	13
6846	Xã Nam Thái	13
6847	Xã Nam Thanh	13
6849	Xã Nam Trung	13
6850	Xã Nam Xuân	13
6851	Xã Vân Diên	13
6852	Xã Xuân Hòa	13
6853	Xã Xuân Lâm	13
6854	Xã Nghi Công Bắc	13
6855	Xã Nghi Công Nam	13
6856	Xã Nghi Đồng	13
6857	Xã Nghi Diên	13
6914	Thị trấn Kim Sơn	13
6918	Xã Quế Sơn	13
6919	Xã Quang Phong	13
6920	Xã Thông Thụ	13
6859	Xã Nghi Hoa	13
6860	Xã Nghi Hưng	13
6921	Xã Tiền Phong	13
6922	Xã Tri Lễ	13
6923	Xã Châu Bính	13
6924	Xã Châu Bình	13
6925	Xã Châu Hạnh	13
6926	Xã Châu Hội	13
6927	Xã Châu Hoàn	13
6861	Xã Nghi Khánh	13
6862	Xã Nghi Kiều	13
6863	Xã Nghi Lâm	13
6864	Xã Nghi Long	13
6866	Xã Nghi Phong	13
6867	Xã Nghi Phương	13
6868	Xã Nghi Quang	13
6869	Xã Nghi Thạch	13
6934	Thị trấn Tân Lạc	13
6870	Xã Nghi Thịnh	13
6871	Xã Nghi Thái	13
6957	Thị trấn Cầu Giát	13
6958	Xã Ngọc Sơn	13
6872	Xã Nghi Thiết	13
6873	Xã Nghi Thuận	13
6874	Xã Nghi Tiến	13
6875	Xã Nghi Trường	13
6970	Xã Quỳnh Long	13
6876	Xã Nghi Trung	13
6877	Xã Nghi Vạn	13
6878	Xã Nghi Văn	13
6971	Xã Quỳnh Lương	13
6879	Xã Nghi Xá	13
6882	Xã Phúc Thọ	13
6883	Thị trấn Quán Hành	13
6884	Xã Nghĩa An	13
6885	Xã Nghĩa Bình	13
6886	Xã Nghĩa Đức	13
6887	Thị trấn Nghĩa Đàn	13
6888	Xã Nghĩa Hồng	13
6889	Xã Nghĩa Hội	13
6890	Xã Nghĩa Hiếu	13
6891	Xã Nghĩa Hưng	13
6892	Xã Nghĩa Khánh	13
6897	Xã Nghĩa Liên	13
6898	Xã Nghĩa Long	13
6899	Xã Nghĩa Mai	13
6900	Xã Nghĩa Minh	13
6901	Xã Nghĩa Phú	13
6903	Xã Nghĩa Tân	13
6904	Xã Nghĩa Thắng	13
6905	Xã Nghĩa Thịnh	13
6907	Xã Nghĩa Trung	13
6908	Xã Nghĩa Yên	13
6911	Xã Châu Thôn	13
6912	Xã Đồng Văn	13
6932	Xã Châu Tiến	13
6933	Xã Diên Lãm	13
6938	Xã Châu Hồng	13
6973	Xã Quỳnh Minh	13
6944	Xã Châu Tiến	13
6947	Xã Liên Hợp	13
6950	Xã Nghĩa Xuân	13
6951	Thị trấn Quỳ Hợp	13
6953	Xã Thọ Hợp	13
6956	Xã An Hòa	13
6959	Xã Quỳnh Bảng	13
6988	Xã Tiến Thủy	13
6991	Xã Hương Sơn	13
6960	Xã Quỳnh Bá	13
6961	Xã Quỳnh Châu	13
6962	Xã Quỳnh Diện	13
6963	Xã Quỳnh Đôi	13
7029	Thị trấn Thanh Chương	13
6964	Xã Quỳnh Giang	13
6965	Xã Quỳnh Hậu	13
7268	Xã Khánh Trung	14
6966	Xã Quỳnh Hồng	13
6967	Xã Quỳnh Hoa	13
6968	Xã Quỳnh Hưng	13
6969	Xã Quỳnh Lâm	13
6972	Xã Quỳnh Mỹ	13
6974	Xã Quỳnh Ngọc	13
7160	Xã Gia Vượng	14
6975	Xã Quỳnh Nghĩa	13
7168	Xã Ninh Khang	14
6978	Xã Quỳnh Thạch	13
6980	Xã Quỳnh Thọ	13
6981	Xã Quỳnh Thanh	13
6982	Xã Quỳnh Thuận	13
7030	Xã Thanh Đồng	13
6983	Xã Quỳnh Văn	13
7031	Xã Thanh Đức	13
7032	Xã Thanh Dương	13
6984	Xã Quỳnh Yên	13
6985	Xã Sơn Hải	13
6992	Xã Kỳ Sơn	13
6995	Xã Nghĩa Đồng	13
6996	Xã Nghĩa Dũng	13
6997	Xã Nghĩa Hợp	13
6998	Xã Nghĩa Hành	13
7006	Thị trấn Tân Kỳ	13
7007	Xã Tân Long	13
7008	Xã Tân Phú	13
7009	Xã Tân Xuân	13
7010	Xã Tiên Kỳ	13
7012	Phường Hoà Hiếu	13
7042	Xã Thanh Lĩnh	13
7013	Phường Long Sơn	13
7062	Thị trấn Hòa Bình	13
7014	Xã Nghĩa Hòa	13
7018	Phường Quang Phong	13
7065	Xã Mai Sơn	13
7066	Xã Nga My	13
7067	Xã Nhôn Mai	13
7070	Xã Tam Quang	13
7073	Xã Xá Lượng	13
7074	Xã Xiêng My	13
7079	Phường Bến Thủy	13
7019	Phường Quang Tiến	13
7173	Thị trấn Thiên Tôn	14
7021	Xã Cát Văn	13
7180	Xã Định Hóa	14
7022	Xã Đồng Văn	13
7182	Xã Hồi Ninh	14
7183	Xã Hùng Tiến	14
7026	Xã Phong Thịnh	13
7027	Xã Thanh An	13
7028	Xã Thanh Chi	13
7033	Xã Thanh Giang	13
7034	Xã Thanh Hà	13
7080	Phường Cửa Nam	13
7035	Xã Thanh Hòa	13
7085	Phường Hưng Bình	13
7036	Xã Thanh Hưng	13
7037	Xã Thanh Hương	13
7103	Phường Vinh Tân	13
7038	Xã Thanh Khai	13
7039	Xã Thanh Khê	13
7041	Xã Thanh Liên	13
7043	Xã Thanh Long	13
7142	Thị trấn Yên Thành	13
7048	Xã Thanh Nho	13
7049	Xã Thanh Phong	13
7051	Xã Thanh Thịnh	13
7052	Xã Thanh Thủy	13
7053	Xã Thanh Tiên	13
7054	Xã Thanh Tường	13
7056	Xã Thanh Văn	13
7058	Xã Thanh Yên	13
7184	Xã Kim Chính	14
7060	Xã Xuân Tường	13
7185	Xã Kim Định	14
7082	Phường Đông Vĩnh	13
7083	Phường Hồng Sơn	13
7084	Phường Hà Huy Tập	13
7086	Xã Hưng Chính	13
7087	Xã Hưng Đông	13
7145	Xã Gia Lạc	14
7090	Xã Hưng Lộc	13
7093	Phường Lê Mao	13
7094	Xã Nghi Ân	13
7095	Xã Nghi Đức	13
7186	Xã Kim Đông	14
7096	Xã Nghi Kim	13
7188	Xã Kim Mỹ	14
7189	Xã Kim Tân	14
7097	Xã Nghi Liên	13
7190	Xã Kim Trung	14
7098	Xã Nghi Phú	13
7101	Phường Trường Thi	13
7195	Xã Quang Thiện	14
7104	Xã Bảo Thành	13
7105	Xã Bắc Thành	13
7106	Xã Công Thành	13
7107	Xã Đại Thành	13
7197	Xã Thượng Kiệm	14
7109	Xã Đức Thành	13
7198	Xã Văn Hải	14
7199	Xã Xuân Thiện	14
7202	Xã Cúc Phương	14
7110	Xã Đô Thành	13
7111	Xã Hậu Thành	13
7112	Xã Hồng Thành	13
7113	Xã Hợp Thành	13
8426	Xã Quảng Thắng	17
7114	Xã Hoa Thành	13
7150	Xã Gia Phương	14
7151	Xã Gia Sinh	14
7115	Xã Hùng Thành	13
7116	Xã Khánh Thành	13
7119	Xã Liên Thành	13
7120	Xã Long Thành	13
7121	Xã Lý Thành	13
7153	Xã Gia Thắng	14
7123	Xã Mã Thành	13
7124	Xã Minh Thành	13
7125	Xã Nam Thành	13
7126	Xã Nhân Thành	13
7127	Xã Phú Thành	13
7130	Xã Sơn Thành	13
7131	Xã Tân Thành	13
7132	Xã Tăng Thành	13
7133	Xã Tây Thành	13
7134	Xã Thịnh Thành	13
7135	Xã Thọ Thành	13
7156	Xã Gia Tiến	14
7138	Xã Văn Thành	13
7139	Xã Viên Thành	13
7140	Xã Vĩnh Thành	13
7141	Xã Xuân Thành	13
7144	Xã Gia Hưng	14
7146	Xã Gia Lập	14
8430	Xã Tiến Tới	17
8436	Xã Kỳ Thượng	17
7147	Xã Gia Minh	14
8453	Phường Ka Long	17
8454	Phường Ninh Dương	17
8455	Xã Quảng Nghĩa	17
7148	Xã Gia Phong	14
7157	Xã Gia Trấn	14
7149	Xã Gia Phú	14
8456	Phường Trần Phú	17
7152	Xã Gia Tân	14
7154	Xã Gia Thịnh	14
7155	Xã Gia Thanh	14
7159	Xã Gia Vân	14
7161	Xã Gia Xuân	14
7162	Xã Liên Sơn	14
7163	Thị trấn Me	14
7269	Xã Khánh Vân	14
7164	Xã Ninh An	14
7165	Xã Ninh Giang	14
7166	Xã Ninh Hải	14
7167	Xã Ninh Hòa	14
7272	Xã Khánh Thịnh	14
7169	Xã Ninh Mỹ	14
7170	Xã Ninh Thắng	14
7598	Phường Minh Nông	15
7171	Xã Ninh Vân	14
7172	Xã Ninh Xuân	14
7174	Xã Trường Yên	14
7176	Thị trấn Bình Minh	14
7177	Xã Cồn Thoi	14
7178	Xã Chất Bình	14
7191	Xã Lai Thành	14
7194	Thị trấn Phát Diệm	14
7203	Xã Đồng Phong	14
7216	Xã Quảng Lạc	14
7204	Xã Đức Long	14
7218	Xã Sơn Hà	14
7219	Xã Sơn Lai	14
7206	Xã Gia Sơn	14
7233	Phường Ninh Khánh	14
7207	Xã Gia Thủy	14
7241	Phường Thanh Bình	14
7242	Phường Vân Giang	14
7244	Xã Đông Sơn	14
7210	Xã Lạc Vân	14
7250	Phường Yên Bình	14
7211	Xã Lạng Phong	14
7212	Thị trấn Nho Quan	14
7213	Xã Phú Lộc	14
7253	Xã Khánh Công	14
7214	Xã Phú Long	14
7215	Xã Phú Sơn	14
7217	Xã Quỳnh Lưu	14
7220	Xã Sơn Thành	14
7221	Xã Thạch Bình	14
7254	Xã Khánh Cư	14
7222	Xã Thanh Lạc	14
7223	Xã Thượng Hòa	14
7224	Xã Văn Phong	14
7225	Xã Văn Phú	14
7226	Xã Văn Phương	14
7227	Xã Xích Thổ	14
7228	Xã Yên Quang	14
7234	Xã Ninh Nhất	14
7255	Xã Khánh Cường	14
7235	Phường Ninh Phong	14
7323	Phường Bảo An	8
7236	Xã Ninh Phúc	14
7237	Phường Ninh Sơn	14
7238	Xã Ninh Tiến	14
7240	Phường Tân Thành	14
7245	Phường Nam Sơn	14
7246	Xã Quang Sơn	14
7247	Phường Tân Bình	14
7249	Phường Trung Sơn	14
7251	Xã Yên Sơn	14
7252	Xã Khánh An	14
7256	Xã Khánh Hải	14
7257	Xã Khánh Hồng	14
7258	Xã Khánh Hội	14
7259	Xã Khánh Hòa	14
7261	Xã Khánh Mậu	14
7260	Xã Khánh Lợi	14
7262	Xã Khánh Nhạc	14
7263	Xã Khánh Phú	14
7267	Xã Khánh Tiên	14
7264	Xã Khánh Thủy	14
7265	Xã Khánh Thành	14
7266	Xã Khánh Thiện	14
7324	Phường Đạo Long	8
7270	Thị trấn Yên Ninh	14
7271	Xã Khánh Dương	14
7273	Xã Khánh Thượng	14
7274	Xã Mai Sơn	14
7275	Xã Yên Đồng	14
7276	Xã Yên Hòa	14
7277	Xã Yên Hưng	14
7278	Xã Yên Lâm	14
7325	Phường Đài Sơn	8
7279	Xã Yên Mạc	14
7280	Xã Yên Mỹ	14
7281	Xã Yên Nhân	14
7282	Xã Yên Phong	14
7283	Xã Yên Từ	14
7284	Xã Yên Thắng	14
7285	Thị trấn Yên Thịnh	14
7327	Phường Đông Hải	8
7286	Xã Yên Thái	14
7330	Phường Mỹ Đông	8
7287	Xã Yên Thành	14
7288	Xã Phước Bình	8
7289	Xã Phước Chính	8
7291	Xã Phước Hòa	8
7292	Xã Phước Tân	8
7293	Xã Phước Thắng	8
7296	Xã Phước Trung	8
7297	Xã Hộ Hải	8
7298	Thị trấn Khánh Hải	8
7299	Xã Nhơn Hải	8
7301	Xã Tân Hải	8
7331	Phường Mỹ Hải	8
7302	Xã Thanh Hải	8
7333	Phường Phủ Hà	8
7303	Xã Tri Hải	8
7305	Xã Xuân Hải	8
7308	Xã Phước Hải	8
7309	Xã Phước Hậu	8
7313	Xã Phước Thuận	8
7315	Xã Hòa Sơn	8
7316	Xã Lâm Sơn	8
7317	Xã Lương Sơn	8
7318	Xã Mỹ Sơn	8
7319	Xã Ma Nới	8
7320	Xã Nhơn Sơn	8
7322	Thị trấn Tân Sơn	8
7326	Phường Đô Vinh	8
7334	Phường Phước Mỹ	8
7336	Xã Thành Hải	8
7338	Phường Văn Hải	8
7604	Phường Tân Dân	15
7339	Xã Bắc Phong	8
7340	Xã Bắc Sơn	8
7341	Xã Công Hải	8
7342	Xã Lợi Hải	8
7344	Xã Phước Kháng	8
7345	Xã Cà Ná	8
7348	Xã Phước Dinh	8
7350	Xã Phước Minh	8
7351	Xã Phước Nam	8
7352	Xã Phước Ninh	8
7355	Xã Chương Xá	15
7358	Xã Điêu Lương	15
7360	Xã Hương Lung	15
7361	Xã Ngô Xá	15
7605	Phường Thọ Sơn	15
7362	Xã Phú Khê	15
7363	Xã Phú Lạc	15
7641	Xã Hòa Hiệp Bắc	32
7364	Xã Phượng Vĩ	15
7366	Xã Phương Xá	15
7367	Xã Sai Nga	15
7369	Xã Sơn Tình	15
7370	Thị trấn Sông Thao	15
7371	Xã Tạ Xá	15
7372	Xã Tam Sơn	15
7374	Xã Thanh Nga	15
7375	Xã Tiên Lương	15
7376	Xã Tình Cương	15
7378	Xã Tuy Lộc	15
7379	Xã Văn Bán	15
7415	Xã Chính Công	15
7380	Xã Văn Khúc	15
7383	Xã Yên Tập	15
7384	Xã Bằng Doãn	15
7386	Xã Ca Đình	15
7387	Xã Chân Mộng	15
7388	Xã Chí Đám	15
7389	Xã Đại Nghĩa	15
7391	Xã Đông Khê	15
7392	Xã Hữu Đô	15
7393	Xã Hùng Long	15
7394	Xã Hùng Quan	15
7395	Xã Minh Lương	15
7396	Xã Minh Phú	15
7397	Xã Minh Tiến	15
7398	Xã Ngọc Quan	15
7399	Xã Nghinh Xuyên	15
7400	Xã Phong Phú	15
7401	Xã Phú Thứ	15
7402	Xã Phúc Lai	15
7403	Xã Phương Trung	15
7404	Xã Quế Lâm	15
7405	Xã Sóc Đăng	15
7651	Xã Hòa An	32
7406	Xã Tây Cốc	15
7709	Xã Sơn Thành Tây	32
7710	Xã An Chấn	32
7407	Xã Tiêu Sơn	15
7408	Xã Vụ Quang	15
7410	Xã Vân Du	15
7411	Xã Yên Kiện	15
7412	Xã ấm Hạ	15
7413	Xã Bằng Giã	15
7414	Xã Cáo Điền	15
7416	Xã Chuế Lưu	15
7419	Xã Đan Hà	15
7420	Xã Đan Thượng	15
7439	Xã Vĩnh Chân	15
7421	Xã Gia Điền	15
7422	Thị trấn Hạ Hoà	15
7423	Xã Hậu Bổng	15
7424	Xã Hà Lương	15
7425	Xã Hiền Lương	15
7426	Xã Hương Xạ	15
7427	Xã Lệnh Khanh	15
7428	Xã Lâm Lợi	15
7444	Xã Yên Luật	15
7429	Xã Lang Sơn	15
7430	Xã Liên Phương	15
7432	Xã Minh Côi	15
7434	Xã Phụ Khánh	15
7435	Xã Phương Viên	15
7436	Xã Quân Khê	15
7438	Xã Văn Lang	15
7442	Xã Y Sơn	15
7454	Xã Thạch Sơn	15
7446	Xã Cao Xá	15
7455	Xã Tiên Kiên	15
7447	Xã Hợp Hải	15
7461	Xã Bình Bộ	15
7448	Thị trấn Hùng Sơn	15
7449	Xã Kinh Kệ	15
7450	Thị trấn Lâm Thao	15
7451	Xã Sơn Dương	15
7452	Xã Sơn Vi	15
7453	Xã Tứ Xã	15
7456	Xã Vĩnh Lại	15
7471	Xã Tử Đà	15
7457	Xã Xuân Huy	15
7458	Xã Xuân Lũng	15
7459	Xã An Đạo	15
7460	Xã Bảo Thanh	15
7462	Xã Gia Thanh	15
7463	Xã Hạ Giáp	15
7464	Xã Lệ Mỹ	15
7465	Xã Liên Hoa	15
7466	Thị trấn Phong Châu	15
7467	Xã Phú Lộc	15
7468	Xã Phú Mỹ	15
7469	Xã Phú Nham	15
7470	Xã Phù Ninh	15
7472	Xã Tiên Du	15
7473	Xã Tiên Phú	15
7474	Xã Trạm Thản	15
7478	Phường Âu Cơ	15
7480	Xã Hà Thạch	15
7481	Phường Hùng Vương	15
7483	Xã Phú Hộ	15
7484	Xã Thanh Minh	15
7505	Xã Vực Trường	15
7485	Phường Thanh Vinh	15
7487	Xã Văn Lung	15
7489	Xã Dậu Dương	15
7490	Xã Dị Nậu	15
7492	Xã Hiền Quan	15
7528	Xã Đỗ Sơn	15
7493	Xã Hùng Đô	15
7496	Xã Hương Nha	15
7494	Thị trấn Hưng Hoá	15
7501	Xã Tam Cường	15
7495	Xã Hương Nộn	15
7503	Xã Thanh Uyên	15
7497	Xã Phương Thịnh	15
7498	Xã Quang Húc	15
7502	Xã Thọ Văn	15
7504	Xã Thượng Nông	15
7529	Xã Đỗ Xuyên	15
7506	Xã Văn Lương	15
7533	Xã Hoàng Cương	15
7507	Xã Xuân Quang	15
7535	Xã Lương Lỗ	15
7509	Xã Kiệt Sơn	15
7511	Xã Lai Đồng	15
7513	Xã Mỹ Thuận	15
7514	Xã Minh Đài	15
7515	Xã Tam Thanh	15
7516	Xã Tân Phú	15
7517	Xã Tân Sơn	15
7521	Xã Văn Luông	15
7522	Xã Vinh Tiền	15
7523	Xã Xuân Đài	15
7525	Xã Chí Tiên	15
7526	Xã Đại An	15
7527	Xã Đồng Xuân	15
7530	Xã Đông Lĩnh	15
7531	Xã Đông Thành	15
7532	Xã Hanh Cù	15
7544	Xã Thanh Hà	15
7534	Xã Khải Xuân	15
7536	Xã Mạn Lạn	15
7549	Xã Vũ Yển	15
7537	Xã Năng Yên	15
7569	Xã Tinh Nhuệ	15
7571	Xã Võ Miếu	15
7538	Xã Ninh Dân	15
7539	Xã Phương Lĩnh	15
7540	Xã Quảng Nạp	15
7575	Xã Bảo Yên	15
7541	Xã Sơn Cương	15
7576	Xã Đồng Luận	15
7542	Xã Thái Ninh	15
7543	Thị trấn Thanh Ba	15
7545	Xã Thanh Vân	15
7546	Xã Thanh Xá	15
7547	Xã Vân Lĩnh	15
7548	Xã Võ Lao	15
7550	Xã Yển Khê	15
7556	Xã Giáp Lai	15
7802	Xã Ngư Thủy Bắc	18
7557	Xã Hương Cần	15
7559	Xã Lương Nha	15
7561	Xã Tất Thắng	15
7578	Xã Đoan Hạ	15
7563	Xã Tân Minh	15
7564	Xã Thạch Khoán	15
7804	Xã Ngư Thủy Trung	18
7805	Thị trấn NT Lệ Ninh	18
7567	Thị trấn Thanh Sơn	15
7572	Xã Yên Lãng	15
7573	Xã Yên Lương	15
7574	Xã Yên Sơn	15
7579	Xã Hoàng Xá	15
7585	Xã Trung Nghĩa	15
7580	Xã Phượng Mao	15
7586	Xã Trung Thịnh	15
7581	Xã Sơn Thủy	15
7582	Xã Tân Phương	15
7587	Xã Tu Vũ	15
7583	Xã Thạch Đồng	15
7584	Thị trấn Thanh Thủy	15
7589	Xã Yến Mao	15
7591	Phường Bến Gót	15
7592	Xã Chu Hóa	15
7593	Phường Dữu Lâu	15
7596	Xã Hy Cương	15
7825	Xã Quy Hóa	18
7828	Xã Trọng Hóa	18
7597	Xã Kim Đức	15
7831	Xã Yên Hóa	18
7599	Phường Minh Phương	15
7600	Phường Nông Trang	15
7601	Xã Phượng Lâu	15
7602	Xã Sông Lô	15
7603	Xã Tân Đức	15
7606	Xã Thụy Vân	15
7835	Xã Hải Ninh	18
7607	Xã Thanh Đình	15
7608	Phường Thanh Miếu	15
7609	Phường Tiên Cát	15
7610	Xã Trưng Vương	15
7611	Phường Vân Cơ	15
7612	Phường Vân Phú	15
7732	Phường Phú Thạnh	32
7613	Xã Đồng Lạc	15
7614	Xã Đồng Thịnh	15
7734	Phường 2	32
7615	Xã Hưng Long	15
7737	Phường 5	32
7616	Xã Lương Sơn	15
7617	Xã Mỹ Lung	15
7618	Xã Mỹ Lương	15
7619	Xã Minh Hòa	15
7620	Xã Ngọc Đồng	15
7738	Phường 6	32
7621	Xã Ngọc Lập	15
7622	Xã Nga Hoàng	15
7739	Phường 7	32
7623	Xã Phúc Khánh	15
7626	Xã Xuân An	15
7627	Xã Xuân Thủy	15
7740	Phường 8	32
7741	Phường 9	32
7628	Xã Xuân Viên	15
7745	Xã Đồng Trạch	18
7629	Thị trấn Yên Lập	15
7630	Xã Đa Lộc	32
7746	Xã Đức Trạch	18
7631	Thị trấn La Hai	32
7638	Xã Xuân Quang 3	32
7639	Xã Xuân Sơn Bắc	32
7640	Xã Xuân Sơn Nam	32
7642	Xã Hòa Hiệp Nam	32
7643	Thị trấn Hoà Hiệp Trung	32
7756	Xã Mỹ Trạch	18
7646	Xã Hòa Thành	32
7647	Thị trấn Hoà Vinh	32
7758	Xã Nhân Trạch	18
7759	Thị trấn NT Việt Trung	18
7648	Xã Hòa Xuân Đông	32
7649	Xã Hòa Xuân Nam	32
7650	Xã Hòa Xuân Tây	32
7652	Xã Hòa Định Đông	32
7657	Xã Hòa Thắng	32
7658	Xã Hòa Trị	32
7659	Thị trấn Phú Hoà	32
7769	Xã Trung Trạch	18
7660	Thị trấn Củng Sơn	32
7661	Xã Cà Lúi	32
7667	Xã Sơn Hà	32
7668	Xã Sơn Long	32
7670	Xã Sơn Phước	32
7671	Xã Sơn Xuân	32
7673	Xã Suối Trai	32
7674	Xã Xuân Bình	32
7677	Xã Xuân Hải	32
7678	Xã Xuân Hòa	32
7681	Phường Xuân Phú	32
7772	Phường Ba Đồn	18
7684	Xã Xuân Thọ 1	32
7685	Xã Xuân Thọ 2	32
7686	Phường Xuân Thành	32
7687	Phường Xuân Yên	32
7689	Xã Đức Bình Tây	32
7775	Xã Quảng Lộc	18
7691	Xã Ea Lâm	32
7693	Xã EaBia	32
7696	Thị trấn Hai Riêng	32
7697	Xã Sơn Giang	32
7698	Xã Sông Hinh	32
7699	Xã Hòa Bình 1	32
7700	Xã Hòa Đồng	32
7701	Xã Hòa Mỹ Đông	32
7702	Xã Hòa Mỹ Tây	32
7703	Xã Hòa Phong	32
7704	Xã Hòa Phú	32
7705	Xã Hòa Tân Tây	32
7706	Xã Hòa Thịnh	32
7707	Thị trấn Phú Thứ	32
7708	Xã Sơn Thành Đông	32
7711	Xã An Cư	32
7712	Xã An Định	32
7713	Xã An Dân	32
7714	Xã An Hải	32
7715	Xã An Hiệp	32
7716	Xã An Hòa	32
7840	Xã Tân Ninh	18
7717	Xã An Lĩnh	32
7841	Xã Trường Sơn	18
7842	Xã Trường Xuân	18
7718	Xã An Mỹ	32
7719	Xã An Nghiệp	32
7720	Xã An Ninh Đông	32
7849	Xã Phù Hóa	18
7850	Xã Quảng Châu	18
7851	Xã Quảng Đông	18
7852	Xã Quảng Hợp	18
7721	Xã An Ninh Tây	32
7776	Phường Quảng Long	18
7722	Xã An Thạch	32
7724	Xã An Xuân	32
7860	Xã Quảng Thanh	18
7725	Thị trấn Chí Thạnh	32
7726	Xã An Phú	32
7727	Xã Bình Kiến	32
7937	Phường Điện Nam Bắc	25
7728	Xã Bình Ngọc	32
7730	Phường Phú Đông	32
7731	Phường Phú Lâm	32
7781	Xã Quảng Tân	18
7742	Xã Bắc Trạch	18
7782	Phường Quảng Thọ	18
7744	Xã Đại Trạch	18
7747	Xã Hạ Trạch	18
7748	Xã Hải Trạch	18
7750	Thị trấn Hoàn Lão	18
7783	Xã Quảng Thủy	18
7751	Xã Hoàn Trạch	18
7753	Xã Lâm Trạch	18
7754	Xã Liên Trạch	18
7757	Xã Nam Trạch	18
7761	Xã Phú Trạch	18
7763	Xã Sơn Lộc	18
7766	Xã Tây Trạch	18
7767	Xã Thanh Trạch	18
7786	Xã Quảng Trung	18
7774	Xã Quảng Hòa	18
7784	Phường Quảng Thuận	18
7785	Xã Quảng Tiên	18
7788	Xã An Thủy	18
7789	Xã Cam Thủy	18
7790	Xã Dương Thủy	18
7792	Xã Hoa Thủy	18
7793	Xã Hưng Thủy	18
7794	Thị trấn Kiến Giang	18
7795	Xã Kim Thủy	18
7862	Xã Quảng Trường	18
7796	Xã Lộc Thủy	18
7797	Xã Lâm Thủy	18
7798	Xã Liên Thủy	18
7864	Xã Quảng Xuân	18
7799	Xã Mỹ Thủy	18
7865	Xã Bảo Ninh	18
7800	Xã Mai Thủy	18
7801	Xã Ngân Thủy	18
7806	Xã Phong Thủy	18
7807	Xã Phú Thủy	18
7808	Xã Sen Thủy	18
7809	Xã Sơn Thủy	18
7810	Xã Tân Thủy	18
7811	Xã Thái Thủy	18
7813	Xã Trường Thủy	18
7814	Xã Văn Thủy	18
7951	Phường Vĩnh Điện	25
7815	Xã Xuân Thủy	18
7816	Xã Dân Hóa	18
7818	Xã Hóa Hợp	18
7819	Xã Hóa Phúc	18
7838	Xã Lương Ninh	18
7824	Thị trấn Quy Đạt	18
7832	Xã An Ninh	18
7839	Thị trấn Quán Hàu	18
7833	Xã Duy Ninh	18
7834	Xã Gia Ninh	18
7836	Xã Hàm Ninh	18
7837	Xã Hiền Ninh	18
7843	Xã Vạn Ninh	18
7844	Xã Vĩnh Ninh	18
7845	Xã Võ Ninh	18
8355	Phường Cẩm Trung	17
7846	Xã Xuân Ninh	18
7847	Xã Cảnh Dương	18
8378	Phường Đông Triều	17
7848	Xã Cảnh Hóa	18
7853	Xã Quảng Hưng	18
7854	Xã Quảng Kim	18
7855	Xã Quảng Liên	18
7858	Xã Quảng Phương	18
7863	Xã Quảng Tùng	18
7866	Phường Bắc Lý	18
7868	Phường Đồng Mỹ	18
7869	Phường Đồng Phú	18
7870	Phường Đồng Sơn	18
7872	Phường Đức Ninh Đông	18
7871	Xã Đức Ninh	18
7903	Xã Trà Đông	25
8096	Phường Tân Thạnh	25
7875	Xã Lộc Ninh	18
7876	Phường Nam Lý	18
7879	Xã Quang Phú	18
7880	Xã Thuận Đức	18
7881	Xã Cao Quảng	18
7882	Xã Châu Hóa	18
7884	Thị trấn Đồng Lê	18
7915	Xã Đại An	25
7889	Xã Lê Hóa	18
7894	Xã Sơn Hóa	18
7895	Xã Thạch Hóa	18
7896	Xã Thanh Hóa	18
7897	Xã Thanh Thạch	18
7898	Xã Thuận Hóa	18
7899	Xã Tiến Hóa	18
7900	Xã Văn Hóa	18
7901	Xã Trà Bui	25
7902	Xã Trà Đốc	25
7904	Xã Trà Dương	25
7905	Xã Trà Giác	25
7906	Xã Trà Giang	25
7910	Thị trấn Trà My	25
7914	Thị trấn ái Nghĩa	25
7917	Xã Đại Cường	25
7920	Xã Đại Hiệp	25
7924	Xã Đại Minh	25
7925	Xã Đại Nghĩa	25
7926	Xã Đại Phong	25
7930	Xã Đại Thạnh	25
7931	Xã Đại Thắng	25
7933	Phường Điện Dương	25
7964	Xã Duy Hải	25
7936	Xã Điện Minh	25
7965	Xã Duy Hòa	25
7938	Phường Điện Nam Đông	25
7939	Phường Điện Nam Trung	25
7940	Phường Điện Ngọc	25
7941	Xã Điện Phong	25
7942	Xã Điện Phước	25
7943	Xã Điện Phương	25
7944	Xã Điện Quang	25
7945	Xã Điện Thắng Bắc	25
7979	Xã Cẩm Hà	25
7946	Xã Điện Thắng Nam	25
7947	Xã Điện Thắng Trung	25
7980	Xã Cẩm Kim	25
7949	Xã Điện Tiến	25
7950	Xã Điện Trung	25
7952	Xã A Rooi	25
7954	Xã Ba	25
7955	Xã Jơ Ngây	25
7956	Xã Ka Dăng	25
7957	Xã Mà Cooi	25
7958	Thị trấn P Rao	25
7960	Xã Tà Lu	25
7961	Xã Tư	25
7962	Xã Za Hung	25
7963	Xã Duy Châu	25
7966	Xã Duy Nghĩa	25
7967	Xã Duy Phú	25
7968	Xã Duy Phước	25
7969	Xã Duy Sơn	25
7970	Xã Duy Tân	25
7971	Xã Duy Thành	25
7972	Xã Duy Thu	25
7973	Xã Duy Trinh	25
7974	Xã Duy Trung	25
7975	Xã Duy Vinh	25
7976	Thị trấn Nam Phước	25
7978	Phường Cẩm Châu	25
7981	Phường Cẩm Nam	25
7983	Xã Cẩm Thanh	25
7984	Phường Cửa Đại	25
7990	Xã Bình Lâm	25
7991	Xã Bình Sơn	25
7992	Xã Hiệp Hòa	25
7993	Xã Hiệp Thuận	25
8000	Thị trấn Tân An	25
8003	Xã Chà Vàl	25
8004	Xã Chơ Chun	25
8009	Xã Laêê	25
8010	Xã Tà Bhinh	25
8012	Thị trấn Thạnh Mỹ	25
8018	Xã Trà Linh	25
8019	Xã Trà Mai	25
8021	Xã Trà Tập	25
8022	Xã Trà Vân	25
8023	Xã Trà Vinh	25
8024	Xã Phước Ninh	25
8025	Xã Quế Lộc	25
8097	Phường Trường Xuân	25
8107	Xã Tr'Hy	25
8027	Xã Quế Ninh	25
8108	Xã Bình An	25
8109	Xã Bình Chánh	25
8028	Xã Quế Phước	25
8115	Xã Bình Hải	25
8030	Xã Sơn Viên	25
8031	Thị trấn Núi Thành	25
8034	Xã Tam Giang	25
8032	Xã Tam Anh Bắc	25
8033	Xã Tam Anh Nam	25
8035	Xã Tam Hải	25
8036	Xã Tam Hiệp	25
8037	Xã Tam Hòa	25
8038	Xã Tam Mỹ Đông	25
8040	Xã Tam Nghĩa	25
8044	Xã Tam Tiến	25
8046	Xã Tam Xuân I	25
8041	Xã Tam Quang	25
8048	Thị trấn Phú Thịnh	25
8049	Xã Tam An	25
8076	Xã Quế Cường	25
8056	Xã Tam Thái	25
8057	Xã Tam Thành	25
8058	Xã Tam Vinh	25
8059	Thị trấn Khâm Đức	25
8060	Xã Phước Chánh	25
8061	Xã Phước Công	25
8062	Xã Phước Đức	25
8063	Xã Phước Hiệp	25
8064	Xã Phước Hoà	25
8066	Xã Phước Lộc	25
8067	Xã Phước Mỹ	25
8068	Xã Phước Năng	25
8071	Thị trấn Đông Phú	25
8085	Phường An Mỹ	25
8072	Xã Hương An	25
8092	Xã Tam Ngọc	25
8073	Xã Phú Thọ	25
8074	Xã Quế An	25
8075	Xã Quế Châu	25
8079	Xã Quế Minh	25
8080	Xã Quế Phong	25
8095	Xã Tam Thanh	25
8081	Xã Quế Phú	25
8082	Xã Quế Thuận	25
8083	Xã Quế Xuân 1	25
8084	Xã Quế Xuân 2	25
8086	Phường An Phú	25
8088	Phường An Xuân	25
8089	Phường Hòa Hương	25
8090	Phường Hoà Thuận	25
8091	Phường Phước Hòa	25
8093	Xã Tam Phú	25
8094	Xã Tam Thăng	25
8110	Xã Bình Định Bắc	25
8111	Xã Bình Định Nam	25
8112	Xã Bình Đào	25
8182	Xã Bình Thạnh	16
8113	Xã Bình Dương	25
8114	Xã Bình Giang	25
8118	Xã Bình Nam	25
8119	Xã Bình Nguyên	25
8189	Thị trấn Châu ổ	16
8120	Xã Bình Phục	25
8121	Xã Bình Phú	25
8124	Xã Bình Sa	25
8125	Xã Bình Trị	25
8126	Xã Bình Triều	25
8129	Thị trấn Hà Lam	25
8132	Xã Tiên Cẩm	25
8134	Xã Tiên Hà	25
8135	Xã Tiên Hiệp	25
8136	Thị trấn Tiên Kỳ	25
8137	Xã Tiên Lập	25
8138	Xã Tiên Lộc	25
8140	Xã Tiên Mỹ	25
8142	Xã Tiên Phong	25
8143	Xã Tiên Sơn	25
8144	Xã Tiên Thọ	25
8145	Xã Ba Bích	16
8146	Xã Ba Chùa	16
8147	Xã Ba Cung	16
8148	Xã Ba Động	16
8149	Xã Ba Điền	16
8151	Xã Ba Giang	16
8152	Xã Ba Khâm	16
8153	Xã Ba Lế	16
8154	Xã Ba Liên	16
8155	Xã Ba Nam	16
8156	Xã Ba Ngạc	16
8157	Xã Ba Thành	16
8158	Xã Ba Tiêu	16
8159	Thị trấn Ba Tơ	16
8160	Xã Ba Tô	16
8161	Xã Ba Trang	16
8162	Xã Ba Vì	16
8166	Xã Bình Chánh	16
8190	Thị trấn Đức Phổ	16
8168	Xã Bình Chương	16
8169	Xã Bình Đông	16
8170	Xã Bình Dương	16
8200	Xã Phổ Quang	16
8176	Xã Bình Mỹ	16
8179	Xã Bình Phú	16
8181	Xã Bình Tân	16
8183	Xã Bình Thới	16
8184	Xã Bình Thanh Đông	16
8397	Phường Cao Thắng	17
8185	Xã Bình Thanh Tây	16
8187	Xã Bình Trị	16
8188	Xã Bình Trung	16
8191	Xã Phổ An	16
8206	Xã An Hải	16
8194	Xã Phổ Hòa	16
8196	Xã Phổ Minh	16
8197	Xã Phổ Nhơn	16
8202	Xã Phổ Thuận	16
8203	Xã Phổ Văn	16
8204	Xã Phổ Vinh	16
8208	Xã Đức Chánh	16
8209	Xã Đức Hiệp	16
8210	Xã Đức Hòa	16
8213	Xã Đức Minh	16
8214	Xã Đức Nhuận	16
8215	Xã Đức Phong	16
8218	Xã Đức Thạnh	16
8219	Xã Đức Thắng	16
8220	Thị trấn Mộ Đức	16
8221	Xã Long Hiệp	16
8224	Xã Long Sơn	16
8225	Xã Thanh An	16
8226	Thị trấn Chợ Chùa	16
8228	Xã Hành Dũng	16
8229	Xã Hành Minh	16
8398	Phường Cao Xanh	17
8231	Xã Hành Phước	16
8232	Xã Hành Thịnh	16
8234	Xã Hành Thuận	16
8236	Xã Hành Tín Tây	16
8237	Xã Hành Trung	16
8242	Xã Nghĩa Dõng	16
8400	Phường Giếng Đáy	17
8243	Xã Nghĩa Dũng	16
8245	Phường Nghĩa Lộ	16
8248	Phường Quảng Phú	16
8249	Xã Tịnh ấn Đông	16
8401	Phường Hồng Gai	17
8250	Xã Tịnh ấn Tây	16
8251	Xã Tịnh An	16
8252	Xã Tịnh Châu	16
8255	Xã Tịnh Khê	16
8260	Phường Trương Quang Trọng	16
8265	Xã Sơn Giang	16
8266	Xã Sơn Hạ	16
8267	Xã Sơn Hải	16
8271	Xã Sơn Thủy	16
8272	Xã Sơn Thành	16
8273	Xã Sơn Thượng	16
8274	Xã Sơn Trung	16
8275	Xã Tịnh Bắc	16
8278	Xã Tịnh Giang	16
8281	Xã Tịnh Minh	16
8285	Xã Tịnh Trà	16
8286	Xã Sơn Bua	16
8287	Xã Sơn Dung	16
8297	Xã Trà Nham	16
8298	Xã Trà Phong	16
8299	Xã Trà Quân	16
8300	Xã Trà Thọ	16
8304	Xã Trà Bình	16
8305	Xã Trà Bùi	16
8309	Xã Trà Phú	16
8310	Xã Trà Sơn	16
8312	Xã Trà Thủy	16
8313	Thị trấn Trà Xuân	16
8314	Thị trấn La Hà	16
8315	Xã Nghĩa Điền	16
8316	Xã Nghĩa Hiệp	16
8317	Xã Nghĩa Hòa	16
8320	Xã Nghĩa Mỹ	16
8321	Xã Nghĩa Phương	16
8323	Xã Nghĩa Thắng	16
8324	Xã Nghĩa Thọ	16
8325	Xã Nghĩa Thuận	16
8328	Thị trấn Sông Vệ	16
8329	Thị trấn Ba Chẽ	17
8330	Xã Đạp Thanh	17
8331	Xã Đồn Đạc	17
8332	Xã Lương Mông	17
8334	Xã Nam Sơn	17
8346	Phường Cẩm Đông	17
8348	Phường Cẩm Phú	17
8350	Phường Cẩm Tây	17
8351	Phường Cẩm Thạch	17
8353	Phường Cẩm Thủy	17
8354	Phường Cẩm Thành	17
8357	Phường Cửa Ông	17
8359	Phường Mông Dương	17
8360	Phường Quang Hanh	17
8361	Thị trấn Cô Tô	17
8362	Xã Đồng Tiến	17
8365	Thị trấn Đầm Hà (Thị trấn )	17
8370	Xã Quảng Lâm	17
8371	Xã Quảng Tân	17
8372	Xã Tân Bình	17
8375	Xã Bình Dương	17
8379	Xã Hồng Phong	17
8382	Xã Hoàng Quế	17
8383	Phường Hưng Đạo	17
8384	Phường Kim Sơn	17
8385	Phường Mạo Khê	17
8386	Xã Nguyễn Huệ	17
8387	Xã Tân Việt	17
8388	Xã Thủy An	17
8389	Xã Tràng An	17
8390	Xã Tràng Lương	17
8391	Xã Việt Dân	17
8392	Phường Xuân Sơn	17
8393	Xã Yên Đức	17
8457	Phường Trà Cổ	17
8459	Xã Vĩnh Thực	17
8394	Xã Yên Thọ	17
8460	Xã Vĩnh Trung	17
8542	Phường Đông Thanh	18
8395	Phường Bạch Đằng	17
8402	Phường Hồng Hải	17
8396	Phường Bãi Cháy	17
8404	Phường Hà Khẩu	17
8405	Phường Hà Khánh	17
8406	Phường Hà Lầm	17
8408	Phường Hà Trung	17
8410	Phường Hùng Thắng	17
8411	Phường Trần Hưng Đạo	17
8412	Phường Tuần Châu	17
8418	Xã Quảng Chính	17
8419	Xã Quảng Đức	17
8420	Xã Quảng Điền	17
8427	Xã Quảng Thịnh	17
8437	Xã Lê Lợi	17
8438	Xã Quảng La	17
8439	Xã Sơn Dương	17
8442	Thị trấn Trới	17
8443	Xã Vũ Oai	17
8444	Xã Bắc Sơn	17
8445	Phường Bình Ngọc	17
8450	Xã Hải Xuân	17
8451	Phường Hải Yên	17
8452	Phường Hoà Lạc	17
8461	Xã Cẩm La	17
8462	Phường Cộng Hòa	17
8464	Phường Hà An	17
8465	Xã Hiệp Hòa	17
8467	Xã Liên Hòa	17
8482	Xã Đồng Rui	17
8483	Xã Điền Xá	17
8484	Xã Đông Hải	17
8485	Xã Đông Ngũ	17
8486	Xã Hải Lạng	17
8487	Xã Hà Lâu	17
8488	Xã Phong Dụ	17
8489	Xã Tiên Lãng	17
8468	Xã Liên Vị	17
8470	Phường Nam Hoà	17
8471	Phường Phong Cốc	17
8472	Phường Phong Hải	17
8473	Phường Quảng Yên	17
8474	Xã Sông Khoai	17
8475	Phường Tân An	17
8543	Phường 1	18
8477	Xã Tiền Phong	17
8493	Xã Điền Công	17
8478	Phường Yên Giang	17
8500	Phường Trưng Vương	17
8501	Phường Vàng Danh	17
8479	Phường Yên Hải	17
8502	Phường Yên Thanh	17
8480	Xã Đại Dực	17
8503	Xã Bản Sen	17
8481	Xã Đại Thành	17
8490	Thị trấn Tiên Yên	17
8515	Đảo Cồn Cỏ	18
8516	Xã Cam An	18
8517	Xã Cam Chính	18
8524	Xã Cam Tuyền	18
8525	Xã A Bung	22
8526	Xã A Ngo	18
8527	Xã A Vao	18
8492	Phường Bắc Sơn	17
8528	Xã Ba Lòng	18
8529	Xã Ba Nang	18
8530	Xã Đa Krông	18
8494	Phường Nam Khê	17
8544	Phường 2	18
8496	Phường Phương Nam	17
8552	Xã Gio Hải	18
8498	Phường Thanh Sơn	17
8499	Xã Thượng Yên Công	17
8507	Xã Đoàn Kết	17
8510	Xã Minh Châu	17
8511	Xã Ngọc Vừng	17
8534	Thị trấn Krông Klang	18
8535	Xã Mò ó	18
8536	Xã Tà Long	18
8537	Xã Tà Rụt	18
8538	Xã Triệu Nguyên	18
8539	Phường Đông Giang	18
8540	Phường Đông Lễ	18
8546	Phường 4	18
8565	Xã Trung Giang	18
8547	Phường 5	18
8548	Thị trấn Cửa Việt	18
8550	Xã Gio Bình	18
8551	Xã Gio Châu	18
8553	Xã Gio Hòa	18
8554	Thị trấn Gio Linh	18
8576	Thị trấn Hải Lăng	18
8555	Xã Gio Mỹ	18
8556	Xã Gio Mai	18
8557	Xã Gio Phong	18
8559	Xã Gio Sơn	18
8578	Xã Hải Quế	18
8560	Xã Gio Thành	18
8561	Xã Gio Việt	18
8562	Xã Hải Thái	18
8566	Xã Trung Hải	18
8567	Xã Trung Sơn	18
8568	Xã Vĩnh Trường	18
8570	Xã Hải Ba	18
8572	Xã Hải Dương	18
8573	Xã Hải Hòa	18
8579	Xã Hải Quy	18
8580	Xã Hải Sơn	18
8581	Xã Hải Tân	18
8582	Xã Hải Thọ	18
8583	Xã Hải Thành	18
8584	Xã Hải Thiện	18
8585	Xã Hải Thượng	18
8586	Xã Hải Trường	18
8587	Xã Hải Vĩnh	18
8588	Xã Hải Xuân	18
8589	Xã A Dơi	18
8590	Xã A Túc	18
8591	Xã A Xing	18
8592	Xã Ba Tầng	18
8616	Thị trấn ái Tử	18
8594	Xã Hướng Lộc	18
8597	Xã Hướng Sơn	18
8618	Xã Triệu An	18
8598	Xã Hướng Tân	18
8623	Xã Triệu Hòa	18
8625	Xã Triệu Long	18
8599	Xã Hướng Việt	18
8600	Xã Húc	18
8634	Xã Triệu Vân	18
8601	Thị trấn Khe Sanh	18
8602	Thị trấn Lao Bảo	18
8653	Xã Vĩnh Thái	18
8603	Xã Tân Hợp	18
8655	Xã Vĩnh Trung	18
8604	Xã Tân Lập	18
8605	Xã Tân Liên	18
8606	Xã Tân Long	18
8607	Xã Tân Thành	18
8609	Xã Thuận	18
8610	Xã Xy	18
8611	Phường An Đôn	18
8613	Phường 1	18
8614	Phường 2	18
8615	Phường 3	18
8620	Xã Triệu Độ	18
8621	Xã Triệu Đông	18
8622	Xã Triệu Giang	18
8626	Xã Triệu Phước	18
8627	Xã Triệu Sơn	18
8628	Xã Triệu Tài	18
8629	Xã Triệu Thành	18
8630	Xã Triệu Thuận	18
8631	Xã Triệu Thượng	18
8632	Xã Triệu Trạch	18
8633	Xã Triệu Trung	18
8635	Thị trấn Bến Quan	18
8636	Thị trấn Cửa Tùng	18
8637	Thị trấn Hồ Xá	18
8638	Xã Vĩnh Chấp	18
8639	Xã Vĩnh Giang	18
8640	Xã Vĩnh Hà	18
8665	Xã An Thạnh 1	20
8641	Xã Vĩnh Hiền	18
8672	Xã Đại Ân 1	20
8642	Xã Vĩnh Hòa	18
8643	Xã Vĩnh Khê	18
8644	Xã Vĩnh Kim	18
8727	Phường 2	20
8645	Xã Vĩnh Lâm	18
8646	Xã Vĩnh Long	18
8728	Phường 3	20
8729	Phường 4	20
8647	Xã Vĩnh Nam	18
8649	Xã Vĩnh Sơn	18
8650	Xã Vĩnh Tân	18
8651	Xã Vĩnh Thạch	18
8652	Xã Vĩnh Thủy	18
8654	Xã Vĩnh Thành	18
8656	Xã Vĩnh Tú	18
8659	Thị trấn Châu Thành	20
8660	Xã Hồ Đắc Kiện	20
8661	Xã Phú Tâm	20
8662	Xã Phú Tân	20
8731	Phường 6	20
8663	Xã Thiện Mỹ	20
8664	Xã Thuận Hòa	20
8666	Xã An Thạnh 2	20
8687	Thị trấn Đại Ngãi	20
8667	Xã An Thạnh 3	20
8714	Xã Thạnh Phú	20
8715	Xã Thạnh Quới	20
8716	Xã Tham Đôn	20
8669	Xã An Thạnh Nam	20
8670	Xã An Thạnh Tây	20
8671	Thị trấn Cù Lao Dung	20
8673	Xã An Lạc Tây	20
8674	Thị trấn An Lạc Thôn	20
8675	Xã An Mỹ	20
8676	Xã Ba Trinh	20
8677	Xã Đại Hải	20
8678	Xã Kế An	20
8679	Thị trấn Kế Sách	20
8680	Xã Kế Thành	20
8681	Xã Nhơn Mỹ	20
9154	Xã Điền Hương	22
8683	Xã Thới An Hội	20
8684	Xã Trinh Phú	20
8686	Xã Châu Khánh	20
8688	Xã Hậu Thạnh	20
8689	Xã Long Đức	20
8690	Thị trấn Long Phú (Thị trấn )	20
8691	Xã Long Phú (Xã)	20
9181	Xã Vinh Hải	22
8692	Xã Phú Hữu	20
8693	Xã Song Phụng	20
8697	Thị trấn Huỳnh Hữu Nghĩa	20
8698	Xã Hưng Phú	20
8699	Xã Long Hưng	20
8701	Xã Mỹ Phước	20
8703	Xã Mỹ Tú	20
8706	Xã Đại Tâm	20
8722	Phường 3	20
8723	Xã Tân Long	20
8711	Thị trấn Mỹ Xuyên	20
8712	Xã Ngọc Đông	20
8717	Xã Long Bình	20
8726	Phường 10	20
8718	Xã Mỹ Bình	20
8719	Xã Mỹ Quới	20
8720	Phường 1	20
8721	Phường 2	20
8724	Xã Vĩnh Quới	20
8725	Phường 1	20
8730	Phường 5	20
8732	Phường 7	20
8733	Phường 8	20
8734	Phường 9	20
8735	Xã Châu Hưng	20
8753	Xã Trung Bình	20
8736	Thị trấn Hưng Lợi	20
8737	Xã Lâm Kiết	20
8738	Xã Lâm Tân	20
8739	Thị trấn Phú Lộc	20
8740	Xã Thạnh Tân	20
8741	Xã Thạnh Trị	20
8742	Xã Tuân Tức	20
8760	Phường 1	20
8743	Xã Vĩnh Lợi	20
8914	Xã Bon Phặng	19
8915	Xã Chiềng Bôm	19
8918	Xã Chiềng Ngàm	19
8919	Xã Chiềng Pấc	19
8920	Xã Chiềng Pha	19
8921	Xã Co Mạ	19
8744	Xã Vĩnh Thành	20
8745	Xã Đại Ân 2	20
8746	Thị trấn Lịch Hội Thượng (Thị trấn )	20
8747	Xã Lịch Hội Thượng (Xã)	20
8750	Xã Thạnh Thới An	20
8751	Xã Thạnh Thới Thuận	20
8754	Xã Viên An	20
8755	Xã Viên Bình	20
8757	Phường Khánh Hòa	20
8758	Xã Lạc Hòa	20
8759	Xã Lai Hòa	20
8761	Phường 2	20
8762	Xã Vĩnh Hải	20
8763	Xã Vĩnh Hiệp	20
8764	Phường Vĩnh Phước	20
8765	Xã Vĩnh Tân	20
8767	Thị trấn Bắc Yên	19
8774	Xã Làng Chếu	19
8775	Xã Mường Khoa	19
8776	Xã Phiêng Ban	19
8777	Xã Phiêng Côn	19
8778	Xã Song Pe	19
8786	Xã Hua Păng	19
8787	Xã Lóng Sập	19
8788	Thị trấn Mộc Châu	19
8795	Xã Tân Hợp	19
8810	Xã Hát Lót (Xã)	19
8811	Xã Mường Bằng	19
8812	Xã Mường Bon	19
8813	Xã Mường Chanh	19
8815	Xã Nà Pó	19
8816	Xã Phiêng Cằm	19
8817	Xã Phiêng Pằn	19
8818	Xã Tà Hộc	19
8819	Xã Chiềng Ân	19
8820	Xã Chiềng Công	19
8821	Xã Chiềng Hoa	19
8824	Xã Chiềng San	19
8826	Thị trấn ít Ong	19
8827	Xã Mường Bú	19
8828	Xã Mường Chùm	19
8834	Xã Tạ Bú	19
8835	Xã Bắc Phong	19
8836	Xã Đá Đỏ	19
8837	Xã Gia Phù	19
8838	Xã Huy Bắc	19
8839	Xã Huy Hạ	19
8840	Xã Huy Tân	19
8841	Xã Huy Thượng	19
8842	Xã Huy Tường	19
8850	Thị trấn Phù Yên	19
8853	Xã Suối Bau	19
8857	Xã Tường Hạ	19
8859	Xã Tường Phù	19
8860	Xã Tường Thượng	19
8861	Xã Tường Tiến	19
8862	Xã Cà Nàng	19
8863	Xã Chiềng Bằng	19
8876	Xã Mường Và	19
8877	Xã Nậm Lạnh	19
8878	Xã Púng Bánh	19
8884	Xã Chiềng Đen	19
8885	Phường Chiềng Lề	19
8890	Phường Quyết Tâm	19
8891	Phường Quyết Thắng	19
8892	Phường Tô Hiệu	19
8902	Xã Mường Cai	19
8903	Xã Mường Hung	19
8904	Xã Mường Lầm	19
8905	Xã Mường Sai	19
8906	Xã Nậm Mằn	19
8907	Xã Nậm Ty	19
8908	Xã Nà Ngựu	19
8910	Thị trấn Sông Mã	19
8913	Xã Bó Mười	19
8922	Xã Co Tòng	19
8923	Xã é Tòng	19
8928	Xã Mường é	19
8929	Xã Mường Khiêng	19
8930	Xã Nậm Lầu	19
8931	Xã Nong Lay	19
8932	Xã Pá Lông	19
8933	Xã Phỏng Lập	19
8934	Xã Phỏng Lái	19
8935	Xã Phổng Lăng	19
8936	Xã Púng Tra	19
8937	Xã Thôn Mòn	19
8938	Thị trấn Thuận Châu	19
8941	Xã Chiềng Khoa	19
8968	Thị trấn Yên Châu	19
8969	Xã Yên Sơn	19
8944	Xã Liên Hoà	19
8952	Xã Tô Múa	19
8953	Xã Vân Hồ	19
8954	Xã Xuân Nha	19
8955	Xã Chiềng Đông	19
8956	Xã Chiềng Hặc	19
8957	Xã Chiềng Khoi	19
8959	Xã Chiềng Pằn	19
8960	Xã Chiềng Sàng	19
8961	Xã Chiềng Tương	19
8962	Xã Lóng Phiêng	19
8963	Xã Mường Lựm	19
8964	Xã Phiêng Khoài	19
8966	Xã Tú Nang	19
8967	Xã Viêng Lán	19
8970	Xã An Thạnh	29
8976	Xã Long Phước	29
8971	Thị trấn Bến Cầu	29
8972	Xã Lợi Thuận	29
8982	Thị trấn Châu Thành	29
8983	Xã Đồng Khởi	29
8984	Xã Hảo Đước	29
8985	Xã Hòa Hội	29
8986	Xã Hòa Thạnh	29
8973	Xã Long Chữ	29
8974	Xã Long Giang	29
8975	Xã Long Khánh	29
8977	Xã Long Thuận	29
8978	Xã Tiên Thuận	29
8979	Xã An Bình	29
8980	Xã An Cơ	29
8981	Xã Biên Giới	29
8987	Xã Long Vĩnh	29
8988	Xã Ninh Điền	29
8989	Xã Phước Vinh	29
8990	Xã Thái Bình	29
8991	Xã Thanh Điền	29
8992	Xã Thành Long	29
8993	Xã Trí Bình	29
8995	Xã Bàu Năng	29
8996	Xã Cầu Khởi	29
8997	Xã Chà Là	29
9001	Xã Phước Minh	29
9021	Xã Trường Tây	29
9002	Xã Phước Ninh	29
9003	Xã Suối Đá	29
9004	Xã Truông Mít	29
9041	Xã Tân Phú	29
9042	Xã Tân Thành	29
9043	Xã Thạnh Đông	29
9044	Xã Bình Minh	29
9005	Xã Bàu Đồn	29
9006	Xã Cẩm Giang	29
9009	Xã Phước Đông	29
9045	Phường Hiệp Ninh	29
9010	Xã Phước Thạnh	29
9049	Phường 2	29
9011	Xã Phước Trạch	29
9012	Xã Thạnh Đức	29
9050	Phường 3	29
9051	Phường 4	29
9053	Xã Thạnh Tân	29
9013	Xã Thanh Phước	29
9016	Xã Long Thành Bắc	29
9086	Phường An Cựu	22
9017	Xã Long Thành Nam	29
9018	Xã Long Thành Trung	29
9090	Phường Đúc	22
9019	Xã Trường Đông	29
9020	Xã Trường Hòa	29
9024	Thị trấn Tân Biên	29
9030	Xã Thạnh Tây	29
9031	Xã Trà Vong	29
9034	Thị trấn Tân Châu	29
9035	Xã Tân Đông	29
9092	Phường Hương Sơ	22
9037	Xã Tân Hà	29
9094	Phường Phú Bình	22
9038	Xã Tân Hiệp	29
9047	Phường Ninh Thạnh	29
9095	Phường Phú Cát	22
9097	Phường Phú Hội	22
9048	Phường 1	29
9098	Phường Phú Hiệp	22
9099	Phường Phú Hòa	22
9054	Xã An Hòa	29
9055	Xã An Tịnh	29
9056	Xã Bình Thạnh	29
9057	Xã Đôn Thuận	29
9100	Phường Phú Nhuận	22
9101	Phường Phú Thuận	22
9058	Xã Gia Bình	29
9060	Xã Hưng Thuận	29
9061	Xã Lộc Hưng	29
9062	Xã Phước Chỉ	29
9063	Xã Phước Lưu	29
9064	Thị trấn Trảng Bàng	29
9065	Xã A Đớt	22
9066	Thị trấn A Lưới	22
9102	Phường Phước Vĩnh	22
9067	Xã A Ngo	22
9104	Phường Thuận Hòa	22
9069	Xã Bắc Sơn	22
9106	Phường Thuận Thành	22
9074	Xã Hồng Quảng	22
9075	Xã Hồng Thủy	22
9076	Xã Hồng Thái	22
9078	Xã Hồng Trung	22
9079	Xã Hồng Vân	22
9081	Xã Hương Nguyên	22
9083	Xã Nhâm	22
9084	Xã Phú Vinh	22
9087	Phường An Đông	22
9088	Phường An Hòa	22
9089	Phường An Tây	22
9091	Phường Hương Long	22
9108	Phường Thuỷ Xuân	22
9109	Phường Trường An	22
9117	Phường Thủy Châu	22
9118	Phường Thủy Dương	22
9119	Phường Thủy Lương	22
9140	Phường Tứ Hạ	22
9122	Xã Thủy Tân	22
9147	Thị trấn Khe Tre	22
9123	Xã Thủy Thanh	22
9149	Xã Thượng Long	22
9129	Phường Hương An	22
9130	Xã Hương Bình	22
9131	Phường Hương Chữ	22
9132	Phường Hương Hồ	22
9133	Xã Hương Phong	22
9134	Xã Hương Thọ	22
9135	Xã Hương Toàn	22
9152	Xã Điền Hải	22
9136	Phường Hương Văn	22
9137	Phường Hương Vân	22
9138	Xã Hương Vinh	22
9139	Phường Hương Xuân	22
9141	Xã Hương Giang	22
9142	Xã Hương Hữu	22
9143	Xã Hương Hòa	22
9144	Xã Hương Lộc	22
9145	Xã Hương Phú	22
9146	Xã Hương Sơn	22
9153	Xã Điền Hòa	22
9155	Xã Điền Lộc	22
9156	Xã Điền Môn	22
9159	Xã Phong Chương	22
9186	Xã Phú An	22
9160	Thị trấn Phong Điền	22
9162	Xã Phong Hiền	22
9163	Xã Phong Hòa	22
9164	Xã Phong Mỹ	22
9165	Xã Phong Sơn	22
9170	Xã Lộc Bình	22
9174	Xã Lộc Thủy	22
9177	Xã Lộc Vĩnh	22
9178	Thị trấn Lăng Cô	22
9179	Thị trấn Phú Lộc	22
9182	Xã Vinh Hiền	22
9217	Xã An Châu	7
9183	Xã Vinh Hưng	22
9184	Xã Vinh Mỹ	22
9185	Xã Xuân Lộc	22
9187	Thị trấn Phú Đa	22
9189	Xã Phú Dương	22
9190	Xã Phú Hải	22
9191	Xã Phú Hồ	22
9192	Xã Phú Lương	22
9197	Xã Phú Thượng	22
9193	Xã Phú Mậu	22
9194	Xã Phú Mỹ	22
9204	Xã Vinh Thanh	22
9195	Xã Phú Thanh	22
9196	Xã Phú Thuận	22
9198	Xã Phú Xuân	22
9205	Xã Vinh Xuân	22
9199	Thị trấn Thuận An	22
9200	Xã Vinh An	22
9201	Xã Vinh Hà	22
9202	Xã Vinh Phú	22
9203	Xã Vinh Thái	22
9206	Xã Quảng An	22
9208	Xã Quảng Lợi	22
9209	Xã Quảng Ngạn	22
9210	Xã Quảng Phú	22
9211	Xã Quảng Phước	22
9212	Xã Quảng Thọ	22
9213	Xã Quảng Thái	22
9214	Xã Quảng Thành	22
9215	Xã Quảng Vinh	22
9216	Thị trấn Sịa	22
9218	Xã Bạch Đằng	7
9235	Xã Đông Lĩnh	7
9219	Xã Chương Dương	7
9258	Xã Phú Lương	7
9220	Xã Đồng Phú	7
9327	Xã Vũ Ninh	7
9221	Xã Đô Lương	7
9222	Xã Đông á	7
9223	Xã Đông Các	7
9224	Xã Đông Cường	7
9331	Xã Vũ Thắng	7
9226	Xã Đông Dương	7
9468	Xã Tây Sơn	7
9227	Xã Đông Giang	7
9265	Xã Chi Lăng	7
9228	Xã Đông Hợp	7
9469	Xã Tây Tiến	7
9229	Xã Đông Hà	7
9280	Xã Kim Chung	7
9230	Xã Đông Hoàng	7
9231	Thị trấn Đông Hưng	7
9232	Xã Đông Huy	7
9233	Xã Đông Kinh	7
9234	Xã Đông La	7
9236	Xã Đông Phong	7
9237	Xã Đông Phương	7
9238	Xã Đông Quang	7
9239	Xã Đông Sơn	7
9240	Xã Đông Tân	7
9241	Xã Đông Vinh	7
9242	Xã Đông Xá	7
9298	Xã Bình Định	7
9243	Xã Đông Xuân	7
9244	Xã Hồng Châu	7
9245	Xã Hồng Giang	7
9247	Xã Hợp Tiến	7
9248	Xã Hoa Lư	7
9470	Thị trấn Tiền Hải	7
9249	Xã Hoa Nam	7
9250	Xã Liên Giang	7
9251	Xã Lô Giang	7
9252	Xã Mê Linh	7
9474	Xã Đồng Thanh	7
9253	Xã Minh Châu	7
9254	Xã Minh Tân	7
9255	Xã Nguyên Xá	7
9256	Xã Phong Châu	7
9257	Xã Phú Châu	7
9259	Xã Thăng Long	7
9260	Xã Trọng Quan	7
9261	Xã Bắc Sơn	7
9262	Xã Cộng Hòa	7
9263	Xã Canh Tân	7
9266	Xã Độc Lập	7
9267	Xã Dân Chủ	7
9268	Xã Điệp Nông	7
9269	Xã Đoan Hùng	7
9270	Xã Đông Đô	7
9271	Xã Duyên Hải	7
9272	Xã Hồng An	7
9273	Xã Hồng Lĩnh	7
9274	Xã Hồng Minh	7
9275	Xã Hòa Bình	7
9276	Xã Hòa Tiến	7
9277	Xã Hùng Dũng	7
9278	Thị trấn Hưng Hà	7
9279	Thị trấn Hưng Nhân	7
9281	Xã Liên Hiệp	7
9282	Xã Minh Hòa	7
9283	Xã Minh Khai	7
9284	Xã Minh Tân	7
9285	Xã Phúc Khánh	7
9286	Xã Tân Hòa	7
9308	Xã Minh Tân	7
9287	Xã Tân Lễ	7
9288	Xã Tân Tiến	7
9290	Xã Thống Nhất	7
9291	Xã Thái Hưng	7
9315	Xã Quang Minh	7
9292	Xã Thái Phương	7
9293	Xã Tiến Đức	7
9321	Xã Trà Giang	7
9294	Xã Văn Cẩm	7
9295	Xã Văn Lang	7
9296	Xã An Bồi	7
9322	Xã Vũ An	7
9297	Xã An Bình	7
9299	Xã Bình Minh	7
9300	Xã Bình Nguyên	7
9323	Xã Vũ Bình	7
9301	Xã Bình Thanh	7
9324	Xã Vũ Công	7
9302	Xã Đình Phùng	7
9303	Xã Hồng Thái	7
9304	Xã Hồng Tiến	7
9305	Xã Hòa Bình	7
9306	Xã Lê Lợi	7
9307	Xã Minh Hưng	7
9325	Xã Vũ Hòa	7
9309	Xã Nam Bình	7
9310	Xã Nam Cao	7
9311	Xã Quốc Tuấn	7
9312	Xã Quang Bình	7
9313	Xã Quang Hưng	7
9314	Xã Quang Lịch	7
9316	Xã Quang Trung	7
9317	Xã Quyết Tiến	7
9318	Thị trấn Thanh Nê	7
9319	Xã Thanh Tân	7
9320	Xã Thượng Hiền	7
9326	Xã Vũ Lễ	7
9328	Xã Vũ Quí	7
9329	Xã Vũ Sơn	7
9330	Xã Vũ Tây	7
9332	Xã Vũ Trung	7
9454	Xã Nam Hồng	7
9334	Thị trấn An Bài	7
9335	Xã An Cầu	7
9336	Xã An Đồng	7
9337	Xã An Dục	7
9338	Xã An Hiệp	7
9455	Xã Nam Hà	7
9339	Xã An Khê	7
9458	Xã Nam Thắng	7
9340	Xã An Lễ	7
9362	Xã Quỳnh Lâm	7
9341	Xã An Mỹ	7
9342	Xã An Ninh	7
9343	Xã An Quí	7
10557	Phường 2	30
9344	Xã An Thái	7
9345	Xã An Thanh	7
9346	Xã An Tràng	7
9347	Xã An Vinh	7
9648	Phường Phú Xá	27
9348	Xã An Vũ	7
9349	Xã Đồng Tiến	7
9350	Xã Đông Hải	7
9351	Xã Quỳnh Bảo	7
10589	Phường 2	30
10590	Phường 3	30
9352	Xã Quỳnh Châu	7
10591	Phường 4	30
9353	Thị trấn Quỳnh Côi	7
9377	Phường Kỳ Bá	7
9354	Xã Quỳnh Giao	7
9355	Xã Quỳnh Hải	7
9357	Xã Quỳnh Hội	7
9358	Xã Quỳnh Hoa	7
9359	Xã Quỳnh Hoàng	7
9381	Phường Quang Trung	7
10592	Phường 5	30
9360	Xã Quỳnh Hưng	7
9361	Xã Quỳnh Khê	7
9363	Xã Quỳnh Mỹ	7
10480	Xã Mỹ Phước (Xã)	34
9364	Xã Quỳnh Minh	7
9365	Xã Quỳnh Ngọc	7
9367	Xã Quỳnh Sơn	7
9368	Xã Quỳnh Thọ	7
9383	Phường Tiền Phong	7
9369	Xã Quỳnh Trang	7
9370	Xã Quỳnh Xá	7
9384	Phường Trần Hưng Đạo	7
9373	Xã Đông Hòa	7
9385	Phường Trần Lãm	7
9374	Xã Đông Mỹ	7
9391	Xã Hồng Quỳnh	7
9375	Xã Đông Thọ	7
9376	Phường Hoàng Diệu	7
9379	Phường Phú Khánh	7
9400	Xã Thụy Hải	7
9380	Xã Phú Xuân	7
9382	Xã Tân Bình	7
9405	Xã Thụy Lương	7
9386	Xã Vũ Chính	7
9652	Phường Quán Triều	27
9387	Xã Vũ Đông	7
9411	Xã Thụy Tân	7
9388	Xã Vũ Lạc	7
9653	Phường Quang Trung	27
9389	Xã Vũ Phúc	7
9390	Thị trấn Diêm Điền	7
9392	Xã Mỹ Lộc	7
9393	Xã Thụy An	7
9394	Xã Thụy Bình	7
9466	Xã Tây Ninh	7
9395	Xã Thụy Chính	7
9485	Xã Phúc Thành	7
9396	Xã Thụy Dân	7
9397	Xã Thụy Dũng	7
9412	Xã Thụy Thanh	7
9398	Xã Thụy Dương	7
9399	Xã Thụy Duyên	7
9401	Xã Thụy Hồng	7
10831	Xã Hiếu Thuận	30
9402	Xã Thụy Hà	7
9416	Xã Thụy Việt	7
9403	Xã Thụy Hưng	7
9404	Xã Thụy Liên	7
9406	Xã Thụy Ninh	7
9407	Xã Thụy Phong	7
9417	Xã Thụy Xuân	7
9408	Xã Thụy Phúc	7
9420	Xã Thái Dương	7
9409	Xã Thụy Quỳnh	7
10833	Xã Quới Thiện	30
9410	Xã Thụy Sơn	7
9413	Xã Thụy Trình	7
9658	Phường Tân Lập	27
9414	Xã Thụy Trường	7
9432	Xã Thái Thọ	7
9415	Xã Thụy Văn	7
9418	Xã Thái An	7
9433	Xã Thái Thủy	7
9419	Xã Thái Đô	7
9440	Xã Đông Cơ	7
9421	Xã Thái Giang	7
9446	Xã Đông Phong	7
9422	Xã Thái Học	7
9423	Xã Thái Hồng	7
9424	Xã Thái Hà	7
9425	Xã Thái Hòa	7
9447	Xã Đông Quí	7
9426	Xã Thái Hưng	7
9427	Xã Thái Nguyên	7
9428	Xã Thái Phúc	7
9429	Xã Thái Sơn	7
9430	Xã Thái Tân	7
9431	Xã Thái Thịnh	7
9434	Xã Thái Thành	7
9435	Xã Thái Thuần	7
9450	Xã Đông Xuyên	7
9436	Xã Thái Thượng	7
9437	Xã Thái Xuyên	7
9438	Xã An Ninh	7
9439	Xã Bắc Hải	7
9442	Xã Đông Hoàng	7
9443	Xã Đông Lâm	7
9444	Xã Đông Long	7
9452	Xã Nam Cường	7
9445	Xã Đông Minh	7
9449	Xã Đông Trung	7
9453	Xã Nam Hải	7
9456	Xã Nam Hưng	7
9457	Xã Nam Phú	7
9459	Xã Nam Thịnh	7
9460	Xã Nam Thanh	7
9462	Xã Phương Công	7
9463	Xã Tây An	7
9659	Phường Tân Long	27
9464	Xã Tây Giang	7
9465	Xã Tây Lương	7
9471	Xã Vân Trường	7
9856	Thị trấn Mường Lát	26
9472	Xã Vũ Lăng	7
9473	Xã Bách Thuận	7
9862	Xã Tén Tằn	26
9863	Xã Trung Lý	26
9475	Xã Dũng Nghĩa	7
9476	Xã Duy Nhất	7
9477	Xã Hồng Lý	7
9491	Xã Tân Lập	7
9478	Xã Hồng Phong	7
10337	Xã Mỹ Tân	34
9479	Xã Hiệp Hòa	7
10338	Xã Mỹ Trung	34
9480	Xã Hòa Bình	7
9481	Xã Minh Khai	7
10339	Xã Tân Hưng	34
9482	Xã Minh Lãng	7
9483	Xã Minh Quang	7
9484	Xã Nguyên Xá	7
9486	Xã Song An	7
9487	Xã Song Lãng	7
9488	Xã Tự Tân	7
10342	Xã Thiện Trung	34
9489	Xã Tam Quang	7
9490	Xã Tân Hòa	7
9492	Xã Tân Phong	7
9493	Xã Trung An	7
9496	Xã Vũ Đoài	7
9494	Xã Việt Hùng	7
9495	Xã Việt Thuận	7
9497	Xã Vũ Hội	7
9498	Thị trấn Vũ Thư	7
9499	Xã Vũ Tiến	7
9500	Xã Vũ Vân	7
9501	Xã Vũ Vinh	7
9502	Xã Xuân Hòa	7
9504	Xã Bản Ngoại	27
9505	Xã Bình Thuận	27
9506	Xã Cát Nê	27
9507	Xã Cù Vân	27
9508	Xã Đức Lương	27
9522	Xã Phú Thịnh	27
9509	Xã Hà Thượng	27
9533	Xã Bảo Cường	27
9510	Xã Hoàng Nông	27
9511	Thị trấn Hùng Sơn	27
9512	Xã Khôi Kỳ	27
9514	Xã Lục Ba	27
9515	Xã La Bằng	27
9516	Xã Mỹ Yên	27
9517	Xã Minh Tiến	27
9518	Xã Na Mao	27
9519	Xã Phục Linh	27
9520	Xã Phú Cường	27
9521	Xã Phú Lạc	27
9523	Xã Phú Xuyên	27
9524	Xã Phúc Lương	27
9525	Thị trấn Quân Chu (Thị trấn )	27
9526	Xã Quân Chu (Xã)	27
9527	Xã Tân Linh	27
9528	Xã Tân Thái	27
9529	Xã Tiên Hội	27
9530	Xã Vạn Thọ	27
9531	Xã Văn Yên	27
9532	Xã Yên Lãng	27
10486	Xã Tân Lập 1	34
10488	Xã Thạnh Hòa	34
9534	Xã Bảo Linh	27
10490	Xã Thạnh Tân	34
9535	Xã Bộc Nhiêu	27
9536	Xã Bình Thành	27
9537	Xã Bình Yên	27
9541	Xã Điềm Mặc	27
9539	Xã Định Biên	27
10500	Xã Thạnh Phú	30
9540	Xã Đồng Thịnh	27
10501	Xã Thông Hòa	30
9542	Xã Kim Phượng	27
9543	Xã Kim Sơn	27
9544	Xã Lam Vỹ	27
9573	Phường Ba Hàng	27
9545	Xã Linh Thông	27
9546	Xã Phú Đình	27
9547	Xã Phú Tiến	27
9549	Xã Phúc Chu	27
9574	Phường Bãi Bông	27
9551	Xã Sơn Phú	27
9554	Xã Thanh Định	27
10502	Thị trấn Cầu Ngang	30
10505	Xã Hiệp Mỹ Tây	30
9555	Xã Trung Hội	27
9556	Xã Trung Lương	27
9559	Xã Hòa Bình	27
9561	Xã Hóa Trung	27
9562	Xã Khe Mo	27
9563	Xã Minh Lập	27
9565	Xã Quang Sơn	27
9569	Thị trấn Trại Cau	27
9571	Xã Văn Lăng	27
9575	Xã Đắc Sơn	27
9576	Phường Đồng Tiến	27
9577	Xã Đông Cao	27
9578	Xã Hồng Tiến	27
10506	Xã Kim Hòa	30
10507	Xã Long Sơn	30
9580	Xã Nam Tiến	27
10509	Thị trấn Mỹ Long	30
9584	Xã Tân Phú	27
9598	Xã Lương Phú	27
9586	Xã Thuận Thành	27
9587	Xã Tiên Phong	27
9588	Xã Trung Thành	27
9589	Xã Vạn Phái	27
9590	Xã Bảo Lý	27
9591	Xã Bàn Đạt	27
9592	Xã Đào Xá	27
9593	Xã Điềm Thụy	27
9594	Xã Dương Thành	27
9595	Xã Hà Châu	27
9596	Thị trấn Hương Sơn	27
9597	Xã Kha Sơn	27
9599	Xã Nga My	27
9600	Xã Nhã Lộng	27
9601	Xã Tân Đức	27
9606	Xã Thanh Ninh	27
9607	Xã Thượng Đình	27
9608	Xã úc Kỳ	27
9628	Phường Cải Đan	27
9609	Xã Xuân Phương	27
9610	Xã Cổ Lũng	27
9629	Phường Lương Châu	27
9630	Phường Lương Sơn	27
9631	Phường Mỏ Chè	27
9612	Thị trấn Đu	27
9632	Phường Phố Cò	27
9613	Thị trấn Giang Tiên	27
9614	Xã Hợp Thành	27
9615	Xã Ôn Lương	27
9618	Xã Phú Đô	27
9619	Xã Tức Tranh	27
9620	Xã Vô Tranh	27
9625	Xã Bá Xuyên	27
9626	Phường Bách Quang	27
9633	Xã Tân Quang	27
9635	Xã Vinh Sơn	27
9636	Phường Cam Giá	27
9642	Phường Gia Sàng	27
9637	Xã Cao Ngạn	27
9643	Phường Hoàng Văn Thụ	27
9638	Phường Chùa Hang	27
9639	Phường Đồng Bẩm	27
9647	Phường Phan Đình Phùng	27
9640	Xã Đồng Liên	27
9644	Xã Huống Thượng	27
9645	Phường Hương Sơn	27
9646	Xã Linh Sơn	27
9649	Xã Phúc Hà	27
9651	Xã Phúc Xuân	27
9654	Phường Quang Vinh	27
9660	Phường Tân Thịnh	27
9655	Xã Quyết Thắng	27
9657	Xã Tân Cương	27
9661	Phường Tân Thành	27
9662	Xã Thịnh Đức	27
9663	Phường Thịnh Đán	27
9664	Phường Tích Lương	27
9665	Phường Trung Thành	27
9667	Phường Túc Duyên	27
9688	Phường Ngọc Trạo	26
9668	Xã Bình Long	27
9693	Xã Cổ Lũng	26
9669	Xã Cúc Đường	27
9670	Xã Dân Tiến	27
9671	Thị trấn Đình Cả	27
9672	Xã La Hiên	27
9673	Xã Lâu Thượng	27
9679	Xã Thần Xa	27
9682	Xã Vũ Chấn	27
9683	Phường Bắc Sơn	26
9684	Phường Ba Đình	26
9694	Thị trấn Cành Nàng	26
9685	Phường Đông Sơn	26
9734	Xã Đông Anh	26
9686	Xã Hà Lan	26
9687	Phường Lam Sơn	26
9690	Xã Quang Trung	26
9691	Xã ái Thượng	26
9692	Xã Ban Công	26
9695	Xã Điền Hạ	26
9737	Xã Đông Khê	26
9696	Xã Điền Lư	26
9697	Xã Điền Quang	26
9698	Xã Điền Thượng	26
9699	Xã Điền Trung	26
9700	Xã Hạ Trung	26
9701	Xã Kỳ Tân	26
9702	Xã Lâm Sa	26
9703	Xã Lũng Cao	26
9704	Xã Lũng Niêm	26
9705	Xã Lương Nội	26
9706	Xã Lương Ngoại	26
9708	Xã Tân Lập	26
9738	Xã Đông Minh	26
9709	Xã Thành Lâm	26
9743	Xã Đông Thịnh	26
9710	Xã Thành Sơn	26
9712	Xã Thiết Kế	26
9714	Xã Cẩm Bình	26
9716	Xã Cẩm Giang	26
9717	Xã Cẩm Liên	26
9718	Xã Cẩm Long	26
9719	Xã Cẩm Lương	26
9720	Xã Cẩm Ngọc	26
9892	Xã Nga Hưng	26
9721	Xã Cẩm Phong	26
9723	Xã Cẩm Quý	26
9724	Xã Cẩm Sơn	26
9725	Xã Cẩm Tâm	26
9726	Xã Cẩm Tân	26
9727	Xã Cẩm Thạch	26
9728	Thị trấn Cẩm Thủy	26
9729	Xã Cẩm Thành	26
9899	Xã Nga Tân	26
9730	Xã Cẩm Tú	26
9731	Xã Cẩm Vân	26
9732	Xã Cẩm Yên	26
9904	Xã Nga Thanh	26
9733	Xã Phúc Do	26
9735	Xã Đông Hòa	26
10517	Xã An Trường	30
9736	Xã Đông Hoàng	26
9739	Xã Đông Nam	26
9740	Xã Đông Ninh	26
9741	Xã Đông Phú	26
10171	Xã Thiệu Nguyên	26
9742	Xã Đông Quang	26
9744	Xã Đông Thanh	26
10518	Xã An Trường A	30
10519	Xã Bình Phú	30
9745	Xã Đông Tiến	26
10525	Xã Mỹ Cẩm	30
10526	Xã Nhị Long	30
9746	Xã Đông Văn	26
9747	Xã Đông Yên	26
9748	Thị trấn Rừng Thông	26
9905	Xã Nga Thành	26
9749	Xã Cầu Lộc	26
9750	Xã Châu Lộc	26
9751	Xã Đại Lộc	26
9752	Xã Đồng Lộc	26
9755	Thị trấn Hậu Lộc	26
9753	Xã Đa Lộc	26
9754	Xã Hải Lộc	26
9756	Xã Hoa Lộc	26
9912	Xã Nga Yên	26
9757	Xã Hòa Lộc	26
10966	Phường Tích Sơn	15
9758	Xã Hưng Lộc	26
10968	Xã Đại Tự	15
10969	Xã Đồng Cương	15
9759	Xã Lộc Sơn	26
9760	Xã Lộc Tân	26
9761	Xã Liên Lộc	26
9762	Xã Mỹ Lộc	26
9763	Xã Minh Lộc	26
9764	Xã Ngư Lộc	26
9765	Xã Phong Lộc	26
9784	Xã Hà Lâm	26
9766	Xã Phú Lộc	26
9785	Xã Hà Lĩnh	26
9786	Xã Hà Long	26
9767	Xã Quang Lộc	26
9768	Xã Thịnh Lộc	26
9769	Xã Thành Lộc	26
9770	Xã Thuần Lộc	26
9771	Xã Tiến Lộc	26
9772	Xã Triệu Lộc	26
9773	Xã Tuy Lộc	26
9787	Xã Hà Ngọc	26
9774	Xã Văn Lộc	26
9793	Xã Hà Thái	26
9775	Xã Xuân Lộc	26
9776	Xã Hà Bắc	26
9777	Xã Hà Bình	26
9778	Xã Hà Châu	26
10975	Xã Tề Lỗ	15
9779	Xã Hà Đông	26
9780	Xã Hà Dương	26
9781	Xã Hà Giang	26
9782	Xã Hà Hải	26
9783	Xã Hà Lai	26
9788	Xã Hà Ninh	26
9789	Xã Hà Phong	26
9790	Xã Hà Phú	26
9791	Xã Hà Sơn	26
9792	Xã Hà Tân	26
9794	Xã Hà Thanh	26
9796	Xã Hà Toại	26
9795	Xã Hà Tiến	26
9797	Thị trấn Hà Trung	26
9798	Xã Hà Vân	26
9799	Xã Hà Vinh	26
9800	Xã Hà Yên	26
9801	Thị trấn Bút Sơn	26
9802	Xã Hoằng Cát	26
10977	Xã Trung Hà	15
9803	Xã Hoằng Châu	26
9804	Xã Hoằng Đạo	26
9805	Xã Hoằng Đạt	26
9806	Xã Hoằng Đồng	26
9807	Xã Hoằng Đức	26
9810	Xã Hoằng Hải	26
9808	Xã Hoằng Đông	26
9809	Xã Hoằng Giang	26
9811	Xã Hoằng Hợp	26
9812	Xã Hoằng Hà	26
9813	Xã Hoằng Khánh	26
9814	Xã Hoằng Khê	26
9815	Xã Hoằng Kim	26
9972	Xã Trung ý	26
9816	Xã Hoằng Lộc	26
9817	Xã Hoằng Lương	26
9818	Xã Hoằng Lưu	26
9985	Xã Quảng Hải	26
9986	Xã Quảng Hợp	26
9819	Xã Hoằng Minh	26
9820	Xã Hoằng Ngọc	26
9821	Xã Hoằng Phụ	26
9822	Xã Hoằng Phong	26
9823	Xã Hoằng Phú	26
9824	Xã Hoằng Phượng	26
9825	Xã Hoằng Phúc	26
9826	Xã Hoằng Quỳ	26
9827	Xã Hoằng Quý	26
9828	Xã Hoằng Sơn	26
9829	Xã Hoằng Tân	26
9832	Xã Hoằng Thái	26
9830	Xã Hoằng Thắng	26
9831	Xã Hoằng Thịnh	26
9835	Xã Hoằng Tiến	26
9833	Xã Hoằng Thanh	26
9838	Xã Hoằng Trường	26
9834	Xã Hoằng Thành	26
9836	Xã Hoằng Trạch	26
9837	Xã Hoằng Trinh	26
9839	Xã Hoằng Trung	26
10129	Phường Đông Sơn	26
9840	Xã Hoằng Vinh	26
9848	Thị trấn Lang Chánh	26
9849	Xã Quang Hiến	26
9841	Xã Hoằng Xuân	26
9850	Xã Tam Văn	26
9851	Xã Tân Phúc	26
9842	Xã Hoằng Xuyên	26
9843	Xã Hoằng Yến	26
9844	Xã Đồng Lương	26
9845	Xã Giao An	26
9846	Xã Giao Thiện	26
9847	Xã Lâm Phú	26
9852	Xã Trí Nang	26
9853	Xã Yên Khương	26
9854	Xã Yên Thắng	26
9855	Xã Mường Chanh	26
9864	Xã Cao Ngọc	26
9865	Xã Cao Thịnh	26
10135	Xã Hoằng Anh	26
9866	Xã Đồng Thịnh	26
9868	Xã Lộc Thịnh	26
9869	Xã Lam Sơn	26
9870	Xã Mỹ Tân	26
9871	Xã Minh Sơn	26
9874	Thị trấn Ngọc Lặc	26
9876	Xã Ngọc Sơn	26
9878	Xã Nguyệt ấn	26
9879	Xã Phúc Thịnh	26
9880	Xã Phùng Giáo	26
9882	Xã Quang Trung	26
9883	Xã Thạch Lập	26
9884	Xã Thúy Sơn	26
9885	Xã Vân Âm	26
9886	Xã Ba Đình	26
9887	Xã Nga An	26
9888	Xã Nga Bạch	26
10136	Xã Hoằng Đại	26
9889	Xã Nga Điền	26
10137	Xã Hoằng Long	26
9890	Xã Nga Giáp	26
9891	Xã Nga Hải	26
9894	Xã Nga Lĩnh	26
10141	Phường Nam Ngạn	26
9895	Xã Nga Mỹ	26
10142	Phường Ngọc Trạo	26
9896	Xã Nga Nhân	26
10745	Xã Thuận An	30
9897	Xã Nga Phú	26
9898	Thị trấn Nga Sơn	26
9900	Xã Nga Thạch	26
10761	Xã Hòa Phú	30
9901	Xã Nga Thắng	26
9902	Xã Nga Thủy	26
9903	Xã Nga Thái	26
9906	Xã Nga Thiện	26
10762	Xã Lộc Hòa	30
9908	Xã Nga Trường	26
9909	Xã Nga Trung	26
9910	Xã Nga Vịnh	26
9911	Xã Nga Văn	26
9913	Thị trấn Bến Sung	26
9914	Xã Cán Khê	26
10207	Xã Hải An	26
9915	Xã Hải Long	26
9916	Xã Hải Vân	26
9917	Xã Mậu Lâm	26
9920	Xã Phúc Đường	26
9921	Xã Thanh Kỳ	26
9923	Xã Xuân Du	26
9924	Xã Xuân Khang	26
9925	Xã Xuân Phúc	26
9926	Xã Xuân Thọ	26
9927	Xã Xuân Thái	26
9928	Xã Yên Lạc	26
9929	Xã Yên Thọ	26
9930	Xã Bãi Trành	26
9932	Xã Cát Tân	26
9933	Xã Cát Vân	26
9934	Xã Hóa Quỳ	26
9935	Xã Tân Bình	26
9937	Xã Thanh Lâm	26
9938	Xã Thanh Phong	26
9939	Xã Thanh Quân	26
9940	Xã Thanh Sơn	26
9941	Xã Thanh Xuân	26
9942	Xã Thượng Ninh	26
9943	Xã Xuân Bình	26
9944	Xã Xuân Hòa	26
9945	Xã Xuân Quỳ	26
9946	Thị trấn Yên Cát	26
9987	Xã Quảng Hòa	26
9947	Xã Yên Lễ	26
9949	Xã Công Chính	26
9950	Xã Công Liêm	26
9995	Xã Quảng Nham	26
9951	Xã Hoàng Giang	26
10008	Thị trấn Quảng Xương	26
9952	Xã Hoàng Sơn	26
9953	Xã Minh Khôi	26
9954	Xã Minh Nghĩa	26
9955	Thị trấn Nông Cống	26
9956	Xã Tế Lợi	26
9957	Xã Tế Nông	26
9958	Xã Tế Tân	26
9959	Xã Tế Thắng	26
9960	Xã Tân Khang	26
10209	Xã Hải Châu	26
9961	Xã Tân Phúc	26
9962	Xã Tân Thọ	26
9964	Xã Thăng Long	26
9965	Xã Thăng Thọ	26
9966	Xã Trường Giang	26
9967	Xã Trường Minh	26
9968	Xã Trường Sơn	26
9969	Xã Trường Trung	26
9970	Xã Trung Chính	26
9971	Xã Trung Thành	26
9973	Xã Tượng Lĩnh	26
9974	Xã Tượng Sơn	26
9975	Xã Tượng Văn	26
9976	Xã Vạn Hòa	26
9977	Xã Vạn Thắng	26
9979	Xã Yên Mỹ	26
9980	Xã Quảng Bình	26
10021	Thị trấn Quan Hóa	26
9981	Xã Quảng Chính	26
9982	Xã Quảng Định	26
9983	Xã Quảng Đức	26
9984	Xã Quảng Giao	26
9988	Xã Quảng Khê	26
9989	Xã Quảng Lộc	26
10044	Xã Quảng Đại	26
9990	Xã Quảng Lợi	26
10048	Phường Quảng Tiến	26
9991	Xã Quảng Lĩnh	26
9992	Xã Quảng Long	26
9993	Xã Quảng Lưu	26
9994	Xã Quảng Ngọc	26
9996	Xã Quảng Nhân	26
9997	Xã Quảng Ninh	26
9998	Xã Quảng Phong	26
9999	Xã Quảng Phúc	26
10000	Xã Quảng Tân	26
10001	Xã Quảng Thạch	26
10002	Xã Quảng Thái	26
10049	Phường Quảng Vinh	26
10003	Xã Quảng Trạch	26
10050	Phường Trường Sơn	26
10005	Xã Quảng Trung	26
10006	Xã Quảng Vọng	26
10007	Xã Quảng Văn	26
10009	Xã Quảng Yên	26
10012	Xã Hiền Kiệt	26
10051	Phường Trung Sơn	26
10052	Thị trấn Kim Tân	26
10016	Xã Phú Lệ	26
10017	Xã Phú Nghiêm	26
10081	Xã Hạnh Phúc	26
10020	Xã Phú Xuân	26
10104	Xã Xuân Khánh	26
10027	Xã Xuân Phú	26
10355	Xã Phú Nhuận	34
10030	Thị trấn Quan Sơn	26
10032	Xã Sơn Hà	26
10040	Xã Trung Xuân	26
10041	Phường Bắc Sơn	26
10042	Phường Quảng Châu	26
10367	Phường 2	34
10045	Xã Quảng Hùng	26
10046	Xã Quảng Minh	26
10047	Phường Quảng Thọ	26
10053	Xã Ngọc Trạo	26
10056	Xã Thạch Định	26
10368	Phường 3	34
10059	Xã Thạch Long	26
10062	Xã Thạch Tân	26
10369	Phường 4	34
10063	Xã Thạch Tượng	26
10064	Xã Thành An	26
10065	Xã Thành Công	26
10066	Xã Thành Hưng	26
10067	Xã Thành Kim	26
10068	Xã Thành Long	26
10069	Xã Thành Mỹ	26
10071	Xã Thành Tâm	26
10074	Xã Thành Tiến	26
10075	Xã Thành Trực	26
10078	Xã Thành Yên	26
10079	Thị trấn Vân Du	26
10107	Xã Xuân Lam	26
10080	Xã Bắc Lương	26
10082	Thị trấn Lam Sơn	26
10083	Xã Nam Giang	26
10084	Xã Phú Yên	26
10085	Xã Quảng Phú	26
10086	Thị trấn Sao Vàng	26
10087	Xã Tây Hồ	26
10088	Xã Thọ Diên	26
10089	Xã Thọ Hải	26
10091	Xã Thọ Lộc	26
10093	Xã Thọ Minh	26
10094	Xã Thọ Nguyên	26
10109	Xã Xuân Phong	26
10095	Xã Thọ Thắng	26
10096	Xã Thọ Trường	26
10097	Thị trấn Thọ Xuân	26
10099	Xã Xuân Bái	26
10101	Xã Xuân Giang	26
10102	Xã Xuân Hòa	26
10673	Xã Lâm Xuyên	28
10103	Xã Xuân Hưng	26
10690	Xã Tuân Lộ	28
10105	Xã Xuân Lập	26
10106	Xã Xuân Lai	26
10111	Xã Xuân Quang	26
10115	Xã Xuân Thành	26
10113	Xã Xuân Tân	26
10116	Xã Xuân Thiên	26
10118	Xã Xuân Trường	26
10123	Phường Điện Biên	26
10119	Xã Xuân Vinh	26
10120	Xã Xuân Yên	26
10121	Phường An Hoạch	26
10124	Phường Đông Cương	26
10125	Phường Đông Hải	26
11130	Phường Nguyễn Thái Học	10
10126	Xã Đông Hưng	26
10127	Phường Đông Hương	26
10128	Xã Đông Lĩnh	26
10130	Xã Đông Tân	26
10131	Phường Đông Thọ	26
10132	Phường Đông Vệ	26
10133	Xã Đông Vinh	26
10134	Phường Hàm Rồng	26
10138	Xã Hoằng Lý	26
10143	Phường Phú Sơn	26
10139	Xã Hoằng Quang	26
10140	Phường Lam Sơn	26
10144	Xã Quảng Cát	26
10145	Xã Quảng Đông	26
10153	Phường Tào Xuyên	26
10146	Phường Quảng Hưng	26
10147	Xã Quảng Phú	26
10148	Xã Quảng Tâm	26
10154	Xã Thiệu Dương	26
10149	Phường Quảng Thắng	26
10155	Xã Thiệu Khánh	26
10150	Xã Quảng Thịnh	26
10151	Phường Quảng Thành	26
10152	Phường Tân Sơn	26
10156	Xã Thiệu Vân	26
10157	Phường Trường Thi	26
10158	Xã Thiệu Châu	26
10159	Xã Thiệu Chính	26
10160	Xã Thiệu Công	26
10161	Xã Thiệu Đô	26
10162	Xã Thiệu Duy	26
11133	Xã Tuy Lộc	10
10163	Xã Thiệu Giang	26
10164	Xã Thiệu Giao	26
10165	Xã Thiệu Hợp	26
11134	Xã Văn Phú	10
10166	Xã Thiệu Hòa	26
10167	Xã Thiệu Long	26
10168	Xã Thiệu Lý	26
10169	Xã Thiệu Minh	26
10172	Xã Thiệu Phú	26
10173	Xã Thiệu Phúc	26
10529	Xã Tân An	30
10174	Xã Thiệu Quang	26
10530	Xã Tân Bình	30
10175	Xã Thiệu Tâm	26
10177	Xã Thiệu Thịnh	26
10178	Xã Thiệu Thành	26
10212	Xã Hải Lĩnh	26
10179	Xã Thiệu Tiến	26
10534	Xã Hòa Minh	30
10180	Xã Thiệu Toán	26
10181	Xã Thiệu Trung	26
10182	Xã Thiệu Vận	26
10217	Xã Hải Yến	26
10183	Xã Thiệu Viên	26
10184	Xã Thiệu Vũ	26
10185	Thị trấn Vạn Hà	26
10192	Xã Thọ Thanh	26
10194	Xã Vạn Xuân	26
10195	Xã Xuân Cẩm	26
10198	Xã Xuân Dương	26
10199	Xã Xuân Lẹ	26
10200	Xã Xuân Lộc	26
10201	Xã Xuân Thắng	26
10203	Xã Anh Sơn	26
10204	Xã Bình Minh	26
10205	Xã Các Sơn	26
10206	Xã Định Hải	26
10210	Xã Hải Hà	26
10223	Xã Ninh Hải	26
10211	Xã Hải Hòa	26
10247	Xã Hợp Thành	26
10213	Xã Hải Nhân	26
10214	Xã Hải Ninh	26
10215	Xã Hải Thanh	26
10447	Xã Long Bình	34
10216	Xã Hải Thượng	26
10218	Xã Hùng Sơn	26
10219	Xã Mai Lâm	26
10220	Xã Ngọc Lĩnh	26
10769	Xã Tân Hạnh	30
10221	Xã Nghi Sơn	26
10222	Xã Nguyên Bình	26
10224	Xã Phú Lâm	26
10225	Xã Phú Sơn	26
10226	Xã Tân Dân	26
10228	Xã Thanh Sơn	26
10229	Xã Thanh Thủy	26
10230	Thị trấn Tĩnh Gia	26
10231	Xã Tĩnh Hải	26
10232	Xã Triêu Dương	26
10233	Xã Trường Lâm	26
10234	Xã Trúc Lâm	26
10235	Xã Tùng Lâm	26
10236	Xã Xuân Lâm	26
10237	Xã An Nông	26
10238	Xã Bình Sơn	26
10239	Xã Đồng Lợi	26
10240	Xã Đồng Thắng	26
10250	Xã Minh Châu	26
10241	Xã Đồng Tiến	26
10242	Xã Dân Lực	26
10243	Xã Dân Lý	26
10244	Xã Dân Quyền	26
10245	Xã Hợp Lý	26
10246	Xã Hợp Thắng	26
10248	Xã Hợp Tiến	26
10249	Xã Khuyến Nông	26
10251	Xã Minh Dân	26
10266	Xã Tiến Nông	26
10253	Xã Nông Trường	26
10277	Xã Vĩnh Khang	26
10254	Xã Tân Ninh	26
10255	Xã Thọ Bình	26
10256	Xã Thọ Cường	26
10257	Xã Thọ Dân	26
10258	Xã Thọ Ngọc	26
10259	Xã Thọ Phú	26
10260	Xã Thọ Sơn	26
10261	Xã Thọ Tân	26
10262	Xã Thọ Thế	26
10263	Xã Thọ Tiến	26
10264	Xã Thọ Vực	26
10265	Xã Thái Hòa	26
10281	Xã Vĩnh Ninh	26
10267	Thị trấn Triệu Sơn	26
10452	Thị trấn Vĩnh Bình	34
10270	Xã Xuân Lộc	26
10467	Phường 9	34
10271	Xã Xuân Thịnh	26
10272	Xã Xuân Thọ	26
10273	Xã Vĩnh An	26
10301	Thị trấn Quán Lào	26
10274	Xã Vĩnh Hòa	26
10275	Xã Vĩnh Hưng	26
10276	Xã Vĩnh Hùng	26
10278	Thị trấn Vĩnh Lộc	26
10279	Xã Vĩnh Long	26
10280	Xã Vĩnh Minh	26
10282	Xã Vĩnh Phúc	26
10283	Xã Vĩnh Quang	26
10284	Xã Vĩnh Tân	26
10285	Xã Vĩnh Thịnh	26
10315	Xã Yên Thái	26
10286	Xã Vĩnh Thành	26
10287	Xã Vĩnh Tiến	26
10288	Xã Vĩnh Yên	26
10290	Xã Định Công	26
10291	Xã Định Hải	26
10326	Xã Hậu Mỹ Phú	34
10292	Xã Định Hòa	26
10293	Xã Định Hưng	26
10294	Xã Định Liên	26
10295	Xã Định Long	26
10296	Xã Định Tân	26
10297	Xã Định Tăng	26
10298	Xã Định Thành	26
10299	Xã Định Tiến	26
10300	Xã Định Tường	26
10302	Xã Quí Lộc	26
10304	Xã Yên Bái	26
10327	Xã Hậu Mỹ Trinh	34
10305	Xã Yên Giang	26
10328	Xã Hậu Thành	34
10306	Xã Yên Hùng	26
10307	Xã Yên Lạc	26
10308	Xã Yên Lâm	26
10309	Xã Yên Ninh	26
10310	Xã Yên Phong	26
10312	Xã Yên Tâm	26
10313	Xã Yên Thịnh	26
10314	Xã Yên Thọ	26
10316	Xã Yên Trường	26
10317	Xã Yên Trung	26
10333	Xã Mỹ Hội	34
10318	Xã An Cư	34
10320	Xã An Thái Đông	34
10335	Xã Mỹ Lợi B	34
10322	Thị trấn Cái Bè	34
10324	Xã Hậu Mỹ Bắc A	34
10329	Xã Hòa Hưng	34
10331	Xã Mỹ Đức Đông	34
10332	Xã Mỹ Đức Tây	34
10334	Xã Mỹ Lợi A	34
10340	Xã Tân Thanh	34
10341	Xã Thiện Trí	34
10343	Xã Bình Phú	34
10344	Xã Cẩm Sơn	34
10345	Xã Hội Xuân	34
10346	Xã Hiệp Đức	34
10347	Xã Long Tiên	34
10348	Xã Long Trung	34
10349	Xã Mỹ Long	34
10350	Xã Mỹ Thành Bắc	34
10351	Xã Mỹ Thành Nam	34
10352	Xã Ngũ Hiệp	34
10353	Xã Phú An	34
10354	Xã Phú Cường	34
10356	Xã Tam Bình	34
10360	Xã Mỹ Hạnh Đông	34
10469	Xã Tân Mỹ Chánh	34
10361	Xã Mỹ Hạnh Trung	34
10470	Xã Thới Sơn	34
10362	Xã Mỹ Phước Tây	34
10363	Phường Nhị Mỹ	34
10370	Phường 5	34
10364	Xã Nhị Quý	34
10365	Xã Phú Quý	34
10366	Phường 1	34
10371	Xã Tân Bình	34
10372	Xã Tân Hội	34
10373	Xã Tân Phú	34
10393	Xã Xuân Đông	34
10374	Xã Thanh Hòa	34
10375	Xã An Thạnh Thủy	34
10395	Xã Bình Đức	34
10376	Xã Bình Ninh	34
10377	Xã Bình Phục Nhứt	34
10378	Xã Bình Phan	34
10397	Xã Điềm Hy	34
10379	Thị trấn Chợ Gạo	34
10380	Xã Đăng Hưng Phước	34
10410	Thị trấn Tân Hiệp	34
10381	Xã Hòa Định	34
10382	Xã Hòa Tịnh	34
10383	Xã Long Bình Điền	34
10384	Xã Lương Hòa Lạc	34
10385	Xã Mỹ Tịnh An	34
10413	Xã Tân Lý Tây	34
10387	Xã Quơn Long	34
10388	Xã Song Bình	34
10390	Xã Tân Thuận Bình	34
10414	Xã Thạnh Phú	34
10415	Xã Thân Cửu Nghĩa	34
10392	Xã Trung Hòa	34
10394	Xã Bàn Long	34
10396	Xã Bình Trưng	34
10398	Xã Đông Hòa	34
10427	Phường 5	34
10400	Xã Hữu Đạo	34
10434	Xã Tân Điền	34
10401	Xã Kim Sơn	34
10402	Xã Long An	34
10436	Thị trấn Tân Hòa	34
10403	Xã Long Định	34
10404	Xã Long Hưng	34
10406	Xã Phú Phong	34
10407	Xã Song Thuận	34
10439	Xã Tân Thành	34
10408	Xã Tam Hiệp	34
10409	Xã Tân Hội Đông	34
10411	Xã Tân Hương	34
10416	Xã Vĩnh Kim	34
10417	Xã Bình Đông	34
10418	Xã Bình Xuân	34
10419	Xã Long Chánh	34
10420	Xã Long Hòa	34
10421	Xã Long Hưng	34
10424	Phường 2	34
10426	Phường 4	34
10429	Xã Bình Ân	34
10430	Xã Bình Nghị	34
10431	Xã Gia Thuận	34
10774	Thị trấn Cái Nhum	30
10432	Xã Kiểng Phước	34
10433	Xã Phước Trung	34
10435	Xã Tân Đông	34
10437	Xã Tân Phước	34
10438	Xã Tân Tây	34
10440	Xã Tăng Hòa	34
10472	Xã Phú Đông	34
10441	Thị trấn Vàm Láng	34
10442	Xã Bình Nhì	34
10443	Xã Bình Phú	34
10444	Xã Bình Tân	34
10474	Xã Phú Thạnh	34
10446	Xã Đồng Thạnh	34
10448	Xã Long Vĩnh	34
10475	Xã Tân Phú	34
10476	Xã Tân Thạnh	34
10450	Xã Thạnh Trị	34
10477	Xã Tân Thới	34
10451	Xã Thành Công	34
10453	Xã Vĩnh Hựu	34
10454	Xã Yên Luông	34
10478	Xã Hưng Thạnh	34
10455	Xã Đạo Thạnh	34
10456	Xã Mỹ Phong	34
10457	Xã Phước Thạnh	34
10458	Phường 1	34
10459	Phường 10	34
10460	Phường 2	34
10462	Phường 4	34
10463	Phường 5	34
10471	Xã Trung An	34
10479	Thị trấn Mỹ Phước (Thị trấn )	34
10473	Xã Phú Tân	34
10481	Xã Phú Mỹ	34
10482	Xã Phước Lập	34
10483	Xã Tân Hòa Đông	34
10485	Xã Tân Hòa Thành	34
10491	Xã An Phú Tân	30
10492	Thị trấn Cầu Kè	30
10493	Xã Châu Điền	30
10494	Xã Hòa Ân	30
10496	Xã Ninh Thới	30
10594	Phường 7	30
10499	Xã Tam Ngãi	30
10510	Xã Mỹ Long Bắc	30
10511	Xã Mỹ Long Nam	30
10513	Xã Thạnh Hòa Sơn	30
10514	Xã Thuận Hòa	30
10516	Xã Vĩnh Kim	30
10520	Thị trấn Càng Long	30
10546	Xã Đôn Xuân	30
10521	Xã Đại Phước	30
10547	Xã Đông Hải	30
10548	Xã Long Khánh	30
10522	Xã Đại Phúc	30
10523	Xã Đức Mỹ	30
10524	Xã Huyền Hội	30
10527	Xã Nhị Long Phú	30
10528	Xã Phương Thạnh	30
10532	Xã Đa Lộc	30
10533	Xã Hòa Lợi	30
10535	Xã Hòa Thuận	30
10536	Xã Hưng Mỹ	30
10538	Xã Lương Hòa	30
10549	Thị trấn Long Thành	30
10550	Xã Long Vĩnh	30
10539	Xã Lương Hoà A	30
10540	Xã Mỹ Chánh	30
10541	Xã Nguyệt Hóa	30
10542	Xã Phước Hảo	30
10543	Xã Song Lộc	30
10544	Xã Thanh Mỹ	30
10545	Xã Đôn Châu	30
10595	Phường 8	30
10552	Xã Dân Thành	30
10553	Xã Hiệp Thạnh	30
10554	Xã Long Hữu	30
10556	Phường 1	30
10555	Xã Long Toàn	30
10558	Xã Trường Long Hòa	30
10559	Thị trấn Cầu Quan	30
10560	Xã Hiếu Tử	30
10561	Xã Hiếu Trung	30
10562	Xã Hùng Hòa	30
10563	Xã Long Thới	30
10564	Xã Ngãi Hùng	30
10565	Xã Phú Cần	30
10566	Xã Tập Ngãi	30
10568	Xã Tân Hùng	30
10569	Thị trấn Tiểu Cần	30
10570	Xã An Quảng Hữu	30
10571	Xã Đại An	30
10573	Xã Định An (Xã)	30
10574	Xã Hàm Giang	30
10575	Xã Hàm Tân	30
10576	Xã Kim Sơn	30
10596	Phường 9	30
10578	Xã Lưu Nghiệp Anh	30
10580	Xã Ngãi Xuyên	30
10582	Xã Tập Sơn	30
10584	Xã Tân Sơn	30
11145	Xã Mỹ Gia	10
10585	Xã Thanh Sơn	30
10586	Thị trấn Trà Cú	30
10588	Phường 1	30
10597	Xã Bình Nhân	28
10598	Xã Bình Phú	28
10599	Xã Hà Lang	28
10600	Xã Hòa An	28
10601	Xã Hòa Phú	28
10602	Xã Hùng Mỹ	28
10603	Xã Kiên Đài	28
10604	Xã Kim Bình	28
10605	Xã Linh Phú	28
10606	Xã Minh Quang	28
10607	Xã Ngọc Hội	28
10611	Xã Phúc Thịnh	28
10612	Xã Tân An	28
10613	Xã Tân Mỹ	28
10614	Xã Tân Thịnh	28
10618	Thị trấn Vĩnh Lộc	28
10619	Xã Vinh Quang	28
10622	Xã Yên Nguyên	28
10623	Xã Bạch Xa	28
10625	Xã Bình Xa	28
10626	Xã Đức Ninh	28
10627	Xã Hùng Đức	28
10628	Xã Minh Dân	28
10629	Xã Minh Hương	28
10630	Xã Minh Khương	28
10631	Xã Nhân Mục	28
10632	Xã Phù Lưu	28
10635	Xã Thái Hòa	28
10636	Xã Thái Sơn	28
10637	Xã Thành Long	28
10638	Xã Yên Lâm	28
10639	Xã Yên Phú	28
10647	Xã Thượng Lâm	28
10648	Xã Xuân Lập	28
10649	Xã Côn Lôn	28
10650	Xã Đà Vị	28
10651	Xã Hồng Thái	28
10659	Xã Thượng Nông	28
10660	Xã Yên Hoa	28
10661	Xã Bình Yên	28
10662	Xã Cấp Tiến	28
10663	Xã Chi Thiết	28
10664	Xã Đại Phú	28
10665	Xã Đồng Quý	28
10666	Xã Đông Lợi	28
10667	Xã Đông Thọ	28
10668	Xã Hồng Lạc	28
10670	Xã Hợp Thành	28
10671	Xã Hào Phú	28
10672	Xã Kháng Nhật	28
10674	Xã Lương Thiện	28
10675	Xã Minh Thanh	28
10676	Xã Ninh Lai	28
10677	Xã Phú Lương	28
10678	Xã Phúc ứng	28
10679	Xã Quyết Thắng	28
10680	Xã Sầm Dương	28
10681	Thị trấn Sơn Dương	28
10682	Xã Sơn Nam	28
10683	Xã Tam Đa	28
10684	Xã Tân Trào	28
10685	Xã Thanh Phát	28
10686	Xã Thiện Kế	28
10687	Xã Thượng ấm	28
10688	Xã Trung Yên	28
10689	Xã Tú Thịnh	28
10691	Xã Văn Phú	28
10692	Xã Vân Sơn	28
10693	Xã Vĩnh Lợi	28
10694	Phường ỷ La	28
10702	Phường Phan Thiết	28
10695	Xã An Khang	28
10696	Xã An Tường	28
10697	Xã Đội Cấn	28
10726	Xã Tứ Quận	28
10698	Phường Hưng Thành	28
10738	Phường Cái Vồn	30
10699	Xã Lưỡng Vượng	28
10701	Phường Nông Tiến	28
10703	Phường Tân Hà	28
10704	Phường Tân Quang	28
10705	Xã Thái Long	28
10706	Xã Tràng Đà	28
10707	Xã Chân Sơn	28
10708	Xã Chiêu Yên	28
10712	Xã Hoàng Khai	28
10714	Xã Kiến Thiết	28
10715	Xã Kim Phú	28
10716	Xã Kim Quan	28
10717	Xã Lực Hành	28
10718	Xã Lang Quán	28
10719	Xã Mỹ Bằng	28
10720	Xã Nhữ Hán	28
10724	Xã Phúc Ninh	28
10725	Xã Quí Quân	28
10727	Thị trấn Tân Bình	28
10728	Xã Tân Long	28
10729	Xã Tân Tiến	28
10731	Xã Thái Bình	28
10732	Xã Tiến Bộ	28
10733	Xã Trung Minh	28
10734	Xã Trung Môn	28
10735	Xã Trung Sơn	28
10736	Xã Trung Trực	28
10737	Xã Xuân Vân	28
10739	Xã Đông Bình	30
10740	Xã Đông Thạnh	30
10741	Xã Đông Thành	30
10742	Phường Đông Thuận	30
10743	Xã Mỹ Hòa	30
10746	Xã Mỹ Thuận	30
10747	Xã Nguyễn Văn Thảnh	30
10748	Xã Tân An Thạnh	30
10782	Xã Tân An Hội	30
10749	Xã Tân Bình	30
10750	Xã Tân Hưng	30
10751	Xã Tân Lược	30
10752	Xã Tân Quới	30
10764	Thị trấn Long Hồ	30
10753	Xã Tân Thành	30
10767	Xã Phú Quới	30
10754	Xã Thành Đông	30
10756	Xã Thành Trung	30
10758	Xã Bình Hòa Phước	30
10759	Xã Đồng Phú	30
10760	Xã Hòa Ninh	30
10763	Xã Long An	30
10765	Xã Long Phước	30
10766	Xã Phú Đức	30
10768	Xã Phước Hậu	30
10770	Xã Thạnh Quới	30
10783	Xã Tân Long	30
10771	Xã Thanh Đức	30
10789	Xã Hòa Thạnh	30
10772	Xã An Phước	30
10773	Xã Bình Phước	30
10775	Xã Chánh An	30
10795	Xã Phú Lộc	30
10776	Xã Chánh Hội	30
10777	Xã Hòa Tịnh	30
10778	Xã Long Mỹ	30
10813	Thị trấn Trà Ôn	30
10779	Xã Mỹ An	30
10780	Xã Mỹ Phước	30
10781	Xã Nhơn Phú	30
10817	Phường 2	30
10784	Xã Tân Long Hội	30
10818	Phường 3	30
10786	Xã Hậu Lộc	30
10819	Phường 4	30
10787	Xã Hòa Hiệp	30
10788	Xã Hoà Lộc	30
10791	Xã Long Phú	30
10792	Xã Mỹ Lộc	30
10794	Xã Ngãi Tứ	30
10796	Xã Phú Thịnh	30
10797	Xã Song Phú	30
10798	Thị trấn Tam Bình	30
10799	Xã Tân Lộc	30
10800	Xã Tân Phú	30
10802	Xã Hựu Thành	30
10803	Xã Hòa Bình	30
10804	Xã Lục Sỹ Thành	30
10821	Phường 8	30
10805	Xã Nhơn Bình	30
10806	Xã Phú Thành	30
10822	Phường 9	30
10807	Xã Tân Mỹ	30
10808	Xã Thới Hòa	30
10823	Xã Tân Hội	30
10809	Xã Thiện Mỹ	30
10810	Xã Thuận Thới	30
10815	Xã Xuân Hiệp	30
10824	Xã Tân Hòa	30
10829	Xã Hiếu Phụng	30
10825	Xã Tân Ngãi	30
10826	Xã Trường An	30
10830	Xã Hiếu Thành	30
10832	Xã Quới An	30
10834	Xã Tân An Luông	30
10835	Xã Tân Quới Trung	30
10887	Phường Trưng Nhị	15
10838	Xã Trung Chánh	30
10888	Phường Trưng Trắc	15
10839	Xã Trung Hiếu	30
10840	Xã Trung Hiệp	30
10841	Xã Trung Ngãi	30
10842	Xã Trung Nghĩa	30
10890	Xã Bạch Lưu	15
10843	Xã Trung Thành	30
10844	Xã Trung Thành Đông	30
10846	Thị trấn Vũng Liêm	30
10845	Xã Trung Thành Tây	30
10849	Thị trấn Gia Khánh	15
10850	Thị trấn Hương Canh	15
10851	Xã Hương Sơn	15
10852	Xã Phú Xuân	15
10853	Xã Quất Lưu	15
10854	Xã Sơn Lôi	15
10855	Xã Tam Hợp	15
10857	Thị trấn Thanh Lãng	15
10858	Xã Thiện Kế	15
10863	Xã Đình Chu	15
10864	Xã Hợp Lý	15
10865	Thị trấn Hoa Sơn	15
10882	Phường Hùng Vương	15
10883	Xã Nam Viêm	15
10866	Thị trấn Lập Thạch	15
10895	Xã Đôn Nhân	15
10867	Xã Liễn Sơn	15
10869	Xã Ngọc Mỹ	15
10870	Xã Quang Sơn	15
10871	Xã Sơn Đông	15
10873	Xã Thái Hòa	15
10874	Xã Tiên Lữ	15
10875	Xã Triệu Đề	15
10876	Xã Văn Quán	15
10877	Xã Vân Trục	15
10878	Xã Xuân Hòa	15
10879	Xã Xuân Lôi	15
10880	Xã Cao Minh	15
10881	Phường Đồng Xuân	15
10885	Phường Phúc Thắng	15
10886	Xã Tiền Châu	15
10889	Phường Xuân Hoà	15
10891	Xã Cao Phong	15
10904	Thị trấn Tam Sơn	15
10892	Xã Đồng Quế	15
10893	Xã Đồng Thịnh	15
10894	Xã Đức Bác	15
10913	Thị trấn Tam Đảo	15
10896	Xã Hải Lựu	15
10930	Xã Bồ Sao	15
10898	Xã Nhạo Sơn	15
10900	Xã Như Thụy	15
10901	Xã Phương Khoan	15
10902	Xã Quang Yên	15
10903	Xã Tứ Yên	15
10905	Xã Tân Lập	15
10907	Xã Bồ Lý	15
10932	Xã Cao Đại	15
10910	Xã Hồ Sơn	15
10912	Xã Minh Quang	15
10915	Xã Yên Dương	15
10916	Xã An Hòa	15
10917	Xã Đạo Tú	15
10918	Xã Đồng Tĩnh	15
10919	Xã Duy Phiên	15
10920	Thị trấn Hợp Hòa	15
10921	Xã Hợp Thịnh	15
10922	Xã Hoàng Đan	15
10923	Xã Hoàng Hoa	15
10924	Xã Hoàng Lâu	15
10925	Xã Hướng Đạo	15
10927	Xã Thanh Vân	15
10928	Xã Vân Hội	15
10929	Xã An Tường	15
10931	Xã Bình Dương	15
10933	Xã Chấn Hưng	15
10934	Xã Đại Đồng	15
10935	Xã Kim Xá	15
10937	Xã Lý Nhân	15
10936	Xã Lũng Hoà	15
10938	Xã Nghĩa Hưng	15
10939	Xã Ngũ Kiên	15
10952	Xã Vĩnh Sơn	15
10940	Xã Phú Đa	15
10941	Xã Phú Thịnh	15
10942	Thị trấn Tứ Trưng	15
10953	Xã Vĩnh Thịnh	15
10943	Xã Tam Phúc	15
10944	Xã Tân Cương	15
10945	Xã Tân Tiến	15
10946	Thị trấn Thổ Tang	15
10947	Xã Thượng Trưng	15
10948	Xã Tuân Chính	15
10949	Xã Vân Xuân	15
10950	Xã Việt Xuân	15
10951	Xã Vĩnh Ninh	15
10954	Thị trấn Vĩnh Tường	15
10955	Xã Vũ Di	15
10956	Xã Yên Bình	15
10957	Xã Yên Lập	15
10959	Phường Đống Đa	15
10960	Phường Đồng Tâm	15
10958	Xã Định Trung	15
10961	Phường Hội Hợp	15
10962	Phường Khai Quang	15
10963	Phường Liên Bảo	15
10964	Phường Ngô Quyền	15
10965	Xã Thanh Trù	15
10967	Xã Bình Định	15
10970	Xã Đồng Văn	15
10971	Xã Hồng Châu	15
10972	Xã Hồng Phương	15
10987	Xã Khai Trung	10
10988	Xã Khánh Hoà	10
10973	Xã Liên Châu	15
10974	Xã Nguyệt Đức	15
10976	Xã Tam Hồng	15
10978	Xã Trung Kiên	15
10979	Xã Trung Nguyên	15
10980	Xã Văn Tiến	15
11026	Phường Pú Trạng	10
10981	Xã Yên Đồng	15
11027	Phường Tân An	10
11029	Xã Bản Công	10
11030	Xã Bản Mù	10
10982	Thị trấn Yên Lạc	15
10983	Xã Yên Phương	15
10984	Xã An Lạc	10
10985	Xã An Phú	10
10986	Xã Động Quan	10
11037	Thị trấn Trạm Tấu (Thị trấn )	10
10989	Xã Khánh Thiện	10
10990	Xã Lâm Thượng	10
10991	Xã Liễu Đô	10
11038	Xã Trạm Tấu (Xã)	10
11039	Xã Túc Đán	10
11040	Xã Xà Hồ	10
10992	Xã Mai Sơn	10
10993	Xã Minh Chuẩn	10
10998	Xã Phúc Lợi	10
10999	Xã Tân Lập	10
11000	Xã Tân Lĩnh	10
11001	Xã Tân Phượng	10
11002	Xã Tô Mậu	10
11003	Xã Trúc Lâu	10
11004	Xã Trung Tâm	10
11005	Xã Vĩnh Lạc	10
11006	Xã Yên Thắng	10
11008	Xã Cao Phạ	10
11009	Xã Chế Cu Nha	10
11010	Xã Chế Tạo	10
11011	Xã Dế Su Phình	10
11014	Xã Kim Nọi	10
11015	Xã La Pán Tẩn	10
11016	Xã Lao Chải	10
11017	Xã Mồ Dề	10
11018	Thị trấn Mù Căng Chải	10
11054	Xã Minh Tiến	10
11023	Xã Nghĩa An	10
11064	Xã Bình Thuận	10
11065	Xã Cát Thịnh	10
11066	Xã Chấn Thịnh	10
11067	Xã Đại Lịch	10
11024	Xã Nghĩa Lợi	10
11025	Xã Nghĩa Phúc	10
11041	Xã Bảo Hưng	10
11042	Xã Báo Đáp	10
11043	Thị trấn Cổ Phúc	10
11044	Xã Cường Thịnh	10
11091	Xã Thanh Lương	10
11092	Xã Thượng Bằng La	10
11093	Xã Tú Lệ	10
11094	Xã An Bình	10
11095	Xã An Thịnh	10
11097	Xã Châu Quế Thượng	10
11045	Xã Đào Thịnh	10
11046	Xã Hồng Ca	10
11047	Xã Hòa Cuông	10
11048	Xã Hưng Khánh	10
11049	Xã Hưng Thịnh	10
11050	Xã Kiên Thành	10
11051	Xã Lương Thịnh	10
11052	Xã Minh Quán	10
11055	Xã Nga Quán	10
11124	Phường Hồng Hà	10
11057	Xã Tân Đồng	10
11058	Xã Vân Hội	10
11059	Xã Việt Cường	10
11060	Xã Việt Hồng	10
11062	Xã Y Can	10
11063	Xã An Lương	10
11068	Xã Đồng Khê	10
11069	Xã Gia Hội	10
11070	Xã Hạnh Sơn	10
11074	Xã Nậm Mười	10
11075	Xã Nghĩa Sơn	10
11087	Xã Suối Quyền	10
11088	Xã Sùng Đô	10
11090	Xã Thạch Lương	10
11098	Xã Đại Phác	10
11099	Xã Đại Sơn	10
11101	Xã Đông Cuông	10
11105	Thị trấn Mậu A	10
11127	Phường Minh Tân	10
11114	Xã Viễn Sơn	10
11115	Xã Xuân ái	10
11117	Xã Yên Hợp	10
11118	Xã Yên Hưng	10
11119	Xã Yên Phú	10
11121	Xã Âu Lâu	10
11122	Phường Đồng Tâm	10
11123	Xã Giới Phiên	10
11125	Phường Hợp Minh	10
11126	Xã Minh Bảo	10
11128	Phường Nam Cường	10
11129	Phường Nguyễn Phúc	10
11131	Xã Phúc Lộc	10
11132	Xã Tân Thịnh	10
11135	Xã Văn Tiến	10
11136	Phường Yên Ninh	10
11137	Phường Yên Thịnh	10
11138	Xã Bạch Hà	10
11139	Xã Bảo ái	10
11140	Xã Cảm Ân	10
11141	Xã Cảm Nhân	10
11142	Xã Đại Đồng	10
11143	Xã Đại Minh	10
11144	Xã Hán Đà	10
11146	Xã Mông Sơn	10
11147	Xã Ngọc Chấn	10
11148	Xã Phú Thịnh	10
11149	Xã Phúc An	10
11150	Xã Phúc Ninh	10
11151	Xã Tân Hương	10
11152	Xã Tân Nguyên	10
11153	Xã Thịnh Hưng	10
11154	Thị trấn Thác Bà	10
11155	Xã Tích Cốc	10
11156	Xã Văn Lãng	10
11157	Xã Vĩnh Kiên	10
11158	Xã Vũ Linh	10
11159	Xã Xuân Lai	10
11160	Xã Xuân Long	10
11161	Thị trấn Yên Bình (Thị trấn )	10
11162	Xã Yên Bình (Xã)	10
11163	Xã Yên Thành	10
11165	\N	8
11201	Phường Cầu Mây	10
11202	Phường Ô Quý Hồ	10
11203	Phường Phan Si Păng	10
11204	Phường Sa Pa	10
11205	Phường Hàm Rồng	10
\.


--
-- TOC entry 5457 (class 0 OID 40600)
-- Dependencies: 317
-- Data for Name: bgmap_province; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bgmap_province (gid, ten_tinh, code, tinh_seo) FROM stdin;
1	An Giang	VN01	an-giang
2	Bắc Ninh	VN02	bac-ninh
3	Cao Bằng	VN03	cao-bang
4	Cà Mau	VN04	ca-mau
5	Gia Lai	VN05	gia-lai
6	Hà Tĩnh	VN06	ha-tinh
7	Hưng Yên	VN07	hung-yen
9	Lai Châu	VN09	lai-chau
10	Lào Cai	VN10	lao-cai
11	Lâm Đồng	VN11	lam-dong
12	Lạng Sơn	VN12	lang-son
13	Nghệ An	VN13	nghe-an
14	Ninh Bình	VN14	ninh-binh
15	Phú Thọ	VN15	phu-tho
16	Quảng Ngãi	VN16	quang-ngai
17	Quảng Ninh	VN17	quang-ninh
18	Quảng Trị	VN18	quang-tri
19	Sơn La	VN19	son-la
20	TP Cần Thơ	VN20	tp-can-tho
21	TP HCM	VN21	tp-hcm
22	TP Huế	VN22	tp-hue
23	TP Hà Nội	VN23	tp-ha-noi
24	TP Hải Phòng	VN24	tp-hai-phong
25	TP Đà Nẵng	VN25	tp-da-nang
26	Thanh Hoá	VN26	thanh-hoa
27	Thái Nguyên	VN27	thai-nguyen
28	Tuyên Quang	VN28	tuyen-quang
29	Tây Ninh	VN29	tay-ninh
30	Vĩnh Long	VN30	vinh-long
31	Điện Biên	VN31	dien-bien
32	Đắk Lắk	VN32	dak-lak
33	Đồng Nai	VN33	dong-nai
34	Đồng Tháp	VN34	dong-thap
8	Khánh Hoà	VN08	khanh-hoa
\.


--
-- TOC entry 5425 (class 0 OID 20296)
-- Dependencies: 285
-- Data for Name: iw_thongsoquantrac; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iw_thongsoquantrac (tskt_id, tskt_ten, tskt_stt, tskt_deletedstatus, tskt_maloaithongso, tskt_nguong_min, tskt_nguong_max, station_id, tskt_nhaplieuthucong, tskt_key, nguon_dulieu) FROM stdin;
3141	Thông số đo mưa	\N	0	RAIN	\N	\N	000397	f	f04e4045-b372-4d0a-addf-ea4d859b521e	vndms.dmc.gov.vn
3142	Thông số đo mưa	\N	0	RAIN	\N	\N	000429	f	e16d3b03-193b-470e-941d-683843dd4e55	vndms.dmc.gov.vn
3143	Thông số đo mưa	\N	0	RAIN	\N	\N	000432	f	602c6b73-0e0e-4740-a5b2-4d5f37d66ae6	vndms.dmc.gov.vn
3144	Thông số đo mưa	\N	0	RAIN	\N	\N	000436	f	8571e5a3-5c57-4f50-958f-37e8ec892fcf	vndms.dmc.gov.vn
3145	Thông số đo mưa	\N	0	RAIN	\N	\N	000437	f	bea0d9f7-cdf8-451b-8dc7-5f5b885184d9	vndms.dmc.gov.vn
3146	Thông số đo mưa	\N	0	RAIN	\N	\N	000442	f	aeb6ef8a-c86b-4e8d-a7f0-0ccde72c9555	vndms.dmc.gov.vn
3147	Thông số đo mưa	\N	0	RAIN	\N	\N	000443	f	e3d7c4c0-60a6-49a4-b202-3a39800200e7	vndms.dmc.gov.vn
3148	Thông số đo mưa	\N	0	RAIN	\N	\N	000445	f	e588143d-e007-4135-9eb7-8a8d8899caac	vndms.dmc.gov.vn
3149	Thông số đo mưa	\N	0	RAIN	\N	\N	000784	f	053e4709-9db7-4b5a-add3-66af04a70195	vndms.dmc.gov.vn
3150	Thông số đo mưa	\N	0	RAIN	\N	\N	000854	f	1914de63-d578-4d5e-9d92-1781f26356c2	vndms.dmc.gov.vn
3151	Thông số đo mưa	\N	0	RAIN	\N	\N	001164	f	603f99e7-dcd3-449f-9951-e3c5cdf43187	vndms.dmc.gov.vn
3152	Thông số đo mưa	\N	0	RAIN	\N	\N	001191	f	d6619307-287e-430c-bb9f-684ff9bb2195	vndms.dmc.gov.vn
3153	Thông số đo mưa	\N	0	RAIN	\N	\N	001194	f	d3e62737-6516-4d09-b1df-6db10142c784	vndms.dmc.gov.vn
3154	Thông số đo mưa	\N	0	RAIN	\N	\N	001201	f	2b39892c-eb4a-44a4-811b-3d12de228f0d	vndms.dmc.gov.vn
3155	Thông số đo mưa	\N	0	RAIN	\N	\N	001204	f	d851aede-35c1-40f5-ad72-3c267bd130d5	vndms.dmc.gov.vn
3156	Thông số đo mưa	\N	0	RAIN	\N	\N	001205	f	980c6a63-2ffa-492f-a0bb-281b13456a64	vndms.dmc.gov.vn
3157	Thông số đo mưa	\N	0	RAIN	\N	\N	001211	f	f09da915-bf2e-496c-9a7c-0ccc005b2ff1	vndms.dmc.gov.vn
3158	Thông số đo mưa	\N	0	RAIN	\N	\N	001753	f	7ec45366-8aeb-47d2-888c-2fdfbdd6eac9	vndms.dmc.gov.vn
3159	Thông số đo mưa	\N	0	RAIN	\N	\N	001760	f	08058799-df30-4c17-bccd-f5ded1a2f80e	vndms.dmc.gov.vn
3160	Thông số đo mưa	\N	0	RAIN	\N	\N	001761	f	cbc965eb-0fae-4fa8-bd73-1eb28911adad	vndms.dmc.gov.vn
3161	Thông số đo mưa	\N	0	RAIN	\N	\N	001836	f	27cc6e33-7cc9-4003-b47d-b43c7e5f1300	vndms.dmc.gov.vn
3162	Thông số đo mưa	\N	0	RAIN	\N	\N	001901	f	ed4c6bc6-79e3-45d9-9992-b74e2ef460a5	vndms.dmc.gov.vn
3163	Thông số đo mưa	\N	0	RAIN	\N	\N	001902	f	879550fa-2593-48b0-b643-817cc7511f83	vndms.dmc.gov.vn
3164	Thông số đo mưa	\N	0	RAIN	\N	\N	001904	f	508a55dd-2e4c-45d3-bc5d-c11bfb767c5d	vndms.dmc.gov.vn
3165	Thông số đo mưa	\N	0	RAIN	\N	\N	001905	f	718a17a8-d3a8-41bc-bf1d-b9d4782aaf81	vndms.dmc.gov.vn
3166	Thông số đo mưa	\N	0	RAIN	\N	\N	001906	f	41ea973f-f06c-4e27-94aa-69c5f7483094	vndms.dmc.gov.vn
3167	Thông số đo mưa	\N	0	RAIN	\N	\N	001908	f	22bd766d-6497-4d35-8296-7745b4ebb07f	vndms.dmc.gov.vn
3168	Thông số đo mưa	\N	0	RAIN	\N	\N	001912	f	54abd270-9df2-4822-bcd3-8b934c009668	vndms.dmc.gov.vn
3169	Thông số đo mưa	\N	0	RAIN	\N	\N	002040D4	f	d6d47c3f-4a22-4df9-a548-e49f35afbac5	vndms.dmc.gov.vn
3170	Thông số đo mưa	\N	0	RAIN	\N	\N	002040D7	f	dccec21a-ffbc-48fa-9141-3cef9d543a45	vndms.dmc.gov.vn
3171	Thông số đo mưa	\N	0	RAIN	\N	\N	00204985	f	fef0c00e-68d1-42e1-8b7d-f977023fc6ef	vndms.dmc.gov.vn
3172	Thông số đo mưa	\N	0	RAIN	\N	\N	00204E19	f	b08b3b08-9ac9-4160-b3e3-93e11ec31d01	vndms.dmc.gov.vn
3173	Thông số đo mưa	\N	0	RAIN	\N	\N	00204EAA	f	d4240cad-9496-42fb-832c-372dabad29c1	vndms.dmc.gov.vn
3174	Thông số đo mưa	\N	0	RAIN	\N	\N	00204EC9	f	57a21b67-7637-41f3-8d73-a3021e40969b	vndms.dmc.gov.vn
3175	Thông số đo mưa	\N	0	RAIN	\N	\N	00205079	f	0d184940-6554-4770-895d-6ce67514d7ae	vndms.dmc.gov.vn
3176	Thông số đo mưa	\N	0	RAIN	\N	\N	002057EE	f	115d575e-1ae8-4e74-8102-1a06ced8b3ec	vndms.dmc.gov.vn
3177	Thông số đo mưa	\N	0	RAIN	\N	\N	002058B7	f	c4d6c1d0-a81b-4598-bc28-f0bfda293ede	vndms.dmc.gov.vn
3178	Thông số đo mưa	\N	0	RAIN	\N	\N	00205E93	f	bedc069e-7b66-4f0c-8cac-d1c02f75041b	vndms.dmc.gov.vn
3179	Thông số đo mưa	\N	0	RAIN	\N	\N	00206240	f	003227fe-f3e3-4a21-8dfc-727e0eb2fad6	vndms.dmc.gov.vn
3180	Thông số đo mưa	\N	0	RAIN	\N	\N	00206242	f	7dd1bc05-9d55-4217-a197-19b1e6ed5020	vndms.dmc.gov.vn
3181	Thông số đo mưa	\N	0	RAIN	\N	\N	00206246	f	5d193334-59b9-4c61-87ad-ebf2c082cac1	vndms.dmc.gov.vn
3182	Thông số đo mưa	\N	0	RAIN	\N	\N	0020624A	f	1d9e9141-b17f-4949-84c1-e4899f162938	vndms.dmc.gov.vn
3183	Thông số đo mưa	\N	0	RAIN	\N	\N	00206253	f	de66c94c-6226-4493-a85c-a88a71e7eafb	vndms.dmc.gov.vn
3184	Thông số đo mưa	\N	0	RAIN	\N	\N	00206255	f	6001ba13-3308-4961-b6f6-73fe4b01d9a6	vndms.dmc.gov.vn
3185	Thông số đo mưa	\N	0	RAIN	\N	\N	0020645B	f	c1471211-e97d-447e-bc19-60f2dc946ec4	vndms.dmc.gov.vn
3186	Thông số đo mưa	\N	0	RAIN	\N	\N	0020645C	f	7a791242-f1fc-4e01-9d03-368c54e18d14	vndms.dmc.gov.vn
3187	Thông số đo mưa	\N	0	RAIN	\N	\N	002068B4	f	baa2876f-2014-4823-9795-fc4e49be1076	vndms.dmc.gov.vn
3188	Thông số đo mưa	\N	0	RAIN	\N	\N	00206A24	f	a538f2bb-5a0d-4025-8a53-2162a1bc70a9	vndms.dmc.gov.vn
3189	Thông số đo mưa	\N	0	RAIN	\N	\N	00206BBB	f	a88a15b7-bd45-4d20-aaa3-41ceefb93b6e	vndms.dmc.gov.vn
3190	Thông số đo mưa	\N	0	RAIN	\N	\N	00206BBF	f	46148001-17b8-4c5e-bc0d-6c5aeb82b8c8	vndms.dmc.gov.vn
3191	Thông số đo mưa	\N	0	RAIN	\N	\N	00208CCD	f	bb5e0164-faeb-4185-af30-43284909c255	vndms.dmc.gov.vn
3192	Thông số đo mưa	\N	0	RAIN	\N	\N	002817	f	59fc2873-124c-4e75-9c3f-95b41bd928cb	vndms.dmc.gov.vn
3193	Thông số đo mưa	\N	0	RAIN	\N	\N	003401	f	d5913058-b8b5-40db-837b-80f7332a73f6	vndms.dmc.gov.vn
3194	Thông số đo mưa	\N	0	RAIN	\N	\N	003402	f	9f66428e-9ead-490c-a0ea-bbaa069f88fe	vndms.dmc.gov.vn
3195	Thông số đo mưa	\N	0	RAIN	\N	\N	003403	f	e03aba98-c0ef-4b62-96bc-58ef62904130	vndms.dmc.gov.vn
3196	Thông số đo mưa	\N	0	RAIN	\N	\N	003420	f	1e37ab94-3a84-4e2f-ac97-e6c545dd5d98	vndms.dmc.gov.vn
3197	Thông số đo mưa	\N	0	RAIN	\N	\N	003422	f	cddd64ac-d600-4223-9c57-f5382b5d8766	vndms.dmc.gov.vn
3198	Thông số đo mưa	\N	0	RAIN	\N	\N	003423	f	70b63905-ba78-43a0-9673-3ff37aff3a6e	vndms.dmc.gov.vn
3199	Thông số đo mưa	\N	0	RAIN	\N	\N	003425	f	47f5d34c-e681-48ea-bad6-ef527681cd7d	vndms.dmc.gov.vn
3200	Thông số đo mưa	\N	0	RAIN	\N	\N	003426	f	715956cc-b317-4db6-bd89-5c50272c00a0	vndms.dmc.gov.vn
3201	Thông số đo mưa	\N	0	RAIN	\N	\N	003570	f	2dc5bff9-c523-467f-bf45-92592505a829	vndms.dmc.gov.vn
3202	Thông số đo mưa	\N	0	RAIN	\N	\N	003643	f	83a6c52b-03db-4741-ab30-8e8ca1696220	vndms.dmc.gov.vn
3203	Thông số đo mưa	\N	0	RAIN	\N	\N	003645	f	3ce9faeb-5216-4a29-9ba0-94c7aca73328	vndms.dmc.gov.vn
3204	Thông số đo mưa	\N	0	RAIN	\N	\N	003647	f	6e15f3f5-2c2b-4741-874d-fb9ae33e6e2d	vndms.dmc.gov.vn
3205	Thông số đo mưa	\N	0	RAIN	\N	\N	003648	f	d6fc7a0c-a86d-4527-a07e-b16b8a5b3e61	vndms.dmc.gov.vn
3206	Thông số đo mưa	\N	0	RAIN	\N	\N	003653	f	8df2e3bc-7918-4e3e-b51a-af554c9f6256	vndms.dmc.gov.vn
3207	Thông số đo mưa	\N	0	RAIN	\N	\N	003685	f	255aee42-6384-4354-8ad8-41b2dfaee56e	vndms.dmc.gov.vn
3208	Thông số đo mưa	\N	0	RAIN	\N	\N	004206	f	6b85afb8-cf2a-4807-bf64-e27933157020	vndms.dmc.gov.vn
3209	Thông số đo mưa	\N	0	RAIN	\N	\N	004236	f	0c05ee9c-5d69-473c-9362-94b0068400e0	vndms.dmc.gov.vn
3210	Thông số đo mưa	\N	0	RAIN	\N	\N	008371	f	6e0c813f-26a8-4554-93c9-a2a673e9a1f3	vndms.dmc.gov.vn
3211	Thông số đo mưa	\N	0	RAIN	\N	\N	009051	f	b7037ef2-64b1-4079-9e61-360315a3f87b	vndms.dmc.gov.vn
3212	Thông số đo mưa	\N	0	RAIN	\N	\N	009053	f	7e374474-6acf-465e-a42c-0fa61d8cc30d	vndms.dmc.gov.vn
3213	Thông số đo mưa	\N	0	RAIN	\N	\N	009054	f	59e9d02e-d7a5-4dbf-bac4-131b754d8ef2	vndms.dmc.gov.vn
3214	Thông số đo mưa	\N	0	RAIN	\N	\N	009057	f	400c2e30-d9b7-44bc-ad50-25b3fc0f2010	vndms.dmc.gov.vn
3215	Thông số đo mưa	\N	0	RAIN	\N	\N	009061	f	8114d9ab-b73e-4bf1-bf61-341e52f0507c	vndms.dmc.gov.vn
3216	Thông số đo mưa	\N	0	RAIN	\N	\N	009062	f	fb5ed89f-9a1b-4e8a-984d-f71879f228c1	vndms.dmc.gov.vn
3217	Thông số đo mưa	\N	0	RAIN	\N	\N	009064	f	5456aabc-0fbf-4a5a-820c-2add71cbd293	vndms.dmc.gov.vn
3218	Thông số đo mưa	\N	0	RAIN	\N	\N	009073	f	508e0524-c75f-4d5f-98c6-41c63b630835	vndms.dmc.gov.vn
3219	Thông số đo mưa	\N	0	RAIN	\N	\N	009075	f	c2ae55b6-35a1-4a69-9892-4fbcd3a2d842	vndms.dmc.gov.vn
3220	Thông số đo mưa	\N	0	RAIN	\N	\N	009083	f	c01b439d-a744-4885-b3ce-6937e4018e8a	vndms.dmc.gov.vn
3221	Thông số đo mưa	\N	0	RAIN	\N	\N	009084	f	8fd8b831-5b01-4e6c-97c4-b61e612a59be	vndms.dmc.gov.vn
3222	Thông số đo mưa	\N	0	RAIN	\N	\N	009087	f	67d46414-8c69-4dad-a148-13db1823b567	vndms.dmc.gov.vn
3223	Thông số đo mưa	\N	0	RAIN	\N	\N	009151	f	5b2fac0a-c45f-4045-be03-f5aa7b013b99	vndms.dmc.gov.vn
3224	Thông số đo mưa	\N	0	RAIN	\N	\N	009153	f	fc81d73a-b521-4303-a804-fc966a0e77f5	vndms.dmc.gov.vn
3225	Thông số đo mưa	\N	0	RAIN	\N	\N	009154	f	a5ed29e6-50a1-4f06-ab8e-cbdc8f6904b7	vndms.dmc.gov.vn
3226	Thông số đo mưa	\N	0	RAIN	\N	\N	009156	f	0736475c-e319-4953-a969-602fc22b06bd	vndms.dmc.gov.vn
3227	Thông số đo mưa	\N	0	RAIN	\N	\N	009162	f	1d4fce39-6643-4dd4-8e5a-c8399816e94c	vndms.dmc.gov.vn
3228	Thông số đo mưa	\N	0	RAIN	\N	\N	012045A2	f	ea4fe515-9794-49be-99b5-166a82ab3f8c	vndms.dmc.gov.vn
3229	Thông số đo mưa	\N	0	RAIN	\N	\N	012045A6	f	5b508a00-3323-44b4-ac3d-48a60e8e6006	vndms.dmc.gov.vn
3230	Thông số đo mưa	\N	0	RAIN	\N	\N	01204995	f	651a71c2-ddcd-4296-90e5-41e4ae1bc61d	vndms.dmc.gov.vn
3231	Thông số đo mưa	\N	0	RAIN	\N	\N	01205769	f	533eb580-18db-4725-ae40-d9e4a3a6d540	vndms.dmc.gov.vn
3232	Thông số đo mưa	\N	0	RAIN	\N	\N	012057C1	f	89be3a42-ed8a-4aba-8c65-10d60e559536	vndms.dmc.gov.vn
3233	Thông số đo mưa	\N	0	RAIN	\N	\N	012057C2	f	c8f1183c-fb4d-4c31-9f4e-c77ff324e25a	vndms.dmc.gov.vn
3234	Thông số đo mưa	\N	0	RAIN	\N	\N	01205902	f	35454e59-b4fe-49cc-9d51-528c9747f5be	vndms.dmc.gov.vn
3235	Thông số đo mưa	\N	0	RAIN	\N	\N	01205A15	f	5ea8e123-7df2-450e-8f17-9a45ab522d34	vndms.dmc.gov.vn
3236	Thông số đo mưa	\N	0	RAIN	\N	\N	01205A1C	f	2079c2c4-6e7e-473f-ac34-b2b8c0a2027d	vndms.dmc.gov.vn
3237	Thông số đo mưa	\N	0	RAIN	\N	\N	01205A21	f	cff298c3-7f8f-4803-ad39-68fd4c746247	vndms.dmc.gov.vn
3238	Thông số đo mưa	\N	0	RAIN	\N	\N	01205A27	f	535eed7f-afb7-4b5b-af80-adaa5155b139	vndms.dmc.gov.vn
3239	Thông số đo mưa	\N	0	RAIN	\N	\N	01205A2B	f	4ad57ba6-458f-48ef-acb2-3a3923d6ef78	vndms.dmc.gov.vn
3240	Thông số đo mưa	\N	0	RAIN	\N	\N	01206192	f	c91d83db-3b01-400f-a86a-7c321c056d70	vndms.dmc.gov.vn
3241	Thông số đo mưa	\N	0	RAIN	\N	\N	0120619B	f	f7a3bcc7-4e5d-4ab0-98e5-569a57585661	vndms.dmc.gov.vn
3242	Thông số đo mưa	\N	0	RAIN	\N	\N	0120619D	f	3844be21-b0d3-4c67-8301-5f15fd68baae	vndms.dmc.gov.vn
3243	Thông số đo mưa	\N	0	RAIN	\N	\N	0120619F	f	754f455d-2245-45cc-acc9-96a217ecc18f	vndms.dmc.gov.vn
3244	Thông số đo mưa	\N	0	RAIN	\N	\N	012061A0	f	7ec81e46-3548-414a-a857-55af5789dfa7	vndms.dmc.gov.vn
3245	Thông số đo mưa	\N	0	RAIN	\N	\N	012061A3	f	213b6a11-d151-45e6-be30-255ba666f760	vndms.dmc.gov.vn
3246	Thông số đo mưa	\N	0	RAIN	\N	\N	012061A4	f	da5d6f8c-1a39-4266-9049-1deb9dc3c66d	vndms.dmc.gov.vn
3247	Thông số đo mưa	\N	0	RAIN	\N	\N	012062C1	f	dec51fb5-60f7-4dca-ae61-062253ed4e0e	vndms.dmc.gov.vn
3248	Thông số đo mưa	\N	0	RAIN	\N	\N	012062D2	f	ff3f60e6-ae34-4fd3-a49b-fe5e0eccf093	vndms.dmc.gov.vn
3249	Thông số đo mưa	\N	0	RAIN	\N	\N	012062D4	f	1ff8ccfd-b2ca-4754-b23f-4decafb999ba	vndms.dmc.gov.vn
3250	Thông số đo mưa	\N	0	RAIN	\N	\N	012062D6	f	8501a4c9-f7fb-43e1-a854-d8998fe24c58	vndms.dmc.gov.vn
3251	Thông số đo mưa	\N	0	RAIN	\N	\N	01206349	f	4cd82de1-a6df-423f-8785-f52eeb2d3305	vndms.dmc.gov.vn
3252	Thông số đo mưa	\N	0	RAIN	\N	\N	01206351	f	d4a15fd8-d768-400d-95ba-3f63db5cbcbd	vndms.dmc.gov.vn
3253	Thông số đo mưa	\N	0	RAIN	\N	\N	01206359	f	0684c361-487f-461a-9791-67d5cca4aa25	vndms.dmc.gov.vn
3254	Thông số đo mưa	\N	0	RAIN	\N	\N	01206366	f	ee96a714-55ee-4609-ba29-f9ca0c9166a8	vndms.dmc.gov.vn
3255	Thông số đo mưa	\N	0	RAIN	\N	\N	0120682C	f	1d9f66be-9982-4c8f-900e-c5312c8f0550	vndms.dmc.gov.vn
3256	Thông số đo mưa	\N	0	RAIN	\N	\N	0120BD3D	f	c87c11b7-1e7b-4f53-8b60-fbf34c651001	vndms.dmc.gov.vn
3257	Thông số đo mưa	\N	0	RAIN	\N	\N	0120BD3E	f	4fa0131d-f7fa-48db-ab5d-7cb64e4d8ba8	vndms.dmc.gov.vn
3258	Thông số đo mưa	\N	0	RAIN	\N	\N	0120BD41	f	67d4968f-da3f-4728-824f-aca027f87ef7	vndms.dmc.gov.vn
3259	Thông số đo mưa	\N	0	RAIN	\N	\N	0120BD43	f	eba26f0f-9461-4bf9-b3e3-0f24dac26792	vndms.dmc.gov.vn
3260	Thông số đo mưa	\N	0	RAIN	\N	\N	0120BD44	f	032fad71-ca67-4a23-9854-b73765a6c126	vndms.dmc.gov.vn
3261	Thông số đo mưa	\N	0	RAIN	\N	\N	0120BD48	f	00e6489f-a54c-4cf9-a821-0e6f3b3db619	vndms.dmc.gov.vn
3262	Thông số đo mưa	\N	0	RAIN	\N	\N	0120BD49	f	5b4c13a8-241e-4e1d-a429-ab4da91e230f	vndms.dmc.gov.vn
3263	Thông số đo mưa	\N	0	RAIN	\N	\N	014513	f	6f4ec344-47b8-41b8-8520-8079a8c90a14	vndms.dmc.gov.vn
3264	Thông số đo mưa	\N	0	RAIN	\N	\N	014516	f	fb32dc76-5d13-4bec-b362-904aea2c2924	vndms.dmc.gov.vn
3265	Thông số đo mưa	\N	0	RAIN	\N	\N	014620	f	d63bc415-0f58-4b9d-b354-4193a1a17654	vndms.dmc.gov.vn
3266	Thông số đo mưa	\N	0	RAIN	\N	\N	014626	f	8a4a80ff-f3ab-40f5-a0ba-0dee1bc17999	vndms.dmc.gov.vn
3267	Thông số đo mưa	\N	0	RAIN	\N	\N	014627	f	66427e0c-15b6-4d49-839d-8f8b056364db	vndms.dmc.gov.vn
3268	Thông số đo mưa	\N	0	RAIN	\N	\N	014692	f	02401618-a08e-4258-8c0f-7be2babc088d	vndms.dmc.gov.vn
3269	Thông số đo mưa	\N	0	RAIN	\N	\N	014693	f	d6dc1b17-fe36-46be-8e92-69d814793294	vndms.dmc.gov.vn
3270	Thông số đo mưa	\N	0	RAIN	\N	\N	014695	f	e2fa207a-497b-48ec-a0b3-0f300635e760	vndms.dmc.gov.vn
3271	Thông số đo mưa	\N	0	RAIN	\N	\N	014697	f	b8d3b33b-85cb-4cba-babf-0c89c0a72bc8	vndms.dmc.gov.vn
3272	Thông số đo mưa	\N	0	RAIN	\N	\N	014698	f	ffb71d47-5650-45da-a276-a745d0c30ad7	vndms.dmc.gov.vn
3273	Thông số đo mưa	\N	0	RAIN	\N	\N	014700	f	4e68ce70-02e4-48ed-9c9a-845041e2dc31	vndms.dmc.gov.vn
3274	Thông số đo mưa	\N	0	RAIN	\N	\N	014701	f	bce68c87-ef6e-4cb1-b46d-298aaf438594	vndms.dmc.gov.vn
3275	Thông số đo mưa	\N	0	RAIN	\N	\N	014702	f	7650e0b1-dafd-4528-8880-a25cf51bcf8e	vndms.dmc.gov.vn
3276	Thông số đo mưa	\N	0	RAIN	\N	\N	014704	f	64494a5e-3c7d-415f-b945-fec31c0f37ff	vndms.dmc.gov.vn
3277	Thông số đo mưa	\N	0	RAIN	\N	\N	014705	f	8b686007-0751-4408-bb75-3f981289f1cd	vndms.dmc.gov.vn
3278	Thông số đo mưa	\N	0	RAIN	\N	\N	019713	f	6117f42a-8129-49e1-8a19-2e1238536720	vndms.dmc.gov.vn
3279	Thông số đo mưa	\N	0	RAIN	\N	\N	021475	f	2c8bdd51-0d39-4a7e-985e-ecafb3bcb0a5	vndms.dmc.gov.vn
3280	Thông số đo mưa	\N	0	RAIN	\N	\N	029752	f	3f66e4f1-40ee-44bf-aa65-4742558fca30	vndms.dmc.gov.vn
3281	Thông số đo mưa	\N	0	RAIN	\N	\N	029757	f	627e743f-2bd4-4184-8d77-6916d506e61f	vndms.dmc.gov.vn
3282	Thông số đo mưa	\N	0	RAIN	\N	\N	029758	f	328459e0-d92f-406e-b305-13b71f94db12	vndms.dmc.gov.vn
3283	Thông số đo mưa	\N	0	RAIN	\N	\N	029912	f	bafcbd19-597c-4c8d-a759-46adff72102f	vndms.dmc.gov.vn
3284	Thông số đo mưa	\N	0	RAIN	\N	\N	029913	f	f1dbf6f2-9e62-4ff4-806a-8d0719911705	vndms.dmc.gov.vn
3285	Thông số đo mưa	\N	0	RAIN	\N	\N	029920	f	9d5bac47-5109-413c-8196-06f64a8db653	vndms.dmc.gov.vn
3286	Thông số đo mưa	\N	0	RAIN	\N	\N	029924	f	ba8bc3db-165d-4a5b-ace8-e82c9ec63248	vndms.dmc.gov.vn
3287	Thông số đo mưa	\N	0	RAIN	\N	\N	029936	f	eff50fa6-f0db-4aab-af0f-0b994e898647	vndms.dmc.gov.vn
3288	Thông số đo mưa	\N	0	RAIN	\N	\N	029964	f	a5f47120-b95c-4f84-bd0a-04f29674e5d8	vndms.dmc.gov.vn
3289	Thông số đo mưa	\N	0	RAIN	\N	\N	029967	f	1232be2d-0e9c-4a7e-bf7d-1d52eb6aaf02	vndms.dmc.gov.vn
3290	Thông số đo mưa	\N	0	RAIN	\N	\N	029971	f	4dd67f45-ea5c-46e8-9b19-3cfcb27780e2	vndms.dmc.gov.vn
3291	Thông số đo mưa	\N	0	RAIN	\N	\N	029994	f	32512590-6e33-433e-9e6c-9803ecb748d2	vndms.dmc.gov.vn
3292	Thông số đo mưa	\N	0	RAIN	\N	\N	030056	f	a0893909-5c91-46e9-97ef-c062c9bc9f7f	vndms.dmc.gov.vn
3293	Thông số đo mưa	\N	0	RAIN	\N	\N	036604	f	ce44c48d-83f6-4298-a92d-4b4757ce02ba	vndms.dmc.gov.vn
3294	Thông số đo mưa	\N	0	RAIN	\N	\N	036605	f	45c964af-53c0-489f-a9dc-e3d7fe7bd7e4	vndms.dmc.gov.vn
3295	Thông số đo mưa	\N	0	RAIN	\N	\N	036606	f	6df48d2b-5fb0-461c-902c-4fa5e75e31d7	vndms.dmc.gov.vn
3296	Thông số đo mưa	\N	0	RAIN	\N	\N	036607	f	8bdf501d-2275-402b-a3ff-2b7dc202d90c	vndms.dmc.gov.vn
3297	Thông số đo mưa	\N	0	RAIN	\N	\N	036608	f	57099026-ff53-44c7-af34-54469a4ddd66	vndms.dmc.gov.vn
3298	Thông số đo mưa	\N	0	RAIN	\N	\N	036615	f	74f10448-b989-49e3-81b8-5ddf011fadfd	vndms.dmc.gov.vn
3299	Thông số đo mưa	\N	0	RAIN	\N	\N	036616	f	3ebd8339-7896-472e-a8fe-0a1018b3bc04	vndms.dmc.gov.vn
3300	Thông số đo mưa	\N	0	RAIN	\N	\N	036617	f	32578c71-90b7-4bdb-9b57-24729c5ca7aa	vndms.dmc.gov.vn
3301	Thông số đo mưa	\N	0	RAIN	\N	\N	036618	f	835720f9-55f6-4a27-a94a-b7129308a0b5	vndms.dmc.gov.vn
3302	Thông số đo mưa	\N	0	RAIN	\N	\N	036619	f	48e0a2d2-9fd4-46da-8602-1b10e5457dda	vndms.dmc.gov.vn
3303	Thông số đo mưa	\N	0	RAIN	\N	\N	036620	f	aab28bb0-3f5a-4a38-8c0e-10e4159ec49e	vndms.dmc.gov.vn
3304	Thông số đo mưa	\N	0	RAIN	\N	\N	036623	f	a1a3ce40-1fd7-4c46-aa99-cfc3f305f561	vndms.dmc.gov.vn
3305	Thông số đo mưa	\N	0	RAIN	\N	\N	039401	f	1a8cfdca-137c-454b-bb91-a6e7f3dddaa8	vndms.dmc.gov.vn
3306	Thông số đo mưa	\N	0	RAIN	\N	\N	039894	f	48461d2f-413f-4996-9545-0f90c23400d9	vndms.dmc.gov.vn
3307	Thông số đo mưa	\N	0	RAIN	\N	\N	040208	f	a761f6c1-ea56-4181-9f78-890872df11f5	vndms.dmc.gov.vn
3308	Thông số đo mưa	\N	0	RAIN	\N	\N	040664	f	7ec84052-2f5d-4980-b49c-e1c4825bc015	vndms.dmc.gov.vn
3309	Thông số đo mưa	\N	0	RAIN	\N	\N	040665	f	fa1480cc-e9c5-4125-a438-14ad240ea3bd	vndms.dmc.gov.vn
3310	Thông số đo mưa	\N	0	RAIN	\N	\N	040667	f	65f75c17-b36b-44bd-965b-884346a58031	vndms.dmc.gov.vn
3311	Thông số đo mưa	\N	0	RAIN	\N	\N	040723	f	bffe4779-9221-475d-bc0a-8979cc8541ed	vndms.dmc.gov.vn
3312	Thông số đo mưa	\N	0	RAIN	\N	\N	040728	f	1f781ec9-649b-478f-aef9-e3c5eeee64b6	vndms.dmc.gov.vn
3313	Thông số đo mưa	\N	0	RAIN	\N	\N	040730	f	ff26b15e-7414-479a-803e-979f805e3461	vndms.dmc.gov.vn
3314	Thông số đo mưa	\N	0	RAIN	\N	\N	040731	f	69eed25f-fc47-44ef-bb96-9203a6afda2e	vndms.dmc.gov.vn
3315	Thông số đo mưa	\N	0	RAIN	\N	\N	040735	f	d6842062-2fb5-43c2-8c8c-d96955228a44	vndms.dmc.gov.vn
3316	Thông số đo mưa	\N	0	RAIN	\N	\N	040738	f	e4b155fa-9c5a-490b-a3fe-159732661e85	vndms.dmc.gov.vn
3317	Thông số đo mưa	\N	0	RAIN	\N	\N	040740	f	96a53b29-4796-40ef-87e8-a093728d7df7	vndms.dmc.gov.vn
3318	Thông số đo mưa	\N	0	RAIN	\N	\N	040742	f	87e6cd17-10f5-4b1d-8e22-24078aee33ed	vndms.dmc.gov.vn
3319	Thông số đo mưa	\N	0	RAIN	\N	\N	040743	f	a2631167-82b5-4b4c-9a62-d861b9be7153	vndms.dmc.gov.vn
3320	Thông số đo mưa	\N	0	RAIN	\N	\N	040752	f	ce8ef5be-d327-454a-b560-a2bd02285681	vndms.dmc.gov.vn
3321	Thông số đo mưa	\N	0	RAIN	\N	\N	040754	f	cb154d5d-f4e6-4fce-a929-7658fb890cf8	vndms.dmc.gov.vn
3322	Thông số đo mưa	\N	0	RAIN	\N	\N	040760	f	d70b57a0-8805-4e0b-bd1d-506a2b2a2ba3	vndms.dmc.gov.vn
3323	Thông số đo mưa	\N	0	RAIN	\N	\N	040761	f	ecdb7957-41f5-4a77-bce1-0ade9d634016	vndms.dmc.gov.vn
3324	Thông số đo mưa	\N	0	RAIN	\N	\N	040763	f	ad31a3c4-d57c-4e10-9731-c6d4f6fbfd05	vndms.dmc.gov.vn
3325	Thông số đo mưa	\N	0	RAIN	\N	\N	040767	f	de1dd3b8-5e2b-4031-b910-94cecad60cbf	vndms.dmc.gov.vn
3326	Thông số đo mưa	\N	0	RAIN	\N	\N	040824	f	c0912881-3e4e-4e3a-8b93-6a4c554033d5	vndms.dmc.gov.vn
3327	Thông số đo mưa	\N	0	RAIN	\N	\N	040826	f	2d95e534-a89c-468c-984a-26be291f03f2	vndms.dmc.gov.vn
3328	Thông số đo mưa	\N	0	RAIN	\N	\N	040830	f	7bb644a0-6236-42d7-8cad-ba3a3835a384	vndms.dmc.gov.vn
3329	Thông số đo mưa	\N	0	RAIN	\N	\N	041031	f	b3bdd613-3da9-400f-a688-47e76c7b6b62	vndms.dmc.gov.vn
3330	Thông số đo mưa	\N	0	RAIN	\N	\N	041039	f	0b465828-2eaf-446b-bfd5-9fd93e6b556a	vndms.dmc.gov.vn
3331	Thông số đo mưa	\N	0	RAIN	\N	\N	041564	f	79cbf46d-c259-470c-93e9-dce8d7b517eb	vndms.dmc.gov.vn
3332	Thông số đo mưa	\N	0	RAIN	\N	\N	041816	f	d0da811e-c057-4af9-a067-ac48aca66eb7	vndms.dmc.gov.vn
3333	Thông số đo mưa	\N	0	RAIN	\N	\N	045831	f	9bacfb1c-1208-4574-b5ff-f8f18ba50ad3	vndms.dmc.gov.vn
3334	Thông số đo mưa	\N	0	RAIN	\N	\N	045832	f	bd492122-6428-48c5-ae9c-0381a342164d	vndms.dmc.gov.vn
3335	Thông số đo mưa	\N	0	RAIN	\N	\N	045841	f	5351c64c-0e1c-4ec4-9024-cef11d6cefa2	vndms.dmc.gov.vn
3336	Thông số đo mưa	\N	0	RAIN	\N	\N	046074	f	68ac9e02-8b94-41c9-873f-345e767ffaea	vndms.dmc.gov.vn
3337	Thông số đo mưa	\N	0	RAIN	\N	\N	046082	f	1cd3492a-4d71-4efa-9349-d51713943478	vndms.dmc.gov.vn
3338	Thông số đo mưa	\N	0	RAIN	\N	\N	046091	f	4080501d-856f-41a8-9f78-0aaedf87cbbf	vndms.dmc.gov.vn
3339	Thông số đo mưa	\N	0	RAIN	\N	\N	046102	f	7a5117a2-5387-4b96-a8d1-87a6476ae113	vndms.dmc.gov.vn
3340	Thông số đo mưa	\N	0	RAIN	\N	\N	051307	f	45bbd31d-366d-46fe-8f60-f12f10ee7008	vndms.dmc.gov.vn
3341	Thông số đo mưa	\N	0	RAIN	\N	\N	053990	f	babbe1fc-4b30-4329-afb0-28bc001e2ff8	vndms.dmc.gov.vn
3342	Thông số đo mưa	\N	0	RAIN	\N	\N	053992	f	76ebe8ce-dfb0-4d03-88ce-78f5b3ddebfb	vndms.dmc.gov.vn
3343	Thông số đo mưa	\N	0	RAIN	\N	\N	053993	f	b7d18fff-6101-48eb-aa25-9dc16ae7f0b5	vndms.dmc.gov.vn
3344	Thông số đo mưa	\N	0	RAIN	\N	\N	053994	f	cc2f5732-4b4c-417b-bb57-11713b3d30e0	vndms.dmc.gov.vn
3345	Thông số đo mưa	\N	0	RAIN	\N	\N	053995	f	44b79768-0ecb-446e-aeee-897e0c26f43a	vndms.dmc.gov.vn
3346	Thông số đo mưa	\N	0	RAIN	\N	\N	053997	f	764898d5-8d51-4c04-ba0e-9811e5620d95	vndms.dmc.gov.vn
3347	Thông số đo mưa	\N	0	RAIN	\N	\N	055990	f	3803508e-439e-46bf-a379-3ee01686e6c6	vndms.dmc.gov.vn
3348	Thông số đo mưa	\N	0	RAIN	\N	\N	055991	f	c09be85e-0f63-4592-b73d-28d1b191d755	vndms.dmc.gov.vn
3349	Thông số đo mưa	\N	0	RAIN	\N	\N	061754	f	ebf15174-54ed-41bd-9b85-6ff50fbbf1d0	vndms.dmc.gov.vn
3350	Thông số đo mưa	\N	0	RAIN	\N	\N	061801	f	5958e4ec-b75f-4f8b-9d58-78db54e78ce3	vndms.dmc.gov.vn
3351	Thông số đo mưa	\N	0	RAIN	\N	\N	061817	f	eae7d42c-1978-469e-bf71-fb254930525f	vndms.dmc.gov.vn
3352	Thông số đo mưa	\N	0	RAIN	\N	\N	061824	f	27937276-fbdc-4604-aecb-2de323b39660	vndms.dmc.gov.vn
3353	Thông số đo mưa	\N	0	RAIN	\N	\N	061826	f	af963cd9-3e4b-4f21-968b-f8d6ab80feb3	vndms.dmc.gov.vn
3354	Thông số đo mưa	\N	0	RAIN	\N	\N	061840	f	db7a6391-9dc1-4259-a9d1-cef79df0df81	vndms.dmc.gov.vn
3355	Thông số đo mưa	\N	0	RAIN	\N	\N	061841	f	1796136d-def2-4a7e-8212-81bae7ad3708	vndms.dmc.gov.vn
3356	Thông số đo mưa	\N	0	RAIN	\N	\N	061850	f	4fa51465-d6fd-45ff-aa72-3a8e32b04bc7	vndms.dmc.gov.vn
3357	Thông số đo mưa	\N	0	RAIN	\N	\N	061851	f	f8496ce2-2966-4b49-918d-ea09e76d1516	vndms.dmc.gov.vn
3358	Thông số đo mưa	\N	0	RAIN	\N	\N	061852	f	b1d01071-0d04-4dbf-8120-32972093de8d	vndms.dmc.gov.vn
3359	Thông số đo mưa	\N	0	RAIN	\N	\N	068723	f	6df6333b-6abe-486d-bd3e-130d819cf9ee	vndms.dmc.gov.vn
3360	Thông số đo mưa	\N	0	RAIN	\N	\N	074771	f	6fae9bc4-9111-4493-812a-a05baeda0802	vndms.dmc.gov.vn
3361	Thông số đo mưa	\N	0	RAIN	\N	\N	074772	f	721f4727-1a6a-4624-a64e-ed99c443555a	vndms.dmc.gov.vn
3362	Thông số đo mưa	\N	0	RAIN	\N	\N	074773	f	6bb2bb27-5c0c-4db5-9fc9-a1d4758940d2	vndms.dmc.gov.vn
3363	Thông số đo mưa	\N	0	RAIN	\N	\N	074775	f	8822a8a1-021a-4869-b5c0-69e667c8eb01	vndms.dmc.gov.vn
3364	Thông số đo mưa	\N	0	RAIN	\N	\N	074776	f	c791199b-ccd8-43fa-82ed-4eb56e89a0a1	vndms.dmc.gov.vn
3365	Thông số đo mưa	\N	0	RAIN	\N	\N	074778	f	1a6db580-6619-498e-9934-064f29bf31ca	vndms.dmc.gov.vn
3366	Thông số đo mưa	\N	0	RAIN	\N	\N	074780	f	c4d4be66-16cc-48bb-9c2b-b734d148dbf4	vndms.dmc.gov.vn
3367	Thông số đo mưa	\N	0	RAIN	\N	\N	074781	f	0cbe895e-33ad-4153-a217-9aa5729eef52	vndms.dmc.gov.vn
3368	Thông số đo mưa	\N	0	RAIN	\N	\N	074782	f	53960d4b-e720-46c0-80f0-c2b6b1c75f9e	vndms.dmc.gov.vn
3369	Thông số đo mưa	\N	0	RAIN	\N	\N	075560	f	e468ad11-ed83-4a51-a150-a5c6221e25eb	vndms.dmc.gov.vn
3370	Thông số đo mưa	\N	0	RAIN	\N	\N	075561	f	d291e039-51f3-4ccc-b63c-6ea2de12178c	vndms.dmc.gov.vn
3371	Thông số đo mưa	\N	0	RAIN	\N	\N	075655	f	7d327298-d4ad-4fc6-914d-01f61bd5cf76	vndms.dmc.gov.vn
3372	Thông số đo mưa	\N	0	RAIN	\N	\N	075660	f	9d70ebca-e09a-4cfe-83bf-a01a0a882d83	vndms.dmc.gov.vn
3373	Thông số đo mưa	\N	0	RAIN	\N	\N	075771	f	6e3b961a-93c7-4a92-a285-964042f9deb7	vndms.dmc.gov.vn
3374	Thông số đo mưa	\N	0	RAIN	\N	\N	075772	f	d7f923a9-dd7b-4eb0-ad91-75326d8a5d65	vndms.dmc.gov.vn
3375	Thông số đo mưa	\N	0	RAIN	\N	\N	075778	f	77f66590-6802-4efc-8580-fb55e42bd734	vndms.dmc.gov.vn
3376	Thông số đo mưa	\N	0	RAIN	\N	\N	075787	f	1d8e33c4-70b5-43fb-893c-2190b0c9475a	vndms.dmc.gov.vn
3377	Thông số đo mưa	\N	0	RAIN	\N	\N	076214	f	5aa5d30c-4fed-477d-8e73-a3d578736574	vndms.dmc.gov.vn
3378	Thông số đo mưa	\N	0	RAIN	\N	\N	076216	f	c8d28c37-7f05-49ce-94bd-089459dff17d	vndms.dmc.gov.vn
3379	Thông số đo mưa	\N	0	RAIN	\N	\N	076217	f	78423a7f-273c-4200-895d-9f49a4ec6943	vndms.dmc.gov.vn
3380	Thông số đo mưa	\N	0	RAIN	\N	\N	076218	f	d2e03c6b-d6ec-4ae5-8731-4ac9fd2d1416	vndms.dmc.gov.vn
3381	Thông số đo mưa	\N	0	RAIN	\N	\N	076221	f	fc3e81f1-5696-4c7f-8b6b-98cc88b48c57	vndms.dmc.gov.vn
3382	Thông số đo mưa	\N	0	RAIN	\N	\N	076234	f	6040632c-48e1-4700-a55d-69baa0a7c943	vndms.dmc.gov.vn
3383	Thông số đo mưa	\N	0	RAIN	\N	\N	076240	f	7447a1aa-b81a-4c45-90e1-1468dc12d292	vndms.dmc.gov.vn
3384	Thông số đo mưa	\N	0	RAIN	\N	\N	076241	f	6807322f-8e01-4590-9d73-f3210f6df60b	vndms.dmc.gov.vn
3385	Thông số đo mưa	\N	0	RAIN	\N	\N	076259	f	fa8a9332-4eab-476b-8293-8f939782c898	vndms.dmc.gov.vn
3386	Thông số đo mưa	\N	0	RAIN	\N	\N	079360	f	941dc693-2f36-4bb1-90f4-fb5c9ab56e29	vndms.dmc.gov.vn
3387	Thông số đo mưa	\N	0	RAIN	\N	\N	079361	f	dab721cb-b3c9-44ac-867e-e1a97b739bfa	vndms.dmc.gov.vn
3388	Thông số đo mưa	\N	0	RAIN	\N	\N	079362	f	055f47af-f843-4f5e-ba09-8fc54b6f2279	vndms.dmc.gov.vn
3389	Thông số đo mưa	\N	0	RAIN	\N	\N	079363	f	6573f88c-4a46-43d7-8a9d-faa8a3e59d26	vndms.dmc.gov.vn
3390	Thông số đo mưa	\N	0	RAIN	\N	\N	079364	f	2c236aea-e175-420b-abe8-ba18f0eb4ecb	vndms.dmc.gov.vn
3391	Thông số đo mưa	\N	0	RAIN	\N	\N	079365	f	80c8adf2-147c-499a-ac04-02e7cfd0156c	vndms.dmc.gov.vn
3392	Thông số đo mưa	\N	0	RAIN	\N	\N	079366	f	4a3b8b9b-4aee-4f66-99cd-15162fffeff9	vndms.dmc.gov.vn
3393	Thông số đo mưa	\N	0	RAIN	\N	\N	079367	f	5836c02d-0f88-4332-bc06-a9ee96bccf3f	vndms.dmc.gov.vn
3394	Thông số đo mưa	\N	0	RAIN	\N	\N	079368	f	bf401f4f-bb5f-4aef-9b7f-0661e3c89810	vndms.dmc.gov.vn
3395	Thông số đo mưa	\N	0	RAIN	\N	\N	079369	f	677326e4-d6a5-41f0-a278-b0c1e173d0b9	vndms.dmc.gov.vn
3396	Thông số đo mưa	\N	0	RAIN	\N	\N	082355	f	f4476256-09de-46ae-9e7f-4df5adb5fee0	vndms.dmc.gov.vn
3397	Thông số đo mưa	\N	0	RAIN	\N	\N	086244	f	fe7bad92-3ee3-4918-9171-5d8c82918e26	vndms.dmc.gov.vn
3398	Thông số đo mưa	\N	0	RAIN	\N	\N	091959	f	1447b711-5964-4d81-8a3c-8fb5cd736351	vndms.dmc.gov.vn
3399	Thông số đo mưa	\N	0	RAIN	\N	\N	091960	f	eadfadd9-ff93-44d9-9b59-8f05e00376e5	vndms.dmc.gov.vn
3400	Thông số đo mưa	\N	0	RAIN	\N	\N	091961	f	3c559c5f-a961-4399-a940-176eb1f41d4e	vndms.dmc.gov.vn
3401	Thông số đo mưa	\N	0	RAIN	\N	\N	091962	f	f0de2d29-303d-444b-92fd-8d96cc2757a9	vndms.dmc.gov.vn
3402	Thông số đo mưa	\N	0	RAIN	\N	\N	091963	f	e8fd98d2-666d-42d8-b127-47135fe1b960	vndms.dmc.gov.vn
3403	Thông số đo mưa	\N	0	RAIN	\N	\N	091965	f	49bb51ff-e691-4ec9-9e99-9af44d568df2	vndms.dmc.gov.vn
3404	Thông số đo mưa	\N	0	RAIN	\N	\N	091966	f	4e4f88aa-5916-492b-a651-94fd916accaf	vndms.dmc.gov.vn
3405	Thông số đo mưa	\N	0	RAIN	\N	\N	091967	f	956a3662-96cd-4c6a-bdd9-7fb20a934d40	vndms.dmc.gov.vn
3406	Thông số đo mưa	\N	0	RAIN	\N	\N	091968	f	12b9f78b-d9e3-4ebf-a2a3-15d8dd42d8d1	vndms.dmc.gov.vn
3407	Thông số đo mưa	\N	0	RAIN	\N	\N	092990	f	d0522806-c8d4-4a72-b1b1-28d09259c4ad	vndms.dmc.gov.vn
3408	Thông số đo mưa	\N	0	RAIN	\N	\N	092991	f	d9c9325b-8fbb-4016-ba29-5ae5bb308f18	vndms.dmc.gov.vn
3409	Thông số đo mưa	\N	0	RAIN	\N	\N	092994	f	81d53b85-8723-43f1-a07c-b4b748b693ff	vndms.dmc.gov.vn
3410	Thông số đo mưa	\N	0	RAIN	\N	\N	092995	f	f29cd23d-8ce2-46f5-94ed-3edb513a9783	vndms.dmc.gov.vn
3411	Thông số đo mưa	\N	0	RAIN	\N	\N	092996	f	b2268f65-9877-49e1-a62c-f967a50343b4	vndms.dmc.gov.vn
3412	Thông số đo mưa	\N	0	RAIN	\N	\N	092997	f	5f5fc1b4-3e10-43af-b366-10369ed87d2c	vndms.dmc.gov.vn
3413	Thông số đo mưa	\N	0	RAIN	\N	\N	092998	f	c169cc6f-1d7e-4dab-9d3c-93f41959b2c0	vndms.dmc.gov.vn
3414	Thông số đo mưa	\N	0	RAIN	\N	\N	093004	f	cdc98f52-44a6-40fa-9c0a-0504c99be98d	vndms.dmc.gov.vn
3415	Thông số đo mưa	\N	0	RAIN	\N	\N	093354	f	c806211b-876b-4046-9148-fe38020fd72b	vndms.dmc.gov.vn
3416	Thông số đo mưa	\N	0	RAIN	\N	\N	093920	f	210e500d-9655-4469-89b1-c822f42879af	vndms.dmc.gov.vn
3417	Thông số đo mưa	\N	0	RAIN	\N	\N	095170	f	8ecac714-0206-4be2-92d5-ac5b5710a855	vndms.dmc.gov.vn
3418	Thông số đo mưa	\N	0	RAIN	\N	\N	095171	f	703409f4-ec6f-43a5-ad98-03fe4d0bf9e2	vndms.dmc.gov.vn
3419	Thông số đo mưa	\N	0	RAIN	\N	\N	095172	f	6dac84a1-0fa8-4a16-b959-6bc21b85ce93	vndms.dmc.gov.vn
3420	Thông số đo mưa	\N	0	RAIN	\N	\N	095173	f	bb76a265-b6f1-4938-902f-e90da6f2b4ec	vndms.dmc.gov.vn
3421	Thông số đo mưa	\N	0	RAIN	\N	\N	095174	f	576396d9-6121-48fe-bf9a-876d5a9a4fe7	vndms.dmc.gov.vn
3422	Thông số đo mưa	\N	0	RAIN	\N	\N	095175	f	48c758e9-a3ac-4cde-88f0-32f89abdb07a	vndms.dmc.gov.vn
3423	Thông số đo mưa	\N	0	RAIN	\N	\N	095176	f	2039fd92-0527-470e-ac1a-3b64bfec2855	vndms.dmc.gov.vn
3424	Thông số đo mưa	\N	0	RAIN	\N	\N	095177	f	6907295d-202e-4729-ad0e-792ce22512a0	vndms.dmc.gov.vn
3425	Thông số đo mưa	\N	0	RAIN	\N	\N	095178	f	161b9f9b-a1f0-4507-968a-7e70fb1bbc75	vndms.dmc.gov.vn
3426	Thông số đo mưa	\N	0	RAIN	\N	\N	095179	f	1074e9db-56ba-4846-969f-f2f211eb64e7	vndms.dmc.gov.vn
3427	Thông số đo mưa	\N	0	RAIN	\N	\N	095180	f	da7c6089-add3-4812-b3e8-c0b490d904d6	vndms.dmc.gov.vn
3428	Thông số đo mưa	\N	0	RAIN	\N	\N	095181	f	8d495ab2-8822-4990-9fe4-3b7eee2087a2	vndms.dmc.gov.vn
3429	Thông số đo mưa	\N	0	RAIN	\N	\N	095182	f	e44d9359-bd67-4a9c-a6ee-de447daabf04	vndms.dmc.gov.vn
3430	Thông số đo mưa	\N	0	RAIN	\N	\N	095183	f	b7bcc1f4-d9ae-4439-871b-ed383f1724e6	vndms.dmc.gov.vn
3431	Thông số đo mưa	\N	0	RAIN	\N	\N	095184	f	b4d3b45a-a08f-49c7-abf2-2c19d48b4b21	vndms.dmc.gov.vn
3432	Thông số đo mưa	\N	0	RAIN	\N	\N	1020202401	f	4a93bba9-2b30-456e-8513-acead0c1620c	vndms.dmc.gov.vn
3433	Thông số đo mưa	\N	0	RAIN	\N	\N	1020202701	f	b4d8d601-09f7-4602-8777-fe306219df59	vndms.dmc.gov.vn
3434	Thông số đo mưa	\N	0	RAIN	\N	\N	1020202702	f	d3488000-a780-4e1e-ac55-39a0ed0213d0	vndms.dmc.gov.vn
3435	Thông số đo mưa	\N	0	RAIN	\N	\N	1020202801	f	e72ed747-0a4b-4081-bf37-96d5681a0b8f	vndms.dmc.gov.vn
3436	Thông số đo mưa	\N	0	RAIN	\N	\N	1020202802	f	08cb013d-8334-4795-9824-55ae0b814656	vndms.dmc.gov.vn
3437	Thông số đo mưa	\N	0	RAIN	\N	\N	1020202803	f	6641510d-29b0-4863-9402-2dda59feac19	vndms.dmc.gov.vn
3438	Thông số đo mưa	\N	0	RAIN	\N	\N	1020202804	f	f2ad2d63-5792-4121-964e-d0b3b4605e00	vndms.dmc.gov.vn
3439	Thông số đo mưa	\N	0	RAIN	\N	\N	1020202805	f	d8cee071-7b78-4d43-a3e3-a0e3ff5359b7	vndms.dmc.gov.vn
3440	Thông số đo mưa	\N	0	RAIN	\N	\N	1020202806	f	04f27ab6-a275-465d-86f2-2cd944f259d8	vndms.dmc.gov.vn
3441	Thông số đo mưa	\N	0	RAIN	\N	\N	1020202807	f	aacf4a7b-a4b6-405a-af78-d0bb47e93f92	vndms.dmc.gov.vn
3442	Thông số đo mưa	\N	0	RAIN	\N	\N	1020202901	f	5a86bbf0-63b7-418f-9978-a8dc4af01355	vndms.dmc.gov.vn
3443	Thông số đo mưa	\N	0	RAIN	\N	\N	1020202902	f	b91d206d-c83f-4c7d-823f-d25129f7a914	vndms.dmc.gov.vn
3444	Thông số đo mưa	\N	0	RAIN	\N	\N	1020202903	f	d997cd38-12de-4d01-b1b1-a831a3d010b0	vndms.dmc.gov.vn
3445	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203001	f	a82b3b64-f3c2-4714-b863-cb3e37f80696	vndms.dmc.gov.vn
3446	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203002	f	5c2ebb59-15dd-4b08-b605-29953bdb88f2	vndms.dmc.gov.vn
3447	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203003	f	ab23f025-7a76-4076-b2fa-069d2fceb9e5	vndms.dmc.gov.vn
3448	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203004	f	345f957f-6999-474a-80b4-6113bdd6cea3	vndms.dmc.gov.vn
3449	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203005	f	b48f7592-469e-4a7f-9f88-d14154ac99b2	vndms.dmc.gov.vn
3450	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203006	f	ca1121f5-7183-4756-8392-e9e24771780a	vndms.dmc.gov.vn
3451	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203007	f	054929c5-5e2d-407c-a62c-af14e0db8faf	vndms.dmc.gov.vn
3452	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203008	f	5c9e4550-1570-4608-b2d3-674ebc75c076	vndms.dmc.gov.vn
3453	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203009	f	edb1794d-bc78-4d5d-8706-c3d0c74eaaa5	vndms.dmc.gov.vn
3454	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203010	f	2bd82ed4-8b43-451b-970d-5e6dd189ae07	vndms.dmc.gov.vn
3455	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203011	f	e3f49b3e-29fa-45a4-993f-00a207e11a38	vndms.dmc.gov.vn
3456	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203012	f	8e233a18-2f11-48e4-b82a-a43206432625	vndms.dmc.gov.vn
3457	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203013	f	39748cda-ae57-4b07-a725-f9b1aca3865f	vndms.dmc.gov.vn
3458	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203014	f	aa88ab00-30e5-46e0-a39b-cfd7a69180a7	vndms.dmc.gov.vn
3459	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203101	f	45a7b91f-d17e-4fe8-9a2e-6f1e36f97290	vndms.dmc.gov.vn
3460	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203102	f	667e787e-9740-459a-bc12-648cf2902548	vndms.dmc.gov.vn
3461	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203103	f	4e78873f-c78c-4dc8-8a74-cd29cb61fa7a	vndms.dmc.gov.vn
3462	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203104	f	c4926a82-87fd-4e27-99e8-65a4a80ecbb7	vndms.dmc.gov.vn
3463	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203105	f	9938e169-cd5a-4b0a-bdf4-0a63d3d888f7	vndms.dmc.gov.vn
3464	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203106	f	4ddbb875-f92b-49c0-ad15-483027f00172	vndms.dmc.gov.vn
3465	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203107	f	a76d5132-bcee-4072-9acd-22f24f1139f3	vndms.dmc.gov.vn
3466	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203108	f	c18f01aa-e03b-453b-9811-228c2b26bc1f	vndms.dmc.gov.vn
3467	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203109	f	bdc51241-3802-4932-ba75-2a090a61783e	vndms.dmc.gov.vn
3468	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203110	f	717bb595-46e6-4e04-959f-54019522d58c	vndms.dmc.gov.vn
3469	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203201	f	650eabef-c295-44f3-aa20-5e53371ba91a	vndms.dmc.gov.vn
3470	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203202	f	4218d482-3c4c-40cc-984a-827bc7fd241f	vndms.dmc.gov.vn
3471	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203203	f	f1333fff-b54d-40f1-9591-6a3ac11ce6b4	vndms.dmc.gov.vn
3472	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203204	f	4ff12b9e-3e30-44eb-b8a7-4dd358bd9480	vndms.dmc.gov.vn
3473	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203205	f	9d176077-c4cd-4ec7-83bd-4b7e8efff6b1	vndms.dmc.gov.vn
3474	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203206	f	6eba08fe-0914-436f-9c17-1139bc11b6e5	vndms.dmc.gov.vn
3475	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203207	f	fbe28022-0689-447d-bfce-50767267c7a6	vndms.dmc.gov.vn
3476	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203208	f	d664227a-b858-4004-9668-fd3dfae76e16	vndms.dmc.gov.vn
3477	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203209	f	ca8062ef-b5cb-4bdf-b8d7-ba26235c0e5f	vndms.dmc.gov.vn
3478	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203210	f	57ddd1aa-e33f-406e-a8c8-803ceb15ad19	vndms.dmc.gov.vn
3479	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203211	f	de38c7c0-196b-4b07-93e3-ce327131478b	vndms.dmc.gov.vn
3480	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203301	f	ad84be9b-df72-4ca0-8d40-2f93027fcabf	vndms.dmc.gov.vn
3481	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203302	f	82fbb35d-55d3-4793-8578-d0d3c1d4950d	vndms.dmc.gov.vn
3482	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203303	f	55d0fff1-6f4a-4ca8-8989-18812491c248	vndms.dmc.gov.vn
3483	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203304	f	4593f91a-5b8b-4bd0-8eaa-0dc2f16b87ea	vndms.dmc.gov.vn
3484	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203305	f	146e55d7-04b3-4869-b200-9636d8b906a9	vndms.dmc.gov.vn
3485	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203306	f	99ad5054-1267-42bb-9ff6-5a3e7f5aa078	vndms.dmc.gov.vn
3486	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203401	f	6177da51-d8f0-49ab-a9bf-23b49c386ed2	vndms.dmc.gov.vn
3487	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203402	f	98e20c06-0e36-4419-8710-9d88e2c35cd1	vndms.dmc.gov.vn
3488	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203403	f	43756221-7216-453c-9f27-77eed9e6453c	vndms.dmc.gov.vn
3489	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203404	f	e040742e-20cc-4073-9a46-bee4753e4770	vndms.dmc.gov.vn
3490	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203501	f	3adc4282-6a75-4a3b-81a3-daf14e7c5ee6	vndms.dmc.gov.vn
3491	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203502	f	591e0e7a-2324-4fc9-bd53-202c66d4caa2	vndms.dmc.gov.vn
3492	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203503	f	cde6327e-6c99-4793-9402-a0c6408bebde	vndms.dmc.gov.vn
3493	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203504	f	beadc219-72ff-4920-89dd-3025b1530030	vndms.dmc.gov.vn
3494	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203505	f	f92aec6a-7ccd-4834-a9c4-8ac82a13cdb3	vndms.dmc.gov.vn
3495	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203506	f	40e8fe77-9fcd-40dc-81e9-fa9cbddf4463	vndms.dmc.gov.vn
3496	Thông số đo mưa	\N	0	RAIN	\N	\N	1020203507	f	e220cdbe-c377-4baf-855e-0626691c1d01	vndms.dmc.gov.vn
3497	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404202	f	33f44c72-d1b9-49b1-8847-edffacd457b5	vndms.dmc.gov.vn
3498	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404203	f	4fc8d582-219b-4b65-a3a3-8505e7ff9fdf	vndms.dmc.gov.vn
3499	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404204	f	9d9b8129-9bb3-47f3-a3e0-f40a437c7e07	vndms.dmc.gov.vn
3500	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404205	f	a66d438d-60c7-403d-b9d9-c46f4fd00f4d	vndms.dmc.gov.vn
3501	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404206	f	7e25ccfa-a44a-47f7-9cd7-e213adc1678b	vndms.dmc.gov.vn
3502	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404207	f	e7616737-d987-4182-882f-a61f0555736d	vndms.dmc.gov.vn
3503	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404208	f	57c17d82-d54b-4a6e-b4e9-649f5c25e3dc	vndms.dmc.gov.vn
3504	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404209	f	355725d0-d5c5-4755-b336-c330bc300ea2	vndms.dmc.gov.vn
3505	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404210	f	6cfd68f1-94d5-452f-b946-c9e97af4ed09	vndms.dmc.gov.vn
3506	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404301	f	dbeee630-a5c3-4a5a-a07e-701dfe133d95	vndms.dmc.gov.vn
3507	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404302	f	4c391da8-2084-42c0-9d7f-e2df221fd1c0	vndms.dmc.gov.vn
3508	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404304	f	fa3ce034-925c-4f2a-9695-c4c6fdb989c8	vndms.dmc.gov.vn
3509	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404305	f	a4557fc9-5260-42b5-bf09-e7d79f8db4bd	vndms.dmc.gov.vn
3510	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404306	f	23dc89ea-3e0a-4dc9-999c-40ce07471566	vndms.dmc.gov.vn
3511	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404307	f	5aae0cf2-6ba1-4522-af23-1ce947dc87fc	vndms.dmc.gov.vn
3512	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404308	f	fcaa3315-8f52-4a79-bde4-0cafb33c8274	vndms.dmc.gov.vn
3513	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404309	f	05528744-f7ae-4e44-81b2-ad9aa8ef60a5	vndms.dmc.gov.vn
3514	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404311	f	d52d1e39-9378-428e-a4a9-9df780b5628b	vndms.dmc.gov.vn
3515	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404312	f	38e9f1f1-04fa-4d2d-9ecc-7ffa461f3ae5	vndms.dmc.gov.vn
3516	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404313	f	17857029-2de5-483c-9412-333106c9167e	vndms.dmc.gov.vn
3517	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404314	f	20dad691-344c-404b-99c5-f7e6039c7715	vndms.dmc.gov.vn
3518	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404501	f	1f94a2f9-4cca-4f5a-9967-cfe4892212fe	vndms.dmc.gov.vn
3519	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404502	f	daf2b56a-9c57-4033-ba7f-5224295dfdd2	vndms.dmc.gov.vn
3520	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404503	f	b683c2e3-1ec4-4fcf-b27d-11e9e697a3c2	vndms.dmc.gov.vn
3521	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404504	f	862b2e7f-6120-4bb6-ade4-348642e51034	vndms.dmc.gov.vn
3522	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404505	f	90d6d0b8-95e9-4798-b3a6-3a20aafd55bf	vndms.dmc.gov.vn
3523	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404506	f	b744f591-4fd7-4ede-95de-ec1003402341	vndms.dmc.gov.vn
3524	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404507	f	a1cce59d-2e33-4d64-a470-0787c0f80ae9	vndms.dmc.gov.vn
3525	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404508	f	a18d5610-e77b-4e4d-9fd0-3953c310470d	vndms.dmc.gov.vn
3526	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404509	f	9379eaa0-9b77-46d2-a67a-f4bd66d6cd05	vndms.dmc.gov.vn
3527	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404510	f	29014c9a-4128-402a-95e3-3893492b2105	vndms.dmc.gov.vn
3528	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404511	f	7314a903-0b94-414a-9312-7f40e751ce15	vndms.dmc.gov.vn
3529	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404701	f	4f94a089-2db0-47d1-a3e2-26f7cd6ffd57	vndms.dmc.gov.vn
3530	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404702	f	d99c7b12-4e4f-4f19-be38-5f89af5e84bb	vndms.dmc.gov.vn
3531	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404703	f	2df74649-ca14-4aaf-9554-9eec36e3ae95	vndms.dmc.gov.vn
3532	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404704	f	a525ec4d-a3ba-4ca7-a284-6d5b9591dc91	vndms.dmc.gov.vn
3533	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404705	f	2c549989-9344-4c11-8385-4a8bb6f10187	vndms.dmc.gov.vn
3534	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404706	f	2868f581-285d-4b6e-973d-f4e1f196a623	vndms.dmc.gov.vn
3535	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404801	f	58fae713-c0c0-4d81-9c23-eabc918ecded	vndms.dmc.gov.vn
3536	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404802	f	53d48651-f15b-4fcd-bcea-51403832ddd1	vndms.dmc.gov.vn
3537	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404803	f	f1ec700c-963b-4690-90b4-b89018890c82	vndms.dmc.gov.vn
3538	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404804	f	f083690f-9db0-4388-ba55-ba797536dae1	vndms.dmc.gov.vn
3539	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404901	f	655af6d1-a7b3-41a5-8312-b2dbb1ca8e84	vndms.dmc.gov.vn
3540	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404902	f	61e8d667-151e-4d2f-b807-ceeeb03055f1	vndms.dmc.gov.vn
3541	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404903	f	0db6016b-fe2b-492f-b783-01c809954e8a	vndms.dmc.gov.vn
3542	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404904	f	ffbeaeb6-73dd-482f-940d-7b6603ca2f2e	vndms.dmc.gov.vn
3543	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404905	f	dd8ded5b-1e08-42e9-9da0-aa5f0fc8f7f3	vndms.dmc.gov.vn
3544	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404906	f	6a3ab3eb-75d3-4082-a4cc-eb9a6f442093	vndms.dmc.gov.vn
3545	Thông số đo mưa	\N	0	RAIN	\N	\N	1020404907	f	91924e2a-065f-4cb9-adb5-9136167c38bb	vndms.dmc.gov.vn
3546	Thông số đo mưa	\N	0	RAIN	\N	\N	1020405101	f	e4c46185-92c7-42e7-ab5e-a9fce2f4fa6d	vndms.dmc.gov.vn
3547	Thông số đo mưa	\N	0	RAIN	\N	\N	1020405102	f	3d747946-f456-4b29-bd36-3897bf6a9c44	vndms.dmc.gov.vn
3548	Thông số đo mưa	\N	0	RAIN	\N	\N	1020405103	f	bab4eb41-0108-42c7-9497-b8c88db08e41	vndms.dmc.gov.vn
3549	Thông số đo mưa	\N	0	RAIN	\N	\N	1020405104	f	87eb2c72-5891-4cf9-bacf-e7b4266dd991	vndms.dmc.gov.vn
3550	Thông số đo mưa	\N	0	RAIN	\N	\N	1020405105	f	0ac7fd37-d5d4-4d58-a3a3-a653c25b211c	vndms.dmc.gov.vn
3551	Thông số đo mưa	\N	0	RAIN	\N	\N	1020405201	f	5fe0e67b-c80e-4de4-9872-d440d0ed4cef	vndms.dmc.gov.vn
3552	Thông số đo mưa	\N	0	RAIN	\N	\N	1020405202	f	20424e7d-8b17-480f-8231-93b6fc97823a	vndms.dmc.gov.vn
3553	Thông số đo mưa	\N	0	RAIN	\N	\N	1020405203	f	002ebab9-70d5-42cd-997e-fb5f6c60d0e9	vndms.dmc.gov.vn
3554	Thông số đo mưa	\N	0	RAIN	\N	\N	1020405204	f	f211d49d-4c2a-4c97-9b05-f7387c137b98	vndms.dmc.gov.vn
3555	Thông số đo mưa	\N	0	RAIN	\N	\N	1020405205	f	053950d7-90b7-41c3-b768-fd00c344d585	vndms.dmc.gov.vn
3556	Thông số đo mưa	\N	0	RAIN	\N	\N	1020405301	f	bf383ccb-81e2-4a4a-ae6c-a381e26dce3a	vndms.dmc.gov.vn
3557	Thông số đo mưa	\N	0	RAIN	\N	\N	1020405302	f	d222a73f-cc7e-4512-ac4a-ce318134dbe4	vndms.dmc.gov.vn
3558	Thông số đo mưa	\N	0	RAIN	\N	\N	1020405303	f	b036dccb-8129-41a3-89d1-415f0b5b8fdc	vndms.dmc.gov.vn
3559	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606001	f	bc901a16-f2d1-4e62-bec4-88a49024b9d1	vndms.dmc.gov.vn
3560	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606002	f	70b29cf6-c9a6-4bd6-bbb4-9c2f847eabd5	vndms.dmc.gov.vn
3561	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606003	f	a17236a1-f285-485e-969f-ec1d1179ec39	vndms.dmc.gov.vn
3562	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606004	f	4f25264a-b3a8-4076-8e58-ad05427af0e1	vndms.dmc.gov.vn
3563	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606005	f	d6cf064a-ffef-4629-b829-d2fa9a8ff055	vndms.dmc.gov.vn
3564	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606006	f	87bb0f0a-f382-40f3-a03d-5cc5331d1559	vndms.dmc.gov.vn
3565	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606007	f	a4ea7bf2-a67a-405d-bbfa-9346b1dbab49	vndms.dmc.gov.vn
3566	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606101	f	6d7f5367-0ee9-41dd-a434-9713c3416412	vndms.dmc.gov.vn
3567	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606102	f	4e3557b0-5186-4fec-9b8e-ce7aac0277ea	vndms.dmc.gov.vn
3568	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606103	f	ac1f4864-ff39-45ab-9689-11ad8d256136	vndms.dmc.gov.vn
3569	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606104	f	c3af2f1e-339b-4cab-af6d-c4904fdbfff9	vndms.dmc.gov.vn
3570	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606201	f	b7a4be3c-3dca-457b-a66c-84faf761e5d0	vndms.dmc.gov.vn
3571	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606301	f	d5986467-1eac-4ccb-bafe-279204aebf02	vndms.dmc.gov.vn
3572	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606302	f	ef57d1a6-1d4d-43f7-b62a-d7c5ece5b6aa	vndms.dmc.gov.vn
3573	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606303	f	7153e550-a9c9-466e-b463-24567ac569c5	vndms.dmc.gov.vn
3574	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606304	f	2706eb5d-d70a-4894-b7af-2d2ea8249585	vndms.dmc.gov.vn
3575	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606305	f	cc6af148-573a-44ca-929f-877d512f4570	vndms.dmc.gov.vn
3576	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606401	f	becb3ce9-84bd-416c-9684-4fda1bb70010	vndms.dmc.gov.vn
3577	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606402	f	86d71b91-e4ba-486d-a25d-85c5805bc079	vndms.dmc.gov.vn
3578	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606403	f	9235c0f2-8784-4469-8adb-3865b86ac222	vndms.dmc.gov.vn
3579	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606404	f	eb848a3e-7de5-43cd-8671-4a679fbc9586	vndms.dmc.gov.vn
3580	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606405	f	eb7984b5-348f-4ca7-ae21-ae3f5ce80693	vndms.dmc.gov.vn
3581	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606406	f	8489a108-1838-49cb-8075-bf387f7bd93f	vndms.dmc.gov.vn
3582	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606407	f	1c181add-0a08-4722-9812-88423bf86019	vndms.dmc.gov.vn
3583	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606408	f	d77e8333-f921-47e9-8e50-cd6f6ee347ad	vndms.dmc.gov.vn
3584	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606501	f	69db12e6-4d7b-49ff-91a4-f3436f86cf3f	vndms.dmc.gov.vn
3585	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606601	f	2c3869be-09c1-4298-9b71-a99b5a8fd4df	vndms.dmc.gov.vn
3586	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606602	f	1b498e64-be93-4ffd-8177-658582fd575b	vndms.dmc.gov.vn
3587	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606603	f	691c6bee-17ea-4fc2-a9b7-e0887d3fa6d7	vndms.dmc.gov.vn
3588	Thông số đo mưa	\N	0	RAIN	\N	\N	1020606604	f	2a589c91-92bf-454d-b6fd-94b500a10dcf	vndms.dmc.gov.vn
3589	Thông số đo mưa	\N	0	RAIN	\N	\N	1020807101	f	e8b9a1e3-caad-48e7-b033-34bc467cdab5	vndms.dmc.gov.vn
3590	Thông số đo mưa	\N	0	RAIN	\N	\N	1020807201	f	887b4da7-f2f4-4640-a997-8332cc9b7ec0	vndms.dmc.gov.vn
3591	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008001	f	001b6af9-7778-4fc2-81c8-a96399ba6589	vndms.dmc.gov.vn
3592	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008002	f	d5be87d2-4959-4405-8db1-8824913bcd67	vndms.dmc.gov.vn
3593	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008008	f	d04074aa-39d0-4d82-9943-8d1d64fb7f97	vndms.dmc.gov.vn
3594	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008201	f	e8eb600a-30b8-40a5-9604-6cdda06e75bb	vndms.dmc.gov.vn
3595	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008202	f	43e38d17-a105-454c-83e5-3d4d8b03da9d	vndms.dmc.gov.vn
3596	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008203	f	885b3d87-093a-4ed7-8f30-ca340b5c5a58	vndms.dmc.gov.vn
3597	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008204	f	09dd11bb-b933-4393-a128-e8e0eba6a437	vndms.dmc.gov.vn
3598	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008205	f	05b3b09e-0b13-4de4-ab2e-f70738fa3dc0	vndms.dmc.gov.vn
3599	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008206	f	f77f8167-548e-468e-9e14-591120f7d9bd	vndms.dmc.gov.vn
3600	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008207	f	2c37857d-c8aa-4c20-9572-aa06283b45f7	vndms.dmc.gov.vn
3601	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008209	f	2f423888-eee6-4aad-b223-38f4676eaa3d	vndms.dmc.gov.vn
3602	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008210	f	9cd2eac8-9100-46ce-b9ad-46fba4d944ee	vndms.dmc.gov.vn
3603	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008211	f	115a74a3-ab8c-4cd3-af66-389a969bd1dd	vndms.dmc.gov.vn
3604	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008212	f	1f09edc1-b29c-4a15-8a86-5a8984051cd2	vndms.dmc.gov.vn
3605	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008213	f	fcf3dc97-899b-474a-8057-35292339f862	vndms.dmc.gov.vn
3606	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008214	f	6320d1fb-3f8e-4851-8759-0bae23b21acb	vndms.dmc.gov.vn
3607	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008215	f	85dd3a17-8050-46f8-aa88-1f9be8590bc5	vndms.dmc.gov.vn
3608	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008301	f	b2afb9c4-0804-42ec-ba7e-269a68be5627	vndms.dmc.gov.vn
3609	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008302	f	779a857e-6387-4bd3-a532-29604274bc4d	vndms.dmc.gov.vn
3610	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008303	f	cbe32b70-f1c7-4f3f-a357-ad9e4050f9da	vndms.dmc.gov.vn
3611	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008401	f	f3104360-7674-4955-8b37-8abbf9f81d17	vndms.dmc.gov.vn
3612	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008501	f	d523103f-8a3f-4219-907b-a7e9432d31f2	vndms.dmc.gov.vn
3613	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008502	f	95a4a6e1-1f6a-4b2f-ba20-f56b9f3d0c60	vndms.dmc.gov.vn
3614	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008503	f	1b2c6af8-875d-407c-a3c0-e8b0367225f2	vndms.dmc.gov.vn
3615	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008504	f	00289a4a-bec9-4eb4-b722-2573095ad1f1	vndms.dmc.gov.vn
3616	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008505	f	4690cde9-17e7-4f0b-82d8-6c7f2245b67e	vndms.dmc.gov.vn
3617	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008506	f	4c380349-c4dd-4d1a-859a-32ab46d9de6f	vndms.dmc.gov.vn
3618	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008507	f	96e95ceb-f039-4c86-8eb5-0bf9c54bce0d	vndms.dmc.gov.vn
3619	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008508	f	ec13bc20-aa98-485f-b965-dd38b4655440	vndms.dmc.gov.vn
3620	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008601	f	0085a961-9484-4b63-82a5-1e577bd353f0	vndms.dmc.gov.vn
3621	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008602	f	31eb25e7-785e-49af-93b0-532542dfc0bb	vndms.dmc.gov.vn
3622	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008701	f	75897243-f241-4507-a6fe-fffaac608060	vndms.dmc.gov.vn
3623	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008702	f	a0641394-e4d6-451a-9ff0-75ea89f87bab	vndms.dmc.gov.vn
3624	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008703	f	65caccdb-269a-4f9c-9b80-f4a52a5f49db	vndms.dmc.gov.vn
3625	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008704	f	c152cb64-1820-4c85-b48e-42d82636c0f5	vndms.dmc.gov.vn
3626	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008705	f	62656867-9ef4-4359-9ebb-051e68809fd2	vndms.dmc.gov.vn
3627	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008706	f	952be375-0136-4e99-8642-552082d94854	vndms.dmc.gov.vn
3628	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008707	f	cb00bd50-3db4-42ab-95aa-08232d5e1dfb	vndms.dmc.gov.vn
3629	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008708	f	e37baca8-38ac-4c32-b38e-c495b0df87db	vndms.dmc.gov.vn
3630	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008709	f	9bb661c2-8820-47f0-aefa-4ca75917ae23	vndms.dmc.gov.vn
3631	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008710	f	00638b3f-1711-4961-af61-5f90bc469d63	vndms.dmc.gov.vn
3632	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008711	f	72dec3b1-3960-41a3-b8cb-d9c117c8c1bc	vndms.dmc.gov.vn
3633	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008712	f	ffad4eef-3cd5-402a-9621-924c570f1ac0	vndms.dmc.gov.vn
3634	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008713	f	b765c833-efc5-43f6-8d39-b66a9241a5a0	vndms.dmc.gov.vn
3635	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008714	f	fe807fa4-ea9e-4ecf-aebb-e324897cfa81	vndms.dmc.gov.vn
3636	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008715	f	82061691-8c54-43df-a5b7-aae04f9c4782	vndms.dmc.gov.vn
3637	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008716	f	c9d79984-4d10-4c09-a2c8-3c952709c49c	vndms.dmc.gov.vn
3638	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008801	f	67499efd-97dc-48e2-a4d9-71f45e3ff924	vndms.dmc.gov.vn
3639	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008802	f	91acaa1d-cb58-4bf5-b95f-c8eac959ae53	vndms.dmc.gov.vn
3640	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008803	f	2c2fd598-5f18-4b8b-81d0-6fa83769cb02	vndms.dmc.gov.vn
3641	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008804	f	124ad3ae-e246-4e77-bb2d-01b89dce3285	vndms.dmc.gov.vn
3642	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008805	f	1aea6346-5a68-4e93-9c33-ad32232bc805	vndms.dmc.gov.vn
3643	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008806	f	32287c25-1b99-4025-a058-5cff8f60eecc	vndms.dmc.gov.vn
3644	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008807	f	4917b228-9d6d-4981-8252-bfdc681d5496	vndms.dmc.gov.vn
3645	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008808	f	35889b36-4008-4440-afbf-449c9b307df1	vndms.dmc.gov.vn
3646	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008809	f	3462d641-1dc8-42e2-8e0f-d6a68c861142	vndms.dmc.gov.vn
3647	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008810	f	a7ce63e6-680e-4948-96b6-8cb6aee2beef	vndms.dmc.gov.vn
3648	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008811	f	24405c39-a5c3-4b05-9901-825c2467d6a5	vndms.dmc.gov.vn
3649	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008812	f	c3715497-55ae-4d2d-beac-0dda083c59d1	vndms.dmc.gov.vn
3650	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008813	f	978ea820-6baf-45b6-8a33-a1c6e021ec9f	vndms.dmc.gov.vn
3651	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008814	f	05bf17c7-ca9d-4636-8b88-2892ad191934	vndms.dmc.gov.vn
3652	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008901	f	89752ce6-116b-4f8d-858d-948803cd047b	vndms.dmc.gov.vn
3653	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008902	f	8133587d-9220-4c4b-91ab-06c86be1f97b	vndms.dmc.gov.vn
3654	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008903	f	8fbbefb9-a157-4b4a-8deb-d48856415509	vndms.dmc.gov.vn
3655	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008904	f	4cc27b1a-bc07-4633-8d4a-e37eceb969ed	vndms.dmc.gov.vn
3656	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008905	f	94816ccc-5785-41a8-bd87-c7d19c594ae7	vndms.dmc.gov.vn
3657	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008906	f	aac388bb-293f-4b80-98d6-fff379899b9d	vndms.dmc.gov.vn
3658	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008907	f	c310b0dd-201e-4219-aa90-3728f521fc82	vndms.dmc.gov.vn
3659	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008908	f	03e9a711-c6bd-4a9c-8e75-ebfaa0cb2ee1	vndms.dmc.gov.vn
3660	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008909	f	77b5b436-e862-456a-b951-8e65c27e4a87	vndms.dmc.gov.vn
3661	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008910	f	eb78949b-8f77-41ae-9571-54f201f6878b	vndms.dmc.gov.vn
3662	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008911	f	eceda5e7-da18-4551-8b8c-dc5696be94f8	vndms.dmc.gov.vn
3663	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008912	f	8439fc2b-729c-4000-baf7-d85f41386469	vndms.dmc.gov.vn
3664	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008913	f	7e7c3f9a-4f7b-4ab0-905e-16cc0a15086d	vndms.dmc.gov.vn
3665	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008914	f	adc0dab5-a9b9-47b7-a361-c00ece2ba6d8	vndms.dmc.gov.vn
3666	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008915	f	5b530780-4304-43eb-99e1-27659acd1c92	vndms.dmc.gov.vn
3667	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008916	f	fe8fd924-9738-481b-ab48-5ffd6bacdbf9	vndms.dmc.gov.vn
3668	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008917	f	d382dd6a-e2b3-4f4f-873c-0667a21f07ad	vndms.dmc.gov.vn
3669	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008918	f	6b01dd5c-2ec7-485f-a21e-a24bd44b01a2	vndms.dmc.gov.vn
3670	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008919	f	97c5d8b5-19ca-4017-b485-0fbbd25f657f	vndms.dmc.gov.vn
3671	Thông số đo mưa	\N	0	RAIN	\N	\N	1021008920	f	63440080-ba77-4b19-98d5-ddf6147ce2ca	vndms.dmc.gov.vn
3672	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109401	f	6abcf4e3-3de5-412d-a7fe-8343ee5c846e	vndms.dmc.gov.vn
3673	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109402	f	b059040f-310d-4b4d-8a3f-587064cc7fff	vndms.dmc.gov.vn
3674	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109403	f	e0de4e08-4436-4c44-aacb-52e6f5bda111	vndms.dmc.gov.vn
3675	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109404	f	7de86763-5a60-4d0a-b0fb-911826ec245f	vndms.dmc.gov.vn
3676	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109405	f	07354308-c249-4f6b-b7b1-03f033291bc4	vndms.dmc.gov.vn
3677	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109501	f	e420cb57-57a2-4ce0-9c9c-0a23b73dd25c	vndms.dmc.gov.vn
3678	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109502	f	585e05bf-4175-43fa-8a57-6cb36c1a4bed	vndms.dmc.gov.vn
3679	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109503	f	e80664d4-88a8-4e46-8834-51ca7d5cf015	vndms.dmc.gov.vn
3680	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109601	f	1296f35c-92c3-447a-9942-3c55690e6970	vndms.dmc.gov.vn
3681	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109602	f	c0fa2420-638b-4530-8314-02eaba214dbe	vndms.dmc.gov.vn
3682	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109603	f	263a5d64-54ff-496d-a0d6-d1b19406f778	vndms.dmc.gov.vn
3683	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109701	f	356e3125-a3f8-4e83-97d6-bb3f08e19061	vndms.dmc.gov.vn
3684	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109702	f	69c16002-18cb-4d23-80f3-f9da1d091266	vndms.dmc.gov.vn
3685	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109703	f	e2e5c922-f8a9-4d53-96ec-0033e6f4b8c4	vndms.dmc.gov.vn
3686	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109704	f	dccbb1aa-1fb9-4879-a2e6-a37d08bfc8f7	vndms.dmc.gov.vn
3687	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109705	f	64f5378e-6888-4b8a-96bb-562ccd2a74fd	vndms.dmc.gov.vn
3688	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109706	f	475b3f1e-ac58-4fc4-b829-53a99c4f5924	vndms.dmc.gov.vn
3689	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109707	f	418eec4e-eb28-44d5-9c5a-f9a572565137	vndms.dmc.gov.vn
3690	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109708	f	20dce59c-9fbd-4b62-af96-7e7ee946f7a0	vndms.dmc.gov.vn
3691	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109709	f	b639bfed-0d86-4a37-a08f-9e5c7b4dbde1	vndms.dmc.gov.vn
3692	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109801	f	2e3c46a8-ca32-47c8-ad2e-40f366f1800c	vndms.dmc.gov.vn
3693	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109802	f	73bcbe9d-2748-4d8a-96bc-d2c5c8deaf1b	vndms.dmc.gov.vn
3694	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109803	f	bf7bf74d-c233-4523-8d87-f1744dd69233	vndms.dmc.gov.vn
3695	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109804	f	8c763404-6267-4d05-aae3-49c1b5355c15	vndms.dmc.gov.vn
3696	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109805	f	a735f3cb-c3f6-4fb9-a49d-ed617345b3ae	vndms.dmc.gov.vn
3697	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109806	f	fa8e85f5-776d-4284-9bca-e414e8dcda1c	vndms.dmc.gov.vn
3698	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109807	f	e7df6fcf-b761-415c-8f21-ed777c9b8cfe	vndms.dmc.gov.vn
3699	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109808	f	6e67a537-3954-49d2-a1eb-0f49f9bb2209	vndms.dmc.gov.vn
3700	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109901	f	9b1fafef-d846-4dcc-acf0-18a5748f2917	vndms.dmc.gov.vn
3701	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109902	f	c30896e8-a959-4b16-94a7-9b3779db5744	vndms.dmc.gov.vn
3702	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109903	f	cdca0a97-538b-4723-9edf-d470ec8fbb76	vndms.dmc.gov.vn
3703	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109904	f	928977da-fcc5-455b-886f-3115af8ad46a	vndms.dmc.gov.vn
3704	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109905	f	03f35e57-9bad-492e-9f1a-9aa3674be87a	vndms.dmc.gov.vn
3705	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109906	f	f62e4947-10b9-4474-9a65-5e33b4a7345e	vndms.dmc.gov.vn
3706	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109909	f	bc063f90-0e8c-4848-bf0f-e678124ef724	vndms.dmc.gov.vn
3707	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109910	f	3beec9bd-9b15-43c1-9980-805ed7b23af2	vndms.dmc.gov.vn
3708	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109911	f	f32c9319-87e7-4437-a8df-f0288d2751c4	vndms.dmc.gov.vn
3709	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109912	f	b1d0a41e-6df2-48a5-b3ca-316ac9c84e00	vndms.dmc.gov.vn
3710	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109913	f	2f386684-bcb4-4f23-a3fa-0cf4daed3205	vndms.dmc.gov.vn
3711	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109914	f	63722aad-f470-44a6-a770-40f47995f30d	vndms.dmc.gov.vn
3712	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109915	f	1a005e92-3796-442b-be6f-ea1e23714759	vndms.dmc.gov.vn
3713	Thông số đo mưa	\N	0	RAIN	\N	\N	1021109916	f	82b3ffd4-a4a9-4df7-a127-1f042694b668	vndms.dmc.gov.vn
3714	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110001	f	41069adb-7fa2-407e-a99d-a6e15fe9ae30	vndms.dmc.gov.vn
3715	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110002	f	8bf02f96-f485-48ae-80b3-fc8e4a19840f	vndms.dmc.gov.vn
3716	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110003	f	d0f8b15c-6116-49b4-80ae-45e5712df180	vndms.dmc.gov.vn
3717	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110004	f	956d7441-117f-4c25-8644-58ab6d9d2030	vndms.dmc.gov.vn
3718	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110005	f	ff96d7db-0b7d-4b2f-8bf6-48e6964d5755	vndms.dmc.gov.vn
3719	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110006	f	b78e9adf-c9ef-4783-95c2-73698e638cd5	vndms.dmc.gov.vn
3720	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110007	f	baa0c39b-3735-4730-a96a-ab9c18895ba1	vndms.dmc.gov.vn
3721	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110008	f	4a8d14e8-98a0-4a57-ad71-0d0200b312ee	vndms.dmc.gov.vn
3722	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110009	f	7a3f6993-1427-49fc-a1cf-7edb5fd1b550	vndms.dmc.gov.vn
3723	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110010	f	b68d85be-35f0-4beb-9138-2b9fb9eb12e3	vndms.dmc.gov.vn
3724	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110011	f	e1a4ea71-cada-40dc-b940-176ebf8de728	vndms.dmc.gov.vn
3725	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110101	f	76038bb9-daf9-4d54-b1b5-d0ac6e896cc8	vndms.dmc.gov.vn
3726	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110102	f	a9407a53-aac6-47d8-b696-cce8b479a920	vndms.dmc.gov.vn
3727	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110103	f	d90bbe8c-1cf0-4dde-8dab-3bb1230a8b7e	vndms.dmc.gov.vn
3728	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110104	f	23b89f7b-ac59-4835-93dd-840bede5e09e	vndms.dmc.gov.vn
3729	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110105	f	ba3559b2-3513-4d24-be38-3cc25c439ba7	vndms.dmc.gov.vn
3730	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110106	f	253e603b-6e12-40c8-a801-3dcd16709a25	vndms.dmc.gov.vn
3731	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110107	f	5e4c22ba-3940-46a0-bf01-879e4fa011db	vndms.dmc.gov.vn
3732	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110108	f	8f8433f3-4609-4847-aa83-5a983a19f243	vndms.dmc.gov.vn
3733	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110109	f	37fa9937-efb2-4b34-a018-c6c2e1562289	vndms.dmc.gov.vn
3734	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110110	f	f4f9230e-fd52-435f-81e6-74da0a1d2f85	vndms.dmc.gov.vn
3735	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110111	f	a2f11152-4a04-4262-8502-6221c2faeaf3	vndms.dmc.gov.vn
3736	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110112	f	4a1f78a7-fe1e-4795-aed9-157f70acfb34	vndms.dmc.gov.vn
3737	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110113	f	b3678aa4-3543-4d41-82ec-d365f7330aa2	vndms.dmc.gov.vn
3738	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110114	f	ebdaca3c-f873-44e0-98e7-6f47233e3311	vndms.dmc.gov.vn
3739	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110115	f	8ec2f909-590b-44d1-af3a-3ad58312e6c2	vndms.dmc.gov.vn
3740	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110116	f	924776e1-61fd-4841-a1f4-8468dbf48216	vndms.dmc.gov.vn
3741	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110117	f	5ae5c860-27c9-41d4-8042-7cc8122a1520	vndms.dmc.gov.vn
3742	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110201	f	35c355ed-6888-4e48-8072-8b12c82c19e6	vndms.dmc.gov.vn
3743	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110202	f	a27b068c-f8f7-42a7-ab59-8b528ac92cbc	vndms.dmc.gov.vn
3744	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110203	f	b58e0d1d-f3e3-441f-976c-8f7e696d54d8	vndms.dmc.gov.vn
3745	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110204	f	47f3fc15-5958-4aba-a007-8c469748464c	vndms.dmc.gov.vn
3746	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110205	f	00f40a50-1ede-4a23-964c-f2a6c4bc6ff4	vndms.dmc.gov.vn
3747	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110206	f	f7679d7b-11d0-4873-93c3-68edc7a15b17	vndms.dmc.gov.vn
3748	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110207	f	fd099854-60d9-4f5a-8b9b-03fb02409426	vndms.dmc.gov.vn
3749	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110208	f	cd31945b-bb1d-411d-a3a3-078095280ceb	vndms.dmc.gov.vn
3750	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110209	f	3579fe9b-621a-490e-bccb-d44dea3b7b1f	vndms.dmc.gov.vn
3751	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110301	f	dc6fc171-0900-432a-a2e3-3da208cf1afd	vndms.dmc.gov.vn
3752	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110302	f	a27f397e-4d5a-4547-bc88-a1b6bde3e39b	vndms.dmc.gov.vn
3753	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110303	f	d0fc3a0d-4158-46c5-a97b-a76b761f9479	vndms.dmc.gov.vn
3754	Thông số đo mưa	\N	0	RAIN	\N	\N	1021110304	f	aefa7eab-9a6d-4d05-98cf-856806c6f272	vndms.dmc.gov.vn
3755	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210501	f	657af159-9b99-4545-bec2-3e7303b3d6c9	vndms.dmc.gov.vn
3756	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210601	f	4dde8342-964c-46e8-8d1e-0298a784ad77	vndms.dmc.gov.vn
3757	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210602	f	84f7b2d7-04e7-4ea6-b447-6c19536c7faf	vndms.dmc.gov.vn
3758	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210603	f	ae6f44d9-48e3-4c35-a97d-dab87f176417	vndms.dmc.gov.vn
3759	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210604	f	0b7a8ead-b57c-427e-9b58-73ce5ad6771a	vndms.dmc.gov.vn
3760	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210605	f	d9e42589-84e3-4578-95b0-d3a6aecb5863	vndms.dmc.gov.vn
3761	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210606	f	2d651737-90b5-4da6-9e21-4174e47b37bd	vndms.dmc.gov.vn
3762	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210607	f	987e8576-1eaa-46ac-9c43-9f29a5bae36a	vndms.dmc.gov.vn
3763	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210608	f	ad289bc6-d426-4144-847a-4b0ca4c93ebc	vndms.dmc.gov.vn
3764	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210609	f	ddce6e72-85d4-4835-a0a7-dc576f769399	vndms.dmc.gov.vn
3765	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210702	f	639c3d24-64ef-4178-99da-25d9f0d4ab2c	vndms.dmc.gov.vn
3766	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210703	f	6a1411f7-70aa-408d-8c15-673797b7a0f9	vndms.dmc.gov.vn
3767	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210704	f	6a781659-ecdc-4d5d-95d7-24b091db479d	vndms.dmc.gov.vn
3768	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210705	f	e159da96-0cda-4483-9e0f-dcfe64792dcd	vndms.dmc.gov.vn
3769	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210706	f	0e7294ef-5bb2-42cf-945a-569158723d29	vndms.dmc.gov.vn
3770	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210707	f	87b415c6-c852-432f-bc7c-e539d78a6754	vndms.dmc.gov.vn
3771	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210708	f	e725d54c-dbd9-4f8a-96b4-87496e02ccb6	vndms.dmc.gov.vn
3772	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210709	f	f4ecf602-3678-4531-b424-86fcb777c9ba	vndms.dmc.gov.vn
3773	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210710	f	647599a7-f3e4-4c1d-a6ad-54c83028fbb9	vndms.dmc.gov.vn
3774	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210711	f	b8c32009-f6fe-427c-a334-d39456c31ec9	vndms.dmc.gov.vn
3775	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210712	f	755eacc0-3ed9-4bda-b533-291e04141753	vndms.dmc.gov.vn
3776	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210713	f	af04e454-bcd3-40f3-95ec-22c70a803515	vndms.dmc.gov.vn
3777	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210714	f	b5c33b81-94d5-4f75-adcf-66ac58cc6547	vndms.dmc.gov.vn
3778	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210715	f	43c32a11-363c-45d4-a3d4-1e65184b6253	vndms.dmc.gov.vn
3779	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210716	f	afd904a6-ed5c-4611-83e0-12f2f597c9e8	vndms.dmc.gov.vn
3780	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210717	f	b4399333-d8a1-43ae-b57a-d3d633259822	vndms.dmc.gov.vn
3781	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210801	f	36b1539a-f593-4e85-bae0-97c3343f1de0	vndms.dmc.gov.vn
3782	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210802	f	5a76edf6-7eec-4d4b-8b0e-68f6378fa788	vndms.dmc.gov.vn
3783	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210803	f	9a220f46-400a-4cd6-b018-bd6dad8eb531	vndms.dmc.gov.vn
3784	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210804	f	da839338-dfda-4789-b884-d2e5229548ac	vndms.dmc.gov.vn
3785	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210805	f	1c7df202-71ef-45b3-9476-69c01c3794e6	vndms.dmc.gov.vn
3786	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210806	f	0da1d605-948f-455a-9c93-e6a2ad75c8f2	vndms.dmc.gov.vn
3787	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210807	f	f4f615ea-829d-4d40-9aa0-4fac13819a73	vndms.dmc.gov.vn
3788	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210808	f	0cf82b55-c334-4170-aa1a-f2aa9040af03	vndms.dmc.gov.vn
3789	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210809	f	764c72b8-f98d-4db5-a1fe-a3e83226e3fe	vndms.dmc.gov.vn
3790	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210810	f	5ea60d01-3996-452d-8d36-20ca186651b5	vndms.dmc.gov.vn
3791	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210811	f	76a0fe74-e998-47bd-942f-007f79d76f3b	vndms.dmc.gov.vn
3792	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210812	f	f1c232b3-30c6-4b14-9ee9-20e79f4ba7e7	vndms.dmc.gov.vn
3793	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210813	f	0bfe2995-225f-46b9-81c8-daa2315750f9	vndms.dmc.gov.vn
3794	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210814	f	fceac676-9ff8-4f18-8dc9-82ac02dd1122	vndms.dmc.gov.vn
3795	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210815	f	0a0cef55-8389-45d1-8a19-aeee9b0fe85e	vndms.dmc.gov.vn
3796	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210816	f	04da039f-5fbe-4b2f-8287-7d3a3224a9bf	vndms.dmc.gov.vn
3797	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210817	f	fc6789b1-4f1f-4fbb-b1a2-2e4b355d2597	vndms.dmc.gov.vn
3798	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210818	f	da693563-1a77-4a70-9e6d-508b25a0b130	vndms.dmc.gov.vn
3799	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210819	f	d7011eff-adfe-48bf-b3c4-2eca624f3c3c	vndms.dmc.gov.vn
3800	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210820	f	3dd941f4-4e29-4849-8e15-4c269ab4635a	vndms.dmc.gov.vn
3801	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210821	f	7f428be3-807b-4459-b16f-d471ecb50359	vndms.dmc.gov.vn
3802	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210822	f	3c075b27-2b74-4810-a972-894575275f59	vndms.dmc.gov.vn
3803	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210901	f	c19b0cf4-fb16-4c64-988b-5f51e677ca49	vndms.dmc.gov.vn
3804	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210902	f	42fc8fdd-863e-4bfe-83a7-816735dfda5e	vndms.dmc.gov.vn
3805	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210903	f	a44042b7-53d9-4d94-b41e-1b79016615cf	vndms.dmc.gov.vn
3806	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210904	f	f1789a0b-cfa0-4b84-b07d-a42aead010b0	vndms.dmc.gov.vn
3807	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210905	f	70e9f871-ff08-4bd6-b4fc-7df9b83424a3	vndms.dmc.gov.vn
3808	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210906	f	6b41e392-eba9-4e8b-8147-0f32fc3e0c8a	vndms.dmc.gov.vn
3809	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210907	f	c97903c8-f520-411a-826b-8a9e3de36ed4	vndms.dmc.gov.vn
3810	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210908	f	1c08a176-129c-4219-9081-5cdfa55fa2a3	vndms.dmc.gov.vn
3811	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210909	f	d44d3946-2848-4653-b220-a72a2c6aa46d	vndms.dmc.gov.vn
3812	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210910	f	78ff287d-3273-42a3-96a1-963a6c5f1672	vndms.dmc.gov.vn
3813	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210911	f	470851cb-1467-48fd-b858-21de71373363	vndms.dmc.gov.vn
3814	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210912	f	318a12db-f48d-4f32-976b-d3baed694a44	vndms.dmc.gov.vn
3815	Thông số đo mưa	\N	0	RAIN	\N	\N	1021210913	f	9d1781b2-6a53-49e0-b0cd-60dd44a57838	vndms.dmc.gov.vn
3816	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211001	f	21fa9aa9-08bf-4b1f-abce-948470912c75	vndms.dmc.gov.vn
3817	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211002	f	93f116bd-0dc7-4a34-a1e9-13338253deae	vndms.dmc.gov.vn
3818	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211003	f	fb3ed00b-15a4-4808-87ec-286037d68dec	vndms.dmc.gov.vn
3819	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211004	f	7ac23cc7-96a1-40f4-9a1f-bec3935512cf	vndms.dmc.gov.vn
3820	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211005	f	d8b2b964-23d7-4fbf-a04b-bbf18b9d5a61	vndms.dmc.gov.vn
3821	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211006	f	609d7f7c-2312-4d0b-b0b7-d42122037aa7	vndms.dmc.gov.vn
3822	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211007	f	fb7dad6b-f6b9-4747-a0b7-5b625a01fa59	vndms.dmc.gov.vn
3823	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211008	f	f5fa2cfd-bae9-4af4-87b3-0cddcd22b26e	vndms.dmc.gov.vn
3824	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211101	f	1c07fa77-f86f-49f0-b718-2937a8d93428	vndms.dmc.gov.vn
3825	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211102	f	3ab95178-b7f5-4129-89e5-cd36c8803f7a	vndms.dmc.gov.vn
3826	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211103	f	a107ef6e-7f12-48f2-850d-061ff66938a4	vndms.dmc.gov.vn
3827	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211104	f	4844c386-9638-44c2-911f-fcbe79c165ad	vndms.dmc.gov.vn
3828	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211105	f	8eeb50a6-ad2a-4c09-baf1-72f1e8243f28	vndms.dmc.gov.vn
3829	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211106	f	0876aad1-6f53-4021-9000-bf15e241c0bb	vndms.dmc.gov.vn
3830	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211201	f	9249c3ef-ff3d-4f11-ad4f-d2c676051a8d	vndms.dmc.gov.vn
3831	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211202	f	87325c23-5eff-4f80-a63c-16c33aabc4e0	vndms.dmc.gov.vn
3832	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211203	f	917c3111-d36f-4629-a96d-45c86cbc0c5b	vndms.dmc.gov.vn
3833	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211204	f	1fa09677-483c-490c-a036-b09ddb872ff5	vndms.dmc.gov.vn
3834	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211205	f	0e19f013-464c-4ff7-b938-bf686c887ac1	vndms.dmc.gov.vn
3835	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211206	f	acebb981-3178-4865-b07e-2e38a57e3cd0	vndms.dmc.gov.vn
3836	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211207	f	1c0da10d-0a17-4eaf-ba47-7c4e508ca873	vndms.dmc.gov.vn
3837	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211208	f	6fcf26d6-595d-4c02-a1b8-12e41b582b74	vndms.dmc.gov.vn
3838	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211209	f	bffc2c61-6788-442e-a677-9fad5d1b0b8a	vndms.dmc.gov.vn
3839	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211210	f	1b34cbfd-06c1-4aa2-9035-95ffc27b5eea	vndms.dmc.gov.vn
3840	Thông số đo mưa	\N	0	RAIN	\N	\N	1021211211	f	0333dd28-74e2-4c37-a26c-68b7a08abb97	vndms.dmc.gov.vn
3841	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411601	f	03a95489-bb02-4a88-9f90-cb92065506b2	vndms.dmc.gov.vn
3842	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411602	f	afc92c01-b470-4763-8dd7-c27202bf473c	vndms.dmc.gov.vn
3843	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411801	f	acb4ef6f-4651-4b06-b0d8-e16654017843	vndms.dmc.gov.vn
3844	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411802	f	d5b56c54-afec-4ff4-adc5-78454fcb1181	vndms.dmc.gov.vn
3845	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411803	f	fcacf40a-583a-4360-a50d-e0c8670278ec	vndms.dmc.gov.vn
3846	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411804	f	21c5d15e-702b-430c-8aae-e8729c683e35	vndms.dmc.gov.vn
3847	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411805	f	78e2d90a-917b-4960-8b4f-c34b8db2db5c	vndms.dmc.gov.vn
3848	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411806	f	82ab9277-daa1-4adf-b3df-637134b4fb82	vndms.dmc.gov.vn
3849	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411807	f	e63e1447-1929-475b-9bd0-bae337db61e9	vndms.dmc.gov.vn
3850	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411808	f	a3b414b5-c418-4965-97ed-b0d8a51fb34a	vndms.dmc.gov.vn
3851	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411809	f	4d2122ed-9534-4753-a692-05df87413352	vndms.dmc.gov.vn
3852	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411810	f	ffa33070-9b7d-4b42-b30f-fa43a723abe2	vndms.dmc.gov.vn
3853	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411901	f	7316825d-66c9-4320-a92b-2cb1f9c8cd45	vndms.dmc.gov.vn
3854	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411902	f	b2d33793-a641-4f55-96d5-199805ba5d7d	vndms.dmc.gov.vn
3855	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411903	f	a376a210-1e09-4628-955c-1185acdbe02d	vndms.dmc.gov.vn
3856	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411904	f	37e2e446-5f60-42ab-adc0-f53040204545	vndms.dmc.gov.vn
3857	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411905	f	790bd337-ada6-4301-8d49-d1e89938f908	vndms.dmc.gov.vn
3858	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411906	f	84c4bb21-2488-4645-9fa1-3416b8fb39da	vndms.dmc.gov.vn
3859	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411907	f	e532b401-bc88-403c-8083-f8fca15af453	vndms.dmc.gov.vn
3860	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411908	f	12a48fef-134b-44e3-9c95-7a4fb53a126a	vndms.dmc.gov.vn
3861	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411909	f	4ffcdcc4-b289-4859-9fbc-2dcaadd4c0a9	vndms.dmc.gov.vn
3862	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411910	f	0a120923-b01a-43e1-8adf-a2549e247e99	vndms.dmc.gov.vn
3863	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411911	f	1fec1600-3d30-41cc-bc73-52a037c7a5dd	vndms.dmc.gov.vn
3864	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411912	f	b36d0423-8ba9-4068-a0a0-8372cd44dc3c	vndms.dmc.gov.vn
3865	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411913	f	600f244a-0fa9-4ffb-9aa4-e0f7e48bde6b	vndms.dmc.gov.vn
3866	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411914	f	93c5a518-ff8e-4a93-a52b-a4cf0b1dcdf8	vndms.dmc.gov.vn
3867	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411915	f	acd3a08e-ff7c-4826-b08a-b06e50466669	vndms.dmc.gov.vn
3868	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411916	f	cbc0225f-3c97-4a4f-bc5b-fec4fcefe51c	vndms.dmc.gov.vn
3869	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411917	f	7aced567-2b47-4f83-ad86-85530d8ec0bd	vndms.dmc.gov.vn
3870	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411918	f	1f1d7dbb-5892-4ca3-a7f4-c2815bd75bef	vndms.dmc.gov.vn
3871	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411919	f	e502c41f-460e-4773-8314-f177c28de822	vndms.dmc.gov.vn
3872	Thông số đo mưa	\N	0	RAIN	\N	\N	1021411920	f	d87773bf-86c3-4cda-ba4c-f8720375c220	vndms.dmc.gov.vn
3873	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412001	f	ed1f3e00-975a-4fe0-bd85-85c18ebd32d8	vndms.dmc.gov.vn
3874	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412002	f	4d0fb1f8-f74b-458e-9d16-cba4c49992a1	vndms.dmc.gov.vn
3875	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412003	f	99e84a27-a9a0-48ca-bb69-4f033945029f	vndms.dmc.gov.vn
3876	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412004	f	30a75fa6-969a-4e71-bfdb-b5dcc391aba1	vndms.dmc.gov.vn
3877	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412005	f	aecca9ad-708a-4dd7-833f-f1d9dcf9a2a2	vndms.dmc.gov.vn
3878	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412006	f	f9443a74-4f5e-4849-8e68-029658dfea65	vndms.dmc.gov.vn
3879	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412007	f	c7c2cf95-53ee-4861-8ab6-56b99c76b904	vndms.dmc.gov.vn
3880	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412008	f	524073cc-157d-456b-b85e-d5246c09f196	vndms.dmc.gov.vn
3881	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412009	f	e6ae9d42-9e8f-44f5-b68f-c8c700ca78b4	vndms.dmc.gov.vn
3882	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412010	f	50a7c474-c05d-4d11-9029-8ba1cec7d362	vndms.dmc.gov.vn
3883	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412011	f	ed50dcda-0e3a-4c8f-a167-76695066b808	vndms.dmc.gov.vn
3884	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412012	f	a54f680a-46dd-415f-8349-118c244a6319	vndms.dmc.gov.vn
3885	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412101	f	3bc0c11b-b641-4b7b-b86a-8bf1fb7d1d95	vndms.dmc.gov.vn
3886	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412102	f	e4a4e13d-9440-4450-b329-5e81c067a79e	vndms.dmc.gov.vn
3887	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412103	f	7a00863b-3357-48e4-a3cd-9ac7d1f28dde	vndms.dmc.gov.vn
3888	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412104	f	e6e69dd0-73d6-4520-b445-26173b01dc3e	vndms.dmc.gov.vn
3889	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412105	f	82a52c70-38ef-444e-b61a-56b588ac8521	vndms.dmc.gov.vn
3890	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412106	f	23d0c53c-9e59-4223-8c39-91df4a6c4719	vndms.dmc.gov.vn
3891	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412107	f	862a6b88-4ec8-494b-a08a-b25bf9ccb870	vndms.dmc.gov.vn
3892	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412108	f	eabb1444-9233-4734-a818-cc2789330227	vndms.dmc.gov.vn
3893	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412109	f	a5818a5b-dbea-47b0-93ca-4360d890926c	vndms.dmc.gov.vn
3894	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412201	f	5e271f7f-a3be-4ee8-8974-982be48a54bf	vndms.dmc.gov.vn
3895	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412202	f	4e2034b4-49ed-4c9c-9d0a-187d2bb10da1	vndms.dmc.gov.vn
3896	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412203	f	1c91a615-e491-4d7f-99e3-7c0af369bbc4	vndms.dmc.gov.vn
3897	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412204	f	f89a198e-d95a-4d82-94b4-093f9952781c	vndms.dmc.gov.vn
3898	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412205	f	619af0da-91b1-4577-8d8a-7338b349485d	vndms.dmc.gov.vn
3899	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412206	f	11ce9a9f-1246-4ffd-a28b-b9d890b46337	vndms.dmc.gov.vn
3900	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412207	f	15514235-9f23-4d7a-b397-759893f3ada2	vndms.dmc.gov.vn
3901	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412208	f	e12449fc-82a2-444e-b076-d2511452e660	vndms.dmc.gov.vn
3902	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412209	f	71212730-c3fa-420f-8503-bd2fb14364fd	vndms.dmc.gov.vn
3903	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412210	f	e2cbf013-bba6-4ec9-a26e-4b7a02cde6e0	vndms.dmc.gov.vn
3904	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412301	f	5f9ff58c-49cc-4e14-9954-1d2a20f9afea	vndms.dmc.gov.vn
3905	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412302	f	9091b981-cc0a-4238-b6f4-22cf31163d14	vndms.dmc.gov.vn
3906	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412303	f	763b92f5-a7e8-4ccc-ba65-4cbd181e1be0	vndms.dmc.gov.vn
3907	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412304	f	c248bd97-5e4c-487f-9afc-d7edc2007d5a	vndms.dmc.gov.vn
3908	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412305	f	1c156817-0bde-48b7-9eb7-754ce50b9abd	vndms.dmc.gov.vn
3909	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412306	f	55e53430-22b4-47e9-a613-619f9c272cfc	vndms.dmc.gov.vn
3910	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412307	f	82383510-dc21-46a6-9846-3daa418bd3e9	vndms.dmc.gov.vn
3911	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412308	f	0b85a3ce-052a-4885-a623-fefa421082d4	vndms.dmc.gov.vn
3912	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412309	f	412b9e03-fa9c-404b-ba24-72f96548713c	vndms.dmc.gov.vn
3913	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412310	f	2e91c883-33f2-467e-aa34-16079084e218	vndms.dmc.gov.vn
3914	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412311	f	1bf98a9f-5bfd-4496-be6c-f6315ee5f1b0	vndms.dmc.gov.vn
3915	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412312	f	055396e6-8b5a-4df5-ab0c-93b5bdbb6760	vndms.dmc.gov.vn
3916	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412401	f	e9b3f9a2-9577-427e-b94a-7680d0ca6a28	vndms.dmc.gov.vn
3917	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412402	f	cbc8c816-ee52-47c2-897e-7004635b00ca	vndms.dmc.gov.vn
3918	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412403	f	c857e6fa-49ee-492c-aac3-3be57e078b25	vndms.dmc.gov.vn
3919	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412404	f	7b9b380a-31e7-4bda-904a-149c13e16bf0	vndms.dmc.gov.vn
3920	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412405	f	5f9b95e1-a007-4d7c-bda5-4ea658b40190	vndms.dmc.gov.vn
3921	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412406	f	caea5a64-7db5-49bb-97c8-d79b34dc413f	vndms.dmc.gov.vn
3922	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412501	f	d30d8178-317c-42a9-a646-9a6539cb18c8	vndms.dmc.gov.vn
3923	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412502	f	673f96ab-fe46-44cc-91b3-9334a50c2e22	vndms.dmc.gov.vn
3924	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412503	f	2fa6393a-1cd4-49ec-9214-4c6a9df3fc44	vndms.dmc.gov.vn
3925	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412504	f	7be502ab-8033-4055-93fe-2487a5a63c2b	vndms.dmc.gov.vn
3926	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412505	f	56ec0be3-0bda-4e79-8e44-8ab2d47eb156	vndms.dmc.gov.vn
3927	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412506	f	3ff17f5f-08b4-4d9c-8858-6d721bf224d3	vndms.dmc.gov.vn
3928	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412507	f	bf840a4f-871a-4129-8067-9b1bba35359e	vndms.dmc.gov.vn
3929	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412508	f	235e8719-8c00-4b27-bcce-c0775c614ce4	vndms.dmc.gov.vn
3930	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412509	f	ba0056ad-2946-460f-99e1-598ccc860a5c	vndms.dmc.gov.vn
3931	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412510	f	7a154a08-92b4-4439-94bf-669562c4b697	vndms.dmc.gov.vn
3932	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412511	f	0032b7fc-e52f-45bd-9da9-6f0dc9f6020e	vndms.dmc.gov.vn
3933	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412512	f	fbb1b2c8-0f5f-4ff3-8764-19af2b57a337	vndms.dmc.gov.vn
3934	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412513	f	7b62e184-3a40-4afe-b925-b12d376b7b28	vndms.dmc.gov.vn
3935	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412601	f	857f66df-384d-448b-9af2-9ae09b4d8155	vndms.dmc.gov.vn
3936	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412602	f	9aa7fb07-1011-4939-854f-eabd585f5200	vndms.dmc.gov.vn
3937	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412603	f	b974ef7a-9d83-45d8-958b-b7353cc7c685	vndms.dmc.gov.vn
3938	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412604	f	416c00b6-5d92-42a5-996e-abb4fed66f62	vndms.dmc.gov.vn
3939	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412605	f	d7587371-6ed9-4c69-8c12-9fcdd44ba102	vndms.dmc.gov.vn
3940	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412606	f	fbb085b8-ad00-4e60-89f1-c886ca6745c8	vndms.dmc.gov.vn
3941	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412607	f	70e9c848-2bbd-426a-a535-219108adcb76	vndms.dmc.gov.vn
3942	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412608	f	40c5c10c-dbde-49de-a0f8-35989e601abb	vndms.dmc.gov.vn
3943	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412609	f	32956c49-16da-48e3-9ec0-24770bb8126a	vndms.dmc.gov.vn
3944	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412610	f	59cf22e0-59fd-417c-990f-3a1e0b9996f9	vndms.dmc.gov.vn
3945	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412611	f	c9690524-096c-4bc9-b965-03e81128eaef	vndms.dmc.gov.vn
3946	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412612	f	1f1d4cd1-e3cd-4d9b-a410-4d4917622969	vndms.dmc.gov.vn
3947	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412701	f	7fccd8a6-b2a1-49a7-8936-f07692c97bbb	vndms.dmc.gov.vn
3948	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412702	f	b5ed912a-895c-4370-bca8-b40717bd5ac9	vndms.dmc.gov.vn
3949	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412703	f	177a3990-4d29-4b14-8d2d-483c48e82492	vndms.dmc.gov.vn
3950	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412704	f	acf9d76c-0312-40ee-bb38-38d250d864ee	vndms.dmc.gov.vn
3951	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412705	f	acd6593a-7a3a-4f14-aabd-ad0a92145001	vndms.dmc.gov.vn
3952	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412706	f	f3c59077-341b-4eaa-b3b8-56fc79a527f9	vndms.dmc.gov.vn
3953	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412707	f	84f51a12-8935-4c5c-b8b9-5d43f9e24fc2	vndms.dmc.gov.vn
3954	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412801	f	d4ee7e18-db34-4e07-8726-b6b75f464674	vndms.dmc.gov.vn
3955	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412802	f	16657b23-02f4-46d4-930a-82f8197d37e0	vndms.dmc.gov.vn
3956	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412803	f	8c9b6d39-7cb3-49ab-a69e-d6663b274e5d	vndms.dmc.gov.vn
3957	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412804	f	3ed41ee9-5145-4e5e-a5f5-f5113aa76889	vndms.dmc.gov.vn
3958	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412805	f	fbceaccc-2874-44b7-9492-783c477e8152	vndms.dmc.gov.vn
3959	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412806	f	e73b6d2e-5aca-4a35-a30c-bb19c6a1192b	vndms.dmc.gov.vn
3960	Thông số đo mưa	\N	0	RAIN	\N	\N	1021412807	f	1780b11b-c823-4bbe-ab55-900be9a21380	vndms.dmc.gov.vn
3961	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513201	f	097a80b8-b04c-4388-b5ea-de4f911bd8a9	vndms.dmc.gov.vn
3962	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513202	f	dfe14911-3080-4e4e-a77c-c7bf4e939d67	vndms.dmc.gov.vn
3963	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513203	f	6a3f3df8-c766-4ba5-b70c-5f420b30d94f	vndms.dmc.gov.vn
3964	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513301	f	6b080ba9-0a0d-4f02-bca1-a8a5fe823218	vndms.dmc.gov.vn
3965	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513501	f	ff28c7ba-9ccd-41fe-b90d-964d4ccc9322	vndms.dmc.gov.vn
3966	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513502	f	e15857f6-4901-447c-a2d5-c85e32dd10fd	vndms.dmc.gov.vn
3967	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513503	f	9a8c85fb-d086-4dbc-8890-7b318a20dc33	vndms.dmc.gov.vn
3968	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513504	f	2d8e4f63-f89f-4770-a328-c74d8d09fa83	vndms.dmc.gov.vn
3969	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513505	f	33e47fa5-f73e-4dc9-9ede-91f857724ebc	vndms.dmc.gov.vn
3970	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513506	f	4e0bd789-2adc-42ca-8b10-bba2e87f04c8	vndms.dmc.gov.vn
3971	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513507	f	66576fae-f7a3-4e72-bc70-742aa5e5b317	vndms.dmc.gov.vn
3972	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513508	f	f58ba4be-d4ab-494a-bb05-8075b961a7a9	vndms.dmc.gov.vn
3973	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513509	f	fce5e7b2-c59a-4c4a-895e-4dfa8e1e7769	vndms.dmc.gov.vn
3974	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513510	f	abe97377-6f35-4dc3-9eae-5e6261be90cb	vndms.dmc.gov.vn
3975	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513511	f	f6846c46-a090-4ff3-8c62-f5dbc3775226	vndms.dmc.gov.vn
3976	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513512	f	3411cce6-62ce-4b3d-9f6f-4aace7fed1ce	vndms.dmc.gov.vn
3977	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513513	f	84b4c7c4-95eb-44cd-a01b-669faf87e01f	vndms.dmc.gov.vn
3978	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513514	f	4a99c376-1cc4-43a7-b4e9-4cfca849b647	vndms.dmc.gov.vn
3979	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513515	f	1cfc23d0-5a5c-46b6-a591-1637e7ca7d90	vndms.dmc.gov.vn
3980	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513516	f	b8518325-838f-47fc-9180-01e61c35371d	vndms.dmc.gov.vn
3981	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513517	f	427c0d05-573a-4731-9345-af5fb321f00f	vndms.dmc.gov.vn
3982	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513601	f	61ff3cdc-0b3b-4407-8aee-422a952aec83	vndms.dmc.gov.vn
3983	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513602	f	91c332cf-37ca-414a-aeee-84261ee2b1d6	vndms.dmc.gov.vn
3984	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513603	f	22f636d7-4dae-4d50-8b4b-925825b52e89	vndms.dmc.gov.vn
3985	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513604	f	17a4fc5c-9609-4ecf-95c1-d628932922fb	vndms.dmc.gov.vn
3986	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513605	f	bfcf124d-c72a-41b1-af3c-4e5d77878f40	vndms.dmc.gov.vn
3987	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513606	f	53dcd7ac-3693-475b-91c0-d38549d05868	vndms.dmc.gov.vn
3988	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513607	f	de8e5fe1-9428-4a77-b889-daefd5212977	vndms.dmc.gov.vn
3989	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513701	f	101fa9bf-4819-46c4-8d7b-f72bc8598f8a	vndms.dmc.gov.vn
3990	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513702	f	1366e181-02db-48bd-b53b-d82514a97ed2	vndms.dmc.gov.vn
3991	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513703	f	fb2c7410-73ee-4c96-b60e-e2b4d98d2dc4	vndms.dmc.gov.vn
3992	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513704	f	2835a2c7-0be4-414c-9aa7-85172418a4da	vndms.dmc.gov.vn
3993	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513705	f	9f30e17c-d0d8-4bf3-9819-636958c9a05b	vndms.dmc.gov.vn
3994	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513706	f	8206d3bb-a510-480e-93e6-b0222fba82e9	vndms.dmc.gov.vn
3995	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513707	f	65e8e566-e7b0-4c3f-a089-cbfdc81ff780	vndms.dmc.gov.vn
3996	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513708	f	636e27c0-9d3b-4218-a033-ecbe43bf818c	vndms.dmc.gov.vn
3997	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513709	f	7a2b8f97-bcd3-4585-af25-5a2260d833b7	vndms.dmc.gov.vn
3998	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513710	f	c3b4abee-9400-4446-aa8a-c215739ce790	vndms.dmc.gov.vn
3999	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513711	f	d358d3da-9d8d-4761-8c37-0976e5aff30f	vndms.dmc.gov.vn
4000	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513712	f	4030de8a-96e7-4a60-8931-0a54bf02960d	vndms.dmc.gov.vn
4001	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513713	f	cc1c71bc-d3e1-4bca-bab7-935b8499c8c2	vndms.dmc.gov.vn
4002	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513714	f	ff56380f-1f01-41b2-ae21-11de6d2ffc90	vndms.dmc.gov.vn
4003	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513715	f	0ff2e1b1-36bd-4982-ba10-9f335bc9472a	vndms.dmc.gov.vn
4004	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513716	f	b878e7bd-2d6f-4179-9ccb-b540aeec3f67	vndms.dmc.gov.vn
4005	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513801	f	8a898af3-5899-4bff-a49b-8bd4e1d572ba	vndms.dmc.gov.vn
4006	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513802	f	aca19dae-ef31-4d50-9e52-1161a504c026	vndms.dmc.gov.vn
4007	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513803	f	4912b642-7f5f-45fe-814b-7dad371cade8	vndms.dmc.gov.vn
4008	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513804	f	2bbb7985-5f46-47c3-beb6-ef91e34f1c61	vndms.dmc.gov.vn
4009	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513805	f	13f72ecb-34a7-44cf-b70c-83338ccffd72	vndms.dmc.gov.vn
4010	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513806	f	c0b73963-a2d9-4d6b-8b76-27b978a0421c	vndms.dmc.gov.vn
4011	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513807	f	6507881d-0e5d-4dd9-89b4-bbd7187127f2	vndms.dmc.gov.vn
4012	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513808	f	294ada96-b6f1-41d0-b4a7-1cba8ab679a5	vndms.dmc.gov.vn
4013	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513809	f	60de41af-27d9-41fd-9802-931cb707d911	vndms.dmc.gov.vn
4014	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513810	f	c21db1ba-d448-49c4-9137-808a59a32f79	vndms.dmc.gov.vn
4015	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513811	f	01d32d5d-3ab4-4cec-9aa7-422674f4cc27	vndms.dmc.gov.vn
4016	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513812	f	41b5497a-592e-4bb3-b170-da0b16bac5cf	vndms.dmc.gov.vn
4017	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513901	f	dcb610b2-1300-4cbe-9ddd-0ad629f1b9f0	vndms.dmc.gov.vn
4018	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513902	f	38341fbd-e6f3-4ebd-a965-0f107d7460fd	vndms.dmc.gov.vn
4019	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513903	f	0e4efb61-6de4-4503-b43f-fb55f034710d	vndms.dmc.gov.vn
4020	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513904	f	5236289b-3a63-4209-a6f9-200b50ba57fa	vndms.dmc.gov.vn
4021	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513905	f	12eeb8e1-1a8b-4c0a-9546-cfb5ea47b4f6	vndms.dmc.gov.vn
4022	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513906	f	4110dd3a-59f1-49b0-881d-07b3f8637ecd	vndms.dmc.gov.vn
4023	Thông số đo mưa	\N	0	RAIN	\N	\N	1021513907	f	0b6436a0-d6da-443e-af72-603917b15ef7	vndms.dmc.gov.vn
4024	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514001	f	405ef689-4253-46e2-91a7-835a6af19288	vndms.dmc.gov.vn
4025	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514002	f	3e80ba37-1c25-4674-a54a-d1aac3bd7848	vndms.dmc.gov.vn
4026	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514003	f	460d635e-512a-4096-b0b1-0626b4a779ea	vndms.dmc.gov.vn
4027	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514004	f	d1900bcd-9720-439b-a325-73e4c2e0f098	vndms.dmc.gov.vn
4028	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514005	f	3e1758a8-7fef-4176-bde6-c9fbe221847a	vndms.dmc.gov.vn
4029	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514006	f	7c80d311-2491-4092-8e40-6edb671a4bc7	vndms.dmc.gov.vn
4030	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514007	f	47ed5930-9577-4738-8e7c-8768d27ec578	vndms.dmc.gov.vn
4031	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514008	f	e15a1e83-9d83-4fd4-9a8a-ac946e0f69cf	vndms.dmc.gov.vn
4032	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514009	f	137830ed-f01f-435b-a07f-90ef5da51553	vndms.dmc.gov.vn
4033	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514010	f	f42bd729-1b0d-4312-a5a0-f002f64b7a9f	vndms.dmc.gov.vn
4034	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514011	f	5c85b3e8-c4f4-4fec-9575-f0fae148cad5	vndms.dmc.gov.vn
4035	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514012	f	e27368b1-8b68-4b5e-973b-67be265af497	vndms.dmc.gov.vn
4036	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514013	f	8485abe1-7032-476a-8501-1fb4e1642e37	vndms.dmc.gov.vn
4037	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514014	f	cfb53c20-3963-4aa4-946a-ebb63bc2284d	vndms.dmc.gov.vn
4038	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514015	f	ee8c60d9-eabf-4649-a97c-555a23b8efa4	vndms.dmc.gov.vn
4039	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514016	f	cea799ff-f829-4711-9026-b83a88229bf0	vndms.dmc.gov.vn
4040	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514017	f	61409ddc-46d3-48ac-9729-a848a348fc28	vndms.dmc.gov.vn
4041	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514018	f	849fe832-15a6-4180-a1a6-0b266fda73aa	vndms.dmc.gov.vn
4042	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514019	f	d6f04770-3b86-4d89-9197-54ce0c4512e2	vndms.dmc.gov.vn
4043	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514020	f	20292080-ed09-4b8f-b70e-b1cc4b381292	vndms.dmc.gov.vn
4044	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514021	f	56211816-a5cd-45ee-8506-0b83d2713a19	vndms.dmc.gov.vn
4045	Thông số đo mưa	\N	0	RAIN	\N	\N	1021514101	f	eb511083-cc84-4f05-bc5a-3d30725a1cd3	vndms.dmc.gov.vn
4046	Thông số đo mưa	\N	0	RAIN	\N	\N	1021714801	f	58957404-9df5-4dca-93d2-d26491928a2a	vndms.dmc.gov.vn
4047	Thông số đo mưa	\N	0	RAIN	\N	\N	1021714802	f	0a3dad82-354c-41b3-aaa0-634659d5c059	vndms.dmc.gov.vn
4048	Thông số đo mưa	\N	0	RAIN	\N	\N	1021714803	f	1ff7457b-8642-4388-9fa7-9132ae51fbf2	vndms.dmc.gov.vn
4049	Thông số đo mưa	\N	0	RAIN	\N	\N	1021714804	f	bcce5a37-573f-4e77-a25e-5fdc6f841a10	vndms.dmc.gov.vn
4050	Thông số đo mưa	\N	0	RAIN	\N	\N	1021714805	f	f0262c8f-8bca-4732-bb71-4e8848f1ec54	vndms.dmc.gov.vn
4051	Thông số đo mưa	\N	0	RAIN	\N	\N	1021714806	f	a6cbfb2e-66a9-472c-a204-42109da57a87	vndms.dmc.gov.vn
4052	Thông số đo mưa	\N	0	RAIN	\N	\N	1021714807	f	0ae8ae8f-c107-481a-96ef-9595a571a4fb	vndms.dmc.gov.vn
4053	Thông số đo mưa	\N	0	RAIN	\N	\N	1021714808	f	2521b54d-5929-42dc-ab23-f163a4b83ec5	vndms.dmc.gov.vn
4054	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715001	f	0639190e-740d-4aca-8254-ea68f383eb65	vndms.dmc.gov.vn
4055	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715002	f	538fb6d4-2af5-4278-b0ed-744d76a46489	vndms.dmc.gov.vn
4056	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715003	f	8a63066a-0e40-4922-ac3b-efe1a466f2a1	vndms.dmc.gov.vn
4057	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715004	f	12027b5d-2041-47aa-ac06-4d731af4a227	vndms.dmc.gov.vn
4058	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715005	f	780f6e5a-939a-4ad3-864d-2e3e17b6a9b2	vndms.dmc.gov.vn
4059	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715006	f	54e9f4cb-8e90-4f8f-8d97-0b479b7837f6	vndms.dmc.gov.vn
4060	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715007	f	1729b0a9-185a-4a43-af34-259c4da1a12f	vndms.dmc.gov.vn
4061	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715008	f	c2af1c0d-ce00-4aba-b256-6faf890153f8	vndms.dmc.gov.vn
4062	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715009	f	dd144492-6944-4a7c-9d67-5e86651c9fbe	vndms.dmc.gov.vn
4063	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715010	f	5391a960-62a5-4299-b650-a0446369b975	vndms.dmc.gov.vn
4064	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715011	f	f8f1fd4e-e026-4bd1-a13c-f9b9105d0c49	vndms.dmc.gov.vn
4065	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715012	f	0d04d6f9-a72a-4dbb-99a4-2429ce5f54db	vndms.dmc.gov.vn
4066	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715201	f	cb80c97b-39ca-433d-979b-e1c50790abf0	vndms.dmc.gov.vn
4067	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715202	f	a1f54d4b-1a6b-4b49-a16c-ec259cff9e58	vndms.dmc.gov.vn
4068	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715203	f	80f5d3ce-fb1f-479d-aaee-2310cc184465	vndms.dmc.gov.vn
4069	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715204	f	e37f08f4-1af2-40d7-999a-03d346a0cfee	vndms.dmc.gov.vn
4070	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715205	f	59feff03-1930-4473-8054-6e628cf44cc4	vndms.dmc.gov.vn
4071	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715206	f	a4ffceaf-4a2c-45be-9fe0-a522672b62d5	vndms.dmc.gov.vn
4072	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715301	f	bb460af3-9580-47bb-9e19-551617277a77	vndms.dmc.gov.vn
4073	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715302	f	e96cae15-194d-4237-8a88-cd5743b9d3b8	vndms.dmc.gov.vn
4074	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715303	f	7bcf5553-958a-4642-b1dd-9df7378652bc	vndms.dmc.gov.vn
4075	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715304	f	0345e3b9-035b-4652-956c-e7548a122042	vndms.dmc.gov.vn
4076	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715305	f	331c2173-bd66-4dc7-a8f9-fa9c88782ff5	vndms.dmc.gov.vn
4077	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715306	f	ed51cece-802f-4d51-a9cd-7f8e5bc4f7c7	vndms.dmc.gov.vn
4078	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715307	f	7c8a073a-8b85-46a5-9dfa-5c05f18bdcdf	vndms.dmc.gov.vn
4079	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715308	f	3d6b3c6d-fe8f-4c5e-b28c-69acf22f9580	vndms.dmc.gov.vn
4080	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715309	f	b8f02427-ca73-4e5c-86e2-2a4357be3421	vndms.dmc.gov.vn
4081	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715401	f	56bb8e78-b506-4e6c-b54a-3fb038300736	vndms.dmc.gov.vn
4082	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715402	f	d9631a0e-3aa7-4148-8aa6-9b5609c97ba8	vndms.dmc.gov.vn
4083	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715403	f	4709773f-0de8-470f-9592-0a963942d8c1	vndms.dmc.gov.vn
4084	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715404	f	113d254a-514c-4e94-92ee-732dae4a2f9b	vndms.dmc.gov.vn
4085	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715405	f	d5afdb02-3ed0-4098-8c50-bee2c1b86a38	vndms.dmc.gov.vn
4086	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715406	f	42d4986a-1520-4809-b1fd-46167ff8d04c	vndms.dmc.gov.vn
4087	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715501	f	2283a429-1f7e-47c8-9e8b-f3dd32ae6ca6	vndms.dmc.gov.vn
4088	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715502	f	3ba0a822-802e-497a-8350-d7dc09a2f12f	vndms.dmc.gov.vn
4089	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715503	f	470cbfd2-a514-4eee-b2cc-6e962c1fdf59	vndms.dmc.gov.vn
4090	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715504	f	e49e31b4-b5bb-41c1-9464-d1dfdb8ca610	vndms.dmc.gov.vn
4091	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715505	f	106e391f-412c-40f3-8691-6aeda973d05d	vndms.dmc.gov.vn
4092	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715506	f	bbec731d-daec-4192-a715-408a3192d150	vndms.dmc.gov.vn
4093	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715507	f	39b5c626-e235-48de-ba9a-d55ebdb8a6b5	vndms.dmc.gov.vn
4094	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715508	f	553c4aef-68bd-4575-b87c-dd0330668a5b	vndms.dmc.gov.vn
4095	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715509	f	eaba27b0-ff50-4aa8-9787-3ac0c7f63caf	vndms.dmc.gov.vn
4096	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715510	f	fc306d4c-9df9-47f4-9494-1cb9c0bf7427	vndms.dmc.gov.vn
4097	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715511	f	c8133af6-510d-4c88-b5a8-207e45392f46	vndms.dmc.gov.vn
4098	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715512	f	5019b10c-784b-45ae-b122-aaf5f466553b	vndms.dmc.gov.vn
4099	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715513	f	39001d88-ef38-470d-907f-2a3452cb6a3e	vndms.dmc.gov.vn
4100	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715601	f	409315cb-7781-4c2f-9787-99ecabf76fdc	vndms.dmc.gov.vn
4101	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715602	f	545fa3fc-3c27-4e21-953c-e970f011970b	vndms.dmc.gov.vn
4102	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715603	f	ace58d7c-a867-41ab-983a-54521edf68c1	vndms.dmc.gov.vn
4103	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715604	f	3cdf3435-c60f-46fe-8366-9ab6659d4926	vndms.dmc.gov.vn
4104	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715605	f	c4661b01-5941-4c90-a562-bdc349e60e8f	vndms.dmc.gov.vn
4105	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715606	f	1e1aeee1-5170-4d79-88ec-82d393ce8f10	vndms.dmc.gov.vn
4106	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715607	f	ef8de6c4-e0d5-4e38-9e8b-b1a7bc8e7434	vndms.dmc.gov.vn
4107	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715608	f	35559453-3370-4818-be13-a2bb3a78433d	vndms.dmc.gov.vn
4108	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715609	f	e23c301f-50d1-41e3-b1b4-ebedd418d2ea	vndms.dmc.gov.vn
4109	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715610	f	1c377f51-24ac-4b92-b470-af1dcfb2001a	vndms.dmc.gov.vn
4110	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715611	f	b5871cf3-2838-4a46-af7f-2871bf961fa1	vndms.dmc.gov.vn
4111	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715612	f	f601606b-aa1e-4067-b97b-514db2b5b0d5	vndms.dmc.gov.vn
4112	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715613	f	fccef3b0-94f0-4588-9ed4-c77588e1459f	vndms.dmc.gov.vn
4113	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715701	f	44a1d4cf-1c73-4637-9535-f357a2c34b04	vndms.dmc.gov.vn
4114	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715702	f	3e3bd423-7147-4bdc-be9e-b410cf76afde	vndms.dmc.gov.vn
4115	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715703	f	37254418-dfc8-4ba4-8fc7-52559f5e1611	vndms.dmc.gov.vn
4116	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715704	f	15331c10-3820-4c6d-a974-c4548a5715ec	vndms.dmc.gov.vn
4117	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715705	f	380621ac-278c-496d-b5a2-c08c08fd2f46	vndms.dmc.gov.vn
4118	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715706	f	508b3953-b769-4eab-bab7-e63bf8a46169	vndms.dmc.gov.vn
4119	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715707	f	744f73dc-160b-49bb-ba08-42822ed962ed	vndms.dmc.gov.vn
4120	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715708	f	f068c7c9-2ed8-463d-9a3c-5649d08138ff	vndms.dmc.gov.vn
4121	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715709	f	0cb66624-248e-4ebe-a74e-bf9d7baf472d	vndms.dmc.gov.vn
4122	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715710	f	7e6bc96e-abc5-44b8-82f4-efd6f0c85616	vndms.dmc.gov.vn
4123	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715711	f	8e8fba84-7c3a-486e-b019-20ffb8f3b0b5	vndms.dmc.gov.vn
4124	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715802	f	8f95e0b6-307b-494a-9409-a74efb0c83ca	vndms.dmc.gov.vn
4125	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715803	f	7e7ff181-cd29-4b9e-81b5-d00179288d76	vndms.dmc.gov.vn
4126	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715804	f	f8b1b18b-89a1-4466-9736-1a7f9b55fdf5	vndms.dmc.gov.vn
4127	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715805	f	4a8a8731-dbbe-4af3-8d6c-9faba46dbda3	vndms.dmc.gov.vn
4128	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715806	f	6b0769a0-2443-4469-b1ff-b7b536812192	vndms.dmc.gov.vn
4129	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715901	f	79253f92-4de9-4f2f-89a3-11aa05218a9d	vndms.dmc.gov.vn
4130	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715902	f	21dbbcf2-0c33-4728-bc77-82992e6b6abc	vndms.dmc.gov.vn
4131	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715903	f	0a0ff0b9-623f-4c76-b61a-3576f1f30c71	vndms.dmc.gov.vn
4132	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715904	f	e806ba95-c948-4e0c-9fe1-b9ae02232ec4	vndms.dmc.gov.vn
4133	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715905	f	e9b2cc09-ffad-435f-849b-9e71b3ecacb7	vndms.dmc.gov.vn
4134	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715906	f	b81ca889-ceb6-42ef-9697-75609bc51896	vndms.dmc.gov.vn
4135	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715907	f	7b191317-cfc2-4f95-ad1b-baf77ce17388	vndms.dmc.gov.vn
4136	Thông số đo mưa	\N	0	RAIN	\N	\N	1021715908	f	6686a717-bf30-4d24-9164-cd08d6927c2e	vndms.dmc.gov.vn
4137	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018001	f	245e0078-40cd-48ca-8a20-09cb20a1e574	vndms.dmc.gov.vn
4138	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018002	f	734b6a4d-6e27-4c0a-b616-841a78729955	vndms.dmc.gov.vn
4139	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018003	f	59c9e09d-d7ed-4aa8-b706-48161efa3d3b	vndms.dmc.gov.vn
4140	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018101	f	c4a8eb5e-4ef4-4698-bc9d-6c771a1cde2f	vndms.dmc.gov.vn
4141	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018102	f	adad937a-47d3-4c5a-962c-5420d4132bad	vndms.dmc.gov.vn
4142	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018103	f	c041a5e1-45e7-41a4-ad0c-df1a185d57d1	vndms.dmc.gov.vn
4143	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018104	f	927ea35a-f436-4e58-a58a-b510afbab990	vndms.dmc.gov.vn
4144	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018105	f	f10044a8-60e0-4545-aeb6-9d3741d0cb34	vndms.dmc.gov.vn
4145	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018106	f	6882f14f-f86c-46dc-ac69-2506ba18c65f	vndms.dmc.gov.vn
4146	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018107	f	c6a9c00b-8816-41b9-8720-b4417df27803	vndms.dmc.gov.vn
4147	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018201	f	47d9ab67-9d9d-4743-b1e5-20f8768c517f	vndms.dmc.gov.vn
4148	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018202	f	ed1bd150-4b61-4bb0-ac49-b9abc75a6f4c	vndms.dmc.gov.vn
4149	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018203	f	e2756b79-1e81-492e-9c4e-5f35ad0c8c9b	vndms.dmc.gov.vn
4150	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018204	f	4f957659-e462-4134-99c4-41f4bdc20bd5	vndms.dmc.gov.vn
4151	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018301	f	3c50e4fd-3acd-4ced-9d0f-cdafbaf751fd	vndms.dmc.gov.vn
4152	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018302	f	61cf25b9-f6f4-4479-b990-95d909008503	vndms.dmc.gov.vn
4153	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018401	f	e0a0fad5-8d4b-4882-bc8e-b56f7e5abef3	vndms.dmc.gov.vn
4154	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018402	f	65d71d8b-007d-4e54-8792-b1daffe9f195	vndms.dmc.gov.vn
4155	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018501	f	19533d72-67cf-4275-8831-ef6842dcc573	vndms.dmc.gov.vn
4156	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018502	f	a51a8875-a326-4619-8f47-553b126b2b16	vndms.dmc.gov.vn
4157	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018503	f	b6b6477c-ce87-409b-a748-60adea738daf	vndms.dmc.gov.vn
4158	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018504	f	6a18cbe7-2f0e-4f28-bfa7-7d5e0e738150	vndms.dmc.gov.vn
4159	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018505	f	56ba813d-b883-4b3b-ac12-452914b2af3a	vndms.dmc.gov.vn
4160	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018601	f	57ebcf17-4d98-49a3-9c28-7c9730bb62d6	vndms.dmc.gov.vn
4161	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018602	f	4abcbf52-00cc-4ab2-b686-c1dec8d2fa59	vndms.dmc.gov.vn
4162	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018603	f	c46fd4f4-2b62-4d63-976b-fd9d02463bfa	vndms.dmc.gov.vn
4163	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018701	f	f335b187-cf8f-4bdf-834f-46e18f3cbb90	vndms.dmc.gov.vn
4164	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018702	f	37bc1e87-b7f6-4269-8627-8d4bbf07d77c	vndms.dmc.gov.vn
4165	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018703	f	186078d7-62a8-4dab-ba70-c623b6e48f49	vndms.dmc.gov.vn
4166	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018801	f	fdba40f8-b9a9-4d68-a9d1-4e2cecff1850	vndms.dmc.gov.vn
4167	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018802	f	d3c16e24-16a6-4189-ac1f-c78db7b8ba59	vndms.dmc.gov.vn
4168	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018803	f	7bbb5878-a308-408f-9687-0598497c32d6	vndms.dmc.gov.vn
4169	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018804	f	c0859da2-d16c-4f58-ac55-4bbb8cb425f0	vndms.dmc.gov.vn
4170	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018805	f	5c1f8791-90df-473f-8bfd-4c2cbc2fc5e4	vndms.dmc.gov.vn
4171	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018806	f	06f25111-ad6b-447f-bef5-4e996a2a70bc	vndms.dmc.gov.vn
4172	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018807	f	e0c9fb37-c02b-4b67-9602-f9c38ce38f55	vndms.dmc.gov.vn
4173	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018901	f	3cb7ae5d-405e-407a-9a7a-9d64d59b1c2b	vndms.dmc.gov.vn
4174	Thông số đo mưa	\N	0	RAIN	\N	\N	1022018902	f	471de6ea-cf34-4b58-9457-3638cda4bf99	vndms.dmc.gov.vn
4175	Thông số đo mưa	\N	0	RAIN	\N	\N	1022523101	f	d2bb6eeb-d552-471e-8cbd-607d3d50f564	vndms.dmc.gov.vn
4176	Thông số đo mưa	\N	0	RAIN	\N	\N	1022523201	f	9bdb0a7c-a1b7-4f19-aa01-3f26716d0718	vndms.dmc.gov.vn
4177	Thông số đo mưa	\N	0	RAIN	\N	\N	1022523801	f	cb8cd992-1904-4486-ad30-c50c9550cde5	vndms.dmc.gov.vn
4178	Thông số đo mưa	\N	0	RAIN	\N	\N	1022524001	f	672d355b-032a-4fda-82bd-09aa989731bf	vndms.dmc.gov.vn
4179	Thông số đo mưa	\N	0	RAIN	\N	\N	1022524002	f	5416aee9-2715-4468-8cda-9e3816812128	vndms.dmc.gov.vn
4180	Thông số đo mưa	\N	0	RAIN	\N	\N	1022524003	f	c3d80ee7-6769-4251-b07a-b4acb11e8990	vndms.dmc.gov.vn
4181	Thông số đo mưa	\N	0	RAIN	\N	\N	1022524004	f	d1e018a8-c250-4b6c-817a-97700f44ea96	vndms.dmc.gov.vn
4182	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838401	f	bd2591a3-a05c-4904-a39c-d90eaded83b9	vndms.dmc.gov.vn
4183	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838402	f	57d5ad1c-8646-4514-8021-a4412deb6f76	vndms.dmc.gov.vn
4184	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838403	f	a7e59403-5acf-42a0-ac20-cab51f2bed06	vndms.dmc.gov.vn
4185	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838404	f	6ddd27df-8611-4255-b7c6-eacb69227f94	vndms.dmc.gov.vn
4186	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838405	f	41673b13-a1ed-4ac3-9198-96e216da649c	vndms.dmc.gov.vn
4187	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838501	f	8514a3a8-17a9-486c-a296-958b3f1b1c2c	vndms.dmc.gov.vn
4188	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838502	f	93c260bd-a76e-4b40-8895-e7c3658f7b4c	vndms.dmc.gov.vn
4189	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838503	f	a723f49a-1ce8-4e23-b96d-cfa444c52fdb	vndms.dmc.gov.vn
4190	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838504	f	829a0fda-54ca-477d-96dc-7d930483c1d4	vndms.dmc.gov.vn
4191	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838505	f	95416f7e-87f5-4785-849f-3dd9d02114f4	vndms.dmc.gov.vn
4192	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838506	f	5773e16b-d38d-4968-ba67-12b70c052c6b	vndms.dmc.gov.vn
4193	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838507	f	09cadd86-48e6-455d-b2d6-10914ea61840	vndms.dmc.gov.vn
4194	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838508	f	7d623af4-8e57-41d1-815e-3b27c212d9b1	vndms.dmc.gov.vn
4195	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838509	f	c14c7bd0-897e-4a4d-9024-303dc1f431e5	vndms.dmc.gov.vn
4196	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838510	f	12454ce6-71e6-48a4-82c2-16bcef88faf8	vndms.dmc.gov.vn
4197	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838511	f	aa085ad7-f1a7-48ab-a8b8-bee516614197	vndms.dmc.gov.vn
4198	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838512	f	4ecc9489-ac94-4514-b630-ff3fbb0e4105	vndms.dmc.gov.vn
4199	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838513	f	ba8ec287-d1f0-43b7-af0a-8c156d8386ef	vndms.dmc.gov.vn
4200	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838514	f	f358b217-c6b8-4f64-a9fd-496064a98232	vndms.dmc.gov.vn
4201	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838515	f	7624709c-7af9-42b8-9448-1e21eaef4fbb	vndms.dmc.gov.vn
4202	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838601	f	22e6a9c3-dd2c-44b1-a64e-cdda7ec84173	vndms.dmc.gov.vn
4203	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838602	f	7a4a3505-e6c7-47d1-a79d-66748d4c3e66	vndms.dmc.gov.vn
4204	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838603	f	c5c098b5-6e7d-4577-a068-ab4ce0648e64	vndms.dmc.gov.vn
4205	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838604	f	862092e0-a2fa-4222-9595-8a77ac329677	vndms.dmc.gov.vn
4206	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838701	f	71bd64cd-4578-458e-a74c-55f476e4f7b9	vndms.dmc.gov.vn
4207	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838702	f	69860a6f-25b5-4d80-8385-e09406e5bf08	vndms.dmc.gov.vn
4208	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838703	f	67b9b1e7-b492-4c6e-bd99-d53f2f0c74f6	vndms.dmc.gov.vn
4209	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838704	f	d501cd10-041b-4d70-aa04-8ffee5e3168b	vndms.dmc.gov.vn
4210	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838705	f	ea645cb3-7a4e-4de4-a144-b890970946de	vndms.dmc.gov.vn
4211	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838706	f	0c35e913-c79e-4bc3-b1b9-80b8e25335b3	vndms.dmc.gov.vn
4212	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838707	f	dd49a41f-fa51-4f3c-9bd5-d6bb31ae7c09	vndms.dmc.gov.vn
4213	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838708	f	73939c1b-70af-4b4d-a2a1-68d7455282ed	vndms.dmc.gov.vn
4214	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838709	f	db4b1021-e51f-4354-a8a4-4494cf7f9173	vndms.dmc.gov.vn
4215	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838801	f	71ccd201-67cb-435a-ab04-b5899b094d26	vndms.dmc.gov.vn
4216	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838802	f	e9c3573b-abff-4c05-8694-eb5c03816e06	vndms.dmc.gov.vn
4217	Thông số đo mưa	\N	0	RAIN	\N	\N	1023838803	f	ecd03bcc-35ae-4b21-8873-11e02ec505cc	vndms.dmc.gov.vn
4218	Thông số đo mưa	\N	0	RAIN	\N	\N	1023839001	f	9ffc962c-9d0c-43d4-9fb6-2556b67def93	vndms.dmc.gov.vn
4219	Thông số đo mưa	\N	0	RAIN	\N	\N	1023839002	f	eba22bb4-d4de-45c7-aa4e-7d5bd4acee74	vndms.dmc.gov.vn
4220	Thông số đo mưa	\N	0	RAIN	\N	\N	1023839101	f	923f78df-13bc-44f9-9179-813682ccb49a	vndms.dmc.gov.vn
4221	Thông số đo mưa	\N	0	RAIN	\N	\N	1023839102	f	ca4559c7-db4c-4464-b32b-5f5083071319	vndms.dmc.gov.vn
4222	Thông số đo mưa	\N	0	RAIN	\N	\N	1023839601	f	4a5161fc-297e-4cfe-b36a-710b45d08de8	vndms.dmc.gov.vn
4223	Thông số đo mưa	\N	0	RAIN	\N	\N	1023839602	f	a1bb4501-0c3c-40cd-941d-28a69826701b	vndms.dmc.gov.vn
4224	Thông số đo mưa	\N	0	RAIN	\N	\N	1023839701	f	1da79f5c-6903-4844-9139-9e1ca8bf1c39	vndms.dmc.gov.vn
4225	Thông số đo mưa	\N	0	RAIN	\N	\N	1023839801	f	401e0879-b01e-4dc8-b502-91ab1b9863f5	vndms.dmc.gov.vn
4226	Thông số đo mưa	\N	0	RAIN	\N	\N	1023840201	f	80a1bb30-1e2d-43aa-86f1-2a8953ae940c	vndms.dmc.gov.vn
4227	Thông số đo mưa	\N	0	RAIN	\N	\N	1023840202	f	2854def7-3d1c-45b6-bea8-6a356026c6a2	vndms.dmc.gov.vn
4228	Thông số đo mưa	\N	0	RAIN	\N	\N	1023840203	f	b2000738-22aa-4d57-b357-d4ed2d991706	vndms.dmc.gov.vn
4229	Thông số đo mưa	\N	0	RAIN	\N	\N	1023840301	f	8a46a593-a182-46e9-a595-b9ffd8d5610e	vndms.dmc.gov.vn
4230	Thông số đo mưa	\N	0	RAIN	\N	\N	1024015101	f	39063298-d475-4ba8-bdbe-447f989f0cad	vndms.dmc.gov.vn
4231	Thông số đo mưa	\N	0	RAIN	\N	\N	1024015102	f	294959a5-7cd5-4fe9-9b10-b904b00cb200	vndms.dmc.gov.vn
4232	Thông số đo mưa	\N	0	RAIN	\N	\N	1024015103	f	96df4c18-743a-4689-9b9d-6dd48ae6880d	vndms.dmc.gov.vn
4233	Thông số đo mưa	\N	0	RAIN	\N	\N	1024015104	f	92ce8616-347a-4e10-bb4f-1fc43e45af52	vndms.dmc.gov.vn
4234	Thông số đo mưa	\N	0	RAIN	\N	\N	1024015105	f	e17b4c4e-e079-4d08-a9ab-abdbf52a8caa	vndms.dmc.gov.vn
4235	Thông số đo mưa	\N	0	RAIN	\N	\N	1024015106	f	7655d3ba-c7a4-4a7a-bde5-6963c150eaf2	vndms.dmc.gov.vn
4236	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041501	f	9fcb0c6e-5372-43d2-9a78-0db9fb78de97	vndms.dmc.gov.vn
4237	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041502	f	e6382404-9f00-4b02-a35b-7d570b2c0bd7	vndms.dmc.gov.vn
4238	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041503	f	e8dc421d-be69-4d6b-aa57-c45e8627cc12	vndms.dmc.gov.vn
4239	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041504	f	c03a99a9-abf1-4bc1-962c-3f13f460b7b3	vndms.dmc.gov.vn
4240	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041505	f	1ac84f95-afcf-4a60-b816-ac10c61a33a6	vndms.dmc.gov.vn
4241	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041601	f	e4b91632-e79a-4137-a600-fae2fdd5b034	vndms.dmc.gov.vn
4242	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041602	f	6b73772b-411b-4e4c-ae28-d95fab74aabf	vndms.dmc.gov.vn
4243	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041603	f	5c2d5b35-6f41-421b-8ec2-20bbc39117ef	vndms.dmc.gov.vn
4244	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041604	f	c32f2599-6f7d-4097-bf68-9e3903fdb30a	vndms.dmc.gov.vn
4245	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041605	f	0274ddfb-818e-4841-bf30-a27747bfb2bf	vndms.dmc.gov.vn
4246	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041606	f	dd70753f-174a-4d9d-965d-1e602e42904f	vndms.dmc.gov.vn
4247	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041607	f	8c26cc4c-4b42-404e-9323-9b35a8c77953	vndms.dmc.gov.vn
4248	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041608	f	30ca1eb3-ac51-4576-b70c-b8c3572cf341	vndms.dmc.gov.vn
4249	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041609	f	aac9df5d-babd-4fc4-9583-74f2d8b19705	vndms.dmc.gov.vn
4250	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041801	f	bb3ee745-4af6-4671-94d1-4eda62366f2d	vndms.dmc.gov.vn
4251	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041802	f	99ae020f-6130-4ce6-b864-0aa6cec23b07	vndms.dmc.gov.vn
4252	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041803	f	118da90a-4da8-4e8b-9b3f-319cc9f4771a	vndms.dmc.gov.vn
4253	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041804	f	85a92528-0c30-41f7-ae07-dccfee573d17	vndms.dmc.gov.vn
4254	Thông số đo mưa	\N	0	RAIN	\N	\N	1024041805	f	ac18b7fc-7adf-4123-ba97-6f4ae628aa23	vndms.dmc.gov.vn
4255	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042001	f	b7b7e5ba-f711-4014-94f6-8c7836c0f4e1	vndms.dmc.gov.vn
4256	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042002	f	185b4e4e-8298-4936-b50c-f6c7daadbf08	vndms.dmc.gov.vn
4257	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042003	f	cc22b774-a8bd-4032-9bc3-db3090566547	vndms.dmc.gov.vn
4258	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042004	f	e5c86846-cf40-47c9-84fe-dad45c3556cd	vndms.dmc.gov.vn
4259	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042005	f	76b45ab0-5a8b-4167-95f1-ab3237dcd3f7	vndms.dmc.gov.vn
4260	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042006	f	72d28e94-9265-4a85-a5f8-6d77e2694725	vndms.dmc.gov.vn
4261	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042007	f	8d2f1191-65e2-4875-bc9b-65c2866db71b	vndms.dmc.gov.vn
4262	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042008	f	f46026fc-1f04-418a-8c5a-d1a36989bf87	vndms.dmc.gov.vn
4263	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042201	f	891488d5-b945-4ad1-877b-f1897e60fb70	vndms.dmc.gov.vn
4264	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042202	f	11f5c3b7-ad9f-4818-aa10-289e7d1c9fa1	vndms.dmc.gov.vn
4265	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042203	f	fe03fcf8-4a40-402a-aab0-31f9d30774ec	vndms.dmc.gov.vn
4266	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042204	f	2bb60069-f501-49e8-b1b6-164c851f702d	vndms.dmc.gov.vn
4267	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042205	f	eac98183-851a-4474-9a4d-f6e09f23a62e	vndms.dmc.gov.vn
4268	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042206	f	d49f02f8-a17d-4e29-8f7d-db9bc24ca545	vndms.dmc.gov.vn
4269	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042207	f	ea9569c8-8c6f-46d2-9957-5b8d661c7830	vndms.dmc.gov.vn
4270	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042208	f	c301192f-fe2e-472c-b1a6-d98a35961942	vndms.dmc.gov.vn
4271	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042209	f	2f44d465-bdfa-41f6-adc2-d8ff9930f7d7	vndms.dmc.gov.vn
4272	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042210	f	e60e7fea-47d0-424e-ac28-89b448e60fdf	vndms.dmc.gov.vn
4273	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042211	f	beda9993-377c-4512-9d5e-1f1a4e5305b7	vndms.dmc.gov.vn
4274	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042212	f	9e3cb543-64c1-4f19-8e94-be78d32adea2	vndms.dmc.gov.vn
4275	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042301	f	85c5b555-c7ba-427a-93e0-6a833ad2de67	vndms.dmc.gov.vn
4276	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042302	f	a2dd5513-b39b-4f25-9eb2-e7352a263002	vndms.dmc.gov.vn
4277	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042401	f	324dc3f6-7a0f-4435-a526-53bb8641a685	vndms.dmc.gov.vn
4278	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042402	f	305a90f8-009d-4171-b467-518064090c58	vndms.dmc.gov.vn
4279	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042403	f	3f79a2a3-e073-4b5c-becb-be0e6ce59c13	vndms.dmc.gov.vn
4280	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042501	f	90b74269-5505-4a4f-ba2e-22b19cac0d6e	vndms.dmc.gov.vn
4281	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042601	f	84127bb2-d53c-43a7-b96b-48caf028603e	vndms.dmc.gov.vn
4282	Thông số đo mưa	\N	0	RAIN	\N	\N	1024042701	f	e8ee50ea-d2ec-4b52-985c-78dcb926592e	vndms.dmc.gov.vn
4283	Thông số đo mưa	\N	0	RAIN	\N	\N	1024043001	f	2ccfbd1d-1936-4cc7-b4df-67ad0bc998f7	vndms.dmc.gov.vn
4284	Thông số đo mưa	\N	0	RAIN	\N	\N	1024243701	f	456f79d4-c3f5-45cd-b809-f729da47ac9b	vndms.dmc.gov.vn
4285	Thông số đo mưa	\N	0	RAIN	\N	\N	1024243901	f	49d3fe3b-a708-410b-9a66-14f81fc661ae	vndms.dmc.gov.vn
4286	Thông số đo mưa	\N	0	RAIN	\N	\N	1024243902	f	aa0f9117-0a2a-497d-a3fe-2ea20d6ef81e	vndms.dmc.gov.vn
4287	Thông số đo mưa	\N	0	RAIN	\N	\N	1024243903	f	764f7412-0553-41d2-ba67-e88c01f09b22	vndms.dmc.gov.vn
4288	Thông số đo mưa	\N	0	RAIN	\N	\N	1024243904	f	99b397b5-b6f6-454d-9b78-92f1ade132be	vndms.dmc.gov.vn
4289	Thông số đo mưa	\N	0	RAIN	\N	\N	1024243905	f	50f3da0b-1d8f-43ce-8fa5-37dfeab9ea5e	vndms.dmc.gov.vn
4290	Thông số đo mưa	\N	0	RAIN	\N	\N	1024243906	f	2249b3e7-b7d0-47f5-acec-409e6cade47d	vndms.dmc.gov.vn
4291	Thông số đo mưa	\N	0	RAIN	\N	\N	1024243907	f	575b50bd-2df0-4072-91cd-d37a46742d76	vndms.dmc.gov.vn
4292	Thông số đo mưa	\N	0	RAIN	\N	\N	1024243908	f	3c454978-b557-46a7-86e0-3aed49cc25ec	vndms.dmc.gov.vn
4293	Thông số đo mưa	\N	0	RAIN	\N	\N	1024243909	f	eb581f9c-3512-464b-bf43-9cab2ac7a7f4	vndms.dmc.gov.vn
4294	Thông số đo mưa	\N	0	RAIN	\N	\N	1024243910	f	4989a2d2-ec27-4e7f-a565-e1592c88a7c9	vndms.dmc.gov.vn
4295	Thông số đo mưa	\N	0	RAIN	\N	\N	1024243911	f	4724d44c-b9cd-463f-aecb-80377d24e475	vndms.dmc.gov.vn
4296	Thông số đo mưa	\N	0	RAIN	\N	\N	1024243912	f	758ee07c-9c60-4477-ba38-bd45c29be480	vndms.dmc.gov.vn
4297	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244101	f	c8cbd602-ddba-4471-8934-c88c8eba5975	vndms.dmc.gov.vn
4298	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244102	f	fddf2fc6-91d2-4fbd-82de-682be875b321	vndms.dmc.gov.vn
4299	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244103	f	8b620c48-ddcc-4e40-a55b-c1c39cc51d29	vndms.dmc.gov.vn
4300	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244104	f	e7d81399-2d91-457e-b4b3-8fa3e57f9c71	vndms.dmc.gov.vn
4301	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244201	f	6061c49c-7ce0-4a82-8d06-82f724207fd3	vndms.dmc.gov.vn
4302	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244401	f	6e09090a-130c-44fe-ae78-3c8c37bd9ebb	vndms.dmc.gov.vn
4303	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244402	f	79f9b5e6-0bad-431f-86cb-bf02785ecd5e	vndms.dmc.gov.vn
4304	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244403	f	01de9865-ac25-4b9a-940b-71235931c12c	vndms.dmc.gov.vn
4305	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244404	f	cb7d8b3f-7908-43cc-9c2e-96d8ea7ea0e5	vndms.dmc.gov.vn
4306	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244405	f	19831391-b3b4-4afd-aafb-986cce4e4e3d	vndms.dmc.gov.vn
4307	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244406	f	b8118ea1-bc14-49db-8c13-243c79f6d18d	vndms.dmc.gov.vn
4308	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244407	f	0a0945ca-63e3-4a10-8bf6-87df1a4604bd	vndms.dmc.gov.vn
4309	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244408	f	866c39e6-8824-49b2-bb8c-891c96b99b03	vndms.dmc.gov.vn
4310	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244409	f	9b091673-7a6e-4dd1-9a7a-e89e605ce1bf	vndms.dmc.gov.vn
4311	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244410	f	98e0c726-2923-4851-97a6-204ed9cd4488	vndms.dmc.gov.vn
4312	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244411	f	050214ef-64f9-439b-a276-9b79b8bd10a1	vndms.dmc.gov.vn
4313	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244412	f	f5de0604-0a27-4219-9927-8eb3a4eddbf1	vndms.dmc.gov.vn
4314	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244413	f	397cc619-f27e-4c97-a8c7-dd9efa920cc4	vndms.dmc.gov.vn
4315	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244414	f	36789592-9339-40f1-a33c-64e301a81682	vndms.dmc.gov.vn
4316	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244415	f	c2693880-85c1-4c7b-bdb6-ae5946ec3ce4	vndms.dmc.gov.vn
4317	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244501	f	fd6d3edf-0d25-4a97-bc81-88c56f21a0d2	vndms.dmc.gov.vn
4318	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244601	f	24273852-e75a-4946-adda-7ce2b5678528	vndms.dmc.gov.vn
4319	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244701	f	1c8a8a43-f43a-4d30-937e-46cd59f9ef27	vndms.dmc.gov.vn
4320	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244702	f	c6dc91ef-7aa8-40ff-857e-7a53e9c6dae5	vndms.dmc.gov.vn
4321	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244703	f	eb92b30f-c552-447f-b8dc-33aac345ef31	vndms.dmc.gov.vn
4322	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244704	f	8a96ffbd-5505-456f-a8fb-c7562b29f44b	vndms.dmc.gov.vn
4323	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244705	f	fe07bc6f-6c31-4a8c-9534-bd02ffc7f880	vndms.dmc.gov.vn
4324	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244706	f	7314a9f8-be53-4c8e-967e-87e01781880a	vndms.dmc.gov.vn
4325	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244707	f	6613d667-0ca2-4c32-8c7b-f3dee74db887	vndms.dmc.gov.vn
4326	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244901	f	0869dad6-4ae7-4e51-807f-3af2a046374e	vndms.dmc.gov.vn
4327	Thông số đo mưa	\N	0	RAIN	\N	\N	1024244902	f	4f98aa24-6684-4643-b2d0-55979e702bc0	vndms.dmc.gov.vn
4328	Thông số đo mưa	\N	0	RAIN	\N	\N	1026260801	f	b8e76863-ef28-4801-8c28-a100f6ea1321	vndms.dmc.gov.vn
4329	Thông số đo mưa	\N	0	RAIN	\N	\N	1026260802	f	04af2d59-9fe4-486f-b6ab-98cda3a3e596	vndms.dmc.gov.vn
4330	Thông số đo mưa	\N	0	RAIN	\N	\N	1026260803	f	d4a66c8e-0447-4eaa-913b-671b4f8ff03b	vndms.dmc.gov.vn
4331	Thông số đo mưa	\N	0	RAIN	\N	\N	1026260804	f	214b7aa4-30d1-4e70-8050-e255e5634fbb	vndms.dmc.gov.vn
4332	Thông số đo mưa	\N	0	RAIN	\N	\N	1026260805	f	30ca45bf-48ca-47ed-97b1-c8b7c1efa712	vndms.dmc.gov.vn
4333	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261001	f	4825458e-6edc-4da6-873a-d4ca92b0fb70	vndms.dmc.gov.vn
4334	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261002	f	5baea970-cf74-4cbc-9ba3-79169bad0232	vndms.dmc.gov.vn
4335	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261003	f	20ba12f5-4a47-4258-9c8a-7ba5c45bac81	vndms.dmc.gov.vn
4336	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261004	f	5e9addfb-db14-4e5b-9926-ac8739cc15fd	vndms.dmc.gov.vn
4337	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261005	f	88bc5aa6-c0df-45d0-81cc-9ac6aebb6aa1	vndms.dmc.gov.vn
4338	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261006	f	bad88636-48eb-4c99-87ca-c31bdcde7e99	vndms.dmc.gov.vn
4339	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261101	f	4937b8a5-ffa8-4ffd-8efc-bcd0b9fd3b0a	vndms.dmc.gov.vn
4340	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261102	f	2ae05473-e91e-4e54-8b55-288e4db0d870	vndms.dmc.gov.vn
4341	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261103	f	9bd7b722-4662-456f-abd6-3c4db9332b66	vndms.dmc.gov.vn
4342	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261104	f	12b39422-4661-4b85-8c5d-2e8c2b66a89f	vndms.dmc.gov.vn
4343	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261201	f	647d1363-f95a-4dff-b9a9-aeb348f61968	vndms.dmc.gov.vn
4344	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261202	f	908eb012-0fbb-4ea9-82a3-da20e167a501	vndms.dmc.gov.vn
4345	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261203	f	9776660a-f22b-44d2-88b5-eb17201a00be	vndms.dmc.gov.vn
4346	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261204	f	a8813701-ebcd-4838-be09-fbbcab654dea	vndms.dmc.gov.vn
4347	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261301	f	3fc340de-b664-44a4-9fde-a796dbd14247	vndms.dmc.gov.vn
4348	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261302	f	9d276d49-0a70-485c-ae70-d7bbe5dba44a	vndms.dmc.gov.vn
4349	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261303	f	e4a7a3d2-8adf-4249-908e-8b8ff090e95b	vndms.dmc.gov.vn
4350	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261304	f	4847e88f-9c4c-4031-8cb7-1be71a2613b8	vndms.dmc.gov.vn
4351	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261305	f	bb4a3bc2-88bb-4f2d-ac22-1bded6d44225	vndms.dmc.gov.vn
4352	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261306	f	8bfd2090-b6ef-4ad0-b903-9021e3e0892e	vndms.dmc.gov.vn
4353	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261401	f	8d8a4437-7f79-411c-bfa6-755760b31f6f	vndms.dmc.gov.vn
4354	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261402	f	e0d3719b-3979-4cf9-9926-209f923db1d4	vndms.dmc.gov.vn
4355	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261403	f	9450ff10-bf94-40bb-8db4-8007701dbc37	vndms.dmc.gov.vn
4356	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261404	f	35c41902-da8a-4038-b1d0-51059a5804f9	vndms.dmc.gov.vn
4357	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261501	f	d403600d-c871-4925-a466-78c555072934	vndms.dmc.gov.vn
4358	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261502	f	05daf8d9-b412-4c86-a1c5-2d158ce5045b	vndms.dmc.gov.vn
4359	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261503	f	3dc34cf9-228c-49f6-8ce4-cb9a9a7cde02	vndms.dmc.gov.vn
4360	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261504	f	f5456e4e-5ca1-47d5-8549-8483da7a8d0d	vndms.dmc.gov.vn
4361	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261601	f	47c80ad7-d1a1-441a-8ed4-b846d78ee358	vndms.dmc.gov.vn
4362	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261602	f	ff2c6935-4992-4d71-9ed2-7a874e5f3e37	vndms.dmc.gov.vn
4363	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261603	f	c26b3ade-0e20-47ca-90aa-8b4a4a03664f	vndms.dmc.gov.vn
4364	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261604	f	e07e404a-1822-4a5d-b493-d35b755b5041	vndms.dmc.gov.vn
4365	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261605	f	2b01dc2f-5520-4743-adeb-fe9a2a51d3b7	vndms.dmc.gov.vn
4366	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261606	f	61be6d7c-67fb-483b-be7d-0fc61afb1f01	vndms.dmc.gov.vn
4367	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261701	f	3465f99a-5fcf-4d04-964f-a70ee6daccfa	vndms.dmc.gov.vn
4368	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261702	f	4f79c78b-c1be-4b47-a7ce-d2c3eb8f91be	vndms.dmc.gov.vn
4369	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261703	f	918b0347-daa4-495b-8516-edaa290385f0	vndms.dmc.gov.vn
4370	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261704	f	172de64d-8b89-4014-94ff-5ddb976d8059	vndms.dmc.gov.vn
4371	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261705	f	61289070-1d96-4efc-88f3-c08814978f4b	vndms.dmc.gov.vn
4372	Thông số đo mưa	\N	0	RAIN	\N	\N	1026261706	f	a0530a99-8c54-4751-970d-ad271290d28a	vndms.dmc.gov.vn
4373	Thông số đo mưa	\N	0	RAIN	\N	\N	1026462201	f	912247ad-5dc1-4b2e-8213-cc5b977d6c77	vndms.dmc.gov.vn
4374	Thông số đo mưa	\N	0	RAIN	\N	\N	1026462601	f	229a8fa0-4ce8-4eef-aab2-694587a3efce	vndms.dmc.gov.vn
4375	Thông số đo mưa	\N	0	RAIN	\N	\N	1026462901	f	fdd17e08-c103-4d4c-90a1-5c852f7a7405	vndms.dmc.gov.vn
4376	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463001	f	ced9f0e1-cecc-4dde-bb54-9727d0f87b48	vndms.dmc.gov.vn
4377	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463002	f	f90f9c83-0740-4563-a37f-fa971bc58d33	vndms.dmc.gov.vn
4378	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463003	f	e9dce310-ab1a-4a5a-a035-e1618768bd05	vndms.dmc.gov.vn
4379	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463004	f	36f5740a-e33a-46b3-ae20-41e366f3aa85	vndms.dmc.gov.vn
4380	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463101	f	a338050c-04e5-49df-b9a1-1b645b6258d7	vndms.dmc.gov.vn
4381	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463201	f	0d141830-7a50-4f19-bd9a-6d9df2854cb4	vndms.dmc.gov.vn
4382	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463202	f	95b78f97-a149-4f67-84a9-fe9d01f49fb2	vndms.dmc.gov.vn
4383	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463203	f	d1f18a75-9250-4234-b5b2-56b1f1a5ff4c	vndms.dmc.gov.vn
4384	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463401	f	cfabb7ee-1cef-4cb3-a2fb-1990d561060d	vndms.dmc.gov.vn
4385	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463501	f	be14b640-6622-4447-af94-4eed3e872a78	vndms.dmc.gov.vn
4386	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463502	f	44a5e8ce-3df2-43af-9fcc-bafe047ab8c1	vndms.dmc.gov.vn
4387	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463503	f	b9406419-50bd-4a6e-b41e-12e1e677e869	vndms.dmc.gov.vn
4388	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463701	f	d67921eb-ceed-4933-87d5-38ec18614ad0	vndms.dmc.gov.vn
4389	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463702	f	b0614f68-5bb8-4471-bd01-2b0cf3a47780	vndms.dmc.gov.vn
4390	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463703	f	19978527-0e04-4452-9f77-a172712e9e88	vndms.dmc.gov.vn
4391	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463801	f	f93beec1-944a-4c86-840b-4f3e77cd8e7a	vndms.dmc.gov.vn
4392	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463802	f	48046a2e-1f8a-40ee-8f3f-f7ed9001e0e9	vndms.dmc.gov.vn
4393	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463901	f	10a21907-84e7-4ea9-92a6-38ba8fa7fa16	vndms.dmc.gov.vn
4394	Thông số đo mưa	\N	0	RAIN	\N	\N	1026463902	f	ab683aca-90ed-4699-b851-09f31d88a4d0	vndms.dmc.gov.vn
4395	Thông số đo mưa	\N	0	RAIN	\N	\N	1026664801	f	18dcd32b-51b3-4ec6-8834-3a83b7a0d461	vndms.dmc.gov.vn
4396	Thông số đo mưa	\N	0	RAIN	\N	\N	1026664901	f	317808b1-9588-452c-a98d-e60d4df39cf9	vndms.dmc.gov.vn
4397	Thông số đo mưa	\N	0	RAIN	\N	\N	1026665301	f	7e044f52-676f-40fe-92cf-e830058cbca4	vndms.dmc.gov.vn
4398	Thông số đo mưa	\N	0	RAIN	\N	\N	1026665601	f	4c57d54a-58aa-4678-8d34-a574b5533547	vndms.dmc.gov.vn
4399	Thông số đo mưa	\N	0	RAIN	\N	\N	1026665602	f	f1423115-c42b-4844-9061-01453e8ba325	vndms.dmc.gov.vn
4400	Thông số đo mưa	\N	0	RAIN	\N	\N	1026665603	f	e6a9b7cc-2158-40f1-bd49-9af6545fa8f6	vndms.dmc.gov.vn
4401	Thông số đo mưa	\N	0	RAIN	\N	\N	1026665604	f	330355c8-447d-47c3-9c32-43510276214a	vndms.dmc.gov.vn
4402	Thông số đo mưa	\N	0	RAIN	\N	\N	1026665605	f	e7f33346-4faf-4540-9bfd-4a11f054f2b4	vndms.dmc.gov.vn
4403	Thông số đo mưa	\N	0	RAIN	\N	\N	1026665606	f	a3b8e1af-50f7-4b7a-813d-122e1c0bbd6c	vndms.dmc.gov.vn
4404	Thông số đo mưa	\N	0	RAIN	\N	\N	1026665607	f	7d00ea13-46f3-4eaf-b477-a424ddb9c1bd	vndms.dmc.gov.vn
4405	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766101	f	f87cf8c5-4792-4743-8607-90bb2ed19e0a	vndms.dmc.gov.vn
4406	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766301	f	76a94f56-0e2e-4bde-b938-72f828291359	vndms.dmc.gov.vn
4407	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766302	f	917dbe74-51d6-4a89-9fa4-84a18e3cf8af	vndms.dmc.gov.vn
4408	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766303	f	50eb43ad-3210-4802-ac4d-f6876ac3783d	vndms.dmc.gov.vn
4409	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766304	f	d74a7e9d-a9e6-4357-8f84-9e966f2698e2	vndms.dmc.gov.vn
4410	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766305	f	7a1f9baa-9f75-483b-9a83-8ad51fa91d0f	vndms.dmc.gov.vn
4411	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766306	f	7242dd3f-a66c-4dfc-b7b0-b56ef20a0eae	vndms.dmc.gov.vn
4412	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766501	f	be5aa239-cdd9-4a12-9dd3-a16130b3b466	vndms.dmc.gov.vn
4413	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766502	f	c872631d-cb98-45a5-92ec-4104d9f96886	vndms.dmc.gov.vn
4414	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766503	f	094e33bd-c5a1-4017-9b29-6cec15f2d55c	vndms.dmc.gov.vn
4415	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766504	f	72b6fe6a-b37e-4e74-9754-9dd55421d73f	vndms.dmc.gov.vn
4416	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766505	f	de3bd811-c498-40f3-bd2c-59eec491aa84	vndms.dmc.gov.vn
4417	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766601	f	5bebf043-1ad1-40e0-9729-45900b28eced	vndms.dmc.gov.vn
4418	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766602	f	d9f3cb9c-f833-4a63-99a5-1673ceb3cc50	vndms.dmc.gov.vn
4419	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766701	f	1c6706b2-b134-4a20-aab7-bf694dd5b19a	vndms.dmc.gov.vn
4420	Thông số đo mưa	\N	0	RAIN	\N	\N	1026766702	f	588b1650-88a9-4802-80e3-59bd2380b0fb	vndms.dmc.gov.vn
4421	Thông số đo mưa	\N	0	RAIN	\N	\N	1026867401	f	2d3dfbaa-affa-42b9-9fe7-de2fedaf1864	vndms.dmc.gov.vn
4422	Thông số đo mưa	\N	0	RAIN	\N	\N	1026867402	f	2efbf948-46ab-4cbe-b0fd-a8e0cfc3d69f	vndms.dmc.gov.vn
4423	Thông số đo mưa	\N	0	RAIN	\N	\N	1026867501	f	d617c0df-aaa3-4865-951b-4b1a91a14d77	vndms.dmc.gov.vn
4424	Thông số đo mưa	\N	0	RAIN	\N	\N	1026867502	f	086a81d9-ad64-4dee-b5ee-7145dde89655	vndms.dmc.gov.vn
4425	Thông số đo mưa	\N	0	RAIN	\N	\N	1026867503	f	cae54e74-0133-4910-b3f1-88bcf2a92317	vndms.dmc.gov.vn
4426	Thông số đo mưa	\N	0	RAIN	\N	\N	1026867901	f	28de84ed-78d6-4bb0-9cf7-c5a1f291f96c	vndms.dmc.gov.vn
4427	Thông số đo mưa	\N	0	RAIN	\N	\N	1026867902	f	622d629e-a6ef-48c3-ab97-3ecd1eb2fc4b	vndms.dmc.gov.vn
4428	Thông số đo mưa	\N	0	RAIN	\N	\N	1026868101	f	5ff895b3-6624-4629-9c9c-41e2ae4dcd8c	vndms.dmc.gov.vn
4429	Thông số đo mưa	\N	0	RAIN	\N	\N	1026868102	f	03f45b8c-d5fc-4bf2-b453-2a2518d14229	vndms.dmc.gov.vn
4430	Thông số đo mưa	\N	0	RAIN	\N	\N	1026868103	f	5e084479-8ec2-4ff3-829c-a54f636a9260	vndms.dmc.gov.vn
4431	Thông số đo mưa	\N	0	RAIN	\N	\N	1026868201	f	61ddbc5a-091a-44d4-b485-5494b76bf36c	vndms.dmc.gov.vn
4432	Thông số đo mưa	\N	0	RAIN	\N	\N	105273	f	462c9db4-64f1-4ae6-917e-45a2ee0ca09b	vndms.dmc.gov.vn
4433	Thông số đo mưa	\N	0	RAIN	\N	\N	106604	f	b6f3be81-35b2-4c94-af80-5c23fb2f4949	vndms.dmc.gov.vn
4434	Thông số đo mưa	\N	0	RAIN	\N	\N	107554	f	a800f797-f570-49ef-8cf0-7d4c2fd94a23	vndms.dmc.gov.vn
4435	Thông số đo mưa	\N	0	RAIN	\N	\N	109926	f	b4b011cd-b474-477c-94c3-4a145f49a2aa	vndms.dmc.gov.vn
4436	Thông số đo mưa	\N	0	RAIN	\N	\N	110011	f	e0d5c9d9-29ee-4bdc-9d70-f1b60641cc39	vndms.dmc.gov.vn
4437	Thông số đo mưa	\N	0	RAIN	\N	\N	110012	f	9fa43a15-5d78-453e-ae1b-94d7e0201400	vndms.dmc.gov.vn
4438	Thông số đo mưa	\N	0	RAIN	\N	\N	110013	f	571f4bd3-ad97-4e2f-b110-ec24b2a2ccc3	vndms.dmc.gov.vn
4439	Thông số đo mưa	\N	0	RAIN	\N	\N	110014	f	edf540aa-8aea-4cd5-bcaa-5601d8db11ab	vndms.dmc.gov.vn
4440	Thông số đo mưa	\N	0	RAIN	\N	\N	110015	f	11697aad-31b0-485f-99e4-d9ad1b26ce1b	vndms.dmc.gov.vn
4441	Thông số đo mưa	\N	0	RAIN	\N	\N	110016	f	8ea1e4f7-3182-4942-8ad2-3587d7fafd8d	vndms.dmc.gov.vn
4442	Thông số đo mưa	\N	0	RAIN	\N	\N	110017	f	5dade2b5-171e-4d7d-94e6-50d6d7fff556	vndms.dmc.gov.vn
4443	Thông số đo mưa	\N	0	RAIN	\N	\N	110018	f	5953bc38-3b70-4984-9a8e-6a8ae578baa0	vndms.dmc.gov.vn
4444	Thông số đo mưa	\N	0	RAIN	\N	\N	110019	f	66620d04-c444-4e6f-847d-5f498007256c	vndms.dmc.gov.vn
4445	Thông số đo mưa	\N	0	RAIN	\N	\N	110020	f	4c988f86-3ecc-46c4-a2f1-cfbcabcb053f	vndms.dmc.gov.vn
4446	Thông số đo mưa	\N	0	RAIN	\N	\N	115404	f	3f0601d3-2d33-4686-ac4a-b8aaa733de26	vndms.dmc.gov.vn
4447	Thông số đo mưa	\N	0	RAIN	\N	\N	116421	f	52328dc4-b72f-4053-9303-a11828c4389a	vndms.dmc.gov.vn
4448	Thông số đo mưa	\N	0	RAIN	\N	\N	116553	f	a9033033-4e9f-40d7-a74d-74e4ca679a0c	vndms.dmc.gov.vn
4449	Thông số đo mưa	\N	0	RAIN	\N	\N	116554	f	a6cd5558-a1ae-4a0e-8c7c-2aeb0c6bc8c5	vndms.dmc.gov.vn
4450	Thông số đo mưa	\N	0	RAIN	\N	\N	117056	f	a9e534e0-f2b6-465a-962b-2891668927dd	vndms.dmc.gov.vn
4451	Thông số đo mưa	\N	0	RAIN	\N	\N	123456	f	8b32be44-5b49-41a6-9a02-6e1ae6c56c01	vndms.dmc.gov.vn
4452	Thông số đo mưa	\N	0	RAIN	\N	\N	124960	f	b488c281-7e51-44d6-8f84-5b09e8a8b1b9	vndms.dmc.gov.vn
4453	Thông số đo mưa	\N	0	RAIN	\N	\N	125443	f	83952d24-f2d5-4c31-a973-158626763367	vndms.dmc.gov.vn
4454	Thông số đo mưa	\N	0	RAIN	\N	\N	125782	f	68e7a351-c049-4461-a5e9-e94a4a5f024d	vndms.dmc.gov.vn
4455	Thông số đo mưa	\N	0	RAIN	\N	\N	128526	f	7be45be9-7344-4288-b47c-6da1d56f377a	vndms.dmc.gov.vn
4456	Thông số đo mưa	\N	0	RAIN	\N	\N	129145	f	5f12fbef-8ef9-4746-b747-2bde1dc8c6e6	vndms.dmc.gov.vn
4457	Thông số đo mưa	\N	0	RAIN	\N	\N	129901	f	e85771f6-ec08-4b5b-b654-d02a8a0f3207	vndms.dmc.gov.vn
4458	Thông số đo mưa	\N	0	RAIN	\N	\N	131781	f	764f7abd-da6f-4f3a-a64b-5d02ff55fc4f	vndms.dmc.gov.vn
4459	Thông số đo mưa	\N	0	RAIN	\N	\N	132774	f	d316c0b5-107a-4166-9828-7a62661aa04c	vndms.dmc.gov.vn
4460	Thông số đo mưa	\N	0	RAIN	\N	\N	134604	f	30a7f1f8-4c79-4046-be77-b1cd3a306ca7	vndms.dmc.gov.vn
4461	Thông số đo mưa	\N	0	RAIN	\N	\N	135130	f	96253274-3d18-4bae-8cb6-cd9863b82d0a	vndms.dmc.gov.vn
4462	Thông số đo mưa	\N	0	RAIN	\N	\N	135231	f	fa5bad21-075f-473b-8cfc-dfb41e7010e9	vndms.dmc.gov.vn
4463	Thông số đo mưa	\N	0	RAIN	\N	\N	136740	f	9a20abba-18e3-4e8b-84fc-e7b3141c3bba	vndms.dmc.gov.vn
4464	Thông số đo mưa	\N	0	RAIN	\N	\N	139063	f	7fe19e19-35bd-43df-8193-5555c8764019	vndms.dmc.gov.vn
4465	Thông số đo mưa	\N	0	RAIN	\N	\N	139832	f	88a4ce5a-6d66-421a-bd89-58c4e0092a3a	vndms.dmc.gov.vn
4466	Thông số đo mưa	\N	0	RAIN	\N	\N	140001	f	16e549ed-ec0b-48ea-a4ec-887f978a52a5	vndms.dmc.gov.vn
4467	Thông số đo mưa	\N	0	RAIN	\N	\N	140002	f	c61c8438-51d7-4efd-bd72-f60756acff7b	vndms.dmc.gov.vn
4468	Thông số đo mưa	\N	0	RAIN	\N	\N	140003	f	499f9853-4fb4-4b7f-9c14-591a1b652a2c	vndms.dmc.gov.vn
4469	Thông số đo mưa	\N	0	RAIN	\N	\N	140004	f	8cb41fe7-1fda-4ef4-98ee-b4a5f5872e8a	vndms.dmc.gov.vn
4470	Thông số đo mưa	\N	0	RAIN	\N	\N	140005	f	937e0af9-0887-4c39-8e39-0694f50bbde7	vndms.dmc.gov.vn
4471	Thông số đo mưa	\N	0	RAIN	\N	\N	140006	f	b90f90db-5d1b-44e3-ac18-e53e1e909231	vndms.dmc.gov.vn
4472	Thông số đo mưa	\N	0	RAIN	\N	\N	140007	f	d8701c39-6311-400e-ac56-73e954075c93	vndms.dmc.gov.vn
4473	Thông số đo mưa	\N	0	RAIN	\N	\N	140008	f	cfc26f98-271f-46e5-85be-2447e09ce4ca	vndms.dmc.gov.vn
4474	Thông số đo mưa	\N	0	RAIN	\N	\N	140009	f	671c2308-90b6-42f6-82f3-23b3951cd4ed	vndms.dmc.gov.vn
4475	Thông số đo mưa	\N	0	RAIN	\N	\N	140010	f	7d535a3a-3133-413a-b783-e170f17fb813	vndms.dmc.gov.vn
4476	Thông số đo mưa	\N	0	RAIN	\N	\N	140048	f	1c30acc7-b2f5-44b9-90d6-1d4140627ac1	vndms.dmc.gov.vn
4477	Thông số đo mưa	\N	0	RAIN	\N	\N	143422	f	96b43e32-361f-43e3-95d7-c6af5b419271	vndms.dmc.gov.vn
4478	Thông số đo mưa	\N	0	RAIN	\N	\N	146365	f	ce629047-13f0-47e2-a56e-f01c169363b9	vndms.dmc.gov.vn
4479	Thông số đo mưa	\N	0	RAIN	\N	\N	14690	f	14c38bc7-5950-4576-9713-a46f4a80458d	vndms.dmc.gov.vn
4480	Thông số đo mưa	\N	0	RAIN	\N	\N	14696	f	05f1fe98-3b7f-4d29-9a44-e5a31cac8000	vndms.dmc.gov.vn
4481	Thông số đo mưa	\N	0	RAIN	\N	\N	14699	f	a7af1583-13ad-4c9e-94f7-4f4b44b7c247	vndms.dmc.gov.vn
4482	Thông số đo mưa	\N	0	RAIN	\N	\N	148245	f	073bef7e-c4f3-4e8f-997c-0a7fed240745	vndms.dmc.gov.vn
4483	Thông số đo mưa	\N	0	RAIN	\N	\N	148374	f	09c47361-22a3-4b10-8e24-3be732764e90	vndms.dmc.gov.vn
4484	Thông số đo mưa	\N	0	RAIN	\N	\N	149965	f	0c25705f-17a3-4503-ada7-87a89458f4cd	vndms.dmc.gov.vn
4485	Thông số đo mưa	\N	0	RAIN	\N	\N	152043	f	6cb6ab31-c7ed-4b28-81f4-d00217176d7b	vndms.dmc.gov.vn
4486	Thông số đo mưa	\N	0	RAIN	\N	\N	159846	f	d4960b5b-c3a5-4737-8935-3154b01cb497	vndms.dmc.gov.vn
4487	Thông số đo mưa	\N	0	RAIN	\N	\N	162205	f	bee2f3e9-21fc-48b5-af0b-28d49da1eea9	vndms.dmc.gov.vn
4488	Thông số đo mưa	\N	0	RAIN	\N	\N	164249	f	9f53bb09-27d9-40a8-97bf-7bb395038547	vndms.dmc.gov.vn
4489	Thông số đo mưa	\N	0	RAIN	\N	\N	165950	f	532a9886-0671-450c-af59-20963d5173b7	vndms.dmc.gov.vn
4490	Thông số đo mưa	\N	0	RAIN	\N	\N	166963	f	cae609b7-20a7-4495-a972-4cc7b35b9531	vndms.dmc.gov.vn
4491	Thông số đo mưa	\N	0	RAIN	\N	\N	168872	f	360d926b-62b4-42ef-b0b3-4e527974015e	vndms.dmc.gov.vn
4492	Thông số đo mưa	\N	0	RAIN	\N	\N	169811	f	0308fa28-39a2-441b-bee5-67d25e567779	vndms.dmc.gov.vn
4493	Thông số đo mưa	\N	0	RAIN	\N	\N	170001	f	5f7763bd-fb2b-4afe-859a-07c70d05212d	vndms.dmc.gov.vn
4494	Thông số đo mưa	\N	0	RAIN	\N	\N	170002	f	1c59d823-9a41-4085-ab0b-d6cf40b93ecf	vndms.dmc.gov.vn
4495	Thông số đo mưa	\N	0	RAIN	\N	\N	170003	f	80de8fd0-257f-4ef3-9902-e2a9245f496b	vndms.dmc.gov.vn
4496	Thông số đo mưa	\N	0	RAIN	\N	\N	170004	f	8890bdac-210d-4e77-890d-f375f6d9cba8	vndms.dmc.gov.vn
4497	Thông số đo mưa	\N	0	RAIN	\N	\N	170005	f	84116005-47c3-4474-b2ef-e827c31668d1	vndms.dmc.gov.vn
4498	Thông số đo mưa	\N	0	RAIN	\N	\N	170006	f	dcf46ca0-17e7-4645-a989-6899955431fd	vndms.dmc.gov.vn
4499	Thông số đo mưa	\N	0	RAIN	\N	\N	170007	f	1f53c85f-9d33-4de4-90fe-688050046f5c	vndms.dmc.gov.vn
4500	Thông số đo mưa	\N	0	RAIN	\N	\N	170008	f	fb73e8fd-c400-4fa6-961e-83c1240917fc	vndms.dmc.gov.vn
4501	Thông số đo mưa	\N	0	RAIN	\N	\N	170009	f	96f89260-8d67-4628-904e-21186afa7488	vndms.dmc.gov.vn
4502	Thông số đo mưa	\N	0	RAIN	\N	\N	170010	f	3c97c42f-df9f-4d8e-86c9-b2c5c7df64d6	vndms.dmc.gov.vn
4503	Thông số đo mưa	\N	0	RAIN	\N	\N	172153	f	2ec35523-ec50-4f4d-9cb1-5e2f4c1efb01	vndms.dmc.gov.vn
4504	Thông số đo mưa	\N	0	RAIN	\N	\N	172231	f	9c0c11ab-353c-46d3-83fd-e39d2021026c	vndms.dmc.gov.vn
4505	Thông số đo mưa	\N	0	RAIN	\N	\N	172906	f	d4ced3b3-fd42-449c-8cac-ac8c2f3a79a6	vndms.dmc.gov.vn
4506	Thông số đo mưa	\N	0	RAIN	\N	\N	173854	f	1c21da0f-d3ec-468e-b15b-001ac535a0b2	vndms.dmc.gov.vn
4507	Thông số đo mưa	\N	0	RAIN	\N	\N	174840	f	73e0e5e1-ec9b-4dac-9158-b506b7fe5377	vndms.dmc.gov.vn
4508	Thông số đo mưa	\N	0	RAIN	\N	\N	175655	f	b9d67840-eb49-4757-80bb-e27d677bd6dc	vndms.dmc.gov.vn
4509	Thông số đo mưa	\N	0	RAIN	\N	\N	176236	f	5bb9edbb-20cb-459e-86af-7310dbdff933	vndms.dmc.gov.vn
4510	Thông số đo mưa	\N	0	RAIN	\N	\N	17659	f	da58e1f9-2ece-481c-90ee-ef3af228cd76	vndms.dmc.gov.vn
4511	Thông số đo mưa	\N	0	RAIN	\N	\N	176785	f	5652caa0-39fe-4f9b-aef2-2c617fa1b73b	vndms.dmc.gov.vn
4512	Thông số đo mưa	\N	0	RAIN	\N	\N	180001	f	3ae9ba19-2e27-4750-81b3-43fe24a8c50d	vndms.dmc.gov.vn
4513	Thông số đo mưa	\N	0	RAIN	\N	\N	180002	f	41a01ab8-1aa5-4f1b-bd2c-3319f56fb23e	vndms.dmc.gov.vn
4514	Thông số đo mưa	\N	0	RAIN	\N	\N	180003	f	01f6175f-0ec7-4877-bb27-60f688bf80c7	vndms.dmc.gov.vn
4515	Thông số đo mưa	\N	0	RAIN	\N	\N	180004	f	a59a574a-9d99-4cbe-ac08-ac4295e972d2	vndms.dmc.gov.vn
4516	Thông số đo mưa	\N	0	RAIN	\N	\N	180005	f	b3432cc9-f788-41b4-87f5-6b4892202531	vndms.dmc.gov.vn
4517	Thông số đo mưa	\N	0	RAIN	\N	\N	180006	f	4fdef675-6293-4c1b-bc3f-923de3931d9c	vndms.dmc.gov.vn
4518	Thông số đo mưa	\N	0	RAIN	\N	\N	180007	f	5c7a8111-5a33-48c4-bef4-28e0b0c1a083	vndms.dmc.gov.vn
4519	Thông số đo mưa	\N	0	RAIN	\N	\N	180008	f	ab3bcbea-b6d9-49ce-bf05-d37cac39a1a1	vndms.dmc.gov.vn
4520	Thông số đo mưa	\N	0	RAIN	\N	\N	180009	f	233f1bb9-c0c9-4ca0-ae20-f36f8a48ec54	vndms.dmc.gov.vn
4521	Thông số đo mưa	\N	0	RAIN	\N	\N	180010	f	9a524410-1c85-401c-b687-495f8d824903	vndms.dmc.gov.vn
4522	Thông số đo mưa	\N	0	RAIN	\N	\N	180165	f	6a4266f9-f533-495f-8145-e5c9f743e949	vndms.dmc.gov.vn
4523	Thông số đo mưa	\N	0	RAIN	\N	\N	18422	f	df6ac7c0-f01a-4b68-a7b8-c56d48ef0d48	vndms.dmc.gov.vn
4524	Thông số đo mưa	\N	0	RAIN	\N	\N	184251	f	1623c7e4-3615-491f-a5f3-d1327796bf9f	vndms.dmc.gov.vn
4525	Thông số đo mưa	\N	0	RAIN	\N	\N	184557	f	fdb4cc72-79bc-4f30-ac67-34f1299eb714	vndms.dmc.gov.vn
4526	Thông số đo mưa	\N	0	RAIN	\N	\N	184635	f	b4792450-e2ed-4657-b5ce-7ff1e2c843f8	vndms.dmc.gov.vn
4527	Thông số đo mưa	\N	0	RAIN	\N	\N	185917	f	dc37c71d-21c4-4208-a514-e2c86bee7218	vndms.dmc.gov.vn
4528	Thông số đo mưa	\N	0	RAIN	\N	\N	188249	f	c24e240d-e926-4d50-96a1-28035acbae04	vndms.dmc.gov.vn
4529	Thông số đo mưa	\N	0	RAIN	\N	\N	189153	f	b4c09fe6-cce6-4d63-b308-cd3d7d7aea54	vndms.dmc.gov.vn
4530	Thông số đo mưa	\N	0	RAIN	\N	\N	189329	f	78ef4d0f-2ec5-49c4-954f-00aedec2086c	vndms.dmc.gov.vn
4531	Thông số đo mưa	\N	0	RAIN	\N	\N	190008	f	504449c9-3e4e-4d60-a587-da8147df2bd9	vndms.dmc.gov.vn
4532	Thông số đo mưa	\N	0	RAIN	\N	\N	191474	f	e7794437-95b9-4e54-9c65-f1718b6ef260	vndms.dmc.gov.vn
4533	Thông số đo mưa	\N	0	RAIN	\N	\N	193925	f	59b32860-19d9-4683-a739-48c5bf7e7cc5	vndms.dmc.gov.vn
4534	Thông số đo mưa	\N	0	RAIN	\N	\N	195805	f	b3c40b77-4946-4976-a40f-f3231e3b6243	vndms.dmc.gov.vn
4535	Thông số đo mưa	\N	0	RAIN	\N	\N	197706	f	8c6faad1-9cab-484f-88dd-cf9eb0e3e9a9	vndms.dmc.gov.vn
4536	Thông số đo mưa	\N	0	RAIN	\N	\N	200001	f	20248ccf-d617-46a3-9f28-49586c1fda5b	vndms.dmc.gov.vn
4537	Thông số đo mưa	\N	0	RAIN	\N	\N	200002	f	2aa4e2bf-2439-4dcf-b717-dba3b0b13b9d	vndms.dmc.gov.vn
4538	Thông số đo mưa	\N	0	RAIN	\N	\N	200003	f	dd60db5b-e265-4231-ba36-d20b47db0af7	vndms.dmc.gov.vn
4539	Thông số đo mưa	\N	0	RAIN	\N	\N	200004	f	ff836206-8ba2-4756-8a58-60b4e4dd24fe	vndms.dmc.gov.vn
4540	Thông số đo mưa	\N	0	RAIN	\N	\N	200005	f	77357cf7-a7f4-4185-8ca2-01a060510db5	vndms.dmc.gov.vn
4541	Thông số đo mưa	\N	0	RAIN	\N	\N	200006	f	3fe096a8-93cb-4e1a-9029-679c1369d924	vndms.dmc.gov.vn
4542	Thông số đo mưa	\N	0	RAIN	\N	\N	200007	f	09aa102b-2faf-4162-8872-c4c83e115feb	vndms.dmc.gov.vn
4543	Thông số đo mưa	\N	0	RAIN	\N	\N	200008	f	0b829708-3a2d-49d7-977e-c0c319ab8808	vndms.dmc.gov.vn
4544	Thông số đo mưa	\N	0	RAIN	\N	\N	200009	f	cd6a9ea5-92bd-4b66-a946-54fe89c21b56	vndms.dmc.gov.vn
4545	Thông số đo mưa	\N	0	RAIN	\N	\N	200010	f	af541497-2bdd-4498-b6ca-466d8522baf8	vndms.dmc.gov.vn
4546	Thông số đo mưa	\N	0	RAIN	\N	\N	200011	f	d10c0518-9b12-41bb-9459-947cbfd19daa	vndms.dmc.gov.vn
4547	Thông số đo mưa	\N	0	RAIN	\N	\N	200012	f	063942ce-3b5d-431c-b3ea-3d603074fdda	vndms.dmc.gov.vn
4548	Thông số đo mưa	\N	0	RAIN	\N	\N	200013	f	cde379b3-0131-4349-b24d-64221d09fb47	vndms.dmc.gov.vn
4549	Thông số đo mưa	\N	0	RAIN	\N	\N	200014	f	3a80fa26-61c7-43bf-afad-e7271c4312ee	vndms.dmc.gov.vn
4550	Thông số đo mưa	\N	0	RAIN	\N	\N	200015	f	05dc01a7-e02d-4e56-8086-6dd19f0db962	vndms.dmc.gov.vn
4551	Thông số đo mưa	\N	0	RAIN	\N	\N	200016	f	b8e8947d-af35-4cb5-a89b-837fc20e6c6a	vndms.dmc.gov.vn
4552	Thông số đo mưa	\N	0	RAIN	\N	\N	200017	f	527731f3-a0c6-4d31-be23-e0800aa0e2b9	vndms.dmc.gov.vn
4553	Thông số đo mưa	\N	0	RAIN	\N	\N	200018	f	83f30a89-d571-4c67-bdb3-c45c8af344cf	vndms.dmc.gov.vn
4554	Thông số đo mưa	\N	0	RAIN	\N	\N	200019	f	845e0a9d-f364-4ab4-af89-6b269a1af94f	vndms.dmc.gov.vn
4555	Thông số đo mưa	\N	0	RAIN	\N	\N	200020	f	a3cbcb37-de69-43f1-bf4e-c44b9e49c3cb	vndms.dmc.gov.vn
4556	Thông số đo mưa	\N	0	RAIN	\N	\N	201575	f	fac0af0b-938e-445f-83fe-c036f2ab0d46	vndms.dmc.gov.vn
4557	Thông số đo mưa	\N	0	RAIN	\N	\N	206752	f	bc09b868-bcd0-4009-8f78-b6340600c331	vndms.dmc.gov.vn
4558	Thông số đo mưa	\N	0	RAIN	\N	\N	207491	f	3ef7e2ef-1038-417c-8044-1c603a20068d	vndms.dmc.gov.vn
4559	Thông số đo mưa	\N	0	RAIN	\N	\N	20761	f	19297baa-6951-46c5-8e5e-5c9a58c510fd	vndms.dmc.gov.vn
4560	Thông số đo mưa	\N	0	RAIN	\N	\N	210002	f	df0730e1-524c-45d6-a04e-0e2f002c230b	vndms.dmc.gov.vn
4561	Thông số đo mưa	\N	0	RAIN	\N	\N	210011	f	4aac4fbe-12d4-438e-ad46-01b62ff73c60	vndms.dmc.gov.vn
4562	Thông số đo mưa	\N	0	RAIN	\N	\N	210012	f	036c6b70-d006-4dae-a646-954cef3961aa	vndms.dmc.gov.vn
4563	Thông số đo mưa	\N	0	RAIN	\N	\N	210013	f	cc95b8fc-4996-41a7-8f11-7132b0746ec4	vndms.dmc.gov.vn
4564	Thông số đo mưa	\N	0	RAIN	\N	\N	210014	f	9e42a8c6-0dbe-4e24-8f8d-e9aa747d6e50	vndms.dmc.gov.vn
4565	Thông số đo mưa	\N	0	RAIN	\N	\N	210015	f	d8fb86c6-1851-4607-bb1f-700be64e3db8	vndms.dmc.gov.vn
4566	Thông số đo mưa	\N	0	RAIN	\N	\N	210016	f	8c820da8-aff8-4c63-b353-97d5f76644ca	vndms.dmc.gov.vn
4567	Thông số đo mưa	\N	0	RAIN	\N	\N	210020	f	28cb2b61-c9dc-4710-b1e5-08576d4527b0	vndms.dmc.gov.vn
4568	Thông số đo mưa	\N	0	RAIN	\N	\N	210021	f	61695546-ef40-40b4-ad8a-3933dc56ec5a	vndms.dmc.gov.vn
4569	Thông số đo mưa	\N	0	RAIN	\N	\N	210022	f	d787ea48-2f4b-4b25-ab10-5c630e5e024e	vndms.dmc.gov.vn
4570	Thông số đo mưa	\N	0	RAIN	\N	\N	210031	f	b31922e7-2715-4b54-92c9-afaf8c13e2ff	vndms.dmc.gov.vn
4571	Thông số đo mưa	\N	0	RAIN	\N	\N	210032	f	1457e062-5916-453e-b17c-5fc74bef872d	vndms.dmc.gov.vn
4572	Thông số đo mưa	\N	0	RAIN	\N	\N	210033	f	15b531cf-0026-4614-bc04-2ed02a861f6c	vndms.dmc.gov.vn
4573	Thông số đo mưa	\N	0	RAIN	\N	\N	210034	f	2990cc71-4de3-42c4-a1b0-28ac541336b3	vndms.dmc.gov.vn
4574	Thông số đo mưa	\N	0	RAIN	\N	\N	210035	f	9b41cff2-ecab-4b79-891f-e925fc19f4d8	vndms.dmc.gov.vn
4575	Thông số đo mưa	\N	0	RAIN	\N	\N	210036	f	9c985b72-7cf8-4ba1-a130-8207884c1f1e	vndms.dmc.gov.vn
4576	Thông số đo mưa	\N	0	RAIN	\N	\N	210037	f	d50498dc-c743-4440-afe5-e05686f18750	vndms.dmc.gov.vn
4577	Thông số đo mưa	\N	0	RAIN	\N	\N	210038	f	a924e4ec-5267-48e1-a75a-7d693332b4a9	vndms.dmc.gov.vn
4578	Thông số đo mưa	\N	0	RAIN	\N	\N	210039	f	0cc1d365-ba24-4ad1-ad0e-b31205844f13	vndms.dmc.gov.vn
4579	Thông số đo mưa	\N	0	RAIN	\N	\N	210040	f	68188eec-e7b0-4fd2-91ab-10d8e2e930f1	vndms.dmc.gov.vn
4580	Thông số đo mưa	\N	0	RAIN	\N	\N	217912	f	3546f2ae-f426-4e0d-93ce-184368f92ce1	vndms.dmc.gov.vn
4581	Thông số đo mưa	\N	0	RAIN	\N	\N	219031	f	d2ce8e5e-5796-4f48-8736-ab278da9d6cc	vndms.dmc.gov.vn
4582	Thông số đo mưa	\N	0	RAIN	\N	\N	219512	f	7f5731f0-e2aa-49a5-9ba6-c284422ad61b	vndms.dmc.gov.vn
4583	Thông số đo mưa	\N	0	RAIN	\N	\N	220001	f	6dbad92b-e7ec-43ea-810b-6ec584717327	vndms.dmc.gov.vn
4584	Thông số đo mưa	\N	0	RAIN	\N	\N	220002	f	8eeec303-cfc1-4c1f-a577-5b9a17942b8c	vndms.dmc.gov.vn
4585	Thông số đo mưa	\N	0	RAIN	\N	\N	220003	f	deeef396-c371-4d70-be72-a2e8f2717e60	vndms.dmc.gov.vn
4586	Thông số đo mưa	\N	0	RAIN	\N	\N	220004	f	97ec460a-aa0f-49e0-936c-7a3d530ab47c	vndms.dmc.gov.vn
4587	Thông số đo mưa	\N	0	RAIN	\N	\N	220005	f	33557ce2-91b4-4b2a-bc4e-c21640d8202a	vndms.dmc.gov.vn
4588	Thông số đo mưa	\N	0	RAIN	\N	\N	220006	f	3ded3237-6cce-494c-b458-1605e38c0791	vndms.dmc.gov.vn
4589	Thông số đo mưa	\N	0	RAIN	\N	\N	220007	f	017001af-e66b-4d68-9d4c-8aca6f59743e	vndms.dmc.gov.vn
4590	Thông số đo mưa	\N	0	RAIN	\N	\N	220008	f	57d90b43-aacb-4394-b589-f8dcf40e0e69	vndms.dmc.gov.vn
4591	Thông số đo mưa	\N	0	RAIN	\N	\N	220009	f	f7c95a38-ed20-44a1-a34e-54d9b643f721	vndms.dmc.gov.vn
4592	Thông số đo mưa	\N	0	RAIN	\N	\N	220010	f	2a42974a-cc06-4097-8aac-e5c264cbee1a	vndms.dmc.gov.vn
4593	Thông số đo mưa	\N	0	RAIN	\N	\N	220011	f	491b7c6c-2520-4525-b305-efad570b498d	vndms.dmc.gov.vn
4594	Thông số đo mưa	\N	0	RAIN	\N	\N	220012	f	690bc1f5-664f-42d1-b0cd-6a6a02a62395	vndms.dmc.gov.vn
4595	Thông số đo mưa	\N	0	RAIN	\N	\N	220013	f	a51da87f-d7c6-46a4-8e2b-4255429178f5	vndms.dmc.gov.vn
4596	Thông số đo mưa	\N	0	RAIN	\N	\N	220014	f	6998f59a-d9ea-48c4-8005-9a0a2ed6a0b4	vndms.dmc.gov.vn
4597	Thông số đo mưa	\N	0	RAIN	\N	\N	220015	f	2ad92912-66bf-49da-ade3-0dcf34dbbd5d	vndms.dmc.gov.vn
4598	Thông số đo mưa	\N	0	RAIN	\N	\N	220016	f	cd97ca8f-e88c-4680-91e1-d33d0a46a970	vndms.dmc.gov.vn
4599	Thông số đo mưa	\N	0	RAIN	\N	\N	220017	f	708242c0-3066-416d-a102-fb0304b2c306	vndms.dmc.gov.vn
4600	Thông số đo mưa	\N	0	RAIN	\N	\N	220018	f	71884b32-0b28-41f5-a619-0f2988d6c938	vndms.dmc.gov.vn
4601	Thông số đo mưa	\N	0	RAIN	\N	\N	220019	f	722a3b39-d6c9-45da-b29a-b2c024bf070b	vndms.dmc.gov.vn
4602	Thông số đo mưa	\N	0	RAIN	\N	\N	220020	f	45d8bbe7-9a01-4628-9b09-b56c63bb3198	vndms.dmc.gov.vn
4603	Thông số đo mưa	\N	0	RAIN	\N	\N	220021	f	6eff6598-3343-492e-ba95-9beaec2d3aee	vndms.dmc.gov.vn
4604	Thông số đo mưa	\N	0	RAIN	\N	\N	220022	f	ace97258-9804-475b-8cd3-a6bebdd1f7df	vndms.dmc.gov.vn
4605	Thông số đo mưa	\N	0	RAIN	\N	\N	220023	f	a52381fe-5dac-469a-8cc8-5b5be80176c7	vndms.dmc.gov.vn
4606	Thông số đo mưa	\N	0	RAIN	\N	\N	220024	f	d6910ccd-b8eb-44ec-84a0-19a66e7454c2	vndms.dmc.gov.vn
4607	Thông số đo mưa	\N	0	RAIN	\N	\N	220025	f	6e754854-c2e8-4cb2-a9da-16c3135b592d	vndms.dmc.gov.vn
4608	Thông số đo mưa	\N	0	RAIN	\N	\N	220669	f	4f2b090b-ca89-44d2-8b1a-3af2e60af909	vndms.dmc.gov.vn
4609	Thông số đo mưa	\N	0	RAIN	\N	\N	225130	f	8d6322a7-39fa-431c-ab1e-3bedfd3f09fd	vndms.dmc.gov.vn
4610	Thông số đo mưa	\N	0	RAIN	\N	\N	225440	f	9fa869cd-8fc8-45ce-83d9-39327ac7a5da	vndms.dmc.gov.vn
4611	Thông số đo mưa	\N	0	RAIN	\N	\N	225936	f	1bd49cb1-81e6-4d29-a0fd-eda81217c64d	vndms.dmc.gov.vn
4612	Thông số đo mưa	\N	0	RAIN	\N	\N	226650	f	b4e2e020-b7bd-416d-adae-76db1035c11b	vndms.dmc.gov.vn
4613	Thông số đo mưa	\N	0	RAIN	\N	\N	226653	f	b03425a0-ea8d-4fe6-83a0-8eb352b6f163	vndms.dmc.gov.vn
4614	Thông số đo mưa	\N	0	RAIN	\N	\N	226654	f	80d7b2ec-2687-435e-a7bf-1b1df74cbc9c	vndms.dmc.gov.vn
4615	Thông số đo mưa	\N	0	RAIN	\N	\N	226657	f	d696b0d9-d823-4251-9d18-33537b0f6044	vndms.dmc.gov.vn
4616	Thông số đo mưa	\N	0	RAIN	\N	\N	226658	f	1db4e3cf-51ae-4225-8e10-fa3291f2b688	vndms.dmc.gov.vn
4617	Thông số đo mưa	\N	0	RAIN	\N	\N	226659	f	f25c3a2f-7629-4bcd-9c12-74b798b33e35	vndms.dmc.gov.vn
4618	Thông số đo mưa	\N	0	RAIN	\N	\N	226660	f	cc7c74d3-3c63-492f-840a-691033798cdf	vndms.dmc.gov.vn
4619	Thông số đo mưa	\N	0	RAIN	\N	\N	226661	f	b0893ac4-2b80-4d27-acb5-e4ce2ae5a3a1	vndms.dmc.gov.vn
4620	Thông số đo mưa	\N	0	RAIN	\N	\N	226662	f	1024475a-5af4-4ba9-91cc-0b44a880e05f	vndms.dmc.gov.vn
4621	Thông số đo mưa	\N	0	RAIN	\N	\N	226708	f	a4767e2a-339d-47ce-9d74-7970d47886e5	vndms.dmc.gov.vn
4622	Thông số đo mưa	\N	0	RAIN	\N	\N	226709	f	91203fba-522b-405f-86f0-9f87eb723f30	vndms.dmc.gov.vn
4623	Thông số đo mưa	\N	0	RAIN	\N	\N	226710	f	a40fef40-cec9-4dab-b16e-97a95c30cbec	vndms.dmc.gov.vn
4624	Thông số đo mưa	\N	0	RAIN	\N	\N	226711	f	280686a6-f36b-4df2-92ab-7f4a02d4c027	vndms.dmc.gov.vn
4625	Thông số đo mưa	\N	0	RAIN	\N	\N	228861	f	66a666d6-62d4-41a4-9b6d-0c53b09b7b8d	vndms.dmc.gov.vn
4626	Thông số đo mưa	\N	0	RAIN	\N	\N	228863	f	9e872d40-8602-4f77-b2c5-5872f038eeff	vndms.dmc.gov.vn
4627	Thông số đo mưa	\N	0	RAIN	\N	\N	228864	f	4966ceec-7801-43ec-af97-a9b42f195bb7	vndms.dmc.gov.vn
4628	Thông số đo mưa	\N	0	RAIN	\N	\N	228865	f	a6bc146e-ac34-4a4a-b4bb-ed3c91a1c0a2	vndms.dmc.gov.vn
4629	Thông số đo mưa	\N	0	RAIN	\N	\N	228867	f	257951a1-18e9-4858-8fad-36f447552733	vndms.dmc.gov.vn
4630	Thông số đo mưa	\N	0	RAIN	\N	\N	228921	f	3fc0c57b-eddd-498a-b591-232f8e6f5a27	vndms.dmc.gov.vn
4631	Thông số đo mưa	\N	0	RAIN	\N	\N	228922	f	34b9b7d4-01ca-4dc0-b576-75f1c6461124	vndms.dmc.gov.vn
4632	Thông số đo mưa	\N	0	RAIN	\N	\N	228923	f	5fd48ad7-ca49-4318-8105-48a88b396796	vndms.dmc.gov.vn
4633	Thông số đo mưa	\N	0	RAIN	\N	\N	228925	f	eb35275b-7935-42d0-bdbd-1a2f84fc41ff	vndms.dmc.gov.vn
4634	Thông số đo mưa	\N	0	RAIN	\N	\N	228926	f	eb292207-1c03-49e9-bd6a-486adb5436c0	vndms.dmc.gov.vn
4635	Thông số đo mưa	\N	0	RAIN	\N	\N	228927	f	764a246a-5cb7-411d-b833-128f65fc6dea	vndms.dmc.gov.vn
4636	Thông số đo mưa	\N	0	RAIN	\N	\N	228929	f	cedaa287-076e-4c32-a1a1-14b54af3b3b0	vndms.dmc.gov.vn
4637	Thông số đo mưa	\N	0	RAIN	\N	\N	228930	f	024d503b-77c1-4ae1-9c02-d51904fc44f6	vndms.dmc.gov.vn
4638	Thông số đo mưa	\N	0	RAIN	\N	\N	230004	f	65966587-ef3a-4410-a5f5-56bd25053aa4	vndms.dmc.gov.vn
4639	Thông số đo mưa	\N	0	RAIN	\N	\N	230005	f	398d7b6f-4060-4ea0-8906-64e2dd760179	vndms.dmc.gov.vn
4640	Thông số đo mưa	\N	0	RAIN	\N	\N	230006	f	c7fc8435-8a31-4642-a32b-d465cad72fd8	vndms.dmc.gov.vn
4641	Thông số đo mưa	\N	0	RAIN	\N	\N	230008	f	877f9ff1-4199-4475-b2ee-9aed318f58db	vndms.dmc.gov.vn
4642	Thông số đo mưa	\N	0	RAIN	\N	\N	230009	f	46614977-29fe-4e4b-af89-db8fa9dcd753	vndms.dmc.gov.vn
4643	Thông số đo mưa	\N	0	RAIN	\N	\N	230011	f	98504b41-0068-43b6-acbd-eab2dad1360b	vndms.dmc.gov.vn
4644	Thông số đo mưa	\N	0	RAIN	\N	\N	230020	f	59e00e73-fb1c-4116-bee4-dfb0f7ca3005	vndms.dmc.gov.vn
4645	Thông số đo mưa	\N	0	RAIN	\N	\N	230022	f	f3a0f743-c2c2-452f-82db-79a50e1d3b1f	vndms.dmc.gov.vn
4646	Thông số đo mưa	\N	0	RAIN	\N	\N	232043	f	db7c9ace-7c1b-476d-82c6-e4878db1f4ec	vndms.dmc.gov.vn
4647	Thông số đo mưa	\N	0	RAIN	\N	\N	234831	f	b509f412-eadd-4abc-89a0-03277e1712db	vndms.dmc.gov.vn
4648	Thông số đo mưa	\N	0	RAIN	\N	\N	23584	f	a04a7883-db66-4b99-bba5-2db4864f6a5a	vndms.dmc.gov.vn
4649	Thông số đo mưa	\N	0	RAIN	\N	\N	236549	f	1fd8defc-f7e5-42e3-845e-fbeb0cafb137	vndms.dmc.gov.vn
4650	Thông số đo mưa	\N	0	RAIN	\N	\N	239790	f	1ef71279-1edc-42b1-aeda-e64c8c25bf45	vndms.dmc.gov.vn
4651	Thông số đo mưa	\N	0	RAIN	\N	\N	240001	f	2b6c3f9c-1acd-44ae-a006-0a79848922c2	vndms.dmc.gov.vn
4652	Thông số đo mưa	\N	0	RAIN	\N	\N	240002	f	4821b2fc-8884-4f0e-9a4a-e054af7dc0ce	vndms.dmc.gov.vn
4653	Thông số đo mưa	\N	0	RAIN	\N	\N	240003	f	700e82ea-c4d9-4ebe-a0e9-18fa6fde1e25	vndms.dmc.gov.vn
4654	Thông số đo mưa	\N	0	RAIN	\N	\N	240004	f	5897dd19-e305-4c07-affe-e9ef61e85105	vndms.dmc.gov.vn
4655	Thông số đo mưa	\N	0	RAIN	\N	\N	240005	f	14a71c65-fcc2-4f4c-ac53-f2b33b0fef32	vndms.dmc.gov.vn
4656	Thông số đo mưa	\N	0	RAIN	\N	\N	240006	f	a26283f0-d9cd-4c67-a659-7010f85b8401	vndms.dmc.gov.vn
4657	Thông số đo mưa	\N	0	RAIN	\N	\N	240007	f	9688f8c7-0d8f-4726-80a8-bfdbdb44be6d	vndms.dmc.gov.vn
4658	Thông số đo mưa	\N	0	RAIN	\N	\N	240008	f	7698758b-9037-4276-bad8-b72ce805fd9a	vndms.dmc.gov.vn
4659	Thông số đo mưa	\N	0	RAIN	\N	\N	240009	f	3878b781-6647-4fe0-a941-94a2b7a9340d	vndms.dmc.gov.vn
4660	Thông số đo mưa	\N	0	RAIN	\N	\N	240010	f	3da39f2f-8ad7-4b9f-9ea7-e3c678a9c356	vndms.dmc.gov.vn
4661	Thông số đo mưa	\N	0	RAIN	\N	\N	240011	f	da8dbb7d-07d0-493b-a1f9-b7526919d211	vndms.dmc.gov.vn
4662	Thông số đo mưa	\N	0	RAIN	\N	\N	240012	f	5ea56604-3bfc-4553-be53-0fe94e8ace4e	vndms.dmc.gov.vn
4663	Thông số đo mưa	\N	0	RAIN	\N	\N	240013	f	ad54ea16-c04c-442f-a621-8afc77783891	vndms.dmc.gov.vn
4664	Thông số đo mưa	\N	0	RAIN	\N	\N	240014	f	33fc1cd8-940c-409b-a0fd-858ebf35b608	vndms.dmc.gov.vn
4665	Thông số đo mưa	\N	0	RAIN	\N	\N	240015	f	69c5427f-a48d-4f70-a311-abd4e9fa021a	vndms.dmc.gov.vn
4666	Thông số đo mưa	\N	0	RAIN	\N	\N	240016	f	863b9ece-2415-4862-8eba-dd0299f28e8a	vndms.dmc.gov.vn
4667	Thông số đo mưa	\N	0	RAIN	\N	\N	240017	f	0017f1b5-f942-4970-bd32-7326eabc0452	vndms.dmc.gov.vn
4668	Thông số đo mưa	\N	0	RAIN	\N	\N	240018	f	b87d397c-db4a-4202-b2a4-4bdee95d1822	vndms.dmc.gov.vn
4669	Thông số đo mưa	\N	0	RAIN	\N	\N	240019	f	148656ab-033a-417f-a6d5-521e115e54c1	vndms.dmc.gov.vn
4670	Thông số đo mưa	\N	0	RAIN	\N	\N	240020	f	2f337d0b-a4ff-47df-9083-4626a2cb3b45	vndms.dmc.gov.vn
4671	Thông số đo mưa	\N	0	RAIN	\N	\N	240021	f	eeebe198-69f9-4834-ae5b-ee0dbf0dc6a3	vndms.dmc.gov.vn
4672	Thông số đo mưa	\N	0	RAIN	\N	\N	240022	f	be0c074f-513b-4873-a3a3-f6bd6dc7c7b7	vndms.dmc.gov.vn
4673	Thông số đo mưa	\N	0	RAIN	\N	\N	240023	f	88ea3f98-9846-4260-af98-0c496307439b	vndms.dmc.gov.vn
4674	Thông số đo mưa	\N	0	RAIN	\N	\N	240024	f	85eefaa1-3b5f-4308-a57b-245939cdcf07	vndms.dmc.gov.vn
4675	Thông số đo mưa	\N	0	RAIN	\N	\N	240025	f	cf32fed6-06b8-46f2-9633-7797c7fb05ea	vndms.dmc.gov.vn
4676	Thông số đo mưa	\N	0	RAIN	\N	\N	240026	f	a9a60bb0-c0f8-4dfe-a5c4-d9918be21217	vndms.dmc.gov.vn
4677	Thông số đo mưa	\N	0	RAIN	\N	\N	240027	f	d3d4703f-83bd-42d0-a45c-7166fb5352c4	vndms.dmc.gov.vn
4678	Thông số đo mưa	\N	0	RAIN	\N	\N	240028	f	676a1acb-bfb1-4c9b-8409-222437c3d79e	vndms.dmc.gov.vn
4679	Thông số đo mưa	\N	0	RAIN	\N	\N	240029	f	b4517e16-790b-43fc-b3c3-4139dc6a8fa0	vndms.dmc.gov.vn
4680	Thông số đo mưa	\N	0	RAIN	\N	\N	240030	f	24794624-b95b-4d06-9154-c8c21befac58	vndms.dmc.gov.vn
4681	Thông số đo mưa	\N	0	RAIN	\N	\N	248507	f	7334d513-8923-43a2-9851-941b9555cf28	vndms.dmc.gov.vn
4682	Thông số đo mưa	\N	0	RAIN	\N	\N	25117	f	0f50e12d-5272-42f9-8e59-50d270cf6f5b	vndms.dmc.gov.vn
4683	Thông số đo mưa	\N	0	RAIN	\N	\N	251493	f	b8000202-c985-47d9-b495-8b5dcc67eed3	vndms.dmc.gov.vn
4684	Thông số đo mưa	\N	0	RAIN	\N	\N	253581	f	489a99ac-c012-44f3-a228-d7f04ebd40dd	vndms.dmc.gov.vn
4685	Thông số đo mưa	\N	0	RAIN	\N	\N	257376	f	53b4e0ab-3aaf-4e49-9441-da9270d35a77	vndms.dmc.gov.vn
4686	Thông số đo mưa	\N	0	RAIN	\N	\N	25893	f	d7cb0fb4-1324-47ae-ae10-2b8b14ccbb11	vndms.dmc.gov.vn
4687	Thông số đo mưa	\N	0	RAIN	\N	\N	258969	f	14bc9719-e2c5-42be-b080-a738b612f915	vndms.dmc.gov.vn
4688	Thông số đo mưa	\N	0	RAIN	\N	\N	260001	f	1634d410-b832-4698-839f-cdea8a892aac	vndms.dmc.gov.vn
4689	Thông số đo mưa	\N	0	RAIN	\N	\N	260002	f	3dc8e4c5-24de-4442-9a31-60dce7e109a0	vndms.dmc.gov.vn
4690	Thông số đo mưa	\N	0	RAIN	\N	\N	260003	f	c54660cb-41f5-4ab4-a33a-a19662ac32a5	vndms.dmc.gov.vn
4691	Thông số đo mưa	\N	0	RAIN	\N	\N	260004	f	4358d362-cbf1-408e-8fb4-b13c6d4aec94	vndms.dmc.gov.vn
4692	Thông số đo mưa	\N	0	RAIN	\N	\N	260005	f	69956031-2dba-4aba-89e0-9d79a30b0b3c	vndms.dmc.gov.vn
4693	Thông số đo mưa	\N	0	RAIN	\N	\N	260006	f	a3e4bba4-d448-46fc-94b1-c26eb37a7f2e	vndms.dmc.gov.vn
4694	Thông số đo mưa	\N	0	RAIN	\N	\N	260007	f	d8215e4e-202f-4f9f-834b-8e33ae135b9f	vndms.dmc.gov.vn
4695	Thông số đo mưa	\N	0	RAIN	\N	\N	260009	f	14b3b0fe-3dc8-43bb-acae-32ba11feb8e6	vndms.dmc.gov.vn
4696	Thông số đo mưa	\N	0	RAIN	\N	\N	260010	f	b0868709-8579-4aab-ac57-4130aea4dc2e	vndms.dmc.gov.vn
4697	Thông số đo mưa	\N	0	RAIN	\N	\N	260011	f	5400f6fa-578a-4cc9-9e00-e95768ec6c40	vndms.dmc.gov.vn
4698	Thông số đo mưa	\N	0	RAIN	\N	\N	260012	f	436bbfe5-6eaa-4f62-9dfb-f90b08b09c40	vndms.dmc.gov.vn
4699	Thông số đo mưa	\N	0	RAIN	\N	\N	260021	f	fe0a8922-3fa1-47cf-a839-2ab177c388e5	vndms.dmc.gov.vn
4700	Thông số đo mưa	\N	0	RAIN	\N	\N	260022	f	7d1ba0a2-e89d-40b1-8550-c354b4270e35	vndms.dmc.gov.vn
4701	Thông số đo mưa	\N	0	RAIN	\N	\N	260023	f	16d69726-3176-45c6-b2b1-550840aff84e	vndms.dmc.gov.vn
4702	Thông số đo mưa	\N	0	RAIN	\N	\N	260024	f	94eaf6e8-bf6b-4c11-aa91-272a59983ee1	vndms.dmc.gov.vn
4703	Thông số đo mưa	\N	0	RAIN	\N	\N	260025	f	e22c0e0f-3890-428f-bc32-f6afabf1b2ed	vndms.dmc.gov.vn
4704	Thông số đo mưa	\N	0	RAIN	\N	\N	260026	f	7c2482e8-d64d-4431-bf10-6976ec73bef1	vndms.dmc.gov.vn
4705	Thông số đo mưa	\N	0	RAIN	\N	\N	260027	f	e66895ac-3d34-462c-b777-3619e50e199c	vndms.dmc.gov.vn
4706	Thông số đo mưa	\N	0	RAIN	\N	\N	260028	f	d8b36f2d-a4de-4d8f-8f75-732d8c09ce9f	vndms.dmc.gov.vn
4707	Thông số đo mưa	\N	0	RAIN	\N	\N	260029	f	ef202e1c-b076-4f22-9d5d-fec717ed824d	vndms.dmc.gov.vn
4708	Thông số đo mưa	\N	0	RAIN	\N	\N	260030	f	6fb0a448-9c63-4020-8650-d45388602fd2	vndms.dmc.gov.vn
4709	Thông số đo mưa	\N	0	RAIN	\N	\N	260101	f	bed32c7a-e6d3-465d-bbad-d0bf2f2d8e5b	vndms.dmc.gov.vn
4710	Thông số đo mưa	\N	0	RAIN	\N	\N	260102	f	295a7cbe-2db5-4051-aa00-231ce7bbf932	vndms.dmc.gov.vn
4711	Thông số đo mưa	\N	0	RAIN	\N	\N	260103	f	d440c37a-69b8-4d96-9c06-2b6c2f706448	vndms.dmc.gov.vn
4712	Thông số đo mưa	\N	0	RAIN	\N	\N	260104	f	1941d432-3efe-4c8f-81c4-cf87626c00bd	vndms.dmc.gov.vn
4713	Thông số đo mưa	\N	0	RAIN	\N	\N	260105	f	5dfd95b9-54f7-4084-a7a2-0e327ef0b3b8	vndms.dmc.gov.vn
4714	Thông số đo mưa	\N	0	RAIN	\N	\N	260106	f	4dba7a68-f3c6-4b92-8354-621854405483	vndms.dmc.gov.vn
4715	Thông số đo mưa	\N	0	RAIN	\N	\N	260107	f	1928cdd6-e986-44d0-af82-48b1bb173984	vndms.dmc.gov.vn
4716	Thông số đo mưa	\N	0	RAIN	\N	\N	260108	f	abb01083-3419-4cc9-b2f1-094d9cd7dd7f	vndms.dmc.gov.vn
4717	Thông số đo mưa	\N	0	RAIN	\N	\N	260109	f	51d2c47e-b64e-4dcc-a0b5-762ff3af9446	vndms.dmc.gov.vn
4718	Thông số đo mưa	\N	0	RAIN	\N	\N	260110	f	c1833de5-91f3-4f47-b359-95064fef5dc2	vndms.dmc.gov.vn
4719	Thông số đo mưa	\N	0	RAIN	\N	\N	260111	f	b7061d59-b2ed-4750-a06d-46737cd5b84e	vndms.dmc.gov.vn
4720	Thông số đo mưa	\N	0	RAIN	\N	\N	260112	f	9806e92c-7075-45b9-b781-5d2cfa97db2a	vndms.dmc.gov.vn
4721	Thông số đo mưa	\N	0	RAIN	\N	\N	260113	f	f8531d6a-dc17-4be2-964a-132e1ca8a946	vndms.dmc.gov.vn
4722	Thông số đo mưa	\N	0	RAIN	\N	\N	260114	f	1499b382-689c-4aba-88d9-72ca382f1688	vndms.dmc.gov.vn
4723	Thông số đo mưa	\N	0	RAIN	\N	\N	260115	f	79ad07fc-f0a3-46e7-94c3-238d9b4a2449	vndms.dmc.gov.vn
4724	Thông số đo mưa	\N	0	RAIN	\N	\N	260116	f	b6bcd362-2176-4c9b-8b8b-b9c66868c4ee	vndms.dmc.gov.vn
4725	Thông số đo mưa	\N	0	RAIN	\N	\N	260117	f	6fcc4d9d-6ccb-4812-8859-beaff60d313f	vndms.dmc.gov.vn
4726	Thông số đo mưa	\N	0	RAIN	\N	\N	260118	f	7f76c04c-b2cd-413f-9663-f1f4cf16150d	vndms.dmc.gov.vn
4727	Thông số đo mưa	\N	0	RAIN	\N	\N	260119	f	22499e88-51f1-4707-ae9d-f0957578dc04	vndms.dmc.gov.vn
4728	Thông số đo mưa	\N	0	RAIN	\N	\N	260120	f	1540fe70-ad1c-40a3-8905-acd2b7bde9de	vndms.dmc.gov.vn
4729	Thông số đo mưa	\N	0	RAIN	\N	\N	260121	f	3bd9c8ea-eb92-4aa6-9eb7-bfe965b28b5b	vndms.dmc.gov.vn
4730	Thông số đo mưa	\N	0	RAIN	\N	\N	260122	f	73c08e24-491d-46fe-ad8f-07e0f916c671	vndms.dmc.gov.vn
4731	Thông số đo mưa	\N	0	RAIN	\N	\N	260123	f	7d694648-1fde-430c-974b-8ed61ad10e1f	vndms.dmc.gov.vn
4732	Thông số đo mưa	\N	0	RAIN	\N	\N	260124	f	f0aad081-be85-4868-a0af-0d76c98d4470	vndms.dmc.gov.vn
4733	Thông số đo mưa	\N	0	RAIN	\N	\N	260125	f	6b123599-59e6-4d46-a43f-5cf43bd23159	vndms.dmc.gov.vn
4734	Thông số đo mưa	\N	0	RAIN	\N	\N	260126	f	d3770298-7b76-461c-98ab-718e3cf3e9a1	vndms.dmc.gov.vn
4735	Thông số đo mưa	\N	0	RAIN	\N	\N	260127	f	fb94ae20-818a-488f-baab-c6b76a5b1f9e	vndms.dmc.gov.vn
4736	Thông số đo mưa	\N	0	RAIN	\N	\N	260128	f	330748d1-deaf-4128-8c4a-b32506254320	vndms.dmc.gov.vn
4737	Thông số đo mưa	\N	0	RAIN	\N	\N	260129	f	860e2067-c40c-49c6-a0b7-26e9cc1ba052	vndms.dmc.gov.vn
4738	Thông số đo mưa	\N	0	RAIN	\N	\N	260130	f	dbe9dea8-0ff6-4279-94ea-ba6d4887cfdf	vndms.dmc.gov.vn
4739	Thông số đo mưa	\N	0	RAIN	\N	\N	260131	f	82e39bda-077b-45cc-9060-7127c70b9d88	vndms.dmc.gov.vn
4740	Thông số đo mưa	\N	0	RAIN	\N	\N	260132	f	15627e4e-9341-46d8-8e00-59708cbf41b9	vndms.dmc.gov.vn
4741	Thông số đo mưa	\N	0	RAIN	\N	\N	260133	f	6e16e110-cbc5-4924-989b-7114e6ba42e6	vndms.dmc.gov.vn
4742	Thông số đo mưa	\N	0	RAIN	\N	\N	260134	f	a028e9fc-c112-411c-96d8-4f7fd1e62cc6	vndms.dmc.gov.vn
4743	Thông số đo mưa	\N	0	RAIN	\N	\N	260135	f	43f8be0c-522c-4a16-abcf-a12c94dac8dd	vndms.dmc.gov.vn
4744	Thông số đo mưa	\N	0	RAIN	\N	\N	260136	f	aebe7275-7697-492f-ba91-74c59d8978cc	vndms.dmc.gov.vn
4745	Thông số đo mưa	\N	0	RAIN	\N	\N	260137	f	e5b8bcd2-1efc-4831-89a9-803d493a455c	vndms.dmc.gov.vn
4746	Thông số đo mưa	\N	0	RAIN	\N	\N	260138	f	6040a9f1-2698-4fe7-a497-e851f142f2f3	vndms.dmc.gov.vn
4747	Thông số đo mưa	\N	0	RAIN	\N	\N	260139	f	36af15e7-aa25-4978-8907-ca74b068dc54	vndms.dmc.gov.vn
4748	Thông số đo mưa	\N	0	RAIN	\N	\N	261536	f	614c7cc7-8b08-4264-b029-88257223454d	vndms.dmc.gov.vn
4749	Thông số đo mưa	\N	0	RAIN	\N	\N	262160	f	194ebdf6-f25e-49bf-b1c4-b0c17007a8b1	vndms.dmc.gov.vn
4750	Thông số đo mưa	\N	0	RAIN	\N	\N	264017	f	792d42ad-873c-4081-81bf-c47160a26b04	vndms.dmc.gov.vn
4751	Thông số đo mưa	\N	0	RAIN	\N	\N	264504	f	7a440a6e-118f-4891-8222-b46c4b0d8d23	vndms.dmc.gov.vn
4752	Thông số đo mưa	\N	0	RAIN	\N	\N	265937	f	f9fb77ed-6b0d-4efe-832c-977cafeca815	vndms.dmc.gov.vn
4753	Thông số đo mưa	\N	0	RAIN	\N	\N	266249	f	4121e7d8-f643-4c0e-affc-ce5d062a3f0b	vndms.dmc.gov.vn
4754	Thông số đo mưa	\N	0	RAIN	\N	\N	266991	f	1417fdbb-8d0f-4272-a4ae-379f2984093c	vndms.dmc.gov.vn
4755	Thông số đo mưa	\N	0	RAIN	\N	\N	267081	f	1fb9543f-a7e9-4f51-9550-1bb7b96103ab	vndms.dmc.gov.vn
4756	Thông số đo mưa	\N	0	RAIN	\N	\N	267735	f	a03c5689-fe6c-4cf0-aa6a-dbdab1176a92	vndms.dmc.gov.vn
4757	Thông số đo mưa	\N	0	RAIN	\N	\N	268545	f	7e9bf4ff-fb9f-4baa-b151-b3f0d1651619	vndms.dmc.gov.vn
4758	Thông số đo mưa	\N	0	RAIN	\N	\N	270001	f	6a4d01df-f3ac-401e-bf89-8f7871c7bfc8	vndms.dmc.gov.vn
4759	Thông số đo mưa	\N	0	RAIN	\N	\N	270002	f	7b9773c8-7714-4690-a892-a6e8de94307d	vndms.dmc.gov.vn
4760	Thông số đo mưa	\N	0	RAIN	\N	\N	270003	f	3af0d508-4cc4-4a65-b7f9-66370c112a83	vndms.dmc.gov.vn
4761	Thông số đo mưa	\N	0	RAIN	\N	\N	270004	f	cc211d15-c861-4eff-8b2d-72ccecb4b9b3	vndms.dmc.gov.vn
4762	Thông số đo mưa	\N	0	RAIN	\N	\N	270005	f	28dfff24-4f70-49ac-b125-57b65c225361	vndms.dmc.gov.vn
4763	Thông số đo mưa	\N	0	RAIN	\N	\N	270006	f	e806afe6-c219-43b3-b81e-954125a82595	vndms.dmc.gov.vn
4764	Thông số đo mưa	\N	0	RAIN	\N	\N	270007	f	febec7a4-c245-41f1-9a09-9f2108dd445f	vndms.dmc.gov.vn
4765	Thông số đo mưa	\N	0	RAIN	\N	\N	270008	f	f2b13e0a-0ea7-4a12-badd-49d74653e04b	vndms.dmc.gov.vn
4766	Thông số đo mưa	\N	0	RAIN	\N	\N	270009	f	1e23cb3a-55e7-467d-a916-2223ad20f285	vndms.dmc.gov.vn
4767	Thông số đo mưa	\N	0	RAIN	\N	\N	270010	f	ee76cb9c-4c97-421a-b173-422e41149201	vndms.dmc.gov.vn
4768	Thông số đo mưa	\N	0	RAIN	\N	\N	270011	f	cbf88467-196b-4a74-870a-7d364470158d	vndms.dmc.gov.vn
4769	Thông số đo mưa	\N	0	RAIN	\N	\N	270012	f	8c54ee65-d7c7-43dc-a1ef-b05eff6b637a	vndms.dmc.gov.vn
4770	Thông số đo mưa	\N	0	RAIN	\N	\N	272169	f	75167e1a-1ace-4354-8963-03a794cec8cb	vndms.dmc.gov.vn
4771	Thông số đo mưa	\N	0	RAIN	\N	\N	272342	f	60d6dffb-9888-4c1e-ac0d-208b2f81cc59	vndms.dmc.gov.vn
4772	Thông số đo mưa	\N	0	RAIN	\N	\N	276051	f	74bba5bd-787b-4a3c-9ac7-b6df102f0692	vndms.dmc.gov.vn
4773	Thông số đo mưa	\N	0	RAIN	\N	\N	277905	f	6d6fb5fb-91a2-4731-9bf7-8c775aca154f	vndms.dmc.gov.vn
4774	Thông số đo mưa	\N	0	RAIN	\N	\N	27842	f	42c84bd5-f49d-4e62-b8fb-7fd92607f4a2	vndms.dmc.gov.vn
4775	Thông số đo mưa	\N	0	RAIN	\N	\N	279230	f	cf3d3447-8411-47ae-a8dd-bb19cc1d62ad	vndms.dmc.gov.vn
4776	Thông số đo mưa	\N	0	RAIN	\N	\N	281132	f	299ad6c7-155d-4ff5-acec-7f514fa7e0dd	vndms.dmc.gov.vn
4777	Thông số đo mưa	\N	0	RAIN	\N	\N	281543	f	82530645-c2c0-4b5f-a76a-a297a70e5722	vndms.dmc.gov.vn
4778	Thông số đo mưa	\N	0	RAIN	\N	\N	283008	f	0d9fd180-d089-4d49-9e21-405c4876bfa2	vndms.dmc.gov.vn
4779	Thông số đo mưa	\N	0	RAIN	\N	\N	285827	f	c4c62dff-67c7-4c9d-af36-2134fe7228d7	vndms.dmc.gov.vn
4780	Thông số đo mưa	\N	0	RAIN	\N	\N	285864	f	1b6d33f7-6b71-4ec1-a823-17fa5369549e	vndms.dmc.gov.vn
4781	Thông số đo mưa	\N	0	RAIN	\N	\N	288537	f	c41b7ff1-46a9-4929-b046-660ddc828303	vndms.dmc.gov.vn
4782	Thông số đo mưa	\N	0	RAIN	\N	\N	289205	f	3b81ae33-840b-4b47-b155-6e1655dbbb77	vndms.dmc.gov.vn
4783	Thông số đo mưa	\N	0	RAIN	\N	\N	289924	f	a62bbcab-cf43-4c1e-bd97-2de4f906bd17	vndms.dmc.gov.vn
4784	Thông số đo mưa	\N	0	RAIN	\N	\N	29297	f	a47e0678-82bf-45a5-99d3-bd4d57b86570	vndms.dmc.gov.vn
4785	Thông số đo mưa	\N	0	RAIN	\N	\N	295290	f	e3484db4-d1d5-4226-a108-bd16cf7290fa	vndms.dmc.gov.vn
4786	Thông số đo mưa	\N	0	RAIN	\N	\N	295482	f	52d5d9f0-0980-4570-8df7-ba296c5b5fbd	vndms.dmc.gov.vn
4787	Thông số đo mưa	\N	0	RAIN	\N	\N	295597	f	a4890c1a-003b-4547-9ec5-6308228de299	vndms.dmc.gov.vn
4788	Thông số đo mưa	\N	0	RAIN	\N	\N	298517	f	44fa136a-a790-48b6-b5c7-8aa1c55dae56	vndms.dmc.gov.vn
4789	Thông số đo mưa	\N	0	RAIN	\N	\N	298731	f	6baef37d-0e87-4955-aef4-043b7068e632	vndms.dmc.gov.vn
4790	Thông số đo mưa	\N	0	RAIN	\N	\N	299387	f	fbec28a2-9553-4ab8-8c4a-d233f5bd0dcf	vndms.dmc.gov.vn
4791	Thông số đo mưa	\N	0	RAIN	\N	\N	301248	f	1770666f-5bbe-4dbd-8572-82a14966e070	vndms.dmc.gov.vn
4792	Thông số đo mưa	\N	0	RAIN	\N	\N	302427	f	d65b1192-8491-46d2-ba26-f53c71faf3ba	vndms.dmc.gov.vn
4793	Thông số đo mưa	\N	0	RAIN	\N	\N	306420	f	8b5b8c3f-189f-40a7-ac56-56dd03d1f82f	vndms.dmc.gov.vn
4794	Thông số đo mưa	\N	0	RAIN	\N	\N	306474	f	c0d14307-7e7f-4457-8770-37c7c69634ac	vndms.dmc.gov.vn
4795	Thông số đo mưa	\N	0	RAIN	\N	\N	310247	f	8f168a30-f4a7-4e2c-a673-fa8839adab36	vndms.dmc.gov.vn
4796	Thông số đo mưa	\N	0	RAIN	\N	\N	312213	f	5f807dfe-49b1-4a47-a1c3-9e5cefd1022c	vndms.dmc.gov.vn
4797	Thông số đo mưa	\N	0	RAIN	\N	\N	312419	f	e9beab6a-1e69-4f56-a160-436d644a2727	vndms.dmc.gov.vn
4798	Thông số đo mưa	\N	0	RAIN	\N	\N	312609	f	c9dd887d-1c03-402c-8433-130ab1cfc179	vndms.dmc.gov.vn
4799	Thông số đo mưa	\N	0	RAIN	\N	\N	315542	f	b823436b-9486-4dff-a0e4-c0ed5876847d	vndms.dmc.gov.vn
4800	Thông số đo mưa	\N	0	RAIN	\N	\N	315718	f	a9362767-f1e6-41a4-914e-a776f50b6e18	vndms.dmc.gov.vn
4801	Thông số đo mưa	\N	0	RAIN	\N	\N	315764	f	65ec9fb6-ac32-4ed4-8223-4dfc5884ce02	vndms.dmc.gov.vn
4802	Thông số đo mưa	\N	0	RAIN	\N	\N	317420	f	fa8ca7c3-0719-444a-ace1-72654802f2a7	vndms.dmc.gov.vn
4803	Thông số đo mưa	\N	0	RAIN	\N	\N	319225	f	cd869965-19c6-4652-ae05-016c90bcb2e2	vndms.dmc.gov.vn
4804	Thông số đo mưa	\N	0	RAIN	\N	\N	320831	f	d31290f1-e71a-41e0-b5e2-294acccba282	vndms.dmc.gov.vn
4805	Thông số đo mưa	\N	0	RAIN	\N	\N	321497	f	01febcac-9d8c-4b7e-aea3-b69a097f19e2	vndms.dmc.gov.vn
4806	Thông số đo mưa	\N	0	RAIN	\N	\N	323592	f	a77ef44d-0c6b-498a-a1c5-691f51982472	vndms.dmc.gov.vn
4807	Thông số đo mưa	\N	0	RAIN	\N	\N	325951	f	56296362-a0c0-4692-aa4f-b295c2c4d56c	vndms.dmc.gov.vn
4808	Thông số đo mưa	\N	0	RAIN	\N	\N	328065	f	8fa9436a-dc8e-4070-a1a8-4d19ca22dda8	vndms.dmc.gov.vn
4809	Thông số đo mưa	\N	0	RAIN	\N	\N	328645	f	05949681-884f-4349-912a-3104fa916bcb	vndms.dmc.gov.vn
4810	Thông số đo mưa	\N	0	RAIN	\N	\N	329635	f	ac76dd74-3d5f-4c83-a126-735a12ec00a2	vndms.dmc.gov.vn
4811	Thông số đo mưa	\N	0	RAIN	\N	\N	330791	f	235e503f-b674-4591-b6b5-d55720c26291	vndms.dmc.gov.vn
4812	Thông số đo mưa	\N	0	RAIN	\N	\N	331696	f	c8ba638c-5245-4eb1-8b74-e86aeef06e6e	vndms.dmc.gov.vn
4813	Thông số đo mưa	\N	0	RAIN	\N	\N	332867	f	01aa4c56-17b9-4107-a718-667505bf4acf	vndms.dmc.gov.vn
4814	Thông số đo mưa	\N	0	RAIN	\N	\N	334162	f	8dd29b38-2603-445a-b848-76c4c00f831c	vndms.dmc.gov.vn
4815	Thông số đo mưa	\N	0	RAIN	\N	\N	334729	f	e21a36c0-006a-4920-a200-919e9835a720	vndms.dmc.gov.vn
4816	Thông số đo mưa	\N	0	RAIN	\N	\N	335172	f	7f24cea5-9700-49c9-9de1-025f375dac5d	vndms.dmc.gov.vn
4817	Thông số đo mưa	\N	0	RAIN	\N	\N	338591	f	0b24a527-908a-4007-94cd-9cd355115a59	vndms.dmc.gov.vn
4818	Thông số đo mưa	\N	0	RAIN	\N	\N	340001	f	d05c47bd-68a0-461e-8375-33e08017a5e0	vndms.dmc.gov.vn
4819	Thông số đo mưa	\N	0	RAIN	\N	\N	340292	f	e631e007-cdab-4afd-9d5d-89d33148281e	vndms.dmc.gov.vn
4820	Thông số đo mưa	\N	0	RAIN	\N	\N	340308	f	c0b84ebd-8168-4c09-b898-7aa9d947cbfd	vndms.dmc.gov.vn
4821	Thông số đo mưa	\N	0	RAIN	\N	\N	340310	f	0eb9b190-b80d-498a-a3bc-6dcb0b1722bb	vndms.dmc.gov.vn
4822	Thông số đo mưa	\N	0	RAIN	\N	\N	34077	f	b7d7d50c-1ce6-4020-a7ff-f103ceab2252	vndms.dmc.gov.vn
4823	Thông số đo mưa	\N	0	RAIN	\N	\N	341076	f	ad18a0c2-da95-4673-a947-2ef211634cda	vndms.dmc.gov.vn
4824	Thông số đo mưa	\N	0	RAIN	\N	\N	341077	f	7e6ab9fe-3944-4f88-972c-02e90f653d23	vndms.dmc.gov.vn
4825	Thông số đo mưa	\N	0	RAIN	\N	\N	341078	f	3bbc7b9c-643f-4da8-af3d-643570ea6146	vndms.dmc.gov.vn
4826	Thông số đo mưa	\N	0	RAIN	\N	\N	341080	f	dc0e358c-b4a7-4a87-b829-16b3d54f022d	vndms.dmc.gov.vn
4827	Thông số đo mưa	\N	0	RAIN	\N	\N	341081	f	a5b0eeed-b418-40c2-bdb2-768176eab076	vndms.dmc.gov.vn
4828	Thông số đo mưa	\N	0	RAIN	\N	\N	341261	f	b6df57be-4693-4f71-8c38-b5517d50ed97	vndms.dmc.gov.vn
4829	Thông số đo mưa	\N	0	RAIN	\N	\N	341347	f	6187eb62-2214-4081-a6b6-7e4d62933e00	vndms.dmc.gov.vn
4830	Thông số đo mưa	\N	0	RAIN	\N	\N	341801	f	877ded26-4603-47bd-844e-df86b5ebcc1f	vndms.dmc.gov.vn
4831	Thông số đo mưa	\N	0	RAIN	\N	\N	342807	f	6d1e4a2f-3e51-4d67-a501-9ea19ece13f3	vndms.dmc.gov.vn
4832	Thông số đo mưa	\N	0	RAIN	\N	\N	343041	f	0696b923-8b74-4a0f-ac08-04dd6e827bd4	vndms.dmc.gov.vn
4833	Thông số đo mưa	\N	0	RAIN	\N	\N	343042	f	4dbb947a-5443-4ae9-a149-cda385c642c5	vndms.dmc.gov.vn
4834	Thông số đo mưa	\N	0	RAIN	\N	\N	343043	f	261dc774-2288-45cf-bb1e-726dedbb93ec	vndms.dmc.gov.vn
4835	Thông số đo mưa	\N	0	RAIN	\N	\N	343046	f	31c67674-affe-43cf-b9e1-5184ebe50f19	vndms.dmc.gov.vn
4836	Thông số đo mưa	\N	0	RAIN	\N	\N	343047	f	822de8f6-186d-4df1-ae92-00376e9af039	vndms.dmc.gov.vn
4837	Thông số đo mưa	\N	0	RAIN	\N	\N	343050	f	97beed89-7fce-4b8e-be12-33900559f7ea	vndms.dmc.gov.vn
4838	Thông số đo mưa	\N	0	RAIN	\N	\N	344112	f	00f5c33a-d0af-4b8b-969b-70767c9f4b54	vndms.dmc.gov.vn
4839	Thông số đo mưa	\N	0	RAIN	\N	\N	344113	f	02d94bb0-4a74-4995-8e3e-9f9f059d3751	vndms.dmc.gov.vn
4840	Thông số đo mưa	\N	0	RAIN	\N	\N	344114	f	f4034488-64ff-4743-ac28-21c5d7266bec	vndms.dmc.gov.vn
4841	Thông số đo mưa	\N	0	RAIN	\N	\N	34419	f	470e314e-9bb1-4da7-9a2d-a2056dfde321	vndms.dmc.gov.vn
4842	Thông số đo mưa	\N	0	RAIN	\N	\N	344845	f	2e043853-8521-42c3-a290-4ad469080745	vndms.dmc.gov.vn
4843	Thông số đo mưa	\N	0	RAIN	\N	\N	345334	f	d5f52ce7-cc47-452c-b866-d4c11dca4c83	vndms.dmc.gov.vn
4844	Thông số đo mưa	\N	0	RAIN	\N	\N	346097	f	3955c981-57fc-4e4d-9f11-05d2b24dac09	vndms.dmc.gov.vn
4845	Thông số đo mưa	\N	0	RAIN	\N	\N	347254	f	f6ad0bec-a155-4e18-8c16-86e0d213838b	vndms.dmc.gov.vn
4846	Thông số đo mưa	\N	0	RAIN	\N	\N	349415	f	97bb7785-5786-4262-ac25-cf8f32a592cd	vndms.dmc.gov.vn
4847	Thông số đo mưa	\N	0	RAIN	\N	\N	349772	f	a39934d2-737f-475e-ab55-058c351d2685	vndms.dmc.gov.vn
4848	Thông số đo mưa	\N	0	RAIN	\N	\N	350001	f	27e9644e-5e6f-4439-aae2-52a59692ac3a	vndms.dmc.gov.vn
4849	Thông số đo mưa	\N	0	RAIN	\N	\N	350002	f	600c1734-535a-4fc6-9959-cbcc7d57baee	vndms.dmc.gov.vn
4850	Thông số đo mưa	\N	0	RAIN	\N	\N	350003	f	25f4e4af-4229-4409-802d-7799a9586bf5	vndms.dmc.gov.vn
4851	Thông số đo mưa	\N	0	RAIN	\N	\N	350004	f	ec04e018-1a49-49e8-8a9c-7212d94e4a86	vndms.dmc.gov.vn
4852	Thông số đo mưa	\N	0	RAIN	\N	\N	350005	f	e1835e29-bbac-40b2-9387-d0ad28657d7e	vndms.dmc.gov.vn
4853	Thông số đo mưa	\N	0	RAIN	\N	\N	350006	f	3ee49234-b567-4103-acec-aa3497a81eb3	vndms.dmc.gov.vn
4854	Thông số đo mưa	\N	0	RAIN	\N	\N	350007	f	ef2a9bc0-ab90-4392-b024-76b0d86ad3dd	vndms.dmc.gov.vn
4855	Thông số đo mưa	\N	0	RAIN	\N	\N	350008	f	ee5c6d47-aca7-4207-a192-50ba625e52a9	vndms.dmc.gov.vn
4856	Thông số đo mưa	\N	0	RAIN	\N	\N	350009	f	f95515ab-6fd7-4192-879b-31fbd20c9e37	vndms.dmc.gov.vn
4857	Thông số đo mưa	\N	0	RAIN	\N	\N	350010	f	aa731cdb-52ab-43f0-baf7-8d6b5f85c627	vndms.dmc.gov.vn
4858	Thông số đo mưa	\N	0	RAIN	\N	\N	350094	f	703d8263-a637-40fc-aa5b-df7ab64ef37a	vndms.dmc.gov.vn
4859	Thông số đo mưa	\N	0	RAIN	\N	\N	350721	f	d66732c7-0ad5-4738-bd7e-dda8c0b8c24a	vndms.dmc.gov.vn
4860	Thông số đo mưa	\N	0	RAIN	\N	\N	351435	f	9c15cd6a-10ea-45fd-a96d-67a797504be5	vndms.dmc.gov.vn
4861	Thông số đo mưa	\N	0	RAIN	\N	\N	352410	f	5f1bd447-a074-4b7d-971e-5f76f2cac732	vndms.dmc.gov.vn
4862	Thông số đo mưa	\N	0	RAIN	\N	\N	35292	f	721a1170-4973-4bd1-a4c6-b88eb566d3ec	vndms.dmc.gov.vn
4863	Thông số đo mưa	\N	0	RAIN	\N	\N	353102	f	af4dfae6-8d69-4afd-a478-9431be5bc537	vndms.dmc.gov.vn
4864	Thông số đo mưa	\N	0	RAIN	\N	\N	353105	f	3dc2a315-5ae8-42ed-9b41-5bdafcd4a1f0	vndms.dmc.gov.vn
4865	Thông số đo mưa	\N	0	RAIN	\N	\N	353106	f	836646c9-878c-4fc7-80b3-4a799c979fc0	vndms.dmc.gov.vn
4866	Thông số đo mưa	\N	0	RAIN	\N	\N	353107	f	d6f84885-2774-4635-bc7a-a7b6ec6c4066	vndms.dmc.gov.vn
4867	Thông số đo mưa	\N	0	RAIN	\N	\N	353108	f	aea58d91-d5c6-4fa9-bac8-5b8c7e03fb03	vndms.dmc.gov.vn
4868	Thông số đo mưa	\N	0	RAIN	\N	\N	353109	f	48862fa8-0044-4741-a95f-1717e54af988	vndms.dmc.gov.vn
4869	Thông số đo mưa	\N	0	RAIN	\N	\N	353872	f	6066849d-c0b4-4926-a707-32353d57aae8	vndms.dmc.gov.vn
4870	Thông số đo mưa	\N	0	RAIN	\N	\N	354093	f	5b4a3a6b-728f-4072-9f6e-22d09b217f96	vndms.dmc.gov.vn
4871	Thông số đo mưa	\N	0	RAIN	\N	\N	354128	f	3f3f757f-bded-4763-a5fa-0589369387ee	vndms.dmc.gov.vn
4872	Thông số đo mưa	\N	0	RAIN	\N	\N	354388	f	83d5713f-9974-4c8e-ab8f-80d36fc8b02c	vndms.dmc.gov.vn
4873	Thông số đo mưa	\N	0	RAIN	\N	\N	354395	f	0ddc6dad-fd64-4746-a613-c11af68802ff	vndms.dmc.gov.vn
4874	Thông số đo mưa	\N	0	RAIN	\N	\N	354398	f	296459ff-4bdb-4a60-9aee-7b388fd61649	vndms.dmc.gov.vn
4875	Thông số đo mưa	\N	0	RAIN	\N	\N	354401	f	b931ed5f-6076-4d7f-9814-356357b03c0e	vndms.dmc.gov.vn
4876	Thông số đo mưa	\N	0	RAIN	\N	\N	354412	f	83361bdc-acd0-4104-ab4a-10f6e3a705f6	vndms.dmc.gov.vn
4877	Thông số đo mưa	\N	0	RAIN	\N	\N	354413	f	0cd11c32-c663-46c3-8662-02e4e43a80f8	vndms.dmc.gov.vn
4878	Thông số đo mưa	\N	0	RAIN	\N	\N	354518	f	083c1224-4573-408b-a541-e843b242c341	vndms.dmc.gov.vn
4879	Thông số đo mưa	\N	0	RAIN	\N	\N	354563	f	68a082e9-e4ac-419b-8c33-0328e5dcffb6	vndms.dmc.gov.vn
4880	Thông số đo mưa	\N	0	RAIN	\N	\N	354565	f	ae9d6cb1-1562-4c56-8d4c-75d0dd3393a6	vndms.dmc.gov.vn
4881	Thông số đo mưa	\N	0	RAIN	\N	\N	354572	f	3231032a-12d9-4f41-a2ae-be86779129f4	vndms.dmc.gov.vn
4882	Thông số đo mưa	\N	0	RAIN	\N	\N	354574	f	baf30976-6fea-47b1-817c-1f893873b3e9	vndms.dmc.gov.vn
4883	Thông số đo mưa	\N	0	RAIN	\N	\N	354578	f	b0b62e1e-8bbb-4b80-82db-7cb943acb789	vndms.dmc.gov.vn
4884	Thông số đo mưa	\N	0	RAIN	\N	\N	354590	f	2aa765ed-bf6f-43f8-bdbb-3cbd935d3b39	vndms.dmc.gov.vn
4885	Thông số đo mưa	\N	0	RAIN	\N	\N	354697	f	3044a529-e318-4344-92a4-9afc1b0c8911	vndms.dmc.gov.vn
4886	Thông số đo mưa	\N	0	RAIN	\N	\N	354932	f	85f690eb-54ee-4f42-92d9-fea1caaf24a4	vndms.dmc.gov.vn
4887	Thông số đo mưa	\N	0	RAIN	\N	\N	354933	f	62883a65-c7d0-430c-9dfc-0cc05ebe5980	vndms.dmc.gov.vn
4888	Thông số đo mưa	\N	0	RAIN	\N	\N	354941	f	9caef50e-0728-4a54-860f-5d8c47d8d714	vndms.dmc.gov.vn
4889	Thông số đo mưa	\N	0	RAIN	\N	\N	354943	f	43b0ee4c-7cfc-443c-9d1d-95c64007b5c2	vndms.dmc.gov.vn
4890	Thông số đo mưa	\N	0	RAIN	\N	\N	355032	f	57dc6344-0e39-4336-8067-7aa98f9747be	vndms.dmc.gov.vn
4891	Thông số đo mưa	\N	0	RAIN	\N	\N	355132	f	0da39dff-7f0e-478d-9f2d-780ce45d4794	vndms.dmc.gov.vn
4892	Thông số đo mưa	\N	0	RAIN	\N	\N	355243	f	88285a71-2cff-4f3c-9ffd-4d99b276aa67	vndms.dmc.gov.vn
4893	Thông số đo mưa	\N	0	RAIN	\N	\N	355625	f	06876548-9bdf-48ab-abe2-6d7ea89493da	vndms.dmc.gov.vn
4894	Thông số đo mưa	\N	0	RAIN	\N	\N	355680	f	7b15441b-12c1-4958-9498-b5dad5cf187e	vndms.dmc.gov.vn
4895	Thông số đo mưa	\N	0	RAIN	\N	\N	355682	f	110c5a34-f02c-486f-a030-e7d60ffa24c6	vndms.dmc.gov.vn
4896	Thông số đo mưa	\N	0	RAIN	\N	\N	355746	f	0a9f4f29-8ca1-4c8d-8607-253fd2582e0c	vndms.dmc.gov.vn
4897	Thông số đo mưa	\N	0	RAIN	\N	\N	355749	f	bc3fa267-a14e-40f3-bc81-f265ae917a33	vndms.dmc.gov.vn
4898	Thông số đo mưa	\N	0	RAIN	\N	\N	355760	f	611c0d65-2e08-423f-860e-0081e6dd2e23	vndms.dmc.gov.vn
4899	Thông số đo mưa	\N	0	RAIN	\N	\N	355761	f	5d60ca9d-53b3-4f64-b199-ec6a98eda78e	vndms.dmc.gov.vn
4900	Thông số đo mưa	\N	0	RAIN	\N	\N	355762	f	cb6736f4-258e-4723-9421-2b92a7ee53c4	vndms.dmc.gov.vn
4901	Thông số đo mưa	\N	0	RAIN	\N	\N	355827	f	369c1af3-4b87-4e8b-8d58-86bc30d0af6e	vndms.dmc.gov.vn
4902	Thông số đo mưa	\N	0	RAIN	\N	\N	355877	f	ab55f092-e9f6-4d87-9df6-6ee86bc7e51a	vndms.dmc.gov.vn
4903	Thông số đo mưa	\N	0	RAIN	\N	\N	355886	f	92235280-9f40-424e-8065-0c67d863afdd	vndms.dmc.gov.vn
4904	Thông số đo mưa	\N	0	RAIN	\N	\N	356172	f	6beb6294-c42b-4350-a114-f6ed2cd11894	vndms.dmc.gov.vn
4905	Thông số đo mưa	\N	0	RAIN	\N	\N	356180	f	3e93c156-3e7d-40d0-a378-d4cbebf3c6c9	vndms.dmc.gov.vn
4906	Thông số đo mưa	\N	0	RAIN	\N	\N	356181	f	c65a294f-8de7-4fb7-8f9f-67fb3af9fba4	vndms.dmc.gov.vn
4907	Thông số đo mưa	\N	0	RAIN	\N	\N	35621	f	6c85e001-66ea-4e6b-af41-b8689309bbae	vndms.dmc.gov.vn
4908	Thông số đo mưa	\N	0	RAIN	\N	\N	356211	f	c91d2083-7aca-4569-bbcf-3d975036e712	vndms.dmc.gov.vn
4909	Thông số đo mưa	\N	0	RAIN	\N	\N	356217	f	e48a2b9d-eee4-415d-aef1-d2e49a9ff2b5	vndms.dmc.gov.vn
4910	Thông số đo mưa	\N	0	RAIN	\N	\N	356218	f	142762cd-f08f-47a6-8d65-072e82aac2da	vndms.dmc.gov.vn
4911	Thông số đo mưa	\N	0	RAIN	\N	\N	356463	f	bb4bddb8-0f61-42b3-8510-1b1d70136bbd	vndms.dmc.gov.vn
4912	Thông số đo mưa	\N	0	RAIN	\N	\N	356466	f	aafed396-7de3-4046-8638-9544dc92006b	vndms.dmc.gov.vn
4913	Thông số đo mưa	\N	0	RAIN	\N	\N	356470	f	7bc5194a-358b-4c53-ad7c-01e3883f894e	vndms.dmc.gov.vn
4914	Thông số đo mưa	\N	0	RAIN	\N	\N	356642	f	fc69421a-2c16-4df5-93b7-8be24166b74b	vndms.dmc.gov.vn
4915	Thông số đo mưa	\N	0	RAIN	\N	\N	359031	f	b2b607d5-a3ef-429b-885c-906010e95e9b	vndms.dmc.gov.vn
4916	Thông số đo mưa	\N	0	RAIN	\N	\N	359860	f	b53fa24e-98e0-463f-870f-db24e2800591	vndms.dmc.gov.vn
4917	Thông số đo mưa	\N	0	RAIN	\N	\N	360001	f	740be0fd-44ff-4b9b-88de-9f2f176bc967	vndms.dmc.gov.vn
4918	Thông số đo mưa	\N	0	RAIN	\N	\N	360002	f	8128c68f-fca0-479b-ab0c-467d554fade8	vndms.dmc.gov.vn
4919	Thông số đo mưa	\N	0	RAIN	\N	\N	360003	f	46f2c71d-ddc4-4acb-b540-1b82cd0a08de	vndms.dmc.gov.vn
4920	Thông số đo mưa	\N	0	RAIN	\N	\N	360004	f	7a91f0c9-78fa-4fdb-b883-c54d306bf5f3	vndms.dmc.gov.vn
4921	Thông số đo mưa	\N	0	RAIN	\N	\N	360005	f	c019fc2e-40ed-4241-9225-b92fc67d693b	vndms.dmc.gov.vn
4922	Thông số đo mưa	\N	0	RAIN	\N	\N	360006	f	f9ab46d5-11a8-4837-9de7-4440b4047f6d	vndms.dmc.gov.vn
4923	Thông số đo mưa	\N	0	RAIN	\N	\N	360007	f	e8adb1f0-232f-4bec-a373-c50fb4f89d6c	vndms.dmc.gov.vn
4924	Thông số đo mưa	\N	0	RAIN	\N	\N	360008	f	67703304-04ee-48ca-8696-bfb548aa7879	vndms.dmc.gov.vn
4925	Thông số đo mưa	\N	0	RAIN	\N	\N	360009	f	c8c24b39-e920-483a-a4dd-463aa445948e	vndms.dmc.gov.vn
4926	Thông số đo mưa	\N	0	RAIN	\N	\N	360010	f	0652e622-1314-43b5-8bb1-d308ef461938	vndms.dmc.gov.vn
4927	Thông số đo mưa	\N	0	RAIN	\N	\N	360011	f	762e4192-49ad-47a7-948f-1e7e7819156d	vndms.dmc.gov.vn
4928	Thông số đo mưa	\N	0	RAIN	\N	\N	360012	f	26625b9c-aa4e-4786-913d-da41ce2ba291	vndms.dmc.gov.vn
4929	Thông số đo mưa	\N	0	RAIN	\N	\N	360013	f	97c35e81-e2c3-4e87-871b-c40009668477	vndms.dmc.gov.vn
4930	Thông số đo mưa	\N	0	RAIN	\N	\N	360014	f	52c1e3a8-0f2e-454b-9502-51dbd866b4d0	vndms.dmc.gov.vn
4931	Thông số đo mưa	\N	0	RAIN	\N	\N	360015	f	16ecd0dd-3e87-4bd3-bf4c-c1a04119bf41	vndms.dmc.gov.vn
4932	Thông số đo mưa	\N	0	RAIN	\N	\N	360016	f	7af047ff-7522-4131-a92c-e54e5a89dce5	vndms.dmc.gov.vn
4933	Thông số đo mưa	\N	0	RAIN	\N	\N	360017	f	9f90ff90-2978-4c83-8809-91316d4842d4	vndms.dmc.gov.vn
4934	Thông số đo mưa	\N	0	RAIN	\N	\N	360018	f	6f2d5d91-73b6-4318-902c-d81738602c99	vndms.dmc.gov.vn
4935	Thông số đo mưa	\N	0	RAIN	\N	\N	360019	f	84eabb87-819d-4b05-b507-eeae9953c82c	vndms.dmc.gov.vn
4936	Thông số đo mưa	\N	0	RAIN	\N	\N	361415	f	ab45f77c-385a-4c3a-9dc4-8a5bc84506b7	vndms.dmc.gov.vn
4937	Thông số đo mưa	\N	0	RAIN	\N	\N	361934	f	ac43de96-17c5-474c-9761-ab370b9f5bd2	vndms.dmc.gov.vn
4938	Thông số đo mưa	\N	0	RAIN	\N	\N	36376	f	dfc1206f-f15c-4cf0-9040-675024b66aaa	vndms.dmc.gov.vn
4939	Thông số đo mưa	\N	0	RAIN	\N	\N	365004	f	99ff670f-dd98-45c3-ad9e-e2414a4ad792	vndms.dmc.gov.vn
4940	Thông số đo mưa	\N	0	RAIN	\N	\N	36974	f	9236c254-6347-427a-a4dd-c9ee538b1a3d	vndms.dmc.gov.vn
4941	Thông số đo mưa	\N	0	RAIN	\N	\N	370002	f	ac74f1c1-dc11-46c0-a1bc-869b3c0d50b6	vndms.dmc.gov.vn
4942	Thông số đo mưa	\N	0	RAIN	\N	\N	370003	f	00bcc419-a7c1-40dd-bc3e-223ad2b44770	vndms.dmc.gov.vn
4943	Thông số đo mưa	\N	0	RAIN	\N	\N	370004	f	8af674e6-ab66-444b-86cd-9dab021f7eb5	vndms.dmc.gov.vn
4944	Thông số đo mưa	\N	0	RAIN	\N	\N	371514	f	5b1a965e-01bd-4bfd-ade1-5755cb799864	vndms.dmc.gov.vn
4945	Thông số đo mưa	\N	0	RAIN	\N	\N	373812	f	dc21fdfb-4b93-4776-a9a5-693fb5483b96	vndms.dmc.gov.vn
4946	Thông số đo mưa	\N	0	RAIN	\N	\N	375783	f	bc6cc511-b006-4bae-9c64-7d4662fc9dd5	vndms.dmc.gov.vn
4947	Thông số đo mưa	\N	0	RAIN	\N	\N	375932	f	4f52f32a-d676-4352-b96a-97cc44058893	vndms.dmc.gov.vn
4948	Thông số đo mưa	\N	0	RAIN	\N	\N	376819	f	0660b790-293d-42e4-b613-3251a7a72964	vndms.dmc.gov.vn
4949	Thông số đo mưa	\N	0	RAIN	\N	\N	379704	f	6bf7298b-8a00-42ad-b418-47e9b5422e22	vndms.dmc.gov.vn
4950	Thông số đo mưa	\N	0	RAIN	\N	\N	380001	f	50559b8a-4dd4-46c8-be35-48500fcaa09e	vndms.dmc.gov.vn
4951	Thông số đo mưa	\N	0	RAIN	\N	\N	380002	f	5b43c512-82e9-4cdb-9ece-54efb61cbb9d	vndms.dmc.gov.vn
4952	Thông số đo mưa	\N	0	RAIN	\N	\N	380691	f	123202f6-dee8-4883-b9d2-ebbeb060638d	vndms.dmc.gov.vn
4953	Thông số đo mưa	\N	0	RAIN	\N	\N	381906	f	64f982b7-a36e-4482-b6cf-aa034eab0a7a	vndms.dmc.gov.vn
4954	Thông số đo mưa	\N	0	RAIN	\N	\N	382421	f	3172c679-0d4b-47d2-9402-613b335a9225	vndms.dmc.gov.vn
4955	Thông số đo mưa	\N	0	RAIN	\N	\N	384711	f	632fe5b3-b347-48ff-ae7f-315884b265e2	vndms.dmc.gov.vn
4956	Thông số đo mưa	\N	0	RAIN	\N	\N	384943	f	19582f89-b2b3-4964-b7e3-1cb20db9db9a	vndms.dmc.gov.vn
4957	Thông số đo mưa	\N	0	RAIN	\N	\N	385431	f	707e4d50-b0d7-4f11-b922-148e449e4fa0	vndms.dmc.gov.vn
4958	Thông số đo mưa	\N	0	RAIN	\N	\N	386163	f	f6dd4ff9-3d61-4761-96ef-e293ee59686f	vndms.dmc.gov.vn
4959	Thông số đo mưa	\N	0	RAIN	\N	\N	386352	f	79522d30-a889-499a-a5d2-a20026ae2f3c	vndms.dmc.gov.vn
4960	Thông số đo mưa	\N	0	RAIN	\N	\N	386744	f	3485bfb8-ebed-4581-8762-53f7e85b21e3	vndms.dmc.gov.vn
4961	Thông số đo mưa	\N	0	RAIN	\N	\N	386804	f	c42cbf78-cf12-4b43-b63d-58390f9c3d73	vndms.dmc.gov.vn
4962	Thông số đo mưa	\N	0	RAIN	\N	\N	386911	f	66616a01-ad07-48d2-b849-0a7cf1812f56	vndms.dmc.gov.vn
4963	Thông số đo mưa	\N	0	RAIN	\N	\N	387847	f	5d3503ab-9c12-4792-b4f8-fdf5d52f8192	vndms.dmc.gov.vn
4964	Thông số đo mưa	\N	0	RAIN	\N	\N	390201	f	abb43a14-6ba8-40a7-94d5-68f3a1c8af87	vndms.dmc.gov.vn
4965	Thông số đo mưa	\N	0	RAIN	\N	\N	390483	f	677f4646-c4ca-4fd7-9efa-60111e7f1cc0	vndms.dmc.gov.vn
4966	Thông số đo mưa	\N	0	RAIN	\N	\N	391730	f	ae99ddac-3317-40d4-8afc-8a2d24056d2c	vndms.dmc.gov.vn
4967	Thông số đo mưa	\N	0	RAIN	\N	\N	392142	f	70ae7172-6f70-496a-8290-64e93269de57	vndms.dmc.gov.vn
4968	Thông số đo mưa	\N	0	RAIN	\N	\N	392337	f	8ce97226-f802-4258-8ca6-4f1742434952	vndms.dmc.gov.vn
4969	Thông số đo mưa	\N	0	RAIN	\N	\N	392495	f	ac91823a-334f-43b5-9d60-82c45ef25b68	vndms.dmc.gov.vn
4970	Thông số đo mưa	\N	0	RAIN	\N	\N	393281	f	44eeef18-d7b5-41e5-8ada-4182ca962a56	vndms.dmc.gov.vn
4971	Thông số đo mưa	\N	0	RAIN	\N	\N	394544	f	5e885200-f4c6-4d88-ad7c-feda27b79b7a	vndms.dmc.gov.vn
4972	Thông số đo mưa	\N	0	RAIN	\N	\N	396617	f	33fb4540-4af5-46a8-a1b2-5d6a7f99a5d0	vndms.dmc.gov.vn
4973	Thông số đo mưa	\N	0	RAIN	\N	\N	399040	f	44254c96-68cc-41ca-b7f2-fd9ea8cdd639	vndms.dmc.gov.vn
4974	Thông số đo mưa	\N	0	RAIN	\N	\N	402778	f	667107e6-a67e-4711-8f1e-6d6193d14019	vndms.dmc.gov.vn
4975	Thông số đo mưa	\N	0	RAIN	\N	\N	403143	f	3a845d8d-379b-4286-bad1-5747b3a25891	vndms.dmc.gov.vn
4976	Thông số đo mưa	\N	0	RAIN	\N	\N	405173	f	0b2b875c-dd8f-496d-bdb9-bf343a9e8381	vndms.dmc.gov.vn
4977	Thông số đo mưa	\N	0	RAIN	\N	\N	405316	f	6c729b02-2c7b-4a35-9211-addf31305954	vndms.dmc.gov.vn
4978	Thông số đo mưa	\N	0	RAIN	\N	\N	40769	f	56c31c09-4635-4766-983a-b787c6f23303	vndms.dmc.gov.vn
4979	Thông số đo mưa	\N	0	RAIN	\N	\N	408434	f	fbbb3296-062b-4c5e-9a93-5994718e131c	vndms.dmc.gov.vn
4980	Thông số đo mưa	\N	0	RAIN	\N	\N	41040	f	dc0910f3-a323-4a5a-8841-8f03671b2b83	vndms.dmc.gov.vn
4981	Thông số đo mưa	\N	0	RAIN	\N	\N	411420	f	2e4ee322-7961-45e6-95d4-e0dce9fc9628	vndms.dmc.gov.vn
4982	Thông số đo mưa	\N	0	RAIN	\N	\N	412105	f	dd7b1058-abc9-4f06-922f-71d72848a220	vndms.dmc.gov.vn
4983	Thông số đo mưa	\N	0	RAIN	\N	\N	412702	f	176afa16-b536-4a56-8f15-093d59512e3b	vndms.dmc.gov.vn
4984	Thông số đo mưa	\N	0	RAIN	\N	\N	412903	f	dcbf3ecb-92a2-4710-a5e3-2fe244a67e41	vndms.dmc.gov.vn
4985	Thông số đo mưa	\N	0	RAIN	\N	\N	419547	f	75da31e1-63e5-4a06-b9b2-63dce99a567b	vndms.dmc.gov.vn
4986	Thông số đo mưa	\N	0	RAIN	\N	\N	423987	f	2bf27fdb-a94b-4d7d-8efb-d9625c93a2fa	vndms.dmc.gov.vn
4987	Thông số đo mưa	\N	0	RAIN	\N	\N	425938	f	9be867da-2dc3-4bcb-a1bf-ebc4624d6574	vndms.dmc.gov.vn
4988	Thông số đo mưa	\N	0	RAIN	\N	\N	426984	f	62144074-5f5b-4749-aef7-6905dbb3b7fe	vndms.dmc.gov.vn
4989	Thông số đo mưa	\N	0	RAIN	\N	\N	428256	f	d748a3ae-dc86-4818-abc2-6dff232d9a52	vndms.dmc.gov.vn
4990	Thông số đo mưa	\N	0	RAIN	\N	\N	430001	f	314e8c50-9d52-40ba-b468-97535ebe29f4	vndms.dmc.gov.vn
4991	Thông số đo mưa	\N	0	RAIN	\N	\N	430002	f	361d90c4-d3d0-41bc-b18b-6d262c5900c4	vndms.dmc.gov.vn
4992	Thông số đo mưa	\N	0	RAIN	\N	\N	430003	f	55905b68-f250-4b6f-a1b5-1267fff6c2bb	vndms.dmc.gov.vn
4993	Thông số đo mưa	\N	0	RAIN	\N	\N	430004	f	5c2c7d02-4f8c-4231-a932-eff11d831936	vndms.dmc.gov.vn
4994	Thông số đo mưa	\N	0	RAIN	\N	\N	430005	f	cb002cf3-0a95-4cf1-b51b-86c481916706	vndms.dmc.gov.vn
4995	Thông số đo mưa	\N	0	RAIN	\N	\N	430006	f	f8f916c2-6164-4aea-a5b8-13728d96ce82	vndms.dmc.gov.vn
4996	Thông số đo mưa	\N	0	RAIN	\N	\N	430007	f	37ced5b6-5aa4-4001-9432-44d88df1b131	vndms.dmc.gov.vn
4997	Thông số đo mưa	\N	0	RAIN	\N	\N	430008	f	b8345d56-49b5-43d4-b608-85c13493ff5a	vndms.dmc.gov.vn
4998	Thông số đo mưa	\N	0	RAIN	\N	\N	430009	f	621f9afd-d433-4eb8-b06a-52bd7d2d9121	vndms.dmc.gov.vn
4999	Thông số đo mưa	\N	0	RAIN	\N	\N	430010	f	1bc929a5-08f9-45ea-8bf7-e33f88e88263	vndms.dmc.gov.vn
5000	Thông số đo mưa	\N	0	RAIN	\N	\N	430013	f	f9afdc1a-995c-4e2c-b8b5-6e7c589883a7	vndms.dmc.gov.vn
5001	Thông số đo mưa	\N	0	RAIN	\N	\N	430014	f	e6301e70-4909-4c3a-bc1c-62ddc690c497	vndms.dmc.gov.vn
5002	Thông số đo mưa	\N	0	RAIN	\N	\N	430015	f	d4abd1dc-eae6-4a97-b276-25d2c00142a4	vndms.dmc.gov.vn
5003	Thông số đo mưa	\N	0	RAIN	\N	\N	430016	f	45bdd3f2-4b56-401d-a456-d34e1de44d9a	vndms.dmc.gov.vn
5004	Thông số đo mưa	\N	0	RAIN	\N	\N	430017	f	d2585f9f-b122-4b93-a2de-386b3e499ece	vndms.dmc.gov.vn
5005	Thông số đo mưa	\N	0	RAIN	\N	\N	430018	f	c38af0a7-4e14-4ea5-86df-5c706e21b957	vndms.dmc.gov.vn
5006	Thông số đo mưa	\N	0	RAIN	\N	\N	430019	f	30285930-e1d6-454a-bc39-07283a3448cd	vndms.dmc.gov.vn
5007	Thông số đo mưa	\N	0	RAIN	\N	\N	430020	f	8ebe851d-80df-42bc-aa44-9f61a07f75dc	vndms.dmc.gov.vn
5008	Thông số đo mưa	\N	0	RAIN	\N	\N	430021	f	a9778350-ba63-4c52-929f-77005a44a2c3	vndms.dmc.gov.vn
5009	Thông số đo mưa	\N	0	RAIN	\N	\N	430022	f	549b6dca-e3fa-466d-a70c-a3be1010fc0f	vndms.dmc.gov.vn
5010	Thông số đo mưa	\N	0	RAIN	\N	\N	430702	f	cf75df20-c132-4897-b03e-c9ad1406f2a5	vndms.dmc.gov.vn
5011	Thông số đo mưa	\N	0	RAIN	\N	\N	43138	f	b86cf49b-abfa-4b85-b458-d6a3799c0746	vndms.dmc.gov.vn
5012	Thông số đo mưa	\N	0	RAIN	\N	\N	432140	f	ee69f45e-2c9e-4626-8541-0c9c5cbf3745	vndms.dmc.gov.vn
5013	Thông số đo mưa	\N	0	RAIN	\N	\N	43546	f	f5ec0bb9-96ec-4e9f-b204-ece37a251870	vndms.dmc.gov.vn
5014	Thông số đo mưa	\N	0	RAIN	\N	\N	438790	f	b1323c98-45d6-41b1-a210-1361d04dd57f	vndms.dmc.gov.vn
5015	Thông số đo mưa	\N	0	RAIN	\N	\N	44082	f	6b1bd38c-18d4-4ae4-8109-b632748b0d8b	vndms.dmc.gov.vn
5016	Thông số đo mưa	\N	0	RAIN	\N	\N	440836	f	4a1d4435-a69b-4e3a-87eb-b5d976fe43c0	vndms.dmc.gov.vn
5017	Thông số đo mưa	\N	0	RAIN	\N	\N	442191	f	4aa800ca-e180-4c64-b3a6-0765ee6444e2	vndms.dmc.gov.vn
5018	Thông số đo mưa	\N	0	RAIN	\N	\N	445313	f	26f59bd2-6789-4e4a-a05e-27eaec690371	vndms.dmc.gov.vn
5019	Thông số đo mưa	\N	0	RAIN	\N	\N	447507	f	343659b8-6e51-4863-805b-296cbfd0fc86	vndms.dmc.gov.vn
5020	Thông số đo mưa	\N	0	RAIN	\N	\N	448710	f	989a39e6-c4a8-4bf2-93f1-a2e1d97df10d	vndms.dmc.gov.vn
5021	Thông số đo mưa	\N	0	RAIN	\N	\N	450412	f	275e7de8-d995-469c-bb3d-9d2bdfebb122	vndms.dmc.gov.vn
5022	Thông số đo mưa	\N	0	RAIN	\N	\N	451259	f	a84bbdc2-b589-489f-9a11-ab2e2926eac8	vndms.dmc.gov.vn
5023	Thông số đo mưa	\N	0	RAIN	\N	\N	454703	f	3590aec3-fb12-4663-b625-c682c6d50daa	vndms.dmc.gov.vn
5024	Thông số đo mưa	\N	0	RAIN	\N	\N	456795	f	3e957523-bfd1-49dc-b883-16d53618594e	vndms.dmc.gov.vn
5025	Thông số đo mưa	\N	0	RAIN	\N	\N	457122	f	2f96cc22-6058-4613-9dc8-947e4c7469b6	vndms.dmc.gov.vn
5026	Thông số đo mưa	\N	0	RAIN	\N	\N	459202	f	231f41c3-bef3-4fed-9fd8-f82c95999756	vndms.dmc.gov.vn
5027	Thông số đo mưa	\N	0	RAIN	\N	\N	459571	f	c5ae22dc-d909-4101-9b67-be34f82399a5	vndms.dmc.gov.vn
5028	Thông số đo mưa	\N	0	RAIN	\N	\N	46095	f	d0220132-c1d3-4417-8ed1-5c22afe92b23	vndms.dmc.gov.vn
5029	Thông số đo mưa	\N	0	RAIN	\N	\N	461225	f	480b21ec-a9d0-477b-9f2d-5536450902d0	vndms.dmc.gov.vn
5030	Thông số đo mưa	\N	0	RAIN	\N	\N	463112	f	51aa2513-e409-4506-a625-540f68bce69f	vndms.dmc.gov.vn
5031	Thông số đo mưa	\N	0	RAIN	\N	\N	465732	f	7eb7c795-7210-4cae-b91e-b252e22f8943	vndms.dmc.gov.vn
5032	Thông số đo mưa	\N	0	RAIN	\N	\N	468153	f	80cf1d33-1461-47a9-8c0c-e0c88ea7423a	vndms.dmc.gov.vn
5033	Thông số đo mưa	\N	0	RAIN	\N	\N	468306	f	9e8d2576-533a-4aba-bc78-3ce0fd4ae892	vndms.dmc.gov.vn
5034	Thông số đo mưa	\N	0	RAIN	\N	\N	468745	f	6b06240c-4daa-4a66-ac5d-b337950b855d	vndms.dmc.gov.vn
5035	Thông số đo mưa	\N	0	RAIN	\N	\N	469032	f	0653cf99-dd4c-42ee-8802-41e3f16792d1	vndms.dmc.gov.vn
5036	Thông số đo mưa	\N	0	RAIN	\N	\N	469503	f	9f4e37db-f183-4bc1-8595-d004032c88f3	vndms.dmc.gov.vn
5037	Thông số đo mưa	\N	0	RAIN	\N	\N	469942	f	123c31d6-03f5-4fca-a33e-fce340a6e51a	vndms.dmc.gov.vn
5038	Thông số đo mưa	\N	0	RAIN	\N	\N	470001	f	fd35545a-b1fa-4a37-963d-edc2ec72a050	vndms.dmc.gov.vn
5039	Thông số đo mưa	\N	0	RAIN	\N	\N	470002	f	7a32117b-7d14-43ae-9f1a-249b85c0c11b	vndms.dmc.gov.vn
5040	Thông số đo mưa	\N	0	RAIN	\N	\N	470003	f	275e27df-d9e0-4ce4-be28-e725c3d8530d	vndms.dmc.gov.vn
5041	Thông số đo mưa	\N	0	RAIN	\N	\N	470004	f	b5252621-4d8f-40c7-9b9f-592de4ea56c3	vndms.dmc.gov.vn
5042	Thông số đo mưa	\N	0	RAIN	\N	\N	470005	f	9c572381-9a36-4e21-b85f-1338626403f4	vndms.dmc.gov.vn
5043	Thông số đo mưa	\N	0	RAIN	\N	\N	470007	f	4f0bf8d7-3138-431f-878d-8f7979a8b500	vndms.dmc.gov.vn
5044	Thông số đo mưa	\N	0	RAIN	\N	\N	470008	f	ededa22c-f268-4f97-9c94-1738239038df	vndms.dmc.gov.vn
5045	Thông số đo mưa	\N	0	RAIN	\N	\N	470009	f	6878445b-3899-4034-b633-d57c0859428b	vndms.dmc.gov.vn
5046	Thông số đo mưa	\N	0	RAIN	\N	\N	470010	f	2806cb96-15eb-4f14-8dd2-c753b5a1fa46	vndms.dmc.gov.vn
5047	Thông số đo mưa	\N	0	RAIN	\N	\N	470011	f	84ef9f72-548d-49b2-8185-7c8690839de6	vndms.dmc.gov.vn
5048	Thông số đo mưa	\N	0	RAIN	\N	\N	470012	f	bc3adbee-437e-4fa9-9d9f-ab3385df3f4a	vndms.dmc.gov.vn
5049	Thông số đo mưa	\N	0	RAIN	\N	\N	470013	f	0b0e4735-f400-47a1-8085-e883678471fd	vndms.dmc.gov.vn
5050	Thông số đo mưa	\N	0	RAIN	\N	\N	470014	f	58e97735-a4e9-4bb2-9d28-1ecb89b48883	vndms.dmc.gov.vn
5051	Thông số đo mưa	\N	0	RAIN	\N	\N	470015	f	1ff4699f-8b7b-4b44-8225-9dab86b83acb	vndms.dmc.gov.vn
5052	Thông số đo mưa	\N	0	RAIN	\N	\N	470016	f	7de7586b-946c-421a-ae5c-91088f3b896f	vndms.dmc.gov.vn
5053	Thông số đo mưa	\N	0	RAIN	\N	\N	470017	f	aa571ce9-582a-422f-9129-e78a95c90bde	vndms.dmc.gov.vn
5054	Thông số đo mưa	\N	0	RAIN	\N	\N	470018	f	af02a1f7-743a-4ad5-87d2-1340d57f1cf1	vndms.dmc.gov.vn
5055	Thông số đo mưa	\N	0	RAIN	\N	\N	470019	f	fdc1cf52-9dbe-4242-80ee-a23113c3c6bd	vndms.dmc.gov.vn
5056	Thông số đo mưa	\N	0	RAIN	\N	\N	470020	f	fedd4248-4472-499c-8944-29f12b672c7f	vndms.dmc.gov.vn
5057	Thông số đo mưa	\N	0	RAIN	\N	\N	470021	f	f76831cb-3f62-44a0-894b-ae098f1bbada	vndms.dmc.gov.vn
5058	Thông số đo mưa	\N	0	RAIN	\N	\N	470022	f	00ae3d7f-5bf0-4fd0-833a-17d99981cde3	vndms.dmc.gov.vn
5059	Thông số đo mưa	\N	0	RAIN	\N	\N	470023	f	9bbecc9b-b38f-4a75-b2e3-5e21be602927	vndms.dmc.gov.vn
5060	Thông số đo mưa	\N	0	RAIN	\N	\N	470024	f	155331c6-da3b-45ef-8fbf-77c97d36b7dd	vndms.dmc.gov.vn
5061	Thông số đo mưa	\N	0	RAIN	\N	\N	470025	f	6ef5acbd-88bb-43e5-a7b1-0892b76703e4	vndms.dmc.gov.vn
5062	Thông số đo mưa	\N	0	RAIN	\N	\N	470026	f	2e2d1528-7abd-4aea-a0b2-a92ac7a4bd04	vndms.dmc.gov.vn
5063	Thông số đo mưa	\N	0	RAIN	\N	\N	470027	f	7af472bc-b487-4257-8cd7-c16fe7d04361	vndms.dmc.gov.vn
5064	Thông số đo mưa	\N	0	RAIN	\N	\N	470028	f	3dbe3ada-9fb1-4906-be9f-9bc946685576	vndms.dmc.gov.vn
5065	Thông số đo mưa	\N	0	RAIN	\N	\N	470029	f	b5f39394-60ec-43aa-9b1b-db4a655f4bcd	vndms.dmc.gov.vn
5066	Thông số đo mưa	\N	0	RAIN	\N	\N	470030	f	59838104-3e19-437d-9b1f-b5ff9c04ac13	vndms.dmc.gov.vn
5067	Thông số đo mưa	\N	0	RAIN	\N	\N	470684	f	21408acb-f2ca-4f97-8b25-4122c8ba111f	vndms.dmc.gov.vn
5068	Thông số đo mưa	\N	0	RAIN	\N	\N	470714	f	0beaff87-b3df-4568-9f74-71f7a40c6c2c	vndms.dmc.gov.vn
5069	Thông số đo mưa	\N	0	RAIN	\N	\N	471503	f	ca9180f5-caed-4ac1-a73d-5614ea85a1ef	vndms.dmc.gov.vn
5070	Thông số đo mưa	\N	0	RAIN	\N	\N	471726	f	f324ee24-691a-4fd6-b649-bb69f2de2f22	vndms.dmc.gov.vn
5071	Thông số đo mưa	\N	0	RAIN	\N	\N	472622	f	22106fd3-2d05-4110-95aa-2fea82c2619e	vndms.dmc.gov.vn
5072	Thông số đo mưa	\N	0	RAIN	\N	\N	473942	f	9d0ede75-684e-4c83-b9e1-db084a68fe89	vndms.dmc.gov.vn
5073	Thông số đo mưa	\N	0	RAIN	\N	\N	47460	f	818c93ac-4761-498e-bbc4-8c8b3ee3a609	vndms.dmc.gov.vn
5074	Thông số đo mưa	\N	0	RAIN	\N	\N	476310	f	50aa826c-bb7b-4c04-a537-5ff586c61310	vndms.dmc.gov.vn
5075	Thông số đo mưa	\N	0	RAIN	\N	\N	476632	f	021de7de-95d4-4a13-9d1f-f6fa3c9ba3e7	vndms.dmc.gov.vn
5076	Thông số đo mưa	\N	0	RAIN	\N	\N	478334	f	3bf7d29c-d5e7-400a-b8d0-a4bb9f6ed4cb	vndms.dmc.gov.vn
5077	Thông số đo mưa	\N	0	RAIN	\N	\N	478414	f	c7da16d7-03b7-424f-aa55-d0c8b97b0715	vndms.dmc.gov.vn
5078	Thông số đo mưa	\N	0	RAIN	\N	\N	478645	f	3078738c-71c4-4402-8d16-2495af104fc3	vndms.dmc.gov.vn
5079	Thông số đo mưa	\N	0	RAIN	\N	\N	48/01	f	ac24b293-d41d-4ec6-8604-dd690f61de77	vndms.dmc.gov.vn
5080	Thông số đo mưa	\N	0	RAIN	\N	\N	48/02	f	dcc06d87-e875-4627-995b-e1b9c592ea20	vndms.dmc.gov.vn
5081	Thông số đo mưa	\N	0	RAIN	\N	\N	48/03	f	41fedf02-441a-49a4-b8fb-4900f5125481	vndms.dmc.gov.vn
5082	Thông số đo mưa	\N	0	RAIN	\N	\N	48/06	f	772e8eec-920e-4f38-a7e1-e8ea35affcf7	vndms.dmc.gov.vn
5083	Thông số đo mưa	\N	0	RAIN	\N	\N	48/07	f	5d3b8bfb-0639-4a08-a77c-c162afd297d3	vndms.dmc.gov.vn
5084	Thông số đo mưa	\N	0	RAIN	\N	\N	48/08	f	3b89ba21-40f8-4267-91ae-4a80c6a3779a	vndms.dmc.gov.vn
5085	Thông số đo mưa	\N	0	RAIN	\N	\N	48/09	f	93cdb03a-524e-4be4-bb68-6fe684cc4920	vndms.dmc.gov.vn
5086	Thông số đo mưa	\N	0	RAIN	\N	\N	48/10	f	5e98c0be-5c4b-4d1c-8107-ad22a2ee5175	vndms.dmc.gov.vn
5087	Thông số đo mưa	\N	0	RAIN	\N	\N	48/14	f	3eb593f9-fe70-4059-91ff-f20911c0877c	vndms.dmc.gov.vn
5088	Thông số đo mưa	\N	0	RAIN	\N	\N	48/16	f	e589dd94-ebb4-4c45-a213-e36fe297a993	vndms.dmc.gov.vn
5089	Thông số đo mưa	\N	0	RAIN	\N	\N	48/17	f	6e601ddb-9c9b-4e52-be67-86aa59f50fb6	vndms.dmc.gov.vn
5090	Thông số đo mưa	\N	0	RAIN	\N	\N	48/18	f	fae253c8-2929-4e89-aa39-c4085393d88a	vndms.dmc.gov.vn
5091	Thông số đo mưa	\N	0	RAIN	\N	\N	48/19	f	eeea2c03-cd18-4d68-b4f7-1504283cc61b	vndms.dmc.gov.vn
5092	Thông số đo mưa	\N	0	RAIN	\N	\N	48/20	f	a73d1968-a767-43e6-b4f2-42565adeff47	vndms.dmc.gov.vn
5093	Thông số đo mưa	\N	0	RAIN	\N	\N	48/23	f	5587577d-3236-413c-a2ee-2430b2003b3d	vndms.dmc.gov.vn
5094	Thông số đo mưa	\N	0	RAIN	\N	\N	48/25	f	b78e0add-0857-4c43-bdac-e34e131b6322	vndms.dmc.gov.vn
5095	Thông số đo mưa	\N	0	RAIN	\N	\N	48/26	f	a2a78c01-7e10-43c9-be83-9542258077f9	vndms.dmc.gov.vn
5096	Thông số đo mưa	\N	0	RAIN	\N	\N	48/29	f	8ea66420-7c0a-4ad0-8516-4d1453d7230c	vndms.dmc.gov.vn
5097	Thông số đo mưa	\N	0	RAIN	\N	\N	48/30	f	3e087bbd-da91-4706-823f-067d1c529d07	vndms.dmc.gov.vn
5098	Thông số đo mưa	\N	0	RAIN	\N	\N	48/31	f	8d0dd2ee-ce45-4132-86af-8c0b307a9356	vndms.dmc.gov.vn
5099	Thông số đo mưa	\N	0	RAIN	\N	\N	48/32	f	146c7530-be3d-4e93-9d76-c48ba8d3fb3d	vndms.dmc.gov.vn
5100	Thông số đo mưa	\N	0	RAIN	\N	\N	48/33	f	e6fef080-2b85-4711-ad1a-58567529f1e5	vndms.dmc.gov.vn
5101	Thông số đo mưa	\N	0	RAIN	\N	\N	48/34	f	ebccf0be-4a63-4f81-ab33-109fb9a94855	vndms.dmc.gov.vn
5102	Thông số đo mưa	\N	0	RAIN	\N	\N	48/35	f	2e174f75-29c6-4216-aed0-c749a61d429f	vndms.dmc.gov.vn
5103	Thông số đo mưa	\N	0	RAIN	\N	\N	48/36	f	1ea535b7-c3d2-4157-81f7-6ddf3023686c	vndms.dmc.gov.vn
5104	Thông số đo mưa	\N	0	RAIN	\N	\N	48/37	f	d4747aaa-9ea7-428a-9994-201635076e25	vndms.dmc.gov.vn
5105	Thông số đo mưa	\N	0	RAIN	\N	\N	48/39	f	d55dd75d-4858-4979-8c46-4757579fe0d2	vndms.dmc.gov.vn
5106	Thông số đo mưa	\N	0	RAIN	\N	\N	48/40	f	44632750-7ae0-4d9e-8017-ccbc1bb4b351	vndms.dmc.gov.vn
5107	Thông số đo mưa	\N	0	RAIN	\N	\N	48/42	f	47ce02ef-5d26-42be-9afa-45c6c98d2782	vndms.dmc.gov.vn
5108	Thông số đo mưa	\N	0	RAIN	\N	\N	48/44	f	87fae608-ef6d-4fae-8991-0f23f2e18ff9	vndms.dmc.gov.vn
5109	Thông số đo mưa	\N	0	RAIN	\N	\N	48/47	f	b7a0d69c-f259-41c5-8d5f-0f9ccfeae61c	vndms.dmc.gov.vn
5110	Thông số đo mưa	\N	0	RAIN	\N	\N	48/48	f	b1a5afc5-56b5-483a-9c2a-c0f837f7f936	vndms.dmc.gov.vn
5111	Thông số đo mưa	\N	0	RAIN	\N	\N	48/49	f	a3d364bd-7604-4e69-8704-59c86df41d34	vndms.dmc.gov.vn
5112	Thông số đo mưa	\N	0	RAIN	\N	\N	48/51	f	14732861-0ec3-4ca2-b3ec-5cdd650a93fd	vndms.dmc.gov.vn
5113	Thông số đo mưa	\N	0	RAIN	\N	\N	48/52	f	0d2d726a-cba8-4fa1-9d39-e2e05c088a11	vndms.dmc.gov.vn
5114	Thông số đo mưa	\N	0	RAIN	\N	\N	48/56	f	bbe9e86b-0531-44b0-97a9-7adb1849e0d4	vndms.dmc.gov.vn
5115	Thông số đo mưa	\N	0	RAIN	\N	\N	48/57	f	41d10fdc-bc8e-413f-b759-d99c9f549804	vndms.dmc.gov.vn
5116	Thông số đo mưa	\N	0	RAIN	\N	\N	48/60	f	b699e213-b53a-4ff5-a640-6e9bd6bfa59d	vndms.dmc.gov.vn
5117	Thông số đo mưa	\N	0	RAIN	\N	\N	48/61	f	bff3810d-0b3c-4d49-897e-7ee21e96f116	vndms.dmc.gov.vn
5118	Thông số đo mưa	\N	0	RAIN	\N	\N	48/63	f	488d0485-131e-4f0e-b5d8-1b257697c223	vndms.dmc.gov.vn
5119	Thông số đo mưa	\N	0	RAIN	\N	\N	48/64	f	6db30705-8de2-407b-90ff-8c3dfaa30d35	vndms.dmc.gov.vn
5120	Thông số đo mưa	\N	0	RAIN	\N	\N	48/65	f	927e6db8-be3e-4df2-bf26-6cad6cafd872	vndms.dmc.gov.vn
5121	Thông số đo mưa	\N	0	RAIN	\N	\N	48/66	f	91763b40-2042-49e9-b97d-3c4a836ef77a	vndms.dmc.gov.vn
5122	Thông số đo mưa	\N	0	RAIN	\N	\N	48/67	f	b15002ee-960c-4910-a9df-3225bf65f80b	vndms.dmc.gov.vn
5123	Thông số đo mưa	\N	0	RAIN	\N	\N	48/68	f	8bcc7f88-acfa-4425-b184-37cc4ee6d8ea	vndms.dmc.gov.vn
5124	Thông số đo mưa	\N	0	RAIN	\N	\N	48/69	f	2be94b1d-ebe6-49eb-b1cb-8586a103a459	vndms.dmc.gov.vn
5125	Thông số đo mưa	\N	0	RAIN	\N	\N	48/70	f	54b61527-3f15-41d8-b3bb-5a3f7a836e12	vndms.dmc.gov.vn
5126	Thông số đo mưa	\N	0	RAIN	\N	\N	48/72	f	a5cd42ca-4996-4711-9863-c223832a2cd6	vndms.dmc.gov.vn
5127	Thông số đo mưa	\N	0	RAIN	\N	\N	48/74	f	8f4cbcdc-4212-464e-8e03-778cb39f095a	vndms.dmc.gov.vn
5128	Thông số đo mưa	\N	0	RAIN	\N	\N	48/75	f	ba3ec4d3-c6f6-4574-9860-416e202b84f0	vndms.dmc.gov.vn
5129	Thông số đo mưa	\N	0	RAIN	\N	\N	48/77	f	60827431-220b-43c8-863f-98e584354a74	vndms.dmc.gov.vn
5130	Thông số đo mưa	\N	0	RAIN	\N	\N	48/79	f	07958fa3-afe4-4f0f-989e-2911664ba013	vndms.dmc.gov.vn
5131	Thông số đo mưa	\N	0	RAIN	\N	\N	48/80	f	91392b6e-f3cf-41f2-bffa-06ac61c24b73	vndms.dmc.gov.vn
5132	Thông số đo mưa	\N	0	RAIN	\N	\N	48/81	f	7148a5cf-a90e-498f-8e90-04bd703bb4d2	vndms.dmc.gov.vn
5133	Thông số đo mưa	\N	0	RAIN	\N	\N	48/84	f	23d87370-985c-40bf-b981-d4c55bf0fea2	vndms.dmc.gov.vn
5134	Thông số đo mưa	\N	0	RAIN	\N	\N	48/85	f	165acd9d-02a0-409b-b32d-ad3793d4ca78	vndms.dmc.gov.vn
5135	Thông số đo mưa	\N	0	RAIN	\N	\N	48/86	f	f3dd225a-5af9-4a05-bf51-dd8f78cb197c	vndms.dmc.gov.vn
5136	Thông số đo mưa	\N	0	RAIN	\N	\N	48/88	f	d1b64b68-7c71-4429-8f67-de6d9e8c630a	vndms.dmc.gov.vn
5137	Thông số đo mưa	\N	0	RAIN	\N	\N	48/89	f	76037355-3b02-4f5c-8b37-1d9ea471bc41	vndms.dmc.gov.vn
5138	Thông số đo mưa	\N	0	RAIN	\N	\N	48/90	f	6bb2cc9a-e88e-4231-9998-1fc13add6a8e	vndms.dmc.gov.vn
5139	Thông số đo mưa	\N	0	RAIN	\N	\N	48/900	f	d4a1891f-fe83-4ea9-8bc2-cdd2dba3a0ee	vndms.dmc.gov.vn
5140	Thông số đo mưa	\N	0	RAIN	\N	\N	48/91	f	821bc670-4346-4548-8fc1-256a418393d9	vndms.dmc.gov.vn
5141	Thông số đo mưa	\N	0	RAIN	\N	\N	48/92	f	0c4f99ba-15ef-41ed-8ad0-2ddc1f843a84	vndms.dmc.gov.vn
5142	Thông số đo mưa	\N	0	RAIN	\N	\N	48/93	f	a9ada60a-fdf2-452d-a1fb-1c183aabc136	vndms.dmc.gov.vn
5143	Thông số đo mưa	\N	0	RAIN	\N	\N	48/930	f	d48d7e64-13a1-43c3-8e7e-2afcc8b6f6db	vndms.dmc.gov.vn
5144	Thông số đo mưa	\N	0	RAIN	\N	\N	48/94	f	50f447c5-af5b-416e-b6c5-357ad1c008d4	vndms.dmc.gov.vn
5145	Thông số đo mưa	\N	0	RAIN	\N	\N	48/940	f	04e64c47-8b1f-487a-9479-23fabb9395c1	vndms.dmc.gov.vn
5146	Thông số đo mưa	\N	0	RAIN	\N	\N	48/95	f	5b20a901-359a-4d35-81ba-6d6b512e6425	vndms.dmc.gov.vn
5147	Thông số đo mưa	\N	0	RAIN	\N	\N	48/96	f	15c1c2bf-e192-4394-9be8-ce937b3072e8	vndms.dmc.gov.vn
5148	Thông số đo mưa	\N	0	RAIN	\N	\N	48/97	f	8c2bbd2c-5dff-499d-b082-607423a1f119	vndms.dmc.gov.vn
5149	Thông số đo mưa	\N	0	RAIN	\N	\N	48/98	f	57fc082d-c42d-4dd4-853b-26d872cf3b4d	vndms.dmc.gov.vn
5150	Thông số đo mưa	\N	0	RAIN	\N	\N	480001	f	d69724c6-a257-4124-b0ae-66851c78b58d	vndms.dmc.gov.vn
5151	Thông số đo mưa	\N	0	RAIN	\N	\N	480002	f	75411f47-1788-44f0-83fd-c0e0cb2c1a6d	vndms.dmc.gov.vn
5152	Thông số đo mưa	\N	0	RAIN	\N	\N	480003	f	867ef0f4-6815-454a-b3e8-fc6206846963	vndms.dmc.gov.vn
5153	Thông số đo mưa	\N	0	RAIN	\N	\N	480004	f	27a07e8d-0db1-48c6-b6f6-593bba972ee3	vndms.dmc.gov.vn
5154	Thông số đo mưa	\N	0	RAIN	\N	\N	480005	f	1c396273-67e2-4e52-a1cb-4676c23a67c8	vndms.dmc.gov.vn
5155	Thông số đo mưa	\N	0	RAIN	\N	\N	480006	f	bbadf8fb-d4ce-4ecd-a984-9b48f8e0fb08	vndms.dmc.gov.vn
5156	Thông số đo mưa	\N	0	RAIN	\N	\N	480007	f	8bd2f067-67e8-43f3-ae36-a64acbb59856	vndms.dmc.gov.vn
5157	Thông số đo mưa	\N	0	RAIN	\N	\N	480008	f	032b9941-be26-447f-9653-cd22a6c61a2e	vndms.dmc.gov.vn
5158	Thông số đo mưa	\N	0	RAIN	\N	\N	480009	f	afbb476c-8c25-4abb-9793-0010c9fd17a0	vndms.dmc.gov.vn
5159	Thông số đo mưa	\N	0	RAIN	\N	\N	480010	f	da4d24ff-a19b-4b9e-a77f-eba493bbcf5f	vndms.dmc.gov.vn
5160	Thông số đo mưa	\N	0	RAIN	\N	\N	48013	f	62958505-cf29-4929-9e38-452b8eb1339e	vndms.dmc.gov.vn
5161	Thông số đo mưa	\N	0	RAIN	\N	\N	48015	f	60172ddb-08f8-4b8e-88d0-54a0bbd823e2	vndms.dmc.gov.vn
5162	Thông số đo mưa	\N	0	RAIN	\N	\N	480227	f	3abc9f24-8a13-4707-8f34-73e25da4ac34	vndms.dmc.gov.vn
5163	Thông số đo mưa	\N	0	RAIN	\N	\N	48026	f	af20a575-bfc6-4f79-bf12-017e9b4a0283	vndms.dmc.gov.vn
5164	Thông số đo mưa	\N	0	RAIN	\N	\N	48027	f	0de0e865-ee66-4e4f-a3ec-fa457403e94b	vndms.dmc.gov.vn
5165	Thông số đo mưa	\N	0	RAIN	\N	\N	48031	f	04718053-3d54-4784-b5eb-ad91f8799b05	vndms.dmc.gov.vn
5166	Thông số đo mưa	\N	0	RAIN	\N	\N	48032	f	6e09a924-03f5-42f9-8bee-9af71cb657ff	vndms.dmc.gov.vn
5167	Thông số đo mưa	\N	0	RAIN	\N	\N	48033	f	81a20ced-87d3-4bf4-b8b1-cbeff2eb32e3	vndms.dmc.gov.vn
5168	Thông số đo mưa	\N	0	RAIN	\N	\N	48035	f	395f2aff-6161-49db-a71d-920da033f719	vndms.dmc.gov.vn
5169	Thông số đo mưa	\N	0	RAIN	\N	\N	480537	f	20da772e-75d9-4686-8497-28b1147a57d4	vndms.dmc.gov.vn
5170	Thông số đo mưa	\N	0	RAIN	\N	\N	481046	f	c4e3acd8-eef4-49d2-9b10-8cb61e28c024	vndms.dmc.gov.vn
5171	Thông số đo mưa	\N	0	RAIN	\N	\N	4811	f	ff665b9e-6999-4dd3-8d05-730a8f37d863	vndms.dmc.gov.vn
5172	Thông số đo mưa	\N	0	RAIN	\N	\N	481223	f	7e416cef-a49a-4cc6-9ac2-df1793e50536	vndms.dmc.gov.vn
5173	Thông số đo mưa	\N	0	RAIN	\N	\N	481603	f	e5f768bf-3453-47c9-b8ac-c8a8a1fe089b	vndms.dmc.gov.vn
5174	Thông số đo mưa	\N	0	RAIN	\N	\N	482242	f	c00cf611-48c5-40e9-9bfb-d7b6bcfe8902	vndms.dmc.gov.vn
5175	Thông số đo mưa	\N	0	RAIN	\N	\N	482414	f	84b4e5b6-2bc1-468a-8660-0f6acdcc1c64	vndms.dmc.gov.vn
5176	Thông số đo mưa	\N	0	RAIN	\N	\N	483405	f	019f3e80-156c-44da-a95b-85715b5bc29c	vndms.dmc.gov.vn
5177	Thông số đo mưa	\N	0	RAIN	\N	\N	483784	f	dc35d663-3d4c-4b5f-aa9b-9ea09b02c363	vndms.dmc.gov.vn
5178	Thông số đo mưa	\N	0	RAIN	\N	\N	483909	f	69552aca-5df8-4450-8244-756db27095a2	vndms.dmc.gov.vn
5179	Thông số đo mưa	\N	0	RAIN	\N	\N	484480	f	0f6f5f5c-3010-45b5-8f94-a06adb357948	vndms.dmc.gov.vn
5180	Thông số đo mưa	\N	0	RAIN	\N	\N	485806	f	d9f745e8-5afb-43db-a4b6-5f1dd975806f	vndms.dmc.gov.vn
5181	Thông số đo mưa	\N	0	RAIN	\N	\N	486002	f	30504ee5-4655-47ec-8ec9-6d7c95a974fc	vndms.dmc.gov.vn
5182	Thông số đo mưa	\N	0	RAIN	\N	\N	487121	f	e2c8ebc3-997b-443f-87b7-4377d07a1248	vndms.dmc.gov.vn
5183	Thông số đo mưa	\N	0	RAIN	\N	\N	48800	f	3abca7d7-540b-401b-8e5f-0ee6e2093490	vndms.dmc.gov.vn
5184	Thông số đo mưa	\N	0	RAIN	\N	\N	48802	f	16e6985a-29c6-4bc6-8a4a-d6c7d5cb4af7	vndms.dmc.gov.vn
5185	Thông số đo mưa	\N	0	RAIN	\N	\N	48803	f	09bc71b9-678f-4a03-a2eb-8bae282caffb	vndms.dmc.gov.vn
5186	Thông số đo mưa	\N	0	RAIN	\N	\N	48805	f	e21f764c-9fde-473e-ae4e-d33e407b7c3a	vndms.dmc.gov.vn
5187	Thông số đo mưa	\N	0	RAIN	\N	\N	48807	f	2b8827b5-d705-4ba8-89dc-2c84bf4cbe40	vndms.dmc.gov.vn
5188	Thông số đo mưa	\N	0	RAIN	\N	\N	48808	f	1141250b-5406-49c7-828c-c437c16649ac	vndms.dmc.gov.vn
5189	Thông số đo mưa	\N	0	RAIN	\N	\N	48809	f	34bcb8e0-a0b4-470b-a496-167374cf221c	vndms.dmc.gov.vn
5190	Thông số đo mưa	\N	0	RAIN	\N	\N	48811	f	2cfd93a8-073b-4110-b613-4fd374aef96a	vndms.dmc.gov.vn
5191	Thông số đo mưa	\N	0	RAIN	\N	\N	48812	f	23ccde57-7ecd-403d-88ee-89718106717e	vndms.dmc.gov.vn
5192	Thông số đo mưa	\N	0	RAIN	\N	\N	48813	f	a7aff1af-4b18-4c47-8ade-c7a895b703d2	vndms.dmc.gov.vn
5193	Thông số đo mưa	\N	0	RAIN	\N	\N	48815	f	ee08e300-fa5a-43e6-aaa6-802080c24176	vndms.dmc.gov.vn
5194	Thông số đo mưa	\N	0	RAIN	\N	\N	48817	f	8cb3e5d8-59cc-4f90-80c8-3690d46a2d3b	vndms.dmc.gov.vn
5195	Thông số đo mưa	\N	0	RAIN	\N	\N	48818	f	9f4916a9-3b3a-42c0-8610-cbde241b7d8f	vndms.dmc.gov.vn
5196	Thông số đo mưa	\N	0	RAIN	\N	\N	48826	f	87c3724f-9732-4964-9a4e-3884350b3d76	vndms.dmc.gov.vn
5197	Thông số đo mưa	\N	0	RAIN	\N	\N	48827	f	96577e68-5ea2-43bc-acd4-ae5e328eccad	vndms.dmc.gov.vn
5198	Thông số đo mưa	\N	0	RAIN	\N	\N	488283	f	dd73848a-65bb-4c26-a870-6b607d8ef551	vndms.dmc.gov.vn
5199	Thông số đo mưa	\N	0	RAIN	\N	\N	48831	f	1fc9c751-5471-497d-9c63-7b48504e1a0d	vndms.dmc.gov.vn
5200	Thông số đo mưa	\N	0	RAIN	\N	\N	48832	f	5a02191c-1ab1-44ed-9f1b-3b849af2944b	vndms.dmc.gov.vn
5201	Thông số đo mưa	\N	0	RAIN	\N	\N	48834	f	f4efbc05-2eba-4f8c-b74a-dc79f8b936a3	vndms.dmc.gov.vn
5202	Thông số đo mưa	\N	0	RAIN	\N	\N	48835	f	50018a88-4885-48a7-a55f-3c5a8552bf3a	vndms.dmc.gov.vn
5203	Thông số đo mưa	\N	0	RAIN	\N	\N	48836	f	5698e716-b78c-4ac6-9440-e34ad6fa5c01	vndms.dmc.gov.vn
5204	Thông số đo mưa	\N	0	RAIN	\N	\N	48838	f	a57da79d-92cf-4236-94aa-8b32a401b2fc	vndms.dmc.gov.vn
5205	Thông số đo mưa	\N	0	RAIN	\N	\N	48840	f	b2157044-e468-4ce6-b23c-67ecbca5ea5c	vndms.dmc.gov.vn
5206	Thông số đo mưa	\N	0	RAIN	\N	\N	48842	f	b66c483c-02ae-474b-bd74-760803f48b34	vndms.dmc.gov.vn
5207	Thông số đo mưa	\N	0	RAIN	\N	\N	488446	f	7a8bd1ea-0a6a-43f4-90b3-e48c3f152ada	vndms.dmc.gov.vn
5208	Thông số đo mưa	\N	0	RAIN	\N	\N	48845	f	c4cb54be-7532-4d35-98ec-17ec4175d071	vndms.dmc.gov.vn
5209	Thông số đo mưa	\N	0	RAIN	\N	\N	48846	f	79ace5ec-d8bd-450a-9ae7-08e80d77937b	vndms.dmc.gov.vn
5210	Thông số đo mưa	\N	0	RAIN	\N	\N	48847	f	491579cf-9d78-4c02-ae11-025b21df21d8	vndms.dmc.gov.vn
5211	Thông số đo mưa	\N	0	RAIN	\N	\N	48848	f	53d5705e-2f93-4c60-813b-2e23cb81f769	vndms.dmc.gov.vn
5212	Thông số đo mưa	\N	0	RAIN	\N	\N	48849	f	b14bbb15-de43-48c1-a08f-ead3c067a28b	vndms.dmc.gov.vn
5213	Thông số đo mưa	\N	0	RAIN	\N	\N	488490	f	9316b82c-8b0c-4b8e-b0cb-1f8d39e61192	vndms.dmc.gov.vn
5214	Thông số đo mưa	\N	0	RAIN	\N	\N	48852	f	e4fb729c-3c5e-4849-be8c-96d835f25f1c	vndms.dmc.gov.vn
5215	Thông số đo mưa	\N	0	RAIN	\N	\N	48855	f	05c83ba6-6f57-48da-b4de-430f26c97750	vndms.dmc.gov.vn
5216	Thông số đo mưa	\N	0	RAIN	\N	\N	488550	f	96df2475-4c8f-4f07-a5c3-7207a216dce0	vndms.dmc.gov.vn
5217	Thông số đo mưa	\N	0	RAIN	\N	\N	488570	f	4794e723-c8eb-4d18-99e8-97d4a9691ff2	vndms.dmc.gov.vn
5218	Thông số đo mưa	\N	0	RAIN	\N	\N	48861	f	c6a01c09-2774-4a53-b0fe-c3ffc478a2e0	vndms.dmc.gov.vn
5219	Thông số đo mưa	\N	0	RAIN	\N	\N	48863	f	83a62b4f-2a65-406b-8e44-7f403dc7485a	vndms.dmc.gov.vn
5220	Thông số đo mưa	\N	0	RAIN	\N	\N	48864	f	147bc114-fb1c-4ff3-909a-358d65729e8b	vndms.dmc.gov.vn
5221	Thông số đo mưa	\N	0	RAIN	\N	\N	48865	f	f608b4f3-d3fb-49b9-bf21-248a519431df	vndms.dmc.gov.vn
5222	Thông số đo mưa	\N	0	RAIN	\N	\N	48866	f	3d5f2ad6-7391-4e34-a0fd-6b18f73a2462	vndms.dmc.gov.vn
5223	Thông số đo mưa	\N	0	RAIN	\N	\N	48867	f	ef35ec3a-ab1f-4f48-aef5-c8d444a9ea8b	vndms.dmc.gov.vn
5224	Thông số đo mưa	\N	0	RAIN	\N	\N	48869	f	9bb787f4-0c17-46ce-9552-f690b075db3b	vndms.dmc.gov.vn
5225	Thông số đo mưa	\N	0	RAIN	\N	\N	48870	f	9052fc54-86f0-47fc-9b86-4faaaa5af66b	vndms.dmc.gov.vn
5226	Thông số đo mưa	\N	0	RAIN	\N	\N	48872	f	b7a45ca6-64c1-4ec6-b723-b2443d0c1439	vndms.dmc.gov.vn
5227	Thông số đo mưa	\N	0	RAIN	\N	\N	48875	f	83cf68eb-92f6-462d-ad22-b4d8e2a4bbb0	vndms.dmc.gov.vn
5228	Thông số đo mưa	\N	0	RAIN	\N	\N	48876	f	5c383878-1a26-41ef-b38b-1d5c6843a20a	vndms.dmc.gov.vn
5229	Thông số đo mưa	\N	0	RAIN	\N	\N	48878	f	55d37cab-f52b-4d8b-9b72-c56235e9e0ee	vndms.dmc.gov.vn
5230	Thông số đo mưa	\N	0	RAIN	\N	\N	48880	f	7f57c54b-35a4-49f3-b241-83180d59e0be	vndms.dmc.gov.vn
5231	Thông số đo mưa	\N	0	RAIN	\N	\N	48881	f	7ae4cf02-3f12-4264-abfa-c52300a2dc28	vndms.dmc.gov.vn
5232	Thông số đo mưa	\N	0	RAIN	\N	\N	48882	f	61b32f2d-fab3-4815-800b-520ea72e3956	vndms.dmc.gov.vn
5233	Thông số đo mưa	\N	0	RAIN	\N	\N	48883	f	42ad4dad-b650-4c2f-acd3-d2a83eaea187	vndms.dmc.gov.vn
5234	Thông số đo mưa	\N	0	RAIN	\N	\N	48885	f	b3650e35-4925-405e-aa75-b67fce5e81ed	vndms.dmc.gov.vn
5235	Thông số đo mưa	\N	0	RAIN	\N	\N	48886	f	c96f7db0-e5e2-4f6b-b11e-053adc53a5db	vndms.dmc.gov.vn
5236	Thông số đo mưa	\N	0	RAIN	\N	\N	48888	f	26f82898-941a-4bf1-a609-10643edc7e26	vndms.dmc.gov.vn
5237	Thông số đo mưa	\N	0	RAIN	\N	\N	48889	f	a2d22ea8-7e0d-4b0c-93ea-c2b73095682f	vndms.dmc.gov.vn
5238	Thông số đo mưa	\N	0	RAIN	\N	\N	48892	f	2d9c2f22-1cb6-4ebe-a520-a3750ca85879	vndms.dmc.gov.vn
5239	Thông số đo mưa	\N	0	RAIN	\N	\N	48895	f	ce12831f-8e33-409a-a775-d3600298902a	vndms.dmc.gov.vn
5240	Thông số đo mưa	\N	0	RAIN	\N	\N	48896	f	8f25d539-1626-44ee-8699-05040d2ee30c	vndms.dmc.gov.vn
5241	Thông số đo mưa	\N	0	RAIN	\N	\N	48897	f	a2d6b960-af42-44df-a8e9-50ba398e04ae	vndms.dmc.gov.vn
5242	Thông số đo mưa	\N	0	RAIN	\N	\N	48898	f	08c162d8-bb0d-4c5a-84f7-a94d14bd81b5	vndms.dmc.gov.vn
5243	Thông số đo mưa	\N	0	RAIN	\N	\N	48904	f	7f0d35f4-7a09-4186-92a4-40e3748cb935	vndms.dmc.gov.vn
5244	Thông số đo mưa	\N	0	RAIN	\N	\N	48906	f	36c95062-9642-4ac5-bd3e-a48401d696b2	vndms.dmc.gov.vn
5245	Thông số đo mưa	\N	0	RAIN	\N	\N	48907	f	fd258565-b142-4a0d-b5c4-4d8155939123	vndms.dmc.gov.vn
5246	Thông số đo mưa	\N	0	RAIN	\N	\N	48910	f	50d508d2-20c9-46dd-9c7f-5af20baedba1	vndms.dmc.gov.vn
5247	Thông số đo mưa	\N	0	RAIN	\N	\N	48913	f	1072ae80-a84b-40bc-a58c-c164b56ab7a1	vndms.dmc.gov.vn
5248	Thông số đo mưa	\N	0	RAIN	\N	\N	48914	f	40de4c47-0c51-4ad3-93e5-9fdd7d3d4aad	vndms.dmc.gov.vn
5249	Thông số đo mưa	\N	0	RAIN	\N	\N	48915	f	72d4fbf8-19c0-4a67-b7fb-e769c0c36248	vndms.dmc.gov.vn
5250	Thông số đo mưa	\N	0	RAIN	\N	\N	48916	f	b1c9ef45-ccf9-42a4-8503-b12aa4439f32	vndms.dmc.gov.vn
5251	Thông số đo mưa	\N	0	RAIN	\N	\N	48917	f	0b38612a-484d-4d42-8858-619ed7d7323d	vndms.dmc.gov.vn
5252	Thông số đo mưa	\N	0	RAIN	\N	\N	48918	f	04e1e4eb-b0d8-4194-ab18-19d0fbc50a3b	vndms.dmc.gov.vn
5253	Thông số đo mưa	\N	0	RAIN	\N	\N	48919	f	33f2fa96-f77d-4028-9307-8bcd623acfa1	vndms.dmc.gov.vn
5254	Thông số đo mưa	\N	0	RAIN	\N	\N	48920	f	8c72f1d3-4f83-47a1-9b28-920c2d32d9c9	vndms.dmc.gov.vn
5255	Thông số đo mưa	\N	0	RAIN	\N	\N	489817	f	12d343f1-3a6c-4763-922a-e84bc6540312	vndms.dmc.gov.vn
5256	Thông số đo mưa	\N	0	RAIN	\N	\N	489822	f	e6242291-b9ce-4d21-aadc-1592b16fa62a	vndms.dmc.gov.vn
5257	Thông số đo mưa	\N	0	RAIN	\N	\N	490001	f	52071499-21b1-418c-b791-6c186b61be06	vndms.dmc.gov.vn
5258	Thông số đo mưa	\N	0	RAIN	\N	\N	490002	f	da7efd05-4445-4afb-8788-86a93c3b7f41	vndms.dmc.gov.vn
5259	Thông số đo mưa	\N	0	RAIN	\N	\N	490003	f	b0dd0a43-c36d-4a7e-9456-ef3208aa4961	vndms.dmc.gov.vn
5260	Thông số đo mưa	\N	0	RAIN	\N	\N	490004	f	6b348d31-2f8a-4f4b-a947-8794fb8b5bc8	vndms.dmc.gov.vn
5261	Thông số đo mưa	\N	0	RAIN	\N	\N	490005	f	acc507ad-9bb0-42b0-b3b0-f789a5822927	vndms.dmc.gov.vn
5262	Thông số đo mưa	\N	0	RAIN	\N	\N	490006	f	01bc4e1f-1265-4acb-abcd-c7301131dac1	vndms.dmc.gov.vn
5263	Thông số đo mưa	\N	0	RAIN	\N	\N	490007	f	67ce4ca0-c127-4797-8291-d80d5d3f7170	vndms.dmc.gov.vn
5264	Thông số đo mưa	\N	0	RAIN	\N	\N	490010	f	19356916-7aa2-45cc-80de-c190da97e534	vndms.dmc.gov.vn
5265	Thông số đo mưa	\N	0	RAIN	\N	\N	490011	f	4a764af0-877c-41a7-99ab-d47a23a84253	vndms.dmc.gov.vn
5266	Thông số đo mưa	\N	0	RAIN	\N	\N	490027	f	ea82a36a-536e-444f-9c3e-ab9a5f1cb5db	vndms.dmc.gov.vn
5267	Thông số đo mưa	\N	0	RAIN	\N	\N	490028	f	ea7528be-4e3f-4ef9-9ffe-57476114ecc0	vndms.dmc.gov.vn
5268	Thông số đo mưa	\N	0	RAIN	\N	\N	490029	f	64cb510d-2b90-4646-9f59-2c7fcf49b8fe	vndms.dmc.gov.vn
5269	Thông số đo mưa	\N	0	RAIN	\N	\N	490030	f	9faec1db-7d6f-4894-b4a1-2247084a96e9	vndms.dmc.gov.vn
5270	Thông số đo mưa	\N	0	RAIN	\N	\N	490031	f	5517a8ea-de9d-4c28-8586-b064a8b0b3a3	vndms.dmc.gov.vn
5271	Thông số đo mưa	\N	0	RAIN	\N	\N	490032	f	43eea962-b257-4d63-82fb-ab571d43bc17	vndms.dmc.gov.vn
5272	Thông số đo mưa	\N	0	RAIN	\N	\N	490033	f	704ce2fc-505b-4d09-b31e-bacd575c558f	vndms.dmc.gov.vn
5273	Thông số đo mưa	\N	0	RAIN	\N	\N	490034	f	3f8948dc-083b-44b3-9557-794e2657a415	vndms.dmc.gov.vn
5274	Thông số đo mưa	\N	0	RAIN	\N	\N	490035	f	9062e566-bb2a-4e4c-99e2-954fe50d687c	vndms.dmc.gov.vn
5275	Thông số đo mưa	\N	0	RAIN	\N	\N	490036	f	6d22e4df-7701-4437-b130-352d88c9a6c8	vndms.dmc.gov.vn
5276	Thông số đo mưa	\N	0	RAIN	\N	\N	490037	f	2e486161-6eec-4f35-9fbb-27da58f70a49	vndms.dmc.gov.vn
5277	Thông số đo mưa	\N	0	RAIN	\N	\N	490038	f	113253e4-cf62-4425-8b55-834ee9268be8	vndms.dmc.gov.vn
5278	Thông số đo mưa	\N	0	RAIN	\N	\N	490039	f	aefb97ee-833d-4b47-b652-d763dcc05cca	vndms.dmc.gov.vn
5279	Thông số đo mưa	\N	0	RAIN	\N	\N	490040	f	867f2b3d-c83e-4e03-949a-893b04a9fd15	vndms.dmc.gov.vn
5280	Thông số đo mưa	\N	0	RAIN	\N	\N	490041	f	4b62b306-21c8-41f3-bbea-e2a4aa087d10	vndms.dmc.gov.vn
5281	Thông số đo mưa	\N	0	RAIN	\N	\N	490042	f	86a180e7-89c2-4870-9ae8-a5faaff728b6	vndms.dmc.gov.vn
5282	Thông số đo mưa	\N	0	RAIN	\N	\N	490043	f	24658b8d-43e0-48c0-955f-54f50840abf2	vndms.dmc.gov.vn
5283	Thông số đo mưa	\N	0	RAIN	\N	\N	490044	f	43570a04-960f-4d14-89ad-faf1bc29131f	vndms.dmc.gov.vn
5284	Thông số đo mưa	\N	0	RAIN	\N	\N	490045	f	90e20a7c-3822-4d27-b953-a53563fc1c56	vndms.dmc.gov.vn
5285	Thông số đo mưa	\N	0	RAIN	\N	\N	490046	f	c3a61b95-3950-4085-9cd7-99888aa8e815	vndms.dmc.gov.vn
5286	Thông số đo mưa	\N	0	RAIN	\N	\N	490050	f	f5b8dad0-9901-4308-adfd-2fb2955382c1	vndms.dmc.gov.vn
5287	Thông số đo mưa	\N	0	RAIN	\N	\N	490051	f	ee0a933f-17f9-4ecd-af01-51a6aecd5feb	vndms.dmc.gov.vn
5288	Thông số đo mưa	\N	0	RAIN	\N	\N	490052	f	d1eb806b-3df1-4a2a-be91-4b3648544b09	vndms.dmc.gov.vn
5289	Thông số đo mưa	\N	0	RAIN	\N	\N	490053	f	0e6e9ebf-3f68-4e77-92f1-f642b7ef1076	vndms.dmc.gov.vn
5290	Thông số đo mưa	\N	0	RAIN	\N	\N	490054	f	7b15b045-efec-44ff-a284-d8eb373938e1	vndms.dmc.gov.vn
5291	Thông số đo mưa	\N	0	RAIN	\N	\N	490055	f	ef646f6f-23ee-48d0-a047-6ea4ce448865	vndms.dmc.gov.vn
5292	Thông số đo mưa	\N	0	RAIN	\N	\N	490056	f	57c386a9-17ed-4670-a612-91f372e10a04	vndms.dmc.gov.vn
5293	Thông số đo mưa	\N	0	RAIN	\N	\N	490057	f	e6bd3cc2-deff-44b8-bbbe-bc3dc32c6d1e	vndms.dmc.gov.vn
5294	Thông số đo mưa	\N	0	RAIN	\N	\N	490058	f	54364306-d95d-474c-bc91-6d938a0a2ee7	vndms.dmc.gov.vn
5295	Thông số đo mưa	\N	0	RAIN	\N	\N	490059	f	1e7c7edb-b46a-494a-ac97-512c5bcb105d	vndms.dmc.gov.vn
5296	Thông số đo mưa	\N	0	RAIN	\N	\N	490061	f	db694246-dfe3-4736-8973-d3809e6fae42	vndms.dmc.gov.vn
5297	Thông số đo mưa	\N	0	RAIN	\N	\N	490062	f	53eb958b-4546-46e9-81c3-2e16e6c35c7f	vndms.dmc.gov.vn
5298	Thông số đo mưa	\N	0	RAIN	\N	\N	490063	f	3b7accea-5ec7-4260-be48-3e7ea66dbdbc	vndms.dmc.gov.vn
5299	Thông số đo mưa	\N	0	RAIN	\N	\N	490064	f	334c2edd-5ed7-4a77-a31f-6b314f525de1	vndms.dmc.gov.vn
5300	Thông số đo mưa	\N	0	RAIN	\N	\N	490065	f	969f8454-5dfe-42a3-a5f5-597472c902d4	vndms.dmc.gov.vn
5301	Thông số đo mưa	\N	0	RAIN	\N	\N	490066	f	f7dc84c3-a5fc-421a-98d1-b467a6db7fd3	vndms.dmc.gov.vn
5302	Thông số đo mưa	\N	0	RAIN	\N	\N	490067	f	4e6821f7-29d2-42a3-898a-692dc86d003e	vndms.dmc.gov.vn
5303	Thông số đo mưa	\N	0	RAIN	\N	\N	490068	f	2c596766-25aa-438a-8c34-226cfb948063	vndms.dmc.gov.vn
5304	Thông số đo mưa	\N	0	RAIN	\N	\N	490069	f	439cc360-cf2d-41b6-baa2-43fb7d30a244	vndms.dmc.gov.vn
5305	Thông số đo mưa	\N	0	RAIN	\N	\N	490070	f	bf08cf72-409a-4f95-861e-b9e14a381252	vndms.dmc.gov.vn
5306	Thông số đo mưa	\N	0	RAIN	\N	\N	490071	f	79f4bfbb-8091-4dc8-85f0-d434e81edcbf	vndms.dmc.gov.vn
5307	Thông số đo mưa	\N	0	RAIN	\N	\N	490072	f	1d43e0ab-7df8-4a4a-ace0-4b7cd86618de	vndms.dmc.gov.vn
5308	Thông số đo mưa	\N	0	RAIN	\N	\N	492430	f	15647bec-9aef-4b26-84bc-91437644163b	vndms.dmc.gov.vn
5309	Thông số đo mưa	\N	0	RAIN	\N	\N	493521	f	73820b35-4e79-4489-af45-047bc67a2fd7	vndms.dmc.gov.vn
5310	Thông số đo mưa	\N	0	RAIN	\N	\N	493730	f	84c05242-62df-4031-bb61-40575877034b	vndms.dmc.gov.vn
5311	Thông số đo mưa	\N	0	RAIN	\N	\N	494436	f	2cbbed2c-f288-4f39-812b-71e2fb949ffe	vndms.dmc.gov.vn
5312	Thông số đo mưa	\N	0	RAIN	\N	\N	495403	f	82f3ed94-7572-4786-9bab-c74997885d00	vndms.dmc.gov.vn
5313	Thông số đo mưa	\N	0	RAIN	\N	\N	495830	f	b48477cb-0739-4d71-917d-d6503dead912	vndms.dmc.gov.vn
5314	Thông số đo mưa	\N	0	RAIN	\N	\N	496054	f	ca314835-d53c-472b-8e52-3fd836eb705f	vndms.dmc.gov.vn
5315	Thông số đo mưa	\N	0	RAIN	\N	\N	496347	f	61d79c4d-3157-4e42-9b6f-27fe06bf84ce	vndms.dmc.gov.vn
5316	Thông số đo mưa	\N	0	RAIN	\N	\N	498349	f	71129708-a921-4591-8b5e-1e3237ae7395	vndms.dmc.gov.vn
5317	Thông số đo mưa	\N	0	RAIN	\N	\N	501285	f	1e2ba431-3731-4d7c-a192-821a398dba80	vndms.dmc.gov.vn
5318	Thông số đo mưa	\N	0	RAIN	\N	\N	501508	f	1db3e424-28ed-4835-8897-6e88dc931e5b	vndms.dmc.gov.vn
5319	Thông số đo mưa	\N	0	RAIN	\N	\N	501833	f	e54e476d-6e1b-4fea-b6ec-440024eeace5	vndms.dmc.gov.vn
5320	Thông số đo mưa	\N	0	RAIN	\N	\N	503047	f	28717c22-df1e-401a-9d82-19834588e072	vndms.dmc.gov.vn
5321	Thông số đo mưa	\N	0	RAIN	\N	\N	503462	f	cf194a66-c94f-45ac-8067-bb70c690681b	vndms.dmc.gov.vn
5322	Thông số đo mưa	\N	0	RAIN	\N	\N	505148	f	7dcdaae1-e74e-4f2f-8a7d-0bab30a40ff6	vndms.dmc.gov.vn
5323	Thông số đo mưa	\N	0	RAIN	\N	\N	507343	f	54bc983a-8932-4eb1-b555-877dd314719c	vndms.dmc.gov.vn
5324	Thông số đo mưa	\N	0	RAIN	\N	\N	507383	f	efdd9b70-4921-4592-be8a-84011b0f4cbd	vndms.dmc.gov.vn
5325	Thông số đo mưa	\N	0	RAIN	\N	\N	508987	f	52b082e5-b05a-47a1-9486-7ac3d749bf70	vndms.dmc.gov.vn
5326	Thông số đo mưa	\N	0	RAIN	\N	\N	509537	f	38aa5811-6c28-434a-8d06-13314dc7f05d	vndms.dmc.gov.vn
5327	Thông số đo mưa	\N	0	RAIN	\N	\N	516732	f	22e3e3b0-2733-4990-94f1-a9cd1281740d	vndms.dmc.gov.vn
5328	Thông số đo mưa	\N	0	RAIN	\N	\N	517047	f	c76a1f22-abc5-421d-b414-8a6147366847	vndms.dmc.gov.vn
5329	Thông số đo mưa	\N	0	RAIN	\N	\N	518523	f	59a123ff-cf7b-4617-9cf8-f788457aac76	vndms.dmc.gov.vn
5330	Thông số đo mưa	\N	0	RAIN	\N	\N	518933	f	7af5a284-e34d-4b07-a1d8-9c987d563a63	vndms.dmc.gov.vn
5331	Thông số đo mưa	\N	0	RAIN	\N	\N	519263	f	48a1a0f2-efb6-4cb9-a6b6-4fc4452ffab5	vndms.dmc.gov.vn
5332	Thông số đo mưa	\N	0	RAIN	\N	\N	520833	f	d1122bc9-3e88-45a1-b614-cf754f0cbdd6	vndms.dmc.gov.vn
5333	Thông số đo mưa	\N	0	RAIN	\N	\N	521170	f	101137f4-0199-4eb2-adac-fc0c17503d2b	vndms.dmc.gov.vn
5334	Thông số đo mưa	\N	0	RAIN	\N	\N	522912	f	6d683e90-6c65-44e7-967b-d8e57c0261b5	vndms.dmc.gov.vn
5335	Thông số đo mưa	\N	0	RAIN	\N	\N	523017	f	08dad526-af84-4d59-a7f1-9f01dc8ce8c8	vndms.dmc.gov.vn
5336	Thông số đo mưa	\N	0	RAIN	\N	\N	525006	f	e6432c18-5025-428a-83f5-04c0991e38da	vndms.dmc.gov.vn
5337	Thông số đo mưa	\N	0	RAIN	\N	\N	525723	f	619e7165-35ae-497c-b127-64419b9db931	vndms.dmc.gov.vn
5338	Thông số đo mưa	\N	0	RAIN	\N	\N	526201	f	216b7aef-900f-41a0-ad33-f9a074b9c18f	vndms.dmc.gov.vn
5339	Thông số đo mưa	\N	0	RAIN	\N	\N	52934	f	c951fbcd-3404-43ba-8616-ee53e653fa13	vndms.dmc.gov.vn
5340	Thông số đo mưa	\N	0	RAIN	\N	\N	530605	f	cfa8f4b5-28d6-4fd7-a0ac-4e3f7465f802	vndms.dmc.gov.vn
5341	Thông số đo mưa	\N	0	RAIN	\N	\N	531519	f	75fb0e0a-7cf3-4ac7-b8a8-0f63325d0edd	vndms.dmc.gov.vn
5342	Thông số đo mưa	\N	0	RAIN	\N	\N	534602	f	2d522203-5d0a-48e6-9ad0-623a2034a7ce	vndms.dmc.gov.vn
5343	Thông số đo mưa	\N	0	RAIN	\N	\N	536630	f	086737ff-31d8-46ad-be28-2baa08f1435a	vndms.dmc.gov.vn
5344	Thông số đo mưa	\N	0	RAIN	\N	\N	537192	f	6b9c91cb-7228-4cfe-ad0d-1a3cc4262db2	vndms.dmc.gov.vn
5345	Thông số đo mưa	\N	0	RAIN	\N	\N	53765	f	80810204-81ff-4b81-b265-3481f0849aa4	vndms.dmc.gov.vn
5346	Thông số đo mưa	\N	0	RAIN	\N	\N	539167	f	7ef6f749-34b7-42af-8fdf-b4bf8e4bb777	vndms.dmc.gov.vn
5347	Thông số đo mưa	\N	0	RAIN	\N	\N	539248	f	70fbf7ce-2d4a-4fb4-8744-146462cb20d3	vndms.dmc.gov.vn
5348	Thông số đo mưa	\N	0	RAIN	\N	\N	541562	f	212a9ee5-db83-4cd6-b993-84d84d84fdfd	vndms.dmc.gov.vn
5349	Thông số đo mưa	\N	0	RAIN	\N	\N	543032	f	ba83ac99-23e7-46f0-9958-e717d66f033e	vndms.dmc.gov.vn
5350	Thông số đo mưa	\N	0	RAIN	\N	\N	545708	f	d2dc2395-c4d7-4c4b-a370-4a0919f4e5a4	vndms.dmc.gov.vn
5351	Thông số đo mưa	\N	0	RAIN	\N	\N	547910	f	97339872-d0f4-4688-a5bb-bfc72c8a1739	vndms.dmc.gov.vn
5352	Thông số đo mưa	\N	0	RAIN	\N	\N	548042	f	66be1fb7-1aa7-4fff-b466-f9aea9931cd7	vndms.dmc.gov.vn
5353	Thông số đo mưa	\N	0	RAIN	\N	\N	549927	f	830ee9cf-6b0a-490f-a6ba-73daa2667011	vndms.dmc.gov.vn
5354	Thông số đo mưa	\N	0	RAIN	\N	\N	552447	f	15931320-024a-4a86-b3c4-915ff5c9ba8f	vndms.dmc.gov.vn
5355	Thông số đo mưa	\N	0	RAIN	\N	\N	553600	f	26c3c5bd-dca2-4bd2-b0d4-8fb03189f7c5	vndms.dmc.gov.vn
5356	Thông số đo mưa	\N	0	RAIN	\N	\N	554052	f	59eb0d52-e7de-41ec-8996-ba08c627106d	vndms.dmc.gov.vn
5357	Thông số đo mưa	\N	0	RAIN	\N	\N	554811	f	e166df64-0079-4df7-a194-d7b8b74de87b	vndms.dmc.gov.vn
5358	Thông số đo mưa	\N	0	RAIN	\N	\N	557640	f	d441f65b-8fe1-4f3b-87d7-c51d84a8e3bd	vndms.dmc.gov.vn
5359	Thông số đo mưa	\N	0	RAIN	\N	\N	560090	f	ad5f9c21-9db4-406d-8b3f-1e7f3740acc4	vndms.dmc.gov.vn
5360	Thông số đo mưa	\N	0	RAIN	\N	\N	562614	f	78721cc4-b896-4c48-9017-ec6165748cf7	vndms.dmc.gov.vn
5361	Thông số đo mưa	\N	0	RAIN	\N	\N	565576	f	2e84cdc6-eefe-441e-a1a1-5d2c201f4346	vndms.dmc.gov.vn
5362	Thông số đo mưa	\N	0	RAIN	\N	\N	567011	f	ea724d76-80c1-4806-b315-9f9878a1e296	vndms.dmc.gov.vn
5363	Thông số đo mưa	\N	0	RAIN	\N	\N	567613	f	13ac1bfb-c3ef-4187-9263-daf8ab4017c5	vndms.dmc.gov.vn
5364	Thông số đo mưa	\N	0	RAIN	\N	\N	56882	f	7494a542-a276-48f6-91ba-ce740a068562	vndms.dmc.gov.vn
5365	Thông số đo mưa	\N	0	RAIN	\N	\N	572335	f	5b5c1a68-3588-4524-8ca5-40b01d6cc936	vndms.dmc.gov.vn
5366	Thông số đo mưa	\N	0	RAIN	\N	\N	573731	f	f84f27dc-6780-4610-bccb-4becb2fb4b98	vndms.dmc.gov.vn
5367	Thông số đo mưa	\N	0	RAIN	\N	\N	574233	f	65f67e63-b8b7-4d9e-b12c-ca46d26e073f	vndms.dmc.gov.vn
5368	Thông số đo mưa	\N	0	RAIN	\N	\N	574934	f	dcbc1077-2394-4e4a-97f2-9147fec40759	vndms.dmc.gov.vn
5369	Thông số đo mưa	\N	0	RAIN	\N	\N	576354	f	d6e39f6e-4dfe-4c74-bab4-a1eaa3f4f493	vndms.dmc.gov.vn
5370	Thông số đo mưa	\N	0	RAIN	\N	\N	577172	f	e27b1a88-29cf-4bea-bf3b-a45565231af6	vndms.dmc.gov.vn
5371	Thông số đo mưa	\N	0	RAIN	\N	\N	57734	f	08893ea9-e065-45ff-867e-5849fcc3b045	vndms.dmc.gov.vn
5372	Thông số đo mưa	\N	0	RAIN	\N	\N	579451	f	e2ab3220-5735-45a9-b1c9-1222c07cbf54	vndms.dmc.gov.vn
5373	Thông số đo mưa	\N	0	RAIN	\N	\N	580010	f	1aafdcc6-b703-4f3d-b5c6-46bb6d43f981	vndms.dmc.gov.vn
5374	Thông số đo mưa	\N	0	RAIN	\N	\N	580501	f	8fa94f80-4246-4b05-9952-6abc1f601181	vndms.dmc.gov.vn
5375	Thông số đo mưa	\N	0	RAIN	\N	\N	582484	f	ed489779-2545-4714-8742-4e5bbdfb5e2b	vndms.dmc.gov.vn
5376	Thông số đo mưa	\N	0	RAIN	\N	\N	583017	f	dcf40404-2c78-4e7f-93f6-62b12284e2d5	vndms.dmc.gov.vn
5377	Thông số đo mưa	\N	0	RAIN	\N	\N	583209	f	0933f63b-4447-498c-8846-779c3e204d8b	vndms.dmc.gov.vn
5378	Thông số đo mưa	\N	0	RAIN	\N	\N	587703	f	46d01c8d-f0f5-4abc-98ff-f6a9eac0d2b1	vndms.dmc.gov.vn
5379	Thông số đo mưa	\N	0	RAIN	\N	\N	589954	f	deb29b14-88d2-4fd3-8418-04a47e8721eb	vndms.dmc.gov.vn
5380	Thông số đo mưa	\N	0	RAIN	\N	\N	593017	f	62464c19-ca4c-4b83-83e5-3af4ac182a7d	vndms.dmc.gov.vn
5381	Thông số đo mưa	\N	0	RAIN	\N	\N	59510	f	85bcac89-b5a2-46e2-b9f1-f32bc86beb9f	vndms.dmc.gov.vn
5382	Thông số đo mưa	\N	0	RAIN	\N	\N	596187	f	a0f93134-744e-4883-ba3e-ce80db080af4	vndms.dmc.gov.vn
5383	Thông số đo mưa	\N	0	RAIN	\N	\N	59637	f	25f4414b-80ab-48b8-b255-9e7531d43336	vndms.dmc.gov.vn
5384	Thông số đo mưa	\N	0	RAIN	\N	\N	598335	f	694bfe6e-8c5c-402c-b847-b0d9533e23c7	vndms.dmc.gov.vn
5385	Thông số đo mưa	\N	0	RAIN	\N	\N	598553	f	c3fb8261-0dc5-4c84-8bcb-dcda6cb49910	vndms.dmc.gov.vn
5386	Thông số đo mưa	\N	0	RAIN	\N	\N	600001	f	c2736187-54a6-4608-b9d2-08034d282b2b	vndms.dmc.gov.vn
5387	Thông số đo mưa	\N	0	RAIN	\N	\N	600003	f	d1613893-85ef-40f1-92ff-7a69e6db0fa7	vndms.dmc.gov.vn
5388	Thông số đo mưa	\N	0	RAIN	\N	\N	600004	f	58257d92-bf6f-4f5b-b033-59ba37726682	vndms.dmc.gov.vn
5389	Thông số đo mưa	\N	0	RAIN	\N	\N	600005	f	48a3749c-7ca2-4fce-a30c-92a9560013e5	vndms.dmc.gov.vn
5390	Thông số đo mưa	\N	0	RAIN	\N	\N	601874	f	4d59ca32-7261-4dd3-91f0-5af38f402c17	vndms.dmc.gov.vn
5391	Thông số đo mưa	\N	0	RAIN	\N	\N	602147	f	b7b6b8c8-de7e-41c0-aad8-d2ff84798126	vndms.dmc.gov.vn
5392	Thông số đo mưa	\N	0	RAIN	\N	\N	602704	f	64873a97-793a-4ac8-8508-38ff11ca110f	vndms.dmc.gov.vn
5393	Thông số đo mưa	\N	0	RAIN	\N	\N	602730	f	28e3fb4e-45d4-4dc6-bef5-d692b1f19391	vndms.dmc.gov.vn
5394	Thông số đo mưa	\N	0	RAIN	\N	\N	603128	f	95af6ff1-0f04-4988-9ea5-5d5871187077	vndms.dmc.gov.vn
5395	Thông số đo mưa	\N	0	RAIN	\N	\N	603641	f	c1c3ff9f-33e2-483d-8a87-e7e3bd4be0a4	vndms.dmc.gov.vn
5396	Thông số đo mưa	\N	0	RAIN	\N	\N	604100	f	e1f9e71b-cc9a-4336-b124-d87c92ab3f37	vndms.dmc.gov.vn
5397	Thông số đo mưa	\N	0	RAIN	\N	\N	607649	f	a1b14eb8-70d6-4793-a57e-b9a1c7d1f7f5	vndms.dmc.gov.vn
5398	Thông số đo mưa	\N	0	RAIN	\N	\N	608315	f	0afae753-52e8-4671-bbe4-5fb136723a9d	vndms.dmc.gov.vn
5399	Thông số đo mưa	\N	0	RAIN	\N	\N	608337	f	a2c81209-3bc5-413d-86cc-16780e00963e	vndms.dmc.gov.vn
5400	Thông số đo mưa	\N	0	RAIN	\N	\N	608407	f	ea58bad8-1a5a-4b09-9919-a3f3ac0f6cd1	vndms.dmc.gov.vn
5401	Thông số đo mưa	\N	0	RAIN	\N	\N	608474	f	e3684c45-00ae-4158-aaf4-6e97a1decdad	vndms.dmc.gov.vn
5402	Thông số đo mưa	\N	0	RAIN	\N	\N	608544	f	0ab0ab9c-79e8-47f6-ba7e-94f1a13dafa1	vndms.dmc.gov.vn
5403	Thông số đo mưa	\N	0	RAIN	\N	\N	608925	f	47d23531-ba7e-4327-83c6-fbc10d25a9b6	vndms.dmc.gov.vn
5404	Thông số đo mưa	\N	0	RAIN	\N	\N	609401	f	fc89bbff-6c29-488f-8deb-1414df1aacd7	vndms.dmc.gov.vn
5405	Thông số đo mưa	\N	0	RAIN	\N	\N	611821	f	5a8a543d-8db7-46ef-a66e-79a76677ee94	vndms.dmc.gov.vn
5406	Thông số đo mưa	\N	0	RAIN	\N	\N	612303	f	59f6fd79-910c-4364-93cc-a7538aef96a5	vndms.dmc.gov.vn
5407	Thông số đo mưa	\N	0	RAIN	\N	\N	613430	f	9c6e0b33-9346-4aa7-b1d3-b499a5fceb3f	vndms.dmc.gov.vn
5408	Thông số đo mưa	\N	0	RAIN	\N	\N	613990	f	0b79e945-ba3d-4d33-bf93-6f1ac798825c	vndms.dmc.gov.vn
5409	Thông số đo mưa	\N	0	RAIN	\N	\N	614133	f	dda0e533-c890-4145-be09-0b6d257f656b	vndms.dmc.gov.vn
5410	Thông số đo mưa	\N	0	RAIN	\N	\N	617877	f	c91ca6e2-dcd7-4ee1-915f-426982051940	vndms.dmc.gov.vn
5411	Thông số đo mưa	\N	0	RAIN	\N	\N	618012	f	3570641c-dfdc-4faf-8646-32a7a05ccc2a	vndms.dmc.gov.vn
5412	Thông số đo mưa	\N	0	RAIN	\N	\N	618900	f	4dd86e39-d221-4bdb-9c75-e8424661c21d	vndms.dmc.gov.vn
5413	Thông số đo mưa	\N	0	RAIN	\N	\N	620201	f	7001891c-4bb8-454b-8bc5-67b568e66dc2	vndms.dmc.gov.vn
5414	Thông số đo mưa	\N	0	RAIN	\N	\N	621756	f	2e6cdf9f-6f6f-44b3-85e8-0ab81055d1f8	vndms.dmc.gov.vn
5415	Thông số đo mưa	\N	0	RAIN	\N	\N	622713	f	f69082e6-e6ce-4ac1-b7ab-14fcef5bc08b	vndms.dmc.gov.vn
5416	Thông số đo mưa	\N	0	RAIN	\N	\N	623530	f	ab862caa-8531-4eee-9e99-4bdcaf5efbc8	vndms.dmc.gov.vn
5417	Thông số đo mưa	\N	0	RAIN	\N	\N	625170	f	66fc3e50-419a-4242-ae31-bc97e37e89be	vndms.dmc.gov.vn
5418	Thông số đo mưa	\N	0	RAIN	\N	\N	625783	f	32bb1309-62ee-4efb-9bbd-9fd991b9ee79	vndms.dmc.gov.vn
5419	Thông số đo mưa	\N	0	RAIN	\N	\N	625960	f	2630fdf8-c055-4768-b3d1-51d4fd204bdd	vndms.dmc.gov.vn
5420	Thông số đo mưa	\N	0	RAIN	\N	\N	626493	f	3bea30bc-45e7-418b-b816-e7f5de8c06d2	vndms.dmc.gov.vn
5421	Thông số đo mưa	\N	0	RAIN	\N	\N	627082	f	8a9e9ded-b50d-4fb5-9c16-f17314465804	vndms.dmc.gov.vn
5422	Thông số đo mưa	\N	0	RAIN	\N	\N	627261	f	b36a704e-a50d-4dea-a1c4-2cff803c77d8	vndms.dmc.gov.vn
5423	Thông số đo mưa	\N	0	RAIN	\N	\N	627440	f	0309e76f-a4f7-4d0e-91c8-a4e800b39a37	vndms.dmc.gov.vn
5424	Thông số đo mưa	\N	0	RAIN	\N	\N	627809	f	2ab1fb40-2124-4a0b-a4aa-0e0538501a87	vndms.dmc.gov.vn
5425	Thông số đo mưa	\N	0	RAIN	\N	\N	627820	f	25eccc08-0337-473e-a9dd-a80911717529	vndms.dmc.gov.vn
5426	Thông số đo mưa	\N	0	RAIN	\N	\N	62943	f	b29f2464-3dbd-4a01-92ad-e21d395d3370	vndms.dmc.gov.vn
5427	Thông số đo mưa	\N	0	RAIN	\N	\N	630002	f	87af6438-b555-4cd3-a869-c15d2880cfc0	vndms.dmc.gov.vn
5428	Thông số đo mưa	\N	0	RAIN	\N	\N	630250	f	24e84b94-8fba-4b91-9f3a-43f26100d904	vndms.dmc.gov.vn
5429	Thông số đo mưa	\N	0	RAIN	\N	\N	631423	f	94ed9c5b-9d41-45a6-a2fa-424081d7bc41	vndms.dmc.gov.vn
5430	Thông số đo mưa	\N	0	RAIN	\N	\N	631823	f	89106a3b-5642-4ce6-9284-df5399704d03	vndms.dmc.gov.vn
5431	Thông số đo mưa	\N	0	RAIN	\N	\N	633427	f	3c4809a1-99ff-47dd-8b77-ba8a5df47c59	vndms.dmc.gov.vn
5432	Thông số đo mưa	\N	0	RAIN	\N	\N	634150	f	c9741526-b255-4b98-bf4f-672dd0926cf6	vndms.dmc.gov.vn
5433	Thông số đo mưa	\N	0	RAIN	\N	\N	634740	f	354364e3-e501-4fa5-87d4-40ea1d65679c	vndms.dmc.gov.vn
5434	Thông số đo mưa	\N	0	RAIN	\N	\N	635347	f	6bc5d5db-d289-420d-b836-3b172c51ed87	vndms.dmc.gov.vn
5435	Thông số đo mưa	\N	0	RAIN	\N	\N	635418	f	084f1345-f9e1-4e9a-b789-2644ee76065e	vndms.dmc.gov.vn
5436	Thông số đo mưa	\N	0	RAIN	\N	\N	637176	f	f452b217-bd52-4a01-8028-7d320c61d155	vndms.dmc.gov.vn
5437	Thông số đo mưa	\N	0	RAIN	\N	\N	637502	f	056da3c6-90cc-4c98-a940-8b97f451afd2	vndms.dmc.gov.vn
5438	Thông số đo mưa	\N	0	RAIN	\N	\N	638578	f	9aa43e8c-980c-4880-80da-15ecf1bded87	vndms.dmc.gov.vn
5439	Thông số đo mưa	\N	0	RAIN	\N	\N	639801	f	09c82c55-625b-4a80-95fd-b31bcb1fb017	vndms.dmc.gov.vn
5440	Thông số đo mưa	\N	0	RAIN	\N	\N	641153	f	bb7f7148-6f54-49b1-ae19-9b02b3ebd45b	vndms.dmc.gov.vn
5441	Thông số đo mưa	\N	0	RAIN	\N	\N	641728	f	6cc4d5f2-145d-4ac0-91ad-eee3f551a6c2	vndms.dmc.gov.vn
5442	Thông số đo mưa	\N	0	RAIN	\N	\N	641757	f	b20ed949-6cc6-4fd7-b9ea-52448b4ec4c0	vndms.dmc.gov.vn
5443	Thông số đo mưa	\N	0	RAIN	\N	\N	642145	f	a98c8331-f84a-44c2-805c-503b73150408	vndms.dmc.gov.vn
5444	Thông số đo mưa	\N	0	RAIN	\N	\N	642513	f	dbab17f2-d519-438c-915d-8e187e1571ff	vndms.dmc.gov.vn
5445	Thông số đo mưa	\N	0	RAIN	\N	\N	642574	f	4ec32b15-f96c-4234-a45f-5a1d3fb43433	vndms.dmc.gov.vn
5446	Thông số đo mưa	\N	0	RAIN	\N	\N	643529	f	80aaab32-011e-4c6a-a45a-24abc2978f83	vndms.dmc.gov.vn
5447	Thông số đo mưa	\N	0	RAIN	\N	\N	64394	f	db8c93b3-f231-4872-82fb-f89fc41dbdcc	vndms.dmc.gov.vn
5448	Thông số đo mưa	\N	0	RAIN	\N	\N	64471	f	78f2d614-0db2-44ad-8e76-63a280d48fa2	vndms.dmc.gov.vn
5449	Thông số đo mưa	\N	0	RAIN	\N	\N	644975	f	61dd03af-7690-447c-ad0f-f527d39c8db4	vndms.dmc.gov.vn
5450	Thông số đo mưa	\N	0	RAIN	\N	\N	645801	f	ef770f71-511f-400e-b628-22af0e04e69e	vndms.dmc.gov.vn
5451	Thông số đo mưa	\N	0	RAIN	\N	\N	646653	f	8425cca8-4bd4-4753-972d-891fe6b88b92	vndms.dmc.gov.vn
5452	Thông số đo mưa	\N	0	RAIN	\N	\N	646676	f	805035a1-0d71-4bfe-a8c5-8329b56ce582	vndms.dmc.gov.vn
5453	Thông số đo mưa	\N	0	RAIN	\N	\N	64767	f	3c2affc5-61d3-40d2-b192-3812137ba2ea	vndms.dmc.gov.vn
5454	Thông số đo mưa	\N	0	RAIN	\N	\N	648621	f	4e3631c4-d137-447b-9d78-64d19e1767a4	vndms.dmc.gov.vn
5455	Thông số đo mưa	\N	0	RAIN	\N	\N	649522	f	32c0f602-f578-4fa3-b62b-dc7b9c8dafb9	vndms.dmc.gov.vn
5456	Thông số đo mưa	\N	0	RAIN	\N	\N	650001	f	f3509cc2-ea71-4b60-83ed-e6b459a15165	vndms.dmc.gov.vn
5457	Thông số đo mưa	\N	0	RAIN	\N	\N	650002	f	0a87a9b5-56d2-46f9-b060-9a668135539d	vndms.dmc.gov.vn
5458	Thông số đo mưa	\N	0	RAIN	\N	\N	650003	f	c96523de-63c4-4abe-8d53-c32df7df42ed	vndms.dmc.gov.vn
5459	Thông số đo mưa	\N	0	RAIN	\N	\N	650004	f	f2a924bc-c5c1-4620-b34d-7d3e44685d0c	vndms.dmc.gov.vn
5460	Thông số đo mưa	\N	0	RAIN	\N	\N	650005	f	648487c6-a9e8-4a3a-b00d-fa9379675ba5	vndms.dmc.gov.vn
5461	Thông số đo mưa	\N	0	RAIN	\N	\N	650006	f	10103aee-1e22-43bd-8052-e9e6bb4b2c17	vndms.dmc.gov.vn
5462	Thông số đo mưa	\N	0	RAIN	\N	\N	650007	f	9d080f1a-d442-460c-a885-6b189e475762	vndms.dmc.gov.vn
5463	Thông số đo mưa	\N	0	RAIN	\N	\N	650008	f	b5f24987-0f98-464c-a1a7-de957b359795	vndms.dmc.gov.vn
5464	Thông số đo mưa	\N	0	RAIN	\N	\N	650009	f	4e0b63bc-52db-4257-8f62-5e642ef2edae	vndms.dmc.gov.vn
5465	Thông số đo mưa	\N	0	RAIN	\N	\N	650010	f	5a7d5724-d6d4-4fd6-ae0e-bfeec94837a1	vndms.dmc.gov.vn
5466	Thông số đo mưa	\N	0	RAIN	\N	\N	650221	f	565f89d3-bb62-4461-b0e9-aecf29d14018	vndms.dmc.gov.vn
5467	Thông số đo mưa	\N	0	RAIN	\N	\N	650664	f	efc6173d-56b6-4038-865a-6f392e494f0a	vndms.dmc.gov.vn
5468	Thông số đo mưa	\N	0	RAIN	\N	\N	650915	f	14a96855-dc3f-44a8-9950-bd5a8ed3ef76	vndms.dmc.gov.vn
5469	Thông số đo mưa	\N	0	RAIN	\N	\N	652713	f	d5b9af26-96df-43a0-8f96-fef8865e9c14	vndms.dmc.gov.vn
5470	Thông số đo mưa	\N	0	RAIN	\N	\N	653380	f	3da32ce0-3457-43f6-a3dd-64c6557f016a	vndms.dmc.gov.vn
5471	Thông số đo mưa	\N	0	RAIN	\N	\N	653845	f	d8a38aba-4dc7-4a18-8a55-a89c70341b7a	vndms.dmc.gov.vn
5472	Thông số đo mưa	\N	0	RAIN	\N	\N	655853	f	db2fe584-1901-46b3-986e-5737cb9f5a9d	vndms.dmc.gov.vn
5473	Thông số đo mưa	\N	0	RAIN	\N	\N	656749	f	11f27f6a-dd5b-497e-8bda-dc621712dca2	vndms.dmc.gov.vn
5474	Thông số đo mưa	\N	0	RAIN	\N	\N	657263	f	29ceead3-e06e-470c-9016-274f277425f0	vndms.dmc.gov.vn
5475	Thông số đo mưa	\N	0	RAIN	\N	\N	657326	f	bd7bb8ae-8512-4c6c-be7b-c0d558d0e23f	vndms.dmc.gov.vn
5476	Thông số đo mưa	\N	0	RAIN	\N	\N	658771	f	9d679f92-86a3-42cd-a406-f3964a6a6fb9	vndms.dmc.gov.vn
5477	Thông số đo mưa	\N	0	RAIN	\N	\N	661492	f	7e7fe0d4-3594-4cea-8a6c-341171d28359	vndms.dmc.gov.vn
5478	Thông số đo mưa	\N	0	RAIN	\N	\N	661895	f	41e08668-dc2b-4122-905e-4c72061d51e2	vndms.dmc.gov.vn
5479	Thông số đo mưa	\N	0	RAIN	\N	\N	663860	f	b5da4ee0-e291-417f-9a4e-60c0fbc763da	vndms.dmc.gov.vn
5480	Thông số đo mưa	\N	0	RAIN	\N	\N	664182	f	bfe1f2e5-4db3-4c43-ae91-fe9b1a926758	vndms.dmc.gov.vn
5481	Thông số đo mưa	\N	0	RAIN	\N	\N	664538	f	b3931e03-cb40-4870-b145-929b2d057fce	vndms.dmc.gov.vn
5482	Thông số đo mưa	\N	0	RAIN	\N	\N	664873	f	5909000c-e336-43cd-8299-6b946ac7b971	vndms.dmc.gov.vn
5483	Thông số đo mưa	\N	0	RAIN	\N	\N	665264	f	cdd4afc2-fc87-4952-bb0f-f3db48778cf1	vndms.dmc.gov.vn
5484	Thông số đo mưa	\N	0	RAIN	\N	\N	665485	f	eea9ddf5-0931-4da6-89bf-3c7489571c8a	vndms.dmc.gov.vn
5485	Thông số đo mưa	\N	0	RAIN	\N	\N	667423	f	dd8c830b-d9e3-4b44-b3af-9d483324c719	vndms.dmc.gov.vn
5486	Thông số đo mưa	\N	0	RAIN	\N	\N	66770	f	d59fe645-76ba-4f29-9b81-9a8def45807d	vndms.dmc.gov.vn
5487	Thông số đo mưa	\N	0	RAIN	\N	\N	66776	f	ade8c731-6e78-4c90-8184-47a0bebb08ae	vndms.dmc.gov.vn
5488	Thông số đo mưa	\N	0	RAIN	\N	\N	66781	f	f3850c90-e0fd-4f74-b3f0-6e6ceff4c938	vndms.dmc.gov.vn
5489	Thông số đo mưa	\N	0	RAIN	\N	\N	66782	f	e8697902-e2c2-491c-ab60-5b9cba1dbdc9	vndms.dmc.gov.vn
5490	Thông số đo mưa	\N	0	RAIN	\N	\N	66791 	f	56b01f60-2c69-4e4a-9437-44a24e598d70	vndms.dmc.gov.vn
5491	Thông số đo mưa	\N	0	RAIN	\N	\N	66796 	f	afe830bf-6730-4f01-a2ac-a6d69aad4030	vndms.dmc.gov.vn
5492	Thông số đo mưa	\N	0	RAIN	\N	\N	668617	f	da4c46bc-470b-4b1e-bc78-6219903e5e4f	vndms.dmc.gov.vn
5493	Thông số đo mưa	\N	0	RAIN	\N	\N	670001	f	8434d7ba-d457-408b-a80a-3fa612543612	vndms.dmc.gov.vn
5494	Thông số đo mưa	\N	0	RAIN	\N	\N	670002	f	bf986cfc-fcac-4862-8230-75e4f37235dd	vndms.dmc.gov.vn
5495	Thông số đo mưa	\N	0	RAIN	\N	\N	670003	f	baecef75-d9f3-4f72-80b7-e25d84292695	vndms.dmc.gov.vn
5496	Thông số đo mưa	\N	0	RAIN	\N	\N	670004	f	5ef93c5b-72db-446e-8534-8dca8f81f54c	vndms.dmc.gov.vn
5497	Thông số đo mưa	\N	0	RAIN	\N	\N	670005	f	e551317b-fdc9-44a8-a096-9e5287c329a8	vndms.dmc.gov.vn
5498	Thông số đo mưa	\N	0	RAIN	\N	\N	670006	f	1c9ac939-fbf3-45c5-9a93-078032a17e41	vndms.dmc.gov.vn
5499	Thông số đo mưa	\N	0	RAIN	\N	\N	670007	f	6681fc47-6e9c-4b27-8d12-3d4371edd3aa	vndms.dmc.gov.vn
5500	Thông số đo mưa	\N	0	RAIN	\N	\N	670008	f	2d3015af-63e4-4204-997e-8607b14fcb65	vndms.dmc.gov.vn
5501	Thông số đo mưa	\N	0	RAIN	\N	\N	670009	f	b04a16d1-cb12-4b1b-a3fd-7f4ee6b71330	vndms.dmc.gov.vn
5502	Thông số đo mưa	\N	0	RAIN	\N	\N	670010	f	35682fc8-d819-4ff4-b572-8b76cd97661b	vndms.dmc.gov.vn
5503	Thông số đo mưa	\N	0	RAIN	\N	\N	670011	f	4a23fac4-6f11-42f8-a376-60922746d0e9	vndms.dmc.gov.vn
5504	Thông số đo mưa	\N	0	RAIN	\N	\N	670012	f	38d64071-3325-4be0-8f74-a02f7c463a22	vndms.dmc.gov.vn
5505	Thông số đo mưa	\N	0	RAIN	\N	\N	671291	f	887212c1-661d-45af-baa9-8c95554a3049	vndms.dmc.gov.vn
5506	Thông số đo mưa	\N	0	RAIN	\N	\N	673310	f	6626d8a7-338d-45e0-b3ac-c308b3b6ef7b	vndms.dmc.gov.vn
5507	Thông số đo mưa	\N	0	RAIN	\N	\N	673629	f	81c119ae-3ef0-4407-93e3-644af0edf5d3	vndms.dmc.gov.vn
5508	Thông số đo mưa	\N	0	RAIN	\N	\N	675219	f	ba2c3d2c-dd79-4d14-9d2d-c07543684a41	vndms.dmc.gov.vn
5509	Thông số đo mưa	\N	0	RAIN	\N	\N	675344	f	c5e857a9-b56e-4b01-bc28-e2777c660848	vndms.dmc.gov.vn
5510	Thông số đo mưa	\N	0	RAIN	\N	\N	676454	f	8dee795b-47d7-4e0c-82a9-7f318866152f	vndms.dmc.gov.vn
5511	Thông số đo mưa	\N	0	RAIN	\N	\N	677126	f	70cb3bc1-45b3-4a2f-a83c-a4866d8c6722	vndms.dmc.gov.vn
5512	Thông số đo mưa	\N	0	RAIN	\N	\N	677435	f	66462e62-d81f-4b82-8375-cd5f56d5a396	vndms.dmc.gov.vn
5513	Thông số đo mưa	\N	0	RAIN	\N	\N	677493	f	e26074a3-3c0c-40c9-8edd-97b0b8e72fb3	vndms.dmc.gov.vn
5514	Thông số đo mưa	\N	0	RAIN	\N	\N	677832	f	9dff2f22-eb6c-4af0-8339-5e4beaf6a583	vndms.dmc.gov.vn
5515	Thông số đo mưa	\N	0	RAIN	\N	\N	677851	f	5e8edc35-00c2-4cb3-8fe7-cfb9d3d5d67b	vndms.dmc.gov.vn
5516	Thông số đo mưa	\N	0	RAIN	\N	\N	678451	f	9239e35d-4a7f-4e3d-add8-b42bbc4a489c	vndms.dmc.gov.vn
5517	Thông số đo mưa	\N	0	RAIN	\N	\N	678628	f	29dd3419-3004-4d41-997a-e4b3bad9119f	vndms.dmc.gov.vn
5518	Thông số đo mưa	\N	0	RAIN	\N	\N	679192	f	f4ad5cdc-a818-4807-8a10-e8713171360e	vndms.dmc.gov.vn
5519	Thông số đo mưa	\N	0	RAIN	\N	\N	680001	f	677c8c8a-471e-45ad-89cf-651cdf08fe19	vndms.dmc.gov.vn
5520	Thông số đo mưa	\N	0	RAIN	\N	\N	680002	f	70c2e83d-21d9-4b48-90a9-809bd3f0da61	vndms.dmc.gov.vn
5521	Thông số đo mưa	\N	0	RAIN	\N	\N	680003	f	afe56091-7ad2-4726-8543-32f38bcb4578	vndms.dmc.gov.vn
5522	Thông số đo mưa	\N	0	RAIN	\N	\N	680004	f	770b3e0f-5f2a-415e-ae90-7abb8d58f645	vndms.dmc.gov.vn
5523	Thông số đo mưa	\N	0	RAIN	\N	\N	680005	f	7ac65a15-ea31-4461-a0c3-93c01410e6f0	vndms.dmc.gov.vn
5524	Thông số đo mưa	\N	0	RAIN	\N	\N	680782	f	d71c3f36-de95-4813-ab18-12b2f9d7bc51	vndms.dmc.gov.vn
5525	Thông số đo mưa	\N	0	RAIN	\N	\N	681524	f	30b7412c-5912-4b1f-a34d-88973b1b12d3	vndms.dmc.gov.vn
5526	Thông số đo mưa	\N	0	RAIN	\N	\N	682554	f	08e5a1f3-24bd-4a2b-9e23-998887e15175	vndms.dmc.gov.vn
5527	Thông số đo mưa	\N	0	RAIN	\N	\N	682816	f	4ea2d050-7704-4083-b1c7-0503ba889376	vndms.dmc.gov.vn
5528	Thông số đo mưa	\N	0	RAIN	\N	\N	684706	f	98cef94c-1c70-4b45-8a58-74d6ce088439	vndms.dmc.gov.vn
5529	Thông số đo mưa	\N	0	RAIN	\N	\N	690001	f	4669aab1-7c5f-4ee3-9685-484d61513321	vndms.dmc.gov.vn
5530	Thông số đo mưa	\N	0	RAIN	\N	\N	690002	f	d481d233-c2fc-4af2-a2ec-16735dfabbcc	vndms.dmc.gov.vn
5531	Thông số đo mưa	\N	0	RAIN	\N	\N	690003	f	fe7d87fa-9d92-41d7-8c2f-b6fcc8e26289	vndms.dmc.gov.vn
5532	Thông số đo mưa	\N	0	RAIN	\N	\N	690004	f	f6dfcc3b-5b63-4b36-8630-e0fa91c7af60	vndms.dmc.gov.vn
5533	Thông số đo mưa	\N	0	RAIN	\N	\N	690005	f	75c079c1-ee98-482f-a88f-76d1bab197a2	vndms.dmc.gov.vn
5534	Thông số đo mưa	\N	0	RAIN	\N	\N	690006	f	f2dc5a32-09c4-430a-a1cf-e32e9aab73cb	vndms.dmc.gov.vn
5535	Thông số đo mưa	\N	0	RAIN	\N	\N	690007	f	d7add2b9-e5ad-4dee-bc70-d6f00ce5a717	vndms.dmc.gov.vn
5536	Thông số đo mưa	\N	0	RAIN	\N	\N	690008	f	adc7d5a3-60d7-494f-9f76-7447d32043dc	vndms.dmc.gov.vn
5537	Thông số đo mưa	\N	0	RAIN	\N	\N	690009	f	f25ace90-965e-4bcb-b0c5-2afc0029f282	vndms.dmc.gov.vn
5538	Thông số đo mưa	\N	0	RAIN	\N	\N	690010	f	90db192e-1ea3-405a-9304-fe136bdaa849	vndms.dmc.gov.vn
5539	Thông số đo mưa	\N	0	RAIN	\N	\N	690011	f	f261b1f4-f58e-416b-8988-7c89de373157	vndms.dmc.gov.vn
5540	Thông số đo mưa	\N	0	RAIN	\N	\N	690012	f	f01d0d72-c35d-48bf-a42d-6281e5f19b28	vndms.dmc.gov.vn
5541	Thông số đo mưa	\N	0	RAIN	\N	\N	690013	f	4ba77a17-cde1-4c25-ae03-ccbfc55956e3	vndms.dmc.gov.vn
5542	Thông số đo mưa	\N	0	RAIN	\N	\N	690014	f	cc72a0d3-a711-4509-954a-a08b69e75e55	vndms.dmc.gov.vn
5543	Thông số đo mưa	\N	0	RAIN	\N	\N	690015	f	38800ded-45fe-4a99-9fc9-aff50df3994e	vndms.dmc.gov.vn
5544	Thông số đo mưa	\N	0	RAIN	\N	\N	690016	f	57e04ecb-fc15-458f-a1dc-42bfcaccdcd2	vndms.dmc.gov.vn
5545	Thông số đo mưa	\N	0	RAIN	\N	\N	690017	f	61adb0d5-34f4-4837-87de-f49556dbbac7	vndms.dmc.gov.vn
5546	Thông số đo mưa	\N	0	RAIN	\N	\N	690018	f	53a23dc1-5374-4187-aeb7-f45e1edff6bd	vndms.dmc.gov.vn
5547	Thông số đo mưa	\N	0	RAIN	\N	\N	690019	f	37c5c79c-2652-4524-b39f-308a64e6afa0	vndms.dmc.gov.vn
5548	Thông số đo mưa	\N	0	RAIN	\N	\N	690020	f	8a1a4bbe-71a2-46c5-aac4-75f7689a7215	vndms.dmc.gov.vn
5549	Thông số đo mưa	\N	0	RAIN	\N	\N	691062	f	a3f91daa-d083-4486-876c-c506870a4f2e	vndms.dmc.gov.vn
5550	Thông số đo mưa	\N	0	RAIN	\N	\N	692253	f	f7813e58-4155-42f4-b5f7-fb3a621cd5d9	vndms.dmc.gov.vn
5551	Thông số đo mưa	\N	0	RAIN	\N	\N	692471	f	04293526-6d15-4f5b-9c9e-082435803ee8	vndms.dmc.gov.vn
5552	Thông số đo mưa	\N	0	RAIN	\N	\N	694034	f	fac9b630-f911-4135-ac47-b3f4eb3f47bd	vndms.dmc.gov.vn
5553	Thông số đo mưa	\N	0	RAIN	\N	\N	694570	f	ded365dc-6349-435d-9fae-4e2492e2c630	vndms.dmc.gov.vn
5554	Thông số đo mưa	\N	0	RAIN	\N	\N	695535	f	8fd231a5-7a56-4c57-b9fc-d0c34267a7f3	vndms.dmc.gov.vn
5555	Thông số đo mưa	\N	0	RAIN	\N	\N	695840	f	5d154616-53f7-4a57-aacc-a938420220bf	vndms.dmc.gov.vn
5556	Thông số đo mưa	\N	0	RAIN	\N	\N	69700 	f	34ee7a6f-d6d8-4ba1-b358-2674b26c35f8	vndms.dmc.gov.vn
5557	Thông số đo mưa	\N	0	RAIN	\N	\N	69702	f	cd5dc18c-9369-410a-bd12-f094e9bcb3fb	vndms.dmc.gov.vn
5558	Thông số đo mưa	\N	0	RAIN	\N	\N	69704	f	a6671dcc-4757-496a-a9a8-67f7c4e733e0	vndms.dmc.gov.vn
5559	Thông số đo mưa	\N	0	RAIN	\N	\N	69717	f	c3aa675e-e720-4fa5-82cf-373107a012c8	vndms.dmc.gov.vn
5560	Thông số đo mưa	\N	0	RAIN	\N	\N	69722	f	5f39d050-2fab-4f65-8782-17737a3e6ebf	vndms.dmc.gov.vn
5561	Thông số đo mưa	\N	0	RAIN	\N	\N	700672	f	c22a3f1d-df1f-44a5-bc02-db687037d3ce	vndms.dmc.gov.vn
5562	Thông số đo mưa	\N	0	RAIN	\N	\N	703323	f	e04d7b69-e95b-45fc-912b-3c50d0a35a05	vndms.dmc.gov.vn
5563	Thông số đo mưa	\N	0	RAIN	\N	\N	704132	f	956fd1be-8b9d-46eb-af91-58484a68c5fc	vndms.dmc.gov.vn
5564	Thông số đo mưa	\N	0	RAIN	\N	\N	705024	f	74bad479-b051-4bc7-978f-9c1bae26bb16	vndms.dmc.gov.vn
5565	Thông số đo mưa	\N	0	RAIN	\N	\N	708434	f	0fb3f5af-860d-4541-b9ae-51557ac33696	vndms.dmc.gov.vn
5566	Thông số đo mưa	\N	0	RAIN	\N	\N	709021	f	6c99f499-9257-4921-8cb0-d18ecb19c2a6	vndms.dmc.gov.vn
5567	Thông số đo mưa	\N	0	RAIN	\N	\N	709838	f	5ee0f26b-8852-494c-b9e6-04a4c0df0df3	vndms.dmc.gov.vn
5568	Thông số đo mưa	\N	0	RAIN	\N	\N	710001	f	383f58be-1e6f-4ab5-8fcf-ac75d00a8642	vndms.dmc.gov.vn
5569	Thông số đo mưa	\N	0	RAIN	\N	\N	710002	f	14755f7f-00f4-461b-87c3-8c65ef57c71b	vndms.dmc.gov.vn
5570	Thông số đo mưa	\N	0	RAIN	\N	\N	710003	f	91c4a08e-854e-41db-8f43-3f54373fad1f	vndms.dmc.gov.vn
5571	Thông số đo mưa	\N	0	RAIN	\N	\N	710004	f	557fb2d9-c884-4da3-9038-142de8cd122f	vndms.dmc.gov.vn
5572	Thông số đo mưa	\N	0	RAIN	\N	\N	710005	f	84454335-1d5b-44ac-aef8-3b87e4fe1f36	vndms.dmc.gov.vn
5573	Thông số đo mưa	\N	0	RAIN	\N	\N	711805	f	1e3c1066-af07-4471-9711-de2c48d9de54	vndms.dmc.gov.vn
5574	Thông số đo mưa	\N	0	RAIN	\N	\N	714543	f	5b17e188-c32a-46cc-971b-caa027e4247c	vndms.dmc.gov.vn
5575	Thông số đo mưa	\N	0	RAIN	\N	\N	71506	f	284c96fe-578b-4bbd-b96e-bd0c31ec594e	vndms.dmc.gov.vn
5576	Thông số đo mưa	\N	0	RAIN	\N	\N	71512	f	e2462656-a10a-4381-a3d3-f071dbfe2673	vndms.dmc.gov.vn
5577	Thông số đo mưa	\N	0	RAIN	\N	\N	71515	f	18dd10c5-0207-449b-9938-d92407b8c483	vndms.dmc.gov.vn
5578	Thông số đo mưa	\N	0	RAIN	\N	\N	71519	f	6b6f82f8-6e88-43e1-b3c0-69628823fb76	vndms.dmc.gov.vn
5579	Thông số đo mưa	\N	0	RAIN	\N	\N	71526	f	e2c3288b-fa9e-4d7e-8653-0a992a6f86d5	vndms.dmc.gov.vn
5580	Thông số đo mưa	\N	0	RAIN	\N	\N	71529	f	96c22c21-26a0-4705-beb8-e67bca82e8a4	vndms.dmc.gov.vn
5581	Thông số đo mưa	\N	0	RAIN	\N	\N	71531	f	051edc24-ae16-424e-a0b7-9e1e0da65dd6	vndms.dmc.gov.vn
5582	Thông số đo mưa	\N	0	RAIN	\N	\N	71539	f	a362b7de-7d26-4c99-bfbf-113da7dc8b94	vndms.dmc.gov.vn
5583	Thông số đo mưa	\N	0	RAIN	\N	\N	71542	f	92ae59cc-79db-4b4c-98f4-51cb1c1d71df	vndms.dmc.gov.vn
5584	Thông số đo mưa	\N	0	RAIN	\N	\N	71545	f	f8463c86-5c46-4ed1-88ea-b86184e274a1	vndms.dmc.gov.vn
5585	Thông số đo mưa	\N	0	RAIN	\N	\N	71547	f	33c6b57f-a7d1-4671-94fd-0abb8cf7a839	vndms.dmc.gov.vn
5586	Thông số đo mưa	\N	0	RAIN	\N	\N	71549	f	516fc742-498d-4d35-a66b-53933fbd9d4c	vndms.dmc.gov.vn
5587	Thông số đo mưa	\N	0	RAIN	\N	\N	71551 	f	d08bda4b-64ab-4365-bb8b-4f47aceb84e7	vndms.dmc.gov.vn
5588	Thông số đo mưa	\N	0	RAIN	\N	\N	715534	f	48ece4cb-5502-459f-bb39-cc313c89290b	vndms.dmc.gov.vn
5589	Thông số đo mưa	\N	0	RAIN	\N	\N	71557	f	7136cae6-4aa6-4670-89f9-74884c1eb670	vndms.dmc.gov.vn
5590	Thông số đo mưa	\N	0	RAIN	\N	\N	71558	f	7abe6e14-9678-483d-95cb-6d167543a7ff	vndms.dmc.gov.vn
5591	Thông số đo mưa	\N	0	RAIN	\N	\N	71567	f	b548ef26-84cf-4470-8b3f-4e18fdcfaebe	vndms.dmc.gov.vn
5592	Thông số đo mưa	\N	0	RAIN	\N	\N	71572	f	60b0de2b-6342-43bd-9d4e-c2f3ca5e8df0	vndms.dmc.gov.vn
5593	Thông số đo mưa	\N	0	RAIN	\N	\N	71576 	f	ebac5e42-891d-4079-bc54-ce1e0e475d1c	vndms.dmc.gov.vn
5594	Thông số đo mưa	\N	0	RAIN	\N	\N	71577	f	9694434c-770f-4bc0-8f2e-3a75f6d1c7c0	vndms.dmc.gov.vn
5595	Thông số đo mưa	\N	0	RAIN	\N	\N	71587	f	6aa5fa25-52a9-46e5-897e-bdf22430842d	vndms.dmc.gov.vn
5596	Thông số đo mưa	\N	0	RAIN	\N	\N	71594	f	07cf2d54-e7b6-49fa-891d-3e37ec078c03	vndms.dmc.gov.vn
5597	Thông số đo mưa	\N	0	RAIN	\N	\N	71595 	f	c05f8b8a-4134-4be1-a277-84eaa2e6bb5a	vndms.dmc.gov.vn
5598	Thông số đo mưa	\N	0	RAIN	\N	\N	71708	f	c120af41-1e65-47d7-912e-7cf1ab08332f	vndms.dmc.gov.vn
5599	Thông số đo mưa	\N	0	RAIN	\N	\N	71709	f	ddefd341-dcbf-481f-ba80-10e1b84cb6e2	vndms.dmc.gov.vn
5600	Thông số đo mưa	\N	0	RAIN	\N	\N	720001	f	06945264-dc2a-4b99-9dc1-33b0c623f29b	vndms.dmc.gov.vn
5601	Thông số đo mưa	\N	0	RAIN	\N	\N	720002	f	342444f9-8b06-46e7-870f-462fb6db010b	vndms.dmc.gov.vn
5602	Thông số đo mưa	\N	0	RAIN	\N	\N	720003	f	be9916f3-fd91-473e-847f-ed03848471be	vndms.dmc.gov.vn
5603	Thông số đo mưa	\N	0	RAIN	\N	\N	720004	f	a36b6ff0-b452-4b3c-9dfc-f597f7ea955a	vndms.dmc.gov.vn
5604	Thông số đo mưa	\N	0	RAIN	\N	\N	720005	f	cd0e655a-5793-483e-a1a1-6d7f697dbf14	vndms.dmc.gov.vn
5605	Thông số đo mưa	\N	0	RAIN	\N	\N	720006	f	000ac44e-19ae-4094-a036-25438e6811ad	vndms.dmc.gov.vn
5606	Thông số đo mưa	\N	0	RAIN	\N	\N	720007	f	0bd16d34-038e-4401-b367-a177b64747b7	vndms.dmc.gov.vn
5607	Thông số đo mưa	\N	0	RAIN	\N	\N	720008	f	24a14a02-05aa-4c12-a4c6-7403cff68c4d	vndms.dmc.gov.vn
5608	Thông số đo mưa	\N	0	RAIN	\N	\N	720009	f	40e4cbf8-9aa9-4b2f-b9b4-2de36aa6c782	vndms.dmc.gov.vn
5609	Thông số đo mưa	\N	0	RAIN	\N	\N	720010	f	ee48a594-b580-48d8-ab5d-70885b4fac9e	vndms.dmc.gov.vn
5610	Thông số đo mưa	\N	0	RAIN	\N	\N	720011	f	50b258b6-b637-4880-967f-9f1ae95ed825	vndms.dmc.gov.vn
5611	Thông số đo mưa	\N	0	RAIN	\N	\N	720012	f	2f5840e0-bc87-4e6a-a4b5-8891bac8ffff	vndms.dmc.gov.vn
5612	Thông số đo mưa	\N	0	RAIN	\N	\N	720013	f	197154ec-6e4f-4e5d-9f22-fcf17c5933b1	vndms.dmc.gov.vn
5613	Thông số đo mưa	\N	0	RAIN	\N	\N	720014	f	86758c35-3c0f-4a43-8af6-2c4212023d3b	vndms.dmc.gov.vn
5614	Thông số đo mưa	\N	0	RAIN	\N	\N	720015	f	1c2d01d9-8554-40cd-a4b6-304fbd560212	vndms.dmc.gov.vn
5615	Thông số đo mưa	\N	0	RAIN	\N	\N	720016	f	26c594e8-5175-48ed-8f85-aa1e867c7656	vndms.dmc.gov.vn
5616	Thông số đo mưa	\N	0	RAIN	\N	\N	720017	f	b6909742-4cba-4c24-90a8-88e721d1b4a2	vndms.dmc.gov.vn
5617	Thông số đo mưa	\N	0	RAIN	\N	\N	720018	f	45462ef5-5bd0-4905-b023-478c1705742f	vndms.dmc.gov.vn
5618	Thông số đo mưa	\N	0	RAIN	\N	\N	720019	f	ab96573f-562c-4602-94b8-661d4a1aa407	vndms.dmc.gov.vn
5619	Thông số đo mưa	\N	0	RAIN	\N	\N	720020	f	02850604-5bd2-4399-a2d0-d251c8e53fff	vndms.dmc.gov.vn
5620	Thông số đo mưa	\N	0	RAIN	\N	\N	72045	f	7eb77491-c3bf-4d33-babf-0a65b460c57d	vndms.dmc.gov.vn
5621	Thông số đo mưa	\N	0	RAIN	\N	\N	722470	f	192c2c5b-8d8c-4367-a0a1-4b9c17a1c559	vndms.dmc.gov.vn
5622	Thông số đo mưa	\N	0	RAIN	\N	\N	722818	f	a0cdade3-f131-4e8d-b3ef-2be13f76be69	vndms.dmc.gov.vn
5623	Thông số đo mưa	\N	0	RAIN	\N	\N	72403	f	3fbf58f4-351c-4793-b9c7-9b9dafd5dbb8	vndms.dmc.gov.vn
5624	Thông số đo mưa	\N	0	RAIN	\N	\N	72421	f	a2305d92-f7ac-4f80-9d02-562cbb9aa88c	vndms.dmc.gov.vn
5625	Thông số đo mưa	\N	0	RAIN	\N	\N	72422	f	609d82e9-8268-42b8-a6d8-749f6883d8b0	vndms.dmc.gov.vn
5626	Thông số đo mưa	\N	0	RAIN	\N	\N	72423	f	4817295b-6235-4cba-9f27-8b13a3efc6c8	vndms.dmc.gov.vn
5627	Thông số đo mưa	\N	0	RAIN	\N	\N	72425	f	75dab453-0df5-4fc8-b898-d9bbea8e97a2	vndms.dmc.gov.vn
5628	Thông số đo mưa	\N	0	RAIN	\N	\N	72428	f	374b5b42-459b-4644-a6d2-090c0d3ff9cf	vndms.dmc.gov.vn
5629	Thông số đo mưa	\N	0	RAIN	\N	\N	72429	f	1555e12d-0630-4b4c-b30d-8579765b6bfd	vndms.dmc.gov.vn
5630	Thông số đo mưa	\N	0	RAIN	\N	\N	72436	f	46e914d8-6203-471d-8a4f-a6535f272b06	vndms.dmc.gov.vn
5631	Thông số đo mưa	\N	0	RAIN	\N	\N	72442	f	ace29d71-cf60-491a-9cb3-55f83acd977b	vndms.dmc.gov.vn
5632	Thông số đo mưa	\N	0	RAIN	\N	\N	72445	f	9a42779d-ac54-4afb-ad25-6cab362d3fd2	vndms.dmc.gov.vn
5633	Thông số đo mưa	\N	0	RAIN	\N	\N	724832	f	092f1969-7d42-484f-83a9-46eb688249ec	vndms.dmc.gov.vn
5634	Thông số đo mưa	\N	0	RAIN	\N	\N	726865	f	d40d0461-0d6d-4cc6-9908-3b698ff43e29	vndms.dmc.gov.vn
5635	Thông số đo mưa	\N	0	RAIN	\N	\N	729361	f	f1d5173b-d137-4dec-b2c5-6c63c83c32d0	vndms.dmc.gov.vn
5636	Thông số đo mưa	\N	0	RAIN	\N	\N	729806	f	439f117d-73ae-4810-9a3c-49fc15a28dfc	vndms.dmc.gov.vn
5637	Thông số đo mưa	\N	0	RAIN	\N	\N	730001	f	ac5e3357-e3e4-4074-bdde-b7761546722c	vndms.dmc.gov.vn
5638	Thông số đo mưa	\N	0	RAIN	\N	\N	730002	f	167f6025-f176-458a-814a-afa34ae53032	vndms.dmc.gov.vn
5639	Thông số đo mưa	\N	0	RAIN	\N	\N	730003	f	24032912-27d7-4b6e-bc0c-3f911614611c	vndms.dmc.gov.vn
5640	Thông số đo mưa	\N	0	RAIN	\N	\N	730004	f	40aceabd-3a23-448b-b192-e2c33520969a	vndms.dmc.gov.vn
5641	Thông số đo mưa	\N	0	RAIN	\N	\N	730005	f	eb3efaff-a046-49aa-a47d-9dabc0eb2cdd	vndms.dmc.gov.vn
5642	Thông số đo mưa	\N	0	RAIN	\N	\N	730006	f	5ee14a62-b6e6-4444-85c8-9b583869fdcb	vndms.dmc.gov.vn
5643	Thông số đo mưa	\N	0	RAIN	\N	\N	730007	f	7568fa0a-7e40-4d7c-9022-21efe18ebad0	vndms.dmc.gov.vn
5644	Thông số đo mưa	\N	0	RAIN	\N	\N	730008	f	1ff03990-3bd4-417d-bd87-6a7253394b26	vndms.dmc.gov.vn
5645	Thông số đo mưa	\N	0	RAIN	\N	\N	730009	f	5bf27da0-f4f3-4ba0-8d7c-0d5ee3c8682a	vndms.dmc.gov.vn
5646	Thông số đo mưa	\N	0	RAIN	\N	\N	730010	f	97fabe4e-ceb9-41e0-b55d-a0f8c2827521	vndms.dmc.gov.vn
5647	Thông số đo mưa	\N	0	RAIN	\N	\N	730011	f	3f4ae559-53c9-4c57-9bbe-b0f6c56d5ff3	vndms.dmc.gov.vn
5648	Thông số đo mưa	\N	0	RAIN	\N	\N	730012	f	e9c6a9b9-0eeb-4d5f-8ff1-01d3cf4e9bde	vndms.dmc.gov.vn
5649	Thông số đo mưa	\N	0	RAIN	\N	\N	730013	f	589d0e4d-915e-4779-9a9b-3f3c924f31b4	vndms.dmc.gov.vn
5650	Thông số đo mưa	\N	0	RAIN	\N	\N	730014	f	9a43a2b1-c7e3-44f3-a57f-4bdefeed8b39	vndms.dmc.gov.vn
5651	Thông số đo mưa	\N	0	RAIN	\N	\N	730015	f	002b36df-e28f-4f33-b69a-543e541f3e9d	vndms.dmc.gov.vn
5652	Thông số đo mưa	\N	0	RAIN	\N	\N	730016	f	f678bb92-6daa-478c-be4f-85044fc56ff6	vndms.dmc.gov.vn
5653	Thông số đo mưa	\N	0	RAIN	\N	\N	730017	f	2aa36652-c601-4f6a-b25b-fdd63727121b	vndms.dmc.gov.vn
5654	Thông số đo mưa	\N	0	RAIN	\N	\N	730018	f	50975c18-9cdc-4a96-92ff-fa58d7a380d0	vndms.dmc.gov.vn
5655	Thông số đo mưa	\N	0	RAIN	\N	\N	730019	f	059c728f-f34c-48f3-992f-c2183ef7e88d	vndms.dmc.gov.vn
5656	Thông số đo mưa	\N	0	RAIN	\N	\N	730020	f	307273b7-9802-4136-9ae9-0608b3ae1047	vndms.dmc.gov.vn
5657	Thông số đo mưa	\N	0	RAIN	\N	\N	730021	f	6f014d52-ee6c-4f11-ae7c-a835229eff9d	vndms.dmc.gov.vn
5658	Thông số đo mưa	\N	0	RAIN	\N	\N	730022	f	6d74ce43-661b-4d2d-901f-c3047a5b4a34	vndms.dmc.gov.vn
5659	Thông số đo mưa	\N	0	RAIN	\N	\N	730023	f	50ae583e-4ea4-4223-8496-61a55a238d88	vndms.dmc.gov.vn
5660	Thông số đo mưa	\N	0	RAIN	\N	\N	730024	f	660b6c48-7298-479d-a7c8-0b3074178496	vndms.dmc.gov.vn
5661	Thông số đo mưa	\N	0	RAIN	\N	\N	730025	f	5434f6e5-e52f-4d73-92e9-f0de2140778e	vndms.dmc.gov.vn
5662	Thông số đo mưa	\N	0	RAIN	\N	\N	730026	f	9bc1a99c-61bc-4955-a36d-dc8dc5776b85	vndms.dmc.gov.vn
5663	Thông số đo mưa	\N	0	RAIN	\N	\N	730027	f	d188a0dc-6d65-4f90-ad4b-34421e1379c0	vndms.dmc.gov.vn
5664	Thông số đo mưa	\N	0	RAIN	\N	\N	730090	f	06ccd1bd-e7bb-4d0f-8fae-745dcaf0e6df	vndms.dmc.gov.vn
5665	Thông số đo mưa	\N	0	RAIN	\N	\N	73109	f	3f079bf2-b39a-4bfa-9b7a-61c57b69423a	vndms.dmc.gov.vn
5666	Thông số đo mưa	\N	0	RAIN	\N	\N	731750	f	ae6fe61b-b470-44da-9ac9-d3b242e29639	vndms.dmc.gov.vn
5667	Thông số đo mưa	\N	0	RAIN	\N	\N	732267	f	878d8bfe-a34b-4525-a63f-b40a3dc2d97c	vndms.dmc.gov.vn
5668	Thông số đo mưa	\N	0	RAIN	\N	\N	73400	f	969bad45-10b1-4d0d-8156-66343c3863a6	vndms.dmc.gov.vn
5669	Thông số đo mưa	\N	0	RAIN	\N	\N	73401	f	797be1c3-f2e0-417a-baff-de5d6b34e98d	vndms.dmc.gov.vn
5670	Thông số đo mưa	\N	0	RAIN	\N	\N	73402	f	9f40aa4a-1116-40c2-a1a7-73ea97966614	vndms.dmc.gov.vn
5671	Thông số đo mưa	\N	0	RAIN	\N	\N	73405	f	e032cc3d-b554-4361-9eed-b22fb7a5a5c2	vndms.dmc.gov.vn
5672	Thông số đo mưa	\N	0	RAIN	\N	\N	73406	f	8e085f0c-3dc2-4bb4-b76f-0ef5f9d22a1b	vndms.dmc.gov.vn
5673	Thông số đo mưa	\N	0	RAIN	\N	\N	73408	f	11b50549-8d66-45da-9a4a-e8261037c0fb	vndms.dmc.gov.vn
5674	Thông số đo mưa	\N	0	RAIN	\N	\N	73409	f	d2536aef-0fb7-4669-9993-bf815044a9b2	vndms.dmc.gov.vn
5675	Thông số đo mưa	\N	0	RAIN	\N	\N	73411	f	98bf2059-118c-462c-8759-4a2f50a0348f	vndms.dmc.gov.vn
5676	Thông số đo mưa	\N	0	RAIN	\N	\N	73412	f	1db83a55-7bef-4ed4-904b-4fae8e274c1e	vndms.dmc.gov.vn
5677	Thông số đo mưa	\N	0	RAIN	\N	\N	73413	f	4e3e1f9a-84f5-4716-9f1c-a7f6fd9d97ff	vndms.dmc.gov.vn
5678	Thông số đo mưa	\N	0	RAIN	\N	\N	73417	f	6f78cf80-285c-4b30-8bd2-c6b3c7fac746	vndms.dmc.gov.vn
5679	Thông số đo mưa	\N	0	RAIN	\N	\N	737213	f	28125b91-370e-485c-b33e-a887bc4d307a	vndms.dmc.gov.vn
5680	Thông số đo mưa	\N	0	RAIN	\N	\N	739751	f	87158070-fe13-40a3-8b8b-ae74f6b5f4bb	vndms.dmc.gov.vn
5681	Thông số đo mưa	\N	0	RAIN	\N	\N	740/4	f	20b6166d-cb9d-48be-915c-7115047250f2	vndms.dmc.gov.vn
5682	Thông số đo mưa	\N	0	RAIN	\N	\N	740001	f	95230403-ab56-4a25-bdbe-0bdb3f482c2f	vndms.dmc.gov.vn
5683	Thông số đo mưa	\N	0	RAIN	\N	\N	740002	f	b88de632-ad99-4c11-8021-df28736fbf0e	vndms.dmc.gov.vn
5684	Thông số đo mưa	\N	0	RAIN	\N	\N	740003	f	385223ce-5c97-4526-bbac-4e511448bb8f	vndms.dmc.gov.vn
5685	Thông số đo mưa	\N	0	RAIN	\N	\N	740004	f	4988703b-1aba-4c8a-8b0d-4f64261d7323	vndms.dmc.gov.vn
5686	Thông số đo mưa	\N	0	RAIN	\N	\N	740005	f	5288b52c-5471-4c1b-979a-62b7c7ff46a8	vndms.dmc.gov.vn
5687	Thông số đo mưa	\N	0	RAIN	\N	\N	740006	f	5e6b9910-2871-4a64-8a62-4dafe05ccd98	vndms.dmc.gov.vn
5688	Thông số đo mưa	\N	0	RAIN	\N	\N	740011	f	3b9c8b79-b976-4ae9-be01-f20b8bc4b94b	vndms.dmc.gov.vn
5689	Thông số đo mưa	\N	0	RAIN	\N	\N	740012	f	287455ba-391b-41d4-8c0b-b801f94dc403	vndms.dmc.gov.vn
5690	Thông số đo mưa	\N	0	RAIN	\N	\N	740013	f	036d794a-ce56-4d1b-8b34-0ab7c128cd87	vndms.dmc.gov.vn
5691	Thông số đo mưa	\N	0	RAIN	\N	\N	740014	f	779a3cc8-ec48-4a0e-a64f-8201e0c2c080	vndms.dmc.gov.vn
5692	Thông số đo mưa	\N	0	RAIN	\N	\N	740015	f	fdd2d71b-eec9-4ff3-b1e6-afabbd046467	vndms.dmc.gov.vn
5693	Thông số đo mưa	\N	0	RAIN	\N	\N	740016	f	343c143f-a9fb-4d5c-85d2-c0f459565ca3	vndms.dmc.gov.vn
5694	Thông số đo mưa	\N	0	RAIN	\N	\N	740017	f	7f3ee4e7-b356-4cca-9e41-c52f0bf4d70d	vndms.dmc.gov.vn
5695	Thông số đo mưa	\N	0	RAIN	\N	\N	740018	f	35f5a414-b041-49fb-a098-12e7dceb9ada	vndms.dmc.gov.vn
5696	Thông số đo mưa	\N	0	RAIN	\N	\N	740019	f	c4207eb1-80d2-4943-a110-e993efc615ba	vndms.dmc.gov.vn
5697	Thông số đo mưa	\N	0	RAIN	\N	\N	740020	f	59d7a807-4b9d-4bb9-bbf7-0f153c664799	vndms.dmc.gov.vn
5698	Thông số đo mưa	\N	0	RAIN	\N	\N	740021	f	97cb79e5-5e1c-4bab-b718-a855328d6402	vndms.dmc.gov.vn
5699	Thông số đo mưa	\N	0	RAIN	\N	\N	74003	f	d5778823-6067-4462-bf8e-85cf0d09fe1c	vndms.dmc.gov.vn
5700	Thông số đo mưa	\N	0	RAIN	\N	\N	74034	f	077e757b-5046-4614-bc71-ecd0db3e8b89	vndms.dmc.gov.vn
5701	Thông số đo mưa	\N	0	RAIN	\N	\N	74101	f	e36c1e76-785b-4649-bf3d-c2aeb61bb1d1	vndms.dmc.gov.vn
5702	Thông số đo mưa	\N	0	RAIN	\N	\N	74102	f	ed3ef640-89c7-4e45-8bea-393373c796c9	vndms.dmc.gov.vn
5703	Thông số đo mưa	\N	0	RAIN	\N	\N	74104	f	2f40a54c-6099-4ca3-93a5-edfa279fdc4d	vndms.dmc.gov.vn
5704	Thông số đo mưa	\N	0	RAIN	\N	\N	74106	f	0cab9512-db99-4972-8bc3-084d8ecfb515	vndms.dmc.gov.vn
5705	Thông số đo mưa	\N	0	RAIN	\N	\N	74108	f	05f4dba6-d853-440a-8357-3c2ec819ef52	vndms.dmc.gov.vn
5706	Thông số đo mưa	\N	0	RAIN	\N	\N	74110	f	08877ac4-2a96-40f4-a371-07c856e98c82	vndms.dmc.gov.vn
5707	Thông số đo mưa	\N	0	RAIN	\N	\N	74114	f	cd4d3946-0eda-4d03-bfae-dc709269ca52	vndms.dmc.gov.vn
5708	Thông số đo mưa	\N	0	RAIN	\N	\N	74115	f	791f0614-280e-401a-b626-a4c0dce43ec5	vndms.dmc.gov.vn
5709	Thông số đo mưa	\N	0	RAIN	\N	\N	74116 	f	597a01a1-a392-4b31-b175-53ac0e45c23d	vndms.dmc.gov.vn
5710	Thông số đo mưa	\N	0	RAIN	\N	\N	74119	f	0e068fc7-4da6-4259-be50-6301b4b0f918	vndms.dmc.gov.vn
5711	Thông số đo mưa	\N	0	RAIN	\N	\N	741203	f	b119ecb8-7199-4e5f-a6c5-4e6996a5f226	vndms.dmc.gov.vn
5712	Thông số đo mưa	\N	0	RAIN	\N	\N	74125	f	4b7a5cf8-c507-4c0f-a0f3-147fa1e6416c	vndms.dmc.gov.vn
5713	Thông số đo mưa	\N	0	RAIN	\N	\N	74126	f	5c2f4ed0-7d07-4713-b923-3ee5196b3bfd	vndms.dmc.gov.vn
5714	Thông số đo mưa	\N	0	RAIN	\N	\N	74127	f	4d1571f5-50a8-4753-8ef7-d0ff64e2f51d	vndms.dmc.gov.vn
5715	Thông số đo mưa	\N	0	RAIN	\N	\N	74128	f	d49b6b83-865b-4aff-a8ec-ec312b4c5eb8	vndms.dmc.gov.vn
5716	Thông số đo mưa	\N	0	RAIN	\N	\N	74129	f	d2cd15b1-ddf4-4e5a-bcac-b82e48e580cb	vndms.dmc.gov.vn
5717	Thông số đo mưa	\N	0	RAIN	\N	\N	74130	f	431f5674-427f-4d9f-a095-bdfeeda85863	vndms.dmc.gov.vn
5718	Thông số đo mưa	\N	0	RAIN	\N	\N	74135	f	39d48ea1-75ad-48ef-85fe-10753ec836af	vndms.dmc.gov.vn
5719	Thông số đo mưa	\N	0	RAIN	\N	\N	74136	f	ead87a64-7f0a-42aa-b337-c9d12a6065eb	vndms.dmc.gov.vn
5720	Thông số đo mưa	\N	0	RAIN	\N	\N	74137	f	b874d97b-73b1-4e4b-9273-4bb0a46d647c	vndms.dmc.gov.vn
5721	Thông số đo mưa	\N	0	RAIN	\N	\N	74138	f	d7f52583-6210-43d8-ba90-2b6bf6c128ef	vndms.dmc.gov.vn
5722	Thông số đo mưa	\N	0	RAIN	\N	\N	74139	f	7adb5cd5-90df-4191-9eab-6a5a41d1c50e	vndms.dmc.gov.vn
5723	Thông số đo mưa	\N	0	RAIN	\N	\N	74142	f	a360926e-85d9-466f-914d-d668ec79367d	vndms.dmc.gov.vn
5724	Thông số đo mưa	\N	0	RAIN	\N	\N	74144	f	89dffb59-4cc7-4612-9ee7-4ffca16393da	vndms.dmc.gov.vn
5725	Thông số đo mưa	\N	0	RAIN	\N	\N	74145	f	9261c35d-68bf-4fde-b0e2-71c535b281d6	vndms.dmc.gov.vn
5726	Thông số đo mưa	\N	0	RAIN	\N	\N	74146	f	4ac37afd-0b00-40b7-ae35-8f2d67a44437	vndms.dmc.gov.vn
5727	Thông số đo mưa	\N	0	RAIN	\N	\N	74147	f	9c3a90e4-4b08-415e-99e0-ca229e8d2554	vndms.dmc.gov.vn
5728	Thông số đo mưa	\N	0	RAIN	\N	\N	74148	f	63ec74d6-636f-4e48-acb6-d91566b0a3f2	vndms.dmc.gov.vn
5729	Thông số đo mưa	\N	0	RAIN	\N	\N	74153	f	d71ee915-754c-4a16-a8c4-ac4dc119289b	vndms.dmc.gov.vn
5730	Thông số đo mưa	\N	0	RAIN	\N	\N	74154	f	055cd534-e0b5-4837-b0cb-01f2bf33e000	vndms.dmc.gov.vn
5731	Thông số đo mưa	\N	0	RAIN	\N	\N	74155	f	81b790e9-21d8-44d9-a06d-1748dba595e3	vndms.dmc.gov.vn
5732	Thông số đo mưa	\N	0	RAIN	\N	\N	74156	f	657e4381-c487-46d0-b97c-68beb8b63f1a	vndms.dmc.gov.vn
5733	Thông số đo mưa	\N	0	RAIN	\N	\N	74157	f	510a8360-fb9c-42d8-b256-4a6f3313e57f	vndms.dmc.gov.vn
5734	Thông số đo mưa	\N	0	RAIN	\N	\N	74184 	f	aa3eb31d-d44e-49ef-8f8e-04f6b0a9930f	vndms.dmc.gov.vn
5735	Thông số đo mưa	\N	0	RAIN	\N	\N	74197 	f	6586641e-ff34-432a-8b97-5ca8446e1e2f	vndms.dmc.gov.vn
5736	Thông số đo mưa	\N	0	RAIN	\N	\N	74201	f	af04ad5f-016b-4462-9bdf-b82944baed40	vndms.dmc.gov.vn
5737	Thông số đo mưa	\N	0	RAIN	\N	\N	742096	f	57e769ed-8aa7-4bb8-bd18-d29b935cde39	vndms.dmc.gov.vn
5738	Thông số đo mưa	\N	0	RAIN	\N	\N	742215	f	a53137bb-3c6a-4faa-9b0c-93a24abdc2aa	vndms.dmc.gov.vn
5739	Thông số đo mưa	\N	0	RAIN	\N	\N	742691	f	586af59a-d570-4e53-921a-6400de61ef12	vndms.dmc.gov.vn
5740	Thông số đo mưa	\N	0	RAIN	\N	\N	742904	f	ba9e1c38-ba5f-4099-a1a9-fb7dbc9794a7	vndms.dmc.gov.vn
5741	Thông số đo mưa	\N	0	RAIN	\N	\N	743662	f	c3a3643f-6ffd-46bd-90d6-77291117b610	vndms.dmc.gov.vn
5742	Thông số đo mưa	\N	0	RAIN	\N	\N	743701	f	a28b8972-9d85-476b-a9ee-5b14ae7dc742	vndms.dmc.gov.vn
5743	Thông số đo mưa	\N	0	RAIN	\N	\N	744061	f	5d5d916e-d05d-41e0-a0fd-5b9e04fd7bf2	vndms.dmc.gov.vn
5744	Thông số đo mưa	\N	0	RAIN	\N	\N	74428	f	5fe3b04f-2071-4c2d-9a30-579b09ec1925	vndms.dmc.gov.vn
5745	Thông số đo mưa	\N	0	RAIN	\N	\N	745380	f	2c9b0d45-d1bb-4e86-8870-32676d7b1558	vndms.dmc.gov.vn
5746	Thông số đo mưa	\N	0	RAIN	\N	\N	750001	f	e8f5b8a3-aa9a-483c-9bcc-89f706c856e9	vndms.dmc.gov.vn
5747	Thông số đo mưa	\N	0	RAIN	\N	\N	750002	f	eb7b950f-8b25-49eb-9d8c-a69bfa6562c2	vndms.dmc.gov.vn
5748	Thông số đo mưa	\N	0	RAIN	\N	\N	750003	f	dc490a98-7f4c-4f94-8317-dee7550d702f	vndms.dmc.gov.vn
5749	Thông số đo mưa	\N	0	RAIN	\N	\N	750005	f	3aaa48fd-76cf-42f8-a121-9ddf328ae460	vndms.dmc.gov.vn
5750	Thông số đo mưa	\N	0	RAIN	\N	\N	750006	f	218ebf8b-56ce-4469-bf47-d5a1fdc2e5ff	vndms.dmc.gov.vn
5751	Thông số đo mưa	\N	0	RAIN	\N	\N	750007	f	373755c9-1be9-4de0-a5e9-e87631e9370a	vndms.dmc.gov.vn
5752	Thông số đo mưa	\N	0	RAIN	\N	\N	750008	f	4da78a3d-1587-401d-9763-0dec64c679b8	vndms.dmc.gov.vn
5753	Thông số đo mưa	\N	0	RAIN	\N	\N	750009	f	5207033c-792b-4f13-86b4-0e71b007664f	vndms.dmc.gov.vn
5754	Thông số đo mưa	\N	0	RAIN	\N	\N	750010	f	ff632949-fd97-483d-b824-b68c7e22353e	vndms.dmc.gov.vn
5755	Thông số đo mưa	\N	0	RAIN	\N	\N	750011	f	82986c18-4286-4a8d-b4c4-7b21ea5aaaa9	vndms.dmc.gov.vn
5756	Thông số đo mưa	\N	0	RAIN	\N	\N	750014	f	fa06577f-504a-4a4a-ba08-0ff5502abdc9	vndms.dmc.gov.vn
5757	Thông số đo mưa	\N	0	RAIN	\N	\N	750015	f	78e2981d-4b51-4a78-b4a8-f33c5c98be26	vndms.dmc.gov.vn
5758	Thông số đo mưa	\N	0	RAIN	\N	\N	750016	f	5c5988ea-3407-41f6-b35e-574205220f1b	vndms.dmc.gov.vn
5759	Thông số đo mưa	\N	0	RAIN	\N	\N	750021	f	d3125348-071a-46e0-b590-daf5c0a4349a	vndms.dmc.gov.vn
5760	Thông số đo mưa	\N	0	RAIN	\N	\N	750022	f	bbea1bad-df01-48bb-a7d5-41e6b7031169	vndms.dmc.gov.vn
5761	Thông số đo mưa	\N	0	RAIN	\N	\N	750023	f	020b6842-4425-4844-9aba-77b3a124d6ab	vndms.dmc.gov.vn
5762	Thông số đo mưa	\N	0	RAIN	\N	\N	750024	f	61b3be17-2f51-4da8-9fbd-44cdc88fa580	vndms.dmc.gov.vn
5763	Thông số đo mưa	\N	0	RAIN	\N	\N	750025	f	3f6641e6-20e6-4869-9e03-57063d014494	vndms.dmc.gov.vn
5764	Thông số đo mưa	\N	0	RAIN	\N	\N	750026	f	d4be8a27-5106-4e86-b6c8-14e665a5677b	vndms.dmc.gov.vn
5765	Thông số đo mưa	\N	0	RAIN	\N	\N	750027	f	3b132f6e-0dd8-4ea2-9352-0eb28eafef4f	vndms.dmc.gov.vn
5766	Thông số đo mưa	\N	0	RAIN	\N	\N	750028	f	0cdfc5d2-3af0-4688-8d86-e7f2f00e06fd	vndms.dmc.gov.vn
5767	Thông số đo mưa	\N	0	RAIN	\N	\N	750029	f	a03aff34-4aed-4b1d-822a-3c44a0157e6e	vndms.dmc.gov.vn
5768	Thông số đo mưa	\N	0	RAIN	\N	\N	750030	f	97811f08-2e1f-42b6-9f97-ff46218f5f18	vndms.dmc.gov.vn
5769	Thông số đo mưa	\N	0	RAIN	\N	\N	750031	f	109fdb1e-2b13-4c40-a6e9-f08ad93f4547	vndms.dmc.gov.vn
5770	Thông số đo mưa	\N	0	RAIN	\N	\N	750032	f	1af4a401-25da-4183-95a3-cd6189fba717	vndms.dmc.gov.vn
5771	Thông số đo mưa	\N	0	RAIN	\N	\N	750033	f	fa413260-1a24-468a-a520-c72470f34a18	vndms.dmc.gov.vn
5772	Thông số đo mưa	\N	0	RAIN	\N	\N	750034	f	3dc7ea49-39b3-4b52-ac92-6d94a375b71c	vndms.dmc.gov.vn
5773	Thông số đo mưa	\N	0	RAIN	\N	\N	750035	f	6dd7ffbd-4187-4406-97f7-e4e79fa3a2db	vndms.dmc.gov.vn
5774	Thông số đo mưa	\N	0	RAIN	\N	\N	750040	f	c9d4d16e-7a0f-4b83-b4f6-b2fbed4c3f51	vndms.dmc.gov.vn
5775	Thông số đo mưa	\N	0	RAIN	\N	\N	750059	f	f9467151-c44b-4d5a-9dae-e82323ec6b47	vndms.dmc.gov.vn
5776	Thông số đo mưa	\N	0	RAIN	\N	\N	750061	f	0831628d-5a66-4ff1-95b3-ce1ea8b7af70	vndms.dmc.gov.vn
5777	Thông số đo mưa	\N	0	RAIN	\N	\N	750062	f	06b227d5-d76c-4dc1-bc91-f4df0c3b5b54	vndms.dmc.gov.vn
5778	Thông số đo mưa	\N	0	RAIN	\N	\N	750063	f	0169c287-c810-465f-b66e-6d87b55ef1ed	vndms.dmc.gov.vn
5779	Thông số đo mưa	\N	0	RAIN	\N	\N	750064	f	95afc6ed-7185-4f34-bc42-51f96e42435e	vndms.dmc.gov.vn
5780	Thông số đo mưa	\N	0	RAIN	\N	\N	750065	f	c2c3cd79-5f00-4e5f-b06c-a8babf9671a5	vndms.dmc.gov.vn
5781	Thông số đo mưa	\N	0	RAIN	\N	\N	750066	f	4771e74b-39b7-4e42-9713-fa07e84d3e69	vndms.dmc.gov.vn
5782	Thông số đo mưa	\N	0	RAIN	\N	\N	752648	f	78c35ec9-61f6-40c9-9f57-b9217253c021	vndms.dmc.gov.vn
5783	Thông số đo mưa	\N	0	RAIN	\N	\N	752767	f	754cf780-3319-4741-8d7c-eaab6c130e93	vndms.dmc.gov.vn
5784	Thông số đo mưa	\N	0	RAIN	\N	\N	753531	f	52b706bb-cc98-446c-802d-a95e1fd243d1	vndms.dmc.gov.vn
5785	Thông số đo mưa	\N	0	RAIN	\N	\N	754741	f	0dbc6e62-a5cc-4bd1-afc8-47e02d397ab0	vndms.dmc.gov.vn
5786	Thông số đo mưa	\N	0	RAIN	\N	\N	758013	f	568543f9-4fc3-4eff-b4e5-b8f2b27618b7	vndms.dmc.gov.vn
5787	Thông số đo mưa	\N	0	RAIN	\N	\N	760001	f	cdc81ec0-aafe-4fd1-9ef0-b19cbe212dd7	vndms.dmc.gov.vn
5788	Thông số đo mưa	\N	0	RAIN	\N	\N	760002	f	965636b0-fbdc-4c68-b2f8-e43eba40ccca	vndms.dmc.gov.vn
5789	Thông số đo mưa	\N	0	RAIN	\N	\N	760003	f	7fb411ff-2e40-4986-b076-637e4011bb3c	vndms.dmc.gov.vn
5790	Thông số đo mưa	\N	0	RAIN	\N	\N	760006	f	e5fb0d04-e637-49db-8b75-124baa74b3d3	vndms.dmc.gov.vn
5791	Thông số đo mưa	\N	0	RAIN	\N	\N	760007	f	80bdb7c4-6185-4c85-8450-e6ec529a21c0	vndms.dmc.gov.vn
5792	Thông số đo mưa	\N	0	RAIN	\N	\N	760008	f	4238d189-3e07-4983-aa34-957639e88640	vndms.dmc.gov.vn
5793	Thông số đo mưa	\N	0	RAIN	\N	\N	760009	f	08bf648b-876c-42f6-b922-d4686496bd41	vndms.dmc.gov.vn
5794	Thông số đo mưa	\N	0	RAIN	\N	\N	760010	f	38065a8b-8973-48c8-9100-0d100691d2ba	vndms.dmc.gov.vn
5795	Thông số đo mưa	\N	0	RAIN	\N	\N	760011	f	b85fd6dd-6504-45cc-babb-aa2c12a6abff	vndms.dmc.gov.vn
5796	Thông số đo mưa	\N	0	RAIN	\N	\N	760012	f	26c08315-4229-473b-8fba-35a42e880f94	vndms.dmc.gov.vn
5797	Thông số đo mưa	\N	0	RAIN	\N	\N	760013	f	8909103c-b2ab-42f8-9626-ef4055947461	vndms.dmc.gov.vn
5798	Thông số đo mưa	\N	0	RAIN	\N	\N	760014	f	4baca14d-cd6a-4469-a06e-8aea039ceac3	vndms.dmc.gov.vn
5799	Thông số đo mưa	\N	0	RAIN	\N	\N	760015	f	15c6a9cd-a54b-4f26-a602-ca43873073c0	vndms.dmc.gov.vn
5800	Thông số đo mưa	\N	0	RAIN	\N	\N	760016	f	bc81c14c-4e9d-468b-90ca-a3e7d03113b5	vndms.dmc.gov.vn
5801	Thông số đo mưa	\N	0	RAIN	\N	\N	760017	f	f38367ea-218b-495f-9ccd-47034b8e757b	vndms.dmc.gov.vn
5802	Thông số đo mưa	\N	0	RAIN	\N	\N	760018	f	9fad6f70-ddba-48dd-920c-3fb8629c3b2c	vndms.dmc.gov.vn
5803	Thông số đo mưa	\N	0	RAIN	\N	\N	760019	f	ad15059c-7e0d-4245-a0a1-84ff94b7349a	vndms.dmc.gov.vn
5804	Thông số đo mưa	\N	0	RAIN	\N	\N	760020	f	725b50eb-e281-456d-a760-ce8d4529fe22	vndms.dmc.gov.vn
5805	Thông số đo mưa	\N	0	RAIN	\N	\N	760030	f	8ece6082-6da9-468b-8ec7-54597eed5d27	vndms.dmc.gov.vn
5806	Thông số đo mưa	\N	0	RAIN	\N	\N	760031	f	01546506-d0a0-4597-8c5d-4834da5eca11	vndms.dmc.gov.vn
5807	Thông số đo mưa	\N	0	RAIN	\N	\N	760032	f	1897effd-8a44-4fd2-aede-3aa95e9fde71	vndms.dmc.gov.vn
5808	Thông số đo mưa	\N	0	RAIN	\N	\N	760034	f	56be16ae-8224-4d84-8a30-0eea28c44b57	vndms.dmc.gov.vn
5809	Thông số đo mưa	\N	0	RAIN	\N	\N	760051	f	e6e66c39-e6f8-4da2-bbc5-4259da554255	vndms.dmc.gov.vn
5810	Thông số đo mưa	\N	0	RAIN	\N	\N	760052	f	92bdc14a-6282-4b84-be38-c12324573853	vndms.dmc.gov.vn
5811	Thông số đo mưa	\N	0	RAIN	\N	\N	760053	f	791406a1-d627-4242-b572-5a4fddace156	vndms.dmc.gov.vn
5812	Thông số đo mưa	\N	0	RAIN	\N	\N	760054	f	5dbd7753-4bc4-485e-813c-75aa95c3e807	vndms.dmc.gov.vn
5813	Thông số đo mưa	\N	0	RAIN	\N	\N	760055	f	d9bd4287-7c7a-4761-86af-6fc83c8cab26	vndms.dmc.gov.vn
5814	Thông số đo mưa	\N	0	RAIN	\N	\N	760056	f	03c6d71b-29bb-491c-af86-10c0c1a4e121	vndms.dmc.gov.vn
5815	Thông số đo mưa	\N	0	RAIN	\N	\N	760057	f	98c3fe01-ac1a-4dca-a566-fa16de51447a	vndms.dmc.gov.vn
5816	Thông số đo mưa	\N	0	RAIN	\N	\N	760058	f	8997df9c-635b-4138-bc9e-8c50950e8cbb	vndms.dmc.gov.vn
5817	Thông số đo mưa	\N	0	RAIN	\N	\N	760059	f	9d8fe9e0-7b8c-4544-8b3e-3f7b4c1200eb	vndms.dmc.gov.vn
5818	Thông số đo mưa	\N	0	RAIN	\N	\N	760060	f	0a213fee-a6a8-4c0c-a102-86a422800479	vndms.dmc.gov.vn
5819	Thông số đo mưa	\N	0	RAIN	\N	\N	760061	f	d579ac62-dcd7-4fc2-b97a-ecceb26b3c29	vndms.dmc.gov.vn
5820	Thông số đo mưa	\N	0	RAIN	\N	\N	760062	f	3792b63f-f623-448c-a6ba-2872d435d9ba	vndms.dmc.gov.vn
5821	Thông số đo mưa	\N	0	RAIN	\N	\N	760063	f	ee748355-41cc-4851-96e7-4a667b075fa9	vndms.dmc.gov.vn
5822	Thông số đo mưa	\N	0	RAIN	\N	\N	760064	f	a9ca1a63-1c11-43a2-9d78-64500846185c	vndms.dmc.gov.vn
5823	Thông số đo mưa	\N	0	RAIN	\N	\N	760065	f	54e7854e-5da8-49d1-8c3c-58c46b0b7ac1	vndms.dmc.gov.vn
5824	Thông số đo mưa	\N	0	RAIN	\N	\N	760066	f	ada1061c-5066-4934-a4b9-cd0aa538ae35	vndms.dmc.gov.vn
5825	Thông số đo mưa	\N	0	RAIN	\N	\N	760067	f	3662ac8b-1366-4614-93f1-638e7450a5bd	vndms.dmc.gov.vn
5826	Thông số đo mưa	\N	0	RAIN	\N	\N	760068	f	9c91286b-0373-4ea5-9207-6e95b94c64cc	vndms.dmc.gov.vn
5827	Thông số đo mưa	\N	0	RAIN	\N	\N	760069	f	9f48b000-732f-469e-87ad-20eeed62bdeb	vndms.dmc.gov.vn
5828	Thông số đo mưa	\N	0	RAIN	\N	\N	760070	f	d3ae79e8-303c-4981-9139-c3b5dc65793c	vndms.dmc.gov.vn
5829	Thông số đo mưa	\N	0	RAIN	\N	\N	760071	f	76bcd82d-69f8-4cc2-8cf0-169ea12849d2	vndms.dmc.gov.vn
5830	Thông số đo mưa	\N	0	RAIN	\N	\N	760072	f	f442007e-1b65-47fe-9039-ec104fe7873e	vndms.dmc.gov.vn
5831	Thông số đo mưa	\N	0	RAIN	\N	\N	760073	f	2b1a16ba-e656-4dd3-8866-6cebd6e96cbe	vndms.dmc.gov.vn
5832	Thông số đo mưa	\N	0	RAIN	\N	\N	760074	f	3a97c75e-e6c8-4aa4-93ef-bff707b07460	vndms.dmc.gov.vn
5833	Thông số đo mưa	\N	0	RAIN	\N	\N	760075	f	2bffe99f-b7b5-4d98-bcbe-77b4171f76c2	vndms.dmc.gov.vn
5834	Thông số đo mưa	\N	0	RAIN	\N	\N	760076	f	c3b04ed2-3f29-4323-8f35-a1fd0e950a0e	vndms.dmc.gov.vn
5835	Thông số đo mưa	\N	0	RAIN	\N	\N	760077	f	6527f116-6ad9-4fa2-9a72-285db96b3c38	vndms.dmc.gov.vn
5836	Thông số đo mưa	\N	0	RAIN	\N	\N	760078	f	0e2cd164-f161-4563-afaa-05871e7eec16	vndms.dmc.gov.vn
5837	Thông số đo mưa	\N	0	RAIN	\N	\N	760079	f	b5a2b175-ec0b-4483-8215-ada5af7e993f	vndms.dmc.gov.vn
5838	Thông số đo mưa	\N	0	RAIN	\N	\N	760080	f	1ce58528-cfd8-4d27-9ddf-add77ed37524	vndms.dmc.gov.vn
5839	Thông số đo mưa	\N	0	RAIN	\N	\N	760081	f	6d4e3cbe-dc5b-4e5f-b1c4-5e7757d0f8c0	vndms.dmc.gov.vn
5840	Thông số đo mưa	\N	0	RAIN	\N	\N	760082	f	d1c20314-0424-43d6-add6-d132f286b0fd	vndms.dmc.gov.vn
5841	Thông số đo mưa	\N	0	RAIN	\N	\N	760083	f	2b7dc992-a7a2-42f8-9390-522c284c0d3d	vndms.dmc.gov.vn
5842	Thông số đo mưa	\N	0	RAIN	\N	\N	762065	f	567ffc9c-07a3-4201-839c-355590fec921	vndms.dmc.gov.vn
5843	Thông số đo mưa	\N	0	RAIN	\N	\N	762624	f	005d1eb8-6806-463c-85ed-1dbe4f7537b5	vndms.dmc.gov.vn
5844	Thông số đo mưa	\N	0	RAIN	\N	\N	763715	f	3196f243-e5fa-47c2-9155-fe08ed1cb08c	vndms.dmc.gov.vn
5845	Thông số đo mưa	\N	0	RAIN	\N	\N	764137	f	b123ef91-3b89-4559-a7d6-03386214e573	vndms.dmc.gov.vn
5846	Thông số đo mưa	\N	0	RAIN	\N	\N	764520	f	d37b00b2-f940-4dbb-926e-03836ee7576e	vndms.dmc.gov.vn
5847	Thông số đo mưa	\N	0	RAIN	\N	\N	764613	f	2b256ea8-6600-4e83-8fe6-c3aa474c47ae	vndms.dmc.gov.vn
5848	Thông số đo mưa	\N	0	RAIN	\N	\N	766254	f	82215ca9-4d0b-4543-8756-eee2624530b4	vndms.dmc.gov.vn
5849	Thông số đo mưa	\N	0	RAIN	\N	\N	767056	f	1b1d30b6-6f2e-454f-b996-8a1d16591f56	vndms.dmc.gov.vn
5850	Thông số đo mưa	\N	0	RAIN	\N	\N	770001	f	e385989d-57fd-42f5-9f42-0192f8034144	vndms.dmc.gov.vn
5851	Thông số đo mưa	\N	0	RAIN	\N	\N	770002	f	84c789b0-a5cd-40cd-9425-dcd763fd7bde	vndms.dmc.gov.vn
5852	Thông số đo mưa	\N	0	RAIN	\N	\N	770003	f	555fbf8c-5951-4e9e-8735-fffd985c4228	vndms.dmc.gov.vn
5853	Thông số đo mưa	\N	0	RAIN	\N	\N	770004	f	132a4107-86c8-4126-aa4e-044fb636888a	vndms.dmc.gov.vn
5854	Thông số đo mưa	\N	0	RAIN	\N	\N	770005	f	14254bd6-732a-4b4f-a0ad-e08f9b0b3839	vndms.dmc.gov.vn
5855	Thông số đo mưa	\N	0	RAIN	\N	\N	770006	f	7fc20125-24a2-4d4a-b487-b95a78046c80	vndms.dmc.gov.vn
5856	Thông số đo mưa	\N	0	RAIN	\N	\N	770007	f	c94ca065-57cb-492f-ab3d-7049f669a702	vndms.dmc.gov.vn
5857	Thông số đo mưa	\N	0	RAIN	\N	\N	770008	f	0f8e10b1-87cd-42d0-adc8-88d409f0a067	vndms.dmc.gov.vn
5858	Thông số đo mưa	\N	0	RAIN	\N	\N	770009	f	306c7d74-4483-457f-99c6-7e03c6c82aae	vndms.dmc.gov.vn
5859	Thông số đo mưa	\N	0	RAIN	\N	\N	770010	f	b898fa3d-c599-4eb7-ae51-2fa744c16b09	vndms.dmc.gov.vn
5860	Thông số đo mưa	\N	0	RAIN	\N	\N	770067	f	23f058ff-b8e5-4037-b946-b6ac86a4391c	vndms.dmc.gov.vn
5861	Thông số đo mưa	\N	0	RAIN	\N	\N	771429	f	a03af51a-ba6f-4e64-9402-8520b2d019be	vndms.dmc.gov.vn
5862	Thông số đo mưa	\N	0	RAIN	\N	\N	774463	f	5c70ff8c-3fc9-4cb5-8505-9e0980d72324	vndms.dmc.gov.vn
5863	Thông số đo mưa	\N	0	RAIN	\N	\N	774945	f	bd4fb87d-8efd-47d9-9b46-c070960ab857	vndms.dmc.gov.vn
5864	Thông số đo mưa	\N	0	RAIN	\N	\N	778232	f	0a03c78a-d14f-42e5-b37d-8681d87ef6bb	vndms.dmc.gov.vn
5865	Thông số đo mưa	\N	0	RAIN	\N	\N	780001	f	e7074009-bfa4-49a4-a26e-a866e5c4df6f	vndms.dmc.gov.vn
5866	Thông số đo mưa	\N	0	RAIN	\N	\N	780002	f	ce352983-3d91-4e2a-b64c-ccf80047e90d	vndms.dmc.gov.vn
5867	Thông số đo mưa	\N	0	RAIN	\N	\N	780003	f	b4518356-67d6-4cdb-aadb-1eb5f55589c5	vndms.dmc.gov.vn
5868	Thông số đo mưa	\N	0	RAIN	\N	\N	780004	f	9714edc1-4af6-4994-9859-bfd42046a9c7	vndms.dmc.gov.vn
5869	Thông số đo mưa	\N	0	RAIN	\N	\N	780005	f	e003e386-a9b0-40ea-9bcb-1761821adec4	vndms.dmc.gov.vn
5870	Thông số đo mưa	\N	0	RAIN	\N	\N	780006	f	ae6427b7-5922-47b1-aa9a-68812c45d462	vndms.dmc.gov.vn
5871	Thông số đo mưa	\N	0	RAIN	\N	\N	780007	f	7819f696-79f8-45da-bb42-d81457da89f9	vndms.dmc.gov.vn
5872	Thông số đo mưa	\N	0	RAIN	\N	\N	780008	f	a01bec81-1024-4ac0-bfd1-0e4d0ccba96a	vndms.dmc.gov.vn
5873	Thông số đo mưa	\N	0	RAIN	\N	\N	780009	f	41f5df0d-e5bc-48eb-8e6c-e9bc2bca1a61	vndms.dmc.gov.vn
5874	Thông số đo mưa	\N	0	RAIN	\N	\N	780010	f	85a96fe5-79d3-47b9-a1e7-72053e3af6db	vndms.dmc.gov.vn
5875	Thông số đo mưa	\N	0	RAIN	\N	\N	780011	f	946d7025-2b29-41aa-b452-81d1744a4d69	vndms.dmc.gov.vn
5876	Thông số đo mưa	\N	0	RAIN	\N	\N	780012	f	01cb9ca8-1065-4c26-96e7-359fb79b9aff	vndms.dmc.gov.vn
5877	Thông số đo mưa	\N	0	RAIN	\N	\N	780013	f	95ddbb98-6707-4039-81d6-89d3bb76b84c	vndms.dmc.gov.vn
5878	Thông số đo mưa	\N	0	RAIN	\N	\N	780014	f	7661218e-f081-4068-9429-842645272336	vndms.dmc.gov.vn
5879	Thông số đo mưa	\N	0	RAIN	\N	\N	780015	f	f0988b30-6919-44c4-8f56-f10577e834cc	vndms.dmc.gov.vn
5880	Thông số đo mưa	\N	0	RAIN	\N	\N	780021	f	37928599-cc6a-4827-b2fd-5196e50abb75	vndms.dmc.gov.vn
5881	Thông số đo mưa	\N	0	RAIN	\N	\N	780022	f	e4cdc1d9-bc20-4178-b8a9-c5bb790abd26	vndms.dmc.gov.vn
5882	Thông số đo mưa	\N	0	RAIN	\N	\N	780023	f	c15f3e65-6b27-4f75-98c8-200c77cf2d46	vndms.dmc.gov.vn
5883	Thông số đo mưa	\N	0	RAIN	\N	\N	780024	f	7498bd61-9659-4bc8-b589-aabb96c0bc81	vndms.dmc.gov.vn
5884	Thông số đo mưa	\N	0	RAIN	\N	\N	780025	f	e3e279e4-b569-4b20-930f-c33c6790552c	vndms.dmc.gov.vn
5885	Thông số đo mưa	\N	0	RAIN	\N	\N	780026	f	3048a3c9-4cb4-4338-a343-664e17d5a615	vndms.dmc.gov.vn
5886	Thông số đo mưa	\N	0	RAIN	\N	\N	780027	f	5bebc75e-e592-489d-a81b-3a02b7b24e39	vndms.dmc.gov.vn
5887	Thông số đo mưa	\N	0	RAIN	\N	\N	780028	f	fa878e37-5e85-4966-8674-000c6c9306fe	vndms.dmc.gov.vn
5888	Thông số đo mưa	\N	0	RAIN	\N	\N	780029	f	1cbb3ec8-40b5-413f-8904-65bc6b9b5552	vndms.dmc.gov.vn
5889	Thông số đo mưa	\N	0	RAIN	\N	\N	780030	f	b9a3dc67-907a-482c-8094-6a81c4fe41c9	vndms.dmc.gov.vn
5890	Thông số đo mưa	\N	0	RAIN	\N	\N	780031	f	626de98d-1bf0-46e7-aa19-0f6b82ffe279	vndms.dmc.gov.vn
5891	Thông số đo mưa	\N	0	RAIN	\N	\N	780032	f	1313ccb1-04ed-48c3-bfca-88154a2232ba	vndms.dmc.gov.vn
5892	Thông số đo mưa	\N	0	RAIN	\N	\N	780033	f	294c9ada-db71-47a4-8393-6fd9f8290851	vndms.dmc.gov.vn
5893	Thông số đo mưa	\N	0	RAIN	\N	\N	780034	f	baeb32c9-9ec3-4f1d-a669-5bcc929771a3	vndms.dmc.gov.vn
5894	Thông số đo mưa	\N	0	RAIN	\N	\N	780035	f	a2e12a6f-a38a-4dc7-b97a-3c429f58454a	vndms.dmc.gov.vn
5895	Thông số đo mưa	\N	0	RAIN	\N	\N	781053	f	b57baa5d-4b8f-434d-a8f5-0edecb8773ee	vndms.dmc.gov.vn
5896	Thông số đo mưa	\N	0	RAIN	\N	\N	782509	f	fc8d1a29-a675-4bb0-a212-cdaa744a35c2	vndms.dmc.gov.vn
5897	Thông số đo mưa	\N	0	RAIN	\N	\N	782600	f	6ff3da77-34cf-470e-9664-fda2d316407f	vndms.dmc.gov.vn
5898	Thông số đo mưa	\N	0	RAIN	\N	\N	784236	f	be63c75a-ac08-4a64-997d-98643e69d1c2	vndms.dmc.gov.vn
5899	Thông số đo mưa	\N	0	RAIN	\N	\N	784912	f	24d312d4-0936-4ec8-8b8e-70e4e8eb09e5	vndms.dmc.gov.vn
5900	Thông số đo mưa	\N	0	RAIN	\N	\N	789789	f	7f096199-e82c-4614-b65e-81f9ec951d48	vndms.dmc.gov.vn
5901	Thông số đo mưa	\N	0	RAIN	\N	\N	790001	f	22c20719-9d22-40c6-9f96-50c6a32fa468	vndms.dmc.gov.vn
5902	Thông số đo mưa	\N	0	RAIN	\N	\N	790932	f	133ed1d6-f0d0-40b1-b540-cc13008f41c1	vndms.dmc.gov.vn
5903	Thông số đo mưa	\N	0	RAIN	\N	\N	791958	f	9c0e8f3d-cd55-4cd6-a586-f48082aa0cdb	vndms.dmc.gov.vn
5904	Thông số đo mưa	\N	0	RAIN	\N	\N	792845	f	ebfd84fb-e326-4fd5-8291-16198fa03a04	vndms.dmc.gov.vn
5905	Thông số đo mưa	\N	0	RAIN	\N	\N	793583	f	81443ec6-447a-44f0-a2f0-b6a31b83cdf8	vndms.dmc.gov.vn
5906	Thông số đo mưa	\N	0	RAIN	\N	\N	794462	f	9c6e0aed-a9fc-4142-bdc4-16bbece555a0	vndms.dmc.gov.vn
5907	Thông số đo mưa	\N	0	RAIN	\N	\N	796031	f	c0c666f4-d465-4ede-8176-9f48e8a8467b	vndms.dmc.gov.vn
5908	Thông số đo mưa	\N	0	RAIN	\N	\N	800215	f	92400f16-e066-4e56-831b-4c8d642905dc	vndms.dmc.gov.vn
5909	Thông số đo mưa	\N	0	RAIN	\N	\N	800364	f	47929bd4-86e0-421e-9571-97a188716d64	vndms.dmc.gov.vn
5910	Thông số đo mưa	\N	0	RAIN	\N	\N	802054	f	d78384b6-4596-4966-81ab-b0c7d85f4951	vndms.dmc.gov.vn
5911	Thông số đo mưa	\N	0	RAIN	\N	\N	802178	f	171e9bff-7002-4bd1-a937-bd17265dc77b	vndms.dmc.gov.vn
5912	Thông số đo mưa	\N	0	RAIN	\N	\N	804318	f	fa74c750-ed6e-4184-a767-30bd39c3865c	vndms.dmc.gov.vn
5913	Thông số đo mưa	\N	0	RAIN	\N	\N	806374	f	1c3c1e93-5940-4611-ace2-a299f99b496f	vndms.dmc.gov.vn
5914	Thông số đo mưa	\N	0	RAIN	\N	\N	809143	f	226919fe-0b62-41ea-93b8-7f264b383fb5	vndms.dmc.gov.vn
5915	Thông số đo mưa	\N	0	RAIN	\N	\N	810001	f	8b9a9275-d81f-412d-86a1-5f6d2f51d8f0	vndms.dmc.gov.vn
5916	Thông số đo mưa	\N	0	RAIN	\N	\N	810002	f	b367d14b-d9ba-43d3-be10-5cc90c00b9ec	vndms.dmc.gov.vn
5917	Thông số đo mưa	\N	0	RAIN	\N	\N	810003	f	22470cc6-569a-49eb-881e-e5e5e8c2f9b8	vndms.dmc.gov.vn
5918	Thông số đo mưa	\N	0	RAIN	\N	\N	810014	f	de443313-807c-4814-8c39-ceca21bc6596	vndms.dmc.gov.vn
5919	Thông số đo mưa	\N	0	RAIN	\N	\N	811026	f	de44e8b1-ac1c-46e9-8767-c21efd92a410	vndms.dmc.gov.vn
5920	Thông số đo mưa	\N	0	RAIN	\N	\N	811491	f	23b581b1-f6d4-412d-ab72-9295f490832b	vndms.dmc.gov.vn
5921	Thông số đo mưa	\N	0	RAIN	\N	\N	813060	f	c86296a7-0d9a-4f6f-9073-6ff981c9911b	vndms.dmc.gov.vn
5922	Thông số đo mưa	\N	0	RAIN	\N	\N	813800	f	b8ac34b5-c618-4632-810c-0f25ef388005	vndms.dmc.gov.vn
5923	Thông số đo mưa	\N	0	RAIN	\N	\N	813971	f	c3a8cf68-ab64-4d02-b76f-648f43231313	vndms.dmc.gov.vn
5924	Thông số đo mưa	\N	0	RAIN	\N	\N	814625	f	d38bc72e-37bc-444b-b82c-338b7a2abbb1	vndms.dmc.gov.vn
5925	Thông số đo mưa	\N	0	RAIN	\N	\N	814897	f	0c35674e-e949-4c80-ac26-ac779caf4f5f	vndms.dmc.gov.vn
5926	Thông số đo mưa	\N	0	RAIN	\N	\N	816731	f	39fe8650-a7ef-40b2-a16d-83e4335cdf5c	vndms.dmc.gov.vn
5927	Thông số đo mưa	\N	0	RAIN	\N	\N	817224	f	23cd893d-9fea-4abb-a372-161186b9957d	vndms.dmc.gov.vn
5928	Thông số đo mưa	\N	0	RAIN	\N	\N	818227	f	1d6d0e5d-d444-4ec6-9df4-f0be28a0afd5	vndms.dmc.gov.vn
5929	Thông số đo mưa	\N	0	RAIN	\N	\N	819210	f	30ec17c2-e33c-45ad-a42e-4e8c55fde5eb	vndms.dmc.gov.vn
5930	Thông số đo mưa	\N	0	RAIN	\N	\N	819350	f	51660db0-e982-4d40-88fc-3611e14f2d00	vndms.dmc.gov.vn
5931	Thông số đo mưa	\N	0	RAIN	\N	\N	820001	f	1414e0f0-910d-4f83-971d-8ed010849168	vndms.dmc.gov.vn
5932	Thông số đo mưa	\N	0	RAIN	\N	\N	820002	f	8470f13a-1759-4a75-9a10-c46366a31ba7	vndms.dmc.gov.vn
5933	Thông số đo mưa	\N	0	RAIN	\N	\N	820003	f	1e638162-cd4e-47b3-b2a7-2d7fff12062b	vndms.dmc.gov.vn
5934	Thông số đo mưa	\N	0	RAIN	\N	\N	820004	f	60eea2e5-8a9a-4b20-8da0-aced09a5827a	vndms.dmc.gov.vn
5935	Thông số đo mưa	\N	0	RAIN	\N	\N	820005	f	c3173b2f-5c76-4f6f-878e-3df3f286b006	vndms.dmc.gov.vn
5936	Thông số đo mưa	\N	0	RAIN	\N	\N	820006	f	9d7f9a8e-6fc9-4b49-91fb-fee68166adbc	vndms.dmc.gov.vn
5937	Thông số đo mưa	\N	0	RAIN	\N	\N	820007	f	51a6cbc9-2127-487b-aa79-2068b9399a87	vndms.dmc.gov.vn
5938	Thông số đo mưa	\N	0	RAIN	\N	\N	820008	f	7012b3e5-a7a9-421d-862d-a8ee788dc21d	vndms.dmc.gov.vn
5939	Thông số đo mưa	\N	0	RAIN	\N	\N	820009	f	b3396d61-bef6-4125-bb99-e9d375bf6ee6	vndms.dmc.gov.vn
5940	Thông số đo mưa	\N	0	RAIN	\N	\N	820010	f	9429938d-09eb-40b2-9982-c26b5cdbeb38	vndms.dmc.gov.vn
5941	Thông số đo mưa	\N	0	RAIN	\N	\N	820011	f	89a562d8-191d-4976-a8bd-e175fb036333	vndms.dmc.gov.vn
5942	Thông số đo mưa	\N	0	RAIN	\N	\N	820012	f	a7b5ab6f-6087-49bf-bb44-de40ffaf6a91	vndms.dmc.gov.vn
5943	Thông số đo mưa	\N	0	RAIN	\N	\N	820013	f	61982940-0580-42a9-8a13-586e01f1bc9d	vndms.dmc.gov.vn
5944	Thông số đo mưa	\N	0	RAIN	\N	\N	821350	f	2f154195-824f-4dcb-868a-66f4da97d24d	vndms.dmc.gov.vn
5945	Thông số đo mưa	\N	0	RAIN	\N	\N	821546	f	38816a6c-6415-492d-bf92-6b25c7087652	vndms.dmc.gov.vn
5946	Thông số đo mưa	\N	0	RAIN	\N	\N	824736	f	d82f329b-eb55-4e80-8d76-9558cdd761d6	vndms.dmc.gov.vn
5947	Thông số đo mưa	\N	0	RAIN	\N	\N	825326	f	e455f7c1-1dc5-44cf-98bc-f5b99bd90d16	vndms.dmc.gov.vn
5948	Thông số đo mưa	\N	0	RAIN	\N	\N	825720	f	9e0efeee-d682-4e73-a080-0405659cd2ee	vndms.dmc.gov.vn
5949	Thông số đo mưa	\N	0	RAIN	\N	\N	825863	f	b0b60689-5e42-423b-9cdf-646cc219f9a6	vndms.dmc.gov.vn
5950	Thông số đo mưa	\N	0	RAIN	\N	\N	827707	f	24ee48f5-1646-4b69-974c-fba3d1f4bdf5	vndms.dmc.gov.vn
5951	Thông số đo mưa	\N	0	RAIN	\N	\N	829120	f	7a49427c-333a-45c5-9137-714da41c84ef	vndms.dmc.gov.vn
5952	Thông số đo mưa	\N	0	RAIN	\N	\N	830001	f	22c49f3b-b593-467e-bbf4-ea8e18fbd630	vndms.dmc.gov.vn
5953	Thông số đo mưa	\N	0	RAIN	\N	\N	830002	f	f186a54d-bec5-4699-8d07-3037084dfd0e	vndms.dmc.gov.vn
5954	Thông số đo mưa	\N	0	RAIN	\N	\N	830003	f	a74ede04-1c0c-4558-ae10-5eaa91f85e8b	vndms.dmc.gov.vn
5955	Thông số đo mưa	\N	0	RAIN	\N	\N	830004	f	fd79cc45-fc69-472f-bdb8-8e1696cc307e	vndms.dmc.gov.vn
5956	Thông số đo mưa	\N	0	RAIN	\N	\N	830005	f	e8e91db4-4719-430a-b28f-c7a1a191b759	vndms.dmc.gov.vn
5957	Thông số đo mưa	\N	0	RAIN	\N	\N	830402	f	5ee5d42a-3f77-486c-9fdf-297fdc0e749b	vndms.dmc.gov.vn
5958	Thông số đo mưa	\N	0	RAIN	\N	\N	83209	f	195ba522-7f22-4b4f-8abd-2762eeff80be	vndms.dmc.gov.vn
5959	Thông số đo mưa	\N	0	RAIN	\N	\N	833792	f	ae266efa-685f-4fdb-aa03-540844e5e83d	vndms.dmc.gov.vn
5960	Thông số đo mưa	\N	0	RAIN	\N	\N	835065	f	fe89c1e5-88df-4533-8dff-16930f0d69a7	vndms.dmc.gov.vn
5961	Thông số đo mưa	\N	0	RAIN	\N	\N	837151	f	b9ad20a0-5506-4d5c-a146-f205f71165d5	vndms.dmc.gov.vn
5962	Thông số đo mưa	\N	0	RAIN	\N	\N	838293	f	8b3bc3fc-58b9-4898-81e1-ecfa6d3e5d32	vndms.dmc.gov.vn
5963	Thông số đo mưa	\N	0	RAIN	\N	\N	838401	f	14ad1639-23e4-4beb-8a1d-c0c80f8a7c26	vndms.dmc.gov.vn
5964	Thông số đo mưa	\N	0	RAIN	\N	\N	839811	f	5b15165a-6897-4943-9630-3399b451cc79	vndms.dmc.gov.vn
5965	Thông số đo mưa	\N	0	RAIN	\N	\N	840962	f	d87a1938-d9e8-4c17-92e4-e93d0363411e	vndms.dmc.gov.vn
5966	Thông số đo mưa	\N	0	RAIN	\N	\N	843160	f	8c6aeaeb-a494-43cc-8796-d8e7d72b2ea6	vndms.dmc.gov.vn
5967	Thông số đo mưa	\N	0	RAIN	\N	\N	844369	f	1e07e748-166d-4ff2-aace-72257d724b27	vndms.dmc.gov.vn
5968	Thông số đo mưa	\N	0	RAIN	\N	\N	845756	f	226bdac2-7db1-41c1-9ea5-20f9b97ce82b	vndms.dmc.gov.vn
5969	Thông số đo mưa	\N	0	RAIN	\N	\N	848316	f	f013e9bf-858f-4172-9b05-1f01c7c29b48	vndms.dmc.gov.vn
5970	Thông số đo mưa	\N	0	RAIN	\N	\N	850001	f	dcfa0eb4-4f05-4e92-b923-94b6226b062a	vndms.dmc.gov.vn
5971	Thông số đo mưa	\N	0	RAIN	\N	\N	850002	f	52264586-291d-4790-8db1-76a79c189bd4	vndms.dmc.gov.vn
5972	Thông số đo mưa	\N	0	RAIN	\N	\N	850003	f	0a26d24c-3200-4863-8ad6-138cb48ca67e	vndms.dmc.gov.vn
5973	Thông số đo mưa	\N	0	RAIN	\N	\N	850004	f	cbf4aeef-dd16-4afa-b876-602bf9091ac5	vndms.dmc.gov.vn
5974	Thông số đo mưa	\N	0	RAIN	\N	\N	850005	f	c692c0ee-b33c-45f7-9883-907d8e1a1296	vndms.dmc.gov.vn
5975	Thông số đo mưa	\N	0	RAIN	\N	\N	850006	f	9e89d446-0ca5-4780-a812-49266edb9bc8	vndms.dmc.gov.vn
5976	Thông số đo mưa	\N	0	RAIN	\N	\N	850007	f	ba78ead8-3935-4a82-92cc-80aa5fbbfe6c	vndms.dmc.gov.vn
5977	Thông số đo mưa	\N	0	RAIN	\N	\N	850008	f	ef7cc7c4-6f12-40ab-9fe6-d30cc3c171f1	vndms.dmc.gov.vn
5978	Thông số đo mưa	\N	0	RAIN	\N	\N	850009	f	7eb655b0-7b48-442b-949a-b2497de5ac96	vndms.dmc.gov.vn
5979	Thông số đo mưa	\N	0	RAIN	\N	\N	850010	f	ba70eb96-017b-468d-a47f-a176fc5642d3	vndms.dmc.gov.vn
5980	Thông số đo mưa	\N	0	RAIN	\N	\N	850011	f	aed85728-fe2c-4459-b859-1293c6b38592	vndms.dmc.gov.vn
5981	Thông số đo mưa	\N	0	RAIN	\N	\N	850012	f	7f79464b-7cc9-4a9b-b7f3-ac0bd02b749b	vndms.dmc.gov.vn
5982	Thông số đo mưa	\N	0	RAIN	\N	\N	850013	f	e4eb9d26-ea37-450b-a303-473819a5da9f	vndms.dmc.gov.vn
5983	Thông số đo mưa	\N	0	RAIN	\N	\N	850014	f	5b43179d-cfe5-493c-80fc-c7894e64fd40	vndms.dmc.gov.vn
5984	Thông số đo mưa	\N	0	RAIN	\N	\N	850015	f	3a813a2a-c713-451a-b945-92d78bba6de1	vndms.dmc.gov.vn
5985	Thông số đo mưa	\N	0	RAIN	\N	\N	850334	f	68c35388-f94a-4bd5-b449-898945838b4d	vndms.dmc.gov.vn
5986	Thông số đo mưa	\N	0	RAIN	\N	\N	850905	f	f0f86c19-770e-4aa3-9976-fe750e9f1e5d	vndms.dmc.gov.vn
5987	Thông số đo mưa	\N	0	RAIN	\N	\N	854084	f	53f54cbb-ead3-47a6-a9bf-584bbad4fe7a	vndms.dmc.gov.vn
5988	Thông số đo mưa	\N	0	RAIN	\N	\N	855458	f	715f5acf-4bce-490a-bb9b-2271baaf5c09	vndms.dmc.gov.vn
5989	Thông số đo mưa	\N	0	RAIN	\N	\N	855600	f	da12c40e-f5b7-406f-b4c5-8a6549a19cb9	vndms.dmc.gov.vn
5990	Thông số đo mưa	\N	0	RAIN	\N	\N	856318	f	c1745ff9-8aa0-4c29-a851-cd27084e129c	vndms.dmc.gov.vn
5991	Thông số đo mưa	\N	0	RAIN	\N	\N	859882	f	51f62b9f-1bff-4a31-aec2-3e3b29913ffe	vndms.dmc.gov.vn
5992	Thông số đo mưa	\N	0	RAIN	\N	\N	860001	f	e3f9d977-4bb2-4a03-92c6-143433a544e4	vndms.dmc.gov.vn
5993	Thông số đo mưa	\N	0	RAIN	\N	\N	860002	f	732d1380-cb27-47d2-a9bd-06c33d1be469	vndms.dmc.gov.vn
5994	Thông số đo mưa	\N	0	RAIN	\N	\N	860003	f	f6f0192d-6ea3-4377-a7d3-925a55290bbc	vndms.dmc.gov.vn
5995	Thông số đo mưa	\N	0	RAIN	\N	\N	860004	f	2d9d86ac-1e74-433f-8588-0f3c25a84588	vndms.dmc.gov.vn
5996	Thông số đo mưa	\N	0	RAIN	\N	\N	860005	f	b2e2622d-e1d0-4499-8394-080a18d04d84	vndms.dmc.gov.vn
5997	Thông số đo mưa	\N	0	RAIN	\N	\N	860006	f	5a5f12a2-dbff-4d12-bc39-af9cb9a76b91	vndms.dmc.gov.vn
5998	Thông số đo mưa	\N	0	RAIN	\N	\N	860007	f	4e7d3a39-a34b-4c14-92f9-33ba5aae6c8f	vndms.dmc.gov.vn
5999	Thông số đo mưa	\N	0	RAIN	\N	\N	860008	f	e23b3af9-9721-4f00-9cd7-5a68025065d4	vndms.dmc.gov.vn
6000	Thông số đo mưa	\N	0	RAIN	\N	\N	860009	f	89bca108-7e31-432f-8770-9facb48d34bd	vndms.dmc.gov.vn
6001	Thông số đo mưa	\N	0	RAIN	\N	\N	860010	f	d2b69c26-d169-4ce5-ac89-b246b0719735	vndms.dmc.gov.vn
6002	Thông số đo mưa	\N	0	RAIN	\N	\N	860011	f	80379355-ee5e-472f-ad3e-d96a53e458f2	vndms.dmc.gov.vn
6003	Thông số đo mưa	\N	0	RAIN	\N	\N	860012	f	22700c95-73ca-41a5-9799-2ecf9abf536d	vndms.dmc.gov.vn
6004	Thông số đo mưa	\N	0	RAIN	\N	\N	860013	f	9bf91bd4-dc21-4fb1-b807-8caac31fde5f	vndms.dmc.gov.vn
6005	Thông số đo mưa	\N	0	RAIN	\N	\N	860014	f	d22bc5a3-43bd-406e-bb81-d55dcbb71cfd	vndms.dmc.gov.vn
6006	Thông số đo mưa	\N	0	RAIN	\N	\N	860015	f	635a0302-aeca-4792-9d39-4a25d6092d98	vndms.dmc.gov.vn
6007	Thông số đo mưa	\N	0	RAIN	\N	\N	860016	f	8b039847-250a-4c72-8e08-ccc641bd2842	vndms.dmc.gov.vn
6008	Thông số đo mưa	\N	0	RAIN	\N	\N	860017	f	a650b385-c91e-4197-addd-dd527001a8be	vndms.dmc.gov.vn
6009	Thông số đo mưa	\N	0	RAIN	\N	\N	860018	f	d08ce57e-abe5-495c-85d2-ed6330a5ec0d	vndms.dmc.gov.vn
6010	Thông số đo mưa	\N	0	RAIN	\N	\N	860019	f	e66b92e4-5789-472e-bcac-9c3cad06f2bb	vndms.dmc.gov.vn
6011	Thông số đo mưa	\N	0	RAIN	\N	\N	860020	f	d4abf55f-3051-49b8-b770-023939cafba7	vndms.dmc.gov.vn
6012	Thông số đo mưa	\N	0	RAIN	\N	\N	860021	f	e9802e37-328a-470f-9b3d-3a90eccc9679	vndms.dmc.gov.vn
6013	Thông số đo mưa	\N	0	RAIN	\N	\N	860022	f	eb7b3925-796f-4b3a-9f39-1143884852e7	vndms.dmc.gov.vn
6014	Thông số đo mưa	\N	0	RAIN	\N	\N	860023	f	984dd87e-aa63-45f5-8ecc-822858078dfd	vndms.dmc.gov.vn
6015	Thông số đo mưa	\N	0	RAIN	\N	\N	860024	f	9d5b6c0d-95da-4648-94c6-fb806e22501f	vndms.dmc.gov.vn
6016	Thông số đo mưa	\N	0	RAIN	\N	\N	860025	f	cbaa017a-1515-4cd6-8036-e12b1e28d83d	vndms.dmc.gov.vn
6017	Thông số đo mưa	\N	0	RAIN	\N	\N	860150	f	d02676ec-f0e1-4468-9149-036f966a6648	vndms.dmc.gov.vn
6018	Thông số đo mưa	\N	0	RAIN	\N	\N	861185	f	73d167a3-3673-47bc-a6f1-88f9bad6bdcc	vndms.dmc.gov.vn
6019	Thông số đo mưa	\N	0	RAIN	\N	\N	861851	f	3ce9000c-401c-48c3-ace7-6a1a5bbbd181	vndms.dmc.gov.vn
6020	Thông số đo mưa	\N	0	RAIN	\N	\N	86202 	f	ca2ed229-c915-4571-8f11-7fdf661ce263	vndms.dmc.gov.vn
6021	Thông số đo mưa	\N	0	RAIN	\N	\N	86209	f	51ad3d12-6f23-4ef2-9b36-440c8f2d91de	vndms.dmc.gov.vn
6022	Thông số đo mưa	\N	0	RAIN	\N	\N	862280	f	dbe3b580-854d-4434-a3a6-cfb5f6802e20	vndms.dmc.gov.vn
6023	Thông số đo mưa	\N	0	RAIN	\N	\N	862457	f	b516f463-acb5-4e17-8238-f2483c1c8c6a	vndms.dmc.gov.vn
6024	Thông số đo mưa	\N	0	RAIN	\N	\N	862854	f	a5695503-8198-4a2d-93ab-081b5e24c243	vndms.dmc.gov.vn
6025	Thông số đo mưa	\N	0	RAIN	\N	\N	863524	f	0a2217c6-3d25-4a9b-b7ff-bb403b4f2066	vndms.dmc.gov.vn
6026	Thông số đo mưa	\N	0	RAIN	\N	\N	863546	f	16d5b710-a64c-42d4-b6f7-38ce2e0e47ad	vndms.dmc.gov.vn
6027	Thông số đo mưa	\N	0	RAIN	\N	\N	863812	f	befb2d95-e06e-4b2f-80e5-b7702a5f45d9	vndms.dmc.gov.vn
6028	Thông số đo mưa	\N	0	RAIN	\N	\N	864510	f	e80ac953-14de-4870-a597-7b6047576608	vndms.dmc.gov.vn
6029	Thông số đo mưa	\N	0	RAIN	\N	\N	865706	f	7d605841-a219-4d57-a848-30daab3cc183	vndms.dmc.gov.vn
6030	Thông số đo mưa	\N	0	RAIN	\N	\N	866746	f	ef71cc63-32ec-48ac-9778-2e8a8ee1a938	vndms.dmc.gov.vn
6031	Thông số đo mưa	\N	0	RAIN	\N	\N	866957	f	f53d2a7f-b9d8-4627-a70e-71b459280479	vndms.dmc.gov.vn
6032	Thông số đo mưa	\N	0	RAIN	\N	\N	867426	f	29f7dcf0-28c2-4593-89ba-62fb3d41ecc9	vndms.dmc.gov.vn
6033	Thông số đo mưa	\N	0	RAIN	\N	\N	869071	f	58ef5fd9-830d-46e9-b16b-4eed7b0ba478	vndms.dmc.gov.vn
6034	Thông số đo mưa	\N	0	RAIN	\N	\N	869414	f	8aec4cff-7546-4fb2-aa38-217da5b9fc12	vndms.dmc.gov.vn
6035	Thông số đo mưa	\N	0	RAIN	\N	\N	870094	f	fa08d764-36c6-4db3-989f-87c6d3a6db2f	vndms.dmc.gov.vn
6036	Thông số đo mưa	\N	0	RAIN	\N	\N	870221	f	9557a353-b68b-45e7-8fb0-9a289bcf0d2b	vndms.dmc.gov.vn
6037	Thông số đo mưa	\N	0	RAIN	\N	\N	87063	f	3c02e979-57ed-49ba-9938-7f163e955cfa	vndms.dmc.gov.vn
6038	Thông số đo mưa	\N	0	RAIN	\N	\N	870657	f	475ee52c-a8d0-45e9-b7f7-1c4b34612c8d	vndms.dmc.gov.vn
6039	Thông số đo mưa	\N	0	RAIN	\N	\N	871154	f	9b2bbb13-383d-4f33-b203-ccc144c28678	vndms.dmc.gov.vn
6040	Thông số đo mưa	\N	0	RAIN	\N	\N	871247	f	ec71226d-1cc1-4b66-bcf4-06d301de9758	vndms.dmc.gov.vn
6041	Thông số đo mưa	\N	0	RAIN	\N	\N	871627	f	8b99ede6-8709-444f-897f-7be1a0e2f6b8	vndms.dmc.gov.vn
6042	Thông số đo mưa	\N	0	RAIN	\N	\N	872393	f	8792ca7c-baeb-4267-a6c3-1423e2c74a06	vndms.dmc.gov.vn
6043	Thông số đo mưa	\N	0	RAIN	\N	\N	872471	f	17e511a4-4624-4e53-912b-74971d190cee	vndms.dmc.gov.vn
6044	Thông số đo mưa	\N	0	RAIN	\N	\N	873110	f	dc5930fc-0698-4095-a7e1-94aabe315af4	vndms.dmc.gov.vn
6045	Thông số đo mưa	\N	0	RAIN	\N	\N	873308	f	755d4dfe-ea0a-4cc6-8a66-7276dd5e7a8b	vndms.dmc.gov.vn
6046	Thông số đo mưa	\N	0	RAIN	\N	\N	873321	f	264d13eb-c890-45f8-a94c-631aa7bbd41a	vndms.dmc.gov.vn
6047	Thông số đo mưa	\N	0	RAIN	\N	\N	873552	f	9809ca3d-1f79-43cd-a5f8-2f48f456e17e	vndms.dmc.gov.vn
6048	Thông số đo mưa	\N	0	RAIN	\N	\N	874341	f	df8e8e1e-0e8c-4af3-889e-cd3681e14a4a	vndms.dmc.gov.vn
6049	Thông số đo mưa	\N	0	RAIN	\N	\N	875090	f	e122b49c-e26c-4116-a460-e593681bda9b	vndms.dmc.gov.vn
6050	Thông số đo mưa	\N	0	RAIN	\N	\N	875112	f	74e95d8c-7e63-495d-92c5-416e72d087d2	vndms.dmc.gov.vn
6051	Thông số đo mưa	\N	0	RAIN	\N	\N	875223	f	a52d177e-fa6a-40b5-9ac8-4f61e21d8e4e	vndms.dmc.gov.vn
6052	Thông số đo mưa	\N	0	RAIN	\N	\N	875652	f	44b059b3-02db-4114-9ae0-50b969761675	vndms.dmc.gov.vn
6053	Thông số đo mưa	\N	0	RAIN	\N	\N	876928	f	527b2acf-b09f-4ca8-90fc-0baa8577d605	vndms.dmc.gov.vn
6054	Thông số đo mưa	\N	0	RAIN	\N	\N	877355	f	c00f3e6b-9369-49d3-b9a1-6dd7194c29d6	vndms.dmc.gov.vn
6055	Thông số đo mưa	\N	0	RAIN	\N	\N	877624	f	45328bbc-33c2-4391-80e7-0b0808df1faa	vndms.dmc.gov.vn
6056	Thông số đo mưa	\N	0	RAIN	\N	\N	877958	f	a2650b9f-5c0b-4219-8099-c360bcbfa440	vndms.dmc.gov.vn
6057	Thông số đo mưa	\N	0	RAIN	\N	\N	878074	f	88ecf34a-3b14-4ab5-b6e7-70530fb9768a	vndms.dmc.gov.vn
6058	Thông số đo mưa	\N	0	RAIN	\N	\N	880549	f	abb6a7ec-0e87-4138-aec4-52f29f2ffa58	vndms.dmc.gov.vn
6059	Thông số đo mưa	\N	0	RAIN	\N	\N	883430	f	d23aded3-76d6-4ee7-840b-85263b2e5194	vndms.dmc.gov.vn
6060	Thông số đo mưa	\N	0	RAIN	\N	\N	885437	f	47f3c5ad-2bd9-4cf5-a5c1-f911753a1bf7	vndms.dmc.gov.vn
6061	Thông số đo mưa	\N	0	RAIN	\N	\N	889437	f	fd90f613-3c3e-4aaa-9a43-826497d175f1	vndms.dmc.gov.vn
6062	Thông số đo mưa	\N	0	RAIN	\N	\N	890097	f	4daa2be1-acd5-4bc1-b799-80dad6b1070a	vndms.dmc.gov.vn
6063	Thông số đo mưa	\N	0	RAIN	\N	\N	890478	f	93ea4bc1-b5a7-474c-b544-f4d5c9b20c4b	vndms.dmc.gov.vn
6064	Thông số đo mưa	\N	0	RAIN	\N	\N	890494	f	bc4bdd32-f01e-4a4b-8408-14e766937b08	vndms.dmc.gov.vn
6065	Thông số đo mưa	\N	0	RAIN	\N	\N	890495	f	0285ee4f-747f-4697-b242-6e2649109357	vndms.dmc.gov.vn
6066	Thông số đo mưa	\N	0	RAIN	\N	\N	891069	f	f41d6363-5565-40b3-a031-b4ea0a93ef80	vndms.dmc.gov.vn
6067	Thông số đo mưa	\N	0	RAIN	\N	\N	891157	f	093adb5e-d037-4b2f-9fb8-ad49fde1f04d	vndms.dmc.gov.vn
6068	Thông số đo mưa	\N	0	RAIN	\N	\N	891596	f	0b511917-a392-4bae-a7bf-2d590a361431	vndms.dmc.gov.vn
6069	Thông số đo mưa	\N	0	RAIN	\N	\N	891958	f	c170017d-a147-4484-b6f9-1e13888981f8	vndms.dmc.gov.vn
6070	Thông số đo mưa	\N	0	RAIN	\N	\N	892063	f	b8cf7852-6958-4492-8665-60b329290c83	vndms.dmc.gov.vn
6071	Thông số đo mưa	\N	0	RAIN	\N	\N	892774	f	d7f1662b-fb16-45ec-8a84-4c1a59c1b1b4	vndms.dmc.gov.vn
6072	Thông số đo mưa	\N	0	RAIN	\N	\N	893025	f	33691dfd-99e8-4e8f-8c68-363dc05be1dd	vndms.dmc.gov.vn
6073	Thông số đo mưa	\N	0	RAIN	\N	\N	894561	f	438e476a-b205-4170-b461-9b5c7f54219f	vndms.dmc.gov.vn
6074	Thông số đo mưa	\N	0	RAIN	\N	\N	894608	f	9421c925-3b1c-4a3e-a979-df204693f1dd	vndms.dmc.gov.vn
6075	Thông số đo mưa	\N	0	RAIN	\N	\N	896510	f	d86b7a37-60ec-44de-ac00-9c57ace291d3	vndms.dmc.gov.vn
6076	Thông số đo mưa	\N	0	RAIN	\N	\N	896821	f	4b549881-cb84-4caa-b817-0d5793ab0881	vndms.dmc.gov.vn
6077	Thông số đo mưa	\N	0	RAIN	\N	\N	898573	f	fd77b8d1-b4bf-4b63-850c-83639c2382d8	vndms.dmc.gov.vn
6078	Thông số đo mưa	\N	0	RAIN	\N	\N	899450	f	931f7144-a196-4d3b-8428-4d9da4912b51	vndms.dmc.gov.vn
6079	Thông số đo mưa	\N	0	RAIN	\N	\N	900206	f	5602f444-f28f-4649-80b9-37cd49a8d4ab	vndms.dmc.gov.vn
6080	Thông số đo mưa	\N	0	RAIN	\N	\N	900526	f	998faef8-0797-4de5-94ef-5c324482e988	vndms.dmc.gov.vn
6081	Thông số đo mưa	\N	0	RAIN	\N	\N	901770	f	c515de06-8e66-4229-b387-266b33b5b8cf	vndms.dmc.gov.vn
6082	Thông số đo mưa	\N	0	RAIN	\N	\N	902907	f	78bba96c-c3c2-4187-a83c-9c8a125d25ce	vndms.dmc.gov.vn
6083	Thông số đo mưa	\N	0	RAIN	\N	\N	904075	f	f42fcd48-d4ad-4359-8ac6-c99c994914e2	vndms.dmc.gov.vn
6084	Thông số đo mưa	\N	0	RAIN	\N	\N	904201	f	8ed4a3d4-e756-479c-b113-0a4b7222c16b	vndms.dmc.gov.vn
6085	Thông số đo mưa	\N	0	RAIN	\N	\N	904892	f	a4b9acaf-ffc0-4ab6-a8a3-777f24afccd7	vndms.dmc.gov.vn
6086	Thông số đo mưa	\N	0	RAIN	\N	\N	905531	f	73db3716-2d65-4c91-9c42-67635037707d	vndms.dmc.gov.vn
6087	Thông số đo mưa	\N	0	RAIN	\N	\N	906195	f	4ac3418e-7b6f-4db4-8677-7d786a7a98b2	vndms.dmc.gov.vn
6088	Thông số đo mưa	\N	0	RAIN	\N	\N	906221	f	0caed846-aef0-4842-9d8a-0b7b9c09e4fd	vndms.dmc.gov.vn
6089	Thông số đo mưa	\N	0	RAIN	\N	\N	907327	f	b39e0834-7961-4806-941e-c6c63dd24e5b	vndms.dmc.gov.vn
6090	Thông số đo mưa	\N	0	RAIN	\N	\N	907769	f	a4cf1605-99cb-4a00-9612-8450309b7a5b	vndms.dmc.gov.vn
6091	Thông số đo mưa	\N	0	RAIN	\N	\N	908565	f	b7570d91-7d64-4681-aa7a-f9ef02f0eda6	vndms.dmc.gov.vn
6092	Thông số đo mưa	\N	0	RAIN	\N	\N	908685	f	d2d47800-73e9-4b39-9ba1-61c7bcb0f771	vndms.dmc.gov.vn
6093	Thông số đo mưa	\N	0	RAIN	\N	\N	909143	f	ad323bf9-b005-4856-8dc8-06ec7470a099	vndms.dmc.gov.vn
6094	Thông số đo mưa	\N	0	RAIN	\N	\N	909419	f	2923bbda-12d0-4153-bd7b-910240435a30	vndms.dmc.gov.vn
6095	Thông số đo mưa	\N	0	RAIN	\N	\N	910683	f	d2729867-4d3b-442f-aa55-7fabceb841e7	vndms.dmc.gov.vn
6096	Thông số đo mưa	\N	0	RAIN	\N	\N	910782	f	ddeca4ea-7cee-41b9-8fb6-c3789b1614e2	vndms.dmc.gov.vn
6097	Thông số đo mưa	\N	0	RAIN	\N	\N	911064	f	4465349b-26f1-4bf4-b43b-bc66eb785a5f	vndms.dmc.gov.vn
6098	Thông số đo mưa	\N	0	RAIN	\N	\N	911484	f	0cabbc99-caef-40d6-8a7f-9310e7e59e24	vndms.dmc.gov.vn
6099	Thông số đo mưa	\N	0	RAIN	\N	\N	911493	f	42649034-f701-4dfe-a481-fb80f338d59f	vndms.dmc.gov.vn
6100	Thông số đo mưa	\N	0	RAIN	\N	\N	91173 	f	a5f133c3-d418-4208-bea3-8ab16d358b8d	vndms.dmc.gov.vn
6101	Thông số đo mưa	\N	0	RAIN	\N	\N	91209 	f	47127faa-4497-48dc-a25b-72cb6fd6fe5d	vndms.dmc.gov.vn
6102	Thông số đo mưa	\N	0	RAIN	\N	\N	91300	f	77163f44-8340-4262-a560-220c30b4efc6	vndms.dmc.gov.vn
6103	Thông số đo mưa	\N	0	RAIN	\N	\N	91301	f	b977de73-9434-4bd5-97cb-e48e74400db4	vndms.dmc.gov.vn
6104	Thông số đo mưa	\N	0	RAIN	\N	\N	91303	f	1bfbd62f-e93d-448f-847d-810e4f53a8d3	vndms.dmc.gov.vn
6105	Thông số đo mưa	\N	0	RAIN	\N	\N	91305 	f	d63d9312-801d-4d03-83c1-985e53c1a19d	vndms.dmc.gov.vn
6106	Thông số đo mưa	\N	0	RAIN	\N	\N	91318 	f	4e746812-5c49-4843-9c35-f378307d9656	vndms.dmc.gov.vn
6107	Thông số đo mưa	\N	0	RAIN	\N	\N	91324	f	12cb1128-8ceb-47d4-a1fa-6239762c6bf3	vndms.dmc.gov.vn
6108	Thông số đo mưa	\N	0	RAIN	\N	\N	91336	f	9ebc37ac-0f6b-450c-92e8-fc3a5dc77889	vndms.dmc.gov.vn
6109	Thông số đo mưa	\N	0	RAIN	\N	\N	91337	f	f88adef7-65cb-490a-8356-6862c9321754	vndms.dmc.gov.vn
6110	Thông số đo mưa	\N	0	RAIN	\N	\N	91339	f	0d44f7f0-8a97-4f8a-a830-77dc79e0b7b7	vndms.dmc.gov.vn
6111	Thông số đo mưa	\N	0	RAIN	\N	\N	915262	f	0e8aaa5a-4b8d-4aa2-a599-f021dce93c50	vndms.dmc.gov.vn
6112	Thông số đo mưa	\N	0	RAIN	\N	\N	916047	f	1e5799bb-fb45-40b1-ae82-cba734d26551	vndms.dmc.gov.vn
6113	Thông số đo mưa	\N	0	RAIN	\N	\N	916792	f	43bf76ba-5fad-417c-a664-5560651f4ccc	vndms.dmc.gov.vn
6114	Thông số đo mưa	\N	0	RAIN	\N	\N	917458	f	8df5153e-0c2c-473e-acb5-3dd9d93283f4	vndms.dmc.gov.vn
6115	Thông số đo mưa	\N	0	RAIN	\N	\N	917814	f	f2d5df59-7c55-47cd-beab-a8e1e0f5aca8	vndms.dmc.gov.vn
6116	Thông số đo mưa	\N	0	RAIN	\N	\N	918892	f	67ff4831-d583-4829-9742-afdd70e9c16d	vndms.dmc.gov.vn
6117	Thông số đo mưa	\N	0	RAIN	\N	\N	919057	f	71cfb194-e345-444b-89b1-d29ef1dd1632	vndms.dmc.gov.vn
6118	Thông số đo mưa	\N	0	RAIN	\N	\N	920001	f	afa8f402-b6b2-43a7-b41e-d1bda7c09fa9	vndms.dmc.gov.vn
6119	Thông số đo mưa	\N	0	RAIN	\N	\N	920002	f	fd8401be-3a8b-4a6d-8e40-4ae6e4598ab0	vndms.dmc.gov.vn
6120	Thông số đo mưa	\N	0	RAIN	\N	\N	920003	f	4b9cfe98-b3aa-4d2d-a952-53c47e9a59d8	vndms.dmc.gov.vn
6121	Thông số đo mưa	\N	0	RAIN	\N	\N	920004	f	b2be7ed4-8f95-43e9-b910-3babfbc92fc5	vndms.dmc.gov.vn
6122	Thông số đo mưa	\N	0	RAIN	\N	\N	920005	f	9257aba1-e46b-4998-8e1c-b98b3cb978be	vndms.dmc.gov.vn
6123	Thông số đo mưa	\N	0	RAIN	\N	\N	920006	f	7dd57d97-9603-4a05-8806-8477388b82fd	vndms.dmc.gov.vn
6124	Thông số đo mưa	\N	0	RAIN	\N	\N	920007	f	1c78df4c-07bd-4573-805e-747b4d1b9317	vndms.dmc.gov.vn
6125	Thông số đo mưa	\N	0	RAIN	\N	\N	920008	f	ac20b598-16cb-4dd8-9f2a-f96ca51ce41d	vndms.dmc.gov.vn
6126	Thông số đo mưa	\N	0	RAIN	\N	\N	920009	f	043ab608-6c87-4683-a0aa-938aaa21e3b4	vndms.dmc.gov.vn
6127	Thông số đo mưa	\N	0	RAIN	\N	\N	920010	f	3eaad4a2-d008-4889-a870-7b307051f91e	vndms.dmc.gov.vn
6128	Thông số đo mưa	\N	0	RAIN	\N	\N	920011	f	a18e5218-0549-4ed8-9351-6e0d690bcb98	vndms.dmc.gov.vn
6129	Thông số đo mưa	\N	0	RAIN	\N	\N	920012	f	4236c163-7fc1-447a-a8cb-71ef5e20718b	vndms.dmc.gov.vn
6130	Thông số đo mưa	\N	0	RAIN	\N	\N	920021	f	b446e34e-9124-4968-b1a5-e0ccf0ff583e	vndms.dmc.gov.vn
6131	Thông số đo mưa	\N	0	RAIN	\N	\N	920022	f	77ed6da1-5973-441d-baf7-2f3e6d7e8538	vndms.dmc.gov.vn
6132	Thông số đo mưa	\N	0	RAIN	\N	\N	920023	f	acbe30d0-7ee9-4dfa-8f3a-a0a670775778	vndms.dmc.gov.vn
6133	Thông số đo mưa	\N	0	RAIN	\N	\N	920024	f	edd7981b-0427-4e7f-acf2-8a7a51dd51e3	vndms.dmc.gov.vn
6134	Thông số đo mưa	\N	0	RAIN	\N	\N	920025	f	64f4f811-2901-4644-8a54-f74d005d7b24	vndms.dmc.gov.vn
6135	Thông số đo mưa	\N	0	RAIN	\N	\N	920026	f	abb01130-b297-44d3-81a9-1a3ee07cb4c7	vndms.dmc.gov.vn
6136	Thông số đo mưa	\N	0	RAIN	\N	\N	920027	f	a90025fb-f1c4-476d-a224-4bffd358d127	vndms.dmc.gov.vn
6137	Thông số đo mưa	\N	0	RAIN	\N	\N	920028	f	c27d32ff-8e24-47fb-9b56-4339bdfda2d3	vndms.dmc.gov.vn
6138	Thông số đo mưa	\N	0	RAIN	\N	\N	920029	f	85a3443d-cd32-4325-aa8c-1dee20308c84	vndms.dmc.gov.vn
6139	Thông số đo mưa	\N	0	RAIN	\N	\N	920030	f	b8ad698a-436d-4b3b-92d9-65b0161f5666	vndms.dmc.gov.vn
6140	Thông số đo mưa	\N	0	RAIN	\N	\N	920031	f	0a4b442b-b2e4-4aad-9e8e-5fc8e054bdd9	vndms.dmc.gov.vn
6141	Thông số đo mưa	\N	0	RAIN	\N	\N	92042	f	3295b902-588b-4834-b860-f7c0ccafc932	vndms.dmc.gov.vn
6142	Thông số đo mưa	\N	0	RAIN	\N	\N	920760	f	68863f17-7001-4d11-ac60-b88b104b1d83	vndms.dmc.gov.vn
6143	Thông số đo mưa	\N	0	RAIN	\N	\N	921124	f	3fe70c80-39ea-4bfb-a3be-a9dcf517d397	vndms.dmc.gov.vn
6144	Thông số đo mưa	\N	0	RAIN	\N	\N	921125	f	4d56560e-6167-40ad-af14-887f9edaa57c	vndms.dmc.gov.vn
6145	Thông số đo mưa	\N	0	RAIN	\N	\N	921782	f	ee349d3a-d554-488b-bd04-12927ef4bf65	vndms.dmc.gov.vn
6146	Thông số đo mưa	\N	0	RAIN	\N	\N	922927	f	647a964b-ac39-4990-8576-a5dfdb47200a	vndms.dmc.gov.vn
6147	Thông số đo mưa	\N	0	RAIN	\N	\N	923191	f	99d64d59-5e3d-4b5f-b815-e069cdaeba91	vndms.dmc.gov.vn
6148	Thông số đo mưa	\N	0	RAIN	\N	\N	92413	f	a8677e41-8056-4872-be32-ae297d25abc2	vndms.dmc.gov.vn
6149	Thông số đo mưa	\N	0	RAIN	\N	\N	924700	f	069d4f9c-1895-49ff-86b9-645ac77ea409	vndms.dmc.gov.vn
6150	Thông số đo mưa	\N	0	RAIN	\N	\N	924774	f	44cf6c00-56c0-44c9-8836-22f510cbd985	vndms.dmc.gov.vn
6151	Thông số đo mưa	\N	0	RAIN	\N	\N	925721	f	b1ff138a-9891-4a17-bf53-56ff4df42560	vndms.dmc.gov.vn
6152	Thông số đo mưa	\N	0	RAIN	\N	\N	927297	f	c65ad9fc-3c35-455b-a3ad-dc2b1ae6f022	vndms.dmc.gov.vn
6153	Thông số đo mưa	\N	0	RAIN	\N	\N	927364	f	ca4d4596-0727-47b3-9ed3-42262dddb327	vndms.dmc.gov.vn
6154	Thông số đo mưa	\N	0	RAIN	\N	\N	928953	f	16d214c3-f1f4-434c-a9fb-45c30e87f96e	vndms.dmc.gov.vn
6155	Thông số đo mưa	\N	0	RAIN	\N	\N	929405	f	7c69aec3-5015-4868-8974-aec3b02bee6d	vndms.dmc.gov.vn
6156	Thông số đo mưa	\N	0	RAIN	\N	\N	930001	f	5f8fddc5-8d3b-4e06-80d8-4def7171a344	vndms.dmc.gov.vn
6157	Thông số đo mưa	\N	0	RAIN	\N	\N	930002	f	cc31bb24-cf08-4d94-bd00-7717ea2074ec	vndms.dmc.gov.vn
6158	Thông số đo mưa	\N	0	RAIN	\N	\N	930003	f	1d5080dc-41c0-403b-bb4a-b431be61dec1	vndms.dmc.gov.vn
6159	Thông số đo mưa	\N	0	RAIN	\N	\N	930004	f	dd1261f5-41de-4dbe-8205-d2c571e1fcfa	vndms.dmc.gov.vn
6160	Thông số đo mưa	\N	0	RAIN	\N	\N	930005	f	d61c8e1e-c3de-4524-8cb7-bc2f3fc1d607	vndms.dmc.gov.vn
6161	Thông số đo mưa	\N	0	RAIN	\N	\N	930006	f	9c09b050-4849-454e-94fa-32b8ba909c22	vndms.dmc.gov.vn
6162	Thông số đo mưa	\N	0	RAIN	\N	\N	930007	f	08dd37d4-0410-4c29-985b-20bf4a1fb48d	vndms.dmc.gov.vn
6163	Thông số đo mưa	\N	0	RAIN	\N	\N	930008	f	f86ded9c-60ae-4fa2-961d-4094ba975452	vndms.dmc.gov.vn
6164	Thông số đo mưa	\N	0	RAIN	\N	\N	930009	f	0aefd9c0-e64e-40ff-a61e-60e072255967	vndms.dmc.gov.vn
6165	Thông số đo mưa	\N	0	RAIN	\N	\N	930010	f	950065d0-4579-4a57-b20e-6d5e1464732f	vndms.dmc.gov.vn
6166	Thông số đo mưa	\N	0	RAIN	\N	\N	931794	f	e76848dd-0f68-4833-98c9-51477f60af30	vndms.dmc.gov.vn
6167	Thông số đo mưa	\N	0	RAIN	\N	\N	931918	f	b6c8fc4f-6fc2-4f92-a892-eb5ddc1281b8	vndms.dmc.gov.vn
6168	Thông số đo mưa	\N	0	RAIN	\N	\N	934809	f	9f6023fb-2f2d-4f67-9986-50946673fcca	vndms.dmc.gov.vn
6169	Thông số đo mưa	\N	0	RAIN	\N	\N	935170	f	716d5977-5797-4325-b94e-80b5b4b66da0	vndms.dmc.gov.vn
6170	Thông số đo mưa	\N	0	RAIN	\N	\N	935730	f	79b237d8-310d-47fa-8c0e-ba93465672d0	vndms.dmc.gov.vn
6171	Thông số đo mưa	\N	0	RAIN	\N	\N	935740	f	bc6ab39c-837e-4c83-8b09-22ffec356a65	vndms.dmc.gov.vn
6172	Thông số đo mưa	\N	0	RAIN	\N	\N	936030	f	8fa6080b-9fc4-418e-aebd-1accb01f2b56	vndms.dmc.gov.vn
6173	Thông số đo mưa	\N	0	RAIN	\N	\N	937617	f	eaa0c9c0-e87f-4320-9e9e-4d6ec90b68b0	vndms.dmc.gov.vn
6174	Thông số đo mưa	\N	0	RAIN	\N	\N	938441	f	5843bf95-f3d1-40f2-a1a9-c298478e1fdc	vndms.dmc.gov.vn
6175	Thông số đo mưa	\N	0	RAIN	\N	\N	939248	f	602b002d-7b2c-43b1-ad23-d3755da64c7f	vndms.dmc.gov.vn
6176	Thông số đo mưa	\N	0	RAIN	\N	\N	940001	f	2b8ae8ab-ecf2-4494-8b26-358d76f5e16b	vndms.dmc.gov.vn
6177	Thông số đo mưa	\N	0	RAIN	\N	\N	940002	f	dd4f3ca8-5705-453e-bfad-42da83e76dd5	vndms.dmc.gov.vn
6178	Thông số đo mưa	\N	0	RAIN	\N	\N	940003	f	7d7622e6-d0b6-4c9e-aa2c-93e70f8156a5	vndms.dmc.gov.vn
6179	Thông số đo mưa	\N	0	RAIN	\N	\N	940004	f	3dca4ca0-57ab-4474-b834-449b9cc99c87	vndms.dmc.gov.vn
6180	Thông số đo mưa	\N	0	RAIN	\N	\N	940005	f	ae740380-279e-44f6-9b0e-18fd295165aa	vndms.dmc.gov.vn
6181	Thông số đo mưa	\N	0	RAIN	\N	\N	940006	f	f9599e6e-f1c0-406b-b468-6a23ef1a2dfc	vndms.dmc.gov.vn
6182	Thông số đo mưa	\N	0	RAIN	\N	\N	940007	f	e4d9dc36-15f9-47bb-a04a-9fca1facff84	vndms.dmc.gov.vn
6183	Thông số đo mưa	\N	0	RAIN	\N	\N	940008	f	041200bc-9bf0-46ec-9682-cb7363cfe7d7	vndms.dmc.gov.vn
6184	Thông số đo mưa	\N	0	RAIN	\N	\N	940009	f	a8f48993-8f69-4474-a0a1-c6b9e798dd4a	vndms.dmc.gov.vn
6185	Thông số đo mưa	\N	0	RAIN	\N	\N	940010	f	f8920eb0-7d09-4585-8113-5962b65d756e	vndms.dmc.gov.vn
6186	Thông số đo mưa	\N	0	RAIN	\N	\N	940011	f	39320666-ff3c-46b7-9e9a-02f43ba1ae58	vndms.dmc.gov.vn
6187	Thông số đo mưa	\N	0	RAIN	\N	\N	940012	f	22bce102-195e-4d88-b40f-a0ea5c16c3eb	vndms.dmc.gov.vn
6188	Thông số đo mưa	\N	0	RAIN	\N	\N	940013	f	a25d60a1-1013-462c-bc52-322d4d47552b	vndms.dmc.gov.vn
6189	Thông số đo mưa	\N	0	RAIN	\N	\N	940014	f	72a88562-1175-4a76-989d-d68eccb78828	vndms.dmc.gov.vn
6190	Thông số đo mưa	\N	0	RAIN	\N	\N	940015	f	36a5dac5-ed55-4ea0-a250-74811415012a	vndms.dmc.gov.vn
6191	Thông số đo mưa	\N	0	RAIN	\N	\N	940153	f	d8e1d410-a824-4506-a7de-32c7831c474c	vndms.dmc.gov.vn
6192	Thông số đo mưa	\N	0	RAIN	\N	\N	941376	f	f47f51df-d115-4524-a625-9ba2b7fc98b0	vndms.dmc.gov.vn
6193	Thông số đo mưa	\N	0	RAIN	\N	\N	942514	f	d6c19f68-7d89-4a6d-94c4-5a2172ee33b5	vndms.dmc.gov.vn
6194	Thông số đo mưa	\N	0	RAIN	\N	\N	944957	f	d82dc83c-28b9-42b9-9df6-9505fecdc25f	vndms.dmc.gov.vn
6195	Thông số đo mưa	\N	0	RAIN	\N	\N	947732	f	58df6a90-e2d5-48d4-9463-ad1574487a97	vndms.dmc.gov.vn
6196	Thông số đo mưa	\N	0	RAIN	\N	\N	949501	f	1e048ee4-dc76-4de0-a29e-359fad1c8b4a	vndms.dmc.gov.vn
6197	Thông số đo mưa	\N	0	RAIN	\N	\N	950001	f	2c264bd5-f7a9-4d07-ab97-40d1b18aa096	vndms.dmc.gov.vn
6198	Thông số đo mưa	\N	0	RAIN	\N	\N	950002	f	40302491-97ef-4791-9348-3f1ccae2c34d	vndms.dmc.gov.vn
6199	Thông số đo mưa	\N	0	RAIN	\N	\N	950003	f	6dcfe158-269b-4310-8a95-9eba22555e56	vndms.dmc.gov.vn
6200	Thông số đo mưa	\N	0	RAIN	\N	\N	950004	f	24e01b8f-e71c-4d93-9bae-377c0894d366	vndms.dmc.gov.vn
6201	Thông số đo mưa	\N	0	RAIN	\N	\N	950005	f	39b908f2-9cfe-470d-85e6-193105664955	vndms.dmc.gov.vn
6202	Thông số đo mưa	\N	0	RAIN	\N	\N	950006	f	2b25c510-a82c-4b96-9add-a69fdb9ce6a4	vndms.dmc.gov.vn
6203	Thông số đo mưa	\N	0	RAIN	\N	\N	950007	f	15231e48-2a4b-46d3-9cc4-bda2d537dee0	vndms.dmc.gov.vn
6204	Thông số đo mưa	\N	0	RAIN	\N	\N	950008	f	a663cd72-69ae-4a0b-80a8-bd8588fe7af8	vndms.dmc.gov.vn
6205	Thông số đo mưa	\N	0	RAIN	\N	\N	950009	f	7415d580-142f-41a7-a262-b75c9e320460	vndms.dmc.gov.vn
6206	Thông số đo mưa	\N	0	RAIN	\N	\N	950010	f	c0df7e14-af68-411f-9d15-563689a9769c	vndms.dmc.gov.vn
6207	Thông số đo mưa	\N	0	RAIN	\N	\N	950011	f	e84cf4ae-476c-4b60-8e33-4e65a5696696	vndms.dmc.gov.vn
6208	Thông số đo mưa	\N	0	RAIN	\N	\N	950012	f	78288ca2-a01a-471f-9e49-c1db7e9e52ae	vndms.dmc.gov.vn
6209	Thông số đo mưa	\N	0	RAIN	\N	\N	950013	f	ec1c9d43-6198-438e-96e2-1673b0a306d4	vndms.dmc.gov.vn
6210	Thông số đo mưa	\N	0	RAIN	\N	\N	950014	f	037647e6-ecbd-4b52-8642-c9021c3c1e8e	vndms.dmc.gov.vn
6211	Thông số đo mưa	\N	0	RAIN	\N	\N	950015	f	ff29168c-a406-4632-b8bb-367dff72ea0c	vndms.dmc.gov.vn
6212	Thông số đo mưa	\N	0	RAIN	\N	\N	950016	f	05d02829-9a9a-41d0-9681-ee5bdb209d53	vndms.dmc.gov.vn
6213	Thông số đo mưa	\N	0	RAIN	\N	\N	950017	f	6d60efb5-dd63-4840-b295-440fe8582394	vndms.dmc.gov.vn
6214	Thông số đo mưa	\N	0	RAIN	\N	\N	950018	f	9f32e63c-f06f-4ebf-815c-9b719f12066b	vndms.dmc.gov.vn
6215	Thông số đo mưa	\N	0	RAIN	\N	\N	950019	f	8e90982a-f688-46b0-b7f4-797d3d3d9df5	vndms.dmc.gov.vn
6216	Thông số đo mưa	\N	0	RAIN	\N	\N	950020	f	0248fd95-4db2-4de8-9457-2f3491714268	vndms.dmc.gov.vn
6217	Thông số đo mưa	\N	0	RAIN	\N	\N	950074	f	811c0fc4-4ae8-47cd-8b03-c2331e788484	vndms.dmc.gov.vn
6218	Thông số đo mưa	\N	0	RAIN	\N	\N	950485	f	3b6af068-0664-4883-b7be-aa39a3d32ae7	vndms.dmc.gov.vn
6219	Thông số đo mưa	\N	0	RAIN	\N	\N	950591	f	3fcb3921-fdc3-46db-83b9-0195ebfeb0a8	vndms.dmc.gov.vn
6220	Thông số đo mưa	\N	0	RAIN	\N	\N	951080	f	a7c49595-8843-47cd-a0ae-5c6caab65fba	vndms.dmc.gov.vn
6221	Thông số đo mưa	\N	0	RAIN	\N	\N	951316	f	4bca3df0-c374-41ab-9627-f894f46790dd	vndms.dmc.gov.vn
6222	Thông số đo mưa	\N	0	RAIN	\N	\N	951684	f	f63c8caf-8a1b-43f3-8860-6a199f49ad54	vndms.dmc.gov.vn
6223	Thông số đo mưa	\N	0	RAIN	\N	\N	951738	f	d78a8a8e-f07c-4265-a83a-8a5fd23323b4	vndms.dmc.gov.vn
6224	Thông số đo mưa	\N	0	RAIN	\N	\N	953419	f	2c022ef5-1878-4463-81b5-a4e452f90a8e	vndms.dmc.gov.vn
6225	Thông số đo mưa	\N	0	RAIN	\N	\N	953782	f	4ee75807-2cc6-4ae4-ba1b-0be96e93e9ec	vndms.dmc.gov.vn
6226	Thông số đo mưa	\N	0	RAIN	\N	\N	954252	f	3a57fd24-35a1-4fda-a3ea-a55c99bc4d7f	vndms.dmc.gov.vn
6227	Thông số đo mưa	\N	0	RAIN	\N	\N	954544	f	25937e91-2349-414d-a394-b62338737bb6	vndms.dmc.gov.vn
6228	Thông số đo mưa	\N	0	RAIN	\N	\N	954638	f	f884bd8b-8480-44fe-a80c-e497a87cbcef	vndms.dmc.gov.vn
6229	Thông số đo mưa	\N	0	RAIN	\N	\N	956409	f	bb6b4281-b151-4b69-8aec-6373b7822d47	vndms.dmc.gov.vn
6230	Thông số đo mưa	\N	0	RAIN	\N	\N	957055	f	60b517a8-682f-4cef-ba3d-44f78d66aa38	vndms.dmc.gov.vn
6231	Thông số đo mưa	\N	0	RAIN	\N	\N	957752	f	519fded6-4ccc-4f48-857a-b4ae5d386383	vndms.dmc.gov.vn
6232	Thông số đo mưa	\N	0	RAIN	\N	\N	958011	f	97845929-e1b4-4298-b2ab-20df664657a1	vndms.dmc.gov.vn
6233	Thông số đo mưa	\N	0	RAIN	\N	\N	958431	f	ef51320a-210d-4387-8816-6cffb89845c6	vndms.dmc.gov.vn
6234	Thông số đo mưa	\N	0	RAIN	\N	\N	958573	f	ba42e83e-20d1-4a6d-807b-8b05856da65a	vndms.dmc.gov.vn
6235	Thông số đo mưa	\N	0	RAIN	\N	\N	959428	f	caebd2c2-455f-4b4c-9ac8-aae84c3a75fe	vndms.dmc.gov.vn
6236	Thông số đo mưa	\N	0	RAIN	\N	\N	960041	f	c7cbc940-adc4-4125-a8e4-41ea4b0b87a2	vndms.dmc.gov.vn
6237	Thông số đo mưa	\N	0	RAIN	\N	\N	960753	f	d930edeb-e4d2-4ae4-afe8-f601270db2cd	vndms.dmc.gov.vn
6238	Thông số đo mưa	\N	0	RAIN	\N	\N	961184	f	48d48f82-1318-4e90-8128-de1745476220	vndms.dmc.gov.vn
6239	Thông số đo mưa	\N	0	RAIN	\N	\N	962724	f	fba835f6-4080-4932-b637-c82da1e42d02	vndms.dmc.gov.vn
6240	Thông số đo mưa	\N	0	RAIN	\N	\N	962874	f	f14f62cf-5ec0-4edc-b639-cdaf0b8162a9	vndms.dmc.gov.vn
6241	Thông số đo mưa	\N	0	RAIN	\N	\N	96353	f	fe1d4a5a-7910-4981-9fe8-221a1936196b	vndms.dmc.gov.vn
6242	Thông số đo mưa	\N	0	RAIN	\N	\N	964990	f	4bbd8a77-d2d3-4f4c-9c36-83fdd3315a41	vndms.dmc.gov.vn
6243	Thông số đo mưa	\N	0	RAIN	\N	\N	965118	f	69ae8eea-82f7-43b2-a823-e8890f17a444	vndms.dmc.gov.vn
6244	Thông số đo mưa	\N	0	RAIN	\N	\N	965510	f	f56473aa-6fca-4cee-835e-7d2cd08d7950	vndms.dmc.gov.vn
6245	Thông số đo mưa	\N	0	RAIN	\N	\N	965884	f	06cb7fd3-7118-4ce2-b277-656ee5663aa4	vndms.dmc.gov.vn
6246	Thông số đo mưa	\N	0	RAIN	\N	\N	967641	f	d090562f-1f8f-4159-86f0-461b7a2310ea	vndms.dmc.gov.vn
6247	Thông số đo mưa	\N	0	RAIN	\N	\N	968206	f	68423673-6af4-42fc-ba20-7e2bae940c79	vndms.dmc.gov.vn
6248	Thông số đo mưa	\N	0	RAIN	\N	\N	968713	f	f54bbfe5-d572-4bd0-9ba2-ebf3686544c6	vndms.dmc.gov.vn
6249	Thông số đo mưa	\N	0	RAIN	\N	\N	969227	f	52f5707e-4287-4a13-a8cc-b189cc38d9c8	vndms.dmc.gov.vn
6250	Thông số đo mưa	\N	0	RAIN	\N	\N	969703	f	b43cc25a-60e2-4c74-a042-2b2b13fb7c76	vndms.dmc.gov.vn
6251	Thông số đo mưa	\N	0	RAIN	\N	\N	970001	f	5a287a7d-2c35-43b7-b9f4-e6bd674ecd53	vndms.dmc.gov.vn
6252	Thông số đo mưa	\N	0	RAIN	\N	\N	970036	f	2cd826c6-2c20-40bb-bd24-f88c0582b7bc	vndms.dmc.gov.vn
6253	Thông số đo mưa	\N	0	RAIN	\N	\N	970203	f	29c1b80b-0a34-44db-99c4-4fc55f4c9895	vndms.dmc.gov.vn
6254	Thông số đo mưa	\N	0	RAIN	\N	\N	970315	f	81135949-f56a-4be1-8a27-301ac808d5cb	vndms.dmc.gov.vn
6255	Thông số đo mưa	\N	0	RAIN	\N	\N	970807	f	8040ffaa-1b01-4ba6-8ac5-38583addabf4	vndms.dmc.gov.vn
6256	Thông số đo mưa	\N	0	RAIN	\N	\N	971817	f	bbc09e04-b133-42da-893c-c0bd13e81b6c	vndms.dmc.gov.vn
6257	Thông số đo mưa	\N	0	RAIN	\N	\N	972116	f	de792fdb-af66-4894-a3be-a99c27bbb885	vndms.dmc.gov.vn
6258	Thông số đo mưa	\N	0	RAIN	\N	\N	9734	f	73183158-9133-49ac-ba37-b1436f190d64	vndms.dmc.gov.vn
6259	Thông số đo mưa	\N	0	RAIN	\N	\N	973935	f	f9f39a7a-17f6-4817-9052-f573d55129ff	vndms.dmc.gov.vn
6260	Thông số đo mưa	\N	0	RAIN	\N	\N	974046	f	5ead0750-954d-4e0b-b3ca-243540d0c673	vndms.dmc.gov.vn
6261	Thông số đo mưa	\N	0	RAIN	\N	\N	976037	f	6d93ef90-d74b-44f9-b187-3ab185ca9218	vndms.dmc.gov.vn
6262	Thông số đo mưa	\N	0	RAIN	\N	\N	976395	f	42f78eb9-fe5f-40f4-a9b5-ca756e2a6bd5	vndms.dmc.gov.vn
6263	Thông số đo mưa	\N	0	RAIN	\N	\N	976416	f	a935d740-c788-41cc-9af4-072c78ba1b90	vndms.dmc.gov.vn
6264	Thông số đo mưa	\N	0	RAIN	\N	\N	977834	f	94780f66-7ed9-476c-ad8e-bd9b92b9097d	vndms.dmc.gov.vn
6265	Thông số đo mưa	\N	0	RAIN	\N	\N	979054	f	fcd8b51f-78e1-43c2-994a-d21dcc20cdcc	vndms.dmc.gov.vn
6266	Thông số đo mưa	\N	0	RAIN	\N	\N	981364	f	afa53deb-03ea-410f-ac7d-4295ca8626ef	vndms.dmc.gov.vn
6267	Thông số đo mưa	\N	0	RAIN	\N	\N	982709	f	b91c48e4-63d9-40da-873d-f20b3cc85f8b	vndms.dmc.gov.vn
6268	Thông số đo mưa	\N	0	RAIN	\N	\N	982710	f	6968bf1a-aa61-4669-89a8-660c05213696	vndms.dmc.gov.vn
6269	Thông số đo mưa	\N	0	RAIN	\N	\N	982717	f	929ab970-f89c-4e85-9b43-8d08bc7310ce	vndms.dmc.gov.vn
6270	Thông số đo mưa	\N	0	RAIN	\N	\N	982720	f	3763f356-9813-43c6-9542-6a08ea5155df	vndms.dmc.gov.vn
6271	Thông số đo mưa	\N	0	RAIN	\N	\N	982965	f	dee100aa-1a9e-496f-8153-ac113fcf73ac	vndms.dmc.gov.vn
6272	Thông số đo mưa	\N	0	RAIN	\N	\N	985849	f	9b9a1bff-9ee9-4465-bce9-095aa50b44ff	vndms.dmc.gov.vn
6273	Thông số đo mưa	\N	0	RAIN	\N	\N	986042	f	332001bf-591a-4b97-a457-8f3a050ce6ca	vndms.dmc.gov.vn
6274	Thông số đo mưa	\N	0	RAIN	\N	\N	989543	f	320d30d0-5cfd-4cfd-a812-4f99173d0c19	vndms.dmc.gov.vn
6275	Thông số đo mưa	\N	0	RAIN	\N	\N	990458	f	716d392a-d836-44a6-9b94-91f23ca95863	vndms.dmc.gov.vn
6276	Thông số đo mưa	\N	0	RAIN	\N	\N	993132	f	46f10abf-da56-4037-b149-9bf66ead0fa3	vndms.dmc.gov.vn
6277	Thông số đo mưa	\N	0	RAIN	\N	\N	993501	f	01706909-5574-4392-ad60-8b992555c457	vndms.dmc.gov.vn
6278	Thông số đo mưa	\N	0	RAIN	\N	\N	994631	f	6df6be45-ea62-45f9-b008-608071aeefd1	vndms.dmc.gov.vn
6279	Thông số đo mưa	\N	0	RAIN	\N	\N	996206	f	7d515d3d-7ef8-424d-b6c8-60c54cf3cc8a	vndms.dmc.gov.vn
6280	Thông số đo mưa	\N	0	RAIN	\N	\N	997906	f	b04655b6-895b-4cd3-9c00-5470141e5d4e	vndms.dmc.gov.vn
6281	Thông số đo mưa	\N	0	RAIN	\N	\N	48806	f	49475800-8427-4f0b-9005-a9ea0eb5cff3	vndms.dmc.gov.vn
6282	Thông số đo mưa	\N	0	RAIN	\N	\N	48884	f	71300a92-bda0-4d73-8703-b0f2da545b46	vndms.dmc.gov.vn
6283	Thông số đo mưa	\N	0	RAIN	\N	\N	48868	f	3bf3e429-4906-4e74-8d62-1f301de68e3d	vndms.dmc.gov.vn
6284	Thông số đo mưa	\N	0	RAIN	\N	\N	48/43	f	a4878700-cbf8-4168-b2fd-255a13ba4c99	vndms.dmc.gov.vn
6285	Thông số đo mưa	\N	0	RAIN	\N	\N	48912	f	1766960b-5fa8-4d5e-aae5-617248e8ed80	vndms.dmc.gov.vn
6286	Thông số đo mưa	\N	0	RAIN	\N	\N	66764	f	cc08c9e8-92b4-4f92-a400-a2a2c75bcfed	vndms.dmc.gov.vn
6287	Thông số đo mưa	\N	0	RAIN	\N	\N	71707	f	99936571-3b1a-4c4a-a541-5fd6eabbf92f	vndms.dmc.gov.vn
6288	Thông số đo mưa	\N	0	RAIN	\N	\N	48837	f	8a51d1a8-6a43-408a-8155-32aa5cd6d8b3	vndms.dmc.gov.vn
6289	Thông số đo mưa	\N	0	RAIN	\N	\N	91323	f	9562d4bd-b1d0-43f0-a354-621ba48c3ecd	vndms.dmc.gov.vn
6290	Thông số đo mưa	\N	0	RAIN	\N	\N	48830	f	ada90142-9761-4535-9c0e-04d998ef97df	vndms.dmc.gov.vn
6291	Thông số đo mưa	\N	0	RAIN	\N	\N	48894	f	31bf17e3-1b9a-4dc7-a27c-9792feaaca8a	vndms.dmc.gov.vn
6292	Thông số đo mưa	\N	0	RAIN	\N	\N	48833	f	2b146cb2-e8cc-4ada-a3a2-ee5c35fd0db4	vndms.dmc.gov.vn
6293	Thông số đo mưa	\N	0	RAIN	\N	\N	74181 	f	ba07e053-f662-4af8-bba5-596ae4fc2047	vndms.dmc.gov.vn
6294	Thông số đo mưa	\N	0	RAIN	\N	\N	69716	f	1dcb17b3-9d8e-4104-a955-24205166d9ff	vndms.dmc.gov.vn
6295	Thông số đo mưa	\N	0	RAIN	\N	\N	91304	f	509f6b11-1a33-4609-9af4-bb191aa2f4e1	vndms.dmc.gov.vn
6296	Thông số đo mưa	\N	0	RAIN	\N	\N	66765	f	451c16be-77ff-4a81-af27-57e33aa86a81	vndms.dmc.gov.vn
6297	Thông số đo mưa	\N	0	RAIN	\N	\N	71586	f	6de6449d-e7fe-4a55-816e-9c23b71c24e3	vndms.dmc.gov.vn
6298	Thông số đo mưa	\N	0	RAIN	\N	\N	71591	f	a4e05a28-9735-42e8-bb4a-a16b7995cda8	vndms.dmc.gov.vn
6299	Thông số đo mưa	\N	0	RAIN	\N	\N	66783 	f	cffb04e5-a28f-40cd-84c4-74f128c903be	vndms.dmc.gov.vn
6300	Thông số đo mưa	\N	0	RAIN	\N	\N	70600 	f	cf99da17-3f00-4a82-a68d-eed4d0a45101	vndms.dmc.gov.vn
6301	Thông số đo mưa	\N	0	RAIN	\N	\N	48873	f	9cf72e88-98df-464d-9306-6399a64025ea	vndms.dmc.gov.vn
6302	Thông số đo mưa	\N	0	RAIN	\N	\N	48909	f	dae69057-c9d2-424b-bede-73f26927b1dd	vndms.dmc.gov.vn
6303	Thông số đo mưa	\N	0	RAIN	\N	\N	48908	f	105cb04a-fd59-4ca7-b548-50fd3a9bd45a	vndms.dmc.gov.vn
6304	Thông số đo mưa	\N	0	RAIN	\N	\N	48822	f	a5c13676-0426-4021-bdd7-8e08a1a7d157	vndms.dmc.gov.vn
6305	Thông số đo mưa	\N	0	RAIN	\N	\N	91313	f	099cf75b-35aa-4d20-99e2-e287db8ff0f9	vndms.dmc.gov.vn
6306	Thông số đo mưa	\N	0	RAIN	\N	\N	69703	f	74b0a2f3-2ad5-48cb-976f-61da16570362	vndms.dmc.gov.vn
6307	Thông số đo mưa	\N	0	RAIN	\N	\N	48/54	f	b8c13fb7-91f0-4fdb-8dcb-1d8a0ae14543	vndms.dmc.gov.vn
6308	Thông số đo mưa	\N	0	RAIN	\N	\N	91172 	f	6274fed7-fefe-4486-bb43-10799f491358	vndms.dmc.gov.vn
6309	Thông số đo mưa	\N	0	RAIN	\N	\N	91171 	f	b1be0b29-d6dc-4e72-9b2f-f1b277f687ab	vndms.dmc.gov.vn
6310	Thông số đo mưa	\N	0	RAIN	\N	\N	86208 	f	ae998881-dd92-4683-b23c-5c14dcbff21f	vndms.dmc.gov.vn
6311	Thông số đo mưa	\N	0	RAIN	\N	\N	48/46	f	a066ceab-3ea6-480d-a10a-fe40975778b5	vndms.dmc.gov.vn
6312	Thông số đo mưa	\N	0	RAIN	\N	\N	48823	f	c7085def-e641-44ad-944b-b9f7bac542a4	vndms.dmc.gov.vn
6313	Thông số đo mưa	\N	0	RAIN	\N	\N	72432	f	498f84d4-509c-4dc8-bcc1-96bfb59d1dee	vndms.dmc.gov.vn
6314	Thông số đo mưa	\N	0	RAIN	\N	\N	91325	f	c7046b18-e3dd-4da9-9d81-7fbb5bf133af	vndms.dmc.gov.vn
6315	Thông số đo mưa	\N	0	RAIN	\N	\N	48/59	f	09b41249-67bf-42c3-9d99-951d1f04c951	vndms.dmc.gov.vn
6316	Thông số đo mưa	\N	0	RAIN	\N	\N	91175	f	46557118-1844-491e-9c49-6e3630579f21	vndms.dmc.gov.vn
6317	Thông số đo mưa	\N	0	RAIN	\N	\N	73414	f	ef94027a-c382-4504-989e-7569415ef540	vndms.dmc.gov.vn
6318	Thông số đo mưa	\N	0	RAIN	\N	\N	91311	f	86ff70f9-6a7a-4aa6-b9c3-0e168601a2db	vndms.dmc.gov.vn
6319	Thông số đo mưa	\N	0	RAIN	\N	\N	48824	f	875a3227-c26d-48b8-8005-ae7d09f0e697	vndms.dmc.gov.vn
6320	Thông số đo mưa	\N	0	RAIN	\N	\N	91176 	f	e44798b4-d210-46c5-92a7-2e73e234defc	vndms.dmc.gov.vn
6321	Thông số đo mưa	\N	0	RAIN	\N	\N	74190 	f	113e3e6e-318f-4738-ac6c-f9fc04c4b561	vndms.dmc.gov.vn
6322	Thông số đo mưa	\N	0	RAIN	\N	\N	91170	f	6e510fec-44a6-4944-9adb-ab26381e14de	vndms.dmc.gov.vn
6323	Thông số đo mưa	\N	0	RAIN	\N	\N	48/83	f	833586e9-98ad-419d-9529-2945ff634a24	vndms.dmc.gov.vn
6324	Thông số đo mưa	\N	0	RAIN	\N	\N	74166	f	17fa3886-f3ce-4895-946c-46e5e3ad21f4	vndms.dmc.gov.vn
6325	Thông số đo mưa	\N	0	RAIN	\N	\N	91317	f	51a5f907-2223-4e87-a5c9-a697ffa0c0c1	vndms.dmc.gov.vn
6326	Thông số đo mưa	\N	0	RAIN	\N	\N	71578	f	be6eff91-6640-465d-80d7-1632128bb59e	vndms.dmc.gov.vn
6327	Thông số đo mưa	\N	0	RAIN	\N	\N	48887	f	f2673b9e-e7a1-41e0-899e-3c0ed99c8140	vndms.dmc.gov.vn
6328	Thông số đo mưa	\N	0	RAIN	\N	\N	74182	f	cc93e362-d1a7-4b1f-86ea-53c7fcbec5af	vndms.dmc.gov.vn
6329	Thông số đo mưa	\N	0	RAIN	\N	\N	74183 	f	faec30c8-fa7d-468a-b366-3bdc949a8704	vndms.dmc.gov.vn
6330	Thông số đo mưa	\N	0	RAIN	\N	\N	71581	f	ca629bc6-4f68-4130-bdf7-27948e3aef21	vndms.dmc.gov.vn
6331	Thông số đo mưa	\N	0	RAIN	\N	\N	91312	f	5a1f516e-e87b-4174-b465-bc26bd6e9814	vndms.dmc.gov.vn
6332	Thông số đo mưa	\N	0	RAIN	\N	\N	72441	f	74c5d316-506a-4383-aeea-46f39b997b6a	vndms.dmc.gov.vn
6333	Thông số đo mưa	\N	0	RAIN	\N	\N	71588	f	a398a20a-e19e-424b-b1bf-63c1e02d272b	vndms.dmc.gov.vn
6334	Thông số đo mưa	\N	0	RAIN	\N	\N	72426	f	820e7c77-6766-4596-9186-910d06c30c9b	vndms.dmc.gov.vn
6335	Thông số đo mưa	\N	0	RAIN	\N	\N	71559	f	e74f39f3-d23b-4bae-8e28-22790b96f51f	vndms.dmc.gov.vn
6336	Thông số đo mưa	\N	0	RAIN	\N	\N	69719	f	c03b9d9a-4cba-4f46-a63d-e2cff8186060	vndms.dmc.gov.vn
6337	Thông số đo mưa	\N	0	RAIN	\N	\N	48/53	f	8a18be18-b47b-4867-8184-094447ecb0fc	vndms.dmc.gov.vn
6338	Thông số đo mưa	\N	0	RAIN	\N	\N	71566	f	136a4d0c-10cf-4801-9144-e650c65572df	vndms.dmc.gov.vn
6339	Thông số đo mưa	\N	0	RAIN	\N	\N	73420	f	28591bd9-0a2f-47fe-8ec7-8dd5686f85e4	vndms.dmc.gov.vn
6340	Thông số đo mưa	\N	0	RAIN	\N	\N	48844	f	431f8179-3a21-45b1-8053-8c2c8b3e4812	vndms.dmc.gov.vn
6341	Thông số đo mưa	\N	0	RAIN	\N	\N	91341	f	1990bfcc-e8d1-4413-9f2c-4b14fa78dcac	vndms.dmc.gov.vn
6342	Thông số đo mưa	\N	0	RAIN	\N	\N	91344	f	c8fb20b7-fbf4-4f29-87bc-1003c4b11df3	vndms.dmc.gov.vn
6343	Thông số đo mưa	\N	0	RAIN	\N	\N	48890	f	d036a59b-f4db-4856-b1d3-1262914ab7ab	vndms.dmc.gov.vn
6344	Thông số đo mưa	\N	0	RAIN	\N	\N	48902	f	236977af-7517-4ecd-aab7-2fe3fad70ccc	vndms.dmc.gov.vn
6345	Thông số đo mưa	\N	0	RAIN	\N	\N	48/55	f	4a8a0121-91da-44b0-ba6c-a1b8bb0e179b	vndms.dmc.gov.vn
6346	Thông số đo mưa	\N	0	RAIN	\N	\N	48/76	f	8e029973-a9da-457d-8d30-296d3b68d848	vndms.dmc.gov.vn
6347	Thông số đo mưa	\N	0	RAIN	\N	\N	48879	f	e11d6421-5d90-4e9f-9348-c4876bce58f6	vndms.dmc.gov.vn
6348	Thông số đo mưa	\N	0	RAIN	\N	\N	71573 	f	bfadf95c-4a11-454c-9dd9-3ce6e464fc17	vndms.dmc.gov.vn
6349	Thông số đo mưa	\N	0	RAIN	\N	\N	72424	f	a46bcd8c-42e9-40c1-81f2-b9166c0b3b36	vndms.dmc.gov.vn
6350	Thông số đo mưa	\N	0	RAIN	\N	\N	91314	f	a39d0c11-208c-4fa6-b567-3ebd21d4e354	vndms.dmc.gov.vn
6351	Thông số đo mưa	\N	0	RAIN	\N	\N	48828	f	331b322c-e881-41ce-8b79-8fe936a9aa02	vndms.dmc.gov.vn
6352	Thông số đo mưa	\N	0	RAIN	\N	\N	48903	f	79115da9-5bb2-442c-9db3-04fdccf654d4	vndms.dmc.gov.vn
6353	Thông số đo mưa	\N	0	RAIN	\N	\N	91180	f	95c3bddc-656f-407c-99cd-75d160c4d7b5	vndms.dmc.gov.vn
6354	Thông số đo mưa	\N	0	RAIN	\N	\N	74198	f	08363992-f7f7-414d-8bf6-f5b901ca5d96	vndms.dmc.gov.vn
6355	Thông số đo mưa	\N	0	RAIN	\N	\N	91315	f	f62763d2-7029-444b-b54c-7e0bba537e93	vndms.dmc.gov.vn
6356	Thông số đo mưa	\N	0	RAIN	\N	\N	74121	f	a396953e-f6cb-463d-9277-787ebb95ed2f	vndms.dmc.gov.vn
6357	Thông số đo mưa	\N	0	RAIN	\N	\N	66798 	f	854868a6-8f22-4dc1-b445-85cac165777f	vndms.dmc.gov.vn
6358	Thông số đo mưa	\N	0	RAIN	\N	\N	48820	f	3049d91d-25a3-4c09-bc57-87e83a83856d	vndms.dmc.gov.vn
6359	Thông số đo mưa	\N	0	RAIN	\N	\N	72427	f	4cea4353-d2eb-4512-92e4-fa57f058a7fd	vndms.dmc.gov.vn
6360	Thông số đo mưa	\N	0	RAIN	\N	\N	72443	f	6fa350dd-c283-4c03-bebf-6dd1b4e972d6	vndms.dmc.gov.vn
6361	Thông số đo mưa	\N	0	RAIN	\N	\N	72444	f	062d7a2b-fafd-46a6-9f83-648d358019de	vndms.dmc.gov.vn
6362	Thông số đo mưa	\N	0	RAIN	\N	\N	48/87	f	a93825da-27b8-429a-ae8e-6c99aa681fc3	vndms.dmc.gov.vn
6363	Thông số đo mưa	\N	0	RAIN	\N	\N	66797 	f	6217ca73-80a9-403a-af61-ec27053998c6	vndms.dmc.gov.vn
6364	Thông số đo mưa	\N	0	RAIN	\N	\N	48/82	f	78d75b5d-394d-4c9c-b8d9-c41cbe24dce7	vndms.dmc.gov.vn
6365	Thông số đo mưa	\N	0	RAIN	\N	\N	66768	f	059057b1-1153-4beb-bbcc-768ad028066a	vndms.dmc.gov.vn
6366	Thông số đo mưa	\N	0	RAIN	\N	\N	48819	f	24b25179-cd05-4327-a790-0f67335893f1	vndms.dmc.gov.vn
6367	Thông số đo mưa	\N	0	RAIN	\N	\N	48814	f	17c35a6e-f138-4569-92e3-7b045488019b	vndms.dmc.gov.vn
6368	Thông số đo mưa	\N	0	RAIN	\N	\N	91316	f	895d160f-0dbb-483d-9eb7-dc790cf272ab	vndms.dmc.gov.vn
6369	Thông số đo mưa	\N	0	RAIN	\N	\N	69749	f	3f3cfc8f-aff6-408a-8e02-791431a4d412	vndms.dmc.gov.vn
6370	Thông số đo mưa	\N	0	RAIN	\N	\N	66769 	f	b70b4dab-f208-4008-95c5-615a8fd24894	vndms.dmc.gov.vn
6371	Thông số đo mưa	\N	0	RAIN	\N	\N	66742 	f	0f14ad6b-47e7-4035-8ad0-b4eb585ffde2	vndms.dmc.gov.vn
6372	Thông số đo mưa	\N	0	RAIN	\N	\N	66755	f	f7f6fbdd-f5ea-495e-a959-d69ee0ee36ff	vndms.dmc.gov.vn
6373	Thông số đo mưa	\N	0	RAIN	\N	\N	74162	f	4de57da1-f9cb-46e3-a9b9-3a00eec52b30	vndms.dmc.gov.vn
6374	Thông số đo mưa	\N	0	RAIN	\N	\N	68738 	f	93f29867-2006-404f-aa3e-f59c3f0a8f5a	vndms.dmc.gov.vn
6375	Thông số đo mưa	\N	0	RAIN	\N	\N	69754	f	70a4f52b-a1f9-49d2-a689-d09c20beec1e	vndms.dmc.gov.vn
6376	Thông số đo mưa	\N	0	RAIN	\N	\N	74113 	f	b91eecbb-7243-4709-b5e2-372bc84a3d4f	vndms.dmc.gov.vn
6377	Thông số đo mưa	\N	0	RAIN	\N	\N	71720	f	bfb57de9-afb8-4678-9008-77126ccdc544	vndms.dmc.gov.vn
6378	Thông số đo mưa	\N	0	RAIN	\N	\N	74165	f	78d2932c-9ad6-4307-a47e-ec7cd770c425	vndms.dmc.gov.vn
6379	Thông số đo mưa	\N	0	RAIN	\N	\N	48825	f	9b5bed37-6d57-4782-b9c1-c9ea19209877	vndms.dmc.gov.vn
6380	Thông số đo mưa	\N	0	RAIN	\N	\N	71592 	f	67345131-68ad-4483-8b5b-2dd861e9853f	vndms.dmc.gov.vn
6381	Thông số đo mưa	\N	0	RAIN	\N	\N	74122	f	2e8ca6b9-632a-4014-a116-1828eda926c5	vndms.dmc.gov.vn
6382	Thông số đo mưa	\N	0	RAIN	\N	\N	74120	f	968aff54-18ce-4a6b-8442-86fed7075bcf	vndms.dmc.gov.vn
6383	Thông số đo mưa	\N	0	RAIN	\N	\N	74105	f	595f5e2f-5cd5-48d2-9a74-667d05286720	vndms.dmc.gov.vn
6384	Thông số đo mưa	\N	0	RAIN	\N	\N	69718	f	ee5de0a9-b8c5-4310-9bf3-904e6686f14c	vndms.dmc.gov.vn
6385	Thông số đo mưa	\N	0	RAIN	\N	\N	71585 	f	c4c1b83c-9ba0-4ce2-b105-a17c63000a9e	vndms.dmc.gov.vn
6386	Thông số đo mưa	\N	0	RAIN	\N	\N	66762	f	abb3ed9f-6bff-4d94-ba39-0b8cb24a9844	vndms.dmc.gov.vn
6387	Thông số đo mưa	\N	0	RAIN	\N	\N	73404	f	5da229ca-cf33-4d63-8e51-bd6bbfa23d7e	vndms.dmc.gov.vn
6388	Thông số đo mưa	\N	0	RAIN	\N	\N	48877	f	aa3be9ab-84ae-414a-a91b-fcf4f4d91890	vndms.dmc.gov.vn
6389	Thông số đo mưa	\N	0	RAIN	\N	\N	69759	f	ac4bd790-ccb5-4f59-97fd-8678934b512f	vndms.dmc.gov.vn
6390	Thông số đo mưa	\N	0	RAIN	\N	\N	69727	f	6b74c405-80f3-4519-85cd-c101902c7971	vndms.dmc.gov.vn
6391	Thông số đo mưa	\N	0	RAIN	\N	\N	70608	f	f5d2358a-5a4c-4c6f-98f8-ac4ccebaa3be	vndms.dmc.gov.vn
6392	Thông số đo mưa	\N	0	RAIN	\N	\N	70601	f	6759c1b1-b382-468c-a781-c718dd7161f9	vndms.dmc.gov.vn
6393	Thông số đo mưa	\N	0	RAIN	\N	\N	71564	f	9d715d43-3996-48f0-950b-35c9ad9b71a3	vndms.dmc.gov.vn
6394	Thông số đo mưa	\N	0	RAIN	\N	\N	72446	f	79c44054-20ea-41b1-8c2d-57d1891723c7	vndms.dmc.gov.vn
6395	Thông số đo mưa	\N	0	RAIN	\N	\N	69731	f	e95f964b-c43a-410c-8382-4acfc6943c41	vndms.dmc.gov.vn
6396	Thông số đo mưa	\N	0	RAIN	\N	\N	70606	f	0eb2c2c4-8c55-4373-9129-105141ece403	vndms.dmc.gov.vn
6397	Thông số đo mưa	\N	0	RAIN	\N	\N	70610	f	feb4d369-44db-487a-8db5-62385fdf84dc	vndms.dmc.gov.vn
6398	Thông số đo mưa	\N	0	RAIN	\N	\N	68739 	f	1379f6c2-ee4c-4057-b0b5-53c1f3896759	vndms.dmc.gov.vn
6399	Thông số đo mưa	\N	0	RAIN	\N	\N	69726	f	49a59865-e405-433c-9680-5864a9caf26c	vndms.dmc.gov.vn
6400	Thông số đo mưa	\N	0	RAIN	\N	\N	69741 	f	c4d88c4c-154a-44aa-a1fc-4ce57ef1b495	vndms.dmc.gov.vn
6401	Thông số đo mưa	\N	0	RAIN	\N	\N	71500	f	e4929321-7514-44b2-b7c0-f28c0d55ad43	vndms.dmc.gov.vn
6402	Thông số đo mưa	\N	0	RAIN	\N	\N	74194 	f	738b1445-50bc-481b-bb64-bfb0e17fbba2	vndms.dmc.gov.vn
6403	Thông số đo mưa	\N	0	RAIN	\N	\N	74117 	f	749d380d-cbc6-4bf9-9600-29e87b52061a	vndms.dmc.gov.vn
6404	Thông số đo mưa	\N	0	RAIN	\N	\N	48839	f	53ccace2-709a-4ae8-bd24-efad910c7961	vndms.dmc.gov.vn
6405	Thông số đo mưa	\N	0	RAIN	\N	\N	48829	f	c998e3df-13f1-4c78-8d7e-506628e6285b	vndms.dmc.gov.vn
6406	Thông số đo mưa	\N	0	RAIN	\N	\N	74195 	f	6dbdc393-4062-41f7-9cb5-8ce288480801	vndms.dmc.gov.vn
6407	Thông số đo mưa	\N	0	RAIN	\N	\N	74180 	f	07990ab0-bb62-4a11-9514-4ae74df56c11	vndms.dmc.gov.vn
6408	Thông số đo mưa	\N	0	RAIN	\N	\N	73410	f	96a4f2a3-a3bf-4aed-8044-53baf1405af2	vndms.dmc.gov.vn
6409	Thông số đo mưa	\N	0	RAIN	\N	\N	74185	f	e39e4e76-0d55-48a9-bbf4-2e3754eb45b9	vndms.dmc.gov.vn
6410	Thông số đo mưa	\N	0	RAIN	\N	\N	66763	f	a5a148f6-de74-4d58-afdd-cb158821a01b	vndms.dmc.gov.vn
6411	Thông số đo mưa	\N	0	RAIN	\N	\N	48821	f	0ae4ceac-a955-4544-a7f8-7e4e93b7a02a	vndms.dmc.gov.vn
6412	Thông số đo mưa	\N	0	RAIN	\N	\N	74196	f	8bc463c2-165e-4181-9469-a93be2616f1d	vndms.dmc.gov.vn
6413	Thông số đo mưa	\N	0	RAIN	\N	\N	91310 	f	9a504db2-1e81-4088-8940-3c86444ff1c1	vndms.dmc.gov.vn
6414	Thông số đo mưa	\N	0	RAIN	\N	\N	74179 	f	b95ad8fc-4a1f-4352-9fdf-bfe5a81f2d06	vndms.dmc.gov.vn
6415	Thông số đo mưa	\N	0	RAIN	\N	\N	91340	f	c97806f1-4649-4faa-81ef-c7218a29180c	vndms.dmc.gov.vn
6416	Thông số đo mưa	\N	0	RAIN	\N	\N	73403	f	c35d7b79-8e0c-4d4f-b7bc-dab62c6ec1f0	vndms.dmc.gov.vn
6417	Thông số đo mưa	\N	0	RAIN	\N	\N	70607	f	605a8a9e-9ce4-4382-8b62-a3cbe0c295fd	vndms.dmc.gov.vn
6418	Thông số đo mưa	\N	0	RAIN	\N	\N	69734	f	dc65e298-f629-45d4-82dc-ee1549e3a59d	vndms.dmc.gov.vn
6419	Thông số đo mưa	\N	0	RAIN	\N	\N	66760	f	8886a643-c22c-42c2-868a-c89b3a58ee73	vndms.dmc.gov.vn
\.


--
-- TOC entry 5450 (class 0 OID 20421)
-- Dependencies: 310
-- Data for Name: map_layer_coquan_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_layer_coquan_access (id, cq_id, layer_id) FROM stdin;
\.


--
-- TOC entry 5452 (class 0 OID 20428)
-- Dependencies: 312
-- Data for Name: map_layer_member_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_layer_member_access (id, mem_id, layer_id) FROM stdin;
\.


--
-- TOC entry 5448 (class 0 OID 20408)
-- Dependencies: 308
-- Data for Name: map_layers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_layers (id, name, description, source_layer, filter, layout, visible_by_default, is_public, sort_order, paint, layer_type, source_id, parent_id, is_group, min_zoom, max_zoom) FROM stdin;
8	Bản đồ hành chính	\N	\N	\N	\N	\N	t	1	\N	\N	\N	\N	t	\N	\N
10	Bản đồ xã 	\N	bgmap_commune		{}	t	t	2	{}	line	3	8	f	10	18
9	Bản đồ huyện	\N	bgmap_district		{}	t	t	1	{"line-color": "#000000", "line-width": 1}	line	2	8	f	7	10
1	Bản đồ tỉnh	\N	bgmap_province		{}	t	t	0	{"line-color": "#000000", "line-width": 1}	line	1	8	f	0	7
11	Bản đồ hành chính mới		\N	\N	\N	\N	t	0	\N	\N	\N	\N	t	0	0
12	Bản đồ tỉnh		bgmap_province		{}	t	t	1	{"line-color": "#000000", "line-width": 1}	line	4	11	f	0	7
13	Bản đồ xã		bgmap_commune		{}	t	t	1	{}	line	5	11	f	10	18
\.


--
-- TOC entry 5456 (class 0 OID 40387)
-- Dependencies: 316
-- Data for Name: map_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_sources (id, name, description, source_url, bounds, scheme, source_type, active, apikey_id) FROM stdin;
1	bgmap_province	bgmap_province	http://localhost:8080/geoserver/gwc/service/tms/1.0.0/layer_map:bgmap_province@EPSG%3A900913@pbf/{z}/{x}/{y}.pbf	[102.11428833007812, 8.488194465637207, 109.50788116455078, 23.466352462768555]	tms	vector	t	1
2	bgmap_district	bgmap_district	http://localhost:8080/geoserver/gwc/service/tms/1.0.0/layer_map:bgmap_district@EPSG%3A900913@pbf/{z}/{x}/{y}.pbf	[102.0706787109375, 4.892891883850098, 117.04637145996094, 23.48460578918457]	tms	vector	t	1
3	bgmap_commune	bgmap_commune	http://localhost:8080/geoserver/gwc/service/tms/1.0.0/layer_map:bgmap_commune@EPSG%3A900913@pbf/{z}/{x}/{y}.pbf	[102.0706787109375, 4.892891883850098, 117.04637145996094, 23.48460578918457]	tms	vector	t	1
5	bgmap_commune_new	bgmap_commune_new	http://localhost:8080/geoserver/gwc/service/tms/1.0.0/layer_map_new:bgmap_commune@EPSG%3A900913@pbf/{z}/{x}/{y}.pbf	[102.0706787109375, 4.892891883850098, 117.04637145996094, 23.48460578918457]	tms	vector	t	1
4	bgmap_province_new	bgmap_province_new	http://localhost:8080/geoserver/gwc/service/tms/1.0.0/layer_map_new:bgmap_province@EPSG%3A900913@pbf/{z}/{x}/{y}.pbf	[102.14208221435547, 6.953305721282959, 116.94732666015625, 23.393903732299805]	tms	vector	t	1
\.


--
-- TOC entry 5454 (class 0 OID 20435)
-- Dependencies: 314
-- Data for Name: mapbox_apikeys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapbox_apikeys (id, key_value, description, created_by, created_at, active) FROM stdin;
1	pk.eyJ1IjoibWluaHRyaTIwMDMiLCJhIjoiY21hamloZXMyMGdmbDJqc2lqbjkzN2h5eSJ9.W7IMJNykpBZ9fzzHJQNe0Q	a	\N	2025-05-25 14:48:11.177855	t
\.


--
-- TOC entry 5427 (class 0 OID 20306)
-- Dependencies: 287
-- Data for Name: monitoring_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.monitoring_data (data_id, tskt_id, data_thoigian, data_thoigiancapnhat, data_giatri_sothuc, data_giatri_chuoi, createby, data_tonghop, data_maloaithongso) FROM stdin;
\.


--
-- TOC entry 5423 (class 0 OID 20285)
-- Dependencies: 283
-- Data for Name: monitoring_stations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.monitoring_stations (key, station_id, station_name, commune_id, luuvuc, lat, lon, description, infor_data) FROM stdin;
c6892db3-9b64-4517-b9ae-efabb66061aa	74184 	Trực Phương	\N	\N	2.0316668483862528e+16	1.0630000034185216e+16	\N	\N
26bd3b57-60d0-4213-8a75-fdfbb53ff218	48/48	Hữu Lũng	\N	\N	2.183333337366528e+15	1.0658333933436928e+16	\N	\N
82157991-a0be-4316-9cee-0f7a81181958	71572	Tân Mỹ	\N	\N	1171388928	1088172160	\N	\N
49c5a98d-d152-411e-badd-9cd175197f37	72442	Hòa Duyệt	\N	\N	18379	105599	\N	\N
6fa3cc9e-2709-4caf-be67-4b2e33bd9a57	73408	Cửa Đạt	\N	\N	19866712	105283336	\N	\N
6e708adb-d6f3-48db-8f25-0a70be61e16a	48842	Hồi Xuân	\N	\N	2.0366666198155264e+16	1.0508333274365952e+16	\N	\N
ea4ff054-0904-4d68-928a-ed11eaacaca0	48845	Vinh	\N	\N	1.866666606592e+15	1.0568333967491072e+16	\N	\N
fded148a-00b9-4252-beab-d694701f401e	48888	La Gi (Hàm Tân)	\N	\N	1.068333386432512e+16	1.0776666724892672e+16	\N	\N
2203e58c-c8c1-46e2-871a-8e3360707480	74197 	Quyết Chiến	\N	\N	205	10625	\N	\N
cef47747-7687-4fdc-a209-f685daf29ff8	73402	Hồi Xuân	\N	\N	20375	105094	\N	\N
05d591ed-d8ed-4c7a-8087-a16ecd32dcec	73406	Lang Chánh	\N	\N	20142	10525	\N	\N
00892308-64bb-4acc-898b-fd6cedd23cf3	48/65	Cúc Phuong	\N	\N	2025	1.0571666862112768e+16	\N	\N
dc5e0136-8abd-4c83-af74-47be077ca7b2	48827	Hải Dương	\N	\N	2.0950000066363392e+16	1.0630000034185216e+16	\N	\N
861c898e-f7c3-4a35-89c5-0f5c94d1eeeb	72428	Nam Đàn	\N	\N	187	105489	\N	\N
72a17a16-986d-49af-80b3-4d998d3d5040	91209 	Hữu Lũng	\N	\N	2.1516667313979392e+16	1.0631666481496064e+16	\N	\N
e8959325-bcdb-4328-9fd5-a5d17fa38b90	48831	Thái Nguyên	\N	\N	2.1600000416940032e+16	1.0583333067030528e+16	\N	\N
379b9bd8-997f-4f87-b8b2-4c0e3c57123a	48/63	Chi Nê	\N	\N	2.048333254230016e+16	1.0578333725097984e+16	\N	\N
f196f7ec-e35c-4daa-be1d-862ecba909a3	48/69	Bái Thượng	\N	\N	1.9899998674092032e+16	1.05900001984512e+15	\N	\N
9ac175e4-0eac-499c-ada5-86ad0ebde1a1	48/86	Kỳ Anh	\N	\N	1.8099999355174912e+16	1.062666713956352e+16	\N	\N
894f02db-6f60-49d6-8fdf-1db2389a5207	48/88	Long Khánh	\N	\N	1.093333317320704e+16	1.0723332894752768e+16	\N	\N
600e66c3-adb0-43db-afe6-34e1e12c0094	48918	Côn Đảo	\N	\N	8.683333487689728e+15	1.066000011231232e+15	\N	\N
6e034130-5cff-4048-addb-9af66d068560	72422	Nghĩa Khánh	\N	\N	19433	105333	\N	\N
9f9137b3-266e-49e9-8ee4-6b52c397461f	48/16	Sông Mã	\N	\N	2.104999978991616e+16	10375	\N	\N
deff3de2-c7d7-498a-aaf8-92cfdd094c4a	91303	Gia Bảy	\N	\N	21596	105833	\N	\N
acd16261-385f-4dae-ba29-988104b6d233	48/64	Lạc Sơn	\N	\N	2.0450001448599552e+16	1.0544999410171904e+16	\N	\N
b4bbb366-ed07-4242-b2f5-3fef123bce85	91324	Đồn Sơn	\N	\N	21433	106609	\N	\N
42ecc9d8-4a73-44c0-9b04-25ce256bdf4e	66796 	Gành Hào	\N	\N	9033333760	1054	\N	\N
41e798e1-0878-450f-a07d-91ff854eaaac	48910	Cần Thơ	\N	\N	1.003333351374848e+16	1.0576667277787136e+16	\N	\N
de9fead8-17c5-46b9-bc2b-dcaf120f9231	74115	Hưng Thi	\N	\N	20516	105674	\N	\N
f38ffdb9-2d61-417e-887f-338301d54cb8	48915	Bạc Liêu	\N	\N	9.3000000602112e+15	1.0571666862112768e+16	\N	\N
b0e5073b-7c56-4289-b5ac-42a3d2f09553	48895	Đồng Phú	\N	\N	1.1533333662007296e+16	1.069000045887488e+15	\N	\N
bd1d63c8-4279-43eb-8724-d1aec6e18964	74108	Tạ Bú	\N	\N	21448	10405	\N	\N
356d4c8c-6592-4aa9-8583-81375b4c25c4	48906	Mộc Hóa	\N	\N	1.0783333587877888e+16	1.0593333898379264e+16	\N	\N
6df9525d-6a73-4ae9-9f92-d8c711107e36	66776	Trần Đề (Mỹ Thanh)	\N	\N	94167	106167	\N	\N
b31ec964-9466-4696-8d3d-3be9c6c50183	66781	Tân Hiệp	\N	\N	10114	105286	\N	\N
b7f0c870-ed8f-4d78-8644-4ea75e7e8551	66782	Rạch Giá	\N	\N	10	1050833344	\N	\N
97c8ff14-de52-4db0-b9ed-5b745cb05a59	71576 	Sông Lũy	\N	\N	1.1200000176422912e+16	1.0833333449654272e+16	\N	\N
9feeae75-35fe-47fc-a64c-d83d82eddef4	48913	Sóc Trăng	\N	\N	9.600000304611328e+15	1.059666679300096e+16	\N	\N
2763f498-0286-476d-9cc7-451e1fbc2fb5	48832	Nho Quan	\N	\N	2.033333349384192e+15	1.0576667277787136e+16	\N	\N
a873e70f-cd0b-43dc-8992-d52e4fc3e136	71577	Tà Pao	\N	\N	11128	107722	\N	\N
b4f96869-b858-4200-9c02-e0847c63b0c9	48889	Phú Quý	\N	\N	1.0516666584662016e+16	1.0893333069037568e+16	\N	\N
8be198c1-66e3-412a-814b-56170570c313	73409	Bái Thượng	\N	\N	19906	105373	\N	\N
a499c7a1-800b-4301-aa1a-d61f2f230fac	74116 	Trung Hà	\N	\N	2.1233332616429568e+16	1.0533333205254144e+16	\N	\N
36ae48fd-cc3d-4cb1-8997-fe82798af9f9	48817	Sơn Tây	\N	\N	2.1149999513468928e+16	1055	\N	\N
6ce78b95-5025-4afb-a7e4-6f6ad14c6276	48/61	Kim Bôi	\N	\N	2.066666590568448e+15	1.0553333794209792e+16	\N	\N
bee8ae7f-9225-4d18-89f2-10fbcfea6675	71594	Biên Hòa	\N	\N	1094	106825	\N	\N
0db5e156-0f85-40ed-a689-77c3850cd292	48898	Tây Ninh	\N	\N	1.1333333141159936e+16	1.060999998210048e+15	\N	\N
4327d0c8-3af8-466c-afce-3eb30bbeb344	48880	Đà Lạt	\N	\N	1.195000025055232e+16	1.0844999654572032e+16	\N	\N
83c7a0a6-060e-4651-9c08-7ce28d961c5f	48919	Huyền Trân	\N	\N	8.01666651652096e+15	1.106166679601152e+16	\N	\N
36b3f455-8850-4878-9681-f8a474592df5	48/17	Cò Nòi	\N	\N	2.11333328928768e+16	1.04150004137984e+15	\N	\N
f76915a0-a1a1-4771-a4c7-53d96cd79a28	48/26	Mai Châu	\N	\N	2.064999874822144e+16	1.0505000379744256e+16	\N	\N
50dc98e0-e996-4f5f-9f2f-e6b330f44081	48892	Song Tử Tây	\N	\N	1.14166673178624e+16	1.1433333938454528e+16	\N	\N
a3d9a204-d707-4bbf-827b-23dc55855681	71595 	Phú Hiệp	\N	\N	11165	107458056	\N	\N
a9376330-6ebc-4c97-82a9-c3587364f0d7	1026260802	Đắk Blà 2	\N	\N	14374667	108043968	\N	\N
55a91a51-ead9-4c14-ab2d-061ee99ee757	00208CCD	K22+000 de bien Hai Hau, Hai Hau, Nam Dinh	\N	\N	20043992	106235240	\N	\N
04c4b949-4375-43c0-81c8-c149c0db1e87	48806	Sơn La	\N	\N	2.133333341372416e+15	1.039000034869248e+15	\N	\N
5b655961-602e-4ad0-8ace-2a77f507ba42	48884	Bảo Lộc	\N	\N	1.1533333662007296e+16	1.0781666066825216e+16	\N	\N
d1942a4d-2e44-4875-8ed1-9232f5d9608b	48868	Yaly	\N	\N	1.4700000164446208e+16	10775	\N	\N
43cb6abc-741d-4b79-a005-e1b73eb38719	48/43	Trùng Khánh	\N	\N	2.28333346357248e+15	1.0651667070451712e+16	\N	\N
3899e830-4e7b-4e07-9f05-c69b849a92ab	48912	Mỹ Tho	\N	\N	1.0350000378740736e+16	1.064000032866304e+15	\N	\N
fe3534b7-a6cf-4558-9ecb-e9c04293e6a8	66764	Tri Tôn	\N	\N	1043333	10505	\N	\N
00eaa3a4-2280-4442-bc22-d1a1fdeff00d	71707	Pơ Mê Rê	\N	\N	14033	10835	\N	\N
b7310bf6-e139-4515-a599-e1e12dae4c04	48837	Tiên Yên	\N	\N	2.133333341372416e+15	1.073999991799808e+15	\N	\N
79966dcb-ab83-4faa-907c-05f21b31a461	91323	Bình Liêu	\N	\N	21489	107382	\N	\N
b19b7d6a-3b16-4693-8a1e-5333a559f70b	48830	Lạng Sơn	\N	\N	2.183333337366528e+15	1.0676667001339904e+16	\N	\N
95298bb9-bfa8-450f-a765-b9c4843938ae	488550	Đà Nẵng	\N	\N	0	0	\N	\N
608ce1e8-1137-4f57-9788-899a2a03d08e	48894	Nhà Bè	\N	\N	1.0816666829062144e+16	1.0666666169991168e+16	\N	\N
fa6f57df-da78-4f63-9e12-986b034d1d18	48833	Bãi Cháy	\N	\N	2.096666668695552e+15	1.070666627416064e+16	\N	\N
b494c398-2914-4640-97fc-16c87844c933	74181 	Bến Đế	\N	\N	2.0349999577563136e+16	1.0578333725097984e+16	\N	\N
e43a245c-4045-4781-b9d3-9a929adfdeeb	69716	Bản Đôn	\N	\N	1285	107793	\N	\N
cfd30212-e554-4ced-8f6d-fee1977ed29e	91304	Chã	\N	\N	21373	105904	\N	\N
a6c4e4e6-a2de-46b9-aca0-7b3a39c0bd91	66765	Xuân Tô	\N	\N	10604	104939	\N	\N
c4cd7540-67ef-453b-a84b-2b0cedf5eba7	71586	Thủ Dầu Một	\N	\N	10967	106653	\N	\N
72e54a65-2461-4698-bd93-d526535dec92	71591	Tà Lài	\N	\N	11366733	107362120	\N	\N
a78c2cc9-0de1-4f87-a2d2-7a03ff642f1a	66783 	Xẻo Rô	\N	\N	9883333632	1050847232	\N	\N
d5c247d3-597e-49dd-a67a-f91b5f52d28c	70600 	Cần Đăng	\N	\N	1.1533333662007296e+16	106	\N	\N
2c62d929-89d4-4f40-b477-e8e28e1a206a	48873	Tuy Hòa	\N	\N	1.3083332598300672e+16	1.0928332757532672e+16	\N	\N
7fdac52e-73df-4ce3-a1d9-2615b9a51fd4	91180	Đông Quý	\N	\N	2045	1065333	\N	\N
fc7d52c7-5f2e-486e-b7d7-1e61ba255f22	74198	Ba Lạt	\N	\N	20318	106517	\N	\N
ae30b69f-a96b-4a91-9ee3-c5c15eee2d31	91315	Chũ	\N	\N	21367	1066	\N	\N
fd6d9a73-a9ce-4510-a414-dfc0528b47b3	74121	Bảo Yên	\N	\N	0	0	\N	\N
6f052440-0eae-4940-aa2e-4202f154fcec	66798 	Phước Long	\N	\N	9433333760	10545	\N	\N
38dd90a0-0b45-4ff3-9666-d164449b9b96	48820	Láng	\N	\N	2.103333263245312e+15	1.0580000172408832e+16	\N	\N
f8265a6e-73f1-4d71-96c0-ba21215d70db	72427	Yên Thượng	\N	\N	18695	105395	\N	\N
835a5602-a91d-4d26-a9e8-0d4bad4b43e7	72443	Sơn Diệm	\N	\N	18508624	105338520	\N	\N
305e2268-13e5-405c-834d-1c277e2eed84	72444	Linh Cảm	\N	\N	18539	105563	\N	\N
f4208835-a20a-4fda-8e38-96393f07eb29	48/87	Tuyên Hóa	\N	\N	1.7883333287477248e+16	1.0601667208675328e+16	\N	\N
b870eca3-7edf-46a3-b2ab-24c0b9e6955d	66797 	Năm Căn	\N	\N	8766666752	1050166656	\N	\N
9c9b26ae-0e6b-4bb5-bd9f-a50decddd4b3	48/82	Hương Sơn	\N	\N	1.8866666049896448e+16	1.0571666862112768e+16	\N	\N
34e49215-f21d-4789-ac49-1128a6b5a54f	66768	Cần Thơ	\N	\N	10033	105792	\N	\N
9b8a7d58-8a01-4154-9924-bc70df426872	48909	Châu Đốc	\N	\N	1.0699999411175424e+16	1.0513332616298496e+16	\N	\N
4dc0b2f2-66b2-4c22-8ca4-fa2f3eb84355	48908	Cao Lãnh	\N	\N	10416645	105643912	\N	\N
b59f8063-5e16-410b-886b-62256ec15905	48819	Hoài Đức	\N	\N	2.1066668557991936e+16	10575	\N	\N
1e961076-d84c-4ee5-a016-bebebdae700c	48814	Vĩnh Yên	\N	\N	2.1316667866873856e+16	1.055999985188864e+15	\N	\N
29386808-1103-4f90-a7dc-940299a9424b	91316	Lục Nam	\N	\N	21299	106401	\N	\N
e1d1e2b0-35d6-4056-befb-b39f703537de	69749	Mỹ Thuận	\N	\N	10272	105911	\N	\N
43b08e75-2e96-41c5-9877-7f6cf61c7640	66769 	Phụng Hiệp	\N	\N	9.799999751716864e+15	1.051500000313344e+15	\N	\N
a5d2dd56-965c-48b5-859a-1fe19e147954	66742 	Bến Trại	\N	\N	9.8666673078272e+15	1.0651667070451712e+16	\N	\N
fa3a0781-421a-47f2-9878-d33eb44b246e	66755	Đại Ngãi	\N	\N	9771388928	1058666688	\N	\N
90c094fb-3f54-4803-b307-a52a52477fbb	74162	Sơn Tây	\N	\N	2115611136	1058725	\N	\N
cdb5f737-ec17-4217-9801-bb88820a2bc7	68738 	Chợ Lách	\N	\N	1.0283333896372224e+16	1.061166696628224e+16	\N	\N
f2fd1e63-502f-48b6-9797-9b8ef7fce1ea	69754	Trà Vinh	\N	\N	99778	10635	\N	\N
5bb2294b-b1c1-4e58-9ab4-57fd8f09d9d5	74113 	Vĩnh Yên	\N	\N	2.2366667111661568e+16	1.0446667207671808e+16	\N	\N
ec9219d0-a727-4f54-92d9-90abae093a14	71720	Đắk Nông	\N	\N	12992	107692	\N	\N
a7ef7aaf-a28f-494a-9dde-b02bf2135ade	74165	Hà Nội	\N	\N	21031	105859	\N	\N
fd82667f-61a1-4ab8-8574-f2059c81dc37	48825	Hà Ðông	\N	\N	2.096666668695552e+15	10575	\N	\N
cee8bd81-8336-4861-a2a1-2fe3bfa17510	71545	Tiên Sa	\N	\N	0	0	\N	\N
c15e4ba2-6e7d-4619-9863-3cbe4340a768	71592 	Trị An	\N	\N	1143888896	1074416640	\N	\N
1a331a5f-28e2-4a8a-a924-5a8ccaa22a8a	48822	Hưng Yên	\N	\N	2.066666590568448e+15	1.0605000103297024e+16	\N	\N
a35d2116-640e-4fdf-ab36-d9a379f74bc9	74122	Ngòi Nhù	\N	\N	22136084	104279720	\N	\N
cebd28e1-90ee-4131-84ee-e87336ca89ed	74120	Bảo Hà	\N	\N	22173	104035	\N	\N
79f57651-0e2a-408b-8eb4-13b4916f28c1	74105	Nậm Mức	\N	\N	2169166592	1030775	\N	\N
ba9755a8-15ee-4e47-8a0a-84a4210c803a	69718	Giang Sơn	\N	\N	125	1082	\N	\N
b2f428aa-c5f8-4456-b198-a15594c1b2c5	71585 	Phước Hòa	\N	\N	1.1533333662007296e+16	1.0786666482499584e+16	\N	\N
3797e65c-527e-4dfb-95fb-8104b4da55ae	66762	Long Xuyên	\N	\N	10378	10545	\N	\N
83a24ad0-dc4d-440c-8058-e8a09c30b3df	73404	Lý Nhân	\N	\N	20023	105594	\N	\N
29c68ab6-6f5c-4695-801d-f1c2c781a03e	48877	Nha Trang	\N	\N	1.2300000356728832e+16	1.0913333657993216e+16	\N	\N
8d90363c-2ba7-4cca-aade-f9d5e3e60573	69759	Tân Châu	\N	\N	108	1052167	\N	\N
27f5728b-fdd4-4d35-9823-6724b3369386	69727	Cao Lãnh	\N	\N	10416645	105643912	\N	\N
82b4c0d8-ec49-4f3c-964c-b4a20c599f8c	70608	Bến Lức	\N	\N	10633	106475	\N	\N
e59f3ab9-81c1-4f49-9f4a-b0f08fe32d5e	70601	Gò Dầu Hạ	\N	\N	11075	106267	\N	\N
b40582ec-aecc-44be-9175-ad9e266cd035	71564	Hòa Mỹ Tây	\N	\N	12865392	109152584	\N	\N
11d0a306-d7d1-4e1a-a27f-51bb7c80b6a6	72446	Cẩm Nhượng	\N	\N	1826666624	1061166656	\N	\N
8dba017d-f793-4b52-9951-f5ad8b7643c0	69731	Mỹ Tho	\N	\N	1035	106367	\N	\N
75da1e5f-e042-4f0c-9b94-826863ed122b	70606	Mộc Hóa	\N	\N	10781	105933	\N	\N
87dbc9e5-f6d8-4cc7-830e-3b52988e2c39	70610	Tuyên Nhơn	\N	\N	1066666688	1061666688	\N	\N
91092141-a5f1-498e-991d-803cc8a4be1d	68739 	Mỹ Hóa	\N	\N	1.0216666340261888e+16	1.0633334002548736e+16	\N	\N
53ffeb0b-1fc5-4ff7-ad4b-ababa4b54a2b	69726	Hưng Thạnh	\N	\N	10661	105778	\N	\N
e22320e5-bd04-45d9-a4e3-1f8085b78b4c	69741 	Bình Đại	\N	\N	1019888896	1067141696	\N	\N
5e7cc3b6-ec2e-4d7a-9695-ac16b2e1b909	71500	Đồng Tâm	\N	\N	179	106017	\N	\N
97de7dee-1105-4f99-a420-5b2369e11776	74194 	Triều Dương	\N	\N	2.01500001304576e+16	1.061166696628224e+16	\N	\N
580b3450-0b71-4925-af6c-f30ad69f383f	74117 	Ba Thá	\N	\N	2.0799998333550592e+16	1.0569999341060096e+16	\N	\N
abfce56e-8391-4998-ab16-481dc7a996af	48839	Bạch Long Vĩ	\N	\N	2.0133333509865472e+16	1.0771666309218304e+16	\N	\N
bb228b84-38d2-45e0-8ffe-dc59a40d9b8e	48829	Văn Lý	\N	\N	2.0116666889273344e+16	1.0630000034185216e+16	\N	\N
8769d927-f0e0-408b-a0b2-9a79738faad6	74195 	Thái Bình	\N	\N	2.0450001448599552e+16	1.0633334002548736e+16	\N	\N
0cccc121-86e1-4767-9f47-f85819c8213c	74180 	Như Tân	\N	\N	2.0016667165720576e+16	1.060999998210048e+15	\N	\N
d0fc3f2d-e00f-4a35-8985-c9adcf66f463	73410	Xuân Khánh	\N	\N	1992	105583	\N	\N
a402f044-7a9d-4199-946d-6594875cee87	74185	Phú Lễ	\N	\N	20059	106204	\N	\N
e1059411-8bc5-4262-9191-6ee3b7e63cf4	66763	Vàm Nao	\N	\N	302	882	\N	\N
0a6a3f38-cd2f-497c-87fe-4475b1725b2d	48821	Hà Nam	\N	\N	2.0516665783484416e+16	1.0591666377326592e+16	\N	\N
00be8704-de8e-47e9-a293-6bba776e670e	74196	Tiến Đức	\N	\N	20584972	106132080	\N	\N
18d525d3-3183-431d-92c1-de4f5305f0b5	91310 	P.Lộc Phương	\N	\N	2.128333328351232e+15	1.0591666377326592e+16	\N	\N
c5b76d05-d8eb-49d3-b0eb-d7e614e15a44	74179 	Phủ Lý	\N	\N	205	1.05900001984512e+15	\N	\N
8cca0261-2049-45f6-9e3d-b952e2f13901	91340	Chanh Chử	\N	\N	20734	106408	\N	\N
67e032bb-b8e3-481b-83ff-41dbca9502a7	73403	Cẩm Thủy	\N	\N	20205376	105464232	\N	\N
174b87cd-fead-4fbf-865a-5ead7242c227	70607	Tân An	\N	\N	10539	106417	\N	\N
7066dfe7-3be6-4ebc-a949-47bb04ef6766	69734	Long Định	\N	\N	10397	106261	\N	\N
6da333bb-79aa-4220-a99d-2867829fef2d	66760	Châu Đốc	\N	\N	10706	105125	\N	\N
29d21cfb-a807-4a01-bd8f-ba5d1e6ed305	91313	Phủ Lạng Thương	\N	\N	21291	106181	\N	\N
b1e6e019-6e2c-4728-b565-7ffd10f6581c	69703	Đắk Mốt	\N	\N	1475	107767	\N	\N
e73b0042-9bbb-4354-ae3d-ddc6234f4598	48/54	Bắc Ninh	\N	\N	2.1183332754653184e+16	1.0608334071660544e+16	\N	\N
a16d3600-787f-4c48-bd06-05a79188f7ff	91172 	Cát Khê	\N	\N	2.103333263245312e+15	1.0628333586874368e+16	\N	\N
68752786-6d1f-4ed1-be79-84bd38202a46	91171 	Bến Bình	\N	\N	2.104999978991616e+16	1.06350000472064e+15	\N	\N
99fe134a-4666-4616-9f3e-1af24d12510c	86208 	Lạng Sơn	\N	\N	2.183333337366528e+15	10675	\N	\N
1291e506-a1c7-470a-9c22-4b79f9b16819	48/46	Mẫu Sơn	\N	\N	2.1849999725821952e+16	1.069500006924288e+16	\N	\N
1fab46b4-c533-426c-bafb-39bd2d25e0a9	48823	Nam Định	\N	\N	2.0433332680523776e+16	1.061500026355712e+15	\N	\N
5bb1fccf-6187-4273-b40e-bed14c91195c	72432	Con Cuông	\N	\N	19067	104853	\N	\N
8fa063d3-714b-4c30-98c9-cf3b29f7d6f8	91325	Bến Triều	\N	\N	21058	106495	\N	\N
db8fea9d-56fc-41ec-b158-ac769ea17c3d	48/59	Chí Linh	\N	\N	2.1116666272284672e+16	1.063833334448128e+16	\N	\N
db79590e-c3e7-4695-9732-394574b130eb	91175	An Phụ	\N	\N	20983	106506	\N	\N
f0c72d5d-d91c-48ec-81f1-040160702cff	73414	Chuối	\N	\N	1953666688	1056555584	\N	\N
a0ac792e-e4ee-4e71-af96-acb2f418ba2d	91311	Đáp Cầu	\N	\N	21207	106081	\N	\N
bb278f68-3b3b-4ef9-b807-0b217fba7c0c	48824	Ninh Bình	\N	\N	2025	1.0598333240311808e+16	\N	\N
b3a2f35a-5946-4269-838e-b5cb8336f098	91176 	Bá Tha	\N	\N	2.0866666963402752e+16	1.0645000207466496e+16	\N	\N
b56e6bc8-cb94-4ecb-b292-3b97e3dc4806	74190 	Ninh Bình	\N	\N	2025	1.059666679300096e+16	\N	\N
9bf69d3c-dce0-4159-b938-3dde0c0cc9b3	91170	Phả Lại	\N	\N	21115	106293	\N	\N
87cebcdf-6bab-4139-aa64-d53146d0bbbf	48/83	Cát Tiên	\N	\N	1.1633333385560064e+16	1.073999991799808e+15	\N	\N
8e55a3d0-ec0b-4a55-8555-8e5c021cfb5a	74166	Thượng Cát	\N	\N	21072	105873	\N	\N
f0ca5403-3388-46dd-a24a-2049ed285367	91317	Bến Hồ	\N	\N	21071	106082	\N	\N
bd93374a-4c47-48ce-af3c-639dc4e6ab7a	71578	Phan Thiết	\N	\N	1092638848	1081016704	\N	\N
170e3b10-7c37-416d-a648-26617cb2cde5	48887	PHan Thiết	\N	\N	1.093333317320704e+16	1.08099998318592e+15	\N	\N
b3e6b4b1-7d05-464e-905a-8a4660b43d46	74182	Gián Khẩu	\N	\N	20324	10592	\N	\N
0145191d-06df-4b73-8ad3-e1fd10176025	74183 	Nam Định	\N	\N	2.041666659680256e+15	1.0616666308214784e+16	\N	\N
c9e8801e-57e3-4996-a7d5-77db5f1243a5	71581	Đại Nga	\N	\N	11533	107873	\N	\N
c9691791-2d08-45da-a9b7-2186e2d49c82	91312	Cầu Sơn	\N	\N	21447	106317	\N	\N
75623b96-0334-46f5-b313-3877e061c50f	72441	Chu Lễ	\N	\N	18183	105717	\N	\N
14e4c151-cf46-4a38-9f52-44ff91397dac	71588	Thanh Bình	\N	\N	11775	108292	\N	\N
b7114f23-44e7-4ec6-9466-d1b8182c7031	72426	Đô Lương	\N	\N	18911	105294	\N	\N
d613bd2c-4768-4be2-bf2c-cc1898c1483e	71559	Phú Lâm	\N	\N	13069	109324	\N	\N
344f323c-fa4b-400f-bebf-35b888228889	69719	Đức Xuyên	\N	\N	12297	107983	\N	\N
b9b60ed1-ddd6-489b-bf42-9f69a6e779cc	48/53	Hiệp Hòa	\N	\N	2.1350001108058112e+16	1.059666679300096e+16	\N	\N
6fc778c9-1db5-4874-8780-6174a744fb68	71566	Ninh Hòa	\N	\N	125	109133	\N	\N
9ff125f8-739f-4074-9c50-1694a4da8ed4	73420	Thạch Quảng	\N	\N	2035	105517	\N	\N
8a1c9e34-2245-42f9-bf56-48cb21f231f5	48844	Tương Dương	\N	\N	1.9266667091591168e+16	1.0446667207671808e+16	\N	\N
57864dbe-1b1c-4e46-9316-be7a7d8e2dd8	91341	Kiến An	\N	\N	20818	106622	\N	\N
8f041c55-ef3a-472f-9c68-3095f7bd17b9	91344	Trung Trang	\N	\N	20837	10649	\N	\N
e4592db6-6faa-482e-97e7-b7cb72b875ad	48890	Phan Rang	\N	\N	1.158333352378368e+16	1.0898333484711936e+16	\N	\N
3d6586a0-fb67-40be-91da-3315cf8dc227	48902	Ba Tri	\N	\N	1.0050000134340608e+16	1.066000011231232e+15	\N	\N
45813883-bdc3-4fd8-aadb-12e9d72132a1	48/55	Lục Ngạn	\N	\N	2.138333220175872e+16	1.0654999965073408e+16	\N	\N
0195081a-b9d1-4036-8911-53bd454e3a80	48/76	Tây Hiếu	\N	\N	1.9316666953367552e+16	1.054000006823936e+15	\N	\N
5d383e3a-43e8-4964-acd7-e54e8c11905d	48879	Cam Ranh	\N	\N	1.1916667009368064e+16	1.091500037373952e+15	\N	\N
2bbb68eb-3257-4cae-8c81-588017ae3135	14690	đang cập nhật	\N	\N	0	0	\N	\N
44056913-c7e0-4ab3-bad8-2308b292f252	71573 	Phan Rang	\N	\N	0	0	\N	\N
0a53b0d0-1af0-40b6-8c31-4dee9539d83e	72424	Thạch Giám	\N	\N	19283	104333	\N	\N
334bb0fa-1af4-4941-9618-4d1041d6878f	91314	Cẩm Đàn	\N	\N	21346	106783	\N	\N
2780733f-2ff8-403b-8d3c-13328ac57fcd	48828	Hòn Dấu	\N	\N	2.066666590568448e+15	1.06799998959616e+16	\N	\N
c3cd8d3d-d477-40d4-863f-43f5b3d68db2	48903	Vũng Tàu	\N	\N	1.0366666999332864e+16	1.0708333795213312e+16	\N	\N
f33bcaa4-d70a-4068-913e-f9cef8abe517	48/940	Trà My	\N	\N	0	0	\N	\N
f9119896-62d9-4e6c-9559-c0dcabedfea7	48/930	Tam Kỳ	\N	\N	0	0	\N	\N
4de39071-10fd-460b-b9c3-2def5b552b9e	48/85	Lý Sơn	\N	\N	15.383333206176758	109.1500015258789	\N	\N
d609a8a0-a4aa-4aa1-ad8f-4ec2d6e51816	48920	Trường Sa	\N	\N	8.649999618530273	111.91666412353516	\N	\N
9402d68d-1abb-44fe-a7fc-c6bccae71b00	488490	Đông Hà	\N	\N	0	0	\N	\N
ab57b3a5-3e33-4edb-b07e-760d14bec88c	14699	đang cập nhật	\N	\N	0	0	\N	\N
bfe4ef7f-83b3-421a-bc53-31928b13cb8e	48916	Thổ Chu	\N	\N	9.283333778381348	103.46666717529297	\N	\N
291cf88c-f329-40d2-8b54-a2166d723c1a	48/89	Cồn Cỏ	\N	\N	17.16666603088379	107.3499984741211	\N	\N
be4c03c8-5537-4fb4-90db-3eb612499698	790001	KTHV Trường Sa	\N	\N	8.6446443	111.9157871	\N	\N
5fae0797-cd03-42b0-ae0d-3ee8440cf58f	48/900	Khe Sanh	\N	\N	0	0	\N	\N
3baed114-f071-4eb5-81b4-1dd906f5a132	92413	Thuyền Quan	\N	\N	0	0	\N	\N
304aa3e6-b9fe-4944-8f4e-8301b32baed2	64394	đang cập nhật	\N	\N	0	0	\N	\N
839b3f65-4907-4ff4-89ee-5645f71cad91	46095	đang cập nhật	\N	\N	0	0	\N	\N
1d94cb32-3a36-498d-b9f1-b272b5dac3a0	873308	đang cập nhật	\N	\N	0	0	\N	\N
8e2b883a-00af-4620-ae4e-4fdf0fa9cf6b	48015	đang cập nhật	\N	\N	0	0	\N	\N
da373d93-6f7a-481a-a8cb-21d348506f0e	14696	đang cập nhật	\N	\N	0	0	\N	\N
4e3f57b8-58bb-43ae-8949-4f72285cd0c6	739751	Mường Típ	\N	\N	0	0	\N	\N
b4b37ac8-3433-4784-8e87-547cf2b9eb24	41040	đang cập nhật	\N	\N	0	0	\N	\N
f0666594-72b3-4969-8c7a-235e7660aba9	48026	đang cập nhật	\N	\N	0	0	\N	\N
39b37eed-fe98-4d8a-9685-0b52a0db3e0f	48035	đang cập nhật	\N	\N	0	0	\N	\N
1cb74135-8671-4024-ae39-b8f52df69867	48027	đang cập nhật	\N	\N	0	0	\N	\N
79c8ba13-5ae5-4978-8ef5-8fe777d22483	40769	đang cập nhật	\N	\N	0	0	\N	\N
21261102-7bf4-41df-ad83-e019dbf197a0	48013	đang cập nhật	\N	\N	0	0	\N	\N
6a1c92c8-b93f-426f-9814-3467320e93e1	48033	đang cập nhật	\N	\N	0	0	\N	\N
3066fb73-fabb-4533-be87-8eb198aef1fe	48032	đang cập nhật	\N	\N	0	0	\N	\N
7f786633-44ef-4552-86c3-3019f92eb0d1	1021110108	Luân Giới	\N	\N	0	0	\N	\N
a239c20e-7359-41e6-8072-6de9d4a3e1d6	730017	Trọng Hóa	7828	\N	17.858056	105.802778	\N	\N
5b103895-24d1-40a1-91b9-a8a93ee908ae	74128	Ngòi Thia	\N	\N	2184	104657	\N	\N
089f8acc-9b90-475f-8fb6-c686eb428770	48/03	Tam Đường	\N	\N	2.241666643656704e+15	1.0348332857688064e+16	\N	\N
3fabc1be-9c88-45d6-9d11-051334706bf4	48/25	Mọc Châu	\N	\N	2.083333345378304e+15	1.046833317019648e+16	\N	\N
aa7f499f-63f6-4886-b284-5d8ceec897b0	74137	Bắc Quang	\N	\N	22496	104873	\N	\N
39fac6f8-3cad-4658-aa3b-868dd146b091	48/34	Bắc Quang	\N	\N	225	1.048666731184128e+16	\N	\N
796e0746-010d-45dd-bea0-87c405c46c85	91337	Đông Xuyên	\N	\N	20681	106562	\N	\N
46d07018-4ca1-40fa-9820-82b21babdc84	375783	Thượng Sơn	\N	\N	2265991	10485856	\N	\N
7e3fc2e5-6383-4e71-af2b-61442439a3a5	230006	Nậm Ban	\N	\N	23084168	105360560	\N	\N
529ff2e7-9207-4e20-9849-d81324ade797	48/31	Hoàng Su Phì	\N	\N	2275	1.046833317019648e+16	\N	\N
007557b0-b92f-4ce9-b9d1-f5ee077e3e2a	72423	Mường Xén	\N	\N	19408	10413	\N	\N
39eec49a-262d-4753-b74e-a5afc60b6c41	230005	Ngọc Long	\N	\N	22993888	105315280	\N	\N
a40b6d0a-8720-4a90-9b8a-ad639d78e632	74106	Nà Hừ	\N	\N	22375	10287	\N	\N
5b1d5c66-71e2-41f3-9ea6-894860bf29e8	74110	Vạn Yên	\N	\N	210683	10471	\N	\N
c8de389b-b178-4b98-a967-448dec88dfc8	91301	Chợ Mới	\N	\N	21878	10578	\N	\N
50b1949d-4a73-407a-9aff-0d85f1507200	48/72	Tĩnh Gia	\N	\N	1.9449999918104576e+16	1.0578333725097984e+16	\N	\N
f75bcb67-2da7-403d-938e-07ee5872c06a	74136	Đạo Đức	\N	\N	22267	105763	\N	\N
8bad2b4e-1cc6-4d01-adf3-4a1d37d38f7c	353105	Linh Thông	\N	\N	22008194	105675808	\N	\N
fc59be56-4d65-4914-9c7d-0788ed507acf	48/01	Mường Tè	\N	\N	2.2366667111661568e+16	1.0283333896372224e+16	\N	\N
5bcad796-b47b-4109-8ea2-0380457d5363	48805	Hà Giang	\N	\N	2.2816668015132672e+16	1.0496667069448192e+16	\N	\N
df88a460-8aaf-4e99-823f-1869bcd81768	74102	Nậm Giàng	\N	\N	22255	103159	\N	\N
3e60ccad-d9cd-4bb3-ba63-9b016a4e539a	48/32	Bắc Mê	\N	\N	2.2733332764688384e+16	1.0536667173617664e+16	\N	\N
68c71920-f889-4212-966f-b211d788f098	74127	Ngòi Hút	\N	\N	21933	10455	\N	\N
c1524353-38d8-403a-b7ea-43fe130f5555	230009	Chi cục thủy lợi	\N	\N	22829408	104979792	\N	\N
f4d11f12-cad4-44b1-b5ae-c197af335d7e	361934	Cao Bồ	\N	\N	2274897	10491164	\N	\N
294fe06b-f85f-4871-8035-5fb9ca73360d	386804	Lao Chải	\N	\N	22837804	104768368	\N	\N
d87e75f1-ad88-40f9-9d1c-32f93ec07993	48/14	Văn Chấn	\N	\N	2.158333406478336e+15	1.0451666549604352e+16	\N	\N
b6658d2e-68b1-467d-9d1d-6fc853908d01	74135	Hà Giang	\N	\N	22828	104981	\N	\N
08ffad7a-95eb-48b7-b2ee-345143f9ca8c	230020	Du Già	\N	\N	22930832	105224720	\N	\N
64d86361-0364-4e4e-bdcb-3ff25af7e28c	029964	Tân Tiến	\N	\N	22740694	104726720	\N	\N
7702b249-3cbf-4bfc-813c-a82336de0215	48812	Tuyên Quang	\N	\N	2.1816666484637696e+16	1.0521667000336384e+16	\N	\N
1a54216b-b4a0-47ee-a501-54a11c498061	91339	Quang Phục	\N	\N	20757	106542	\N	\N
ee817441-507c-4af0-b5d7-f063e2fb6162	48/33	Bảo Lạc	\N	\N	2.2950000979869696e+16	1.05666664464384e+16	\N	\N
377ae4a6-d768-45e7-b453-941f38a83704	74201	Bảo Lạc	\N	\N	22958	105676	\N	\N
d2038544-5d4a-4c35-a781-1332fde1a516	48838	Móng Cái	\N	\N	2.1516667313979392e+16	1.0796666240106496e+16	\N	\N
e74df835-cf82-478d-af12-4aa92e3299b9	48/44	Định Hóa	\N	\N	2.191666647662592e+15	1.0563333551816704e+16	\N	\N
c016ca0d-8b26-4505-a78e-ebcbd59b4d1a	73109	Xã Là	\N	\N	20936	103922	\N	\N
7251cdda-2f02-45a4-ab08-60d6b19212fd	029994	Huyện Bắc Mê	\N	\N	2273925	105312416	\N	\N
ae997ba2-d5dd-4905-b54a-115ee6e9e091	48800	Mường Lay	\N	\N	2.2066667941003264e+16	1.031500015337472e+15	\N	\N
99ec320b-e099-4800-a4f4-7766423f3fae	74154	Phú Thọ	\N	\N	21399	105226	\N	\N
8a21297f-18fd-4c15-934b-16ec24a10fde	74148	Chiêm Hóa	\N	\N	22093	105275	\N	\N
b8324d00-2d57-4ab6-924e-3c1187997a62	230008	Quyết Tiến	\N	\N	2302	104965280	\N	\N
7c773642-baab-43db-8495-e8796badc73c	390483	Xín Chải	\N	\N	2287058	104808032	\N	\N
610c3170-0547-4359-a392-ed3336576527	386163	Thuận Hòa	\N	\N	2290563	10500647	\N	\N
0fa58f3d-3fd9-467d-a769-a4f906a042dc	73411	Quảng Châu	\N	\N	1977	1058522240	\N	\N
b71b24e0-a80f-410f-9907-be02681fa23c	91300	Thác Riềng	\N	\N	22087	105884	\N	\N
3bd03c95-fd19-4dda-924d-304c4f078248	48/81	Hòn Ngư	\N	\N	1.8799999567527936e+16	1.0576667277787136e+16	\N	\N
379b71a7-62fe-4a1e-a4cf-d8e6229974e8	48/23	Minh Đài	\N	\N	2.1016666548731904e+16	1.0505000379744256e+16	\N	\N
34b9c22a-5d77-4332-8ae1-bcdd58de8fc9	66791 	Sông Đốc	\N	\N	9033333760	1048333312	\N	\N
6042a24e-d4b8-4e95-a12b-950528f894cc	74147	Na Hang	\N	\N	22361	105391	\N	\N
6d639cb3-0c8c-475a-904a-f34b21985a2c	48917	Phú Quốc	\N	\N	1.0216666340261888e+16	1.03966662721536e+16	\N	\N
77b4edd7-044b-4677-90c7-1576cd058e57	48/37	Chiêm Hóa	\N	\N	2.2149998896480256e+16	1.0526667416010752e+16	\N	\N
ac769c57-e326-40fd-bd29-88e900db7ca2	74153	Thanh Sơn	\N	\N	21188	105157	\N	\N
9b88fa62-7c54-4e44-9dd7-8fdf8706c7f7	74101	Mường Lay	\N	\N	2208333	1031667	\N	\N
7b747a40-5c01-4cbb-b055-c758847559fb	72445	Thạch Đồng	\N	\N	1836694400	1053783360	\N	\N
6cb52550-0bad-4053-a056-58f51727b139	230004	Minh Ngọc	\N	\N	22774168	105168888	\N	\N
6c2e5834-33fd-4c56-b479-d4e6a965ceb8	48/36	Hàm Yên	\N	\N	2.2066667941003264e+16	1.0503332858691584e+16	\N	\N
d914d3c0-d53a-4cb7-b029-b54d2d2fd41a	48/74	Quỳ Châu	\N	\N	19559	105145	\N	\N
dbdc03cc-8862-455c-a61d-dfed45a5cf42	71558	Củng Sơn	\N	\N	13042	108983	\N	\N
ce326f2d-fe4f-45b8-ae0b-b65edffc2d5c	48840	Thanh Hóa	\N	\N	1975	1.0578333725097984e+16	\N	\N
cf94d463-5966-4766-be75-14732b360cc1	48/02	Sìn Hồ	\N	\N	2.2366667111661568e+16	1.0323332926799872e+16	\N	\N
145f9151-ed58-4be2-a8f3-34860e009a50	73405	Giàng	\N	\N	19876	105759	\N	\N
16d81b6d-5c88-47a4-bdde-f1edc204f2bc	74146	Tuyên Quang	\N	\N	21822	105219	\N	\N
fa0e1914-1827-4540-80f7-2ea82adfbdd0	029758	Thông Nguyên	\N	\N	2256275	104740584	\N	\N
ccb2efc7-76d7-4572-adcd-cde3e8b7c53c	48875	Buôn Ma Thuột	\N	\N	1.2666667083497472e+16	1.0805000624144384e+16	\N	\N
390cbbd6-7c4c-4165-aa5b-b4598be745ad	48/40	Nguyên Bình	\N	\N	2.2649999661727744e+16	1.0594999271948288e+16	\N	\N
7fb03d4c-9b16-4441-8b84-f05c6de74bfd	48807	Thất Khê	\N	\N	2225	1.0646666654777344e+16	\N	\N
ce667c32-a9c1-488c-907a-161c88711ae7	48811	Điện Biên	\N	\N	2.136666772865024e+16	103	\N	\N
61d911ba-0821-413f-97ca-ed3fbf829227	91336	Cửa Cấm	\N	\N	2088	106629	\N	\N
d3f1a17a-2844-4e83-8fa9-b29c7791c81c	74139	Bắc Mê	\N	\N	22733	105367	\N	\N
edd64369-7b46-4b80-94cd-b2c0e4d9f98d	48802	Sa Pa	\N	\N	2.235000049106944e+16	1.038166609887232e+16	\N	\N
485d0898-6d80-468b-897f-77c540f95059	48/35	Lục Yên	\N	\N	2.210000118218752e+16	1.047166713856e+16	\N	\N
9bf211e9-a5e6-4681-9bad-7973047c2db4	48/42	Ngân Son	\N	\N	2.2433331446546432e+16	1.056500013334528e+15	\N	\N
35f011d7-3aa2-47c7-ae98-1f43a99231b2	170003	Thụy Trường	\N	\N	2060111	106611352	\N	\N
75178c99-b141-42af-bc2b-c353bcba025a	48/51	Phú Hộ	\N	\N	2.145000083161088e+16	1.0523333447647232e+16	\N	\N
c0e65c5a-c80d-419d-a13b-174efa59bade	48/75	Quỳ Hợp	\N	\N	1.953333275262976e+15	10525	\N	\N
4b158776-dfa7-47a2-a936-6740c4bfab87	74157	Quảng Cư	\N	\N	21519	105492	\N	\N
68a889fa-7ae6-4657-9c80-95b4b7104e68	48834	Cô Tô	\N	\N	2.0983333307547648e+16	1.0776666724892672e+16	\N	\N
645eff02-2a88-4d4f-b5ce-70895f2a8e58	73412	Lèn	\N	\N	1999861120	1059491648	\N	\N
0d018327-72c8-45f5-bc44-b029750d147a	48808	Cao Bằng	\N	\N	2.266666574544896e+15	10625	\N	\N
52be3dd2-fc83-4716-9ee2-c7506a8b4b3a	86202 	Bằng Giang	\N	\N	2.2649999661727744e+16	1.062666713956352e+16	\N	\N
c734d32f-0e2d-43a4-a2ee-77544bc83438	323592	Thu Tà	\N	\N	2267343	10455345	\N	\N
e736985e-9e36-41fd-a053-810a5440651b	48/60	Uông Bí	\N	\N	2.103333263245312e+15	10675	\N	\N
676c6c28-8c41-4266-a0e5-80ca9446309b	48/52	Tam Đảo	\N	\N	2.146666664689664e+15	1.056500013334528e+15	\N	\N
b77df7e3-8718-4815-9af1-9dba9e6d3cf9	74145	Ghềnh Gà	\N	\N	21861	105189	\N	\N
d0bea297-c9fd-4571-bcef-0d1f60e066b9	48869	Eakmat	\N	\N	1.26833337040896e+16	1.0813332860698624e+16	\N	\N
d900aa7e-f6c9-4f2a-a4bf-95e3ed3e7980	48/39	Chợ Rã	\N	\N	2.2450000214622208e+16	1.0571666862112768e+16	\N	\N
fb2c480c-e579-4257-9e6c-3ca427f8e747	48813	Việt Trì	\N	\N	2.129999909879808e+16	1.0541666515550208e+16	\N	\N
44ebfa40-2fae-4d8d-a8a4-f19875d1bfdc	73413	Cụ Thôn	\N	\N	1996666624	1058833344	\N	\N
b6e02dba-8fb1-413b-8c5b-287d4791724d	74003	Bản Yên	\N	\N	21267	10303	\N	\N
67c48acd-f2c5-4fd9-80db-10719f378b50	86209	Văn Mịch	\N	\N	221	1063833344	\N	\N
9b419f47-4565-43ef-8d8a-3ad177b76c0f	91318 	Đồ Nghi	\N	\N	2.0933333445771264e+16	1.0676667001339904e+16	\N	\N
e1e086bf-2e96-4869-9c23-8facb547b7b2	48904	Càng Long	\N	\N	9.983333651972096e+15	1.061999920283648e+16	\N	\N
16d9c0b6-62d9-4354-8b90-948dcf2c0a74	48/20	Phù Yên	\N	\N	2.1266665857613824e+16	1.0463332754522112e+16	\N	\N
2087172d-9f99-4f73-a2df-4cc6c2a85418	48882	Ðak Mil	\N	\N	1.2449999942057984e+16	1.0761666551611392e+16	\N	\N
189a49e2-36d7-45c5-9313-b76be5a5c4a5	48818	Hòa Bình	\N	\N	2.0816667101626368e+16	1.0533333205254144e+16	\N	\N
6e4dd147-b577-4b93-a02a-9b2966c7a2aa	73401	Mường Lát	\N	\N	20549	104578	\N	\N
f322426d-d6f9-4b26-bacd-d8d112ea2925	74114	Hòa Bình	\N	\N	20821	105331	\N	\N
4cecad25-86a5-49de-8fd8-dbdb07914e6f	74138	Vĩnh Tuy	\N	\N	22267	104886	\N	\N
ba07cf12-0a42-4c4d-89bc-d765cac7e178	48/47	Bắc Sơn	\N	\N	2.1899999587598336e+16	1.0631666481496064e+16	\N	\N
e6ed0c41-520e-4f2d-8682-43b2ba35ae15	48815	Yên Bái	\N	\N	2.17000001404928e+16	1.048666731184128e+16	\N	\N
76d099dc-8baf-44da-bd31-1937589be6ae	73417	Ngọc Trà	\N	\N	1960694400	1057744448	\N	\N
43e5bed3-27f9-4e29-95a8-d94075565935	91305 	Bắc Kạn	\N	\N	2212083456	10585	\N	\N
31baf741-221b-4947-89b4-624877840667	295597	Nam Cường	\N	\N	22374168	105600280	\N	\N
68e7b035-8474-465e-aa2f-a46418bcba20	48/08	Mù Cang Chải	\N	\N	2.1849999725821952e+16	1.0408333550813184e+16	\N	\N
d98f24f6-5e84-495d-9bfe-7c6337c5e4b9	48878	Buôn Hồ	\N	\N	1.2916667466121216e+16	1.0826666586669056e+16	\N	\N
3d5fb129-3e9d-4d24-b8c8-f0c7260436e5	48886	Đắc Nông	\N	\N	12	1.0768333414596608e+16	\N	\N
d8ed1a45-d5a7-480e-a463-8bc44fd4633f	48/06	Than Uyên	\N	\N	2.1950001596858368e+16	1.0388332961857536e+16	\N	\N
4b0899f0-7256-4326-8504-4ee9e747b9ea	72421	Quỳ Châu	\N	\N	19559	105145	\N	\N
576fe355-d6d2-4a08-9b3a-d0f42354f53f	74129	Yên Bái	\N	\N	217	104883	\N	\N
2235b44a-2d25-423e-8d5c-cab03c92028e	74155	Vụ Quang	\N	\N	21570884	105256192	\N	\N
67056c1f-5e59-4686-afa9-1f2555c409f8	74142	Đầu Đẳng	\N	\N	22452	10558	\N	\N
1a726026-526c-42d1-8ade-9678c23e3e64	74144	Hàm Yên	\N	\N	22054	105088	\N	\N
1a8f5a78-0a6b-4e7a-b885-60aa40e31fa3	74125	Mù Cang Chải	\N	\N	21867	104333	\N	\N
0e9e52c1-99d7-4e13-89ed-434c6067801c	490066	Đưng K'Nớ	\N	\N	1218181	1083763	\N	\N
01a6601b-0160-43d6-9297-e466f56a5013	331696	Bản Díu	\N	\N	2274451	10454979	\N	\N
ef051217-37e2-4004-82c0-f74c96ebf163	230011	Tân Trịnh	\N	\N	22411944	104714720	\N	\N
a5eac58d-3eca-40f9-9e88-64a3c712249e	48/66	Thanh Hóa	\N	\N	1975	1.0578333725097984e+16	\N	\N
8ee23337-795a-44bd-8b0b-6456498bf459	72436	Cửa Hội	\N	\N	18751	105732	\N	\N
f8ea63f6-25cd-4cfd-a81b-5a8ca952c078	74104	Tà Hộc	\N	\N	212078	104358	\N	\N
0c46521d-6e48-4eda-9450-cd696e3a8f23	74156	Việt Trì	\N	\N	21295	105431	\N	\N
ec6ebfdd-32d8-4ce8-beb5-e578975c587b	00204EAA	K6+200 đê biển 8 Thái Thụy Thái Bình	\N	\N	20586952	106609184	\N	\N
09f85157-2255-41c9-b536-9cfdf3742485	349415	Chế Là	\N	\N	2263212	10451327	\N	\N
0a60e10e-6c71-420d-b5b0-c5f7a6decfbb	095170	Nga Thiện	\N	\N	20034588	105967104	\N	\N
95ccc750-cd18-46ed-96f6-692939a5fd95	48/68	Sầm Sơn	\N	\N	1975	1.05900001984512e+15	\N	\N
bd123386-510f-4dbf-8f1f-633364c03d3b	48907	Rạch Giá	\N	\N	1.0016666893156352e+16	1.0506666827055104e+16	\N	\N
e70828dd-7f77-4a52-9fd9-3a63d36f9f7c	170008	Trà Giang	\N	\N	2048537	10646211	\N	\N
f5316496-2e1c-416a-ae41-1f113501d638	48835	Thái Bình	\N	\N	2.041666659680256e+15	1.063833334448128e+16	\N	\N
ea4e47ae-e648-4cd2-836f-adc44dc231e1	72425	Dừa	\N	\N	18988	105044	\N	\N
d38244c9-6207-430f-9306-4720c44fe8e2	69717	Cầu 14	\N	\N	12617	107933	\N	\N
bb8594a6-cae8-42c8-9e20-26053699b3d8	48/98	M DRAK	\N	\N	1.2733333565865984e+16	10875	\N	\N
8f344df2-9e11-44b0-b3fb-de2835472cba	230022	Tiên Nguyên	\N	\N	22506668	104685280	\N	\N
1e839834-d9ee-4844-9d62-fe50ea4a3782	029971	Thị trấn Cốc Pài	\N	\N	2268325	104462280	\N	\N
1ee30138-ed88-4d17-9291-57d1de35fe45	170001	Vân Trường	\N	\N	2037077	106477800	\N	\N
9ecbbdd0-aa20-492d-b807-12feb875aac3	350003	Yên Đồng	\N	\N	20099360	105969760	\N	\N
aaee43db-5cbd-4c7d-93b8-fcf04b489986	48/30	Bắc Hà	\N	\N	2.253333385445376e+15	1.0428333066027008e+16	\N	\N
d1c2e879-896d-49cc-a650-054010d0cfd8	48846	Hà Tĩnh	\N	\N	1.835000081154048e+16	1.05900001984512e+15	\N	\N
eb112d7c-c1fa-4926-891a-c9cd6430de93	48/09	Tuần Giáo	\N	\N	2.158333406478336e+15	1.0341665994702848e+16	\N	\N
c92e6ce8-c0ea-4212-bd40-f6c66c3b3066	48/10	Pha Ðin	\N	\N	2.1566667175755776e+16	1035	\N	\N
ad64ad7e-aa01-4185-8402-11d2cd91231f	48/56	Sơn Động	\N	\N	2.133333341372416e+15	1.068500017741824e+15	\N	\N
89754f61-6b80-41fe-94b8-0837de4367ba	69722	Krông Buk	\N	\N	12767	108383	\N	\N
561320a2-f7b7-4be5-9552-e196584d3ed9	74130	Thác Bà	\N	\N	21746696	105051696	\N	\N
12bb6a6d-363e-43eb-b72b-2a407c1a9c5f	170002	Đông Long	\N	\N	20446300	106586720	\N	\N
4ab781e7-b381-4fe8-a451-b2c6425cacbd	170009	Trạm bơm Sa Lung	\N	\N	20480208	106371184	\N	\N
5e4e8170-f8e0-4e60-a13a-f7059827df66	328645	Bản Ngò	\N	\N	2264676	104457352	\N	\N
b5eb8296-9faf-4b38-ba97-ab065b1fe5a2	029912	Nà Chì	\N	\N	22518	10450575	\N	\N
e638cbca-2f43-4a97-a477-2e257550fdae	48/67	Yên Định	\N	\N	1.996666676707328e+15	1.056500013334528e+15	\N	\N
b7cea2b2-efbb-4ae3-8d15-5cabab30ac1f	48876	Eahleo	\N	\N	1.3366667295850496e+16	1.0833333449654272e+16	\N	\N
6f222de3-5690-4d66-81dc-4c1efa38df7d	48885	Lác	\N	\N	1.219999955943424e+16	1.081999972368384e+16	\N	\N
54022851-5dc3-4d6b-b9f2-a032bbd45be7	48/49	Đình Lập	\N	\N	2.153333259239424e+15	1.070999957143552e+15	\N	\N
57dd3dec-eeb9-4108-9a27-eb34477347fc	48897	Trà Nóc	\N	\N	1.0099999996116992e+16	1.0569999341060096e+16	\N	\N
2ef3ddcd-6c53-4a46-8fc9-d6acb0d3e7ef	740/4	Lâm Sơn	\N	\N	20872	105505	\N	\N
e70a0749-e461-4c0b-aafe-820f440d02a7	72429	Chợ Tràng	\N	\N	18579	105635	\N	\N
228d0d75-df89-4374-8116-538453204855	91173 	Phú Lương	\N	\N	2.0950000066363392e+16	1.0633334002548736e+16	\N	\N
fcd6e94b-a8cb-426b-a472-f60ae65e3c7f	74119	Lào Cai	\N	\N	22504	103964	\N	\N
9ba94743-42ed-419c-929e-7732418ed8f2	74126	Tà Gia	\N	\N	21789	10382	\N	\N
dceedb9e-0877-4588-bad0-82eae08e7290	73400	Kim Tân	\N	\N	20122	105669	\N	\N
69126d40-3841-40cf-bf79-d95d8b49d4a7	350008	Hoa Lư	\N	\N	20299572	105951576	\N	\N
af30b41f-5044-4020-996f-50a4b974283a	48/77	Quỳnh Lưu	\N	\N	1.9133334126854144e+16	1.0563333551816704e+16	\N	\N
5c21038d-7856-48d0-b76a-4e581d5c38d5	48/07	Phiêng Lanh	\N	\N	2.1849999725821952e+16	1.0356666167984128e+16	\N	\N
b7573447-714e-4db7-86b3-98da0b8b2725	48809	Bắc Giang	\N	\N	2.129999909879808e+16	1.0621666723889152e+16	\N	\N
617476d5-e3d2-49fe-82d2-95d7a6d0f874	48/19	Bắc Yên	\N	\N	2.1233332616429568e+16	1.044166679199744e+16	\N	\N
21127478-275c-425c-a483-45db41e50085	48/79	Con Cuông	\N	\N	1.9066667644485632e+16	1.048499965657088e+15	\N	\N
9b0adff7-7116-434b-bc6b-20ecfab2df47	48826	Phủ Liễn	\N	\N	2.0799998333550592e+16	1.0663333275369472e+16	\N	\N
50063221-175d-465d-9f8c-df3a261e221f	48/80	Đô Lương	\N	\N	1.8899999291080704e+16	1.0530000310632448e+16	\N	\N
87bea675-90c4-4a28-9183-2af554907ce2	48/29	Phố Ràng	\N	\N	2.2233334146924544e+16	1.0446667207671808e+16	\N	\N
76a4b916-3f4c-4a3e-85b3-3dbf05cec84f	48803	Lào Cai	\N	\N	225	1.03966662721536e+16	\N	\N
c95bd8af-2eff-42e3-8fd2-3bae733259dc	48836	Cửa Ông	\N	\N	2.1016666548731904e+16	1.073499963654144e+15	\N	\N
228adc90-5d2a-4352-b8a7-c63ce9b99e80	48/57	Ba Vì	\N	\N	2.1149999513468928e+16	1.0541666515550208e+16	\N	\N
bb9575c8-2c8b-48c9-9625-00566e2cfd6c	48/18	Yên Châu	\N	\N	2.104999978991616e+16	1.0329999789785088e+16	\N	\N
bd1af150-332f-452f-be98-5db02ebb6493	350005	Yên Sơn	\N	\N	20191528	105879168	\N	\N
3aaf8d6c-ec1f-4846-9091-a3c0dbb047d9	490064	Hồ Thôn 4 Lộc Bắc	\N	\N	116986	10763481	\N	\N
17672f6e-c9f6-4a61-98f0-12661b10157a	720016	Bàu Lâm	\N	\N	1068586	10738908	\N	\N
c5d0ec0f-a7ac-4c2a-87bb-704c49e040e2	48847	Ba Đồn	\N	\N	1775	1.0641666239102976e+16	\N	\N
ece29c1c-5443-4cdf-94d9-97aa1794ac4d	48896	Biên Hòa	\N	\N	1.0916666552614912e+16	1.0681666343272448e+16	\N	\N
6850b0b0-b8d2-42f4-8781-03206ba3d4e9	48/70	Như Xuân	\N	\N	1.9633332744617984e+16	1.0556666688831488e+16	\N	\N
850295f3-012c-40b0-8611-804bd0fe4b8d	48/84	Hương Khê	\N	\N	1.8183332458135552e+16	1.0569999341060096e+16	\N	\N
d7ac4665-b095-4da2-8c77-3d270c6d0b37	48883	Phước Long	\N	\N	1.18333328326656e+16	1.0698332963864576e+16	\N	\N
1ee443c3-4299-49f2-96ba-f01dd5b1908c	71587	Dầu Tiếng	\N	\N	11314	106347	\N	\N
e2a81db5-d0fd-411b-972d-56d1aca0afbb	554811	Thanh Thủy (Mỹ)	\N	\N	188203	105214584	\N	\N
f918bcdf-b63f-44cf-8f67-2cae3dfad357	170010	Đoan Hùng	\N	\N	20625016	106230888	\N	\N
b97560de-a894-4f02-b2a1-081b791ad0f8	350001	Yên Khánh	\N	\N	20184056	106061048	\N	\N
9f406237-5969-49d0-8aae-f7b93142e8fd	350002	Khánh Thành	\N	\N	20158600	106146352	\N	\N
ae2f6a1a-3d9f-44d6-b12f-0dc7782f9a83	350004	Yên Mô	\N	\N	20161876	106007360	\N	\N
83087d68-8bbf-4625-b7ef-fa8634f30e21	350006	Thạch Bình	\N	\N	20363384	10573239	\N	\N
b58d770f-1e3a-4a38-8b71-38ac99347780	350007	Gia Viễn	\N	\N	20344572	105835232	\N	\N
133e6155-66dc-4c3a-b377-0028a988ef45	350009	Ninh Hải	\N	\N	20214544	105933176	\N	\N
a98f6938-b0ea-4fe9-95b3-a9c7cb0452e6	350010	Kim Sơn	\N	\N	20076576	106084544	\N	\N
eb2a29ad-0177-47f8-8733-df07affc9d14	354398	Thôn Tân Hải, Phước Tân	\N	\N	13261886	108931440	\N	\N
f0ce9f42-91bf-40c7-8824-0b96b506d9f1	490061	Sơn Điền	\N	\N	1136026	10803291	\N	\N
a0c954d6-6ff1-4305-868a-8f8b34463465	490062	Liên Đầm	\N	\N	1157444	10802289	\N	\N
814bb077-9ddd-46e0-80eb-c7f3fe1b60ec	490063	Gia Hiệp	\N	\N	1162648	10817139	\N	\N
9c7f8cb6-9bca-47df-8c78-cefba339723f	490065	Hồ Đa Glé	\N	\N	1165516	10792423	\N	\N
4d31eeac-c6af-4c80-aeb3-07795319c003	490067	Khu du lịch cáp treo Đà Lạt	\N	\N	1192404	10844387	\N	\N
d2e73166-99d3-4c13-8ac7-45aadf5e0fcf	490068	Phường 10	\N	\N	1194142	10845971	\N	\N
7a8f2bd2-8a1f-4602-903b-fd291a76f1c1	490069	Phường 7	\N	\N	1196823	10842915	\N	\N
47d3eacc-4cf0-4cc2-8177-68d1e2f9890b	490070	Thác Datanla	\N	\N	1190367	10844969	\N	\N
535a4839-a98e-47db-bdea-393c8ab969e9	490071	Phường 3	\N	\N	118868	108465	\N	\N
5dba3922-5239-4249-95dd-f4a3dc3832ac	490072	Trường cao đẳng du lịch Đà Lạt	\N	\N	119699	1083921	\N	\N
7d60c44f-3e1e-4b5f-9298-ccf4aa98fe13	720011	Long Sơn	\N	\N	1046388	10708416	\N	\N
809d7df9-b271-4c3c-84e5-9f26e939fabc	720012	Long Hải	\N	\N	104041	1072302	\N	\N
c39db237-e8f3-40d4-bcd0-061214a51b22	720013	Hồ Sông Kinh	\N	\N	10512222	107403888	\N	\N
f2a232e3-b1a9-4ccc-9f0f-653c918543a5	720014	Long Tân	\N	\N	1054067	10726938	\N	\N
bb7607d1-1367-470b-9811-143156e7cbc4	720015	Côn Đảo	\N	\N	865361	10657444	\N	\N
6b8a1d40-f5e3-4ac7-8c99-62dd3c4547be	720017	Lâm San	\N	\N	1071566	10733233	\N	\N
0de58417-3a21-4e08-b353-e98390a15fe8	720018	Hồ Núi Nhan	\N	\N	10654215	107212040	\N	\N
6bb526ee-7212-4881-9f11-2b4ec4a87aab	720019	Xuân Sơn	\N	\N	1064705	10732918	\N	\N
7e977106-9689-4b4e-9fb1-2fec6e50259a	720020	Nghĩa Thành	\N	\N	10566389	107219720	\N	\N
b23c8f3d-71ac-46f5-92df-ed9aae6e0958	810014	Hồ chứa nước Ia Rtô	\N	\N	13296187	108454352	\N	\N
be08c3d3-e42a-4fd6-8d81-de1936019056	00204EC9	Đê Hậu Lộc, huyện Hậu Lộc, Thanh Hóa	\N	\N	19935720	105969360	\N	\N
637a91cf-1118-4a13-bd1b-c32828602c87	260106	Na Cô Sa (Nậm Pồ, Điện Biên)	2535	\N	21.981111526489258	102.58110809326172	\N	\N
befd39b9-7cca-4d17-8dd2-c89b8256e68f	1021110303	Nậm Ngà	2536	\N	21.840403	102.767029	\N	\N
436f22b2-b189-4794-807a-e6dd1aec7d1d	860150	Nà Hỳ	2536	\N	21.80828	102.76247	\N	\N
56a671c7-88c2-40a2-a734-a6a89a17c17e	260107	Nà Khoa (Nậm Pồ, Điện Biên)	2537	\N	21.903888702392578	102.70944213867188	\N	\N
2f8c10e2-3ba7-4fcd-8e22-941a12f30d32	360002	Hồ Khe Dài (xã Phúc Đường, Như Thanh)	9920	\N	19.543611	105.585556	\N	\N
ef2ea4ac-dc34-425d-a3e3-f2cc801c6edd	1021210809	Xà Dề Phìn	5890	\N	22.320278	103.243889	\N	\N
d7831cfd-7d74-4fa2-92d8-f6bf34c5278d	220005	Tam Đa	10683	\N	21.533056	105.346111	\N	\N
7a550feb-5368-474e-b4cd-b016353bae6b	172906	Tân Trào	10684	\N	21.774444	105.444722	\N	\N
2fe2770a-4e4f-4148-be81-ca82e76a77a9	220001	Nhữ Hán	10720	\N	21.722778	105.118333	\N	\N
3a8b6654-71d0-4e47-9cde-659736c05073	1023839102	Kim Tân	10067	\N	20.138731	105.682264	\N	\N
c3dff89b-96a8-4a03-b0a3-a3049fb89427	1023838511	Hiền Kiệt	10012	\N	20.433127	104.811712	\N	\N
6ebef186-dd79-4241-a547-05e4f49af426	1026261401	Đăk Kôi 3	5539	\N	14.674944	108.109917	\N	\N
80387469-d100-4ea5-b226-bab171ff38c6	1026261104	Đắk Dục	5568	\N	14.836917	107.680194	\N	\N
2cd61696-c6e5-4f20-a083-2ec857213cf1	220003	Đồng Quý	10665	\N	21.624995	105.282992	\N	\N
c612e4ab-00a4-4cc0-a7a8-71f610df8b47	220024	Tiến Bộ	10732	\N	21.773889	105.321667	\N	\N
eea6561a-08d0-4f0a-91df-1dc1cc27a73c	220013	Trung Minh	10733	\N	21.968586	105.514264	\N	\N
a456baab-765e-49f5-9b11-9bd5fb93d53f	220010	Yên Nguyên	10622	\N	22.066944	105.174167	\N	\N
c23a2e47-e625-4f0e-b0c2-ea37877591b1	1021513506	Tân Lĩnh 1	11000	\N	22.126667	104.715833	\N	\N
cc656bfc-6342-4d83-8a8c-9798be79c7b1	1021513513	Tân Phượng 1	11001	\N	22.259444	104.615556	\N	\N
98dc353b-46c9-4d74-837d-69506a9da00e	1021513512	Tân Phượng 2	11001	\N	22.244047	104.644921	\N	\N
1f8a8f73-db7b-4984-bb2b-61337da9bd50	1021513903	Bản Công	11029	\N	21.483333	104.349444	\N	\N
e36d6836-8545-48e9-a5b2-37afd9af9973	009083	Xã Bản Mù	11030	\N	21.414722	104.4475	\N	\N
7a2d690b-738f-433b-bffd-b8f63fbd41b8	537192	Nậm Hăn 2 (Sìn Hồ, Lai Châu)	5881	\N	22.051944732666016	103.47888946533203	\N	\N
655a9838-f75a-4bba-802e-d2455303f2a1	1021210817	Nậm Hăn 1	5881	\N	22.0825	103.440833	\N	\N
d40efe51-a1c4-4d7a-afeb-f61e99761b37	1021210818	Nậm Hăn 2	5881	\N	21.985292	103.482051	\N	\N
fb5c59ca-68e1-471c-bb3f-5f3136adde6f	1021210802	Nậm Tăm 2	5883	\N	22.308378	103.36936	\N	\N
7382871b-fda8-4c4e-a825-a11382df4300	1021210801	Nậm Tăm 3	5883	\N	22.282603	103.401947	\N	\N
3731b70f-3984-41df-947a-1ab3a363b607	1021210814	Noong Hẻo	5884	\N	22.21	103.475556	\N	\N
f87dd909-f047-41f1-9930-70cdfb7872b9	1021210807	Pa Tần 2	5886	\N	22.474444	103.174167	\N	\N
d987b647-8eff-40cf-a8d3-661f4867e89c	609401	Pa Tần	5886	\N	22.463329	103.196297	\N	\N
93eb34d5-1986-4bd3-9ba2-325d8b9bf278	386911	Pờ Tó	2710	\N	13.619478	108.409807	\N	\N
acd9304b-0c0f-447c-bc99-ed076e6c4b24	470024	Ea Knuếc	1957	\N	12.70884	108.21028	\N	\N
582b993c-ec79-46dd-ab74-a4aa1d951d3c	281132	Việt Minh(Vinh)	3716	\N	22.430402	104.841261	\N	\N
88adc63e-1f36-4894-96d9-abf07525a48d	69704	Kon Plông	5543	\N	14.476	108.133	\N	\N
a8b974f7-3c9b-4029-95d8-d1c9ff13c280	820001	Đăk Tơ Lung	5544	\N	14.537259	108.175082	\N	\N
23826467-2721-41b6-a0ee-7268503a47f5	1026261404	Tân Lập 1	5545	\N	14.474361	108.190361	\N	\N
145cffb1-27c6-4d11-b872-7a277df1483a	1021715603	Chiềng Châu	4994	\N	20.638333	105.068333	\N	\N
78c27e3c-bffe-4753-a472-25355dabea20	1021715601	Bao La 2 (Mai Hịch)	5000	\N	20.621389	104.994722	\N	\N
2a3f0b1d-e7c2-4c44-9968-ba0ef826ef11	860009	Thắng Hải	1350	\N	10.598889	107.587778	\N	\N
06e9d165-8ac6-4981-b222-6384a5c338d9	490001	Nhà máy Hàm Thuận	1351	\N	11.28887939453125	107.87348937988281	\N	\N
4d256586-f948-490e-aa53-11858373c4ee	690005	Tân Tiến	1562	\N	8.969583	105.319303	\N	\N
ce958542-bdd9-41ff-b833-a896cac8976d	009051	Ea Tóh	1949	\N	13.034349018	108.325646	\N	\N
862cad35-01e9-48cd-a2ac-6a6efbf49033	470022	Phú Lộc	1951	\N	12.977756	108.33925	\N	\N
e67f1cab-dcff-43f0-a5ed-7ee756a2ceda	470010	Tam Giang	1953	\N	12.959048	108.413444	\N	\N
1f0aa92d-bcd9-4c1b-b036-42dfdbf956c5	470027	Ea Yiêng	1961	\N	12.60195	108.38386	\N	\N
e20e38c5-e1e1-49bb-9b04-e0cae54c6799	690008	Đất Mũi	1574	\N	8.602376	104.761273	\N	\N
bed485e0-d074-4627-b9c0-ed9fd2f55d89	003422	Hòa Tiến	1965	\N	12.688638	108.332527	\N	\N
ef09fb64-8f7a-4542-a9bb-38bd9ab7027e	001904	Đăk Drông, Cư Jút	2007	\N	12.630633	107.813967	\N	\N
43d3575b-82e5-40ed-9319-1227ca4cfc39	1026766305	Đắk Gằn 2	2014	\N	12.540157	107.785646	\N	\N
d77be233-81eb-4416-a612-abe643367e5d	1026766304	Đắk Gằn 3	2014	\N	12.557276	107.823085	\N	\N
34d8c8fd-868c-4b0b-8be1-e87fc23043ee	480005	Đắk Gằn, Đăk Mil	2014	\N	12.5325	107.778056	\N	\N
d0f9e6fe-2778-4bcb-a44f-380404069714	1026766302	Đắk Lao 2	2015	\N	12.439152	107.58264	\N	\N
b23c1b9f-7c5e-4278-a954-09215b6a19fc	1020404301	Cô Ba	1626	\N	22.99555	105.7514	\N	\N
f921f117-a24c-4ac1-9e1f-57e6795e0e0c	110015	Cô Ba	1626	\N	22.995556	105.751389	\N	\N
237a867f-e8a5-4938-9917-fef7f450ad08	1020404302	Đình Phùng	1627	\N	22.7615568	105.7634864	\N	\N
51c9b0f0-53f0-4f06-b036-db93a9c1925b	1020404304	Hồng An	1628	\N	22.8604293	105.8273056	\N	\N
c23b2abe-3a22-4658-aa93-4b5237a83145	1020404305	Hồng Trị 2	1629	\N	22.9187121	105.6752648	\N	\N
629eeaa0-ca87-41b4-8d4f-58c3a52acbb0	1020404314	Hồng Trị	1630	\N	22.8459874	105.7051704	\N	\N
f7419bb0-5433-4f38-93c0-b464909938bc	1020404306	Hưng Đạo 2	1630	\N	22.8461255	105.7054977	\N	\N
35210bc6-578c-409d-8ede-09a8fd5a3bf5	1020404307	Khánh Xuân	1633	\N	22.9390292	105.7333862	\N	\N
8ebb0406-86ca-4a39-9ac7-72febe460eda	631823	Kim Loan	1669	\N	22.738056	106.6025	\N	\N
e5e11496-4c48-420c-ae36-9247f20ad76e	110018	Minh Long	1671	\N	22.794341	106.764346	\N	\N
087b4212-e14d-4c20-80fd-e78591ad6b7e	1020404802	Thắng Lợi	1673	\N	22.7486198	106.7029441	\N	\N
3be06adf-4773-4c27-9168-1eaf7ea8266b	71539	Sơn Giang	8266	\N	15.133	108.567	\N	\N
fa987c78-f2c3-4874-ac1a-9f1df65a6997	760073	Sơn Hải	8267	\N	14.988889	108.504722	\N	\N
6ef3d2c5-bbb9-4048-9a0b-427768f6f12c	1020405102	Đức Long	1704	\N	22.7579969	106.1335332	\N	\N
2088de62-4a87-4acc-8fbf-4ca1632a1a1d	1020405202	Thành Công	1734	\N	22.5394077	105.8689796	\N	\N
6770c6e9-64bb-4b18-8930-b45079aacf47	579451	Thành Công	1734	\N	22.53	105.894167	\N	\N
840c4f62-c2bb-4f57-a6bb-17792c8d0467	009054	Ea Bar	1823	\N	12.768098032	107.99100195	\N	\N
e17d622c-b0a0-48d0-90b6-cb29b7e16c33	355749	Thanh Hương	7037	\N	18.75251	105.228018	\N	\N
51d7bf1f-6b3c-498f-82f0-aeb0ee7fd5d4	1026665301	Cư DRăm	1921	\N	12.485278	108.561667	\N	\N
df098680-8701-4c57-a792-516a566066f3	353109	Cư Pui	1923	\N	12.508361	108.502389	\N	\N
29eede2a-b868-4bc8-b386-ac6ce06fc328	507383	Yang Mao	1933	\N	12.453611	108.568333	\N	\N
e68f6f46-3a53-4cfe-9710-f97e81bbaa69	003685	Yang Mao	1933	\N	12.453737016	108.56858901	\N	\N
4397de0a-5886-4f49-ada7-345d58da1e56	086244	Hòa Bình	5553	\N	14.279722	107.992222	\N	\N
81e168b3-4ed4-4e31-b224-8fff27550003	48/91	A Lưới	9084	\N	16.21666717529297	107.28333282470703	\N	\N
c7617c0c-f89d-4444-9c7f-8f44fe9c6c77	019713	Uông Bí	8499	\N	21.10427	106.73116	\N	\N
67942b46-105d-47cb-abbb-b0a919a631a8	228925	Phước Chánh	8060	\N	15.367081	107.819175	\N	\N
62571dbc-72b9-4e22-9747-dd9c35396245	920002	Phước Công	8061	\N	15.318056	107.812222	\N	\N
98c98ba4-cb13-45ac-a243-5a3dac6f884b	920010	Phước Hiệp	8063	\N	15.4625	107.937778	\N	\N
b23ab466-4037-4723-9e57-d1afc1b31c1c	298517	Bình Trung	492	\N	22.018611	105.555833	\N	\N
25f6f754-674f-448f-bca7-85efcd792c8d	470014	Yang Reh	1934	\N	12.503889	108.23	\N	\N
6e545909-9f40-432e-973f-b9ff5a876ec5	1026664901	Cư Né	1936	\N	13.066667	108.22	\N	\N
3ac0e540-89ec-4691-838c-db19c6560890	470005	Cư Pơng	1937	\N	13.009722	108.150278	\N	\N
5a1b571e-635b-489e-bffa-2a4445b4877e	009053	Ea Sin	1939	\N	13.069386966	108.13697297	\N	\N
5ca87665-5ab9-4085-be0e-5e91488f6b4a	344112	Cư Klông	1942	\N	13.071056	108.433694	\N	\N
12987c23-9911-4c47-8473-12e71879d642	976037	ĐLiê Ya	1943	\N	13.058611	108.3575	\N	\N
80173197-32d8-438d-811a-d1e6bda12341	470021	Ea Hồ	1945	\N	12.95178	108.3028	\N	\N
e6eaabbc-ac3c-47f8-a937-92c3cc002339	344113	Ea Pil	1988	\N	12.805455	108.623876	\N	\N
7f568d05-830d-4c67-bfba-8f81b09a9969	036607	Xã Ea Trang	1990	\N	12.6205	108.829553	\N	\N
c943124a-025b-4e4b-92db-34e995ad5851	646676	Quảng Thành, Gia Nghĩa	2058	\N	12.040833	107.686389	\N	\N
609c9805-5d62-4fd7-9af2-132f7ec8d3ec	671291	Buôn Choah, Krông Nô	2059	\N	12.469722	107.980833	\N	\N
016e7d7d-5b36-4b15-9acd-f28ccc92d3e9	950074	Kiên Lao	336	\N	21.373889	106.514444	\N	\N
329d8979-747a-4c02-bedb-ec4569a185ad	875652	Bố Hạ (BĐ)	436	\N	21.447567	106.193284	\N	\N
b226a358-db3f-42ec-945f-8450cda3490b	1020606402	Ngọc Phái	498	\N	22.184611	105.582983	\N	\N
ff90e456-2723-4d67-b488-ef5bf94c5e7d	1020606404	Tân Lập	504	\N	22.284722	105.608333	\N	\N
913a09d1-7a4e-4f07-9359-9fcb6028d52f	518523	Tân Lập	504	\N	22.283611	105.611944	\N	\N
fb3cd0a2-3276-4d9f-8520-ad2bc41b5e74	1020606406	Xuân Lạc	505	\N	22.364444	105.549167	\N	\N
ea4f56d1-7f48-44ff-a93e-c1b7f6b9e539	924700	Yên Phong	507	\N	22.041389	105.604444	\N	\N
af488708-215e-4bab-a742-296068401079	910683	Yên Thượng	509	\N	22.173114	105.514507	\N	\N
9f36c03f-3e18-4c42-b915-67f9765bf03a	1020606501	Bình Văn	510	\N	21.912703	105.91061	\N	\N
4d69ecf9-ccea-4bc0-8048-7740686f48ef	650915	Nông Thịnh	517	\N	21.955759	105.804224	\N	\N
4eb58356-1466-47a2-bb7c-e9098d117dab	1020606604	Kim Hỷ	534	\N	22.274167	106.044167	\N	\N
2ab12458-6c51-461d-a40a-16614beab2d6	1021210707	Thu Lũm 2	5842	\N	22.703438	102.459069	\N	\N
fd94a43c-2fd1-410e-96ec-7d7c578a59e3	1021210708	Pa Thắng	5842	\N	22.685	102.436944	\N	\N
f888d319-5b25-4560-9a8b-b23a289e318f	260115	Huổi Cuổng (Mường Tè, Lai Châu)	5843	\N	22.317777633666992	102.94083404541016	\N	\N
3722af47-f916-4089-8c30-2ba6f4ed1966	430010	Lưu vực hồ Đồng Nghệ	2413	\N	15.948983	108.063648	\N	\N
cada97fc-a47f-4066-b3be-3ba795c8c312	430004	Hòa Khương	2413	\N	15.960833	108.14	\N	\N
0855bd11-8ab0-4f9f-b9e1-848fb72b199c	001912	Hồ Đồng Nghệ	2413	\N	15.950516	108.086969	\N	\N
bcd338d7-807d-4ccf-b9f5-146771b226cf	074780	Hồ Hòa Trung	2414	\N	16.079854	108.059992	\N	\N
8741b390-195b-4958-8cf7-d3b9ed28269c	095184	Hồ Trước Đông	2415	\N	16.012146	108.098357	\N	\N
99aad3a4-7546-487c-bf9a-fc118afeb0e8	074776	Trạm bơm Túy Loan	2415	\N	15.999981	108.141921	\N	\N
27e6e4af-b780-4894-ac23-79d8fcf66855	430009	Lưu vực hồ Hòa Trung	2416	\N	16.081111	108.043056	\N	\N
91a37b6e-83d4-4840-b1ad-6f0249b3c772	009064	Bà Nà	2416	\N	16.024705041	108.06118003	\N	\N
54813b3e-c50a-4c6c-bbab-e3d746a47582	430006	Hòa Ninh	2416	\N	16.053056	108.081111	\N	\N
af83d085-48e6-4264-8070-a5b696ab6ee1	430015	Hồ Hóc Khế	2417	\N	15.991329	108.09908	\N	\N
7c296be6-6c65-4126-b4bc-1a72b95b90f6	430016	Suối Lương	2422	\N	16.144444	108.115833	\N	\N
bc4c2b74-09be-4ec6-9a52-5d4a7efbd219	1021109705	Xá Tổng	2515	\N	22.01534	103.181373	\N	\N
3a242602-08b1-47fa-b009-04c9872058ea	1021109601	Đoàn Kết 2	2516	\N	22.29159	102.399189	\N	\N
e0a77ecb-cf3b-42bf-9360-218adb08b59d	1021109602	Chung Chải	2516	\N	22.253205	102.481293	\N	\N
423679bb-c4ec-4a17-89a6-6a4b29ea540a	260113	Nậm Ngà (Mường Tè, Lai Châu)	2517	\N	22.241666793823242	102.70694732666016	\N	\N
e649c95b-6ae1-4279-9b0c-6fe2378db132	29297	Mường Nhé	2519	\N	22.192455	102.455195	\N	\N
cc896eb9-a938-4243-b776-846e19b8113b	354401	Mường Toong (Mường Nhé, Điện Biên)	2520	\N	22.155278	102.571944	\N	\N
935b50e8-85a1-4d91-969c-8e1c258caf81	270008	Nậm Kè	2521	\N	22.124444	102.581389	\N	\N
69503ac4-1fed-4b47-9897-4971d5050aef	260110	Pá Mỳ (Mường Nhé, Điện Biên)	2523	\N	22.11055564880371	102.66555786132812	\N	\N
f3253bfa-90e7-4e68-ac0a-3a65b5f06060	1021109901	Mùn Chung	2564	\N	21.806826	103.396255	\N	\N
267f7184-9e3b-47d9-8eb7-d6410447c6ad	124960	Phình Sáng (Tuần Giáo, Điện Biên)	2565	\N	21.779443740844727	103.47389221191406	\N	\N
dacdfcf4-ddeb-4a13-a096-5d190c0a55a5	1021109914	Phình Sáng 2	2565	\N	21.819337	103.444297	\N	\N
166587ea-d3d9-4e2e-85e6-40a39fc9a0eb	1021109913	Phình Sáng 1	2565	\N	21.81961	103.495635	\N	\N
2f767701-f1d2-47ca-9362-30d5fa68ce19	1021109911	Pú Nhung	2566	\N	21.685349	103.451402	\N	\N
51a523e2-b1b2-4d4b-add0-f51e4c71e4e5	1021109910	Pú Nhung 1	2566	\N	21.717877	103.468689	\N	\N
f636f496-3f56-4d2f-87f7-a4d4c5e44f56	091965	Hồ chứa nước Ia Glai	2614	\N	13.731874	108.005637	\N	\N
3f012434-82a3-4526-8ec6-6bca45298f5a	810001	Hồ Plei Thơ Ga	2630	\N	13.541389	108.061111	\N	\N
8ccda836-c016-43d8-a6e4-aff05aca7eac	061850	Hòa Thịnh	7706	\N	12.931475	109.239576	\N	\N
6b3d632a-f77b-4bbf-9460-d93fa1153b47	168872	Mộc Sơn	6676	\N	18.930517	105.102252	\N	\N
dc41d873-45ed-4696-9fb8-09f85842869b	770006	Nghĩa Điền	979	\N	14.222068	108.860386	\N	\N
9e171d2f-5826-4f4b-84f0-f28653146223	720009	Hồ Suối Các	942	\N	10.680833	107.481389	\N	\N
ae676e78-ef3e-4038-8abe-86089258d946	598335	Hòa Hiệp	942	\N	10.688889	107.500556	\N	\N
76d666ee-fbe3-4cd0-b4b3-bf84b076cb6e	270011	Hua Thanh (Nậm Khẩu Hú)	2449	\N	21.48053	103.01893	\N	\N
5bcae406-2cdd-4510-b671-cbf5a8ddee3f	1021110008	Mường Lói 2	2450	\N	20.94643	103.23831	\N	\N
bc866933-7efb-4bb7-b6fe-7726ea8be2f8	270010	Hồ Na Hươm	2451	\N	21.148056	103.082222	\N	\N
8820176d-3443-41d1-937a-e16079412cdc	1021110009	Mường Pồn 2	2452	\N	21.56923	103.01846	\N	\N
bd4b82c1-bd6a-4f4b-84eb-274958eb8841	1021110010	Mường Pồn 1	2452	\N	21.516089	102.975682	\N	\N
140aacb6-cc73-4eac-b478-17c58b4da877	306420	Mường Pồn	2452	\N	21.5388	103.01175	\N	\N
a427b3ad-fa00-4c79-a1bf-33a5c94ac1a0	1021109403	Nà Tấu 2	2454	\N	21.498056	103.117222	\N	\N
8dab45d3-b475-421b-8ff3-b3e182319f55	1021109402	Nà Tấu 3	2455	\N	21.549444	103.1275	\N	\N
f4e35846-b2f1-4f39-a236-2b3b3d8f9d17	1021109401	Nà Tấu 1	2455	\N	21.529722	103.147778	\N	\N
eefb2949-3e9a-4333-8307-03d5854291ae	295290	Nà Tấu	2455	\N	21.51225	103.13154	\N	\N
30b979f2-0ab8-4bd7-bcf0-4a01dce8d7c8	1021110007	Mường Nhà 3	2456	\N	21.1264	103.10138	\N	\N
da7e9cd6-83cb-49c2-b4ad-ee36d93c1059	870221	Tây Trang	2457	\N	21.195166	102.959567	\N	\N
e2beeae4-02f8-49e5-8344-351ebdc1e43c	1021110005	Na Ư 1	2457	\N	21.25309	102.92009	\N	\N
4c005607-4871-4c6e-9ad5-666a6649c09f	1021110006	Na Ư 2	2457	\N	21.22467	102.93663	\N	\N
69c19b18-52c8-4ed1-ab17-2fd616a69390	1021109404	Mường Phăng 1	2461	\N	21.420192	103.090558	\N	\N
8ceb4097-1f03-47a5-9e9a-5b3a3ad4e0cc	1021109405	Mường Phăng 2	2461	\N	21.425465	103.129436	\N	\N
5f924966-7995-41d3-8c6a-1119b6e96f45	1021110001	Mường Phăng 3	2461	\N	21.45022	103.136536	\N	\N
e3a99c94-5eda-4a9a-ba0f-baff469bbaf8	040754	Hồ Núi Một	971	\N	13.811191	109.00411	\N	\N
60f02ea7-548e-45a8-823e-fdaee57ac447	770008	Nhơn Thọ	972	\N	13.85556	109.059785	\N	\N
38910d72-7735-45a1-a02b-cbae04e8b3d8	029924	Hồ Vạn Hội	983	\N	14.394271	108.915642	\N	\N
0e374e12-3202-4208-82fd-d4edeb767913	001164	Hồ Thạch Khê	984	\N	14.276316	109.000057	\N	\N
0c0a4497-57af-48f8-af9b-fed0992ce6f7	1021109803	Huổi Só	2542	\N	22.086915	103.413484	\N	\N
cce0edfb-fa0b-46a2-be65-2a11e536bff8	1021109807	Lao Xả Phình	2543	\N	22.003948	103.305859	\N	\N
ede81fba-8b6c-4593-89d2-61e101d16b23	1021109801	Mường Đun	2545	\N	21.882543	103.479415	\N	\N
12a81fcc-be3a-4abc-b6b4-e6f4c95b259a	260119	Xá Nhè (Tủa Chùa, Điện Biên)	2546	\N	21.884721755981445	103.42305755615234	\N	\N
7748eec1-6251-4b1a-8a9e-7b4ec7950f85	1021109808	Tả Phìn 1	2548	\N	21.992225	103.364269	\N	\N
cbabddaa-cc68-420b-bb0f-045fa9e9e8c5	046102	Hồ Mỹ Thuận	1010	\N	14.0035	109.184311	\N	\N
44586fa8-c6b9-4d90-9af4-1e3f61597e13	1021109802	Tủa Thàng	2551	\N	21.933058	103.445151	\N	\N
c66b89b3-7cd3-48fa-a7fe-f975ad57afab	1021109806	Trung Thu	2552	\N	21.931853	103.301139	\N	\N
8811b0ce-28ed-449d-84c0-f88ca62cdf03	1021109804	Xín Chải	2553	\N	22.111696	103.355761	\N	\N
0182d0db-ace8-4b6d-99f2-6e73ce03de45	554052	Sín Chải (Tủa Chùa, Điện Biên)	2553	\N	22.07	103.3275	\N	\N
357aa779-10a4-457f-8153-24d68f455e4c	770004	Thuận Phong	1012	\N	14.059706	108.963651	\N	\N
8f468b5c-5bc7-449f-b872-0e48ccd732c0	040740	Hồ Hội Sơn	1015	\N	14.15	108.956667	\N	\N
4a75c674-9d84-4174-a452-91a57bd0c627	353102	Xã Cát Tài	1016	\N	14.095043	109.103909	\N	\N
ea2e1955-4fa6-4dd2-9267-c3b75681081b	1021109909	Tênh Phông	2574	\N	21.505845	103.431516	\N	\N
f76e5ddc-a5b0-4001-86db-80bab4923f82	880549	Cái Nước	1539	\N	8.943056	105.013889	\N	\N
346be736-720c-4c14-b196-ba8bce142b15	039894	Hồ Quang Hiển	1092	\N	13.633453	109.050462	\N	\N
ebbe0553-8a2c-4b5f-9302-b68bc2287420	344114	Xã Canh Hòa	1094	\N	13.56375	109.012194	\N	\N
f15320ca-e678-42bc-ba49-b95fa11f5351	71551 	Vĩnh Sơn	1102	\N	14.300000190734863	108.76667022705078	\N	\N
5b9dc90b-3544-4178-8f4b-77abc1cb3d47	780023	Hòa Xuân Nam	7649	\N	12.900833	109.383889	\N	\N
3ae9c8af-c22e-4a31-baeb-aa055b623519	1026463101	Ia Nan 1	2662	\N	13.722222	107.601111	\N	\N
ee2202a9-117f-4cb6-b501-fd3d19e7f927	614133	Ia Pnôn	2663	\N	13.740278	107.634444	\N	\N
d2ea4ef3-58f2-413b-ab7b-04b84f8ed14c	661895	Hiệp Lực	552	\N	22.325	105.906389	\N	\N
96af907f-aa67-40de-98a0-89bc50918fea	302427	Nà Phặc	553	\N	22.38346	105.900271	\N	\N
489f48e4-4298-4604-97ec-363067240ada	17659	Uar 	2752	\N	13.267446	108.599988	\N	\N
f538f3ff-0ea8-4d4c-9c6a-a146c3e8f003	095171	Ayun	2753	\N	14.096166	108.302394	\N	\N
9d61ab1e-04f8-4475-9079-c90881690dea	71526	Thành Mỹ	8012	\N	15.767	107.833	\N	\N
2085a441-3583-43e5-84f0-ddb70f3f22f6	0120619F	Quang Nam - Nam Tra My - Uy Ban Huyen	8019	\N	15.144750595092773	108.11798095703125	\N	\N
a225e667-b738-4ebe-8b32-cb5baf134b3b	1023839701	Thọ Dân	10257	\N	19.863015	105.548286	\N	\N
05dc7fe6-3cb2-49dd-915a-d58e6112636b	1020606408	Đồng Lạc 1	494	\N	22.348056	105.591389	\N	\N
34b72655-f71f-4710-b2a3-320ed0372e28	1020606405	Đồng Lạc 2	494	\N	22.321111	105.575278	\N	\N
7e1e60df-c628-4910-8f90-ff9925c2a23e	941376	Đồng Lạc	494	\N	22.302778	105.573333	\N	\N
9b8e2fd1-a590-4d39-a96a-6a5fdc08b4bb	1020606301	Mỹ Thanh	461	\N	22.148889	105.904444	\N	\N
899c15b8-dcdd-4d75-8896-d56c5f0239cc	000784	Xã Canh Liên	1095	\N	13.620363	108.906299	\N	\N
bcdba50e-71ea-450d-a82b-618338629762	770003	Làng Chồm	1095	\N	13.685101	108.928933	\N	\N
3f71a728-14c8-4768-83a2-591752012b01	770002	Làng Cát	1095	\N	13.70913	108.899624	\N	\N
c0b3a46d-e29f-47c5-bde5-2f7af29e698a	770001	Hà Văn Trên	1096	\N	13.582826	108.967621	\N	\N
1a1d8fc4-4c3a-410f-9507-fce5c7bb9ccf	001191	Hồ Đá Mài	1097	\N	13.737673	109.060554	\N	\N
6e865483-7c9d-4bda-b384-7e7ab228ceac	036617	Hồ B - TĐ Vĩnh Sơn	2723	\N	14.358556	108.568786	\N	\N
10057e28-f848-4c05-b0f2-b81ff4b335fc	1026463002	An Trung 2	2725	\N	13.851667	108.481389	\N	\N
0251f554-9ae9-4d2f-8b0b-c2620f8e979f	1026463003	An Trung 3	2725	\N	13.8825	108.491111	\N	\N
189278fa-1e95-4465-877b-d4578ca91213	1020202801	Lũng Hồ 1	3869	\N	22.986016	105.238242	\N	\N
3cb71d9d-bac1-4982-986d-61f0b4bccf85	1020202807	Mậu Long	3871	\N	23.06453	105.295856	\N	\N
8e80c77c-9099-4606-b1f3-59b6eddcf33a	354697	Kim Anh	4335	\N	21.228643	105.758239	\N	\N
42d6950f-8b50-4101-803a-44ca87792785	116554	Hồ Suối Dầu, lưu vực Đỉnh Hòn Bà	5275	\N	12.119722	108.947778	\N	\N
7cec723d-a58d-4e31-8314-4acf2e1ee393	412105	Phượng Hoàng	5326	\N	12.557018	109.021881	\N	\N
9de32584-de69-4f55-b6ce-e88c150d7141	391730	Hồ Đá Bàn, lưu vực Hố Dài	5327	\N	12.669444	109.1075	\N	\N
3dc48ff8-305c-42b6-a093-ab0b53da078f	922927	Hồ Đá Bàn, Đập đầu mối	5327	\N	12.640151	109.110003	\N	\N
60d9c98c-bb06-4521-ab8f-8062af408f83	412702	Hồ Đá Bàn, lưu vực Suối Trình	5327	\N	12.680426	109.080807	\N	\N
11972626-3295-4e3c-9590-af0eddbdff35	62943	Đá Bàn	5327	\N	12.620489	109.116444	\N	\N
86e5e822-e6ef-4bf2-8063-c14bfb625e36	411420	Hồ Đá Bàn, lưu vực Suối Dứa	5327	\N	12.635833	109.106389	\N	\N
07602cc3-9e54-4a79-87e7-334981309908	1024042205	Đôn Phục 2	6697	\N	19.14291	104.868723	\N	\N
d7eac05d-7016-4c6c-b344-b83293c7d287	1024042206	Đôn Phục 1	6697	\N	19.113557	104.85774	\N	\N
ac028342-85ae-47b2-b45e-e43357441731	1024042208	Lạng Khê	6698	\N	19.135263	104.748287	\N	\N
075bd756-5386-4cad-94d3-f840cb8f61a9	1024042202	Lục Dạ	6699	\N	18.977978	104.90892	\N	\N
3a3f73c6-4ecd-4d78-8492-2251a77c3d45	760017	Ba Giang	8151	\N	14.780556	108.6425	\N	\N
63d968ac-25a1-4fac-8674-e7c30799c97d	001201	Ba Liên	8154	\N	14.8285886	108.808178	\N	\N
cd697a27-3d34-4658-ab71-83173b0c977a	760003	Lưu vực hồ Núi Ngang, Suối Vả Hố	8154	\N	14.80802	108.823099	\N	\N
6f1a24da-ebe2-484a-9bbb-b04bfaf75e36	760034	Lưu vực hồ Núi Ngang, Suối Nước Suôi	8154	\N	14.791323	108.813895	\N	\N
50385d9b-8a31-47f3-a472-b198b3db6193	760032	Đầu mối HCN Núi Ngang	8154	\N	14.825794	108.814253	\N	\N
b5e17045-7144-4e84-bae8-e008fa673fc6	355746	Ba Lế	8155	\N	14.636805	108.658705	\N	\N
7061ec8e-2a4a-4d9e-9fad-abf417017f83	136740	Ba Nam	8155	\N	14.669722	108.645	\N	\N
c558e1fb-565a-4ab5-9e78-0e9af3052d90	457122	Ba Nam	8155	\N	14.67	108.645	\N	\N
154e6603-606e-4ba6-a493-43b9fe537b76	920031	Hồ chứa nước Hố Do	8121	\N	15.619306	108.346167	\N	\N
67163bb4-5427-497b-b06d-3fe1614c39ec	920024	Đầu mối hồ Phước Hà	8121	\N	15.619857	108.320814	\N	\N
c5087e60-38df-4240-921e-0c1d2a04f8b5	014693	Bình Phú	8121	\N	15.6432	108.326	\N	\N
ce7470ca-98f9-495b-8121-61eda681e7d5	920004	Hồ Đông Tiển	8125	\N	15.630833	108.289722	\N	\N
4d331400-1478-4119-879e-4661a372a174	036623	Tiên Hà	8134	\N	15.549425	108.246467	\N	\N
8eee92da-35d7-4d90-a6c9-25dc12bd19af	968713	Ba Cung	8147	\N	14.776944	108.741667	\N	\N
bd8f626d-dca6-4d31-894f-f29f8027f7bf	760064	Hồ Suối Loa	8148	\N	14.804722	108.762222	\N	\N
fb4a6b24-6a5a-491e-a738-f0415828237c	634150	Đinh Trang Thượng - Di Linh	6031	\N	11.726111	107.970278	\N	\N
04b7e6df-4c57-4e7c-b3e7-613fa12d1a0b	265937	Gung Ré	6034	\N	11.53305	108.07448	\N	\N
64da5206-4c6f-40f8-a38b-360bd0c5a693	264017	Hòa Bắc	6035	\N	11.459480285644531	107.97411346435547	\N	\N
03c8e9f0-40ed-4d64-90e0-0b1231b7330e	976395	Hòa Bắc - Di Linh	6035	\N	11.468056	107.956111	\N	\N
5f2bc197-2651-4200-9f4a-aad0a27266d4	490003	Đinh Trang Hòa	6037	\N	11.540253639221191	107.94328308105469	\N	\N
275a1b0f-053e-411a-8117-9a4cb3101283	149965	Bến Gia	10554	\N	9.685556	106.509722	\N	\N
1740b4a2-fa9f-4d7d-b02e-e56a2c99c007	967641	Bảo Ái	11139	\N	21.887278	104.83425	\N	\N
bfbe05f0-ee74-46c6-b80d-f434000d73bf	210034	Ngọc Chấn	11147	\N	21.957663	104.93073	\N	\N
82be7de7-d5c3-45c9-8029-d1c6c423d613	1021514101	Thịnh Hưng	11153	\N	21.709294	104.995666	\N	\N
46248232-8086-460c-9682-57a5f878ddb3	210035	Xuân Long	11160	\N	22.020135	104.880077	\N	\N
5072bb15-9828-49c2-8fa7-0e6603d27ecd	029920	Yên Bình	11161	\N	21.728132	104.961	\N	\N
0beff165-f109-4d0e-be48-c9d6c4b69469	210033	Yên Thành	11163	\N	21.876843	105.01546	\N	\N
cb41e5d2-a2ba-4077-8c3e-84853ad00a3a	074778	Hòa Phú Thành	2418	\N	15.9576	107.991983	\N	\N
d9242414-ad13-49d8-ab3f-bd6a19301cb5	430014	Hồ Hố Cau	2418	\N	15.996389	108.054444	\N	\N
364db4bb-b483-46f0-ba31-f1c571973d9a	720005	Hồ Kim Long	884	\N	10.717514	107.230349	\N	\N
df28dcc4-f887-465d-be05-b9d952da3efd	720006	Hồ Tầm Bó	892	\N	10.72404	107.24771	\N	\N
49a8fbc2-eae6-4567-9cdc-1d1b854baeaa	146365	Đông Anh	4060	\N	21.138377	105.855205	\N	\N
170ed301-2ae8-4582-bfcb-d866b8556678	1020203402	Đồng Tâm	3699	\N	22.498243	104.94667	\N	\N
7752659f-e202-499f-94c1-7bd050bd3223	1020203107	Phú Nam 2	3692	\N	22.725422	105.411064	\N	\N
52c57b7a-7a60-4d39-8572-91685c621ad1	1020203106	Phú Nam 1	3692	\N	22.72835	105.443725	\N	\N
d698d74f-ddfa-498d-9b3b-2fbacd5743b7	082355	Thủy điện Bắc Mê	3692	\N	22.737749	105.40352	\N	\N
3f0aa7ba-2c6d-45ca-a705-884be75d7737	1020203110	Yên Cường	3694	\N	22.698743	105.383435	\N	\N
72b4e459-c409-42ca-b3a2-8f2a25d52d73	1020203101	Yên Định	3695	\N	22.8117	105.123923	\N	\N
2b75b399-6eab-4a31-bf2c-db27de4bf29f	1020203109	Yên Phong	3696	\N	22.758544	105.41233	\N	\N
9ec3a5d3-b417-4264-a022-9aac37c9bcd7	1020203108	Yên Phú	3697	\N	22.73188	105.366456	\N	\N
50994292-207f-41b4-a561-90e3a6030b45	711805	Vĩ Thượng	3813	\N	22.243889	104.738056	\N	\N
42e8e377-2121-4d38-98bf-09d36ec52d3f	729361	Xuân Giang	3814	\N	22.320892	104.66714	\N	\N
84a0872c-af3d-4b1b-afc4-5042d3a6e721	1020203505	Xuân Minh 1	3815	\N	22.52247	104.740244	\N	\N
d59085d7-1ff3-4f6c-8b9b-10866e8e485d	1020203506	Xuân Minh 2	3815	\N	22.472412	104.741571	\N	\N
bea1bfba-68e1-4b7e-a23f-2d595acc22f0	1020203013	Quảng Ngần	3833	\N	22.649548	104.916106	\N	\N
e1d6e686-eaca-4117-bce5-e0471ae381cd	1020203010	Bản Ngần	3833	\N	22.620786	104.921924	\N	\N
5acc05f3-4fab-423b-a4bd-812c56fcbbfb	140009	Cô Tô	8361	\N	20.977232	107.762279	\N	\N
8270e0b9-4339-4f5d-afb7-b7438912ffda	356642	A Bung	8525	\N	16.368303	107.026057	\N	\N
70860524-41c9-44ae-8c92-f901f58e83b2	1022524002	Xuân Đài 1	7523	\N	21.123449	105.010736	\N	\N
52c9bd82-b623-4735-a819-ec5c9c0c0c15	1022524003	Xuân Đài 2	7523	\N	21.166389	104.989444	\N	\N
1993b78d-247f-40d8-8f60-7ec8f96d4f04	261536	Yên Lương	7573	\N	20.996238	105.249316	\N	\N
f43928c3-7692-4122-86b9-225143220ad1	790932	Minh Hương	10629	\N	22.104722	105.125833	\N	\N
2a7bcf18-de32-4b1e-90a0-0c7cbf4daf6b	184251	Vàng Danh	8501	\N	21.100058	106.797867	\N	\N
bf032819-624d-4ecc-8e45-9517a1522b3f	1021514005	Huổi Sản	11069	\N	21.729791	104.40572	\N	\N
2b68cfa8-aac6-4648-b95f-1321fe9171c4	1021514006	Gia Hội	11069	\N	21.724722	104.436111	\N	\N
9d6f0c55-e0e5-4108-b433-fa011e43640f	920760	Gia Hội	11069	\N	21.729585	104.419717	\N	\N
04cff0f7-83a5-4d91-a14d-9058fd6d5f7e	1021513607	An Bình	11094	\N	21.984625	104.577569	\N	\N
4b5bbd13-b986-40f4-b91b-1665a2591dac	820009	Đăk Rơ Ông	5588	\N	14.845673	107.871826	\N	\N
f11b52b2-7d4b-40ad-a601-c89835e4847c	1026261706	Đắk Tơ Kan	5590	\N	14.795722	107.866472	\N	\N
b99057cb-41d7-40c3-8603-a0e0a5bb2876	470018	Đăk Phơi	1975	\N	12.351667	108.1925	\N	\N
39f576b9-b709-40d9-a15f-ca55de40537f	470019	Ea R'Bin	1976	\N	12.331111	107.95	\N	\N
5d61029c-7cb8-40b6-9daf-d18a169f6260	092991	Bàu Hàm	2206	\N	10.981155	107.105543	\N	\N
6fa093d2-e2af-44d8-96cd-d05f456605c0	1024243905	Sơn Hồng 1	4709	\N	18.553297	105.294481	\N	\N
a6c771ae-0a48-48cb-a385-51f5e3a40429	1024243906	Sơn Hồng 2	4709	\N	18.558968	105.26257	\N	\N
381e882c-0865-4466-a672-2e044cd7dba6	1024243912	Sơn Lâm	4716	\N	18.538054	105.389015	\N	\N
f4931df6-d831-4cd4-a971-fda9341daaf1	965510	Sơn Lâm	4716	\N	18.552222	105.365	\N	\N
851c4338-afc8-40fb-8bc9-6933dac01786	1026261003	Đắk Choong	5495	\N	15.175083	107.803333	\N	\N
c2e74937-89d4-40e7-8d28-ac77c309fd83	820004	Đăk Choong	5495	\N	15.170626	107.784166	\N	\N
4fe74d5b-eccc-481a-8c21-339c7229c37a	820013	Thôn Kon Riêng - Đăk Choong (Đăk Glei)	5495	\N	15.165605545043945	107.85773468017578	\N	\N
9fc7b001-4b00-49b7-b5c0-b35537ccb002	1026261002	Đăk Pek	5496	\N	15.080611	107.729028	\N	\N
4a605eae-c343-4e92-ac05-6149eb3a8af8	74428	ĐăkLây	5496	\N	15.080624	107.729137	\N	\N
13321db1-572e-4e94-8e89-8b66c6e70187	714543	Bản Cầm	6078	\N	22.503056	104.084722	\N	\N
6fe39068-a122-4fca-91ea-2cc0f04bf9b3	1021008602	Gia Phú 1	6080	\N	22.32929	104.079698	\N	\N
291d4800-6561-4134-9a4d-09f6de6f784d	343050	Gia Phú	6080	\N	22.370472	104.078972	\N	\N
951dede7-1127-4b7e-9f56-60d11b4b24d4	1021008601	Phong Hải	6081	\N	22.452714	104.147663	\N	\N
b6bb874f-b388-447a-81c9-f933a8d9ba6d	240024	Phong Hải	6081	\N	22.433333	104.161389	\N	\N
1f1c42f0-99f1-4081-ba5b-3ec63c878d2f	608407	Phố Lu	6082	\N	22.316115	104.18526	\N	\N
50029b69-eeef-4ed3-88e4-f71a5334cb04	1020203302	Nấm Dẩn 2	3850	\N	22.613889	104.485556	\N	\N
e6377e34-3347-4a30-87cc-81dae8e759b3	1026261102	Đăk Xú 2	5571	\N	14.704444	107.661833	\N	\N
05eabef8-6835-4b87-aa3b-7ff4c9c48afa	820005	Pờ Y	5572	\N	14.6675	107.619167	\N	\N
3c6f7d72-6a77-4aac-b84f-fdbae6ce1857	1026261101	Đăk Xú 1	5572	\N	14.68525	107.641778	\N	\N
91aeef04-f6d8-4480-b418-71554249ccc3	340292	Plei Kần	5573	\N	14.702222	107.688333	\N	\N
03fac910-c122-4d12-9295-1d0ec5fc315c	69700 	Đắc Tô	5575	\N	14.533333778381348	107.83333587646484	\N	\N
61c8f0da-0897-4dfb-b6c8-ab027a44e5b2	820006	Mô Rai	5576	\N	14.3775	107.546111	\N	\N
5669c174-2c3d-4f0f-8afc-3eaa3273366e	107554	Rờ Kơi	5577	\N	14.518889	107.738333	\N	\N
35cd16d2-9aa5-4fd5-9c44-51a2fdc25932	095180	Đập Thủy điện Pleikrông	5578	\N	14.408306	107.862222	\N	\N
e5feee4a-dcb4-4da5-8061-b22a4bee8f31	1026261601	Sa Bình 2	5578	\N	14.382472	107.858944	\N	\N
8e5ebb0b-c028-41cc-a3cf-02045f6a8af2	1026261604	Sa Nhơn 1	5580	\N	14.451889	107.784861	\N	\N
aedf4590-b54f-4d7c-b83d-83d20db508d8	1026261605	Sa Sơn	5581	\N	14.409	107.763417	\N	\N
0981f397-9b6a-4052-a6a9-918b85dd0416	838401	Sa Thầy	5582	\N	14.400556	107.798889	\N	\N
d0f89d67-03ff-49e3-a182-cc3070274489	012057C1	Ha Giang - Thai An - Dap Thuy Dien	3794	\N	22.999752044677734	105.06553649902344	\N	\N
672b5732-80ce-4a4d-a5bf-2b591bb4e640	1020202901	Đông Hà 1	3794	\N	23.0403	105.042024	\N	\N
e626d59a-5ec0-4777-968c-daaea89e1ebf	1020202903	Đông Hà 2	3794	\N	23.069268	105.029031	\N	\N
9fae96e4-a287-444e-9a23-1d06344ebf5a	1021211208	Trung Chải	5854	\N	22.350466	103.167068	\N	\N
d31bbea6-6ac0-4898-8b97-0cba3bd70da0	482242	Bản Lang (Phong Thổ, Lai Châu)	5855	\N	22.588056564331055	103.37666320800781	\N	\N
28e469f8-71d8-428c-a939-3731cd7c6d95	1021210906	Bản Lang 2	5855	\N	22.639879	103.407389	\N	\N
3f7d111e-afc6-426b-be49-9f4f73747e2e	1021210905	Dào San 2	5856	\N	22.645	103.343056	\N	\N
01eefb5d-9f0d-4cb9-9395-3dc2210c4fa1	1021210902	Dào San 3	5856	\N	22.673611	103.361389	\N	\N
82bbcd55-5075-434a-9049-7288012ab053	1026261204	Ngọk Tụ 1	5523	\N	14.716583	107.795361	\N	\N
46bbe1bb-82f1-41de-8c81-b98b07f6b976	1026261202	Pô Kô	5524	\N	14.606806	107.835722	\N	\N
84b1c3aa-39d2-4984-a038-0238538aeeb0	843160	Hương Lâm - Đạ Tẻh	5983	\N	11.535556	107.433889	\N	\N
396fae5e-9581-4511-a2fb-a8cf4e41d9a0	951080	Đà Loan - Đức Trọng	5989	\N	11.579444	108.382778	\N	\N
a0cd740a-d676-4cc6-b723-7b3a156826e7	490033	Đa Quyn - Đức Trọng	5990	\N	11.578837	108.48247	\N	\N
d8cbde1a-d735-4f61-8423-b7ccc998bd15	1022018501	Nhất Hoà 1	5605	\N	21.7631327	106.2443836	\N	\N
34ec3133-e8f2-4abd-be3c-5bed471984d2	1022018502	Nhất Tiến 1	5606	\N	21.7193855	106.2580004	\N	\N
bb1be404-96b2-443d-b7d3-af292789a188	930002	Phước Tân	1302	\N	11.749289	107.01705	\N	\N
deb3d421-ef16-4c48-bfe2-c147bbf85706	490004	Đập tràn Hàm Thuận	1353	\N	11.336731910705566	107.93546295166016	\N	\N
4373f4f0-6233-43eb-8dba-89f40b248346	380001	Kỳ Đồng	4736	\N	18.178002	106.238271	\N	\N
af0cbe52-02bb-41be-b271-1254e7f641fe	1024244706	Kỳ Phong	4743	\N	18.177039	106.140628	\N	\N
bb669d9c-c4d6-41a6-a2bd-749378368c17	1024244701	Kỳ Sơn	4745	\N	17.998032	106.159059	\N	\N
433e4db4-b456-4048-90fd-62f67d6e8385	1022018104	Quang Trung 1	5627	\N	22.0550939	106.3323057	\N	\N
ec0d03fc-4b04-405d-a7ce-c59f490c50b7	1022018105	Quý Hòa	5628	\N	22.1463806	106.3222197	\N	\N
35994436-26a5-4a15-97eb-a3288836163c	1022018902	Bắc Xa 1	5682	\N	21.6461853	107.2651496	\N	\N
69060783-0174-4eb3-a871-762582791269	1022018901	Bản Chắt	5683	\N	21.6228458	107.1462004	\N	\N
26bdfe76-f826-494c-8b11-077b4a7b62e9	1021715710	Yên Nghiệp	4955	\N	20.411111	105.535	\N	\N
a695b79f-704f-4001-b8bb-b483bfa439d8	1021715711	Yên Phú	4956	\N	20.490556	105.458056	\N	\N
513282f8-7708-4358-a78b-da4bf22758a1	1021715202	Cao Răm	4973	\N	20.844722	105.482778	\N	\N
e8740d51-ae20-4fc4-8f8f-20265617c341	061840	Cao Răm	4973	\N	20.832345	105.50409	\N	\N
c55ecaa1-ce9e-4cb8-a191-cdadacb466e6	490045	An Nhơn - Đạ Tẻh	5977	\N	11.546389	107.4825	\N	\N
e804600f-75a8-43ca-bf50-89d1ff41432e	1026868201	Đạ Kho	5978	\N	11.479167	107.484167	\N	\N
c3bc34c6-8bd9-493b-8723-7722628f521b	490046	Đạ Pal - Đạ Tẻh	5980	\N	11.543939	107.576005	\N	\N
b24ee79d-d3ef-425a-b516-a3325aeef5a0	36974	Đạ Tẻh	5981	\N	11.506944	107.4875	\N	\N
b4e5948c-d564-4783-8d66-42925df0937e	48881	Liên Khuong	5994	\N	11.733333587646484	108.36666870117188	\N	\N
ce0f6e20-4514-4fee-948d-00fba8d082a1	490034	Ninh Loan -  Đức Trọng	5997	\N	11.544167	108.343333	\N	\N
61b2b5b5-36a5-4564-901d-14110820d0c7	490032	Tà Hine - Đức Trọng	5999	\N	11.588361	108.344411	\N	\N
72fd8ac0-ecfd-4895-9ccc-3390035265d9	360016	Hồ chứa nước Cửa Đạt	10195	\N	19.873056	105.282778	\N	\N
ec5110d6-54ac-4221-80a5-67592ffd88fe	079365	Thượng Lâm	10647	\N	22.471425	105.2976	\N	\N
46b09c38-0846-4e1e-8dbe-5324d2e374b4	1020807101	Xuân Lập	10648	\N	22.4975	105.171111	\N	\N
13cee160-6b1c-4928-aae0-bce49a1f889a	220011	Xuân Lập	10648	\N	22.505833	105.165	\N	\N
446eddf5-0b5a-4026-aa4c-f70afe61df1b	341080	Lam Vỹ	9544	\N	21.9665	105.701194	\N	\N
3cd9906a-22da-4728-a061-b4a6777775be	1022018701	Mai Sao	5672	\N	21.6892829	106.6152735	\N	\N
cabad091-7856-42c8-b9de-c913f97c5940	1022018702	Nhân Lý	5673	\N	21.6991929	106.6550306	\N	\N
6bf93b1c-c707-4336-8e54-f20741df5bb1	1022018703	Quan Sơn	5674	\N	21.6276199	106.6226536	\N	\N
c64c8d15-310e-4474-8d3d-5f585355d58e	814897	Chi Lăng	5675	\N	21.648694	106.575218	\N	\N
a1fd4818-b53b-4818-89a9-90797c390a0e	760072	Ba Tiêu	8158	\N	14.746812	108.558798	\N	\N
0261b5f5-9e46-4871-9abe-171ad5646479	760055	Hồ Tôn Dung	8159	\N	14.755556	108.738889	\N	\N
e389d87c-082f-475e-b54c-854f0eedcb3e	48/95	Ba Tơ	8159	\N	14.766666412353516	108.73332977294922	\N	\N
ffe616d5-c43b-4ca8-a423-2310f9be2ceb	354413	Ba Trang	8161	\N	14.7333459	108.8650703	\N	\N
3db7947f-2773-47c4-ac0a-a1868970dd7a	760001	Lưu vực hồ Liệt Sơn	8161	\N	14.740833	108.930556	\N	\N
ec1a338a-7365-4668-bbb3-22691790a178	1022018203	Na Sầm	5789	\N	22.0610405	106.589547	\N	\N
72cbc15d-5b2f-4e08-ad05-44f64683f549	355625	Long Sơn	8224	\N	15.003972	108.718611	\N	\N
d621d585-d430-4d1d-8868-61e53b50a661	1022018602	Nhật Tiến	5707	\N	21.5367224	106.318074	\N	\N
4c7f4605-638d-4859-a645-197de28a8cd7	260111	Xã Mường Tè (Mường Tè, Lai Châu)	5836	\N	22.48584747314453	102.61824798583984	\N	\N
fe10265d-5851-4b07-84b5-87571a76e225	260112	Nậm Khao (Mường Tè, Lai Châu)	5837	\N	22.383333206176758	102.71805572509766	\N	\N
74634127-c68a-4dcb-a3d1-ec7e9b350de6	1021210711	Nậm Khao 2	5837	\N	22.41	102.673889	\N	\N
616afc06-9a90-43da-b72d-20794322fc0a	1021210710	Pa Ủ 2	5838	\N	22.584444	102.653611	\N	\N
d3d49611-f868-4c88-84c6-4427710b6a2a	1021210715	Pa Ủ	5838	\N	22.53324	102.661697	\N	\N
35add881-a19e-4347-9231-d8718ee04d18	1024244707	Kỳ Bắc	4734	\N	18.203624	106.166964	\N	\N
608cab5e-c0dd-4c89-9560-fb129dfa2131	260124	Tả Ngảo (Sìn Hồ, Lai Châu)	5892	\N	22.273611068725586	103.24666595458984	\N	\N
4a8f44e1-3b90-455e-a302-ce392aa1dbff	1021210812	Tả Ngảo	5892	\N	22.258744	103.302567	\N	\N
d91bafaf-9d87-4abd-873f-36cc9bc48b4e	850002	Phước Thắng	7293	\N	11.8225	108.869444	\N	\N
9b5147b1-3545-4226-b043-448a7a645b1a	819210	TT Sông Hinh	7667	\N	13.063852	109.025589	\N	\N
a77c39fa-1090-4298-8852-30f5b7cd5bb7	780013	Xuân Bình	7674	\N	13.5775	109.205	\N	\N
77a4ea15-e386-49f5-bba6-6c339a3e4dfc	780030	Xuân Sơn	7671	\N	13.123611	109.069722	\N	\N
394c25b4-6f75-47fa-9dc6-fbcf3640dff8	780008	Sơn Xuân	7671	\N	13.153056	109.097778	\N	\N
a85699d3-652d-452d-a9a5-165683847ad6	1024042203	Bồng Khê	6691	\N	19.044487	104.889676	\N	\N
b1b84f75-7c02-441b-b0ed-37c281f61b00	1024041502	Mường Nọc	6918	\N	19.598629	104.962242	\N	\N
25073559-48ad-4d00-9a35-3518f50cdfab	370002	Thông Thụ	6920	\N	19.854444	104.948333	\N	\N
8e77a735-f43c-4a6f-b770-894fb67a8065	1024041601	Châu Bình 1	6924	\N	19.504962	105.215778	\N	\N
2691018e-b4db-488b-b2eb-a9a9faf31da5	1024041602	Châu Bình 2	6924	\N	19.522242	105.166117	\N	\N
b8dcb43c-33a3-407f-8d82-40950a5700e3	1024041608	Diên Lãm	6933	\N	19.440995	104.972887	\N	\N
3c26a6b0-8356-426b-b2fd-739cf9e0266a	1021211206	Nậm Hàng 3	5851	\N	22.163333	102.9925	\N	\N
421f5e8a-280d-4fc5-872f-2bac48395bbd	1021211205	Chăn Nưa 2	5852	\N	22.285227	103.158613	\N	\N
1ed300db-729e-4518-b2db-77fed4854520	1021210604	Tả Lèng	5906	\N	22.405278	103.518611	\N	\N
1f88c9f3-56b6-4f64-ae2e-db54d2291576	872471	Thèn Sin	5908	\N	22.44179	103.46355	\N	\N
382095f7-3fc4-4273-991d-59def227d665	1021211102	Mường Khoa 1	5910	\N	22.195	103.688333	\N	\N
dce9f043-5e25-4174-8f5e-c6e8f0748451	877958	Mường Khoa	5910	\N	22.20364	103.7033	\N	\N
531b90d9-6f4b-4c68-a1cf-8c090bd5c220	490002	Đại Nga	5943	\N	11.534692764282227	107.8782958984375	\N	\N
1c546a48-6dec-4aac-b98b-7bbb4403e611	911493	Nam Ninh - Cát Tiên	5960	\N	11.606944	107.406111	\N	\N
7915fd79-baca-47c1-848a-9afae7aaf4d7	490028	Tà Nung - TP Đà Lạt	6015	\N	11.918905	108.344112	\N	\N
8ad03f63-1d01-4440-80f7-92feb86eb7a3	490027	Trạm Hành - TP Đà Lạt	6016	\N	11.866878	108.561607	\N	\N
8e7c68c8-c954-4f9e-b1e8-52714f7fb4fa	490057	Xuân Thọ - Đà Lạt	6017	\N	11.942421	108.520826	\N	\N
c2e1a8f3-59e1-4887-9d2e-172db913acf9	490029	Xuân Trường - TP Đà Lạt	6018	\N	11.887671	108.55324	\N	\N
89508f55-9c76-4506-98f0-f295a14eca13	638578	Hoài Đức - Lâm Hà	6067	\N	11.754722	108.166667	\N	\N
2d7a62f0-481a-4948-ad88-a28e8a369386	745380	Nam Ban	6070	\N	11.824444	108.337778	\N	\N
640c0916-a28f-4a5f-9216-4074275f04c7	490036	Phi Tô - Lâm Hà	6072	\N	11.865656	108.260474	\N	\N
7f479038-cfa3-4ce5-8c15-c73e2e4b8731	618012	Ia Piơr	2625	\N	13.441389	107.848333	\N	\N
a6a10754-b1b4-423a-9a95-a5f8f7599f71	1020405204	Yên Lạc 2	1738	\N	22.7433062	105.8357917	\N	\N
a01f09f5-c5f6-4c37-bccc-f22930a67974	1021412402	Lóng Phiêng	8962	\N	20.917315	104.400972	\N	\N
c45b11cf-1c19-4290-9ad3-510aa59065bb	764613	Lóng Phiêng	8962	\N	20.91075	104.41102	\N	\N
89209551-1805-4ad7-bd30-00effe8b6e91	260021	Mường Lựm	8963	\N	21.026944	104.4825	\N	\N
4c7aaea2-b2e9-4f5c-9232-19526755cb6f	1021412405	Phiêng Khoài 1	8964	\N	20.981181	104.251274	\N	\N
c2af514b-6561-4f96-8b23-d0cd999aef78	1021412406	Phiêng Khoài 2	8964	\N	20.938866	104.300801	\N	\N
7f3487e6-5e28-4fec-9968-c00ef58d1639	260006	Phiêng Khoài 1	8964	\N	20.955556	104.309167	\N	\N
bdd55ab1-6872-4c94-ba17-a85988d822da	814625	Tú Nang	8966	\N	20.961646	104.429915	\N	\N
c265d92b-1ea2-4864-814e-03a2d20775f0	110020	Đức Long	1766	\N	22.436389	106.511389	\N	\N
1f83eba3-6d0f-4c90-8604-82f7247fba7f	1020405301	Đức Thông 	1767	\N	22.4788118	106.2785232	\N	\N
faca9b29-3098-433d-9d18-cbb6e05dca9d	630250	Đức Thông	1767	\N	22.479167	106.279722	\N	\N
6018c229-7153-435a-88b4-b7b4d623a298	1020404508	Đa Thông	1784	\N	22.8008805	105.982839	\N	\N
8dbd93df-c093-4681-9a2b-7324ba696fbe	279230	Thông Nông	1784	\N	22.80084	105.98488	\N	\N
c9a5f9a1-0418-455a-8628-2a928c436802	1022018201	Bắc Hùng	5798	\N	22.103395	106.578393	\N	\N
c7f8befc-27d1-44b2-a4a6-f539c94077f7	260127	Phúc Khoa (Tân Uyên, Lai Châu)	5914	\N	22.233055114746094	103.72138977050781	\N	\N
73d349ec-6b31-4d86-8842-7644ccfbdb00	260129	Nậm Khăn - Tà Mít (Tân Uyên, Lai Châu)	5915	\N	21.98611068725586	103.7058334350586	\N	\N
b750e232-60b7-4f28-b4b7-bd29d53d3085	1021211007	Tà Mít	5915	\N	22.023678	103.684074	\N	\N
35d01ba9-dac1-4a4a-bf10-60421ee1f7bc	553600	Thị trấn Tân Uyên (Tân Uyên, Lai Châu)	5916	\N	22.172500610351562	103.7558364868164	\N	\N
54328ea1-3b3b-4c2f-ab1f-8225c29ef82c	496347	Ma Nới 3	7319	\N	11.657029	108.693131	\N	\N
84c60f76-fb80-41e4-a89d-16ee4aba4921	1021109912	Quài Nưa	2569	\N	21.651335	103.44257	\N	\N
09b6b1da-4df6-4210-a7f9-1c07ec26c2df	009061	Ea Sol	1884	\N	13.266331013	108.286945	\N	\N
0e6e7ca2-0292-4058-a27c-293474142537	009153	Buôn Trấp	1915	\N	12.486123014	108.03037703	\N	\N
c04a485c-93d1-4976-a5a1-4e1cff33699f	470029	Ea Bông	1918	\N	12.51966	108.04171	\N	\N
eeef5254-8e1b-4550-b6d1-9a6d0574124f	140001	Kỳ Thượng	8436	\N	21.195833	107.118056	\N	\N
74b9dd39-3635-4532-b0c7-e869830f022c	661492	Ia Ake	2768	\N	13.536944	108.291944	\N	\N
f3c8c5ca-c485-4bfd-a792-6c3bbfda5ec1	1026463801	Ia Hiao	2769	\N	13.441944	108.412222	\N	\N
e41cf0a3-0bd6-43c9-8d6e-590e6136d5a7	1020203301	Quảng Nguyên	3856	\N	22.568611	104.576389	\N	\N
2a341ad9-c3bc-4240-b59f-fecbc7eb401e	01205A1C	Ha Giang - Xin Man - Dap thuy dien Song Chay 6	3858	\N	22.6907901763916	104.46551513671875	\N	\N
0a99cbef-a27c-43b9-a5d7-0cb0131464d0	829120	Lương Mông	8332	\N	21.25452	107.01911	\N	\N
8a542451-44d5-4d78-958b-7e83a8fc7150	040763	Quế Võ	625	\N	21.112786	106.156019	\N	\N
fb7717e4-02e6-462f-936e-c8103ca89416	1021110208	Mường Lạn 1	2502	\N	21.442419	103.296843	\N	\N
8d7fd7e6-0900-4eba-9e5c-1ab1fc6fd316	1021110209	Mường Lạn 2	2502	\N	21.47162	103.316956	\N	\N
3d0fa0b5-3692-45da-bc46-f9c574420a99	863524	Tri Tôn	5424	\N	10.185565	104.930216	\N	\N
4cecb122-ec94-4a27-b927-9736b886d3b4	920023	Trà Vân	8022	\N	15.113044	108.18005	\N	\N
286f8843-04ce-4f7f-b765-9ac3b0b2dc00	35292	Trà Phong	8298	\N	15.171289	108.359966	\N	\N
12763e2e-71de-43eb-923b-6bcf42ab68d4	760078	Trà Tây 1	8300	\N	15.138333	108.371944	\N	\N
c99fcd8c-223e-4fde-a5b0-ec4b2731b3a4	140006	Quảng Lâm	8370	\N	21.418333	107.5825	\N	\N
1eeb2c11-cf55-4c33-9423-e04d42cf2c5f	140003	Đồng Tâm	8338	\N	21.57189	107.455855	\N	\N
36c8f285-f0a2-4edf-a8b5-df2b15ba4636	860011	Đức Phú	1414	\N	11.251111	107.656389	\N	\N
54fad42e-70f6-4bec-9f63-1042bf61cf87	440836	Suối Nứa	298	\N	21.355809	106.418431	\N	\N
9d57ba97-eb85-4c6b-9eb8-5abc27f3a47e	1021412002	Chiềng Công 1	8820	\N	21.425959	104.170953	\N	\N
60117f46-6836-4f79-96bf-79e50f67c3c0	580501	Chiềng Công	8820	\N	21.43634	104.19396	\N	\N
7d8d6140-00b6-4891-b3c0-d7e6f618ed45	1021412705	Mường Và 2	8876	\N	20.899891	103.616604	\N	\N
0a9da87b-43fc-4172-97dc-237d78b2da13	1021412706	Púng Bánh	8878	\N	20.985119	103.519693	\N	\N
52d21ff7-84e4-4b34-869b-8b738cacbc94	892063	Chiềng Đen	8884	\N	21.35257	103.86348	\N	\N
80a809cb-e8d0-4e4e-90f7-ff8e8afcddb0	1021411916	Chiềng Ngàm	8918	\N	21.50431	103.74646	\N	\N
c7c3ba8d-5f9b-4469-a7ad-060753d12905	1021411904	Chiềng Pha	8920	\N	21.48888	103.6625	\N	\N
d7ffa8a5-5e08-4b7c-aa58-03f37726a927	862457	Chiềng Pha	8920	\N	21.50681	103.65452	\N	\N
6d29f204-9b7b-4988-a36c-a0cede8ede7a	939248	Côn Minh	527	\N	22.128261	106.021521	\N	\N
b1b4e52c-0fe8-4810-a21d-318407e016b2	1020606002	Bộc Bố 1	561	\N	22.626111	105.693889	\N	\N
2b341bbc-1634-480e-a4f5-ab9b51975cba	1020606003	Bộc Bố 2	561	\N	22.611944	105.648611	\N	\N
cf29e397-6c73-4ae9-b7c5-49b3bd7562f4	873321	Bộc Bố	561	\N	22.611111	105.671667	\N	\N
ea827bf4-f2f6-4937-bbe8-6b59e841f3cd	1021412203	Huy Tường	8842	\N	21.2025	104.649444	\N	\N
3ccc5084-ea3d-405b-b00a-1510813e1723	260011	Hồ Suối Hòm	8842	\N	21.200833	104.660833	\N	\N
64ef92ab-6fa2-424f-a5e9-d95fc82c5e8d	780035	Sơn Thành Đông	7708	\N	12.983663	109.096283	\N	\N
91af1fee-6226-446a-a487-ad87d1e29cbb	040730	A Dơi	8589	\N	16.481504	106.744225	\N	\N
86c876da-9c42-4736-8a0e-f87b91203ac5	1023838401	Tén Tằn (Mường Lát)	9862	\N	20.519326	104.547588	\N	\N
9c1d8f5c-81ae-4aca-8349-30a74b9867ec	1023838404	Trung Lý	9863	\N	20.458336	104.693377	\N	\N
843a7099-dc03-4ae7-846a-3064d36583ac	1020404803	Thị Hoa	1674	\N	22.5966314	106.7104719	\N	\N
e20b6aca-715f-43a5-981a-b37ecdc77f0c	470016	Ea Kao	1830	\N	12.5975	108.035	\N	\N
95dcac3c-9152-48be-acd8-00872ac7f63f	014702	Nghĩa Trung, Gia Nghĩa	2049	\N	11.909121	107.796746	\N	\N
62150754-5a99-4510-ba0b-0f801c67b64b	164249	Quảng Khê	2049	\N	11.909087	107.796783	\N	\N
fcbc11a1-5ae0-43e5-ae6d-b824ed1e1623	1020404705	Khâm Thành	1810	\N	22.8491817	106.5120165	\N	\N
03e97439-b345-4705-8eb1-2dc57b54f904	1024041504	Châu Thôn	6911	\N	19.55548	104.80844	\N	\N
7baf90a2-5441-48f0-abfa-869da8747fbb	1024041503	Đồng Văn 2	6912	\N	19.752401	104.987474	\N	\N
f1dcc78a-48ef-402f-9367-e4d8eab7c09e	1024042302	Đồng Văn 1	6912	\N	19.795655	105.009568	\N	\N
6fc9eaac-ee03-4ff4-9cc6-8e2cc76c8589	228863	Thủy điện Đồng Văn	6912	\N	19.892622	105.132984	\N	\N
8a85ec5f-c3ef-414b-89ba-0457c916fac5	964990	Thủy điện Hủa Na	6912	\N	19.837959	105.084063	\N	\N
48b8206f-8c03-48fc-aa4e-cebf504bfd02	000445	Đại Hiệp	7920	\N	15.92101	108.110629	\N	\N
7820443e-f713-49d7-8645-329c4f505afe	1024015101	Bảo Thắng	6810	\N	19.395561	104.398825	\N	\N
0ca5e4e4-650b-4a04-90b2-79f0b5929d19	1024015102	Bắc Lý 1	6811	\N	19.587946	104.268783	\N	\N
c12d7cbc-bc87-45df-8428-24cb7a653cb5	470028	Ea Trul	1925	\N	12.50648	108.25503	\N	\N
0197d5fc-c556-4d54-b724-7d2434cce62e	003402	Hòa Phong	1927	\N	12.541093	108.43563	\N	\N
73e4340e-550a-499a-b0d4-21114fb43962	365004	Long Thành	2158	\N	10.781389	106.951944	\N	\N
413562b6-30da-45c7-8676-d6f3ff2ea263	1020203404	Tân Lập 2	3709	\N	22.50157	104.828842	\N	\N
c12bd0dd-f856-44f5-801a-1af96e4f8121	1020203403	Tân Lập 1	3709	\N	22.527223	104.840937	\N	\N
2aa62cc0-f400-4a77-918f-9c7a0c2423cd	1021715908	An Bình	4957	\N	20.432944	105.734778	\N	\N
6f22793f-097d-4dc1-860c-f441db4aa7b4	076241	An Bình	4957	\N	20.412666	105.731728	\N	\N
10b75c9d-29fa-4216-a572-856c2f395f41	1024015105	Hữu Lập	6815	\N	19.38957	104.23773	\N	\N
d94e7683-c761-4023-bd98-0b36bcd5e124	23584	Cẩm Mỹ	2117	\N	10.776667	107.244722	\N	\N
7b859fb7-3e07-48ee-a470-16dde620d645	001902	Khu du lịch Hoàng Vân	2652	\N	13.853889	108.003056	\N	\N
7a3e79d5-6513-4a49-a0be-93a4303492a7	694034	ĐăkĐoa	2666	\N	14.135182	108.13162	\N	\N
4f89629d-ebf1-4c62-a5c4-43fa9c330c4d	169811	NT.Đông Hải	203	\N	9.191111	105.694167	\N	\N
d405e0be-834d-4a89-ae39-47ed9db8e1d6	1021715003	Đồng Chum	4856	\N	20.973056	104.961111	\N	\N
770442ed-9879-4695-a4e8-1d336f585448	673629	Thủy điện Suối Nhạp	4856	\N	20.938333	104.973611	\N	\N
07c826b6-c786-4bb9-a8d9-0a074196f4c2	1021715002	Đoàn Kết	4860	\N	20.895278	105.059722	\N	\N
7bf4196b-40ae-46a7-b1f0-4d2f16d0fc4c	1021714802	Dân Hạ (Yên Mông)	4896	\N	20.903889	105.400833	\N	\N
98ff9cda-cae2-47e6-8c55-a2ff6d1cd22f	1021714806	Hợp Thịnh	4897	\N	20.990556	105.355	\N	\N
362154d8-fe81-4d21-92bf-7969d5619029	000443	Thanh Thủy	7052	\N	18.667443	105.285552	\N	\N
82f53d8c-4d2f-48c3-8721-c6302c1d8f35	1021513704	Kim Nọi 1	11014	\N	21.83711	104.08078	\N	\N
95fea8ec-2f55-4cc5-a779-9750696d53a2	210016	La Pán Tẩn	11015	\N	21.786667	104.168333	\N	\N
eaa1e7d3-fa94-4b1e-85b5-d51acb29546e	1021513708	Lao Chải 1	11016	\N	21.854444	104.018889	\N	\N
9701542b-9ce4-4da1-ad0f-8ecc38948dbc	1021513711	Lao Chải 2	11016	\N	21.791667	104.054722	\N	\N
ffd2ca25-2226-43ca-9867-e8b7ab0118da	210014	Lao Chải	11016	\N	21.859444	103.966944	\N	\N
3f848db5-c848-4317-a44c-94ff1ffa46eb	1021715011	Trung Thành	4871	\N	20.887222	105.088889	\N	\N
0049e724-774a-4026-9b96-ebf37ce677a8	583209	Long Sơn	919	\N	10.463889	107.084167	\N	\N
075cfa13-4a02-49b4-b2bc-0e64ac9ca33a	1022018401	Lương Năng	5806	\N	21.8452248	106.4501266	\N	\N
cb6a15d9-9238-4908-a85d-8211822b28e8	730004	Thanh Hóa	7896	\N	17.983447	105.84169	\N	\N
d092b1a6-5c24-4dc7-aabb-48453e6adb66	920026	Duy Phú	7967	\N	15.789444	108.106389	\N	\N
b70df74a-2123-4670-92a3-44633d94a4ab	920021	Đầu mối hồ Thạch Bàn	7967	\N	15.778625	108.088213	\N	\N
b5fc62b2-0103-440b-8c97-ef30af83e3d1	920007	Hồ Phú Lộc	7969	\N	15.7875	108.174444	\N	\N
b61c320a-94b5-4488-9223-515fca5575fe	602147	Duy Sơn	7969	\N	15.808056	108.218056	\N	\N
6d776110-32be-47a8-9c40-af3890d3b137	228929	Duy Trung	7974	\N	15.803333	108.255833	\N	\N
f4fe0be2-1136-4621-8d79-52eec85c707f	920008	Hồ An Long	8080	\N	15.633333	108.155278	\N	\N
6df44a73-76b6-406f-bd99-54f9950d0eb4	360011	Hồ Nội Sơn (xã Hợp Lý, Triệu Sơn)	10245	\N	19.822522	105.531326	\N	\N
61c2fc6c-0412-46b3-a783-2cb9a4563ac3	859882	Kiên Đài	10603	\N	22.113056	105.431389	\N	\N
7a937750-aad4-4c5a-9476-5ecdfc6dc979	228921	Linh Phú	10605	\N	22.014722	105.4475	\N	\N
28110ed1-c976-40e8-a248-747c10c8cd94	428256	Minh Quang	10606	\N	22.33567	105.167547	\N	\N
677a9cd2-539c-40b0-83f9-4037c3280113	1023838803	Giao An	9845	\N	20.089112	105.26427	\N	\N
02f951e6-f309-40ca-b684-600422f32677	709021	Tam Văn	9850	\N	20.204444	105.151944	\N	\N
4c692cbd-0183-4d20-a7dc-83250c885494	530605	Yên Thắng	9854	\N	20.152214	105.074152	\N	\N
ef7a9793-fe0a-4632-ae1c-5a4452f79ce7	1023838802	Yên Thắng	9854	\N	20.151364	105.121597	\N	\N
8f4d08ff-7e7e-4d70-938e-9e5c9038b6e4	650221	A Vao	8527	\N	16.389444	106.949444	\N	\N
0e607484-faa3-42d0-b1a6-2a3b6dc87f79	1023838604	Lũng Cao	9703	\N	20.476389	105.178056	\N	\N
5b29d403-be4b-4498-a82b-a05734a5f0a4	1022018601	Minh Sơn	5705	\N	21.4831944	106.3213311	\N	\N
b4f58d5b-7562-40da-9930-095aaefd2542	1023838706	Sơn Hà	10032	\N	20.222617	104.962619	\N	\N
55463278-ed94-4583-a1d5-0f87f859bdcd	040664	Ba Nang	8529	\N	16.585439	106.866494	\N	\N
f61d8718-77fc-4627-b14d-5a26da89ab8a	356218	Thủy điện Đăkrông 2	8530	\N	16.651444	106.816704	\N	\N
37c12d07-1f63-4b6e-9b14-478ae58aa72a	602704	Chúc Bài Sơn	8425	\N	21.477185	107.637332	\N	\N
41f41c94-f0ef-49c3-b697-993bf6764a53	040731	Tà Long	8536	\N	16.575033	106.957696	\N	\N
0131d220-7ea1-4664-a161-149d7519a921	740004	Trung Sơn	8567	\N	16.962778	107.040556	\N	\N
2f86f1bb-21ce-40bc-96f9-eb4ab8cdcab4	740013	Đầu mối hồ La Ngà	8652	\N	17.025515	106.95367	\N	\N
f93cebfe-7792-4f05-bd37-33e53c050303	1021412510	Mường Bằng	8811	\N	21.271389	104.036944	\N	\N
9798ce74-71f4-4dcb-ac28-5b939987528f	260005	Hồ Bản Mòn	8812	\N	21.215278	104.060833	\N	\N
65131e3e-a45b-4492-bfd0-926109b15710	260029	Song Pe	8778	\N	21.214494	104.388971	\N	\N
aca2162f-3581-4a68-8c8d-ada2e6372476	1021412010	Mường Bú	8827	\N	21.414518	104.008664	\N	\N
9bdf6e15-c084-4a16-ac1a-1b0c886c1c85	260027	Mường Chùm 1	8828	\N	21.365	104.088889	\N	\N
2e2d88d8-237d-4536-af35-684f054cde22	490042	Tân Thượng - Di Linh	6045	\N	11.645663	108.021261	\N	\N
7858c982-214a-4e30-9950-3b6d91cd470c	704132	D'Ran - Đơn Dương	6046	\N	11.844722	108.598889	\N	\N
93e1eac5-61c4-4625-90d8-176ad97a70e1	432140	Đá Ong	453	\N	21.48	106.078333	\N	\N
de7097c0-33cc-4c0c-8220-ae5bc216ea60	1020606305	Đôn Phong 2	457	\N	22.166944	105.77	\N	\N
41117e6b-c2f5-458e-a489-614f4f8aebdc	1020606304	Đôn Phong 3	457	\N	22.201111	105.76	\N	\N
5c192e01-10cc-4855-a0db-f0d291041232	740014	Đầu mối hồ Trúc Kinh	8516	\N	16.870833	107.0625	\N	\N
f44a8b22-fca4-4307-ba43-924d53837d9e	079368	Hồ chứa nước Cù Lây	4619	\N	18.499583	105.7965	\N	\N
1072710a-d938-432c-acca-c3263239cb03	1021715610	Tân Dân 1	5010	\N	20.774444	105.066667	\N	\N
b220016b-cedd-42b9-8ddc-dbc68815693a	1021715613	Vạn Mai	5014	\N	20.6025	105.033056	\N	\N
2aebb9cf-0c0e-4ca1-8862-8d4f88c01d6e	191474	Trường Xuân	7842	\N	17.307739	106.621876	\N	\N
1804ba36-474b-49ba-a3ed-e45bc8fd1bb5	092990	Trường Xuân	7842	\N	17.271766	106.594631	\N	\N
29c83141-c498-4c95-803c-00b4110367bc	794462	Hồ Suối Dầu, Núi Tam Đầu	5226	\N	12.123611	109.046944	\N	\N
e96cdf4e-6828-48b7-9450-5b52a23ac804	730007	Trường Sơn	7841	\N	17.218776	106.45199	\N	\N
e4a52bab-e017-49c7-96a3-eeab51299545	730002	Hồ Vực Tròn	7850	\N	17.881587	106.36725	\N	\N
1520b115-9db5-42f9-9995-86e5dbd9278a	730001	Hồ Sông Thai	7854	\N	17.928356	106.412901	\N	\N
072fd996-3014-4ab7-a3b2-1f95ca59fb84	1024042501	Diễn Thái	6735	\N	19.007924	105.524797	\N	\N
5af2e2bd-bb1c-47d1-8003-d59dc450a6a8	053997	Cao Quảng	7881	\N	17.757259	106.14752	\N	\N
c33db638-ef1e-40b1-918c-4cbda4afe6e8	820003	Đăk Na	5587	\N	14.963333	107.833611	\N	\N
35633763-cc36-4f41-a080-656888d50ffe	1026261702	Đăk Xú 3 (Đắk Na)	5587	\N	14.958694	107.820389	\N	\N
07f8574d-ba36-4c66-8e81-cc1b65f3b337	1026261606	Sa Bình 1	5589	\N	14.927583	107.824222	\N	\N
50047b2c-219d-463d-86f8-d8f70bb8c739	1026261705	Đắk Sao	5589	\N	14.927583	107.824222	\N	\N
79247a59-0330-4b6d-8f19-141969b6c08d	1022018106	Tân Hòa	5629	\N	21.9655648	106.181011	\N	\N
4d130962-459a-44bf-a95a-565422d1462b	1022018107	Tân Văn 1	5630	\N	21.9137807	106.4155476	\N	\N
65bf2bd6-86b6-4a22-b965-480aff8b8d48	036620	UBND xã Sông Hinh	7698	\N	12.817322	108.9501	\N	\N
9dd641a5-48c3-4ee0-ba8e-f2a4f1728153	780028	Sơn Thành Tây	7709	\N	12.964601	109.051532	\N	\N
d95fdca1-7bfe-4e59-b99c-ead4f11daaf4	780006	An Chấn	7710	\N	13.180833	109.288056	\N	\N
c66867d1-b985-418d-91d1-f990f8103e1c	780031	An Hải	7714	\N	13.277426	109.292944	\N	\N
71484dbf-c57f-4495-bc74-6918970c4934	481223	Đập - HCN Đồng Tròn	7719	\N	13.275722	109.161139	\N	\N
08696e66-9dff-4ed4-9665-789caab5ec9b	780032	An Nghiệp	7719	\N	13.302222	109.160278	\N	\N
003a0298-1d5f-4ffd-8e3c-0f8ad567af3d	780005	An Ninh Đông	7720	\N	13.342778	109.265	\N	\N
57418a49-092a-4744-a2d0-fa5db51bf513	040728	Cam Chính	8517	\N	16.74775	106.965581	\N	\N
e25b2abc-1a1e-4851-8343-7df2b8cb1a23	1020203203	Hồ Thầu 2	3755	\N	22.634784	104.612468	\N	\N
984c5028-a9de-4c04-bfcd-723250c741c6	1020203202	Hồ Thầu 1	3755	\N	22.618622	104.652149	\N	\N
ca335825-767b-48cd-9436-8e1a449aef69	921124	Hồ Hương Mao	8084	\N	15.756667	108.289167	\N	\N
2a42a524-4346-49db-a5cd-b61cfba9bab7	1021412607	Mường Cai 2	8902	\N	20.922217	103.744559	\N	\N
0f5af3dd-935f-4faa-8461-fc3c06308d5c	1021513516	An Phú	10985	\N	21.991944	104.84	\N	\N
0e315dee-2b2b-4f3c-a8e6-674fb187e99d	1021513504	Khánh Hòa 2	10988	\N	22.083077	104.616	\N	\N
7c5545a2-a3da-4085-bd2f-59f0309eb098	901770	Khánh Hoà	10988	\N	22.117306	104.655028	\N	\N
4ba49af9-cdf6-40ad-9d2d-c4d9d2c741af	1021513511	Lâm Thượng	10990	\N	22.184444	104.7	\N	\N
0a0b654d-62b3-4459-9b1a-bf9a11a0edec	210015	Lâm Thượng	10990	\N	22.194636	104.690913	\N	\N
37c774d2-6f80-42f0-8bff-faeb0c4fbe0a	1021513507	Liễu Đô	10991	\N	22.106558	104.803564	\N	\N
cc0eff43-7f59-4c51-b435-8a4130634f38	1021513709	Mồ Dề 2	11017	\N	21.858805	104.064062	\N	\N
95168d48-aa58-4f5c-b7be-bc243a1f7d63	1021513705	Mồ Dề 1	11017	\N	21.8625	104.097778	\N	\N
d9e28c9a-dc9b-411b-b920-0515524b0e2a	1021513502	Trung Tâm 2	10998	\N	22.006665	104.750544	\N	\N
2495f62f-b14c-455d-ae83-bf5a708b92f1	911064	Lũng Hà	10998	\N	22.011479	104.717431	\N	\N
7c79e51c-0200-42f8-b6af-d0c4ce14093d	1021513503	Phúc Lợi	10998	\N	22.0375	104.688056	\N	\N
fa368f29-bbe4-4fdc-9fb7-8bd53b3ecb8a	1021412601	Mường Sai 2	8905	\N	20.965073	103.994463	\N	\N
d38b5007-b992-444c-9fe2-5c78c483824b	1021412609	Nậm Mằn	8906	\N	21.082015	103.574818	\N	\N
1d1ead2e-053c-41ad-8f88-dd9570f81c85	1021412608	Nà Ngựu	8908	\N	21.082731	103.730156	\N	\N
2d6e1c79-86c7-4f9b-b780-839691aea4e0	1021412804	Tô Múa	8952	\N	20.886842	104.82453	\N	\N
d54780ac-2801-442f-9a60-724ff90ce5b3	1021412805	Vân Hồ	8953	\N	20.809143	104.778895	\N	\N
b743d3ba-bdef-46a4-b917-5a60345bb85b	1021412807	Xuân Nha2	8954	\N	20.735748	104.799235	\N	\N
ae100117-21aa-4c60-b1ef-9308e929dfec	1021412806	Xuân Nha1	8954	\N	20.708342	104.781428	\N	\N
dea5d768-1221-40e7-96d3-fcf1db01eea5	764137	Chiềng Đông	8955	\N	21.10958	104.23129	\N	\N
74abb282-e95e-4d9b-9a0d-40241935bc4a	1021412403	Chiềng Hặc	8956	\N	21.015176	104.383189	\N	\N
e9a52fd0-7f8a-4f36-9edc-f362b0d62c0b	041039	Tân Long	8606	\N	16.597261	106.654815	\N	\N
9edcedaf-9284-4a0c-a31b-82b72159e10e	1021411912	Co Mạ	8921	\N	21.36216	103.51248	\N	\N
8fe2c19d-6249-4ef2-acf0-3e1021b44a1d	1021412509	Chiềng Nơi 7	8815	\N	21.226944	104.119722	\N	\N
464ce6ab-f79c-4219-be1d-a82d6ec273a0	226710	Nà Bó	8815	\N	21.22066	104.14642	\N	\N
ba260f91-c578-4419-93f6-e841d79eef1e	260026	Phiêng Cằm 1	8816	\N	21.075	103.826389	\N	\N
c5f57ae8-9d6b-4d6a-aaac-0ee55bba7657	1021412511	Phiêng Pằn	8817	\N	21.064722	104.056111	\N	\N
90397ef1-8b13-4f4f-a4ee-4656c3ed8789	1021412513	Tà Hộc 2	8818	\N	21.254167	104.220833	\N	\N
e0873bcd-96f6-40c2-a00c-a7105db124a8	1021412512	Tà Hộc 1	8818	\N	21.227778	104.225	\N	\N
d1ab446b-592f-4ea8-95a1-a86d2ac458d7	260131	Cà Nàng (Quỳnh Nhai, Sơn La)	8862	\N	21.932777404785156	103.5536117553711	\N	\N
37d0d925-7086-4150-87d9-e1d560deeffd	1021411807	Cà Nàng	8862	\N	21.973889	103.504167	\N	\N
ea1df43b-c636-4aaa-aa04-343a8188d104	838293	Mường Sại	8863	\N	21.633693	103.652005	\N	\N
c1dba796-b883-450b-92d9-5fb7fecdb6f9	1021411908	Mường É	8928	\N	21.52361	103.57722	\N	\N
d4e0eedb-5859-4e42-ba74-bc1149d30e06	260138	Mường Khiêng 1 (Thuận Châu, Sơn La)	8929	\N	21.478055953979492	103.9102783203125	\N	\N
bacb920f-235c-4758-8d1d-1ca49b24438e	260139	Mường Khiêng 2 (Thuận Châu, Sơn La)	8929	\N	21.503889083862305	103.8405532836914	\N	\N
edbdf0a3-832f-4e2b-95ae-2cda8273b050	1021411918	Mường Khiêng	8929	\N	21.47331	103.96	\N	\N
9677a64c-5dd2-4e0a-b49c-db9fdbaa3fb3	1021411915	Nậm Lầu 3	8930	\N	21.318043	103.761079	\N	\N
b28aa6be-4fd5-4608-90d1-bd6c1222a1a7	1021411903	Nậm Lầu 2	8930	\N	21.35757	103.72032	\N	\N
96d8a9db-9b07-44fb-87d5-f907507fb910	750026	Bình Tiến (Hương Trà)	9128	\N	16.351944	107.447222	\N	\N
0f9a9b34-781a-4d79-a155-508b00bfdf6a	750002	Hồ Mỹ Xuyên (Phong Điền)	9163	\N	16.635278	107.322778	\N	\N
69f68900-ba2f-4cb0-b4c8-ac5dac35a673	682816	Hồ Hòa Mỹ (Phong Điền)	9164	\N	16.499444	107.315278	\N	\N
d2ed6a7e-030b-40c2-9ce9-bdae45e47cca	750022	Đồn Biên phòng Cảng Chân Mây (Phú Lộc)	9177	\N	16.324722	108.028611	\N	\N
54df070f-5acf-40e0-89c3-5ce2ffdb54a1	750021	Đồn Biên phòng Lăng Cô (Phú Lộc)	9178	\N	16.230278	108.087222	\N	\N
e1ce1a6b-5dfd-48c1-9e57-5ddfd9e6ca77	200002	Thần Sa	9679	\N	21.799722	105.901944	\N	\N
754c6345-461f-40f9-99ef-ae6546b97220	1020807201	Yên Hoa	10660	\N	22.511276	105.480245	\N	\N
817bb433-ebe1-45f0-83fb-89b42f0a2300	360003	Hồ Mậu Lâm (xã Mậu Lâm, Như Thanh)	9917	\N	19.689722	105.5875	\N	\N
9e438d0a-5d62-4215-b725-790a719ca8a2	079360	Thái Hòa	10635	\N	21.968793	105.112669	\N	\N
c188000c-ddb2-43a8-8a3e-3d00ea92e6db	226660	Thành Long	10637	\N	21.990278	105.0675	\N	\N
d4e9376c-fe31-4df4-9310-6050ea2b56d2	226659	Yên Lâm	10638	\N	22.174167	104.938611	\N	\N
0f64da1d-69e4-4400-b334-f9e01ac37fcd	079361	Kiến Thiết	10714	\N	21.99546	105.313803	\N	\N
6ae1d16c-ccd5-44ab-9358-27b80f00d850	667423	Kim Quan	10716	\N	21.852942	105.438683	\N	\N
6254948d-3dc8-4161-bc93-d1d102109222	079363	Lăng Quán	10718	\N	21.866111	105.121667	\N	\N
4692014e-3c64-4dc6-9be7-ee3289a94aea	172231	Mỹ Bằng	10719	\N	21.75	105.0925	\N	\N
22553a87-3762-4f1f-a66d-6a21d2467997	873110	Xuân Lẹ	10199	\N	19.792222	105.207222	\N	\N
108560ad-3e3f-4c72-84e7-b0d12c3df5ae	690016	An Xuyên	1522	\N	9.24066	105.186	\N	\N
f73d775f-7a77-4c33-bd81-8d6f5cad7c29	690012	Viên An	1579	\N	8.68907	104.87622	\N	\N
dd34ed6f-b088-4a2b-9396-daee8b44bb29	1021513509	An Lạc	10984	\N	22.171944	104.594167	\N	\N
893fe0ad-5f6a-4ccc-a60c-350dbcb699da	740015	Đầu mối hồ Đá Mài	8524	\N	16.82	106.940833	\N	\N
220124ff-78d0-4d0c-8723-02b94171aa2a	740003	Cam Tuyền	8524	\N	16.818889	106.983611	\N	\N
4299c54e-7cc1-47eb-a57f-c1dcf185b21a	483784	Viễn An Đông	1580	\N	8.694473	104.930871	\N	\N
8b1bf987-4383-4ffc-8771-93efe93f5e5f	690014	Phú Thuận	1584	\N	8.917528	104.939086	\N	\N
48ed1bc8-83a8-477e-af5b-a0e2276feebc	200015	Lương Sơn	9630	\N	21.510815	105.886188	\N	\N
44f74d58-acd8-42f3-8bb6-e51dccb17e99	732267	Biển Hồ	2797	\N	14.029945	107.989076	\N	\N
d3868dbe-08da-4ae7-83c9-25a25722f7ad	1020404507	Cần Yên 1	1783	\N	22.8963346	105.9222356	\N	\N
5e7a2859-b4e4-4fa7-a63f-f4d9605b34fd	627261	Cần Yên	1783	\N	22.896111	105.924444	\N	\N
dba33a9d-9344-4243-9140-5386b1a1fe3e	468745	Thạch An	1770	\N	22.428773	106.431632	\N	\N
b56bf65d-7b1e-4075-b110-fcf817c7d40d	394544	Năm Làng	1771	\N	22.528514	106.328624	\N	\N
a75210ba-c4c2-428f-bfbb-034dc6333982	220007	Bình Phú	10598	\N	22.1875	105.427222	\N	\N
d340c804-5508-4192-8006-8ac4fd9cfe81	226654	Hà Lang	10599	\N	22.272778	105.143611	\N	\N
29f673f2-02d5-4753-8eb7-8b65c78cca04	220009	Hòa An	10600	\N	22.094147	105.243639	\N	\N
ed19efa2-57ab-47ec-89f5-63af6ed61614	817224	Hùng Mỹ	10602	\N	22.216944	105.2825	\N	\N
c3c1b308-4024-4f3d-b5c7-b848224a04a0	220022	Hùng Đức	10627	\N	21.917776	105.095634	\N	\N
0d03319c-92c7-4223-9f64-ee4eb58622f9	726865	Kỳ Lâm	10681	\N	21.696935	105.398058	\N	\N
7185d82e-d2ea-40a6-ad11-f2feda94ed95	412903	Sơn Nam	10682	\N	21.552508	105.462817	\N	\N
9e39b7f8-e1c0-4a3b-9d8c-56907d036aad	1020203104	Lạc Nông 1	3688	\N	22.757933	105.257253	\N	\N
7e33b128-d92d-48e2-b479-ebaa2fe3ef86	1026766602	Đạo Nghĩa 2	2024	\N	11.894671	107.551433	\N	\N
a1aaefbb-e8ef-43b8-8af4-29b1382cade1	384943	Đạo Nghĩa	2024	\N	11.871978	107.531755	\N	\N
02c989ef-0e7e-4af4-93a1-9f57e37ffed5	001906	Đăk Ru, Đăk R'lấp	2025	\N	11.912487	107.399069	\N	\N
e42c34db-cc71-410b-9ede-5f5e8b5586be	074782	Trung tâm GD-DN 05-06	2411	\N	16.143774	108.025415	\N	\N
470879f8-f924-4e87-83d4-790fa969b4ff	522912	Trạm Kiểm lâm Sông Bắc	2411	\N	16.133334	107.983456	\N	\N
08a29c53-bf59-47ac-8fa2-29dcba7ebd5c	001204	Hòa Bắc	2411	\N	16.120133008	107.98470798	\N	\N
278d5154-fad6-44ce-9b40-70a64f03fb9f	260101	Tỏa Tình (Tuần Giáo, Điện Biên)	2572	\N	21.623340606689453	103.51142883300781	\N	\N
0a478cee-95ee-4add-8c52-bd1ce965c883	1021109905	Tỏa Tình	2572	\N	21.577791	103.504126	\N	\N
c38513ad-bd6d-436f-a3c6-d47cb1027b17	762065	Ta Ma (Tuần Giáo, Điện Biên)	2573	\N	21.72249984741211	103.53055572509766	\N	\N
de65f34a-a52c-4d62-96f2-5fce365350d6	478414	Chợ Cháy	3883	\N	20.714144	105.834021	\N	\N
98ad8e66-4ce2-4716-9cee-0e9d14279683	481603	Yên Hân	525	\N	21.933657	105.94392	\N	\N
d9b37b48-7584-46a2-b486-2674af223a87	1021514018	Chấn Thịnh	11066	\N	21.485046	104.847644	\N	\N
dafaa63e-0381-4b45-b3c1-c9c510f02f24	210012	Chấn Thịnh	11066	\N	21.488333	104.831389	\N	\N
82a95f27-0af1-42a1-8c9a-923972b96f5d	1021514017	Đại Lịch	11067	\N	21.537951	104.81822	\N	\N
48a8de22-9dba-4c8e-9ad6-c758ddae9da1	226653	Phước Ninh	8024	\N	15.680278	108.004444	\N	\N
f9a0351c-ca82-43a9-8d68-3d4a7575c8bd	000437	Quế Lộc	8025	\N	15.690723	108.103483	\N	\N
25dfc620-aa99-4555-a454-0bc37a98e130	0120619B	Quang Nam - Phuoc Son - Phuoc My	8067	\N	15.3668794631958	107.7550048828125	\N	\N
a04e553a-6306-415c-878f-36e2f76fbd1b	920005	Phước Năng	8068	\N	15.400683	107.761958	\N	\N
e5c59355-33a0-4c84-a450-d4a69e758757	140002	Phình Hồ	8444	\N	21.600054	107.859534	\N	\N
c9883d83-c0a1-49a8-8159-7c11f71a2208	908565	Đoan Tĩnh	8451	\N	21.550389	107.934306	\N	\N
5d811bd1-a41c-47d7-bdc2-93187d9201a4	608474	Cốc Pàng	1625	\N	23.045	105.593333	\N	\N
398db16a-4455-49b5-b0b7-427a1ecd2716	110013	Yên Thổ	1653	\N	22.679444	105.522222	\N	\N
82c802b4-f810-4a50-9cef-e7aa09e1b671	1021513510	Minh Chuẩn	10993	\N	22.170556	104.633611	\N	\N
06fb454c-9331-4714-90a2-8e44533c392d	1021513501	Trung Tâm 1	11004	\N	21.970556	104.752778	\N	\N
64c009b0-bd70-4706-8105-f007d28f8eb3	468306	Vĩnh Lạc	11005	\N	22.084167	104.839444	\N	\N
b5674e5b-f97c-4f64-909c-b4ebb4ffb956	1021513702	Chế Cu Nha	11009	\N	21.822778	104.124444	\N	\N
2775d990-ac94-4ce2-b2da-cfc7006a89c0	1021513703	Chế Tạo 1	11010	\N	21.730278	104.033056	\N	\N
851a3778-4f49-4856-8f87-f911ba45923b	915262	Chế Tạo	11010	\N	21.725623	104.032863	\N	\N
1d3c1632-36cd-47b4-a965-69b2b826f005	1021513805	Việt Cường	11059	\N	21.638205	104.835057	\N	\N
bc52ce4b-e5e3-44de-8bef-42e09e95fc7e	210011	Việt Cường	11059	\N	21.638611	104.858611	\N	\N
12d0d69e-7491-4f7f-9b28-ca5e90c3af28	430702	Mỹ Lương	7618	\N	21.474875	104.947861	\N	\N
f113c6f7-1310-4eb0-8e96-ea8628866b2a	1021008910	Khánh Yên Trung	6226	\N	22.075603	104.289162	\N	\N
efd8a0b6-114f-4d28-b8c3-bf08dc5db389	1021008912	Minh Lương	6229	\N	22.011306	104.050555	\N	\N
cd586d2b-926e-4e67-9b7c-bfa5936be493	1021008913	Nậm Chẩy	6230	\N	22.109858	104.067199	\N	\N
18373817-47e7-427d-8a3c-ef030411ea01	240030	Nậm Chày	6230	\N	22.114167	104.079167	\N	\N
01bc9954-76f4-42c0-9d52-8e472ae06fab	1021008914	Nậm Mả	6231	\N	22.199261	104.183733	\N	\N
84dc72f4-a11a-4fdd-8d88-bf2425cd11d0	471503	Vạn Ninh	5662	\N	21.684626	106.51571	\N	\N
bdc04ac6-0248-47b2-99fc-db239db8cccd	764520	Ninh Tây	5329	\N	12.547508	108.92588	\N	\N
644f7c94-c35c-43b7-8d6f-e129a6b97c89	74034	Tân Uyên	1165	\N	11.050833	106.763889	\N	\N
485a26b1-f41f-431d-93c3-6753589d20ab	076216	Tân Pheo	4868	\N	20.988261	105.050082	\N	\N
c2620de5-7d2c-433f-b728-dad0cdbc0b28	993132	Bản Lầu	6172	\N	22.563465	104.070388	\N	\N
9f297b4f-d282-49d8-bffc-aee824ed3c26	1021008905	Chiềng Ken	6219	\N	22.057828	104.321462	\N	\N
da7e8691-bb82-422f-9a25-7ed19bd87814	1021008906	Dần Thàng	6220	\N	22.096398	104.14822	\N	\N
81547f27-732c-42f6-b953-241aa9707257	970807	Dương Quỳ	6221	\N	22.054592	104.142655	\N	\N
14fe2ad4-fe74-4d7d-b2af-99763202dfd9	1021008902	Hòa Mạc	6222	\N	22.082695	104.199357	\N	\N
0ebcfd39-6112-45f2-83a8-c88ddc4b1dbc	240015	Hòa Mạc	6222	\N	22.090926	104.200883	\N	\N
bc828363-3a62-4961-acee-c80fc6cc2638	00206242	Lao Cai - Van Ban - UBND xa Hoa Mac	6222	\N	22.091127395629883	104.20075225830078	\N	\N
b5326110-a395-440a-8d5b-7e05cfacd980	1026261403	Đắk Ruồng 2	5541	\N	14.430556	108.143944	\N	\N
ebe091a3-08fe-4535-b210-6de73fdb3668	1026261402	Đắk Ruồng 1	5541	\N	14.462333	108.165472	\N	\N
a51322c8-bbc1-4603-a0c0-6422a61ceb7d	742215	Thị trấn Đắk Rve	5542	\N	14.507222	108.2475	\N	\N
1566188e-a552-4c70-948e-97d9c5cb2122	1026260803	Đắk Blà 3	5547	\N	14.368972	108.061861	\N	\N
1bde4c92-6ba4-4e41-b737-cc79605c464a	1026260801	Đắk Blà 1	5547	\N	14.381722	108.029306	\N	\N
5c3648be-5cf4-401b-8438-a944545e9004	690010	Phú Hưng	1545	\N	9.077641	105.061633	\N	\N
5182b7e8-4100-4040-8187-da17d9168394	690019	Tân Hưng	1546	\N	9.03585	105.07798	\N	\N
f8df255d-a940-43e7-b229-2ee3c2250654	1022018102	Minh Khai 2	5625	\N	22.0271699	106.3918842	\N	\N
2984dd93-d993-48da-af85-2f2d874dbf3e	1022018101	Minh Khai 1	5625	\N	22.0477083	106.3906607	\N	\N
7118190c-467d-49e5-a1ea-960111969a81	1021513710	Dế Xu Phình	11011	\N	21.778287	104.145839	\N	\N
98684a42-180a-41ab-b38b-e934e04c47db	260102	Na Sang (Mường Chà, Điện Biên)	1	\N	21.693538665771484	103.08242797851562	\N	\N
bbe5de68-5b8f-4efc-a4fe-5805ec093692	200013	Mỹ Yên	9516	\N	21.581123	105.594815	\N	\N
d0a75785-b31c-4bce-b92d-6ee0692d2ec8	894608	Thị trấn Quân Chu	9526	\N	21.496944	105.686667	\N	\N
2fe395d1-f5fb-4df1-9da3-1147c2b75391	890478	Yên Lãng	9532	\N	21.685	105.516944	\N	\N
b29d2daa-3ec7-4dcd-a12a-ac7f737a59c6	750007	Nhâm (A Lưới)	9083	\N	16.221111	107.179444	\N	\N
c32199b3-e659-4a3d-9528-3cdbc325b985	380002	Hồ Khe Cò	4713	\N	18.392222	105.159444	\N	\N
e7d816eb-fd19-4e5d-88bf-403a8b5fc34c	1024243907	Cầu Treo	4713	\N	18.390026	105.158583	\N	\N
20442aff-38b1-4ce6-be81-eeda00a2cb93	1024243908	Sơn Kim 3	4713	\N	18.432199	105.252046	\N	\N
6f745754-c8b5-48ea-b00b-b0af5b720298	1024243909	Sơn Kim 1	4713	\N	18.464167	105.279667	\N	\N
bf806a81-32f6-4cf7-bc6a-76e2e68267f4	355761	Sơn Kim 1	4713	\N	18.445222	105.284	\N	\N
ba2c65b6-b370-491b-882d-d8d96a0daf36	613430	Cát Bà	3097	\N	20.733492	107.044815	\N	\N
b88b3e2c-465b-4a28-b93b-d7bd84fc60b6	1021008911	Liêm Phú	6228	\N	22.02178	104.31202	\N	\N
e79aa06a-bed6-4f6e-8a6f-d7c72165f3eb	0120BD43	Lao Cai - Van Ban - UBND xa Liem Phu	6228	\N	22.021812438964844	104.31244659423828	\N	\N
86880893-43cb-4fb1-be1d-e4fbd88e428e	850334	Hòn Khói	5330	\N	12.559216	109.195304	\N	\N
9c63b7e5-730d-4b44-884b-bb5269cbce30	470684	Đức Phong	8215	\N	14.927778	108.918056	\N	\N
9dafc51b-ca41-4287-acdb-0b5498bc295c	1021715701	Ân Nghĩa	4928	\N	20.421944	105.509444	\N	\N
9d90a39e-c4cb-43ee-82bb-6a17c64c7dfb	750031	Hương Bình (Hương Trà)	9130	\N	16.380273	107.487293	\N	\N
1b5ef148-65ac-4228-a63f-5eee7ce4bef3	750040	Hương Chữ (Hương Trà)	9131	\N	16.491431	107.520801	\N	\N
ae54c69f-46d5-4d38-aa9d-97ad883a23ab	681524	Hồ Thọ Sơn (Hương Trà)	9139	\N	16.476667	107.478333	\N	\N
aa8bb62d-a2cf-4e78-aef5-e04055c06748	01206351	Thua Thien Hue - Thuong Lo - Luu Vuc	9144	\N	16.139436721801758	107.79183959960938	\N	\N
27a73893-9256-48a5-aee8-94f66187b356	750028	Hương Sơn (Nam Đông)	9146	\N	16.169597	107.681303	\N	\N
ac42233e-65b6-4c56-bffe-011e67b19b71	095172	Vĩnh Thịnh	10285	\N	20.0107	105.732188	\N	\N
088f302f-6794-4223-9a3d-6cafa94e3f0b	360006	Hồ Rát (xã Vĩnh Thịnh, Vĩnh Lộc)	10285	\N	20.046667	105.742222	\N	\N
9b53e963-1087-4e06-af04-fdb5c8ea9c0d	625960	Trung An	9493	\N	20.409461	106.314595	\N	\N
d40011c7-8950-430b-82cb-f452eea80255	220019	Đà Vị	10650	\N	22.46709	105.534935	\N	\N
2b6582a8-c55c-4d99-970f-ebe94e236101	1021211211	Hua Bum 3	5844	\N	22.396111	102.933889	\N	\N
dd540fff-475c-4ecf-8136-13bc2cee3f57	1021211201	Hua Bum 2	5844	\N	22.397778	102.977778	\N	\N
cf5f2bb7-9c99-4713-a915-6259d6ab08a3	866746	Hua Bum	5844	\N	22.39765	102.97723	\N	\N
c084f05e-073b-4e6d-8414-561bde0c62a4	1026261503	Đắk Hring 1	5508	\N	14.590389	107.909972	\N	\N
64ed01e8-a38e-4bc2-bc7f-c68a6bb73d0d	891958	Dân Tiến	9670	\N	21.666111	106.134722	\N	\N
7981f590-e906-44f1-81e1-1e7cfb9b8649	958431	La Hiên	9672	\N	21.703056	105.9225	\N	\N
2d74bc85-0ccd-41c6-94b2-251b00c5ebef	095174	Hà Lĩnh	9785	\N	19.999156	105.768611	\N	\N
e16074dd-06f3-403d-9806-a72d7317b742	1021110103	Na Son 2	2479	\N	21.404167	103.242222	\N	\N
a08203c0-8ab9-4856-86ac-b3ff0bac1fbf	1021110105	Na Son 1	2479	\N	21.326389	103.242222	\N	\N
679aebc6-b454-409c-97dc-acfa78c216bc	270005	Na Son	2479	\N	21.323056	103.241667	\N	\N
32b6dbd1-0b93-44d0-ae79-75ddf416835b	1021110113	Phì Nhừ 5	2481	\N	21.238248	103.26573	\N	\N
bce024b7-36c0-4e1d-841d-6dcc4424bf81	1021110114	Phì Nhừ 2	2481	\N	21.278439	103.290117	\N	\N
bd6336b1-426a-45dd-871f-f72f4c52d954	1021110115	Phì Nhừ 3	2481	\N	21.304053	103.284339	\N	\N
2ac88f4f-f114-49ce-a424-afc52332e75e	1021110112	Phình Giàng 2	2482	\N	21.204138	103.253065	\N	\N
9e811a52-8d65-4da9-b6aa-22e0ddcdcfda	1021110111	Phình Giàng 1	2482	\N	21.163441	103.242505	\N	\N
a3556d65-493d-44df-b35b-2b2feeb09295	1021110102	Pú Nhi 3	2484	\N	21.383333	103.188333	\N	\N
af3e0ef2-cae0-4ba6-8401-76236a21385f	1021110101	Pú Nhi 2	2484	\N	21.376944	103.128333	\N	\N
db11f0d4-e4e2-4a61-8965-b17593059d51	270009	Hồ Nậm Ngám	2484	\N	21.381111	103.1375	\N	\N
c44de789-6591-4bc8-932a-c19263892807	140005	Hà Lâu	8487	\N	21.433611	107.296111	\N	\N
16a8b5ed-7a7b-4049-b0ff-fbec5c94bcee	354572	Buôn Nung, Chư Drăng	2739	\N	13.209271	108.569625	\N	\N
ee5738a4-6786-410f-b7a3-b4e3c5d9b61a	741203	Chư Drăng	2739	\N	13.195278	108.636389	\N	\N
9bdd6e75-4af1-48db-81cc-f51266156dec	1026463703	Chư Drăng	2739	\N	13.204722	108.631944	\N	\N
4b2705fd-3155-4480-8cad-7112939143f0	664873	Chư Gu	2740	\N	13.236111	108.640833	\N	\N
2d5faa9e-ccdb-40f6-8f7e-42255a0bb4e7	774463	Chư Ngọc	2741	\N	13.139722	108.766111	\N	\N
92b08ac0-2946-41ab-95bc-62fbc044d4e3	1026463701	Chư Ngọc	2741	\N	13.154444	108.747222	\N	\N
509bd9f7-e214-4556-b830-4695682d9254	1026463702	Chư RCăm 1	2742	\N	13.304722	108.603333	\N	\N
592b9dd2-3483-43bb-8315-b19ddc18d4af	354388	Chư Rcăm	2742	\N	13.338091	108.653198	\N	\N
b836376a-2c1f-49f8-8768-d4b5d12a2f00	165950	Đất Bằng	2743	\N	13.248911	108.805292	\N	\N
e014dbbe-7a74-4053-a112-c8a831fbcd58	517047	Thôn Ma Leo, Đất Bằng	2743	\N	13.245278	108.81	\N	\N
ba320148-6f80-41d6-b2aa-a49f5c2fcf56	810002	Hồ chứa nước Ia Dreh	2744	\N	13.0994	108.63497	\N	\N
46587aba-968c-4c20-b5b2-74113c223653	355680	Buôn Dù, Ia Mláh	2745	\N	13.226659	108.723128	\N	\N
66d5b4b2-2807-4347-ba31-422f2d8bbd85	123456	Ia R'Mok	2746	\N	13.159068	108.685285	\N	\N
4da63278-7308-45f5-bf5b-03972859448c	750006	Hương Nguyên (A Lưới)	9081	\N	16.081111	107.485278	\N	\N
8575c37d-fb7a-4409-bc02-05fa300f6733	818227	Bảo Nhai	6115	\N	22.416112	104.262405	\N	\N
33633baf-e009-4603-b869-7240e91b34c0	1021008507	Lùng Phình	6122	\N	22.59705	104.32503	\N	\N
de79b532-d743-4900-b93f-b30e42bd3c46	827707	Lùng Phình	6122	\N	22.592778	104.325556	\N	\N
f22e7b4b-3946-45ce-84b2-b94f0bca578c	1021008502	Nậm Đét	6123	\N	22.45306	104.31094	\N	\N
998b8266-46da-4c49-8ba2-00c6e5131d2e	012062C1	Lao Cai - Bac Ha - UBND Nam Det	6123	\N	22.453350067138672	104.31111145019531	\N	\N
57c68e75-9105-4d45-ad11-58f9c99e605f	341081	Thủy điện Nậm Phàng	6124	\N	22.446194	104.341	\N	\N
14493d9e-0c28-42ff-b721-32df4a50afc7	1021008501	Nậm Lúc 1	6125	\N	22.35581	104.38316	\N	\N
4643bf5d-2b9b-4ce7-8eec-79cf820ca4da	240016	Nậm Lúc	6125	\N	22.392151	104.335524	\N	\N
94e3327c-238a-43aa-817e-468b7c0f9612	1021008503	Nậm Mòn	6126	\N	22.48678	104.24911	\N	\N
96274bdf-e230-4b4a-aa0c-a4bf74722896	01206349	Lao Cai - Bac Ha - UBND Nam Mon	6126	\N	22.48593521118164	104.24852752685547	\N	\N
a0c73918-3c52-46ad-ab5a-13ca38275831	1021008204	A Lù	6132	\N	22.70714	103.61117	\N	\N
f05ce222-e682-4294-bfa1-921e3a560c96	240023	A Lù	6132	\N	22.704755	103.596189	\N	\N
5d36dc22-81c6-4f2e-8e5d-36545ef36023	1021008203	A Mú Sung	6133	\N	22.76501	103.64276	\N	\N
249ccc8f-2a06-46af-bd5f-0bcb325aa6c8	240004	A Mú Sung	6133	\N	22.746944	103.631667	\N	\N
9d78e0aa-37b6-42ac-ba0b-45569fa51008	106604	Mường Hum	6142	\N	22.530833	103.712222	\N	\N
02c6781e-de1e-47a6-9ae1-4f97a2058f67	1021008211	Nậm Pung	6145	\N	22.497892	103.722174	\N	\N
a0b46657-0184-49e2-9a88-66fe62220c92	349772	Cốc Mỳ	6149	\N	22.512972	103.894944	\N	\N
6b7f67aa-6ad5-4e1c-bc8f-7971621d72d9	1021008214	Quang Kim	6149	\N	22.518015	103.915095	\N	\N
f549cd04-5d88-43e9-9c3b-44447cf3de78	1021008215	Sàng Ma Sáo	6150	\N	22.538523	103.689908	\N	\N
5fc3279c-5fa8-4a67-9f06-9d589cd6db4f	1023838707	Trung Xuân	10040	\N	20.333897	105.079486	\N	\N
9ae97a97-6f07-4f6e-883d-618fb505bf83	1021513807	Y Can	11062	\N	21.748056	104.816667	\N	\N
943e286a-e8a1-4cf2-b87f-828e068dd0db	1021514010	An Lương 1	11063	\N	21.663714	104.641311	\N	\N
0695113c-c0a1-4230-84c4-8670e3b9917d	1021514011	An Lương 2	11063	\N	21.681389	104.6125	\N	\N
649cdc2f-b2f6-46c0-8c5d-f48fcb6de55c	931918	An Lương	11063	\N	21.681887	104.609336	\N	\N
5c08c921-83ba-4e25-bc95-23f2d29892d6	1021008302	La Pan Tẩn	6176	\N	22.61942	104.14327	\N	\N
680a056a-4aa0-4119-8979-a9d56af121c5	1021008301	Lùng Vai	6178	\N	22.604885	104.087756	\N	\N
10dfff2f-2cfe-436a-8f78-a5587bc59020	251493	Mường Khương	6179	\N	22.758635	104.118333	\N	\N
f51ba852-f554-4e6d-be2e-c9f9e39e386a	1021008814	Bản Hồ 1	6188	\N	22.22299	103.9438	\N	\N
cdd83ac5-70d5-4dd5-8811-29e7cda1560a	1021008802	Bản Hồ 2	6188	\N	22.263648	103.970447	\N	\N
f0b9d1bd-f803-4a55-8fba-4eff44901c09	240010	Bản Hồ	6188	\N	22.263071	103.967565	\N	\N
2271a483-7b81-40dd-8e4e-61c8fdee68e4	01206366	Lao Cai -  Nam Toong - Dap thuy dien	6188	\N	22.222951889038086	103.94379425048828	\N	\N
31a67690-c7dd-4647-ba70-1bc8a7cdeff8	1021008812	Thanh Kim	6190	\N	22.286455	103.971206	\N	\N
150887c6-abd8-4fd6-9feb-98888c6b0ab4	1021008804	Bản Phùng	6190	\N	22.302223	103.985463	\N	\N
6096c2a0-ef95-4763-8db2-0fab65f5c186	092996	Thủy điện Tà Thàng	6190	\N	22.298667	104.021333	\N	\N
1931710e-6732-40ac-a0bc-0d962597b7d3	1021008807	Nậm Cang 2	6193	\N	22.243	104.005985	\N	\N
705be3ad-d3b4-4301-b3c0-1b220bdad406	1021008808	Nậm Cang	6193	\N	22.217583	104.034898	\N	\N
57becb73-5df8-4222-bb73-c32175775cdb	1021008803	Bản Khoang 2	6200	\N	22.407709	103.787881	\N	\N
26a4ea5c-2a2e-4a59-851b-f15efd8a497d	1021008810	Tả Giàng Phình	6200	\N	22.452261	103.769632	\N	\N
f108545d-3629-42d5-bd81-fb916e846724	784236	Bản Khoang	6200	\N	22.417222	103.785278	\N	\N
112d631a-47ed-4209-8960-a0800396e181	1021008813	Tả Van	6202	\N	22.25909	103.88908	\N	\N
93c6b0b9-8439-4e34-8d52-cc4eabd5cd72	240012	Tả Van	6202	\N	22.30274	103.888765	\N	\N
587ba285-e243-4751-93f9-e29a3f3bdb78	343047	Thủy điện Séo Chông Hô	6202	\N	22.247972	103.894889	\N	\N
0cf5f6e5-204d-43b4-a9ed-be53cc646529	095181	Mai Lâm	10219	\N	19.375556	105.754722	\N	\N
0a13d999-2eae-4bc4-b39c-34de769b6086	71567	Đồng Trăng	5256	\N	12.282	109.007	\N	\N
7067e9a4-f92f-4eae-9f29-89f2ec5361f1	075560	Hồ Hoa Sơn, lưu vực Đá Trải	5342	\N	12.799936	109.271202	\N	\N
b0e63863-7393-4dd6-be21-58b4db6f0061	075772	Hồ Hoa Sơn, Đập đầu mối	5342	\N	12.792852	109.29189	\N	\N
050744ac-1a54-414d-9588-ab90cdd8ad94	075660	Hồ Hoa Sơn, Lưu vực Suối Sung	5345	\N	12.817195	109.295489	\N	\N
e3157b4e-afb2-4d34-a483-ac33af14392e	075655	Hồ Hoa Sơn, lưu vực Đập Kiều	5345	\N	12.812454	109.281496	\N	\N
c60f2fba-cc18-482a-a829-b448ea0aadcb	780021	VPTT BCH PCTT&TKCN Phú Yên	7739	\N	13.101944	109.315833	\N	\N
db7f60d3-dfe9-4044-b3d5-ccc3116d6442	270001	Pa Tần	2538	\N	22.037222	102.735	\N	\N
b4ff79a0-f126-4fbe-883c-d028f37b4892	1021110304	Phìn Hồ	2539	\N	21.83537	102.936165	\N	\N
64311980-4a19-4678-ad00-3c79bef63b33	1021110301	Si Pa Phìn	2540	\N	21.766183	102.944478	\N	\N
89451773-889e-454d-ae31-86fed8442673	811026	Si Pha Phìn	2540	\N	21.78965	102.94899	\N	\N
8b49aca6-490f-427f-a2b4-b59c6623cd19	860022	Hàm Tiến	1394	\N	10.95526	108.2459	\N	\N
b879a8f3-bc5f-46fa-8578-7455349591d0	260120	Chăn Nưa (Sìn Hồ, Lai Châu)	5874	\N	22.19416618347168	103.17082977294922	\N	\N
7819f05f-3f6d-4ff0-bd92-4aa1bb1aa971	1021210806	Chăn Nưa 1	5874	\N	22.150088	103.189965	\N	\N
81163e88-5661-4aca-babf-a9cf2eb2759c	1021210804	Hồng Thu	5875	\N	22.426667	103.255556	\N	\N
284981bc-409d-4aa7-90bb-7f352278f3c9	1021210811	Làng Mô 2	5876	\N	22.237778	103.232778	\N	\N
9a7d5a99-2fd0-48b1-bc9c-c24cc9458e42	1021210810	Làng Mô 1	5876	\N	22.213611	103.256944	\N	\N
ed39b4bc-a94d-4805-9f3f-fc4663659c02	260122	Lùng Thàng (Sìn Hồ, Lai Châu)	5877	\N	22.351667404174805	103.36000061035156	\N	\N
8554acf2-008b-4142-aa42-e5430cd27fc5	1021210803	Ma Quai	5878	\N	22.408333	103.316389	\N	\N
d41a4669-21e2-4b4e-a9ce-e098e8a99395	260125	Nậm Cha (Sìn Hồ, Lai Châu)	5879	\N	22.212549209594727	103.4104995727539	\N	\N
a261a5c4-a125-423b-b230-3c02ee2d8aa9	1021210813	Nậm Cha	5879	\N	22.191111	103.370833	\N	\N
48530964-33a9-4861-a06b-425656e60712	1021210820	Nậm Cuổi 4	5880	\N	22.126012	103.517368	\N	\N
dba59b92-ab2b-43fc-b0cf-407e70a5a005	1021210822	Nậm Cuổi	5880	\N	22.160441	103.511706	\N	\N
e2c78468-045a-4118-ab79-ad5997ac51e5	1021210819	Nậm Cuổi 2	5880	\N	22.109579	103.487792	\N	\N
bac82c54-1b0e-4d59-96cd-133f7f905973	862280	Mỹ Đức	5984	\N	11.546944	107.518333	\N	\N
886fe590-82ab-4871-aea4-dff1a72f9d0d	430013	Phường Hòa Cường Nam	2403	\N	16.027778	108.22	\N	\N
38b966a4-0f80-425c-bbf5-88272a9c9890	1024244901	Kỳ Liên	4759	\N	18.015061	106.409736	\N	\N
d5642fef-ce0c-4aaf-bbe4-910fb8c6f425	703323	Hoài Đức	4140	\N	21.042956	105.699146	\N	\N
ce976aa8-b7eb-453d-ad30-e7dd8f7cce41	48870	Quy Nhơn	1050	\N	13.766666412353516	109.21666717529297	\N	\N
3df744f3-51b4-48b0-bfaa-5c9a0be185f5	1024244601	Cẩm Yên	4584	\N	18.315526	106.020908	\N	\N
d15bf8eb-a92a-4a45-a08d-33891c0ccf74	1023838514	Nam Động 2	10013	\N	20.347279	104.967217	\N	\N
e6fe196f-2efd-474e-8ea4-4657bfeb87da	1023838513	Nam Động 1	10013	\N	20.377686	104.948911	\N	\N
923bb47b-0be8-4856-bd55-f662e1f1d20f	695535	Nam Động	10013	\N	20.370278	104.935833	\N	\N
c34353af-d2f6-4992-915a-425feee113e6	1023838709	Trung Hạ	10037	\N	20.291998	105.072253	\N	\N
5694f50e-f57e-46ef-9093-fe03e7972390	1023838708	Trung Thượng	10038	\N	20.280221	104.977409	\N	\N
6f24182a-2222-4bda-8511-137a5e3f88df	1026261301	Đắk Lô	5537	\N	14.839639	108.376083	\N	\N
2b235451-f790-44dd-91d7-01c9e238c38c	1026261302	Pơ Ê	5538	\N	14.734778	108.49975	\N	\N
ee4fcef9-e1c7-44a2-83f2-b480b44811be	820010	Pờ Ê	5538	\N	14.7375	108.500278	\N	\N
b394c3b7-c84d-463d-8c9a-4d2b3f64851b	48861	Đắc Tô	5519	\N	14.649999618530273	107.83333587646484	\N	\N
901c2abb-0182-450d-ba2f-d75f8d70d98c	44082	Xuân Mai	3998	\N	20.898048	105.596962	\N	\N
68f1043b-8370-4d61-8822-45908f11dbff	516732	Miếu Môn	4002	\N	20.833056	105.670833	\N	\N
18eeafc5-47b0-405c-bb72-11d30a7b7073	920028	Tam Lộc	8053	\N	15.564842	108.367247	\N	\N
9b33f7ee-fb5d-4fef-a931-7af45a6e55e1	920009	Tam Lãnh	8054	\N	15.430278	108.408611	\N	\N
f8e120ff-6132-481b-b159-11e26ee0a977	813971	Quốc Oai - Đạ Tẻh	5986	\N	11.576667	107.505556	\N	\N
712ff8bb-7763-4a42-949a-df511cf203d1	750009	Lộc Tiến (Phú Lộc)	9175	\N	16.271944	107.990556	\N	\N
a61928ef-5ca5-413d-9859-99c733c733d0	750066	Đỉnh Bạch Mã (Phú Lộc)	9176	\N	16.199675	107.857476	\N	\N
fa36b2ea-ec29-450a-b496-6fedddb4e82b	750030	Vườn Quốc gia Bạch Mã (Phú Lộc)	9176	\N	16.22726	107.855796	\N	\N
15291122-9063-4d63-802c-7ce084253692	310247	Đức Long	4641	\N	18.495956	105.588236	\N	\N
69fb6a9f-b010-490f-934f-034f4ef02d9e	493521	Hòa Mạc	4491	\N	20.639154	105.990192	\N	\N
e072bc71-dace-4d97-8808-2a249e6e56da	1020606005	Cổ Linh	562	\N	22.557509	105.639266	\N	\N
1d78d638-1daf-4695-ae88-53c9511d80e7	1021412011	Chiềng Lao 2	8822	\N	21.654518	103.90371	\N	\N
9609e6bf-5d9d-447e-8d23-a544bba952d1	260136	Chiềng Lao (Mường La, Sơn La)	8822	\N	21.61722183227539	103.92916870117188	\N	\N
762011ae-fad5-4ea1-91b0-b8a5be502ecc	1021412003	Chiềng Lao 1	8822	\N	21.663684	103.857488	\N	\N
6145471d-bf61-40ba-841d-803ca2294a6d	1021412602	Bó Sinh 2	8893	\N	21.255434	103.479826	\N	\N
8e725c1c-cc79-44ae-913b-58f93e6b35d2	354933	Chi cục Thủy lợi	4674	\N	18.347719	105.886206	\N	\N
ec5bdb76-12bb-43f2-8f50-7b57e34ac4e5	176236	Mường Trai	8833	\N	21.546363	104.000569	\N	\N
cb88cd80-fdc5-4798-abc9-245be38a2f3c	1021412201	Bắc Phong 2	8835	\N	21.04	104.664722	\N	\N
239d6b61-35c3-44de-993a-92d0dcf9084e	1021412202	Đá Đỏ	8836	\N	21.096111	104.567778	\N	\N
b42ed40e-a571-4a0f-8ece-fd2ad608c533	968206	Hương Vĩnh	4697	\N	18.178859	105.680266	\N	\N
d665906d-67c2-4e02-8c2c-760ccc39c589	1024244403	Phúc Đồng	4698	\N	18.263359	105.647427	\N	\N
e60d87f0-71dc-45df-a456-2c1df3c67c7e	430017	Hồ Hòa Khê - Hòa Sơn	2420	\N	16.056389	108.1175	\N	\N
2aa6c80c-c7d7-461f-a8f3-829bf4dc2fd9	430005	Hòa Sơn	2420	\N	16.068333	108.106667	\N	\N
afb54baf-9dc6-434b-adc8-35bca26829fc	1024243903	Sơn Diệm	4707	\N	18.502583	105.375193	\N	\N
f8951121-603a-456d-a7a6-ea21946992f1	750061	Thủy điện Bình Điền (Hương Trà)	9125	\N	16.316389	107.501389	\N	\N
feb20c2b-7665-4014-ad45-3c504085e7f1	1024243911	Sơn An	4712	\N	18.545521	105.497945	\N	\N
ae51f9fb-28d4-4036-a5bb-353f326e2fa8	48865	Kom Tum	5561	\N	14.350000381469727	108	\N	\N
79819d31-2ee3-48e3-8adf-f97208b2edf1	982709	Con Cuông	6696	\N	19.052668986	104.87790998	\N	\N
573de0b3-f396-460a-8dad-4c95ed720666	774945	Bến Tắm	2837	\N	21.160324	106.438046	\N	\N
e34090d1-1937-4fc6-9815-d4725ddcea3d	232043	Sơn Trường	4731	\N	18.470968	105.438485	\N	\N
c2c6b0fb-6b06-4953-a2e7-2ec618a0e48a	1024243901	Sơn Trường	4731	\N	18.44593	105.443263	\N	\N
45b3cbd9-4ac2-4986-90d9-bfecfa65828e	1024244704	Kỳ Phú	4744	\N	18.189686	106.263378	\N	\N
139f4488-5aa9-485c-b68d-5a4a6e70fd51	076259	Thành phố Hòa Bình	4880	\N	20.816928	105.333818	\N	\N
9b6bec94-1a9a-4fdc-8943-fd3afb9afd7b	1021714801	Dân Chủ	4877	\N	20.792222	105.352222	\N	\N
71126830-1ef7-485a-95d3-fd64b25b840c	325951	Phúc Yên	10882	\N	21.229997	105.708516	\N	\N
e9222553-d9c0-4436-963d-33b7976b2e50	1024244201	Cương Gián	4781	\N	18.57051	105.833131	\N	\N
7a9e9c8a-b59e-43eb-8daa-532fbae1138f	272169	Quế Võ	636	\N	21.154475	106.152009	\N	\N
b94a90ec-5a38-4e76-8963-1173d98128df	01204995	Thai Binh - So NN va PTNT	9378	\N	20.451398849487305	106.34713745117188	\N	\N
818ee4ea-1e09-43b8-8278-90ab34d854e9	990458	Bến Châu	8376	\N	21.122454	106.601149	\N	\N
7302b12e-606d-4614-8f20-32388f92eaf3	1024244501	Bắc Sơn	4826	\N	18.342129	105.840859	\N	\N
519a52bc-a57c-4833-8ac7-779afc1be823	678628	Tà Lương (A Lưới)	9072	\N	16.301111	107.335833	\N	\N
2ed86cf2-6adc-4ac8-993e-6e67ce89e884	750062	Hồng Thái (A Lưới)	9076	\N	16.23981	107.24161	\N	\N
75d65632-3623-4ce1-aff8-776efe9197a4	750005	Hồng Vân (A Lưới)	9079	\N	16.361944	107.124722	\N	\N
2139d3c2-c06b-428b-bc2d-f04c9f3432cb	482414	Đức Bồng	4831	\N	18.422681	105.544927	\N	\N
58e5e6d7-862a-451b-8a9c-5503c9b5dbf8	1024244103	Đức Giang	4832	\N	18.450969	105.540645	\N	\N
c5f88ba9-7a18-49af-8704-1f9331706330	1024244102	Đức Hương	4833	\N	18.401439	105.567075	\N	\N
89e4e50a-7b01-4f2a-b9b0-b72f2037fae5	1021715403	Xuân Phong 1	4845	\N	20.705833	105.353056	\N	\N
af756ebc-0818-4caa-b590-9039c827b547	64767	Bình Gia	5617	\N	21.959388	106.367158	\N	\N
5bcc1340-a745-4e88-822c-6b07df0f253f	076217	Nam Phong	4847	\N	20.664929	105.30952	\N	\N
437a7dce-4d0a-49dc-bd00-81338c23503b	730006	Hồ Thác Chuối	7760	\N	17.437924	106.461041	\N	\N
a69116b0-3d92-41f5-8ee9-804ed5aee2bc	341801	Troóc	7762	\N	17.64866	106.27075	\N	\N
9ddd2efa-5d3d-47c0-b2d1-26b70a88d56d	361415	Sơn Trạch	7764	\N	17.611111	106.305278	\N	\N
73c91e6f-2b4d-4579-a041-c0b7d552f3ba	092994	Vạn Trạch	7770	\N	17.616207	106.4534	\N	\N
f661fbde-3c8a-4ed4-a335-9c71af43fbc5	730019	Xuân Trạch	7771	\N	17.663538	106.252028	\N	\N
e2d38d0e-5144-4e70-b836-7cf4794eee1e	730020	Quảng Minh	7777	\N	17.715716	106.380848	\N	\N
a41b3834-398f-4628-bd0c-20263eb7819e	1021715404	Xuân Phong 2	4848	\N	20.678056	105.337222	\N	\N
2c771367-d5bb-46f1-80cb-89fe6f1f0e69	678451	Hồ Cạn Thượng	4848	\N	20.675	105.357778	\N	\N
e342f440-8fac-4c76-833f-e1d4682c8793	009087	Xuân Phong	4852	\N	20.70152	105.370314	\N	\N
4abd3f0f-1e36-46e2-8615-9139a9807f09	1021715405	Yên Lập	4853	\N	20.641389	105.350278	\N	\N
8bb6dbbe-a01d-4a6b-a56a-84124a8a2b06	1021715406	Yên Thượng	4854	\N	20.620278	105.368611	\N	\N
3ff0ce9c-a339-40a3-8394-45b5039f1b2d	1021715004	Đồng Ruộng	4858	\N	20.896111	104.9975	\N	\N
494317bb-bb13-4e9e-8e82-27e42a1e366f	139832	Tu Lý	4859	\N	20.875138	105.258495	\N	\N
b29979c1-35ef-47f7-875c-052045873b17	1021715008	Tân Pheo (Giáp Đắc)	4861	\N	21.016667	104.971111	\N	\N
ef50add2-0110-4858-b605-fec9f61687f6	72403	Mường Chiềng	4864	\N	21.01153	104.960081	\N	\N
3bbb5816-1918-4089-9865-0552a7f468a0	1021715006	Mường Tuổng	4865	\N	21.005556	104.902222	\N	\N
70084c32-5e7f-47fc-aa97-ccaf352f56df	1021715001	Cao Sơn (Hào Lý)	4872	\N	20.899722	105.260556	\N	\N
1fdc0e44-72c2-4948-84e2-c1fa62954d23	1021715012	Vầy Nưa	4873	\N	20.815278	105.216944	\N	\N
6b5121c9-ffaa-4d74-a276-d9104dcd17ee	1021715010	Tiền Phong 3 (Yên Hòa)	4874	\N	20.859167	105.037778	\N	\N
387249b3-762a-4d90-9a53-93928a00e3a7	1021714808	Thái Thịnh	4887	\N	20.815833	105.310556	\N	\N
2c0352d3-7740-4651-9e61-b617df82975b	965118	Kà Tum	9035	\N	11.668307	106.218451	\N	\N
d4aa4def-6e9c-4020-90b7-f04388ef8e85	469503	Đèo Hạ My	359	\N	21.226389	106.89	\N	\N
f6de55c2-8977-4520-9372-2194ddc651fb	469032	Tây Yên Tử	363	\N	21.208333	106.805556	\N	\N
f97adeec-b4c9-460a-a955-305a62c99bde	442191	Đan Hội	296	\N	21.182531	106.336741	\N	\N
6ef28b72-f73d-4ddb-af01-17e2ad5ab893	730005	Hồ Bẹ	7890	\N	17.823738	106.193009	\N	\N
7396714f-e6cc-4a04-91b0-cbc2e48a48b3	1021715203	Cư Yên	4975	\N	20.852222	105.557222	\N	\N
0e74e10e-c8f3-4277-8947-1a0a43547c27	650664	Vĩnh Đồng	4906	\N	20.687222	105.524444	\N	\N
15652dd2-d6b9-42d6-9f3e-fa66ed8d4587	1020606602	Vũ Loan 2	545	\N	22.304689	106.172245	\N	\N
e54cefbe-4e95-4bb6-b198-f9963cb375eb	276051	Vũ Loan	545	\N	22.30877	106.166353	\N	\N
e96a58bb-d92f-4b4d-bb51-5ff7410c3c14	392495	Bằng Vân	548	\N	22.478611	106.056667	\N	\N
da016fa6-de13-49c1-858c-dbd31ec67bce	288537	Cốc Đán	549	\N	22.497823	105.973147	\N	\N
5397f122-7310-411c-a7a1-99f1cb143196	1021715301	Bình Sơn 2	4901	\N	20.761667	105.473056	\N	\N
df25d7c0-330e-4d0f-8b19-9658da9c4548	1021715302	Đông Bắc	4904	\N	20.720833	105.472222	\N	\N
fdfbbbcd-65ad-467a-837c-64fd19babf9f	1021715309	Thượng Tiến 1	4907	\N	20.684722	105.479167	\N	\N
0efc03e8-d01c-4a5a-9fad-f9717bb3616c	1021715303	Kim Bình	4910	\N	20.665556	105.535	\N	\N
5bfa27c6-25a8-4801-a387-03554e4beaa4	650006	Thới Hưng	1450	\N	10.122348	105.526016	\N	\N
c64aea0f-8b18-49f7-a75c-3d6d1f7e6984	1021412210	Tân Lang	8855	\N	21.291667	104.809167	\N	\N
785b6a1e-6a49-4ad6-a45a-a93bb043abf2	260010	Tân Lang	8855	\N	21.268056	104.784722	\N	\N
00ee2f92-0663-4cac-81f6-4c04fe0061d2	1021715304	Kim Sơn 1	4912	\N	20.671111	105.583333	\N	\N
c3eeff94-469d-4cea-b136-5dd5755a8d7f	009154	Kim Tiến	4913	\N	20.66	105.521667	\N	\N
2c87828e-2257-4f6f-ba0a-266f8ddbd88a	1021715306	Lập Chiêng	4915	\N	20.691667	105.559444	\N	\N
88352d81-dc48-4939-a1df-b481acd32d5d	376819	Phấn Mễ	9616	\N	21.688333	105.728889	\N	\N
27c73cf7-cb62-4fb6-8704-d142cba77c7d	907769	Bình Sơn	9627	\N	21.508333	105.806944	\N	\N
8d2735d6-3e44-4841-a310-30371acaffd0	691062	Mường Lý	9857	\N	20.535815	104.756938	\N	\N
b18dac5f-6755-4def-979e-12d6f0dc7e3d	1023838405	Quang Chiểu 3	9860	\N	20.48607	104.44594	\N	\N
c9b3f308-fbbf-4a51-baa2-3539cb4dcef1	1023838403	Quang Chiểu 1	9860	\N	20.49774	104.477978	\N	\N
7b04ccb7-76f9-46b7-9343-2d04589d0e19	1023838402	Quang Chiểu 2	9860	\N	20.462528	104.457689	\N	\N
ecbff29b-a922-40f3-9b8f-63d8c95b5ea5	217912	Tam Trung	9861	\N	20.53758	104.602318	\N	\N
190f0d34-fca7-4093-8244-21fc726e3e66	1021715703	Bình Hẻm	4931	\N	20.496667	105.529167	\N	\N
9ebea94b-7596-4bc1-9850-94196660f7bd	1021715704	Chí Đạo	4932	\N	20.455833	105.388056	\N	\N
7b851a0e-19e3-4ce7-946d-91c67f66a568	653380	Thủy điện Định Cư	4934	\N	20.461925	105.41955	\N	\N
4254a817-0d81-491a-935f-b8c27b838e99	1021715706	Miền Đồi (Quý Hòa)	4938	\N	20.565833	105.416111	\N	\N
fb5f9a71-97d6-42b8-9d1d-b5ff5cc904fc	677832	Thủy điện Miền Đồi	4938	\N	20.56	105.416389	\N	\N
3ce63b8c-e252-4a75-8521-7da7f44f8f3a	1021715707	Ngọc Lâu	4939	\N	20.422222	105.402222	\N	\N
5217e177-488f-4e18-b77a-d97a4e014e47	1021715708	Ngọc Sơn	4940	\N	20.436667	105.375833	\N	\N
53a214e7-5e69-48e3-82a3-7c27c733a539	076240	BQL Ngọc Sơn	4940	\N	20.437498	105.377576	\N	\N
54a703ad-bb53-4d48-a3de-2e2b5606b270	092997	Quý Hòa	4944	\N	20.575222	105.457889	\N	\N
142e1ae2-7729-47fe-a383-6a7e98fcd8c1	1021715709	Tân Lập	4946	\N	20.539444	105.438056	\N	\N
8d45f452-e0df-49f9-9530-8c12e1817e44	1021715702	Bình Cảng	4953	\N	20.443611	105.486944	\N	\N
db15abcd-6007-403f-92d3-f1e70775136c	1020404704	Đình Phong 1	1808	\N	22.8800776	106.5982928	\N	\N
cbd9ad81-0dd4-4949-885c-33f68e041afe	996206	Đồi	9039	\N	11.594579	106.405604	\N	\N
4a58dd08-cba1-4f73-a3be-feb2fbe28851	009075	Thanh Hà	4969	\N	20.591556	105.688944	\N	\N
362f01fb-f480-4049-8dde-8cb25696c000	1021715907	Yên Bồng	4971	\N	20.459444	105.777778	\N	\N
46510b69-6a15-4efb-baef-9537e9ede85d	1021715201	Cao Dương	4976	\N	20.716111	105.626667	\N	\N
58e565d9-e599-4db7-87da-f2df81c8a3fb	1021715605	Hang Kia	4997	\N	20.743889	104.888611	\N	\N
5cbfd781-48ba-4381-aea0-80662a97786a	1021715204	Hòa Sơn	4979	\N	20.9	105.553611	\N	\N
4736ce86-7f40-46b5-9cf8-0e8cd8c35d3d	1021715205	Hợp Thanh	4982	\N	20.675	105.648889	\N	\N
78aeee89-976e-4a29-9ed3-f8cf922195f9	664538	Thanh Lương	4988	\N	20.651944	105.657778	\N	\N
28af954b-dbec-4fce-887a-88c7ea9515a1	003423	Tiến Sơn	4989	\N	20.781389	105.617139	\N	\N
cd9b66a7-784c-4c8b-815d-8bf7aa74b9cd	076234	Ba Khan	4992	\N	20.716646	105.114509	\N	\N
fee7b21c-c5ae-491d-8743-09fa05c68b55	583017	Bao La	4993	\N	20.671067	104.956966	\N	\N
6b2804f4-4021-4852-81c1-ca694c0efbd3	1021715602	Cun Pheo	4995	\N	20.693333	104.918611	\N	\N
6ed91276-a105-4f80-b44a-be25fcaae86d	1026463501	Chư Mố 2	2702	\N	13.444167	108.471111	\N	\N
ac1a72d9-2c74-4c9b-b25a-45155ccd137b	641153	Chư Mố	2702	\N	13.4375	108.469167	\N	\N
d8122cb0-285a-4526-bccd-b03d254eb4a5	1026463502	Chư Mố 3	2702	\N	13.430556	108.465556	\N	\N
3124ee46-7952-47ae-95fc-5b788b1f9979	1026463503	Chư Răng	2703	\N	13.583611	108.431944	\N	\N
32b5071e-a1e9-4af1-8e29-9e0947057d89	684706	Ia Broãi	2704	\N	13.393889	108.465556	\N	\N
c305352f-7dcb-40c5-8742-702b3129b808	1021715604	Đồng Bảng (Tân Mai)	4996	\N	20.711389	105.031944	\N	\N
82071321-40a5-4766-8dd1-5d8cf93f47aa	009156	Đồng Bảng	4996	\N	20.715639	105.059972	\N	\N
58cc2722-a415-4871-b7d1-e84d4a91d459	1021715608	Pù Pin 2	5003	\N	20.624722	105.118889	\N	\N
62b29457-8360-4da5-b4fd-7c02da8e9c66	1021715607	Pà Cò	5004	\N	20.754722	104.894167	\N	\N
132c918c-1451-42e5-add4-235682086e8d	665485	Thủy điện So Lo 1	5005	\N	20.741667	105.020833	\N	\N
0d5f0bb7-00eb-439d-9cd5-91f0562bf653	1021715609	Săm Khóe	5008	\N	20.643056	104.984444	\N	\N
4f86baa3-96b6-4ca8-b3f0-34bd177969a3	1021715611	Tân Dân 2	5009	\N	20.792778	105.092778	\N	\N
eaabe7ac-41a8-470c-9c66-62abbeb88d9b	1021715612	Tòng Đậu	5013	\N	20.700556	105.077778	\N	\N
85c2b01c-c41b-42c4-9627-68d89c5c9be7	1021715503	Lũng Vân	5015	\N	20.582222	105.144444	\N	\N
16582ed6-8c1b-4b49-aec0-b2e09b8eb37c	1021715506	Phong Phú	5016	\N	20.608611	105.222222	\N	\N
7e6e4a34-4503-40f8-9203-d5518a0759a2	1021715501	Do Nhân	5017	\N	20.55	105.251111	\N	\N
fcd9bc9c-66ac-4b0a-bc95-9acf617cc1a3	549927	Hồ Am Chúa, Lưu vực	5245	\N	12.320833	109.101389	\N	\N
dc67de16-f1a6-4d20-b594-9b10d0abec3f	944957	Hồ Am Chúa, Đập đầu mối	5245	\N	12.30956	109.09691	\N	\N
3371c6c2-73bd-40f6-a362-52af843dc923	076214	Lũng Vân	5021	\N	20.561161	105.179281	\N	\N
8dba6d56-a3f7-48c2-88a3-cfa999cf0451	637176	Tân Lạc	5024	\N	20.612101	105.28077	\N	\N
16ffeaef-1fdb-428c-83f2-fa81d0292f2b	003425	Mường Khến	5024	\N	20.620522	105.274472	\N	\N
16445a1e-b5c5-4bfe-a3fe-d098694e8138	1021715508	Phú Vinh	5031	\N	20.686111	105.178889	\N	\N
e4e7f21a-9de1-45e0-a6b9-1dd95286eae5	1021715510	Tuân Lộ	5033	\N	20.577222	105.228611	\N	\N
507f92f3-c4ca-4e64-a0a3-c53483b9831e	159846	Lộc Ninh	1283	\N	11.849722	106.583333	\N	\N
f9b77cef-3574-4475-9b92-83d100504116	525006	Thanh Trì	4421	\N	20.948131	105.845169	\N	\N
c2ed8829-88cf-44b2-8ff8-84158361f2ad	1021715802	Bảo Hiệu	5039	\N	20.4475	105.635833	\N	\N
0b159ea5-6659-43a7-83a3-bc283f31ba2b	1021715803	Đa Phúc	5040	\N	20.435556	105.583056	\N	\N
85a6a223-2625-4e04-83c3-eafdef6a43b5	1021715804	Hữu Lợi	5042	\N	20.411944	105.658889	\N	\N
2f24bf05-e018-4709-a7ba-7a4aa19460f8	257376	Yên Thuỷ	5043	\N	20.394246	105.620485	\N	\N
2a2a3b7d-8250-4c99-9cc3-06901aee6dcb	053995	Lạc Lương	5045	\N	20.474824	105.613899	\N	\N
67ca1c35-0a0c-4821-8fd9-812ffc53b8f3	1021715806	Yên Trị (Phú Lai)	5049	\N	20.372778	105.643333	\N	\N
2cbe8356-b204-4fd2-8d0b-9349128bf51b	66770	Vị Thanh	3347	\N	9.7667	105.45	\N	\N
5a689b0b-29c4-4e29-a04e-da1d7acdd349	677126	Yên Trị	5051	\N	20.359167	105.664167	\N	\N
6943bdec-2a2b-4d23-bcb9-d900d130451b	708434	Ân Thi	5052	\N	20.813587	106.088811	\N	\N
ff546c08-0041-4734-932c-4caac32ad1fb	820007	Đăk La	5509	\N	14.448056	107.953056	\N	\N
59678552-c6bb-4648-83b7-97b1c14e6910	1021210913	Hoang Thèn	5857	\N	22.597629	103.325468	\N	\N
445dab04-c068-43b1-982a-85d4a37e534d	1021210912	Hoang Thèn 1	5857	\N	22.556111	103.329444	\N	\N
13c8f75b-ca73-4855-9672-e5e95bdd4d50	1021110204	Ẳng Cang 1	2496	\N	21.473563	103.208058	\N	\N
38634cc6-b7cc-42ac-91f4-1dd5404f2c80	1021110205	Ẳng Cang 2	2496	\N	21.497521	103.274059	\N	\N
21c6e67a-b9f0-4ebe-848c-8f23af93dcf5	1021110203	Ẳng Nưa	2497	\N	21.504213	103.198647	\N	\N
ed6a4e41-928c-4cb1-b964-07c08d78ff6e	301248	Khoái Châu	5090	\N	20.840403	105.969066	\N	\N
a7119f76-24a4-4bec-9595-91e2955cf65d	040826	Thuận Thành	669	\N	21.06469	106.082963	\N	\N
eeb7904f-693b-4344-8fa5-bf70ed539458	00206BBF	Hai Phong - Cat Hai - Hat Cat Hai	3098	\N	20.79831314086914	106.89344787597656	\N	\N
1a082650-8315-4616-a8b8-218776fe2766	481046	Cấm Sơn	5701	\N	21.554352	106.466807	\N	\N
bedae359-d872-4674-af3e-c5509334507f	644975	Đăk Ha, Đăk G'Long	2044	\N	12.081944	107.785556	\N	\N
aa986edb-60b3-4d4d-b636-5278d1af4f61	1026766101	Đắk Ha	2044	\N	12.081944	107.785278	\N	\N
bc86c81e-080d-496e-bd6f-509e69c8c7a9	014626	Đức An, Đắk Song	2046	\N	12.071194	107.911889	\N	\N
dfd4919a-73ca-4648-bf68-8639ffba9454	480002	Đắk Som, Đăk G'Long	2047	\N	11.874722	107.925833	\N	\N
3e48a7c7-41a0-4c6a-9006-85161fee9a0d	480001	Quảng Hòa, Đắk G'Long	2048	\N	12.180278	108.105833	\N	\N
a5a4f56f-deb9-425e-bad1-ad6919056527	20761	Văn Giang	5183	\N	20.939014	106.002423	\N	\N
7034ca39-9957-4359-aa49-de83763c5dbd	1022018801	Ái Quốc	5727	\N	21.5225149	106.8972785	\N	\N
493cafed-5a28-4c5d-a63e-eaa99bbc458c	1022018301	Mẫu Sơn	5731	\N	21.7854273	106.9358163	\N	\N
a147cf65-1c42-4f0a-9dbc-462ad9d6883c	1022018803	Lợi Bác 4	5736	\N	21.6705754	106.9819092	\N	\N
e820621f-795f-4cb1-96c0-8bd1624d5101	1022018802	Lợi Bác 2	5736	\N	21.6642259	106.9844198	\N	\N
a71fde51-9851-4f4d-b772-6e5f32c5e819	1022018804	Minh Hiệp	5739	\N	21.6955205	106.8432203	\N	\N
0b2679e1-087c-4260-99bf-2a7bd9665638	1022018805	Nam Quan	5741	\N	21.6435538	106.8957451	\N	\N
c45a4cc7-5108-417e-98dd-2c9a771860f9	1022018806	Sàn Viên 1	5745	\N	21.7066309	106.9970076	\N	\N
80d526d1-e81e-4d03-8e99-f90a59cb629f	1022018807	Tam Gia	5746	\N	21.7281722	107.1172505	\N	\N
7a37a379-ed39-4af0-9120-c08db9788312	547910	Hồ Đá Đen, lưu vực	5349	\N	12.687778	109.123889	\N	\N
74f4674e-47cc-4dea-9bad-3a13552109c0	902907	Hồ Đá Đen, Đập đầu mối	5349	\N	12.68145	109.1372	\N	\N
dd52adc8-9e9b-4081-987d-23d80515ae3d	260105	Nậm Khăn (Nậm Pồ, Điện Biên)	2531	\N	22.003889083862305	102.899169921875	\N	\N
ad7d5be9-09a9-497b-a297-c1fa035d46a3	680004	Thuận Hòa	5366	\N	9.781087	104.936837	\N	\N
7200f148-c7ff-4120-97ec-2514c0fbe7c4	890494	Giồng Riềng	5394	\N	9.940278	105.341111	\N	\N
03237799-53a3-49be-9b93-12d37f134158	655853	Hương Mỹ	5406	\N	9.729291	105.274037	\N	\N
128e8c6c-328e-4098-9659-97ed19cf6257	470030	Hòa Khánh	1833	\N	12.6303	107.97658	\N	\N
91b7fab5-47b5-44af-9341-eb5c09ddb5ec	720008	Hồ Châu Pha	910	\N	10.64005	107.124004	\N	\N
c8a22b3f-208c-450e-8f91-9b717ea2139f	680005	Lại Sơn	5438	\N	9.799521	104.630676	\N	\N
a919d464-a138-42df-a779-34beeaaacd31	340310	Xã Cát Tân	1017	\N	13.982472	109.061667	\N	\N
243701a4-9525-4768-a6c6-ba37cd396e19	1021110004	Pa Thơm	2462	\N	21.30205	102.9031	\N	\N
b080d0ff-d194-43f1-8614-5e7e92873f7b	228867	Pa Thơm	2462	\N	21.31046	102.91925	\N	\N
ba3b75f7-67ab-4dfc-90e3-37375348ae16	64471	Vĩnh Thuận	5488	\N	9.556111	105.306667	\N	\N
5b946d21-3c6a-4744-a04d-2d21f825f893	1021109603	Quảng Lâm	2524	\N	22.05596	102.632206	\N	\N
32d7fa6b-8b86-4bbd-b5ef-c0fef8bd4639	260108	Sen Thượng (Mường Nhé, Điện Biên)	2525	\N	22.38194465637207	102.33333587646484	\N	\N
b9b4edd2-9025-4a6d-bebe-366b520362d9	260109	A Pa Chải (Mường Nhé, Điện Biên)	2526	\N	22.418611526489258	102.18222045898438	\N	\N
7639fdee-e311-4950-b8ce-99b91b018252	334729	Sín Thầu	2526	\N	22.37783	102.25362	\N	\N
6c109f8b-2a51-49d9-9be1-6a56b7162ba7	1021110302	Chà Cang 2	2527	\N	21.991636	102.845435	\N	\N
92b168fe-eb03-4054-ae30-dcf400f7cb0c	993501	Mường Trà (Chà)	2527	\N	21.969234	102.865665	\N	\N
0c8aff4b-e724-4702-abd6-d3b0505ca8d7	260104	Chà Nưa (Nậm Pồ, Điện Biên)	2528	\N	21.909740447998047	102.89716339111328	\N	\N
b2ccaaad-0ca2-41f5-a146-29e8fa5831e4	260103	Chà Tở (Nậm Pồ, Điện Biên)	2529	\N	21.975406646728516	102.9012222290039	\N	\N
d01e48f8-d46c-4de2-a0c6-0ddfe4a4dfb0	1022018603	Quyết Thắng	5708	\N	21.6331216	106.2218416	\N	\N
653dba16-5d0d-4e9b-917f-27f537448bb8	1022018505	Tân Lập	5713	\N	21.5788472	106.1935924	\N	\N
6d301380-3149-4edf-a043-f479c749fe8f	355132	Khánh Nam	5274	\N	12.296512	108.887591	\N	\N
0efd8128-bef7-4849-888a-c013542c4c5f	459202	Lộc Bình	5735	\N	21.764285	106.917183	\N	\N
07901e8a-133a-473d-9afa-7644c2c6279d	789789	Than Na Dương	5740	\N	21.687775	106.967955	\N	\N
634ff012-8b33-409c-b0a7-5a56a6c023b6	652713	Điềm He	5816	\N	21.891119	106.600824	\N	\N
ee4e45f4-5b67-4ee8-8083-2dbf38489b06	1022018402	Liên Hội	5817	\N	21.9257503	106.5557471	\N	\N
a00730fd-6048-4187-94a8-938164eabdcb	4811	Pac Ma	5835	\N	22.385637	102.805032	\N	\N
35172118-b7b8-4aab-a390-a2c744b4b865	1021210714	Mường Tè	5835	\N	22.383041	102.817673	\N	\N
f96f5636-0a8e-4c19-b4c5-1b78c0dfcbac	1021211210	Lê Lợi	5845	\N	22.093232	103.153994	\N	\N
c4ca2d00-3b5e-43ab-abcc-4ce45e2a5feb	1024041801	Thạch Giám	7072	\N	19.259382	104.495583	\N	\N
506f61c9-4073-4e91-82a9-df91a7a24d82	1021210608	Bản Giang	5896	\N	22.323056	103.523611	\N	\N
c9729da8-4cc9-4f69-935d-2247ce609f1e	1021210603	Hồ Thầu	5900	\N	22.366944	103.573611	\N	\N
7c7e349b-817c-437f-91cd-ae8139252551	873552	Hồ Thầu	5900	\N	22.36793	103.57495	\N	\N
33267716-b4fa-4fa2-a323-d104a5c4d947	1021210606	Nà Tăm	5902	\N	22.271111	103.660278	\N	\N
2846e1ba-769c-4565-aa7a-d1755ef54a05	1021210605	Nùng Nàng	5903	\N	22.368333	103.451944	\N	\N
693ff3e8-2164-405e-863a-252369f9ba7e	930009	Lộc Thạnh	1287	\N	11.900567	106.595461	\N	\N
137a36f0-5c7b-4bc3-9048-62a1c61ec55d	877624	Thân Thuộc	5917	\N	22.16562	103.74002	\N	\N
669821cf-3e7f-4a6c-b7f8-0cc0bad87345	490010	Đức Phổ - Cát Tiên	5958	\N	11.556113	107.348454	\N	\N
ba5190ea-7973-4cce-9347-eeac0af77df9	490043	Gia Viễn - Cát Tiên	5959	\N	11.631111	107.373611	\N	\N
3e9742a5-591d-444e-9188-2497628a49c9	490011	Quảng Ngãi - Cát Tiên	5964	\N	11.53278	107.377995	\N	\N
1690926b-fe24-48da-9eb6-8e72ddb40291	1026868102	Đoàn Kết	5972	\N	11.348441	107.660202	\N	\N
02ffb304-4fbc-4c4b-99ed-92cfc05319c4	802178	Thị trấn Ma Đa Gui - Đạ Huoai	5974	\N	11.386389	107.529722	\N	\N
0715a806-42bf-4b87-b859-a00a4d6c1fb6	490037	Đông Thanh - Lâm Hà	6065	\N	11.833611	108.366389	\N	\N
bae58597-ba88-47ac-ba60-33c57c775522	680782	Đập, Thủy điện Ia Grai 2	2696	\N	13.97619	107.689	\N	\N
9dd813de-cac6-42b7-b694-5c55c894f0fb	860025	Phan Điền	1318	\N	11.28403	108.50254	\N	\N
878fd65c-150f-4a6b-b195-f75ac7f989b4	392337	Cần Đước	6257	\N	10.500833	106.603611	\N	\N
1798d02c-7073-4b47-bc37-315ba3c2fdfe	180005	Quất Lâm	6455	\N	20.199821	106.373806	\N	\N
f84d21cf-cf95-4c8b-8b8b-d221944daa9a	1020404308	Phan Thanh	1635	\N	22.8816661	105.7300256	\N	\N
39149512-7fc5-4c48-be8c-5dc44dc218de	1020405105	Bạch Đằng 3	1698	\N	22.5993429	106.1748968	\N	\N
50ef6f9d-357e-41c4-8a88-c7ca13dda96c	1020405101	Bế Triều (Nước Hai)	1699	\N	22.7167963	106.1772353	\N	\N
86c65e29-6799-48f6-90dd-f4a7e2168172	1020405205	Tam Kim	1730	\N	22.6114449	106.0143868	\N	\N
8067cf07-3a9b-44b8-972c-551c12ade693	110019	Tam Kim	1730	\N	22.604444	106.0175	\N	\N
ad02c407-72b5-4f24-988b-2cd1accaeaea	001905	Nâm N’Jang, Đắk Song	2040	\N	12.188738	107.586953	\N	\N
8c429c63-8b8e-4da5-b90a-b45135ac3b5b	091960	Khu bảo tồn Nâm Nung, Nâm N’Jang	2040	\N	12.200556	107.635556	\N	\N
44325ed4-69c9-4feb-ac2c-56280e127ea8	074781	Đăk N'Drung, Đắk Song	2041	\N	12.302972	107.533167	\N	\N
8537fa92-1d89-488c-9d15-8b5159d48859	643529	Thuận Hà, Đắk Song	2042	\N	12.243333	107.533333	\N	\N
e9cce427-5e38-4d4d-b693-ef11359166e1	321497	Quảng Uyên	1761	\N	22.693148	106.441773	\N	\N
dc33ac28-090a-461b-a7d1-79f1d6438ce0	1020405103	Quang Trung	1716	\N	22.6612321	106.3024964	\N	\N
9026290f-475f-4178-a816-5d5c6cae234e	850905	Trương Lương	1717	\N	22.722222	106.060278	\N	\N
f60e0157-17fb-4e2e-b676-ba10747a30b5	1020405104	Nguyễn Huệ	1718	\N	22.6962634	106.3318403	\N	\N
ddc5ea71-ff26-4cd2-b5e4-20db35f62a5b	134604	Tân Trụ	6399	\N	10.520556	106.520278	\N	\N
c533c6b9-0e8c-4cd0-bad5-010f8c35daa9	43546	Xuân Thuỷ	6454	\N	20.291159	106.436218	\N	\N
64b648f8-61c7-4c88-ad18-37d18931f652	014513	Kiến Thành, Đăk R'lấp	2075	\N	12.041833	107.490611	\N	\N
906e3246-988b-4055-84a0-44e6cc730345	1026766702	Quảng Tân	2075	\N	12.041667	107.490556	\N	\N
cb7a5ce7-3a86-4c07-a14d-0e1915ce0d1d	375932	Vĩnh Hoà Hưng	5410	\N	9.743182	105.390997	\N	\N
e7329afb-b5f5-4bf2-b75f-1e7edb66ea37	507343	Đảo Hòn Đốc	5420	\N	10.316389	104.330556	\N	\N
583f4233-de85-47df-be44-be1fcc813a13	470001	Ea H'Leo	1879	\N	13.354169	108.156584	\N	\N
9abe9013-be25-443f-8c5e-22aef66dd163	470002	Ya Tờ Mốt	1912	\N	13.119167	107.825556	\N	\N
843eea59-12f0-4a2c-9431-1957bcd90e4e	014698	Bình Hòa	1914	\N	12.457722	108.025528	\N	\N
90d9aee8-7671-46aa-a43c-4f19bbb14ac8	014701	Nâm N'Đir, Krông Nô	2066	\N	12.391417	107.881722	\N	\N
3755e13f-b8e7-46da-94aa-71e2d09f2d56	890097	Nâm Nung	2067	\N	12.394404	107.838788	\N	\N
ddbf01b4-ad50-4394-b3aa-4ac1a934aa04	239790	Nam Xuân, Krông Nô	2068	\N	12.489785	107.811404	\N	\N
8b666823-537e-42c5-8787-3886b19bb782	480007	Tân Thành, Krông Nô	2070	\N	12.431667	107.813611	\N	\N
813f3072-453a-4163-be26-10e6fffe1371	1026766701	Đắk Buk So	2071	\N	12.200869	107.519574	\N	\N
5a4ab2d9-6b6f-4910-b8df-0d37da4a13b6	001753	Đăk Buk So, Tuy Đức	2071	\N	12.211052	107.465974	\N	\N
cf80281f-adbe-4770-bd91-0a950ce33276	001211	Đăk Ngo, Tuy Đức	2072	\N	12.009549	107.369882	\N	\N
4ed62c14-9a9b-4dc1-a543-0865e0364034	480009	Đăk Wer, Đăk R'lấp	2073	\N	12.089722	107.494167	\N	\N
ab153b70-6e3f-4851-a52e-5e4a015080d5	180007	Đồng Sơn	6528	\N	20.29391	106.167255	\N	\N
01cde972-51e7-4aa3-b1b3-a8315aadccd7	792845	Vụ Bản	6596	\N	20.333338	106.078124	\N	\N
b5277a14-debf-4065-94e6-bc77675d8433	180008	Nam Toàn	6544	\N	20.388615	106.199779	\N	\N
8aab89f3-38ec-4793-9e30-b0f03dc5e23f	771429	Liễu Đề	6548	\N	20.220808	106.180945	\N	\N
f1835e13-d6bf-434a-ab6b-510e93bfa2f0	180006	Trực Đạo	6579	\N	20.264454	106.255152	\N	\N
190da17d-fbd1-4c0e-8baa-dbece7c0d627	197706	Đăk Lua	2176	\N	11.547515	107.35525	\N	\N
c0b4fdbc-cac0-4a6d-b646-1fc3a6436f25	806374	Đồng Giao	7243	\N	20.156265	105.91757	\N	\N
7122b09f-8708-4e32-9df5-b399d124af1e	940002	Cầu số 2	205	\N	9.277605	105.583835	\N	\N
626d9842-8891-4ac0-b4a2-9e6eaa994e9e	850004	Phước Trung	7296	\N	11.710414	108.937754	\N	\N
bc9e6c1b-1834-4b28-84b2-3abffea59288	180001	Đại An	6594	\N	20.395512	106.119031	\N	\N
ad13bb7c-8403-4293-81c9-10dcfe45e059	180002	Cộng Hòa	6593	\N	20.383296	106.070882	\N	\N
2cedc8e1-005f-411e-8a33-c562e57ddfab	730018	Hóa Sơn	7820	\N	17.761111	105.884167	\N	\N
20885fa7-bf04-4908-8787-d043722f5efe	1021109904	Chiềng Sinh	2558	\N	21.545735	103.372028	\N	\N
6c660371-a8f7-4be7-8308-1034c0c9d0ec	1021110104	Keo Lôm 2	2476	\N	21.260217	103.165547	\N	\N
9af69d43-ac21-4f59-8b02-77af58266f66	1021110116	Phì Nhừ 4	2476	\N	21.268438	103.238066	\N	\N
64a9cbf1-893e-4a01-be91-fe12057fda5f	1021110109	Mường Luân 2	2478	\N	21.252222	103.349444	\N	\N
f230c97b-d368-4860-97db-08fbb8cf480d	1021110106	Háng Lìa 2	2478	\N	21.208285	103.340359	\N	\N
e944aabc-8fc6-4fcc-b0a5-d0c511897cd2	1021110110	Mường Luân 3	2478	\N	21.238333	103.320556	\N	\N
0681a045-8dcf-47c4-ade7-987022a9c55b	1021210910	Huổi Luông	5858	\N	22.549722	103.192222	\N	\N
16564cde-8f7d-4c6d-be9a-a39039c16b03	1021210907	Khổng Lào 1	5859	\N	22.536737	103.355313	\N	\N
c552334e-e4ab-46d2-a0de-0f7362a20dfb	270004	Mùn Chung	2562	\N	21.751667	103.381389	\N	\N
6c9b82e2-d7c9-46cd-9f30-ba3655d9d86f	260118	Pú Xi (Tuần Giáo, Điện Biên)	2567	\N	21.74222183227539	103.25277709960938	\N	\N
747ca46c-1b9e-4ef6-878e-e51014fd6d52	1026463901	Ia Hrú	2634	\N	13.59	108.1025	\N	\N
dd8b3db2-c80b-46d0-8950-dd1dd6fcb2d5	1026463902	Ia Le 1	2635	\N	13.456944	108.091667	\N	\N
d68c0e18-58ad-4c7b-b7d4-ec817d1df65c	970036	Phú Mỡ	7632	\N	13.441361	108.920853	\N	\N
6c3495ad-8813-4542-a0d3-cd6bc8807557	780002	Phú Mỡ	7632	\N	13.463611	108.923333	\N	\N
c14ef1cc-069c-409e-ac7e-d44f960b5db4	602730	Đập, Thủy điện La Hiêng 2	7632	\N	13.501111	108.848333	\N	\N
a2ebb380-6062-4b16-94e1-07b9361e17d2	061817	Xuân Lãnh	7633	\N	13.488985	109.030628	\N	\N
ba52c525-ce16-4912-8e80-00125ad56f45	780033	Lãnh Cao	7633	\N	13.506389	109.048056	\N	\N
a148e870-de13-4f80-9a0b-f3f6825d7272	780009	Krông Pa	7663	\N	13.121026	108.784781	\N	\N
6eb2d848-6a43-4878-868d-80b3820f7fb4	354563	Buôn Khăm, Krông Pa	7663	\N	13.115988	108.815476	\N	\N
86c36ea6-7172-4d81-a62e-9427c160dc06	781053	Lưu vực (Phước Tân) - HCN Phú Xuân	7664	\N	13.265278	108.906111	\N	\N
dc3cea10-01da-457b-8e6c-861337717a5f	780029	Phước Tân	7664	\N	13.265	108.906111	\N	\N
0aaa2352-ed5b-4df6-9c3a-0f171e827825	180003	Yên Chính	6634	\N	20.364162	105.984968	\N	\N
06cfe032-4469-48d3-a528-eea152ab3052	180004	Yên Lộc	6642	\N	20.285262	106.116428	\N	\N
20fc3609-de1b-4355-bcee-8db44412fbd5	480004	Nam Dong, Cư Jút	2011	\N	12.65	107.873611	\N	\N
1198a96a-acfb-4c9c-9f57-ec6d2e65f431	1024042403	Bình Sơn	6664	\N	19.054868	105.044391	\N	\N
bad8bebf-5233-4228-b581-b9d95cf76a87	1021110206	Búng Lao 3	2499	\N	21.554337	103.307932	\N	\N
669d5fc3-d23d-4230-b658-06e6232bab2b	1021110201	Búng Lao 1	2499	\N	21.522397	103.338222	\N	\N
190118c0-a4fe-49e7-87a2-69afcb6a73ac	1021110202	Búng Lao 2	2499	\N	21.52361	103.306389	\N	\N
2bc62ab4-d20f-478a-b3db-ca1512307d74	1020203003	Thuận Hòa	3836	\N	22.887064	104.992357	\N	\N
22c6d2d3-77c9-4a5e-995c-1ec13f39c69b	002057EE	Ha Giang - Thuan Hoa - Dap Thuy Dien	3836	\N	22.960004806518555	105.034423828125	\N	\N
16f3e8dc-37be-4b56-a061-30bce822d5b0	1020203011	Thượng Sơn 1	3837	\N	22.65099	104.844395	\N	\N
399d6215-d0d1-4614-a9ac-33e79f84c9d4	1020203012	Thượng Sơn 2	3837	\N	22.677491	104.843381	\N	\N
54a5b7b6-3a8f-428c-9b6d-6af282619de1	1020203008	Trung Thành	3838	\N	22.58627	104.984839	\N	\N
7c88eee7-3fde-4715-a117-d828499f1819	1020203005	Tùng Bá 1	3839	\N	22.864507	105.077076	\N	\N
cbc46998-22cd-4007-b1a2-5ec5785c597e	1020203004	Tùng Bá 2	3839	\N	22.89111	105.082242	\N	\N
9968de35-1ba2-48b9-a377-46b67286db3c	986042	Đà Sơn	6748	\N	18.884177	105.308315	\N	\N
df5600ad-43d2-4c1b-b732-5647964ef9c6	000429	Hồng Sơn	6753	\N	18.963523	105.291274	\N	\N
739e6f67-c797-4827-b37a-880405738baa	608337	Gò Công Đông	10425	\N	10.367639	106.677721	\N	\N
642200d2-2e30-48ca-a44f-c4674dba113b	1024042701	Mỹ Sơn 1	6759	\N	18.818289	105.400001	\N	\N
892e73c2-906b-4002-99ca-f5b2265f21ab	003643	Vinh	7085	\N	18.67123397	105.683074	\N	\N
ad6549c7-e6c6-454b-9515-7b7d86d4f81a	1024043001	Nam Thanh 1	6847	\N	18.729462	105.503941	\N	\N
36cc037e-586e-497d-83bf-797c7786e34c	730010	Hồ An Mã	7795	\N	17.109668	106.817695	\N	\N
7cc5d121-c8dd-40c1-9526-81a783e093c0	092995	Lâm Thủy	7797	\N	17.063855	106.509122	\N	\N
fc7312c2-4c9f-4b03-93c9-8a3363d31d00	730008	Hồ Cẩm Ly	7801	\N	17.214295	106.660405	\N	\N
a9416862-af0f-4e86-a386-7237ec39fc49	894561	TTNT.Lệ Ninh	7805	\N	17.232163	106.693077	\N	\N
b152f1d5-9ba4-4345-a2b4-472b18325a07	730025	Thái Thủy	7811	\N	17.150278	106.858889	\N	\N
891fbea8-f2dd-4839-808c-c55c35965528	947732	Dân Hóa	7816	\N	17.8025	105.779722	\N	\N
98378fac-90b8-4757-b634-b68b51c65cd1	1024042008	Châu Hồng	6938	\N	19.41527	105.1032	\N	\N
449287fb-be57-48bc-8974-92feebb4ab72	982717	Quỳ Hợp	6951	\N	19.324563005	105.17219399	\N	\N
ab340c08-fd15-4780-b208-f6002523d35f	982710	Tân Kỳ	7006	\N	19.05562696	105.26432502	\N	\N
f7ceba3d-1912-465c-aa9a-2267a8270242	356181	Chi cục Thủy lợi	1051	\N	13.756639	109.2115	\N	\N
1e261728-43c8-4716-93b1-1bc6ad7bcb52	095175	Đập Thủy điện Ialy	2603	\N	14.227763	107.829484	\N	\N
0e0e1570-a2a6-43c3-a415-851b88770fd0	1020202803	Du Già 2	3864	\N	22.931916	105.224487	\N	\N
485e85ac-2414-4414-bc49-c0bc33a8ea8e	1020202802	Du Già 3	3864	\N	22.88319	105.24679	\N	\N
c2553998-021f-4b98-93a9-231f6a25da00	1021715705	Hương Nhượng 2	4945	\N	20.401944	105.355833	\N	\N
9918ab93-74c8-41a4-9889-23b9d0c6bbd6	116421	An Ninh KV3	5365	\N	9.618889	104.942778	\N	\N
530a3805-26ed-430b-b08f-5cd681fcaaaa	924774	Trà Giáp	7907	\N	15.222222	108.2541672	\N	\N
4d0d400e-624e-4a22-bc84-c757b89b1343	9734	Trà Giáp	7907	\N	15.222288	108.254259	\N	\N
83dce2a1-f580-471d-9da1-087ef050659d	355760	Ba Dinh	8150	\N	14.748417	108.680389	\N	\N
614e710a-a613-4ae4-99e9-20e243fe326d	641757	Triều Dương	5163	\N	20.666586	106.130909	\N	\N
d214395b-6a00-4451-a2f2-412bd6f756ed	004206	Ea Ning	1855	\N	12.609131	108.208714	\N	\N
d0728620-5599-448d-8417-4dee8fe02d0c	1026664801	Cư Dliê MNông	1858	\N	12.911111	108.190556	\N	\N
76512436-7e9a-47ef-98f1-c8a70dd1b360	014620	Đăk Mâm, Krông Nô	2061	\N	12.459222	107.862111	\N	\N
6660a54f-a5f9-4177-b45a-9b9ff90d7b2b	480008	Đắk Sôr, Krông Nô	2063	\N	12.515556	107.859167	\N	\N
e4331b2d-bfef-43be-bf9f-a53fcc4f44e7	01205769	Ha Giang - Quan Ba - Thuy Dien Song Mien 	3872	\N	23.157915115356445	105.01803588867188	\N	\N
7ba0f045-bd08-4b91-8bb6-ac6a9afe82d0	850007	Ninh Hải	7298	\N	11.590833	109.044167	\N	\N
89aaf1db-bd0f-4da1-b213-6cbcfb5b0c9e	850013	Xuân Hải	7305	\N	11.643333	108.9875	\N	\N
292026b5-9b35-4983-85e8-b0572c6bb72b	850009	Phước Hải	7308	\N	11.532222	108.976111	\N	\N
06d4c45a-f4e0-4be8-8753-0c532fbdb29c	1022018202	Hội Hoan	5783	\N	22.0449103	106.4807848	\N	\N
f9e877bc-b554-4ad3-bd47-c731cdb6be37	1024042210	Bình Chuẩn	6692	\N	19.232812	104.908785	\N	\N
c4a639e2-a14a-44be-a52a-b80e536c9a01	447507	Bình Chuẩn	6692	\N	19.235	104.896944	\N	\N
195e0ad9-1de5-481c-b417-d8ada4443565	576354	Mỹ Sơn 2	7318	\N	11.672007	108.863601	\N	\N
53864cb2-1f85-4338-919b-eedde14fff7a	1024042201	Môn Sơn	6701	\N	18.940346	104.945013	\N	\N
01d3952f-610b-49de-a34a-265e55029739	454703	Môn Sơn	6701	\N	18.940833	104.945	\N	\N
129f7798-f220-4557-baa6-90ddccfe1954	00204E19	Nghe An - Con Cuong - Mon Son - Pu Mat	6701	\N	18.940336227416992	104.93467712402344	\N	\N
ca80c2d3-cb3b-4939-b9c2-bc21f69c8366	219512	Phan Rang 1	7334	\N	11.581223	108.973665	\N	\N
e6d2c7c1-bbc7-48d3-bff8-1c540aae9f8f	627820	Lộc Lâm - Bảo Lâm	5947	\N	11.772778	107.800556	\N	\N
0ccd9624-99c1-4bf9-915e-eabe432916ac	267735	Lộc Ngãi	5949	\N	11.67	107.914722	\N	\N
ff249e71-59d3-40ac-8efe-390fb98101f8	176785	Lộc Ngãi	5949	\N	11.625	107.844444	\N	\N
17b49529-f786-4e56-978d-b866efc2eec9	627809	Lộc Phú - Bảo Lâm	5950	\N	11.701667	107.793056	\N	\N
d0de01c0-501b-4137-aefb-ddec21770cfb	982965	Lộc Tân - Bảo Lâm	5952	\N	11.586111	107.756111	\N	\N
1614c454-e074-43ac-8bb6-bd5e07a1345b	012062D6	Lam Dong - B'La - Luu vuc thuy dien Da M'bri	5953	\N	11.667265892028809	107.77882385253906	\N	\N
26fadc54-2682-4e2b-b2f1-9f36b20aa07e	490005	Tân Rai	5953	\N	11.632353782653809	107.8292007446289	\N	\N
8c5a63da-7cfc-4e2b-bc3a-07b08126bea9	266991	Lộc Thành	5954	\N	11.428540229797363	107.84632110595703	\N	\N
431dfa27-f520-40f2-bc47-6438ab1fa1c3	490039	Lộc Thành - Bảo Lâm	5954	\N	11.447416	107.833827	\N	\N
ffda62dc-5f4b-4bbc-ac19-b935cff405c0	490054	Thị trấn Cát Tiên - Cát Tiên	5956	\N	11.565801	107.368479	\N	\N
c7135571-1082-4d25-8127-e15b037a0562	490044	Đồng Nai Thượng - Cát Tiên	5957	\N	11.741457	107.467689	\N	\N
d32ad244-5274-4f5b-ab8f-2d5876f521d9	1026868101	Đạ Ploa 1	5970	\N	11.376893	107.657096	\N	\N
8b55d3df-9c4f-47b8-b7dd-e698dcdf3299	490052	Đạ Ploa - Đạ Huoai	5970	\N	11.371827	107.662432	\N	\N
1ea56d12-2ea1-4d6c-8ceb-8101ab4b082e	850014	Phước Nam	7351	\N	11.497778	108.913056	\N	\N
ba42e723-e467-470d-a88a-43887730cbac	1021514020	Suối Bu	11085	\N	21.550551	104.661297	\N	\N
716b277a-e7b6-4aa6-bdc2-0dc68e566da2	1021514016	Suối Giàng	11086	\N	21.624167	104.589444	\N	\N
2dec9eee-a19a-429c-ab32-eceae9fd1f50	210013	Suối Giàng	11086	\N	21.616944	104.593611	\N	\N
4eac441a-7711-43e0-ae75-ff92c6b1dbfe	536630	Tân Sơn	519	\N	22.069722	105.9175	\N	\N
f4fbf6de-3e4f-48e5-8cfb-76658274df45	649522	Thanh Thịnh	520	\N	21.926944	105.794167	\N	\N
3de71561-384b-4caa-ac25-43d516470d51	539248	Thanh Mai	521	\N	22.038611	105.771389	\N	\N
66e02ec6-54e3-44c4-9107-713ba79121af	929405	Cẩm Khê	7370	\N	21.415834	105.141026	\N	\N
0ffc1746-6a14-4248-8428-8b6efe9a2488	040735	Cao Sơn	4855	\N	20.865111	105.172	\N	\N
2f26e442-0c35-4384-9f61-70656fb173f3	1022018503	Tân Hương 1	5608	\N	21.8331524	106.2583047	\N	\N
5d48366a-acaf-4077-85ae-76b786deb758	1022018504	Tân Tri 1	5611	\N	21.8538538	106.152923	\N	\N
fcabe87a-68e1-422f-9f9c-0d016c6dd79d	950011	Đông Phước	3288	\N	9.88324	105.79091	\N	\N
ee784e08-c0e0-4e45-a953-8efbdd4dcd10	950008	Đông Phước A	3289	\N	9.930448	105.774355	\N	\N
9bc66d17-32e6-4ee2-b610-f4914c0cf600	950016	Lương Nghĩa	3306	\N	9.60052	105.41254	\N	\N
6fe748b6-0834-4705-8b0f-f5f5014e5342	950005	Lương Tâm	3307	\N	9.619643	105.458607	\N	\N
864b09f1-7c4b-498d-a524-ca3298459431	950006	Thuận Hưng	3309	\N	9.65488	105.539414	\N	\N
756b1c92-565d-47c6-b908-7b9d87938b35	989543	Thu Cúc	7519	\N	21.273889	104.905556	\N	\N
bc361258-49ce-4721-b9fc-c561b0ecac77	184557	Hạ Hoà	7422	\N	21.563349	105.004744	\N	\N
2f2afb73-dbff-45e6-a191-ff698b3c1624	954638	Hiền Lương	7425	\N	21.605	104.910833	\N	\N
c803a91d-3b11-4aa0-8e08-1a1d8a545cc7	1022523101	Văn Lang	7438	\N	21.533192	105.01421	\N	\N
f7d8b7f5-036d-465f-bc49-ed47366d1f8e	495403	Lê Minh Xuân	3369	\N	10.777222	106.537222	\N	\N
d5d986b5-9676-4174-b4da-adc215ed7e70	109926	Vĩnh Điền	5358	\N	9.811944	105.059722	\N	\N
718128e4-13a5-43c3-9a28-4cd3f0b8c6ce	1024015103	Mỹ Lý	6818	\N	19.61042	104.31182	\N	\N
d3062aa2-bb35-4563-aff3-0b004589f3ea	053994	Huyện Kỳ Sơn	6822	\N	19.400278	104.145556	\N	\N
4078be79-94f2-48c9-bfcd-a894b69d2abc	520833	Lâm Thao	7452	\N	21.314011	105.304344	\N	\N
ec1e7bb4-0a63-4862-876f-90b1feec9878	730015	Quảng Tiên	7785	\N	17.76	106.321111	\N	\N
2dec9d09-a2ae-4914-8982-0e4c05529049	950020	Phường 5, Vị Thanh	3350	\N	9.7947	105.48497	\N	\N
5d165bd8-4c60-4146-901e-f17d9eac4004	981364	Dị Nậu	7490	\N	21.241944	105.263889	\N	\N
de742bdb-8101-4e61-b4da-a647aa778c15	760006	Văn phòng thường trực	8239	\N	15.13275	108.802222	\N	\N
eb0c42bb-306f-4e58-8eb1-c25971ca0f9e	248507	Thanh Ba	7527	\N	21.506987	105.124994	\N	\N
e5578bb5-55a1-4282-8b83-40c4d18a1121	960041	Đông Lĩnh	7530	\N	21.525	105.148333	\N	\N
2f4af174-3d6c-4da0-b41e-bad0da87823f	961184	Hanh Cù	7532	\N	21.519167	105.096389	\N	\N
1a2ae241-0f15-4645-bbb0-c3dd08bd4e50	890495	Sông Công	9634	\N	21.465278	105.843889	\N	\N
4bc89fe8-449e-4e21-b37a-83cfb9dfe0e2	1022523201	Năng Yên	7537	\N	21.501944	105.201389	\N	\N
be82d143-2100-4d93-a6b7-a7489ac062e4	970203	Lương Nha	7559	\N	21.002778	105.311667	\N	\N
cf328b2d-1902-471e-a35e-78ead1084068	956409	Phượng Mao	7580	\N	21.071111	105.265556	\N	\N
af92f226-2db8-40a6-b422-845a44575f82	869414	Thanh Thuỷ	7584	\N	21.167108	105.279625	\N	\N
9f709a8d-f9d6-4c40-842d-a5c47c891461	920022	Trà Don	8016	\N	15.093611	108.121111	\N	\N
088b741f-68a3-414e-9c21-2a123393c675	492430	Trà Leng	8017	\N	15.27245	108.014071	\N	\N
bcb0f977-f66b-419e-a590-02c09ff18403	012061A0	Quang Nam - Nam Tra My - Xa Tra Leng	8017	\N	15.272238731384277	108.01396942138672	\N	\N
b751f5ac-2db7-406e-a865-029fefc8f9ee	061826	Sơn Định	7665	\N	13.194572	109.062733	\N	\N
88145890-30f6-4f2a-9fd8-dedab8a19687	190008	Chi cục thủy lợi Phú Thọ	7610	\N	21.316389	105.413611	\N	\N
9be9337a-77cc-4785-bcca-72005f036c0d	904201	Trạm Tấu	11037	\N	21.465273	104.380227	\N	\N
b693b31c-0396-4dd7-9349-b113d0e88f95	910782	Yên Lập	7622	\N	21.347078	105.02225	\N	\N
0874eebb-166d-4b26-8eb8-f49b9b2b0628	949501	Phúc Khánh	7623	\N	21.300072	105.056505	\N	\N
9787325e-5f24-4e8d-8d03-1dbe038e0245	942514	Xuân Thủy	7627	\N	21.385833	105.019722	\N	\N
eeca5fa7-e88e-411b-a1c4-9ad2a3430355	780025	Hòa Hiệp Trung	7643	\N	12.995833	109.364722	\N	\N
ce227a10-6a7a-4e31-9aa3-992509a9ac29	730023	Quán Hàu	7839	\N	17.402222	106.640278	\N	\N
3aa59d04-4b5f-4510-b494-4976c375c0df	780015	Hòa Vinh	7647	\N	12.993056	109.329167	\N	\N
2913513b-7b32-4f27-8c14-8ff6d6ce070d	780022	Hòa Xuân Đông	7648	\N	12.964446	109.347945	\N	\N
11893d6b-6261-41c1-8d9c-4aab30c1665e	780014	Hòa Thắng	7657	\N	13.045278	109.248056	\N	\N
476fb346-4e89-41a5-bd14-5635375e591e	780027	Phú Hòa	7659	\N	13.023611	109.219444	\N	\N
c3471c55-70e6-4a4e-9639-39c4f1779ca6	48/97	Sơn Hòa	7660	\N	13.050000190734863	108.98332977294922	\N	\N
ad0743e4-6d5a-40b7-8c62-f6afa9b4d30c	061824	Cà Lúi	7661	\N	13.212403	108.896935	\N	\N
78c30a2f-a0e7-48b2-a63a-596fa7733822	116553	Lưu vực (Suối Công An) - HCN Suối Vực	7670	\N	13.125472	108.989028	\N	\N
f6cee448-53f1-48e7-93e9-da33c387eabe	354395	Đập thủy điện Sông Ba Hạ	7673	\N	13.024167	108.903333	\N	\N
54827404-8796-4eb3-9217-430fcf5d3a2e	780011	Xuân Thọ 2	7685	\N	13.395556	109.2125	\N	\N
6f56ff2e-1ca2-4b0e-823b-5e0aebaab58d	625783	Ea Lâm	7691	\N	13.071667	108.771389	\N	\N
14ae3f52-154a-4a53-9d11-9e4d3b330724	780003	An Lĩnh	7717	\N	13.257012	109.171437	\N	\N
57031412-d90a-4d5d-b6e7-a641ecb69ff6	117056	Lưu vực (Thôn Thái Long) - HCN Đồng Tròn	7717	\N	13.234556	109.156361	\N	\N
097199d8-c895-4340-a14d-861f92634eca	780004	An Mỹ	7718	\N	13.204066	109.274056	\N	\N
e2f06308-5637-480b-979b-bed9a1c0b5fc	061754	Chí Thạnh	7725	\N	13.305996	109.214919	\N	\N
8180ad79-227c-4378-ab29-f4f89529fab2	730022	Bắc Trạch	7742	\N	17.697859	106.454657	\N	\N
8528346e-0a15-48d7-96b5-b4e5701996cc	885437	Na Sầm	5786	\N	22.056123	106.614576	\N	\N
bb9259f0-58fb-40d0-9049-bbcae31ef723	730003	Hồ Đồng Ran	7747	\N	17.701469	106.439971	\N	\N
7a9ccdf0-8bbb-430d-b9ee-14bb5e00466f	730021	Liên Trạch	7754	\N	17.669444	106.388611	\N	\N
3733bf1d-94c7-43ab-b9c4-14d6b81c3391	552447	Khe Táu	8485	\N	21.363306	107.476788	\N	\N
113948b2-a4e0-4601-a375-8835278d8419	1021513906	Túc Đán 1	11039	\N	21.578056	104.450278	\N	\N
187b78f7-ac33-4318-939e-aa314a0e4a3c	1021513907	Túc Đán 2	11039	\N	21.584167	104.422222	\N	\N
f6f85969-1b3e-451a-9f28-fa9a71998a20	908685	Túc Đán	11039	\N	21.580166	104.452857	\N	\N
fd5a896e-2fbd-4651-9ba4-fef342213d4c	002068B4	Yen Bai - Tram Tau - Thuy dien Nam Dong 3	11039	\N	21.57019805908203	104.4374771118164	\N	\N
8610c878-b160-4a57-8141-0837ee7cfcff	1021513904	Xà Hồ	11040	\N	21.516	104.35102	\N	\N
def1c6ea-3f4f-458c-823a-5fe81a0c99d3	210002	Xà Hồ	11040	\N	21.516667	104.350556	\N	\N
1802a269-741b-4a80-a152-e7d9340b94a1	1021513803	Hồng Ca 2	11046	\N	21.602778	104.735278	\N	\N
346f8059-f66e-492d-9a62-a1d60b21b100	1021513804	Hồng Ca 1	11046	\N	21.610833	104.696667	\N	\N
e4359649-78ed-406e-857e-e732f50d7e3b	935730	Hồng Ca	11046	\N	21.583264	104.728514	\N	\N
9ebc8326-cebc-4641-95cc-7ebe5bc93f4b	1021513811	Hưng Khánh 2	11048	\N	21.546213	104.756465	\N	\N
45f82f39-8420-4a63-ab97-65f1ba6be3b8	1021513802	Hưng Khánh 1	11048	\N	21.593052	104.763481	\N	\N
3986bd40-094f-4f2e-9155-0548135cf9c9	603641	Kiên Lao	11050	\N	21.733806	104.731722	\N	\N
7201ad1c-fd22-456f-90ea-9fd4cb2feffe	1021513806	Kiên Thành	11050	\N	21.701602	104.736594	\N	\N
cd392de5-cc22-4f92-8730-94134c506b35	1021513801	Lương Thịnh	11051	\N	21.635278	104.787222	\N	\N
7010125e-566e-44d3-9efd-8c7eb1bf4181	1021514004	Nậm Búng 1	11072	\N	21.727225	104.36881	\N	\N
35cc4a60-017a-48e3-8d47-844b7a9fd2ce	1021514003	Nậm Búng 2	11072	\N	21.75067	104.339741	\N	\N
0449810b-516e-458b-9c95-2461a4e186ec	1021514014	Nậm Lành 2	11073	\N	21.635754	104.464073	\N	\N
56562dbb-7c0a-4a96-b3da-59a1489f754c	1021514013	Nậm Lành 1	11073	\N	21.675278	104.451667	\N	\N
3b74c1dd-9836-4260-bb06-57b0a3f66f67	1021513301	Phúc Sơn	11081	\N	21.53842	104.49748	\N	\N
b9a1c037-fb24-4945-a5d8-f66ca5ff20b7	210038	Sơn A	11082	\N	21.626686	104.508065	\N	\N
fa1be583-a700-4e67-bf03-93df1cf10c52	730024	Vạn Ninh	7843	\N	17.280833	106.684444	\N	\N
8fd02131-0129-4184-914d-b16c6b10bf8a	730014	Quảng Trạch	7858	\N	17.802778	106.4075	\N	\N
b0b56097-6ad5-458b-b84e-4a35e0dad28c	730012	Quảng Tùng	7863	\N	17.867778	106.428333	\N	\N
edbe3c61-c7f6-4609-be2e-63d29dfa266a	48848	Đồng Hới	7869	\N	17.46666717529297	106.61666870117188	\N	\N
0aa53da1-875a-4160-af99-e6c6471ce49d	140004	Bình Liêu	8337	\N	21.523889	107.399444	\N	\N
3ecd7c00-d87f-428b-90c5-61217e4c6d8a	002040D7	Quang Binh - Tuyen Hoa	7882	\N	17.798357009887695	106.22655487060547	\N	\N
0a90dbf1-5718-4960-9a23-1e9ed096b4f4	604100	Đắk Pring 2	8006	\N	15.56806	107.5767	\N	\N
b348b8e6-642b-43d6-9f67-3801edd79ac6	920006	Hồ Nước Rôn	7904	\N	15.369552	108.277191	\N	\N
9ec57c9f-52ac-4e7a-918c-fef57f23bfaa	266249	Zuôich	8013	\N	15.676389	107.498056	\N	\N
776594c2-fcc1-4062-b040-aee7579416bc	920011	Khu TDC Tắk Pát, xã Trà Leng	8015	\N	15.271111	108.013889	\N	\N
2b19f41a-53fc-4910-ab03-e3afbef986d2	115404	Cẩm Phả	8355	\N	21.01055	107.27264	\N	\N
cfd0d4b8-f14b-4da4-af55-3e174a65de51	140008	Dương Huy	8358	\N	21.067386	107.233502	\N	\N
1614c827-e533-46a4-a21d-6af66eb15b73	48/94	Trà My	7910	\N	15.350000381469727	108.23332977294922	\N	\N
2f4fe5d7-68c5-4ab3-96aa-4e67cb4ce7ad	618900	Cầu Vĩnh Điện	7939	\N	15.901677	108.247891	\N	\N
3eb94364-b261-473b-9005-43d51b0983a6	920030	Điện Ngọc	7940	\N	15.948886	108.254896	\N	\N
60c52739-0792-49cb-8d18-e33b4ec79426	642145	Phủ Thông	463	\N	22.270278	105.881111	\N	\N
8f7ee044-7bf6-4007-b963-fd7320f9aa05	920027	Đầu mối hồ Vĩnh Trinh	7963	\N	15.805365	108.164361	\N	\N
867e5334-6e0e-4abd-8448-253704d8e247	71531	Câu Lâu	7968	\N	15.862	108.283	\N	\N
2dfad5fb-6517-498e-b598-00bacd241faa	840962	Hạ Long	8400	\N	20.97423	107.01215	\N	\N
482c1a20-8c7d-410b-9ef3-fa032c7401fc	921782	Đầu mối hồ Việt An	7990	\N	15.592222	108.223056	\N	\N
68d7f335-3e43-4455-b2f3-f78f6a1b0533	000436	Bình Lâm	7990	\N	15.600715	108.216534	\N	\N
c97bbf71-98d4-4e2a-844a-960aa94fb3b3	71529	Nông Sơn	8027	\N	15.7	108.033	\N	\N
94220a10-04e1-4f36-a641-ea7b05b203a3	354128	Quế Phước	8028	\N	15.664167	108	\N	\N
afbd79f7-e590-487e-9765-f1b8b8295325	940004	Cái Cùng	206	\N	9.142139	105.5808	\N	\N
aa4a135e-7f1d-43f4-8cde-1577ec776ec6	48/93	Tam Kỳ	8096	\N	15.566666603088379	108.46666717529297	\N	\N
318ba3e7-1bd9-4fe4-a814-7d9f5a41d63b	920025	Đầu mối hồ Cây Thông	8082	\N	15.734521	108.258649	\N	\N
72ac8505-5c88-40f0-8709-c87abd391edc	920029	Bình Dương	8113	\N	15.805001	108.381044	\N	\N
83ae7d3e-9153-4fb0-8926-5bdf46843633	476310	Ba Điền	8149	\N	14.8625	108.663889	\N	\N
9e0fa9e6-3886-4e77-b666-42608f134688	1021412603	Chiềng Cang	8894	\N	20.9497	103.8833	\N	\N
403f73de-7ef5-49eb-aa0c-6ff889b3ea43	760011	Bình Mỹ	8176	\N	15.253451	108.662241	\N	\N
8eca2dff-6ee0-43eb-baf1-9208c2615e76	478645	Bình Tân	8181	\N	15.228611	108.846389	\N	\N
4a951e06-0746-4b0b-8d8e-41bb4188a8d2	760010	Bình Trị	8187	\N	15.335772	108.833841	\N	\N
a4ecce53-8211-4886-bbc0-546aaa3e955a	760031	Đầu mối HCN Liệt Sơn	8194	\N	14.754959	108.943874	\N	\N
84fd897f-2a9d-4626-907b-b943ffc460fa	567011	Quan Tượng Đài (TP Huế)	9104	\N	16.462203	107.570838	\N	\N
20a850f6-41ee-4858-87a0-316da00f4814	760020	Phổ Nhơn	8197	\N	14.821389	108.911944	\N	\N
77ee7bcd-e7ee-4c50-950b-bd2606eb9f7e	760062	Hồ Lỗ Lá	8197	\N	14.796944	108.901944	\N	\N
7c101d80-2b3c-4950-b351-d3399e2ff544	760063	Hồ Sở Hầu	8197	\N	14.816111	108.876667	\N	\N
ea55b8e1-f1cd-4185-a014-2b3dbc16e320	48863	Quảng Ngãi	8245	\N	15.116666793823242	108.80000305175781	\N	\N
0e877c46-6ba0-4172-b91a-9f88bb959e39	965884	Hành Dũng	8228	\N	15.045278	108.745278	\N	\N
079a0c07-9f74-42cc-ae5b-ccd9788d466e	750016	VPTT PCTTHUE (TP Huế)	9111	\N	16.463263	107.589346	\N	\N
e197b50d-31f9-454c-95d9-ede4a917404b	71542	An Chỉ	8232	\N	14.983	108.817	\N	\N
6a1cd9ec-b891-4da7-8307-8b6ff77fde26	760018	Hành Tín Tây	8236	\N	14.92195	108.764261	\N	\N
e7388b70-1be2-4ccd-baf2-066ca124aa5e	760065	Hồ Cây Quen	8236	\N	14.927778	108.746389	\N	\N
f5a6b2e8-3868-4627-81e7-a795df8397ce	075561	Sơn Kỳ	8265	\N	15.035064	108.530739	\N	\N
0128ed74-999e-499a-a55f-83fb3695a171	760059	Hồ Đồng Giang	8265	\N	15.023333	108.560278	\N	\N
70c6d07e-8d57-45c2-9c1d-eb97bb931540	040665	Vĩnh Tú	8656	\N	17.112023	107.010364	\N	\N
1e02a1fa-9f81-40e9-ab06-41f5e40e8600	483909	Trà Phú	8309	\N	15.251389	108.581389	\N	\N
db339555-a78a-4586-9235-7a6b61d59490	760057	Hồ Vực Thành	8309	\N	15.229167	108.578056	\N	\N
a5bed77c-2471-4927-86ca-d49a9b8babd7	830002	Châu Thành	8659	\N	9.705925	105.90286	\N	\N
3558a669-ea15-40e1-8b1a-f9334656ce6b	760067	Hồ Hóc Xoài	8324	\N	15.091944	108.693333	\N	\N
1e85d02c-cdf3-4102-a4dc-517e4c6e36f5	207491	Nghĩa Thọ	8324	\N	15.103818	108.693768	\N	\N
a5716a03-4631-4029-89f9-9f468c8e7611	870657	Ba Chẽ	8329	\N	21.273958	107.284557	\N	\N
bc918ee2-0712-49b1-aae9-823d0d459b56	997906	Ba Chẽ	8329	\N	21.27262	107.27839	\N	\N
1c161522-cc49-4929-adac-0a9e1469e6f4	315764	Đầm Hà	8365	\N	21.35277	107.597584	\N	\N
8084c752-78a9-44fd-88d6-d3720c719364	700672	Đông Triều	8379	\N	21.072961	106.510727	\N	\N
aa54dcab-1ae7-423f-a406-a466e03fd48e	958011	Than Hòn Gai	8405	\N	20.995833	107.125	\N	\N
949871c0-d9dd-4ac5-a6fe-194d94361030	833792	Phong Cốc	8471	\N	20.90166	106.81107	\N	\N
94793ed4-2179-4f73-b2ec-c1e50fa27d4f	872393	Yên Hưng	8473	\N	20.941715	106.802115	\N	\N
f4405a43-8b88-4213-b2e8-b893ceedb76d	140007	Khe Mai	8507	\N	21.113623	107.422571	\N	\N
901b23ee-bede-406f-bfea-1fba9ba200c7	48849	Ðông Hà	8539	\N	16.83333396911621	107.0999984741211	\N	\N
9842330a-86fe-4663-816a-b6d1f4a24ba6	1022524004	Xuân Sơn	7524	\N	21.118999	104.955599	\N	\N
789f724f-afaa-4c16-add4-79cf68b92ca6	469942	Đập - HCN Suối Vực	7669	\N	13.105764	108.996386	\N	\N
3b66bddc-8afc-488c-b4c9-0ddcd1f30ea0	780010	Sơn Nguyên	7669	\N	13.081944	109.0425	\N	\N
edef8e55-da52-478d-9cb9-6c4bfbd2e7d9	040723	Hải Thái	8562	\N	16.874567	106.983422	\N	\N
cf1777e5-bbd5-4bbd-bbac-173865ef113d	740020	Hải Phong	8581	\N	16.663056	107.319167	\N	\N
154b6b5d-ded9-4ea1-aa1c-49c3959c0e8a	740017	Lìa	8590	\N	16.472222	106.7175	\N	\N
55f1a104-bf27-4f93-8a3a-81d273217f15	345334	Hướng Lộc	8594	\N	16.546111	106.7125	\N	\N
44c4b448-4d8f-4b51-972e-83cefc4fae9b	740016	Hướng Việt	8599	\N	16.829722	106.564444	\N	\N
591afe1d-9bc5-485d-a3c4-f732f40b9512	48/90	Khe Sanh	8601	\N	16.633333206176758	106.73332977294922	\N	\N
2d106aa4-78c9-4434-8fda-727eecb5c88a	352410	Lao Bảo	8602	\N	16.615556	106.598611	\N	\N
9c0905c1-6c22-49e0-bd93-768c4a5e39a3	740021	Thủy điện Hạ Rào Quán	8603	\N	16.646389	106.770278	\N	\N
db269d65-86cc-4ee7-836e-6419bcb580c1	1023840301	Thanh Tân 1	9922	\N	19.480174	105.607118	\N	\N
87d75c5c-9964-4366-83c4-cfb5e5ca77fd	71709	AyunPa	2594	\N	13.4	108.45	\N	\N
3caba3d5-0d79-4b2b-ae89-ccea41dae0d6	71515	Cửa Việt	8626	\N	16.883	107.167	\N	\N
15ccf95b-9a07-471c-bf21-4a42979f84bd	740012	Bến Quan	8635	\N	17.022222	106.903056	\N	\N
83d7fb6a-32b4-4d9e-afee-21d301176621	312213	Cửa Tùng	8636	\N	17.028889	107.106389	\N	\N
74e9d7f7-d6ba-40b4-8171-b852b8d887b5	029757	Yên Thế	11007	\N	22.111651	104.769408	\N	\N
1ee2c81a-af8d-4ec9-b266-11fac5e2c635	1021513716	Cao Phạ 3	11008	\N	21.740278	104.278889	\N	\N
2cf7e1f6-a913-4cee-97f7-f34b55717d2d	1021513713	Cao Phạ 2	11008	\N	21.775278	104.243333	\N	\N
d9d078e5-4782-47ea-bb21-6b63367c96e6	1021513712	Cao Phạ 1	11008	\N	21.768333	104.2725	\N	\N
729798cc-3e43-40f1-b468-80e4856f70fb	830003	An Thạnh 3	8667	\N	9.575798	106.246058	\N	\N
93710a71-7055-4417-a004-42131186de1b	166963	Kế Sách	8679	\N	9.767023	105.985314	\N	\N
0fc697d4-02bb-4837-89ab-9ebb0746bd3f	816731	Long Phú	8690	\N	9.610278	106.119167	\N	\N
fd90b4f2-2fb5-45c7-a008-8b2f53b2bd7c	386352	Mỹ Tú	8697	\N	9.635278	105.811667	\N	\N
7d6e452d-6079-4039-adfd-e1ee75646176	830005	Vĩnh Lợi	8743	\N	9.448733	105.636327	\N	\N
1e270be1-64f7-4275-a653-d659dd7079d2	260137	Thủy điện Sơn La (Mường La, Sơn La)	8826	\N	21.498903274536133	103.99542236328125	\N	\N
6561722b-5e15-4224-8b0c-ecec3375bdf1	1021412004	Ít Ong	8826	\N	21.534167	104.026944	\N	\N
574ab94a-8292-49a4-8594-4fbf3fcb1fe2	800364	Gia Phù	8837	\N	21.19594	104.60316	\N	\N
c2b4c3c5-e86b-4b96-89bd-1c43a91f4341	260030	Huy Tân 1	8840	\N	21.260578	104.673341	\N	\N
c4259e0a-406d-4112-9b46-bf4b7eb23ac6	1021411914	Co Tòng	8922	\N	21.29293	103.49262	\N	\N
9bddf738-e898-4a5b-a5b5-6b69c2d155b8	824736	Phổ Yên	9573	\N	21.41546	105.874008	\N	\N
f3d69cad-423d-4d9b-9c28-44bc3f80eb44	1021411902	Púng Tra	8936	\N	21.401507	103.69457	\N	\N
a1a670f1-10ef-4ddb-958d-774233d6463a	917814	Thuận Châu	8938	\N	21.435805	103.689603	\N	\N
1b7914d3-05b8-4079-9934-8902a67fca25	1021412401	Chiềng Khoi	8957	\N	21.032104	104.32099	\N	\N
6b58dd3d-5e58-4a6a-b994-4b62c86a1f47	260007	Hồ Chiềng Khoi	8957	\N	21.015556	104.319167	\N	\N
9a621d0c-2bd0-408f-bbce-84d3799c4ce7	354518	Hồ Dầu Tiếng	9001	\N	11.312784	106.308182	\N	\N
125b29ff-3c18-4654-8fb2-b2fb57da6f3c	470012	Vụ Bổn	1969	\N	12.658926	108.431897	\N	\N
b27b61c0-7da4-4e27-805b-df6361f5ceff	634740	Ia Rsươm	2748	\N	13.296667	108.584444	\N	\N
5617d9b2-39b2-47e7-9030-2c1751dafca3	656749	Ia Rsươm	2748	\N	13.320556	108.586944	\N	\N
b24333fc-fc6a-47a4-8402-63cf68e5a833	471726	Đập, Thủy điện Đăk Srông 3A	2748	\N	13.345278	108.531944	\N	\N
1f2435e2-3825-43fb-8715-bb3cb2cd389d	742904	Bến Sỏi	8982	\N	11.310184	106.029138	\N	\N
61057704-4812-4110-89c7-b34e7772da54	87063	Đồng Ban	9034	\N	11.553418	106.160687	\N	\N
3388ec7a-bf48-4705-bba1-bf910ca9284a	677493	TT Khe Tre (Nam Đông)	9147	\N	16.168333	107.718889	\N	\N
305ab3e2-cb7c-4b62-b192-007cd29d1764	48/92	Nam Đông	9147	\N	16.16666603088379	107.71666717529297	\N	\N
0db558f7-ba0c-4646-a15a-ba2637df4ed4	750008	A Đớt (A Lưới)	9065	\N	16.076944	107.370278	\N	\N
b24387d8-458d-47c0-8751-39542d12d14a	750003	Thị trấn A Lưới (A Lưới)	9066	\N	16.272222	107.2325	\N	\N
e84308b7-1729-4760-a644-7167a2b8f240	750011	Hồ A Lá (A Lưới)	9067	\N	16.260278	107.245	\N	\N
81716af7-74e2-4f2f-a0e5-349792a8bfbc	750033	VP QLKTCTTL Thừa Thiên Huế (TP Huế)	9088	\N	16.489700317382812	107.5551528930664	\N	\N
fad7a22d-176c-4ac4-821f-c04e62b8a9dc	750024	An Tây (TP Huế)	9089	\N	16.433611	107.5975	\N	\N
a01ae44c-f1bf-4f6b-aa37-569da5e1e101	48852	Huế	9108	\N	16.433332443237305	107.58333587646484	\N	\N
635e119d-ebcd-43b6-8daa-1fb3536b54b0	750027	Thủy Thanh (Hương Thủy)	9123	\N	16.466998	107.640083	\N	\N
63ce190d-d8ff-4d76-aa6e-ceae12ff1480	750025	Thị trấn Phong Điền (Phong Điền)	9160	\N	16.582222	107.365556	\N	\N
dc464c84-ed35-4d92-9f31-09bd3da0942a	750035	Cảng Tư Hiền	9182	\N	16.351878	107.911559	\N	\N
9d4803f1-3eaf-4b24-a988-0bd6cfd171ea	934809	Đa Cốc	9325	\N	20.370459	106.381026	\N	\N
1f9c1a17-7916-4f1f-97ca-02a80cc1b1bf	750001	TT Phú Đa (Phú Vang)	9187	\N	16.439844	107.714337	\N	\N
872df226-36c8-47d6-b09a-b8538773bcff	750059	Cảng Thuận An	9199	\N	16.548073	107.6353	\N	\N
f3e06983-494e-48ce-bbb6-4fa3b1cb4e6b	750034	Trạm bơm Vinh Hà (Phú Vang)	9201	\N	16.370330810546875	107.80682373046875	\N	\N
70ba5492-e7be-4cd6-8c82-9993805906a7	490007	Bảo Lộc	5937	\N	11.535350799560547	107.82763671875	\N	\N
b1a91110-f249-440d-bf01-cb23bfc339f7	490050	Lộc Sơn - Bảo Lộc	5937	\N	11.534038	107.821034	\N	\N
2b702dbd-4e2f-4e82-bf72-049656d6d959	268545	B'Lá	5942	\N	11.71489	107.775	\N	\N
818be76f-4e11-4ea2-99e8-21298ee9175e	627082	B'Lá - Bảo Lâm	5942	\N	11.683611	107.7425	\N	\N
313c6490-67b2-4b14-b356-ef4b31213283	1024041606	Châu Nga	6928	\N	19.602773	105.219719	\N	\N
4b3a2f96-126e-4837-98ab-4526e91d7e49	1024041607	Châu Phong 1	6929	\N	19.46202	105.0206	\N	\N
8e12c6be-5257-4a7b-8147-8ed535a07dd2	750032	Trạm bơm Quảng Thành (Quảng Điền)	9214	\N	16.559999465942383	107.57805633544922	\N	\N
f82089ba-0d38-4ab4-93b2-b54ed5b427b2	677851	TT Sịa (Quảng Điền)	9216	\N	16.585556	107.511944	\N	\N
62e33120-1b0c-4ce4-ab95-86972ddd15e0	1024244702	Kỳ Lâm	4742	\N	18.010898	106.187896	\N	\N
a29afccd-c339-470b-836a-0aa3bdded951	459571	Đông Quang	9223	\N	20.533896	106.364859	\N	\N
5ac0c274-76c8-4734-883e-f80d10ff7702	01205A21	Thai Binh - Thai Thuy - Hat Thai Thuy	9390	\N	20.57034683227539	106.56156158447266	\N	\N
f28e52bb-efed-461f-9dda-58a1c734e68a	1026261006	Đắk Kroong 1	5497	\N	14.975306	107.7275	\N	\N
a3b299db-dd28-4f79-8a72-9898a1ea0d94	1026261001	Đăk Man	5499	\N	15.216167	107.735167	\N	\N
f46c6777-3f91-4dd7-9d06-fa17e21250c7	744061	Đắk Pét	5502	\N	15.088333	107.736111	\N	\N
14988cdf-29a1-4f2f-ad74-4b603cbef86c	1026261004	Mường Hoong 1	5504	\N	15.1135	107.935306	\N	\N
b16f27d0-0ac5-403e-8c11-50ea881b4792	820011	Xã Mường Hoong (Đăk Glei)	5504	\N	15.115595817565918	107.93653106689453	\N	\N
9e4b8d5e-7e49-4da6-ae47-1d6355391a8a	1026261005	Ngọk Linh	5505	\N	15.088389	107.929444	\N	\N
90ce83cc-4098-40d7-9e90-853ce60c3742	820012	Xã Xốp (Đăk Glei)	5506	\N	15.11388874053955	107.80583190917969	\N	\N
bf5a7861-d43b-4978-943d-8ea52e018545	1021210821	Pu Sam Cáp	5889	\N	22.2425	103.48	\N	\N
be99a356-787c-463d-8c0b-d521ef7b1aa8	170006	Đông Quang	9238	\N	20.514355	106.354673	\N	\N
06aeb7fe-00a9-4565-807c-57ffbf9bf47c	1021211101	Pắc Ta	5913	\N	22.070504	103.854003	\N	\N
f5b7f258-db10-41c1-b48c-106b3e58b79b	889437	Pắc Ta	5913	\N	22.07638	103.85691	\N	\N
69cf7179-733f-44ac-a346-df2709dd5f65	1026261602	Ya ly 1	5583	\N	14.314722	107.833333	\N	\N
e365bfd8-d452-4dcb-9c35-71718126e59d	095182	Đập Thủy điện Sê San 3	5584	\N	14.215812	107.721935	\N	\N
350ac123-5e35-4be7-bfc7-082249551704	1026261603	Ya Xiêr 1	5585	\N	14.361333	107.802972	\N	\N
db81820d-7c33-4e67-acd2-d74b756a4c43	1026261703	Đắk Hà 1	5586	\N	14.843917	107.94875	\N	\N
2efb3128-be1d-475c-ab3f-908d1f202995	093354	Đắk Hà	5586	\N	14.804444	107.943056	\N	\N
13fa5aff-c943-4efb-8d92-6f08d1ddbdbb	382421	Tam Hợp	7069	\N	19.165833	104.448333	\N	\N
9d43d4e5-02e4-4c22-a973-0b1a00b71ab4	055990	Văn phòng điều hành	7076	\N	19.334722	104.4825	\N	\N
ccc56930-82ba-45a5-b7fa-17ee5bcce48c	001761	Đăk N'Drot, Đăk Mil	2017	\N	12.516228	107.703504	\N	\N
16880bdc-83b8-41cc-860b-96ec34b95790	014697	Đăk R'La, Đăk Mil	2018	\N	12.494306	107.740444	\N	\N
4cbf94a5-08c8-4ad1-aa3a-79aff4957568	001908	Kiến Đức, Đắk R'lấp	2030	\N	11.992072016	107.51111595	\N	\N
e86f2ec6-7537-4e68-822b-6e6f3703488d	014695	Nghĩa Thắng, Đăk R'lấp	2031	\N	11.900528	107.544528	\N	\N
8a76f04a-5555-47e2-8ac8-b22c2f7ce019	001836	Nhân Cơ, Đăk R'lấp	2032	\N	11.980691989	107.58843096	\N	\N
eb23c87a-2ccf-4d6b-ad93-26e3fa49b683	091963	Quảng Tín, Đăk R'lấp	2034	\N	11.938548	107.44719	\N	\N
70e7961a-7550-4aaf-bbb5-3b76cdfc29df	091962	Đăk Hòa, Đắk Song	2035	\N	12.338333	107.631111	\N	\N
66de96b9-218f-4f2a-933b-b59e27fbc6f6	1026766504	Đắk Môl 4	2036	\N	12.392778	107.678333	\N	\N
0dc55010-76d6-4ede-9168-901ea794d69f	1026766505	Đắk Môl 5	2036	\N	12.396389	107.664167	\N	\N
023b4ba6-faf0-4f47-a973-29747ea28c9e	1026766502	Đắk Môl 2	2036	\N	12.407222	107.657222	\N	\N
75b39015-7ba2-49e0-b04f-e993b59ccae2	1026766503	Đắk Môl 3	2036	\N	12.393333	107.648611	\N	\N
bd1d463c-637c-4256-a22f-4ebd92c00f94	1026766501	Đắk Môl 1	2036	\N	12.401389	107.646667	\N	\N
774ba0db-02e5-4ef6-8fa3-199716928153	014705	Đăk Mool, Đắk Song	2036	\N	12.401444	107.646556	\N	\N
04d8bd5d-62cc-4d8a-adae-8c6c316ad96a	380691	Tiên Hưng	9252	\N	20.576479	106.305996	\N	\N
81b2d60a-3aba-41ac-bfd3-50d8776f1e50	48914	Cà Mau	1529	\N	9.183333396911621	105.1500015258789	\N	\N
bbc25b39-0f0c-40f9-b20e-e0106d92deda	871247	Phước Hoà	7291	\N	11.861556	108.765833	\N	\N
fc3b1de2-6422-4566-a3d3-4ed74a4a284e	850005	BQL rừng Savin	7291	\N	11.930556	108.761944	\N	\N
1ef11651-671d-4128-9c01-3e6aa16cac3c	1020203502	Tiên Nguyên 2	3811	\N	22.488889	104.666389	\N	\N
35460585-db71-44f1-a687-fd65f074ab1c	1020203501	Tiên Nguyên 1	3811	\N	22.526944	104.700833	\N	\N
92ea24ef-b795-4453-9a2f-51284edcba93	260121	Lản Nhì Thàng (Phong Thổ, Lai Châu)	5860	\N	22.462221145629883	103.37000274658203	\N	\N
03fd31c5-0f25-41ab-bd11-e7af1b0d595d	01205A15	Thai Binh - Hung Ha - Hat Hung Ha	9293	\N	20.59239959716797	106.13317108154297	\N	\N
776e21dc-dec8-4a2a-9d84-0197d3dc6f0d	152043	Kiến Xương	9300	\N	20.451672	106.42725	\N	\N
b00a0641-ed72-42e4-a0d1-6924f64b26f1	1024041604	Châu Thắng	6930	\N	19.575735	105.039565	\N	\N
71855488-e6a5-4589-a2ef-6ea2272afa5e	093004	Thủy điện Châu Thắng	6930	\N	19.600953	104.998172	\N	\N
ccd1c645-afff-4c48-b332-f4248d5d33c0	1024041605	Châu Thuận	6931	\N	19.640394	105.083466	\N	\N
03d6e478-3f1c-48eb-a103-b95e71571a09	281543	 Hương Thọ	4839	\N	18.347198	105.57658	\N	\N
eacedc5b-8388-4d0e-bc49-1da641e870fc	355762	Hương Quang	4839	\N	18.325111	105.540611	\N	\N
62a4fa45-fc35-4b93-a949-bfd9ef5402f3	940015	Hiệp Thành	159	\N	9.236667	105.756111	\N	\N
c4a967a0-2729-4d37-a624-32a7684c1035	342807	Phủ Dực	9338	\N	20.689863	106.375905	\N	\N
2882b96b-4d75-4d55-af5c-a0997599fa59	01205A27	Thai Binh - Tien Hai - Hat Tien Hai	9452	\N	20.382389068603516	106.5659408569336	\N	\N
68da8d62-3caf-405c-978e-34e5d10975de	600004	Cống Rạch Bùn	10434	\N	10.359852	106.775442	\N	\N
bba81b96-e6e1-470e-9545-11bda85e667b	170005	Cống Neo	9349	\N	20.600891	106.43294	\N	\N
50e28a8a-3c3b-46cb-9396-5fdc48fe13c0	189153	Quỳnh Phụ	9350	\N	20.603044	106.3766	\N	\N
f9b22a22-5f75-4b3b-be34-721ee8271d42	170004	Trạm bơm Quỳnh Hoa	9354	\N	20.69263	106.31625	\N	\N
dfe69247-f3f3-4e9d-8647-c31a4d60fa00	1026463802	Ia Yeng 1	2773	\N	13.493889	108.391944	\N	\N
178b6a1f-f7d5-48d5-a5be-9df48e494dc5	131781	Phước Bình	2159	\N	10.671389	107.064444	\N	\N
aac82d13-abe5-4be2-b7b7-b6f35a63f19e	110016	Tri Phương	1800	\N	22.863611	106.393889	\N	\N
ce9a1e7d-8be4-4744-9fc6-8ab406de236e	385431	Trà Lĩnh	1794	\N	22.830327	106.323495	\N	\N
404a434b-45c5-460e-9a09-f6fde908c899	27842	Mỹ Lộc	9392	\N	20.487983	106.552347	\N	\N
c037fc43-86a0-4c68-b500-0f8773aadfa4	627440	Quang Vinh	1799	\N	22.844167	106.241389	\N	\N
c22403c1-9cd2-4335-b3bc-0afdce5a8184	470004	Cư A Mung	1875	\N	13.209772	108.036502	\N	\N
a711dcfb-f7a7-480b-9206-5ceeea4a957c	470023	Ea Tir	1885	\N	13.10507	108.09355	\N	\N
f7edf23a-dd89-4394-9fbd-a093a540b28b	036619	Trà Tân	8311	\N	15.179572	108.588021	\N	\N
e028e4af-ef89-4275-84a3-41bfe806fb1a	625170	Trà Bùi	8311	\N	15.173454	108.583724	\N	\N
a097fe0a-ef5b-4c7d-b628-96f3bf6dcf78	003420	Ea Ô	1897	\N	12.70791	108.48962	\N	\N
3ceda531-0d84-4d9a-b095-44484df82974	1026665603	Bông Krang 3	1970	\N	12.396389	108.220833	\N	\N
5048fade-e07a-4480-9d72-7fc5c1b6bd16	1026665601	Bông Krang 1	1970	\N	12.413333	108.215833	\N	\N
8aa8b576-5e67-4f10-98cd-3112b96d2516	1026665602	Bông Krang 2	1970	\N	12.400833	108.211667	\N	\N
ad20d588-14fe-4541-821d-4da01581a6b9	1026665604	Bông Krang 4	1970	\N	12.421389	108.220556	\N	\N
defda4a8-47cf-40a9-858d-6439ded5df0e	1026665607	Buôn Triết	1971	\N	12.395833	108.036389	\N	\N
1c833d84-1282-4534-b6f7-1d41e6fa0fbc	004236	Buôn Triết	1971	\N	12.392	108.075112	\N	\N
bcd5672a-33a3-4032-a70b-ec01d39c5175	1026665605	Buôn Tría 1	1972	\N	12.398889	108.121944	\N	\N
beb021fc-0e91-469d-89df-9811891c8da7	1026665606	Buôn Tría 2	1972	\N	12.3925	108.111389	\N	\N
22f1f936-87c5-4d87-ab68-990fb956a0c0	003401	Krông Nô	1977	\N	12.197687979	108.12960603	\N	\N
b718c946-f7ba-4fd8-958e-ac85cca9caf9	754741	Cống Lân	9459	\N	20.340731	106.575275	\N	\N
d11fd038-1dc8-4863-ba72-a535357621ad	1021412303	Lóng Sập 3	8787	\N	20.719954	104.501436	\N	\N
b1ef8811-f40e-42ca-b5bf-6160e92d5de2	677435	Lóng Sập	8787	\N	20.74408	104.53339	\N	\N
58be11f0-e378-4ab8-b2b8-26f98c4ae06d	1021412611	Nậm Ty 3	8907	\N	21.176534	103.658415	\N	\N
48f7a8f6-7e4f-43b2-8085-9107bfd50f72	1021412610	Nậm Ty 2	8907	\N	21.215015	103.636951	\N	\N
d2751427-8704-4b5f-a100-48e21a59dba9	545708	Tân Yên	392	\N	21.342921	106.142458	\N	\N
9e840aaf-c797-4210-8606-c5853e2b5205	001205	Xã Cát Hanh	1008	\N	14.060992	109.045836	\N	\N
3e69a99d-2fd6-48aa-8eed-b3d4e23bdf20	770007	Tường Sơn	1022	\N	13.973126	109.105699	\N	\N
caf9d70d-efb8-472f-9369-efd5f71437d5	43138	Trà Linh	9408	\N	20.568898	106.498828	\N	\N
2a19a049-50d7-4d18-b84d-1564b1e3d819	1021412204	Kim Bon	8843	\N	21.111944	104.621111	\N	\N
f3d50048-9b97-4af3-b09d-c2080b1b4f7c	226658	Yên Thuận	10640	\N	22.28913	104.936	\N	\N
d2a531b4-977e-4304-97ca-29e504f38cda	863812	Bình An	10641	\N	22.436944	105.166389	\N	\N
fbff4825-fcfb-48fb-afba-4cf3c804c54d	220017	Khuôn Hà	10643	\N	22.476389	105.291389	\N	\N
7040a624-0c67-4cae-8143-8175ee265fcb	132774	Lăng Căn	10644	\N	22.455639	105.2255	\N	\N
8e5943f8-a0af-40b7-9897-2882c166a575	079366	Phúc Yên	10645	\N	22.564722	105.200833	\N	\N
c863444c-bb9c-4551-844c-101a8dbc7395	200009	Đồng Quang	9641	\N	21.583042	105.833234	\N	\N
92aea24c-7b0f-456f-b2ad-b48b33e72bf8	1021210808	Tả Phìn	5893	\N	22.355278	103.218889	\N	\N
1d8c98f2-725f-48c5-af10-22699053cfd7	480010	Quảng Tâm, Tuy Đức	2076	\N	12.263611	107.378611	\N	\N
579b3216-e4a3-4104-b9aa-53e324ced1e1	170007	Tân Hòa	9490	\N	20.473277	106.30058	\N	\N
4e95570d-d3d3-4db5-91e2-e574daaf01d7	1024244705	Kỳ Giang	4737	\N	18.173915	106.216743	\N	\N
6972c783-bc43-4483-95b8-9a67c3d0a805	014700	Thị trấn Chợ Chu	9538	\N	21.912583	105.645083	\N	\N
f59f5932-147d-4011-890b-566fe75fdf22	0020645B	Thai nguyen – Dinh Hoa – TT Cho Chu	9538	\N	21.909809112548828	105.64258575439453	\N	\N
bdf2c49c-1922-469b-87e0-47c1de9ab09d	892774	Cù Vân	9507	\N	21.637222	105.728333	\N	\N
d0c92144-29f3-49a9-af19-8a0e37e607d6	272342	Đại Từ	9511	\N	21.633889	105.638056	\N	\N
994f59e7-7fb7-4c60-a2ae-64f2bdcae00e	92042	Sa Đéc	2337	\N	10.296504	105.765871	\N	\N
b6799125-5a1a-48ce-a827-49256fe0799b	200011	Minh Tiến	9517	\N	21.741944	105.569167	\N	\N
30f84f5e-5a06-43d4-9e20-013d656ff656	200006	Phú Lạc	9521	\N	21.687055	105.607417	\N	\N
eb045c3c-0516-49f2-8ff1-b53f18a57e45	200012	Phúc Lương	9524	\N	21.73489	105.620633	\N	\N
63c72b64-aaeb-481b-b90b-0021b3630a71	200014	Tân Linh	9527	\N	21.668637	105.661576	\N	\N
699e4bc1-e23e-426e-a103-c86389546a43	200008	Tân Thái	9528	\N	21.596693	105.684496	\N	\N
647bf96e-5341-4b36-b435-e7d5f3c1f75c	00206255	Thai Nguyen - Dai Tu - Tien Hoi	9529	\N	21.643268585205078	105.62613677978516	\N	\N
6c162c1e-70ae-4f31-bfa5-65f6d7d002f5	850006	Nhơn Hải	7299	\N	11.588333	109.111667	\N	\N
f390c247-790d-40f1-a80b-f1d4956bc196	200020	Bảo Linh	9534	\N	21.905556	105.571389	\N	\N
ce33b5da-1e75-4d7f-8994-e06a803d884e	0120682C	Thai Nguyen - Bao Linh - Dinh Hoa	9534	\N	21.905614852905273	105.57169342041016	\N	\N
f9488cd0-6b38-4a35-85b6-bd0b6cdd847f	743662	Cà Lúi	7666	\N	13.2075	108.919167	\N	\N
121077f3-e6b8-4eb6-942a-7d4a67ce13b6	356470	Bình Thành	9536	\N	21.778194	105.578778	\N	\N
6bf86f2a-3080-4ef0-96b1-3d53317ccc13	953419	Điềm Mặc	9541	\N	21.831943	105.555818	\N	\N
eaa82d1b-1ec6-4385-9919-75e511b650f7	343046	Phú Đình	9546	\N	21.797222	105.539	\N	\N
f6a8686a-2c46-41b7-9f0b-adc2eb576fac	200019	Phú Tiến	9547	\N	21.822222	105.666667	\N	\N
3a24a0be-ae43-4edf-91e4-272662453458	003653	Thanh Định	9554	\N	21.857389	105.559083	\N	\N
db6fd129-5623-4e23-9d89-0e9908180d6d	014704	Trung Hội	9555	\N	21.870222	105.624639	\N	\N
0ffd4b04-477d-4617-a917-99db314d9b64	18422	Phú Bình	9596	\N	21.461862	105.982176	\N	\N
e8508241-2b03-48ca-9dcc-12336fcca543	501285	Phố Đu	9612	\N	21.724429	105.708247	\N	\N
730ec96c-5190-441e-abab-e52de159ca8d	83209	Vĩnh Châu	8760	\N	9.324444	105.98	\N	\N
c9ae87c6-c52e-48ae-b79b-dfe24a9ffc59	419547	Cát Lái	3547	\N	10.770833	106.770278	\N	\N
63dfdb56-a8fe-4b9e-8885-b54abad7ea19	00206253	Thai Nguyen - Tp Thai Nguyen - DH Nong Lam	9655	\N	21.59712791442871	105.8027572631836	\N	\N
af5e19ec-9b96-4b64-92d7-84d3615c730e	891596	Cúc Đường	9669	\N	21.758333	105.959167	\N	\N
9ad1bb58-3288-4959-b99c-9468170e9977	488283	Đình Cả	9671	\N	21.752992	106.075313	\N	\N
7c2a3451-8503-4cad-ab4e-9e575991387c	002817	Bắc Sơn	9683	\N	20.096775	105.856503	\N	\N
dac331da-6fa7-43fd-ae70-b0a9b930b2b9	360004	Hồ Cánh Chim (P. Ba Đình, Tx Bỉm Sơn)	9684	\N	20.080556	105.870278	\N	\N
8b7525b2-8743-4b52-aee2-1df2f43840ba	1023838602	Kỳ Tân 1	9701	\N	20.288261	105.125978	\N	\N
de1d1da1-5d22-4989-8828-07b6233b8a9a	125443	Mường Ngoại	9706	\N	20.321385	105.332064	\N	\N
d0cedf01-b9d8-476c-807a-9da57af1318d	1023838601	Thiết Kế	9712	\N	20.328161	105.173192	\N	\N
fd7a6261-2348-4662-b7b4-bfe7bbbb039a	359031	Mường Mô	5846	\N	22.223496	102.935627	\N	\N
bcbe7e7d-1861-4147-bec5-c223d75273b7	57734	Pa Nậm Cúm	5863	\N	22.609064	103.230489	\N	\N
eb88a06c-98ac-4aaa-8fde-6fd6390bd39b	1021210901	Mù Sang	5864	\N	22.650673	103.297403	\N	\N
2e3c6919-a8d4-48cc-a7f5-ff84deb09533	1021210908	Nậm Xe 2	5866	\N	22.515563	103.40619	\N	\N
8ceafbf8-d552-40f4-ab18-9d0dda2d3850	1021210909	Nậm Xe 1	5866	\N	22.493056	103.429722	\N	\N
6645f43c-5c81-403e-83dd-cd6640a40b1b	1021210911	Nậm Xe 3	5866	\N	22.557778	103.42	\N	\N
31e3fd59-6a9f-48a2-8a13-42862a13757d	870094	Nậm Xe	5866	\N	22.51537	103.40701	\N	\N
6191a64c-a9cf-4691-a682-02818440a2de	526201	Mường Mít (Than Uyên, Lai Châu)	5923	\N	22.025833129882812	103.85277557373047	\N	\N
c23a62cc-5411-4699-9d19-84f67f0c8a49	1021211001	Phu Nậm Sap	5924	\N	21.983889	103.906111	\N	\N
7e6ae62c-ba31-4a30-8e2e-72182894a1f3	260133	Pha Mu (Than Uyên, Lai Châu)	5925	\N	21.89638900756836	103.74444580078125	\N	\N
aef2a552-344d-4638-9f74-dd5a6f81b55a	1021211008	Phúc Than	5926	\N	22.016927	103.919122	\N	\N
f8650ad3-f14c-4b76-a70a-c96a2489696b	260134	Ta Gia (Than Uyên, Lai Châu)	5927	\N	21.78583335876465	103.82333374023438	\N	\N
7bf30136-7f6d-438e-9e2a-52565bc7b196	1021211003	Tà Gia 2	5927	\N	21.829722	103.830833	\N	\N
d84dea3c-ad63-4f6c-b4be-2e807820b885	260132	Tà Hừa (Than Uyên, Lai Châu)	5928	\N	21.818056106567383	103.73833465576172	\N	\N
b8bfd593-5203-4f7d-97be-161f28bf4dc7	1021211002	Tà Hừa	5928	\N	21.846551	103.775636	\N	\N
1164d7a0-b9a1-433c-9d1c-927cdccee01a	260135	Tà Mung (Than Uyên, Lai Châu)	5929	\N	21.800277709960938	103.91860961914062	\N	\N
1a8cc831-5e23-44b0-b25e-eec5b0bfe654	1023839002	Cẩm Liên 1	9717	\N	20.221931	105.370786	\N	\N
79659f1e-3a8b-4295-af7e-8d9aa36b3fc1	1023839001	Cẩm Liên 2	9717	\N	20.207285	105.337024	\N	\N
90fca242-ea3c-42f7-a015-8e0c8ea8c088	095177	Cẩm Lương	9719	\N	20.241389	105.388611	\N	\N
e4db97f3-4f33-4f0d-95a9-8e9a38cdfcd9	360009	Hồ Bồ Kết (xã Cẩm Tân, Cẩm Thủy)	9725	\N	20.095556	105.509444	\N	\N
9ffe39c0-8c86-4a77-b38c-51bf778ccb7f	957055	Sơn Tây	4726	\N	18.48663	105.330614	\N	\N
ef4e2aec-da42-4371-b3de-bf3c2f8e5aba	486002	Hồ Kẻ Gỗ	4726	\N	18.482222	105.3225	\N	\N
110e5588-c03a-4d84-81f0-ae6bdd389bba	1024243904	Sơn Thủy	4728	\N	18.488862	105.483408	\N	\N
9698661b-7558-4802-bd0f-151dba413047	1024244703	Kỳ Khang	4740	\N	18.159838	106.265785	\N	\N
207d5d04-ce4b-4e5a-be6f-2f1b4329ec57	1024042002	Châu Cường	6936	\N	19.347	105.12106	\N	\N
6b13f3b3-001e-4b0a-a84e-81b1d4f7d450	1024042001	Châu Lộc	6939	\N	19.37093	105.22417	\N	\N
febeeeeb-9a27-4a67-a499-f66f0ca37039	59637	Sơn Nam (Châu Lý)	6940	\N	19.245345	105.13473	\N	\N
fe40d8a7-16b0-49a5-8731-8e05958a4bef	1024042006	Châu Lý	6940	\N	19.21842	105.12161	\N	\N
fbf50cb9-a130-4b40-820e-3ef17ba073c0	1024042007	Châu Quang	6941	\N	19.33386	105.16788	\N	\N
bce38c88-bd54-4b71-a199-f0fbf9fa288f	1024042004	Châu Thái	6942	\N	19.30686	105.14788	\N	\N
f28eb086-ec8b-4f7f-ac00-8a7e80ef9f4c	1024042003	Châu Thành	6943	\N	19.39459	105.04698	\N	\N
b1c61eab-0e40-47c1-98f5-bd67cc0cb318	264504	Tam Hợp	6952	\N	19.36235	105.264115	\N	\N
02ba739b-1081-486b-81dd-4f4aa3d2ce44	360005	Hồ Khe Tiên (xã Hà Đông, Hà Trung)	9779	\N	19.995997	105.801955	\N	\N
10d22394-81a2-4259-9735-677aa0e78f99	680001	An Thới	5448	\N	10.018482	104.0149	\N	\N
15c6cd7f-85c8-4b83-8d0b-0645ac5cbca2	680003	Bãi Thơm	5449	\N	10.411765	104.031055	\N	\N
b694fd4d-57fc-47a7-96a5-156b3f3ac660	680002	Cửa Cạn	5450	\N	10.292693	103.914799	\N	\N
a4f73fb4-bd02-4e15-a458-d3a1e63564c5	053990	Tân Hóa	7826	\N	17.788952	106.094498	\N	\N
884c8aa2-0ba7-4f98-8b32-a7ae6d5c531b	730027	Tú Làn Lodge	7826	\N	17.769413	106.050787	\N	\N
6660d848-7fc4-4d8f-b0a0-d5b79ea10952	940008	Phó Sinh	211	\N	9.37286	105.39113	\N	\N
053b4348-a042-42ab-9806-cb2299bae106	730026	Trung Hóa	7829	\N	17.739167	105.961667	\N	\N
c04fb913-2286-469a-b8ef-f06f37d626cf	1026261203	Văn Lem 1	5526	\N	14.735389	107.882861	\N	\N
1dd3aa15-1d64-4400-86f5-2848e44a515f	820008	Ia Đal	5527	\N	14.142778	107.420556	\N	\N
91493d88-44bd-49a7-85de-ffc41ee00380	029936	Ia Dom	5528	\N	14.170181	107.459328	\N	\N
5ebd7234-eec6-4133-b6cd-3eaa249ecdab	1021412008	Hua Trai	8825	\N	21.637514	103.97522	\N	\N
59a17e3c-78bc-4a0c-ba10-f2fc1cbcf938	129145	Sông Luồng	10021	\N	20.379687	105.107424	\N	\N
faa06761-a9a7-493f-b46c-2ce5a151d22c	095183	Lương Sơn	10189	\N	19.966325	105.277174	\N	\N
8d3d3280-d33d-4449-892b-3043fdc5c5fd	1023838801	Đồng Lương	9844	\N	20.175	105.241452	\N	\N
7868f342-b864-4db3-88e0-bb6baffd027f	021475	Yên Khương	9847	\N	20.238847	105.085335	\N	\N
6e1e70d5-5919-40c8-a198-c22653e70ed7	360015	Hồ Lâm Danh (xã Lâm Phú, Lang Chánh)	9847	\N	20.265278	105.047778	\N	\N
48f6abfd-8a69-41d5-a3a2-453e61333801	490056	Phường 5 - Đà Lạt	6010	\N	11.94256	108.426028	\N	\N
22e567b9-9f40-4a69-94b2-c3ff77f5cd9a	920001	Tiên Lãnh	8139	\N	15.458333	108.171944	\N	\N
4ce57a51-8b7b-4f36-a0a1-c42c07777ef0	228926	Tiên Phong	8142	\N	15.521389	108.356667	\N	\N
9d8f98ef-c26b-403b-8a24-6b661693a477	501833	Ba Vinh	8163	\N	14.8327207	108.7047869	\N	\N
dbe5e59c-7028-461b-b802-9b3236baf04c	760071	Ba Xa	8164	\N	14.676808	108.558187	\N	\N
f5fe7a24-96e3-4772-ac99-8fc0b9fc56cd	014692	Bình An	8165	\N	15.3223442	108.5878366	\N	\N
71cdce8e-408d-4b9b-80e1-c61dec9ef4e3	485806	Bình Khương	8174	\N	15.313611	108.686944	\N	\N
af6d5ab8-3039-483e-bef3-ffd26c5feb1b	760012	Bình Phước	8180	\N	15.319229	108.802091	\N	\N
0dc4e758-2a51-48f7-90b0-6131b2799cc8	760053	Hồ Cây Sanh	8192	\N	14.641389	109.051389	\N	\N
961bfa51-72d6-4641-a0cf-e957a6d1ac34	760030	Đầu mối HCN Diên Trường	8195	\N	14.71347	109.022807	\N	\N
12857890-9a30-4da4-9ec6-c5fba0f1cf7b	760002	Lưu vực hồ Diên Trường	8195	\N	14.705	109.012778	\N	\N
0cb25686-17c7-41b6-965f-33aa74f894e6	985849	Phổ Phong	8199	\N	14.864444	108.890278	\N	\N
136bd841-a7b4-4a58-ade4-27c1572db17d	760051	Hồ Hóc Cài	8233	\N	14.97	108.764444	\N	\N
b35b9056-7248-47a1-a62a-6c316a958ebf	760056	Hồ Suối Chí	8235	\N	14.871111	108.804444	\N	\N
47152fa8-5199-45a2-8832-e8ab69cd885e	830001	Xuân Hòa	8685	\N	9.894653	105.880323	\N	\N
9305f9fb-7056-4269-a042-d2bdd446740b	095178	Vườn Quốc gia Bến En	9916	\N	19.619117	105.541052	\N	\N
0f63aded-b1ba-4532-b363-1caf4fea4673	650007	Thạnh An	1511	\N	10.222555	105.315678	\N	\N
734e1416-6ce6-4ec9-96c9-c753ae8a4208	180010	Hải Đường	6464	\N	20.161406	106.248396	\N	\N
b1c936e3-b818-4b62-b463-5d357eee16b8	1023840202	Xuân Quỳ 1	9934	\N	19.641315	105.409763	\N	\N
2c97e8a0-adc9-42b8-a29d-12b2a4c251c0	1021210703	Pa Vệ Sử 4	5839	\N	22.514167	102.855556	\N	\N
39ef9ee8-5026-47b4-9008-38afb5a0a070	1021210704	Pa Vệ Sử 3	5839	\N	22.446124	102.846139	\N	\N
916e1538-e046-46bf-babb-032b7c4a7e43	1021210702	Pa Vệ Sử 2	5839	\N	22.476667	102.846389	\N	\N
444f2e58-70c3-411e-b07b-7969b8d3ee66	260114	Cao Chải (Mường Tè, Lai Châu)	5841	\N	22.297134399414062	102.62737274169922	\N	\N
cb829ebe-a184-4e9f-b799-997418273ff1	1021210713	Tà Tổng 2	5841	\N	22.3675	102.619444	\N	\N
973d8b2e-6d8b-4aa0-909d-85792b84fc51	976416	Tà Tổng	5841	\N	22.381588	102.650836	\N	\N
a4d68242-6f4b-4beb-b255-642112cfc5d8	465732	Nậm Ban (Sìn Hồ, Lai Châu)	5847	\N	22.393770217895508	103.12396240234375	\N	\N
ad74375b-7dbb-4ba1-ada0-8a64074d006f	1021211209	Nậm Ban	5847	\N	22.40152	103.076488	\N	\N
2b3f52b2-bc3b-4ea4-be79-de2968e8039a	260116	Nậm Chà (Nậm Nhùn, Lai Châu)	5848	\N	22.11805534362793	102.81305694580078	\N	\N
b58d69e3-49cd-4855-bfb2-64ceda6a6817	1021211202	Mường Mô 2	5848	\N	22.173287	102.909264	\N	\N
85ff0fec-ee8d-4955-a9bb-20bb998d6a64	531519	Nậm Hàng 1 (Nậm Nhùn, Lai Châu)	5849	\N	22.216388702392578	102.99055480957031	\N	\N
bf6cfe93-0277-46d3-851b-ab9df73496dd	1021211204	Nậm Hàng 2	5849	\N	22.155833	103.038056	\N	\N
e92dc729-3732-40ef-9348-4417b15dc38b	931794	Nậm Hàng 2 (Nậm Nhùn, Lai Châu)	5849	\N	22.11750030517578	103.07694244384766	\N	\N
20357767-3b28-46ab-902e-f30e309a3d5a	1021211207	Nậm Manh	5850	\N	22.113855	103.01705	\N	\N
fb2c32ce-1526-4956-944c-f57c3168a842	1021210602	Bình Lư 2	5898	\N	22.300278	103.619722	\N	\N
731056bf-d1f7-40a7-a27e-ef1b13fe518a	574233	Bình Lư	5898	\N	22.317365	103.646967	\N	\N
063548c2-756d-4e98-b34f-1427d4c0f0aa	1021210607	Bình Lư 3	5898	\N	22.342426	103.662613	\N	\N
dda056e8-133b-4400-9461-b6fec2c9e611	796031	Mang Yang	2665	\N	13.995891	108.111709	\N	\N
edfd0055-d994-49dd-8814-b87fffab5260	1023840203	Xuân Bình	9943	\N	19.466227	105.482935	\N	\N
8e9645f9-2b4f-4327-9562-db2c56dc773f	360019	Yên Cát	9947	\N	19.681944	105.428611	\N	\N
f705c106-8bfc-46c8-b62c-660f0d968e8d	260128	Nậm Cần (Tân Uyên, Lai Châu)	5911	\N	22.092777252197266	103.68472290039062	\N	\N
ab4c77f3-c198-4786-b467-825d60b5f2ec	1021211104	Nậm Cần	5911	\N	22.143388	103.721164	\N	\N
01bfd631-b438-4f57-8234-1004527a8b43	48031	Nậm Sỏ (Tân Uyên, Lai Châu)	5912	\N	22.07666778564453	103.6227798461914	\N	\N
6162ea31-c92b-4876-b3c5-acd91d8097e4	1021211103	Nậm Sỏ 2	5912	\N	22.118333	103.553611	\N	\N
3b4ac5b1-8a4e-43a1-ad01-f5d0d7caefbd	093920	Thăng Thọ	9965	\N	19.582762	105.654981	\N	\N
bbb3c252-f073-41d1-bddf-78c1d057ca54	635418	Đạ K'Nàng - Đam Rông	6019	\N	11.885833	108.125278	\N	\N
5417516b-ad3b-4ecd-bc7d-e4f01b40bee4	1026867401	Đạ Long	6020	\N	12.143611	108.278056	\N	\N
d32c6c2a-965d-414f-92d3-d015bcbd64b9	1026867402	Đạ Tông 2	6021	\N	12.139722	108.243056	\N	\N
cd602da3-0609-4fe1-a142-0cae291c30ba	445313	Đam Rông	6021	\N	12.16816	108.234464	\N	\N
f135bff9-8a17-4075-852e-af59076ee647	490038	Đạ Tông - Đam Rông	6023	\N	12.151111	108.257222	\N	\N
ea69441a-bbe8-4f6e-bfd3-078b17ed581f	490055	Rô Men - Đam Rông	6026	\N	12.08845	108.192497	\N	\N
78a5ec9a-fdbf-4b66-bf86-40df5c1ff6c9	1026867901	Bảo Thuận 2	6027	\N	11.579722	108.116111	\N	\N
9343fe12-ff56-4794-a818-ec40b898f6b3	490041	Bảo Thuận - Di Linh	6027	\N	11.568056	108.101944	\N	\N
da7f4a11-8f99-4b7a-b365-8c4dae2e6ae0	52934	Di Linh	6028	\N	11.587739	108.077434	\N	\N
b59416d3-a322-42cd-a0ee-8eed78c59ec8	490006	Di Linh	6028	\N	11.594389915466309	108.07482147216797	\N	\N
9f155337-756f-4ea2-a39f-94df6d1d7d14	1020404902	Đại Sơn	1739	\N	22.5566015	106.5473303	\N	\N
4eb4bae4-df1a-41b8-bfdb-b70f5760e5eb	1020404901	Cách Linh	1739	\N	22.5802002	106.5399985	\N	\N
9487ed35-f67e-4988-931d-8cc59e7ca7ad	642513	Cách Linh	1739	\N	22.580144	106.542276	\N	\N
c990b451-4ef6-4b5d-83d6-d3535883bb23	1021412612	Yên Hưng	8911	\N	21.167572	103.581581	\N	\N
dc572984-b25a-48eb-ad89-ede16852ff84	1021411901	Bản Lầm	8912	\N	21.278056	103.806111	\N	\N
13cea235-ce0e-47e3-8b3a-fa575c096f18	1021411917	Bó Mười	8913	\N	21.45322	103.84416	\N	\N
af84fa1b-9a30-487b-a356-21a4edf51a99	813060	Bó Mười	8913	\N	21.452906	103.844183	\N	\N
de8f0f41-c10d-49b6-a851-fc999194f9cc	226709	Bon Phặng	8914	\N	21.38802	103.77397	\N	\N
23aaff9e-7a46-4d0d-86d6-5684e189eb47	1021411909	Chiềng Bôm	8915	\N	21.46324	103.62387	\N	\N
ea54e2f2-ebc6-4f91-a91f-bc5cddda7e1e	226708	Chiềng Bôm	8915	\N	21.42961	103.65018	\N	\N
90e35c5d-fd66-4961-8c43-8572ba190e53	260123	Tủa Sín Chải (Sìn Hồ, Lai Châu)	5894	\N	22.15416717529297	103.26333618164062	\N	\N
3a0e585e-104d-48b1-9f09-4d465c4744cd	1021210601	Bản Bo	5895	\N	22.272222	103.692222	\N	\N
d3ab95bc-512c-4102-a585-c082cb6ed79c	1023838503	Phú Lệ 2	10016	\N	20.529881	105.077958	\N	\N
8bf5f848-82f6-48d3-a555-5d2d79a1cd8b	1023838502	Phú Lệ 1	10016	\N	20.53927	105.039316	\N	\N
dd4e5f14-68d1-4a38-8e53-17f4f09ba2ce	1021211106	Trung Đồng 1	5918	\N	22.147989	103.813065	\N	\N
eb39ea41-3b3a-417d-8e03-429302708ecc	1021211105	Trung Đồng 2	5918	\N	22.125101	103.798295	\N	\N
505f385b-814a-400d-b458-b7b55380f570	1023838501	Phú Xuân	10020	\N	20.498578	105.033808	\N	\N
d1ef7dbc-3e12-484a-af2f-6ee3c8488176	692471	Quan Sơn	10030	\N	20.253611	104.948056	\N	\N
d333cf35-a89c-4616-91e6-ae84772cb09f	1023839101	Thành Hưng	10066	\N	20.122046	105.652152	\N	\N
3103a2eb-647d-45b3-9d7e-952f8a16e83b	743701	Lạng Giang	284	\N	21.355279	106.259116	\N	\N
aaccb5b0-799f-4764-b40d-9f78528b5a9a	360014	Chi cục thủy lợi Thanh Hóa	10140	\N	19.806708	105.783348	\N	\N
1abd6610-065f-4d3f-a7c5-fd4281adc078	1023839801	Thiệu Hợp	10165	\N	19.894435	105.725952	\N	\N
88931827-27bb-4218-a9f8-c19e79d4da21	635347	Ia Rsai	2747	\N	13.348611	108.614167	\N	\N
35c70785-b408-4a7e-a57c-702d154cdde6	877355	Xuân Lộc	10200	\N	19.781944	105.293056	\N	\N
ffe9e4ad-1a8f-4029-92ed-3157be6c5dbc	360013	Hồ Tà Xằng (xã Xuân Thắng, Thường Xuân)	10201	\N	19.745833	105.328333	\N	\N
0a8e0ece-d087-49f2-9e19-25d20b628403	236549	KBang	2715	\N	14.138454	108.602832	\N	\N
a9ada1f5-23ca-4ca9-8fc1-b5c46e78a3e6	750010	Giang Hải (Phú Lộc)	9180	\N	16.366389	107.863056	\N	\N
07173827-d0d7-4aec-9f4f-bf047a671364	360001	Hồ Đồng Chùa (phường Hải Thượng, Tx Nghi Sơn)	10216	\N	19.326334	105.774953	\N	\N
7a727e27-fa8e-4307-a86b-e2d37a3e6a6a	220012	Bằng Cốc	10624	\N	21.973056	105.008611	\N	\N
1e56e427-df5c-4c2e-b68c-65e1ab29701d	095176	Thọ Bình	10255	\N	19.816944	105.496944	\N	\N
0dedeb7c-d21e-497a-9ea9-787a2083471c	360012	Hồ Ngô Công (xã Thọ Sơn, Triệu Sơn)	10260	\N	19.848611	105.492778	\N	\N
15370bf0-85a7-4a6b-8e92-dcd71d28b980	079362	Phú Bình	10609	\N	22.175833	105.347778	\N	\N
f9504020-abe8-4b40-ae8f-5737cd12ce45	220020	Phúc Sơn	10610	\N	22.294722	105.2225	\N	\N
c2349681-87dd-47c2-9ccd-2d9ee12eaa38	220008	Tri Phú	10615	\N	22.065021	105.372543	\N	\N
ef987156-653a-4149-a9f1-dbd9a95b3f26	220006	Trung Hà	10616	\N	22.29729	105.108448	\N	\N
d44279b1-3e3c-4e2c-9cac-ffed35829258	360007	Hồ Đồng Mực (xã Vĩnh Hùng, Vĩnh Lộc)	10276	\N	20.041111	105.673889	\N	\N
cd8b1d20-fd1f-41ae-ab5e-5b2aa6031412	180009	Quang Trung	6517	\N	20.430847	106.174673	\N	\N
f2e1063c-0689-4bfa-8a52-fe742f86464c	046074	Cụm Thủy nông Xuân Hòa	10393	\N	10.337454	106.409988	\N	\N
0e91e60a-34c2-4604-a47f-ab2121491d42	396617	Bảo Sơn	289	\N	21.353937	106.327884	\N	\N
26c72ba8-3572-416d-bdc9-882e13631fb1	185917	Tân Sơn	342	\N	21.54933	106.629993	\N	\N
ae0c3cde-b583-44db-ae10-08abb6e3f87c	354565	Buôn Tăng, Krông Năng	2749	\N	13.062957	108.736422	\N	\N
adab2cf9-6523-49cc-a915-a95adf38860d	1021411601	Chiềng Xôm	8888	\N	21.377608	103.909534	\N	\N
6285cffe-f07a-42c4-8b3a-a5337a07ba85	1021411910	Long Hẹ 2	8925	\N	21.40749	103.56529	\N	\N
238c1d55-76dc-4156-82c7-20ab5df8b614	1021411911	Long Hẹ 1	8925	\N	21.44113	103.54444	\N	\N
ba0c8fd4-51c8-4d1b-a7c0-224824116131	260001	Long Hẹ 1	8925	\N	21.406667	103.503611	\N	\N
0752098d-d115-4211-bbc0-4efe8434546e	260028	Muổi Nọi 1	8926	\N	21.328764	103.823975	\N	\N
01812ea7-35d1-4836-a6b5-ff7537f52efe	1021411919	Mường Bám 1	8927	\N	21.40031	103.36992	\N	\N
e8e929de-2a6d-403d-995f-800e82667678	1021411913	Mường Bám 2	8927	\N	21.3808	103.39866	\N	\N
58da1195-1a78-436e-9f75-09950756f9f8	896510	Mường Bám 1	8927	\N	21.40394	103.38431	\N	\N
78fa4362-7512-4f4e-8a9a-c983420d35d6	1021412802	Quang Minh	8948	\N	20.88401	104.950209	\N	\N
37ee572e-b2fe-44fa-b571-47b28f3994f3	1021514019	Tân Thịnh	11089	\N	21.48706	104.769892	\N	\N
dcb9b4f9-ce76-456f-aea4-cf30edbe5030	334162	Cái Bè	10322	\N	10.342778	106.034444	\N	\N
0c60ef83-4333-4e64-98a8-3b778cf15ed3	860010	Gia An	1417	\N	11.152222	107.622778	\N	\N
f743df62-a88c-4e73-acf1-7ebd5020dd4d	1021412308	Mường Sang 3	8789	\N	20.792011	104.608448	\N	\N
6fd80e67-387c-4846-9714-e353e9285bc6	1021412307	Mường Sang 2	8789	\N	20.834161	104.603951	\N	\N
e4a43ddf-0acc-45ff-94cc-fdebb6762ffa	1021412309	Nà Mường 1	8790	\N	20.949492	104.720178	\N	\N
438c42f1-46d3-474d-8227-6cb48a30a134	1021412306	Hua Păng 2 (Nà Mường 2)	8790	\N	20.936641	104.730637	\N	\N
fb9a12fe-1381-4212-b675-8dfd5b7c336f	600005	Cống Rạch Mương	10474	\N	10.254017	106.663444	\N	\N
79bf5b41-a8c8-4465-b65c-278f1a5fba02	299387	Đức Vân	550	\N	22.447222	106.033056	\N	\N
fc1be69c-aebd-4e7e-8642-362337c408b6	456795	Chợ Gạo	10379	\N	10.354722	106.457222	\N	\N
d2c4ca03-1b83-4196-a97b-1b44053d6a9d	600001	Cống Tân Thuận Bình	10390	\N	10.37865	106.489034	\N	\N
4fbcd84d-6e05-4c4c-9cd7-38101f2a6f0f	1026462901	Đê Ar	2759	\N	13.809444	108.237222	\N	\N
138970b6-8889-4341-bfa8-fb1806d0efac	664182	Đập, Thủy điện Ayun Trung	2759	\N	13.854804	108.212637	\N	\N
615cb234-da0c-404e-8cd6-a51ae3b4d185	860008	Đức Hạnh	1329	\N	11.133889	107.500278	\N	\N
42b6d004-b930-460d-8e34-cda6b6a8931f	760014	Tịnh Đông	8277	\N	15.171385	108.640537	\N	\N
3f7b855e-bc6e-4f5f-b0ba-86855c353396	760060	Hồ Hố Quýt	8284	\N	15.239167	108.739444	\N	\N
ccec9af9-fb43-49d7-a0e7-636a79cf40b6	760061	Hồ Đá Chồng	8284	\N	15.233333	108.724444	\N	\N
0b8840f9-4661-4f62-8bf2-9dc9164cadd8	760007	Tịnh Thọ	8284	\N	15.216702	108.761531	\N	\N
1ae22ce4-44d9-48ab-bfaf-10c54822f504	1026463001	Đắk Song 3	2731	\N	13.665556	108.707222	\N	\N
c4ee0859-45c1-4898-840b-e1e1efefd34e	608315	Đăk Tơ Pang	2732	\N	13.840278	108.600833	\N	\N
ac9a3730-05c8-444c-9be0-f6741e4813d1	1026463004	Kong Chro	2733	\N	13.782778	108.535556	\N	\N
b7b5932c-3080-4e94-a996-765dc5b70891	603128	Yang Nam	2737	\N	13.676667	108.513611	\N	\N
197fff66-6377-4034-951f-9a8f91fcab62	470714	Đập, Thủy điện Đăk Srông 2	2737	\N	13.678782	108.56209	\N	\N
7784f9d8-9df2-4fc6-9be8-f113a0046760	860023	Hồng Phong	1314	\N	11.05006	108.31879	\N	\N
37dac59c-fddd-4f0d-8f84-9ff36a37867f	1021715512	Thanh Hối	5036	\N	20.580278	105.318056	\N	\N
3d8f5882-dee9-40ea-ad90-6f2986a0fd2f	1021715513	Trung Hòa	5037	\N	20.688889	105.213889	\N	\N
e0095e52-f456-4741-bbfe-8ffb2620187d	1021715505	Ngòi Hoa 2	5037	\N	20.708611	105.234167	\N	\N
c0068bde-cd21-46de-aeee-25288b45f349	860021	Phan Tiến	1325	\N	11.26481	108.22109	\N	\N
5ccdbfd7-ae55-4324-aa4e-d8a6051c8f02	860007	Đa Kai	1332	\N	11.273803	107.554558	\N	\N
81a02ebf-2608-4bd4-b45e-513346e7ea98	860018	Hồ Sông Phan	1342	\N	10.853333	107.747778	\N	\N
52479e3a-a06f-4fcf-95e7-705bdb2eb716	045832	Cụm Thủy nông Gò Công	10419	\N	10.384885	106.657271	\N	\N
d613665a-2b75-4c21-9ac3-55eb5280d7cf	1024041603	Châu Hội	6926	\N	19.557667	105.156603	\N	\N
09eb55c8-38db-4e78-9ce3-213a67986349	1024041609	Châu Hoàn	6927	\N	19.46946	104.94851	\N	\N
674e0b4f-5b02-4e76-9ea2-8883736d35f9	055991	Xã Châu Hoàn	6927	\N	19.469167	104.948889	\N	\N
bfe5248d-c47d-4676-8b9a-a0fc3668e8e9	009062	Ea Weel	1826	\N	12.836596034	107.86771698	\N	\N
04e74e69-85bc-4dff-a4f9-fd9bb2e8466e	091961	Đức Xuyên, Krông Nô	2008	\N	12.700278	107.827222	\N	\N
4cfc558c-0468-43e9-9e35-0bccd464fd2f	860020	Dân Hiệp	1366	\N	11.21656	108.14857	\N	\N
1dff9dbf-5ed1-4c8d-ad95-e7ed6906275f	860019	Ku Kê	1367	\N	11.08257	108.07297	\N	\N
324f12e8-8e78-4ff3-88d2-773727d1610f	860001	Hàm Cần	1368	\N	11.017083	107.938598	\N	\N
243cdbc5-b963-41e4-ab94-9aec83f40f2a	860002	Tân Lập	1376	\N	10.843611	107.819444	\N	\N
c5e30fb6-321d-47d3-8c6f-35046ae63fda	860005	Tân Phước	1387	\N	10.652481	107.72124	\N	\N
78dbea76-79cc-45ea-8106-c92929100eab	860003	Tân Tiến	1389	\N	10.710278	107.827778	\N	\N
8489bd1a-aac2-4440-ab69-318a93e906c5	1021715509	Quyết Chiến	5034	\N	20.587222	105.188056	\N	\N
44d22648-103c-4dad-91e3-372359484f7e	1026766303	Đức Mạnh 2	2020	\N	12.458412	107.658473	\N	\N
44e847b9-3c86-4844-9e72-905a98e30cc3	1021715805	Lạc Sỹ 2	5046	\N	20.524722	105.548611	\N	\N
e44cd8ff-2f35-4e32-9648-330b809dc607	009162	Đoàn Kết	5050	\N	20.403159	105.617869	\N	\N
751a26d1-7bd1-4e14-8e58-7779ab21d5c4	760013	Trà Thủy	8312	\N	15.262222	108.506389	\N	\N
4b68853f-8768-4789-ab9a-9120ff18433d	045841	Cụm Thủy Nông Long Uông	10433	\N	10.310833	106.711111	\N	\N
187734c7-8082-4357-83e4-aaa0da24ef92	473942	Nghĩa Trung	8327	\N	15.077778	108.814444	\N	\N
3eed087d-972d-4e3a-b461-1fba7b63015e	940007	Ninh Thạnh Lợi	195	\N	9.491111	105.353611	\N	\N
211f8655-447f-49f7-aeee-e8b7012832be	860012	Bắc Ruộng	1411	\N	11.204722	107.704167	\N	\N
c9efb1cc-2dcf-4d7a-b9e8-5293bcdc1a98	630002	VP CN TN Gò Công	10442	\N	10.362188	106.58131	\N	\N
c4b897b8-a494-4e12-a51f-f326c59bcae1	860013	Đức Thuận	1416	\N	11.083333	107.696389	\N	\N
5c2a3607-06b6-41a9-90c6-7d458ac823a6	752648	Thủ Đức	3684	\N	10.844789	106.755827	\N	\N
7018c269-82d4-4e1a-bbd6-b65e445116a4	484480	Xuân Hương	285	\N	21.31721	106.204218	\N	\N
0ad2fd98-5f46-494e-8e3b-4bf19645e09e	140048	Mai Sưu	311	\N	21.242921	106.567999	\N	\N
4a7f0506-51f0-42c5-9545-d86504fe07aa	463112	Phong Minh	322	\N	21.388889	106.651944	\N	\N
2b45cf04-a2ea-407a-af4f-d848f4ba2bf4	979054	Khuôn Thần	325	\N	21.425559	106.52026	\N	\N
f27c5c53-4c9b-48f8-a230-55ce0b049299	1021412310	Phiêng Luông	8792	\N	20.824492	104.748736	\N	\N
b8db9b35-f085-4094-862d-a0249160fd8d	1021412001	Chiềng Hoa 2	8821	\N	21.401332	104.141647	\N	\N
0481cb88-cb4f-4070-b2e8-e4cf552b0ffb	766254	Hòa Mục	513	\N	22.049815	105.842648	\N	\N
573f08ea-8ee0-4458-b8fb-b82cfa96fc57	951684	Đổng Xá	530	\N	22.035833	106.011389	\N	\N
e99dc108-2463-4fa4-9cc6-2fcb9f18d870	298731	Hảo Nghĩa	532	\N	22.113864	106.107535	\N	\N
832a0845-41e3-4c9f-84b7-930fa2d0bd06	1020606603	Lương Thượng	541	\N	22.260839	106.083029	\N	\N
1378b3c3-7806-4c98-b5bc-dbb0a56f3edb	951738	Lương Thượng	541	\N	22.265153	106.076979	\N	\N
7eadfd5c-2efd-461f-9549-dd07e858efad	046091	Cụm Thủy nông Vàm Giồng	10453	\N	10.300775	106.549167	\N	\N
e7538c53-2d50-4f61-a2c9-c9c0fe6c09c5	715534	Bằng Thành	560	\N	22.680677	105.723854	\N	\N
d95ebeea-7cac-4520-ac01-89435c702793	173854	Cao Tân	563	\N	22.515278	105.6475	\N	\N
e1d18d2e-defa-47d7-a85c-bedc35654da9	1020606006	Công Bằng	564	\N	22.599078	105.587717	\N	\N
fa18ec57-60ce-42c9-abf9-b8ef0796f384	1020606001	Nghiên Loan 2	566	\N	22.508611	105.725556	\N	\N
65b11aa0-8976-4119-88ce-54338d7799a3	950485	Dương Quang	570	\N	22.154722	105.822778	\N	\N
0dbd4758-5839-4871-a8b5-8160d0e2548e	1021412009	Mường Trai	8829	\N	21.57917	103.970715	\N	\N
d5009216-b446-45eb-892a-fbb7b00e86ed	589954	Nậm Giôn (Mường La, Sơn La)	8830	\N	21.675188064575195	103.80453491210938	\N	\N
89d5e183-a390-4b6b-88bd-5a00b6adf0ed	350721	Nậm Păm (Nậm Păm, Mường La)	8831	\N	21.566944122314453	104.06805419921875	\N	\N
637253bc-9dac-422f-86b5-be2bda75a790	1021412005	Nậm Păm	8831	\N	21.594722	104.116667	\N	\N
78cadae1-7264-4219-9611-b70bf7e35cf9	1021412007	Ngọc Chiến 1	8832	\N	21.628889	104.213611	\N	\N
3785f839-8dcc-4d70-8da1-dc76f64df14b	1021412006	Ngọc Chiến 3	8832	\N	21.655327	104.266385	\N	\N
006a6a7e-28e3-4d88-90b4-9e0638a085a7	139063	Thủy điện Nậm Chiến	8832	\N	21.59256	104.14285	\N	\N
1eab8a04-dfa6-4f97-9800-364b2f1771d7	228861	Ngọc Chiến	8832	\N	21.629444	104.214722	\N	\N
dcce3951-ed3f-4888-9151-f335c9a53cc7	260012	Pú Dảnh	8832	\N	21.631	104.298	\N	\N
73676ee1-b0bd-4ef5-9d26-e7d0f2252837	1021412205	Mường Bang 2	8844	\N	21.144167	104.748056	\N	\N
100d116a-2717-4dbd-a300-a9cd8965584e	543032	Mường Bang	8844	\N	21.139601	104.777196	\N	\N
59400e53-2d1f-49d5-b822-5fe47596fd00	1021412206	Mường Do 1	8846	\N	21.199167	104.766111	\N	\N
5e4b9cd1-24a1-437d-81f7-9af4ba137095	1021412207	Mường Do 2	8846	\N	21.22	104.745833	\N	\N
8ab355ad-19be-49cc-ad39-ec8bb13a4378	573731	Mường Thải	8848	\N	21.31361	104.69227	\N	\N
769e9eb0-1a16-4cbd-aaee-1ca85fd5a164	1021412208	Quang Huy	8851	\N	21.281111	104.663889	\N	\N
9ffd1a57-3e10-45b8-8bef-1ea40d504ff7	856318	Sập Xa	8852	\N	21.156389	104.520278	\N	\N
c00ef7e8-da77-4f34-a074-e4b4e907dd66	1021412209	Suối Bau	8853	\N	21.184444	104.571389	\N	\N
d9fcba47-a483-4c8d-9e13-b1ffcec6de00	962874	Phú Mỹ	10481	\N	10.541328	106.331166	\N	\N
6f74b0ce-c851-46aa-8df5-8fdfc8c11127	1020404703	Chí Viễn 1	1804	\N	22.82187	106.624537	\N	\N
a95e96c8-ea8e-49a7-b942-ea011870cdbe	110017	Đàm Thủy	1806	\N	22.859157	106.696683	\N	\N
3261bd01-0791-4f48-b56b-9a21844fb94b	971817	Gia Lương	620	\N	21.019268	106.203071	\N	\N
fda626be-33cf-44e7-adb1-1beec1207d5a	354578	Thăng Phước	8001	\N	15.568889	108.150278	\N	\N
0203fa24-679a-4dd0-a494-74efb0192305	012061A4	Ben Giang	8002	\N	15.68924331665039	107.77186584472656	\N	\N
86ff538d-44a3-437b-9942-c728645c2738	332867	Tiểu Cần	10569	\N	9.821811	106.197092	\N	\N
9f76958c-8704-4332-96d6-3bb5251a1665	341261	NTQĐ.U Minh	1607	\N	9.136587	104.897263	\N	\N
397729b9-ba71-4ad1-a678-57d15bf9acdc	950018	Vĩnh Trung	3361	\N	9.78941	105.56088	\N	\N
b3a497ab-87b7-40a4-81d8-2b2f3aed73ff	969227	Nà Ràng	1688	\N	22.828105	106.137467	\N	\N
dafa9253-2022-4d24-a54e-7537097e7cb7	1020404501	Quý Quân	1689	\N	22.8843956	106.0190324	\N	\N
8f956802-58db-4b05-8320-9690293ffebb	1020404502	Sóc Hà	1691	\N	22.917895	106.0075335	\N	\N
c7bfc760-ca87-46b5-bde1-18e980b7ef5a	1020404503	Tổng Cọt	1692	\N	22.8960977	106.2248477	\N	\N
2555f9e0-66ff-46ed-aca8-be506aa3ac8f	1020404505	Trường Hà 	1694	\N	22.9577824	106.042008	\N	\N
346ec5f1-c8b8-44b4-b002-f155e9e9025f	784912	Án Lại	1714	\N	22.715914	106.328356	\N	\N
a4283e5c-47ad-4cbd-b8c0-212f0c4fa135	1020404905	Tà Lùng 1	1744	\N	22.4915447	106.5626635	\N	\N
c08caa49-9e0f-4045-9ffe-6769cefad5ca	1020404907	Tiên Thành	1746	\N	22.534081	106.4429995	\N	\N
e7d5008e-8bc5-4182-ba81-3ccdf2a84555	631423	Phi Hải	1758	\N	22.735278	106.4075	\N	\N
63e12f9a-9ad6-4797-98b6-81f86ca35755	1020404903	Hạnh Phúc	1753	\N	22.5998929	106.4361101	\N	\N
a660a8d6-1ec0-4447-9b4d-494e0a2b648f	1020404904	Hồng Định (Hạnh Phúc)	1754	\N	22.6285095	106.4538825	\N	\N
34460aeb-90d3-42f1-b28f-8edd574fc535	709838	Trà Cú	10586	\N	9.695164	106.259079	\N	\N
b237d70a-65ce-49ea-af10-434f37291245	220016	Minh Khương	10630	\N	22.225968	104.96997	\N	\N
9412e09f-f219-4038-8f74-7c5a1f5df33e	079367	Hồng Thái	10651	\N	22.521667	105.564167	\N	\N
521c766f-db34-47c0-a749-e2ec711fe591	220004	Chi Thiết	10663	\N	21.58574	105.301741	\N	\N
46853135-b7db-48a3-9055-8639493a6066	228865	Đông Lợi	10666	\N	21.576111	105.318056	\N	\N
d8d9d1a8-efaf-4f4b-b5cc-7ddc1b2462c9	220669	Ninh Lai	10676	\N	21.542222	105.494722	\N	\N
65673f0b-ff2b-494b-a1f9-1f88bc89ee41	940014	Phường 8	166	\N	9.295833	105.706944	\N	\N
9374cda3-30c0-45ba-989f-4248e1d3bcc4	226657	Hoàng Khai	10712	\N	21.761111	105.188889	\N	\N
8ea1b47f-25a2-4f5b-8618-bb362c92fbb1	220015	Phúc Ninh	10724	\N	21.936667	105.181944	\N	\N
6b7e0ced-7eea-4a00-a41b-3b9170ac2576	470020	Ea Nuôl	1825	\N	12.694722	107.960833	\N	\N
b92f547a-ace1-425e-b08c-afc513d2d8bb	220014	Hồ Ngòi Là	10734	\N	21.814722	105.159444	\N	\N
f9ddedfa-c5fe-435a-9f58-e2eef5761884	470015	Dray Bhăng	1851	\N	12.561667	108.163611	\N	\N
8ceed05b-8822-4533-aee4-ac3afff9d190	009151	Ea Kiết	1864	\N	12.940811002	108.02084798	\N	\N
29c2aed3-032c-43e7-aeb5-435336dd1c24	470017	Ea Pôk	1869	\N	12.778889	108.071667	\N	\N
a1b6fe1b-c9c1-406a-88d6-888fc4feb89b	470011	Ea Tar	1870	\N	12.924219	108.095029	\N	\N
38fee132-2d1c-43ec-b65a-3ceefb77f9e1	009073	Ea Tul	1871	\N	12.878288961	108.16825096	\N	\N
dc6cc2eb-19ce-408f-9fb6-c1cd27bbf0d5	319225	Hải An	8569	\N	16.777313	107.330052	\N	\N
a2c5b765-dc20-4f46-8df2-a33af1c6d8a3	574934	Hồ Suối Hành, lưu vực Măng Hạnh	7294	\N	11.910278	109.03	\N	\N
4e8f0bcd-ebfe-4b1d-8839-218af48058ef	850003	Phước Thành	7294	\N	11.861389	108.981667	\N	\N
4de13b4c-78a1-47b2-a030-e8ad3e2edbdd	0020624A	Ninh Thuan - Bac Ai - Trung tam Tang Truong Xanh	7295	\N	11.811105728149414	108.8032455444336	\N	\N
226e7ef0-dcd4-4e84-a108-13908f253dd9	1021715507	Phú Cường	5030	\N	20.649167	105.157778	\N	\N
8b7b093f-0afd-487d-8249-d6e4f343b311	470009	Ea Sô	1900	\N	12.896389	108.54	\N	\N
27a716b3-be6d-4a92-8869-3865907b8c90	003648	Xuân Phú	1902	\N	12.843785025	108.43000195	\N	\N
5ffa1344-8214-4ea3-b126-48afb9c10166	470003	Cư Kbang	1903	\N	13.16542	107.899005	\N	\N
916eac77-3a93-448c-98dc-35a634d0b7bd	009057	Ea Rốk	1907	\N	13.196866996	107.814726	\N	\N
e6fc9281-83ce-4dfe-97b5-ae6dca4415ef	381906	EaSúp	1908	\N	13.076389	107.88	\N	\N
a93fe887-8f02-4dc1-ab85-a3d6a551fa3a	353107	Ia Lốp	1910	\N	13.321694	107.697639	\N	\N
ece37a7e-2356-479e-9de9-275b3efe5645	036608	Cư Króa	1981	\N	12.723367	108.793156	\N	\N
0eccb7b1-3de0-4788-810e-7b6712351ed0	476632	Cư Prao	1983	\N	12.9	108.683889	\N	\N
8d05249f-da10-4bca-a581-049cefda145e	003403	Cư Prao	1983	\N	12.900278	108.683889	\N	\N
29b257fa-38bd-4839-b676-a48fd4330d37	003570	Cư San	1984	\N	12.558717001	108.73242001	\N	\N
5441eebb-8624-479c-82c3-d7b91dcd42af	470007	Ea H'MLay	1985	\N	12.813333	108.801111	\N	\N
0f117201-6dbb-4e28-b54e-358a3c9856f6	036605	Thôn 10 Xã Ea M'Đoal	1987	\N	12.791422	108.929139	\N	\N
8b28f4ab-7c64-44bf-a10d-19b12c555f66	036606	Xã Ea M'doan	1987	\N	12.765636	108.889556	\N	\N
a87bcccd-fd97-4b76-88c0-ea7fa5808916	014627	Ea T'ling, Cư Jút	2050	\N	12.155131967	107.87246701	\N	\N
6e341a5b-e9b4-4fb1-aec7-9e9d0ccd8854	645801	Đăk R'Moan, Gia Nghĩa	2052	\N	12.004444	107.643611	\N	\N
245dfcc3-bfee-4ba5-b095-39a352e7a131	1020405203	Thịnh Vượng	1732	\N	22.5708067	106.1400349	\N	\N
a8dbc7b4-b564-4947-94fb-d9da9abf9332	480003	Trúc Sơn, Cư Jút	2013	\N	12.5803	107.852657	\N	\N
7e89e9db-5618-4c6a-ab49-f33cded92993	657326	Đập, thủy điện Đăk Sin 1	2028	\N	11.818611	107.458889	\N	\N
04ae1abe-442a-4345-9cc4-6d95bc70bc29	850015	Vĩnh Hải	7304	\N	11.664444	109.170833	\N	\N
353002b2-7c7e-4f9e-90fb-d7251125f4b0	850008	Phước Vinh	7314	\N	11.613611	108.871944	\N	\N
72c07429-c26d-4f32-b0f6-1fe994300f22	359860	Hòa Sơn 4	7315	\N	11.712853	108.767238	\N	\N
68084d10-ee38-4d11-871f-1e4db0a3b9cd	793583	S.Pha Km72	7316	\N	11.828409	108.696562	\N	\N
e076fafa-383b-4d9c-b65e-e713cae682a9	850001	Thủy điện Đa Nhim	7316	\N	11.836111	108.680833	\N	\N
179b9ee4-d9cc-495b-94f3-ef1f8cc2e745	844369	Thanh Sơn	2132	\N	11.233333	107.298056	\N	\N
385529e7-5f44-4cd5-ada7-e2bebc6a14af	596187	Túc Trưng	2133	\N	11.090833	107.2075	\N	\N
c690cf06-8685-4899-8f5a-67dc3919b56e	350094	Vĩnh Long	10797	\N	10.109609	105.902715	\N	\N
bcd72190-e10c-4d0f-ad29-9a15cc06d1c3	1021412012	Chiềng Muôn	8823	\N	21.523333	104.132778	\N	\N
e898e99c-b5d1-4165-9338-df1ce6ef127f	1026463203	Bình Giáo	2611	\N	13.82	107.870556	\N	\N
7fa7bbb1-4f37-4193-bdc7-895da76c7091	354574	Khun Há (Tam Đường, Lai Châu)	5901	\N	22.26361083984375	103.61360931396484	\N	\N
baa2da77-9d6e-4e4f-9803-74840ddd5028	260126	Khun Há 2 (Tam Đường, Lai Châu)	5901	\N	22.209606170654297	103.63709259033203	\N	\N
d4d4d4e0-4cba-48a3-bac6-4fa416aa261f	940009	Chủ Chí	209	\N	9.3041	105.31901	\N	\N
ae3445da-8f46-4176-b350-e1d9d029a369	940012	Châu Thới	217	\N	9.36445	105.65991	\N	\N
5fc194f2-e1e7-4457-9447-8cf516995da9	940013	Hưng Hội	218	\N	9.316667	105.764444	\N	\N
92647fed-6750-4a19-a329-0deb11afd9ed	270002	Xuân Lao	2505	\N	21.464457	103.342476	\N	\N
d21f925a-97ce-4d04-82a0-a00f8f6b4b94	1021109703	Hừa Ngài	2506	\N	21.882229	103.175317	\N	\N
b94e8b98-437c-43c7-9f7b-1608ffa4b992	1021109704	Huổi Lèng 1	2507	\N	21.936392	103.140882	\N	\N
b486b8b6-c3b7-414a-a937-6b56472a972d	1021109702	Huổi Lèng 2	2507	\N	21.898246	103.150884	\N	\N
0d9aaf52-7951-4819-b067-5118eacbaaf9	347254	Huổi Lèng	2507	\N	21.87773	103.13269	\N	\N
16507004-27b9-453c-a5aa-3c063ed702be	1021109707	Mường Tùng 2	2511	\N	21.963938	103.14765	\N	\N
91bbca91-8980-4a3f-83de-2035b0004f66	1021109706	Mường Tùng	2511	\N	21.971126	103.079312	\N	\N
ce3b4380-3369-42d7-9dfe-e78fdc59f213	1021109501	Lay Nưa	2554	\N	22.002589	103.15308	\N	\N
3acd0519-faa4-4a8b-bc18-f4cebaa2bb90	270003	Lay Nưa	2554	\N	21.980556	103.150556	\N	\N
37a14eb8-d7af-4aaf-8ee6-5277114693ad	1021109502	Sông Đà	2556	\N	22.062309	103.153832	\N	\N
89db9efb-dda2-496b-a34e-14a0b7f73470	1026462601	Đak Sơ Mei 1	2667	\N	14.159722	108.141389	\N	\N
b2ee95a3-f411-4070-a830-1e71f3f6be85	810003	Hồ chứa nước Tầu Dầu 2	2683	\N	13.99077	108.57429	\N	\N
2b9ea124-8be1-481f-8c7d-9d4a1d8193f1	1024041802	Lưu Kiền 1	7064	\N	19.27431	104.358188	\N	\N
89ef7afe-7a77-41b0-a115-caf4229b1284	1024041803	Luân Mai	7065	\N	19.595686	104.425228	\N	\N
86c48f5d-4477-4428-8117-d56d74dd1e63	1024041804	Nga My 2	7066	\N	19.29421	104.81983	\N	\N
cf5b309a-07a2-4023-abaa-232958a242dd	1024041805	Nga My 1	7066	\N	19.27635	104.78557	\N	\N
58f84de1-dc25-4f7b-910e-b4f0fd972a93	900526	Luân Mai	7067	\N	19.546316	104.501619	\N	\N
9a63ceca-e032-4d4a-b2c0-75d2d6741ed1	950003	Hòa An	3333	\N	9.764184	105.616187	\N	\N
86961b28-709b-4158-a838-b2b073c418ac	950002	Vị Thanh	3357	\N	9.843348	105.536388	\N	\N
f30fb47a-ef45-4990-a21c-b9bad8204d8e	503047	Thạch Xuân	4827	\N	18.304722	105.861389	\N	\N
98a7feec-20c6-4695-8e23-dc670aeef346	1024244104	Sơn Thọ	4840	\N	18.42202	105.457413	\N	\N
9096884b-c352-40fd-9848-d3a8c768598f	356180	Hương Điền	4840	\N	18.425222	105.407472	\N	\N
bff9417f-7a48-40c2-a025-2660697fe7c3	1024244101	Đức Bồng	4841	\N	18.397682	105.518037	\N	\N
ba084e6f-e11a-46be-a925-ddfe0135a18b	00205079	Ha Tinh - Vu Quang - VQG Vu Quang	4841	\N	18.378368377685547	105.4999008178711	\N	\N
305097ff-9b9d-4d6c-9894-94725a760fdb	128526	Cao Phong	4844	\N	20.705811	105.322333	\N	\N
4b30eb6c-5e8e-40d8-baf5-a400e789da16	1021715402	Tây Phong	4849	\N	20.676944	105.305278	\N	\N
023841ce-5da4-404b-8349-2e017cc4f653	1021715401	Nam Phong (Thu Phong)	4850	\N	20.738333	105.342778	\N	\N
b5553143-79ce-4344-a240-404cc1307e7f	648621	Thủy điện Suối Tráng	4851	\N	20.724722	105.277222	\N	\N
2165dbdf-dfd7-4a76-bf99-f0e6f0dfcace	720002	Hồ Gia Hoét 1	888	\N	10.71579	107.29265	\N	\N
6b4e9309-1b06-4457-8b87-572d5afe33b2	580010	Mường Mùn (Tuần Giáo, Điện Biên)	2560	\N	21.709167	103.3625	\N	\N
4b76a8a0-8014-49fc-867c-6cef448d6288	1021109915	Mường Mùn 1	2560	\N	21.755139	103.333593	\N	\N
14158208-c887-4ee4-86b9-c1c57e4dea6c	1021109916	Mường Mùn 2	2560	\N	21.799052	103.31142	\N	\N
725af0cb-277b-4934-86fe-72f3114e5289	1020203201	Nậm Khòa	3757	\N	22.56333	104.686462	\N	\N
2cdc4092-ed9e-47b3-be5e-4509e10d9421	608925	Nậm Tỵ	3758	\N	22.596111	104.771111	\N	\N
2f79689f-a746-4197-98c9-c209ef545b2e	1020203207	Thàng Tín	3768	\N	22.798333	104.647222	\N	\N
b2323df2-5160-4f66-a9c3-d6a0f77a85f1	1020203211	Túng Sán	3771	\N	22.74378	104.765102	\N	\N
63bccd1a-fbea-4941-b755-23eb5a3a800b	1020202702	Nậm Ban 1	3779	\N	23.070689	105.368525	\N	\N
8335f77f-9942-4605-9596-740d71b04eb2	1020202701	Nậm Ban 2	3779	\N	23.094797	105.377969	\N	\N
ef60149e-2268-4d06-b30e-20de565aa35b	724832	Xuân Hoà	10889	\N	21.286809	105.723978	\N	\N
e2492751-be80-4aec-934d-8a880b669777	1020202902	Thái An	3801	\N	22.977976	105.086105	\N	\N
c84811b7-0f57-4724-803e-0e95bfdf39b9	1020203504	Tân Nam 1	3809	\N	22.475263	104.558123	\N	\N
aee94610-7e35-4d9b-b8da-21b0ce233bb5	1020203503	Tân Nam 2	3809	\N	22.449167	104.586667	\N	\N
e2878016-7fef-4ffd-b446-26cf5ac9852c	012062D4	Ha Giang -  Viet Quang - Dap thuy dien Song Bac	3810	\N	22.452110290527344	104.72309112548828	\N	\N
6e88f52b-47c8-46a9-be09-b037884a9d24	328065	Yên Bình	3816	\N	22.41019	104.57888	\N	\N
0f4393bd-35e9-497a-84a6-8b11f24c1bef	1020203009	Bạch Ngọc 1	3819	\N	22.587274	105.04912	\N	\N
9e57e24f-ad88-4283-8759-cffbeeccdb97	1020203014	Bạch Ngọc 2	3819	\N	22.616574	105.041123	\N	\N
6584ceea-ef6a-4fd6-b29e-28abc7b06d05	1020203007	Cao Bồ 1	3820	\N	22.740252	104.944925	\N	\N
472d4d76-4c87-4a12-b680-e5e40ec8fd1f	1020203006	Cao Bồ 2	3820	\N	22.760868	104.86954	\N	\N
6846b3aa-10b8-4c7c-8c20-fa4fa5f49c2c	002058B7	Ha Giang - Tong Hop - Trung tam tram giong cay trong Dao Duc	3821	\N	22.75326919555664	104.99919891357422	\N	\N
3620c9a5-e49e-4140-ba22-975a086e6eee	1020203001	Lao Chải	3824	\N	22.848684	104.784288	\N	\N
1d44e7fe-18ec-4465-82b5-3a5471d2a4ec	480227	Linh Hồ	3825	\N	22.705278	105.0525	\N	\N
5f12cdd7-d303-4daa-9a52-eca33bcdc257	47460	Giá Rai	187	\N	9.237738	105.451454	\N	\N
a53dd136-bd7f-4586-bd1c-68610f1cd4ce	01205902	Quang Nam - Tra Nam - TD Song Tranh 2	8020	\N	15.0385103225708	108.07022094726562	\N	\N
edd5fca4-da80-4b0f-9971-98e2f5261feb	012061A3	Quang Nam - Nam Tra My - Xa Tra Nam 2	8020	\N	14.987120628356934	108.13358306884766	\N	\N
ac5ea3e4-4139-44b5-9aa2-c80d00064e95	000432	Huyện Yên Thành	7108	\N	19.039275	105.420534	\N	\N
a481c034-f005-4990-b672-3fafe5f90795	225130	Tam Dương	10920	\N	21.386523	105.535289	\N	\N
9ea02d46-364a-4f22-b9a2-af875e0282e9	210039	Sơn Lương	11083	\N	21.672891	104.499144	\N	\N
07419a1e-593b-4c9a-8589-4a0800f5947d	1021514015	Sơn Thịnh	11084	\N	21.567778	104.572778	\N	\N
b7b2c5ce-e1d7-48b9-aab7-3cb02f14caf4	354590	Sơn Thịnh	11084	\N	21.562722	104.595972	\N	\N
2c35080e-251b-49f8-b9c5-de42155c7573	371514	Bà Rịa	877	\N	10.527222	107.169167	\N	\N
bab23454-4796-4b1b-a4cd-35f8381f4904	720003	Hồ Suối Giàu	881	\N	10.64621	107.28155	\N	\N
2df9a143-479e-45b1-9e11-29801e6f5a3a	720001	Hồ Đá Đen	882	\N	10.733056	107.185278	\N	\N
9bf49157-f813-4aa1-886b-b855a57dd457	720004	Hồ Lồ Ồ	883	\N	10.59374	107.28185	\N	\N
99f1a71c-4163-42ac-9157-96893f940fe1	029913	Mậu A	11105	\N	21.878194	104.689667	\N	\N
93516968-28e7-4aa4-80fd-28cc5ba838bb	1026261303	Hiếu	5534	\N	14.654083	108.439528	\N	\N
c0873a92-6fd8-4999-9e27-0a4b5841d4ed	079369	Măng Bút	5535	\N	14.83448	108.197096	\N	\N
f1a4105b-3e74-4b9e-b4b9-c1d6fbb6e0df	1026261304	Măng Búk 2	5535	\N	14.832806	108.197944	\N	\N
c2f9b47b-33ab-44d0-a8d3-1e98ee242cb4	1026261305	Măng Cành 1	5536	\N	14.687194	108.321417	\N	\N
2c121dd1-5e5f-415f-8b15-c812178933ba	1026261306	Măng Cành 4	5536	\N	14.646139	108.29625	\N	\N
186e8a97-5941-4b72-babc-da9808efa657	820002	Măng Cành	5536	\N	14.650278	108.297222	\N	\N
959985e9-66ef-4030-abfd-f00641be786f	25117	Vĩnh Tường	10946	\N	21.255712	105.489023	\N	\N
aad959f5-8079-448a-b3a7-5162a3065c55	343041	Xã Mỹ Thọ	1039	\N	14.215998	109.160868	\N	\N
b7b84e56-cbd8-45af-a06c-50d32bff12a4	092998	Hồ Diêm Tiêu	1042	\N	14.208235	109.071312	\N	\N
1ed636c3-e8eb-407a-b39f-aad42e16ce8d	770005	Khu vực 7	1043	\N	13.735781	109.154156	\N	\N
3eff496d-c011-4e7a-b970-808e9e69ef53	040761	Hồ Long Mỹ	1058	\N	13.710374	109.123658	\N	\N
1c603af0-d2a4-4f7b-a68b-d3661e58a619	040767	Hồ Thuận Ninh	1066	\N	14.012222	108.926218	\N	\N
cca22dae-25d7-4ddf-b48d-03859231e548	770010	Bình Thuận	1068	\N	13.982412	108.985085	\N	\N
6a889cce-a7da-4ecf-ac68-b2f2d95ec0e5	1022018002	Tân Minh	5772	\N	22.2769451	106.605159	\N	\N
e79ea2cf-57ae-4a66-b8fc-f480cb588967	1022018003	Tân Tiến 1	5773	\N	22.307839	106.3221371	\N	\N
9951d0b7-fc93-43b1-8147-daf3baf5ed34	752767	Bến Cát	1122	\N	11.131667	106.606389	\N	\N
4711be18-846e-42fb-9ee3-3ea38a2387f5	1021210904	Vàng Ma Chải	5872	\N	22.704444	103.318611	\N	\N
3a38ebff-4399-463f-9080-c785cbc41bff	1021210816	Căn Co 3	5873	\N	22.167222	103.420278	\N	\N
592edc8c-9c3c-47c6-98d6-4188b61bb252	1021210815	Căn Co 2	5873	\N	22.156318	103.460147	\N	\N
a17576e6-3548-4769-920a-32721f5251de	1021211006	Nà Cang	5921	\N	21.948056	103.882222	\N	\N
90594e36-39b8-49d5-b9c9-cf678f2fd250	1021211005	Mường Kim	5922	\N	21.861893	103.861466	\N	\N
a5bab0c3-db45-4428-a4f3-e7eba9df4bae	354093	TĐ Bản Chát	5922	\N	21.861124	103.828473	\N	\N
bac86da8-5f43-40a0-8c5b-a217f16b9133	493730	Đèo Bảo Lộc - Bảo Lộc	5932	\N	11.477778	107.738056	\N	\N
7acd3ea8-2bd3-4140-919a-9f7ed4e71517	623530	Đại Lào - Bảo Lộc	5932	\N	11.498333	107.746389	\N	\N
04dedbb6-d0db-4ecf-a205-05c38cca5ea5	490051	Xã Đam'bri - Bảo Lộc	5933	\N	11.586765	107.792033	\N	\N
d6273b15-68f3-4490-a462-74e3ff9557bd	906195	Phước Cát 2 - Cát Tiên	5963	\N	11.608889	107.303056	\N	\N
3ca5a8d2-e44a-4936-83c9-75d494ce2e2d	490053	Tiên Hoàng - Cát Tiên	5965	\N	11.653616	107.388627	\N	\N
85efda2d-7dfe-4326-bf7b-28519842df10	800215	Thị trấn Đạ M'Ri - Đạ Huoai	5967	\N	11.412222	107.663056	\N	\N
16bd0ad4-bf15-415b-81b8-18a26028212b	1026868103	Đạ MRi 1	5968	\N	11.419735	107.658971	\N	\N
f0e5c901-927a-43d3-9d19-51d1365a8dba	490040	Đạ Tồn - Đạ Huoai	5971	\N	11.428931	107.536486	\N	\N
543129e1-1586-4736-9491-7ffd96977990	009084	Kỳ Sơn	4891	\N	20.888694	105.371611	\N	\N
de47020d-51a9-4f6f-ad9f-2ecc7f5b7762	1021714805	Độc Lập	4890	\N	20.853333	105.396111	\N	\N
73a12291-fa5b-45d6-ab75-8da0e58ad19c	076218	Độc Lập	4890	\N	20.815895	105.399572	\N	\N
96b94231-1415-4a90-a2a2-e7b4367f85e0	1021513514	Khánh Thiện	10989	\N	22.237738	104.713915	\N	\N
e07751ed-6386-4f60-8d4a-77a2954c5393	1021513505	Tô Mậu	11002	\N	22.123056	104.683056	\N	\N
3a073bfe-cc4c-4d71-948f-7f968e6d411d	355032	Mù Cang Chải	11018	\N	21.839528	104.107194	\N	\N
fb12b966-2e27-4e90-a52e-c299de7716f2	972116	Quang Húc	7498	\N	21.289722	105.194722	\N	\N
da157892-ba99-4182-b5c7-26926cc45015	029752	Cổ Phúc	11043	\N	21.753755	104.831826	\N	\N
83e10f3d-2d2f-45c5-96a9-f08265dc3108	354932	Nghĩa An	11023	\N	21.584972	104.497889	\N	\N
c802e379-4442-4e9b-ac40-62e1171e4ec5	341347	Hải Lâm	8575	\N	16.691236	107.241427	\N	\N
7fa2deff-3cfd-4154-821d-7ba495a04ba0	740005	Hướng Lập	8593	\N	16.886691	106.568597	\N	\N
f4f19490-8ea9-4e61-b8af-97e0fefdb7d0	346097	Hướng Linh	8595	\N	16.711911	106.744083	\N	\N
6028ce5a-1d6b-4bf8-bb39-74f98e021999	040824	Hướng Phùng	8596	\N	16.74214	106.581653	\N	\N
f88b2f58-9c54-4928-84ba-9334b901a789	960753	Hướng Phùng	8596	\N	16.734426498413086	106.58460235595703	\N	\N
6ca1f32d-3706-4edb-9367-0f1a0924bb8a	938441	TP. Bến Tre	713	\N	10.236944	106.374167	\N	\N
7e4483c4-0f04-4277-a66a-45d82c80491d	210031	Đào Thịnh	11045	\N	21.796964	104.795224	\N	\N
4030a2bb-74d4-453f-8a3c-e604eb49200b	1021513809	Hòa Cuông	11047	\N	21.787778	104.834444	\N	\N
c8e4f42b-5ef4-4279-841b-ae31f70f4f8b	210040	Hưng Thịnh	11049	\N	21.588417	104.783255	\N	\N
82309c76-d481-4d14-adfb-d865bea5389e	1021513808	Minh Quán	11052	\N	21.764276	104.848831	\N	\N
df0d1aa0-291f-432d-a157-1e05a85241a3	904075	Lương Bằng	496	\N	22.087352	105.504016	\N	\N
38966c36-6499-41f2-98d6-25022cd51410	1020606007	Nhạn Môn	567	\N	22.661132	105.642733	\N	\N
8c017e24-03b5-4553-a7fe-44cb0b3b930b	438790	Nhạn Môn	567	\N	22.654603	105.647594	\N	\N
d2834d61-931c-44ef-b930-d902cf893650	855600	Xuân La	568	\N	22.579794	105.700582	\N	\N
07674aae-7c38-4522-95a9-116af903c189	1021513812	Tân Đồng	11057	\N	21.847049	104.807984	\N	\N
081345c3-727a-46bf-b9a8-18931841eebd	356217	Tân Đồng	11057	\N	21.851082	104.796052	\N	\N
9e2e0577-e1bf-426b-a9cf-f16bf137ed13	1021513810	Việt Hồng	11060	\N	21.575824	104.851822	\N	\N
bc4ab3b7-5910-4afd-8fa9-8da07348050d	1021514021	Đồng Khê	11068	\N	21.527435	104.643984	\N	\N
1f4dba40-b260-4ff6-aa1c-1756d17902b0	1021514009	Nậm Mười 2	11074	\N	21.721428	104.472045	\N	\N
50fddc0d-7c4d-44ff-9432-30eca4888bcd	1021514008	Nậm Mười 1	11074	\N	21.741518	104.496075	\N	\N
49a48a6c-09c8-4ab2-ac57-605eade53f44	621756	Sóc Sơn	4322	\N	21.224816	105.831696	\N	\N
7911ad41-7ee1-4724-988b-4e022a74eaca	593017	Xã Đăk Pling	2729	\N	13.651944	108.774722	\N	\N
0f465743-966b-435b-b744-057266f533df	258969	Đa Mi	1421	\N	11.23967	107.83547	\N	\N
fd846489-e3d4-49b8-9a7c-4c5106c62c70	639801	Ba Khe	11079	\N	21.488056	104.721111	\N	\N
2b727da1-863d-444c-a17f-073f9268b340	1021514007	Suối Quyền	11087	\N	21.653759	104.539741	\N	\N
85e1b436-e0de-4b26-84be-3e9db99407c1	1021514012	Sùng Đô	11088	\N	21.716013	104.5068	\N	\N
7a8d25ad-3d2f-4197-9d29-fede662c1c6c	565576	EahDing	1863	\N	12.893889	108.065278	\N	\N
b05a25e9-1dbe-48b1-ab30-b83016e69f79	003426	Cư Yang	1892	\N	12.673124	108.621947	\N	\N
b240b553-e114-4ee2-8a5c-0881c32796ba	470008	Ea Kar	1894	\N	12.811944	108.450556	\N	\N
7f6b12d0-adc2-4c58-9ad7-68f671686d02	470025	Ea Kmut	1895	\N	12.79148	108.43799	\N	\N
22ae40e4-1678-4b6e-8164-68ef37adb925	210037	Thạch Lương	11090	\N	21.546846	104.517621	\N	\N
f192524d-a48d-4196-8f13-66753d4bbe0a	068723	Khang Ninh	481	\N	22.4425	105.664722	\N	\N
fd12c9ec-c9e8-4832-bec4-5d84f255fb27	041816	Phúc Lộc	484	\N	22.477408	105.83571	\N	\N
4d7158e6-e88c-45d2-8286-c38e734464fe	970315	Quảng Khê	485	\N	22.345556	105.688889	\N	\N
325c1446-3673-45be-847f-054fe2de506b	1020606101	Yến Dương	487	\N	22.386813	105.795796	\N	\N
e0a53641-5451-4909-9e9f-102d53a85ea6	722470	Yến Dương	487	\N	22.391389	105.792778	\N	\N
da40fa46-7aeb-4318-863a-a368c9f6cfc3	1020606407	Bản Thi	488	\N	22.238611	105.505	\N	\N
1733297f-2f24-4c63-80ad-05e5441cda45	541562	Bản Thi	488	\N	22.2225	105.491389	\N	\N
7d558132-754a-44e1-86fe-679affdd638f	1020606401	Bằng Lãng	489	\N	22.120833	105.575278	\N	\N
d749ffb4-3ddc-4129-b159-617a1b94d59f	673310	Bằng Lũng	490	\N	22.158056	105.595556	\N	\N
fb3d7396-8af8-4382-81b1-3a6f7eea3d0d	289924	Phương Viên	501	\N	22.1875	105.640833	\N	\N
4209f120-a88c-4ad1-b453-25cd9f0f6875	1020606403	Quảng Bạch	502	\N	22.249722	105.590556	\N	\N
29474b0f-8148-4e11-a9e0-fd944a96f1c0	695840	Quảng Bạch	502	\N	22.277925	105.582514	\N	\N
f2b2ab3a-d772-4bc7-902d-eebc6e5926a8	1021514002	Tú Lệ 3	11093	\N	21.781489	104.32807	\N	\N
c7c554f5-d4ee-4274-924e-cac56266c07c	1021514001	Tú Lệ 2	11093	\N	21.790062	104.29988	\N	\N
41f8f174-47c6-4821-9683-37c7bd791b52	1021513604	Đại Sơn 2	11099	\N	21.840826	104.615768	\N	\N
116f7aae-74e0-46d9-85c8-5acaafb4a566	1021513606	Đông An	11100	\N	21.938127	104.560204	\N	\N
ac0e56c1-09df-4556-87e0-c0eb29a5ff6b	1021513603	Mậu Đông	11106	\N	21.911635	104.654049	\N	\N
e30526e6-d598-4e58-a770-171480eba1f6	1021513601	Mỏ Vàng 1	11107	\N	21.706344	104.635935	\N	\N
7a1126b4-b14d-4dd0-a7c5-426e21f17ec8	210021	Mỏ Vàng	11107	\N	21.776082	104.642122	\N	\N
08ca4a1e-041c-4704-852f-726d17a727f2	125782	Làng Cang	11110	\N	21.924694	104.475972	\N	\N
3cdbc280-0b48-418a-bbe2-85c3cf22bc05	1021513602	Phong Dụ Thượng 1	11111	\N	21.825594	104.444634	\N	\N
2d48acc1-a9b5-49ac-8d7a-d42ce2c01adf	210020	Phong Dụ Thượng	11111	\N	21.870556	104.445556	\N	\N
3bc88616-1426-4553-adde-98639299c6ff	1021513605	Tân Hợp 2	11113	\N	21.870367	104.588145	\N	\N
4809b210-b0cc-456d-bd8d-129501a69c8b	1021513203	Âu Lâu	11121	\N	21.697222	104.843611	\N	\N
3f606ade-7d40-47a0-a7e5-24864d440768	508987	Hồ Thượng Tuy	4799	\N	18.321111	105.813889	\N	\N
cac9b8c9-ed68-4658-ac7a-46735dc9eb4d	353872	Chi cục thủy lợi	11122	\N	21.720151	104.909429	\N	\N
14be0272-ed4b-4308-b8ee-63445efdfeba	71547	An Hòa	950	\N	14.567	108.9	\N	\N
b98cdf72-2cb0-4034-b413-2d4c3b648479	503462	Hồ Trong Thượng	957	\N	14.660419	108.877926	\N	\N
3ed27c2c-9439-482a-8939-f8abe7aaf5cd	1021513202	P.Yên Ninh	11136	\N	21.717222	104.893611	\N	\N
fc958c2d-0300-4072-aa02-c482096bb2b1	210032	Bạch Hà	11138	\N	21.803188	105.062075	\N	\N
0817439f-35ec-441b-bba4-5a8018d37748	1021412604	Chiềng En	8895	\N	21.193741	103.515895	\N	\N
0a895d20-bb1b-4e1d-98f2-acb7deeac8fd	260025	Chiềng Khoong 1	8896	\N	21.019855	103.807289	\N	\N
bc014477-2de0-4e24-b2db-e8e844d3affb	1021412605	Chiềng Khương1	8897	\N	20.927718	103.959959	\N	\N
39821a2f-34a5-4d43-ba30-3404d08947a5	608544	Cảm Nhân	11141	\N	21.973382	104.972997	\N	\N
8f5f1b5c-df6f-45be-b72a-bdc19bfbc24c	1021110117	Háng Lìa 1	2475	\N	21.182748	103.345167	\N	\N
b494f3bf-d9ff-485d-b73a-dd1870774ec5	1021110107	Háng Lìa 3	2475	\N	21.172909	103.311032	\N	\N
1ac660d1-e37f-41f0-b8b0-b9a5725a1c7c	811491	Háng Lìa	2475	\N	21.18586	103.35062	\N	\N
f1af6f18-4df7-45af-9c5a-cbebc156ca74	210036	Tân Nguyên	11152	\N	21.94161	104.782672	\N	\N
16d367d1-6968-4b94-b209-7a737a544e4e	1026260805	Vinh Quang 1	5566	\N	14.358194	107.979333	\N	\N
0bc6c436-736e-419f-ab09-d7b3ede6a12e	1026261103	Đăk Ang 1	5567	\N	14.947194	107.72125	\N	\N
4327a556-aa0d-4e50-a3d8-603958441609	355243	Đập - TĐ Thác Bà	11157	\N	21.74703	105.022955	\N	\N
c9d96739-b312-4693-88ca-004ff10ca3f6	670012	Nhơn Hội	8	\N	10.8925	105.039444	\N	\N
efcb3f95-b300-477f-b56d-db245fd22af6	029967	Đăk Trăm	5520	\N	14.770833	107.863889	\N	\N
6cda9b4d-5a40-4286-ab54-6e5e3f583a10	1026261201	Diên Bình	5521	\N	14.611056	107.879833	\N	\N
ebc352a5-1e3a-4c02-8ff7-8cb92d74611b	483405	KonPlong (Măng Cành)	5530	\N	14.615572	108.353797	\N	\N
ef44381e-29e9-48b4-8ec4-e0d85d95861e	040667	Thanh	8608	\N	16.49169	106.665938	\N	\N
52012d4d-f873-4e50-aae5-f37ec27e5307	1026261701	Đăk Ong	5592	\N	14.950972	108.006639	\N	\N
45af422c-3c65-4677-beba-e299911ee31d	1026261704	Ngọc Yêu	5593	\N	14.852	108.041861	\N	\N
dd356b64-89cd-4d97-b230-6f9d40f1af33	353106	Xã An Nghĩa	981	\N	14.478528	108.849389	\N	\N
4d57515b-a24c-4f7c-80b2-ab11133181fe	343042	Xã Bok-Tới	986	\N	14.291332	108.828691	\N	\N
8226e972-5fdd-4c49-9ce7-a18ab1f172e4	353108	Xã Dak-Mang	987	\N	14.348056	108.861833	\N	\N
3ae7ee17-96be-469e-aa63-d3f16354e01e	040738	Hồ Cẩn Hậu	998	\N	14.639956	108.992461	\N	\N
ae1d056b-78b5-4a07-b0dc-f517c7162004	356466	Xã Cát Thành	1019	\N	14.08125	109.192306	\N	\N
219d9d13-ce70-4e48-8baa-8bc6930d1e8b	000854	Đập dâng Thò Đo	1073	\N	13.928943	108.793639	\N	\N
ef50f0ef-b6e7-421f-9bde-4d1c84936dfd	001760	Đập Hầm Hô	1074	\N	13.878	108.866143	\N	\N
e400d590-b8c6-4cdf-9c83-9d9c72208b43	770009	Đập dâng Thượng Sơn	1075	\N	14.0025	108.789722	\N	\N
7dbd5dd5-dba3-4493-866a-e304480d3679	036616	Hồ A - TĐ Vĩnh Sơn	1104	\N	14.365095	108.694488	\N	\N
08afca6b-dc3d-43e4-917d-e98e1e50b354	036615	Hồ Hòn Lập	1106	\N	14.099917	108.809557	\N	\N
57f100fd-4818-4613-81c1-3dd95511c1b9	670009	Mỹ Hội Đông	30	\N	10.484725	105.359442	\N	\N
7c145003-a211-4b54-bfb5-2087d1cdff73	461225	Bù Nho	1295	\N	11.733333	106.873889	\N	\N
040e12dd-a042-4f3e-88ca-d57463af01d6	930001	Long Bình	1296	\N	11.794765	106.799092	\N	\N
34221ce6-7144-44af-85fb-f951d009298c	1021210717	Bum Nưa	5830	\N	22.370833	102.845833	\N	\N
e4a0b8f3-25fc-4133-8f35-0ced6b7af644	864510	Bum Tở	5831	\N	22.4172	102.73391	\N	\N
80a8eb5c-b795-4e9e-9cbd-998257fdc5a0	1021210706	Ka Lăng 2	5832	\N	22.631667	102.441389	\N	\N
a6ecc057-65ef-4797-b546-f141a4510843	1021210716	Ka Lăng	5832	\N	22.584722	102.500556	\N	\N
ec46499d-8fbc-4407-ad1d-d6631b82ef2d	01205A2B	Lai Chau - Keng Mo - 2	5832	\N	22.56826400756836	102.35779571533203	\N	\N
b87c0bc4-aeee-403f-a7a8-d8e63b5c3459	1021211203	Mường Mô 3	5833	\N	22.229722	102.893056	\N	\N
7553b2a2-d6ff-4524-a98e-1da633b95413	1021210705	Kan Hồ 2	5833	\N	22.290556	102.835278	\N	\N
0fa9a625-fb32-47a7-8aa7-f669e3629dec	1021210712	Kan Hồ 1	5833	\N	22.250558	102.858545	\N	\N
74795219-bf17-46fa-8d55-f17ffe0105c0	1021210709	Mù Cả	5834	\N	22.534722	102.505	\N	\N
8b3e9e3b-242e-4fe1-a40f-6ee8b1aebb3e	665264	Mù Cả (Mường Tè, Lai Châu)	5834	\N	22.418611	102.409167	\N	\N
2b8ddfc1-048e-4eb2-a7b3-6e39c20615b3	607649	Ma Ký	5834	\N	22.511292	102.470532	\N	\N
372278b2-3d82-4127-80ea-1cc102c98a2b	867426	Vàng Bó	5868	\N	22.543112	103.291837	\N	\N
33ecb659-4105-4b70-902f-f7498de9331f	1021210903	Sì Lờ Lầu	5869	\N	22.752222	103.311389	\N	\N
7d4fd0c2-c5fd-4586-9a75-6a91b29326e8	866957	Sin Suối Hồ	5870	\N	22.48882	103.5114	\N	\N
a935dcd1-5cf0-4b81-81c0-cb5fba804e96	670008	Tấn Mỹ	34	\N	10.49919	105.50339	\N	\N
f8fa0580-c5b0-40d0-bed7-bebe8aac4202	267081	Tân Lâm	6043	\N	11.65516	107.96759	\N	\N
8abb2dcf-99a4-4c6f-aae7-9b3905910b30	490031	Đạ Ròn - Đơn Dương	6047	\N	11.770162	108.445884	\N	\N
8ac21e94-c5dc-4437-91b1-63c6f932513b	490059	Ka Đô - Đơn Dương	6048	\N	11.757061	108.530536	\N	\N
b51f0893-c107-42d4-856d-dceccc97d664	490058	Lạc Lâm - Đơn Dương	6050	\N	11.780796	108.526592	\N	\N
7a0c15a0-2068-4e1c-87b8-aeb0e1577d81	767056	Lạc Xuân - Đơn Dương	6051	\N	11.821667	108.569444	\N	\N
f651772a-19b0-4c3a-9b84-0a8160d1320a	791958	P'Róh - Đơn Dương	6052	\N	11.725833	108.536667	\N	\N
d24d8374-ef3f-455b-8228-56962fc81fea	899450	Thạnh Mỹ	6054	\N	11.760556	108.483611	\N	\N
debbab40-6754-4ed7-873f-508a9d10fbf1	490030	Tu Tra -  Đơn Dương	6055	\N	11.715557	108.452974	\N	\N
fd7cb40e-0d9c-49d1-b49f-3c2418fa24be	393281	Đạ Chais	6056	\N	12.138333	108.650278	\N	\N
dc5a6947-f22d-4980-af54-3069a6d591f5	1026867503	Đạ Chais 2	6056	\N	12.13726	108.60283	\N	\N
27ae5e81-f507-4709-80e1-58b1b2119874	1026867501	Đạ Nhim	6057	\N	12.104733	108.557009	\N	\N
3be1bf8f-d3d7-4be1-9b1c-3edf4fb8fbb1	940153	Đạ Nhim - Lạc Dương	6057	\N	12.098056	108.549444	\N	\N
2ec7f483-4f12-42d2-8893-a2b31b949d01	1026867502	Đạ Sar	6058	\N	12.044722	108.488333	\N	\N
278dc19f-2a99-46d2-b5c5-36509b9c8f2c	521170	Lạc Dương	6060	\N	12.012222	108.421111	\N	\N
3c314a39-deaa-485a-b0e2-c26bbe30d1f8	56882	Suối Vàng	6061	\N	11.973889	108.330833	\N	\N
fefe843e-4163-4591-8479-ff3a9e2fffa0	642574	Phúc Thọ - Lâm Hà	6074	\N	11.791944	108.168056	\N	\N
c2ed02d7-1d8a-4139-a6ad-83062c4a887b	637502	Tân Hà - Lâm Hà	6075	\N	11.748056	108.200833	\N	\N
7d6e7a29-d2ed-4916-a5c9-694dc4ef56e7	340308	Quy Kỳ	9550	\N	21.96525	105.647778	\N	\N
289346a8-3668-4cae-889d-daa89094060c	200016	Hợp Tiến	9558	\N	21.574479	106.021394	\N	\N
59bf63e2-a692-487f-8f85-063dbfdc73ea	200017	Hóa Thượng	9560	\N	21.650106	105.834613	\N	\N
651cf779-fc91-4b54-a2eb-9d896be96874	200005	Nam Hòa	9564	\N	21.611389	105.921111	\N	\N
6687c4f4-a22f-4d36-936b-546a7f12cdf8	0020645C	Thai Nguyen - Dong Hy -TT Song Cau	9566	\N	21.677122116088867	105.85408020019531	\N	\N
bcfaf7c9-3da5-4868-9971-66ef80e16a31	742096	Cổ Lũng	9693	\N	20.45874	105.224437	\N	\N
bda1b7d8-7bd4-4691-9c7b-70c8df0b7530	051307	Lưu vực (Xuân Quang 1) - HCN Phú Xuân	7636	\N	13.356111	108.9825	\N	\N
2e40ed36-d70a-4130-9e9c-ffeaa16d12df	1023838603	Lương Trung	9707	\N	20.32821	105.35557	\N	\N
75a51362-6efc-45c8-8f6c-1064717baf5a	1021714803	Dân Hoà 2	4892	\N	20.915	105.450278	\N	\N
50c46fc4-caff-4a98-81c4-1a9d284f79c3	1021714804	Dân Hòa 3	4892	\N	20.914722	105.434722	\N	\N
d2b780d9-f4a5-4706-876c-28a445c709b1	1021714807	Phú Tiến (Quang Tiến)	4898	\N	20.938611	105.395	\N	\N
7c2a4fb3-4039-40d2-989c-e1a9d64f7912	760077	Trà Nham	8297	\N	15.196491	108.464317	\N	\N
d2c39c5d-b787-4ae3-b8b3-0e09ddce1daf	518933	Hoành Bồ	8442	\N	21.030932	106.992451	\N	\N
ada54041-bea7-46ed-b05d-4dd5b9d76763	809143	An Biên	8437	\N	21.02782	107.010703	\N	\N
4720bff7-d713-4c33-b1ae-c747831dc0dd	940005	Tân Phong	188	\N	9.198802	105.328916	\N	\N
319b8012-bd7f-4db4-bc9b-2d1c0453b732	1020606302	Dương Phong 1	458	\N	22.109444	105.694167	\N	\N
83913b49-9a03-4898-bcd7-3f72fec2a600	1020606303	Dương Phong 2	458	\N	22.113056	105.728611	\N	\N
c2423c75-87a0-480e-8486-55cdda8a8e9f	825863	Vũ Muộn	471	\N	22.259642	105.960131	\N	\N
d54e146d-e501-4976-9fac-76ca8b6fe582	1020606103	Bành Trạch 2	472	\N	22.5025	105.799444	\N	\N
c20525c5-8360-4857-8343-cc52c4fd1ae8	1020606102	Bành Trạch 1	472	\N	22.454525	105.771283	\N	\N
24887eb8-f993-4d74-8acf-0c8ac2184df1	1020606104	Cao Thượng	473	\N	22.474812	105.64714	\N	\N
1fc29526-5c46-4345-b026-9c6aa68cebb8	360018	Bình Lương	9931	\N	19.648056	105.445278	\N	\N
522bd3ee-7268-4c25-b30b-9c4654c1c780	360017	Thanh Lâm	9937	\N	19.647222	105.315556	\N	\N
81e7f11a-f819-4ce7-bc64-24b817aa108d	1023840201	Thanh Phong	9938	\N	19.657481	105.275212	\N	\N
29f20fbe-c34b-48e8-8936-07a2f9d7bf2c	720010	Hồ Xuyên Mộc	945	\N	10.548562	107.391128	\N	\N
b9395461-680a-4228-9864-c54db55691eb	825326	Thuận An	1196	\N	10.905113	106.699568	\N	\N
5e14bcf3-eefa-4769-b8e7-40a55942bece	1020404208	Vĩnh Quang1	1652	\N	22.905045	105.584877	\N	\N
c48c003e-862c-498d-ad23-45dae967277a	430021	Hòa Phước	2419	\N	15.958889	108.215278	\N	\N
5e934265-ea40-4596-a64d-11e82acfdbdb	225936	Thuỷ Nguyên	3231	\N	20.923804	106.654898	\N	\N
fabb2677-b7da-415e-94de-2c7b8303576d	950591	Trung Sơn	7625	\N	21.339722	104.955278	\N	\N
db2d04d5-b1fd-41da-ac91-0f54f5ecc9f5	1021715305	Kim Sơn 2 (Hợp Kim)	4908	\N	20.658056	105.561389	\N	\N
7fafb5f8-8e22-41af-8bb2-0d0700f87e83	1021715206	Trường Sơn	4990	\N	20.851111	105.460556	\N	\N
3df1704b-ba59-4965-bd23-df2cb343a729	1021715606	Na Mèo	5002	\N	20.67	105.045833	\N	\N
80830d51-3193-4832-a8b4-adf72d17756c	862854	Xã Keng Đu	6817	\N	19.624167	104.105	\N	\N
b0b148b7-1f38-4334-b11b-9e07a6053dd5	663860	Mường Lống	6820	\N	19.531513	104.336383	\N	\N
a28ca756-5e10-481a-a3e5-c251022d01f2	1024015106	Mường Lống 2	6820	\N	19.51949	104.35369	\N	\N
aef62b01-be18-4fbf-940f-945727d98830	053992	Mường Lống	6820	\N	19.531944	104.338333	\N	\N
397f8bbb-57a4-47cd-8b56-ecd12b6a99f6	053993	Xã Na Loi	6825	\N	19.528333	104.159444	\N	\N
f45c3772-9f89-4dd2-9f60-60492f443324	405316	Na Ngoi	6826	\N	19.245833	104.176944	\N	\N
0487d4b5-9852-494e-add0-a911d48f7c59	1024042301	Đồng Văn 1	6989	\N	19.127597	105.12705	\N	\N
ad3b585e-a15e-4f62-8684-51d37838bdc4	1021210501	Nậm Loỏng	5825	\N	22.4125	103.422778	\N	\N
98021bd1-4cc0-4931-913c-d7482b0b2137	633427	Tân Nghĩa - Di Linh	6044	\N	11.637778	108.097222	\N	\N
8e528036-38e4-428e-b1c7-a28cb9e5dc82	730011	Đầu mối hồ Trung Thuần	7859	\N	17.818611	106.343611	\N	\N
6cd3d472-d165-467c-86f9-e772bb01b120	730013	Quảng Tiến	7861	\N	17.836111	106.375	\N	\N
852b3cbd-5ea3-4553-a35a-c2cc600d6799	000397	Hạnh Lâm	7023	\N	18.817962	105.183173	\N	\N
5ab6f305-3499-411f-93a9-3ca9683a8947	1024042401	Cao Sơn	6666	\N	18.903775	105.185259	\N	\N
ef34ab77-93c9-40fc-98cb-908957778782	1024042402	Hội Sơn	6669	\N	18.925917	105.063344	\N	\N
895b0137-38a6-41b9-898e-ec45ccb59fb7	1024015104	Huồi Tụ	6816	\N	19.50174	104.23664	\N	\N
b3f1d74a-6fd6-4eb1-91b9-7a94be7b008d	370004	Quỳnh Lưu	6957	\N	19.145556	105.633056	\N	\N
02a133c7-a188-4621-a88f-5f43f6c24d19	71557	Hà Bằng	7640	\N	13.361	109.129	\N	\N
c47cbb86-4fe9-48cd-9e87-6a9d08096158	061801	An Xuân	7724	\N	13.249961	109.11849	\N	\N
67337c21-cf62-4621-a67a-eff36d06ba42	219031	Lưu vực (Thôn Xuân Lộc) - HCN Đồng Tròn	7724	\N	13.258056	109.141361	\N	\N
775b73e5-a921-4034-8986-e77408faa784	780024	Hòa Tâm	7644	\N	12.935278	109.400833	\N	\N
9107c69a-6954-4110-8c5f-fa41e3ea6a10	074773	Hòa Quang Bắc	7655	\N	13.080607	109.214752	\N	\N
988921b7-a1d4-416a-bd38-135991b2199c	780026	Hòa Trị	7658	\N	13.081111	109.251667	\N	\N
60c433a2-a054-4f4c-ab78-f8386c76b055	1022524001	Tam Thanh	7515	\N	21.095	105.100278	\N	\N
7199b17e-918b-4082-807d-fdd5d6c12154	226650	Văn phòng Thường trực	8085	\N	15.57	108.475278	\N	\N
99f504c8-46dd-4dd1-b882-1dad276a3acf	1024042209	Cam Lâm	6693	\N	19.128649	104.795706	\N	\N
765cf379-423c-4730-9569-80f5fa00793d	1024042211	Khe Nà 1	6694	\N	19.04477	104.736773	\N	\N
6bf5fbaa-3e5d-4a18-af4f-464cc19f2682	1024042207	Cốc Nà 1	6694	\N	19.100815	104.775021	\N	\N
90238d6f-4bab-402e-9534-609d74dcd1b9	539167	Châu Khê	6694	\N	19.108889	104.782222	\N	\N
9b64a1d4-1bf0-4552-b4ff-3a24a067d34c	1024042204	Chi Khê	6695	\N	19.061979	104.840402	\N	\N
4f714fba-9aa5-48d1-9d2c-0926591af375	921125	Hồ Thái Xuân	8036	\N	15.440145	108.586996	\N	\N
b74a467c-f31c-4ac6-b38c-04cda6172338	000442	Tam Trà	8045	\N	15.363975	108.510975	\N	\N
4b5b0c67-14e9-465d-bf56-812eb4b89949	611821	Cầu Hương An	8072	\N	15.778153	108.33126	\N	\N
65d8d27b-5683-4578-b5aa-061a32cf8515	928953	Đầu mối hồ Phú Ninh	8092	\N	15.506648	108.481143	\N	\N
40f9585f-858b-4e13-b863-1836c4029648	355877	Thanh An	8225	\N	14.921278	108.689361	\N	\N
259e825d-a153-4946-86a3-9cc3b7da9b48	1021110003	Sam Mứn 2	2464	\N	21.30092	103.02857	\N	\N
997b388d-965f-4b3d-a303-9d5945620604	1021110002	Sam Mứn 1	2464	\N	21.27476	103.02791	\N	\N
0d30d4dc-7cfc-45a6-a023-9f67724ed455	1021109805	Mường Báng	2544	\N	21.813347	103.361399	\N	\N
667faf43-50cf-4e24-a4c8-848a81a61c8e	270012	Mường Báng	2544	\N	21.84854	103.35523	\N	\N
43e194a7-4210-4b32-8649-7c18a4cfe5b9	973935	Núi Bà	9053	\N	11.414656	106.135042	\N	\N
11268474-43ad-45f2-a8cb-96aa3e9380c6	36376	Xuân Minh	10108	\N	19.968964	105.549079	\N	\N
b30976e8-317c-419c-8e18-fe1f1d6cb18e	1023839601	Vạn Xuân 1	10194	\N	19.821244	105.264888	\N	\N
bc942d2e-3bb1-41aa-8d40-d4d91cd76b99	338591	Thái Phương	9282	\N	20.539606	106.213039	\N	\N
265d7464-afea-447e-b4e4-8ca71f2c0e8d	200010	Lương Phú	9598	\N	21.437041	105.997654	\N	\N
9c6daa9a-35ab-419b-9b79-9b2ebe5260b4	907327	Tân Khánh	9603	\N	21.533306	105.95736	\N	\N
5ca1a06f-e0f1-4296-ae95-6c33d28288dc	200007	Hoàng Nông	9510	\N	21.632007	105.581062	\N	\N
8ddc9b5e-c97c-4d74-b12a-bd742b90c5f6	014516	Bộc Nhiêu	9535	\N	21.800306	105.619861	\N	\N
efab80bd-64e8-4b1d-9f99-b9dfe2c636cf	1023838703	Sơn Lư	10033	\N	20.247496	104.926937	\N	\N
24cabce6-a8b7-411a-81a8-16d1217777eb	1023838701	Sơn Thủy	10034	\N	20.312725	104.746596	\N	\N
4f791d02-03ab-49c8-a1b6-522dca88f582	1023838704	Tam Lư	10035	\N	20.225009	104.904396	\N	\N
1c95da2e-13d9-4df8-bdb9-befe8eeffbc3	1023838705	Tam Thanh	10036	\N	20.190695	104.876356	\N	\N
5e905a93-0f2e-4cea-b247-c7b38e70c4a4	095179	Thạch Lâm	10058	\N	20.324722	105.522222	\N	\N
555cd23c-a8f9-4b0a-8571-87dc93c12a9a	896821	Ka  Dăng	7956	\N	15.881389	107.806667	\N	\N
afdcccad-9b41-442f-bd0b-812b08bbb373	0120619D	Quang Nam - Dong Giang - Xa Prao	7958	\N	15.920954704284668	107.65275573730469	\N	\N
b08266a7-6fb0-40d4-9485-f4bb9fe486d4	193925	Thiện Kế	10686	\N	21.571505	105.465097	\N	\N
5a50e005-3891-4dfc-83d8-a6e1feea2a94	220023	Thượng Ấm	10687	\N	21.742222	105.32	\N	\N
bfbff7b0-3212-48d0-a027-30014f2f913c	189329	Tân Thanh	10690	\N	21.607222	105.404722	\N	\N
8c7a5175-3b14-4297-9a47-d84e5b87f4a7	228930	Quế Lưu	7997	\N	15.558755	108.11075	\N	\N
aa59afc4-b5f0-4f69-8b40-c811587208ef	974046	Sông Trà	7999	\N	15.540833	108.042222	\N	\N
cd81ccf6-658c-4030-8846-2ec365dd8143	835065	Trà Ôn	10813	\N	9.96449	105.922017	\N	\N
e27e5ba9-d2e8-4bd5-8aa2-5e09dcc2f24c	1021513715	Nậm Có 1	11019	\N	21.83687	104.266304	\N	\N
1ec1abdf-06b2-491f-b62e-68e34ca0a507	1021513714	Nậm Có 2	11019	\N	21.825198	104.295671	\N	\N
3996ba09-d467-4814-9efb-71e385c7a1ae	917458	Nậm Có	11019	\N	21.816292	104.290242	\N	\N
aa26301c-5469-45fa-9c1e-0b7fdd5eaf2c	1021513701	Nậm Khắt	11020	\N	21.686244	104.185922	\N	\N
2fd3c983-9250-45f8-83e3-e0e1e493dbc0	228864	Nậm Khắt	11020	\N	21.707222	104.220556	\N	\N
66b9c93a-fae2-4496-9fae-6dcc6730a2ed	96353	Khau Phạ	11021	\N	21.751944	104.179444	\N	\N
8c757133-56dc-412f-9921-a1763711fdc5	909419	Làng Nhì	11032	\N	21.474266	104.536083	\N	\N
aa9db262-63f7-4a80-9ae5-93715b3094a8	1021513902	Pá Hu	11033	\N	21.50615	104.46769	\N	\N
1f1326b7-0242-49db-b543-5c7e54d6528f	1021513905	Pá Lau	11034	\N	21.556944	104.461111	\N	\N
0a8ace0a-c043-4b85-bd11-79fcf9177424	210022	Phình Hồ	11035	\N	21.529444	104.539167	\N	\N
380c2242-4cb4-4c4c-9685-eaabc9ba2654	1021513901	Tà Si Láng	11036	\N	21.483056	104.585278	\N	\N
ced7ea7b-2c31-4817-8067-0827501a99f6	911484	Tà Si Láng	11036	\N	21.483074	104.585769	\N	\N
e9e78705-580a-462c-95fc-3022a4550f60	1021715005	Hiền Lương	4863	\N	20.858056	105.234444	\N	\N
befd247d-21af-412d-aa14-1e0c403ea214	1020404702	Cao Thăng 2	1803	\N	22.7776154	106.5719184	\N	\N
cc3bf14a-f4e1-4443-b4b2-d87b27f61ae3	936030	Phường 12 - Đà Lạt	6006	\N	11.969039	108.477744	\N	\N
ed9bb09b-10f5-4434-b3e3-5818ffd0b6fb	71512	Thạch Hãn	8614	\N	16.75	107.183	\N	\N
bba6e241-e57c-4685-b8c4-bb06db235086	830004	Ngã Năm	8720	\N	9.564285	105.604241	\N	\N
118200eb-846a-4551-b8eb-988059a42c99	046082	VP CN Thủy Nông Bảo Định	10459	\N	10.389444	106.340833	\N	\N
653c7da6-6cf9-4e73-b524-f68900de9a5a	690018	Khánh Hội	1616	\N	9.344153	104.832948	\N	\N
95b64cfd-935a-4c3a-94a4-b5a87ddc5bc2	450412	Thanh Oai	4395	\N	20.848333	105.7575	\N	\N
e46ae5f7-a41c-47da-9c0d-f76b2f1310de	740006	Đập, thủy điện La Tó	8533	\N	16.505556	107.029444	\N	\N
9af104ec-3912-4698-adb1-d58876eedeaa	386744	Thọ Sơn	7390	\N	21.634356	105.184436	\N	\N
cc1349ae-6017-48bf-b534-061ef5d00415	750064	Điền Hương (Phong Điền)	9154	\N	16.70528	107.36369	\N	\N
00e1eb63-7b2c-499f-941d-e61307f81042	1021412503	Chiềng Sung	8806	\N	21.30945	104.090026	\N	\N
562c92b8-fb67-4226-92c6-aea19bba3630	1021412504	Cò Nòi	8808	\N	21.118889	104.172222	\N	\N
2abf8cde-4ae2-431f-bd25-f1490acb5a20	778232	Hua Nhàn	8773	\N	21.18983	104.24372	\N	\N
52e68290-22c9-4819-a4c5-1dfbcb85b242	1021412102	Làng Chếu 2	8774	\N	21.296111	104.39	\N	\N
c5b21dd9-e037-44a7-bb68-86ad1c252959	1021412103	Làng Chếu 4	8774	\N	21.29389	104.3605	\N	\N
54084b6e-aa53-45c3-9614-621ae919f305	1021412108	Mường Khoa	8775	\N	21.19388	104.310833	\N	\N
088fdbf2-595d-4fe8-bac1-be3ef3fea77c	1021412101	Tà Xùa 1	8776	\N	21.275443	104.43439	\N	\N
2e161c43-af06-42ed-9116-4bc783815d55	260003	Đứa Mòn	8900	\N	21.144167	103.466667	\N	\N
eac79d37-21dc-44d3-8bd2-87a9d0662ff3	1021412606	Huổi Một	8901	\N	21.036417	103.701548	\N	\N
9097078a-6d0a-442b-9c66-624462599551	670005	Tà Lọt	100	\N	10.479374	104.966225	\N	\N
e2696311-434a-427a-b61e-6d8b8370adee	670007	An Hảo	100	\N	10.483168	105.024268	\N	\N
8383061b-dab6-40a3-bd03-b8ca661a0a65	670006	An Nông	101	\N	10.557563	104.919063	\N	\N
cf5fcc2f-b84c-4693-9948-64e8f63ba82c	384711	Thới Sơn	104	\N	10.625553	105.01086	\N	\N
0e8217d3-b935-489b-9fb8-8226e97bd127	670011	Vĩnh Xương	126	\N	10.896673	105.17531	\N	\N
acf39ded-1ae3-4218-ac6e-6e4f37dc3b5f	670010	Châu Phong	115	\N	10.7825	105.166944	\N	\N
306aabc7-58a7-43f6-8573-b4f8770890d2	201575	Núi Sập	132	\N	10.26719	105.2706	\N	\N
d54721de-1440-48d6-b498-da19af30466c	670003	Cô Tô	147	\N	10.36657	105.015599	\N	\N
23b09701-bb1e-429f-a4cf-2d6e9a64205b	670004	Hồ Núi Dài 2	149	\N	10.486057	104.959074	\N	\N
a6602786-f9e4-47ba-8dcf-8c5bc0c64277	670001	Hồ Soài Check	152	\N	10.405253	104.980691	\N	\N
2aa22712-a894-4b58-bd5d-b49227773bdf	670002	Hồ Ô Thum	153	\N	10.375606	104.970859	\N	\N
99cf0678-b30a-4a4d-9b19-456d8c6f011a	34419	Long Điền Tân	169	\N	9.07299	105.353062	\N	\N
90f1ce0a-4a92-4fe7-aeee-f54beafd9f8f	940011	Định Thành	172	\N	9.1338	105.28507	\N	\N
f755faa6-7984-4bd7-a4de-848cbe6aaa5d	940003	Điền Hải	174	\N	9.103547	105.496782	\N	\N
79814fb7-29fa-494d-90a7-2ccd435a6407	940010	Phong Thạnh Đông	185	\N	9.31118	105.4925	\N	\N
d4312bc4-fe70-4711-a036-13458509d89b	927297	Ngăn Dừa	191	\N	9.565556	105.449444	\N	\N
8888145d-8658-49a4-884c-852e8550321e	940001	Ngã Tư Ninh Quới	194	\N	9.485618	105.513552	\N	\N
d34629fc-c61e-4f61-9079-cd0243507901	813800	Sốp Cộp	8879	\N	20.940949	103.598201	\N	\N
f554635a-89e1-4b80-aeb1-80d541b2c15f	1021412707	Sam Kha	8880	\N	21.043866	103.39084	\N	\N
50dffcc7-27d7-4170-b2ae-d155672f92c4	260002	Sam Kha	8880	\N	21.044167	103.390833	\N	\N
a5643d83-9d40-4e9c-aa15-68894dce979b	940006	Hưng Phú	207	\N	9.41	105.543056	\N	\N
00fc569d-4350-4309-8c4f-490ed991b7e3	802054	Chiềng Mai	8803	\N	21.208048	103.982164	\N	\N
a06cda72-4d2c-4588-8514-e93f6e9c2cbd	1021412507	Chiềng Nơi 2	8805	\N	21.1775	103.744167	\N	\N
741fe375-a1d9-4a8b-9f2f-30a0921f5b18	1021412508	Chiềng Nơi 3	8805	\N	21.1325	103.768889	\N	\N
590479f4-85d8-430d-8d74-6fa1120805fd	1021412104	Hang Chú	8771	\N	21.364051	104.32587	\N	\N
cbc49883-64f8-4220-b3d5-b082e6977f8c	821350	Tân Xuân	8951	\N	20.64859	104.76109	\N	\N
b1bfee4b-77f2-4768-9bca-e0578d0048cb	860024	Phan Rí Cửa	1431	\N	11.17427	108.56602	\N	\N
b720e623-56b0-4954-9b2c-45f566c114ed	488570	Song Mai	232	\N	21.301944	106.179167	\N	\N
d858630c-6ccb-4fa5-9bdf-327fd56ba39c	1021412109	Phiêng Côn 2	8779	\N	21.116389	104.4325	\N	\N
f2c4d13a-ab40-4a35-8c16-439f767ef5ae	1021412106	Tạ Khoa	8779	\N	21.161328	104.376376	\N	\N
53b67bdf-8065-4610-952e-c0b29b79a090	1021412312	Tân Lập 2	8796	\N	20.911136	104.630812	\N	\N
bd3c9147-ea83-427f-845f-4831fc687182	1021412311	Tân Lập 1	8796	\N	20.93125	104.61369	\N	\N
7eebbcb4-436a-4398-89e2-e25e4c6ea2e6	260009	Tân Lập 1	8796	\N	20.942406	104.621924	\N	\N
a739d25d-7f1b-470f-b12d-50fa22aef1db	260023	Chiềng Ban	8797	\N	21.235	103.950833	\N	\N
d3e1b961-35c2-467e-8788-867ab401ea26	1021412505	Chiềng Chăn	8798	\N	21.29	104.105278	\N	\N
c3cb8960-b67a-475a-9288-cf41d813cf4c	874341	Chiềng Chăn	8798	\N	21.27226	104.12966	\N	\N
2401a9b3-773a-43be-9857-cad372af1858	1021412502	Chiềng Chung 2	8799	\N	21.22	103.9	\N	\N
f846940b-1851-4e7a-9fe5-6c2af6716d48	1021412501	Chiềng Dong	8800	\N	21.184813	103.965969	\N	\N
9cb8826d-3101-4334-9543-cadd4fb1c917	1021412506	Chiềng Lương	8802	\N	21.080556	104.072778	\N	\N
01627296-f38c-4eec-ba15-100a1f8261c4	489822	Mai Đình	256	\N	21.2425	105.948611	\N	\N
36e5a906-f727-4dcf-87ed-0a7d98f50f61	1021412107	Chiềng Sại	8768	\N	21.065	104.489167	\N	\N
6bd8357b-252e-45d1-a0f5-f50256182381	260022	Chiềng Sại	8768	\N	21.079722	104.513611	\N	\N
36b72792-19fe-489b-8484-b470f7362ad3	869071	Bố Hạ (NT)	277	\N	21.435877	106.283154	\N	\N
32f8caed-4a7f-4a88-8683-904bb713c3ef	587703	Chiềng Khay (Quỳnh Nhai, Sơn La)	8864	\N	21.856943130493164	103.65694427490234	\N	\N
a5a11674-41de-42a9-bd6c-5f0234422f51	1021411808	Chiềng Khay	8864	\N	21.93825	103.63095	\N	\N
501f0d28-55c5-4fd5-a525-e135f02d36d0	1021411803	Chiềng Khoang	8865	\N	21.55872	103.6893	\N	\N
8950e668-ecbb-4a0c-81b1-4572afdd399f	351435	Chiềng Ơn (Chiềng Ơn, Sơn La)	8866	\N	21.69999885559082	103.6385498046875	\N	\N
fab508e0-906f-40e1-9592-e0de3977fe2c	1021411809	Chiềng Ơn	8866	\N	21.66791	103.70372	\N	\N
787a00cb-ca89-40c0-8f48-bbebfe84ddbf	1021411806	Mường Chiên 2	8867	\N	21.862379	103.580589	\N	\N
245ff344-d6e9-4075-a3c7-4e15e3b18d64	1021411801	Mường Chiên 3	8867	\N	21.82914	103.58736	\N	\N
e10b8a00-d362-4362-9354-447f1696124c	1021411905	Mường Giàng	8868	\N	21.66	103.59722	\N	\N
273804dd-0f45-484b-acce-15dcc74333f1	260130	Tang Phứng (Quỳnh Nhai, Sơn La)	8869	\N	21.70694351196289	103.73194122314453	\N	\N
d537bb60-d0a8-4257-8eeb-1080c933704e	1021411810	Mường Giôn	8869	\N	21.798242	103.65968	\N	\N
f95699e8-c246-4cd3-8e2f-a24a2c103212	226662	Mường Giôn	8869	\N	21.76653	103.67132	\N	\N
201a896d-c05d-4532-a808-867dfcfba271	226661	Mường Sại	8870	\N	21.60971	103.68711	\N	\N
d99324ad-ad91-426f-b98f-d60f3cc12a40	315718	Nậm Ét (Quỳnh Nhai, Sơn La)	8871	\N	21.560110092163086	103.7489013671875	\N	\N
7350425c-8017-4fdb-9cd5-551b7f4517bb	1021411802	Nậm Ét	8871	\N	21.58706	103.71214	\N	\N
323ddf17-c5bc-48cc-b6e3-50c33478581a	1021411805	Pha Khinh	8872	\N	21.79283	103.58543	\N	\N
6618aee0-743e-41cc-984b-0b2addd39d2c	1021411804	Pắc Ma	8872	\N	21.76113	103.61468	\N	\N
93d549fe-f869-4d43-b423-5d33798193de	1021412701	Mường Lạn 1	8874	\N	20.769067	103.737643	\N	\N
c33df8dd-2def-44a9-be9d-4081f0d6cb76	1021412702	Mường Lạn 2	8874	\N	20.796084	103.679023	\N	\N
70f67dc7-5eaa-46cd-aade-1eda25b655ce	845756	Mường Lạn	8874	\N	20.80355	103.71416	\N	\N
12ad5369-57d5-4ddd-ad65-08a780399e0c	1021412704	Mường Lèo 2	8875	\N	20.863921	103.345736	\N	\N
146f843a-2f78-4775-aae9-30840cafb05c	1021412703	Mường Lèo 1	8875	\N	20.884176	103.335311	\N	\N
9593b5e4-365a-4481-83d7-e05baf66d836	830402	Mường Lèo	8875	\N	20.928889	103.3175	\N	\N
955dc9f0-2607-4fe2-a8c5-c72893c131ad	1021412803	Song Khủa	8949	\N	20.931232	104.873179	\N	\N
132fe871-6afc-4e3a-bb6f-70d0259aba4b	451259	Tân Hoa	338	\N	21.391667	106.715556	\N	\N
bd484a69-256c-4ef3-8b30-9148b444fd37	425938	Cống Trạng	388	\N	21.325536	106.159776	\N	\N
1d99057c-b4f5-437c-8b13-ffba08ac8382	285864	Việt Yên	394	\N	21.275042	106.10084	\N	\N
68a5da7e-9461-45ec-b6af-d88abb675d08	403143	Trúc Tay	411	\N	21.228231	106.132676	\N	\N
0829d751-2e7f-4abf-80f0-f33c5255b65e	478334	Tiên Sơn	408	\N	21.243889	106.036944	\N	\N
abbde3cc-21bb-48dc-b36e-4bea426e8f25	399040	Cổ Pháp	414	\N	21.156944	106.289722	\N	\N
9542b6e9-ae09-4582-b11e-db54fd0f8a92	819350	Yên Dũng	432	\N	21.230833	106.259815	\N	\N
0001b2fa-03de-4dc8-b833-f9e0356a2f88	335172	Yên Thế	437	\N	21.472643	106.12762	\N	\N
8a0b35b5-01cb-42d2-adb7-4d816f58aae5	970001	Cẩm Giàng	455	\N	22.204036	105.877654	\N	\N
6e88eb4a-fbab-4b97-93c3-8df43cf1199c	923191	Lục Bình	460	\N	22.245787	105.845325	\N	\N
40fd15ad-4683-459b-b573-9a76bfc8eff0	679192	Đông Viên	495	\N	22.144444	105.661389	\N	\N
23e973fa-1964-438e-a7e1-76eec253eeaa	1020606601	Vũ Loan 1	543	\N	22.293889	106.147222	\N	\N
a4156717-4c5e-4adf-80cf-6f386fd2f029	722818	Yên Lạc	547	\N	22.236667	106.185278	\N	\N
dc787917-6382-4968-9a07-13b0382b43f8	1020606004	Giáo Hiệu	565	\N	22.613889	105.616111	\N	\N
c070b650-6a88-4b64-aed5-5e75f9031247	040752	Chi cục Thủy lợi Bắc Ninh	588	\N	21.181875	106.075857	\N	\N
21f276d7-daed-4459-8b87-2759d4b8a353	040208	Gia Bình	603	\N	21.071074	106.159028	\N	\N
146ea2ce-b0dc-45bf-bfa8-b169e398d62a	650001	Bình Thủy	1438	\N	10.066733	105.748442	\N	\N
20955592-10f2-4035-99c6-764f328ed752	041031	Lương Tài	623	\N	21.043748	106.291951	\N	\N
bf1a5481-860e-4859-a61d-b1f1e7039179	354941	Thị xã Từ Sơn	649	\N	21.1144	105.95542	\N	\N
124061d2-bc28-4355-b6d4-168c0fcb748f	650002	Tân Phú	1460	\N	9.971634	105.811101	\N	\N
9164cdea-8740-4dec-bcd0-9bf607a7fd86	040830	Tiên Du	684	\N	21.09396	106.03463	\N	\N
15ae79c3-65f9-4c95-b183-4e45191fdc2b	225440	Yên Phong	689	\N	21.193228	105.954136	\N	\N
0d0446ec-4cd6-4cda-a33a-9de51f59da5d	040743	Yên Phong	699	\N	21.200717	105.956025	\N	\N
815756d7-ba00-4288-a50d-b5787b75a21c	200003	Phương Giao	9677	\N	21.693902	106.169195	\N	\N
8bc1823f-801c-4331-aba2-6d2ff9a1b7ec	200004	Tràng Xá	9681	\N	21.694722	106.075556	\N	\N
a3c38976-32ac-41d6-9d44-d36199d82980	234831	Vũ Chấn	9682	\N	21.806609	106.011613	\N	\N
f2294aa2-0a92-408e-9be2-5ec0aa9ff2a2	710005	An Ngãi Trung	725	\N	10.070823	106.540435	\N	\N
95728a94-e448-4ab1-a99d-6aaeede9ef78	710002	Định Trung	749	\N	10.222885	106.618106	\N	\N
199874e6-f923-4d27-a177-a9b99a220908	430018	Hồ Thạc Gián	2443	\N	16.063836	108.209119	\N	\N
e7ddf1b1-d658-4a6d-871b-13ad33a12f1b	650010	Đông Thuận	1500	\N	10.018595	105.477518	\N	\N
9de42739-5764-444c-84f8-4c830d92585e	710001	Tân Phú	791	\N	10.289655	106.202489	\N	\N
6d210064-223b-4aa4-9c73-2fe860a7be2d	330791	Giồng Trôm	798	\N	10.146044	106.520516	\N	\N
6a59f685-70be-4b49-bd29-29c922e0b97f	710003	Cẩm Sơn	837	\N	10.02987	106.367326	\N	\N
db3d1fc6-a6ac-4fe3-bc1a-bff809b6fb57	72045	Hương Mỹ	840	\N	10.015443	106.400861	\N	\N
773c06ae-3cf6-42f7-863c-93daee8831ba	392142	Mỏ Cày	841	\N	10.132945	106.335286	\N	\N
6b1c6237-e51d-49cf-b40b-25eca57099a0	710004	Phú Khánh	860	\N	10.039528	106.4468	\N	\N
f688a494-5f44-4162-97bf-7a8405daf336	270006	Chi cục thủy lợi	2492	\N	21.397778	103.020278	\N	\N
ca6d8b1c-45e6-4cbe-b264-230cb3b034b0	720007	Hồ Đá Bàng	886	\N	10.64178	107.24086	\N	\N
93bebf6b-44ef-413f-8f47-2c37a3f6f4d7	763715	Ký Phú	9513	\N	21.549444	105.649722	\N	\N
0c08504e-07f6-4ef5-819f-bf1e9e7f32cf	387847	Xuyên Lộc	944	\N	10.539189	107.409764	\N	\N
6c9fcfbf-640a-444d-9657-214dd2806191	430007	Khe Cạn	2445	\N	16.066667	108.177778	\N	\N
d669ea52-f3e6-4692-83bb-8ee717390c71	48864	An Nhơn	965	\N	13.899999618530273	109.11666870117188	\N	\N
dd2ca444-f17c-4a09-a471-f3175f36591c	883430	Suối Hai	3938	\N	21.184653	105.362578	\N	\N
9cc54682-a34a-4212-8b1e-4a9e898eb729	850012	Lợi Hải	7342	\N	11.712531	109.057745	\N	\N
dee384de-7cd7-49a0-8d49-d92e13e39aed	003645	Bồng Sơn	989	\N	14.431876	109.015073	\N	\N
c52e8f4d-7d67-44d9-a7d7-ca24838edd93	59510	Yên Lập	8469	\N	21.004992	106.855145	\N	\N
826d2031-b6ce-4384-8cee-f51bac783f6b	525723	Cầu Rậm	4203	\N	20.687778	105.700556	\N	\N
0fd63f0f-7bb0-4669-aba7-7c3a3ee136a7	135130	Hương Sơn	4205	\N	20.614444	105.786944	\N	\N
5d4597f9-6e9a-4281-9549-2a1e4c1f6005	48/96	Hoài Nhơn	1001	\N	14.516666412353516	109.03333282470703	\N	\N
bce5f466-38dc-4003-8833-7e3d579548d5	220025	Văn phòng BCH PCTT	10700	\N	21.823056	105.221389	\N	\N
183c89d4-af34-4898-b223-ae6467b2f0aa	690011	Trí Lực	1600	\N	9.44865	105.14581	\N	\N
8d03e548-2ad6-4210-9177-d030f024f5d2	1021715009	Tiền Phong 2	4869	\N	20.796389	105.132222	\N	\N
d7dbc7ee-f0f3-49a2-9157-5275ad64adaf	001901	Thị trấn Bình Dương	1024	\N	14.293487	109.083056	\N	\N
de0adf35-2f5f-4299-b9b6-9037389f0a5b	1022018103	Mông Ân	5626	\N	21.971988	106.3092892	\N	\N
f295f738-cc4a-4543-91c3-6b914d580bd6	1022018204	Tân Mỹ 1	5790	\N	21.9810175	106.6670429	\N	\N
cc685f68-a31f-463d-8894-b6b7e2a4687a	1021211004	Khoen On	5920	\N	21.757778	103.875556	\N	\N
1aed8fc6-d6dc-4295-aaf9-06f4c6121bba	982720	TĐ Huội Quảng	5920	\N	21.696942	103.877816	\N	\N
a887a969-de7b-4ec3-a183-a994f30c19fe	045831	Hồ Hội Khánh	1032	\N	14.206292	108.99553	\N	\N
d9be4f18-0230-4dfc-8c92-c145e20d7e08	770067	Núi Bà Hỏa	1044	\N	13.78125	109.2155	\N	\N
74694885-a63f-4fed-8443-bc0a73c252e0	582484	Đảo Cù Lao Xanh	1053	\N	13.61273	109.35278	\N	\N
e60bf7e3-d7c8-40ab-aa82-6570937ea447	71549	Bình Nghi	1069	\N	13.939471	108.869171	\N	\N
e7a892c0-cd69-4cd7-9f8c-18f61148fa06	523017	Tây Thuận	1070	\N	13.910833	108.921944	\N	\N
87a063bb-b25e-4960-9c37-2d0d430a36ff	040760	Hồ Hà Nhe	1101	\N	14.038623	108.827657	\N	\N
e02adc8e-e991-4d16-87c4-2eb0cb4fb589	905531	Yên Đổ	9621	\N	21.801111	105.7	\N	\N
ef0535cf-776d-4513-b3f3-8541d8e07e2b	200018	Yên Lạc	9622	\N	21.771389	105.752222	\N	\N
5f5802fd-785f-44c6-8289-0867de86df74	1020404205	Quảng Lâm 2	1646	\N	22.8078579	105.4277052	\N	\N
a4aae148-914a-4cc3-abc7-c2d612d5a212	1020404204	Quảng Lâm 1	1646	\N	22.8058198	105.4318627	\N	\N
cafad187-5033-4cdc-8790-c21cf9b1a6d7	950019	Thị trấn Một Ngàn	3298	\N	9.928889	105.636667	\N	\N
6442fa00-a89f-477a-a1be-f8dfd98594e9	898573	Liên Minh	9674	\N	21.6875	106.054167	\N	\N
358902d0-b169-4b3e-93e1-90f98c358e81	200001	Nghinh Tường	9675	\N	21.866389	106.068056	\N	\N
f30048ec-f0f9-4f2c-9b1d-a17001159555	519263	Bình Long	1199	\N	11.655833	106.606944	\N	\N
483ef4d7-5cfe-457d-8ebb-3de6c872d94b	930010	Tân Tiến	1208	\N	11.932111	106.742315	\N	\N
32311a7d-c261-49bd-b9ee-c955bfd04017	402778	Bù Đăng	1216	\N	11.808449	107.243799	\N	\N
b259227f-9504-405a-ad24-14c203cf70d5	860006	Hồ Trà Tân	1337	\N	11.075	107.491111	\N	\N
b44fe5bc-9662-47d4-9141-b3021f671a87	860017	Tân Đức	1343	\N	10.84355	107.59477	\N	\N
468fa66b-db25-4722-af2d-a5a0cdab6dd0	860004	Phước Hội	1382	\N	10.658889	107.774722	\N	\N
a212383d-ccb6-4613-a38d-4439731feeb0	48872	Ayunpa	2589	\N	13.416666984558105	108.44999694824219	\N	\N
afafd0ff-7a12-4429-8ab8-60e1eed70286	48866	Pleiku	2789	\N	13.966666221618652	108.01667022705078	\N	\N
41ce192a-8427-4225-8ba2-9644b77d5be7	860016	Tiến Thành	1406	\N	10.83083	108.0353	\N	\N
12cd5a1c-9324-4540-be67-eda280e7f737	426984	Suối Kiết 4	1424	\N	10.9539	107.6507	\N	\N
1a85f3b3-0a1f-46b4-bfee-af847b5ac304	505148	Suối Kiết 3	1424	\N	10.953898	107.650684	\N	\N
6632b32c-c59b-4d81-87d8-0fa2c09e0fbf	860014	Vĩnh Hảo	1435	\N	11.312177	108.755424	\N	\N
368d3750-ed0a-44f7-82e9-7f43560ef2d5	650003	Ba Láng	1455	\N	9.984231	105.742431	\N	\N
c2f7ad79-c6db-4f7d-9719-21a000292aef	650004	Trường Long	1488	\N	9.983322	105.632084	\N	\N
0e70dea8-6f95-4f8c-9e14-9a2a522942fc	737213	Thốt Nốt	1495	\N	10.217222	105.57	\N	\N
801d024a-a504-47f8-ae21-495cba510401	950013	Lâm trường Mùa Xuân	3342	\N	9.757222	105.824444	\N	\N
a525eaee-1c90-457f-8027-c90070a3aedd	690017	Nguyễn Phích	1621	\N	9.31486	105.0198	\N	\N
899f85a2-7b19-4c60-8ac5-ee4e80b2af96	650009	Thạnh Lộc	1512	\N	10.204082	105.435449	\N	\N
0ebb8b20-2afa-479b-b001-79daaea1db91	650008	Vĩnh Trinh	1521	\N	10.276155	105.444892	\N	\N
6db1412e-45fd-4eaf-8f6b-3be219d9d45b	690004	Lý Văn Lâm	1526	\N	9.156007	105.13309	\N	\N
2784fdd0-3b0b-4bbc-97bf-e85c7e4f3d3f	690015	Ngọc Chánh	1551	\N	8.92672	105.18137	\N	\N
8815eca6-0d01-4284-9c64-75a09f3a53c8	188249	U Minh(BĐ)	1622	\N	9.408333	104.969444	\N	\N
216ee469-cbc0-4e8d-9c34-f3804b5b8345	690013	Hàm Rồng	1567	\N	8.85439	105.02425	\N	\N
ad2b2a01-bec3-479f-875c-3cae2f828263	690009	Lâm Hải	1570	\N	8.735962	104.916264	\N	\N
d410a5b7-c9fd-4df3-9011-cbffba3c2931	690006	Tam Giang Đông	1573	\N	8.821891	105.25448	\N	\N
ee1fea71-d3fa-4d39-afc9-89f8f43bbecc	562614	Phú Tân	1583	\N	8.91617	104.868894	\N	\N
56e57444-c614-4dd4-a812-1eb9c5ba0996	690007	Rạch Chèo	1585	\N	8.815616	104.906269	\N	\N
cd56d140-2c86-496f-8b41-1596026e63f7	690001	Biển Bạch	1590	\N	9.5117	105.014713	\N	\N
5e0ac836-6e6d-4098-8c28-cd1dfaba41c2	496054	Thới Bình	1598	\N	9.347786	105.090172	\N	\N
f791fe43-77a4-4c8d-9850-0fd10ab6094f	690020	Khánh Bình	1602	\N	9.153877	105.070323	\N	\N
1f3491e8-9bea-4a66-97e3-93908f08d93a	35621	Trần Văn Thời	1614	\N	9.075293	104.966117	\N	\N
bafe90a4-57e3-44d3-bc34-e5f7900ef04e	690002	Khánh An	1615	\N	9.239542	105.033984	\N	\N
57c33491-1245-40d7-8c46-04a86977461c	1020404202	Mông Ân 2	1642	\N	22.8102113	105.5157921	\N	\N
77910c49-44c8-42f9-b1d6-5a6100f0ac61	1020404206	Nam Quang	1647	\N	22.8689334	105.4525115	\N	\N
c4dd59b8-797c-4bca-881e-c096e575f14c	1020404210	Thái Học	1649	\N	22.7567136	105.4710175	\N	\N
7072cc21-a018-43b5-a572-07b3ecb4bab2	110014	Thái Học	1649	\N	22.756667	105.473056	\N	\N
33d63741-ec6d-4705-be31-674aca865c75	1020404801	Thanh Nhật 	1676	\N	22.6858742	106.6665865	\N	\N
ccefb452-16a6-4e50-b18f-6bd188b9c041	705024	Hạ Lang	1676	\N	22.687466	106.672166	\N	\N
50e20342-7591-4c3a-b216-99130067a6bd	1020404506	Mã Ba	1681	\N	22.8245978	106.1819832	\N	\N
af3c534d-42b5-4e3b-b1aa-45195aeabf55	1020405201	Hưng Đạo 1	1722	\N	22.5587997	105.9422006	\N	\N
489ae73b-351f-42f7-86c7-3e475070cf8e	601874	Minh Thanh	1726	\N	22.656477	106.016883	\N	\N
e5c72cd1-9d24-4727-9ac7-4b0bf780b77f	110011	Tà Sa	1726	\N	22.656389	106.016944	\N	\N
80bfec7c-0cd0-463b-9574-c796e8f16e8e	1020404706	Đoài Dương	1819	\N	22.7679475	106.4954576	\N	\N
4f0c845b-37f4-4700-b755-6a86c41ad240	091966	VPTT BCH PCTT&TKCN Đăk Lăk	1840	\N	12.690833	108.059444	\N	\N
eee6776c-190f-488a-bcfb-a51f9e71b0e3	871627	EakNốp	1896	\N	12.803333	108.541111	\N	\N
136ad229-f4d1-4816-b281-6c04977e443c	470013	Dang Kang	1924	\N	12.599167	108.33	\N	\N
fe29c947-f5b4-424b-972f-1247c498411d	283008	Krông Bông	1932	\N	12.513333	108.340278	\N	\N
03bd5e59-c82a-4425-824b-c5428cf6a5fe	1026766306	Đắk Lao 1	2016	\N	12.459444	107.612778	\N	\N
1af8adcb-3874-4a9d-9763-28bdeae57877	1026766301	Đắk Lao 1	2016	\N	12.459444	107.6125	\N	\N
1b14996e-9bf2-4b00-8617-ede67d174b7f	355682	Đăk Săk, Đăk Mil	2019	\N	12.43125	107.670333	\N	\N
61e5a305-e9c7-4c1d-9501-b9c77df25334	480006	Long Sơn, Đăk Mil	2022	\N	12.452778	107.726667	\N	\N
09d77ef2-872e-4fd2-899b-64e5dd39f5ba	001194	Định Quán	2120	\N	11.196944	107.352222	\N	\N
c6b24a28-515e-4e65-9da3-33a54456a613	494436	La Ngà	2122	\N	11.158947	107.248916	\N	\N
e5f0b5ec-d813-45f6-8a1f-5538412f6480	935740	Phú Thạnh	2171	\N	10.7325	106.852778	\N	\N
840388c8-7fe5-4243-9882-ca4465bd53ab	658771	Thống Nhất	2219	\N	10.952778	107.01	\N	\N
a3864ce0-9fe0-4f16-b2bc-93b33cc1c121	00206A24	Hai Phong -Tien Lang - Hat Tien Lang	3250	\N	20.72403907775879	106.55359649658203	\N	\N
f75c1548-9e8a-4360-aa68-9e4ec79c1818	1020404209	Đức Hạnh 1	1640	\N	23.0367511	105.5326449	\N	\N
9172c923-9132-4a85-907f-5edd70b90038	1020404203	Nam Quang  2	1644	\N	22.8819962	105.4461923	\N	\N
10f24181-85de-4384-8580-4625b8ac724e	220021	Thượng Giáp	10658	\N	22.612778	105.503611	\N	\N
b12ac128-0247-481d-8e75-093ecf0472e9	1020404313	Xuân Trường 2	1639	\N	22.9079484	105.8026741	\N	\N
ce26ec16-d01a-461f-a47d-c67823d3e8e1	731750	Sông Ray	2112	\N	10.7625	107.348333	\N	\N
a953545c-0d46-4fac-ad4a-a17a20c68802	646653	Đức Hoà	6312	\N	10.899722	106.390833	\N	\N
ac9f75fa-38f6-431d-8630-4cd5dbbdf1d7	00205E93	Dong Thap - VQG Tram Chim - Tong Hop	2356	\N	10.681159019470215	105.55734252929688	\N	\N
3c005732-32c9-49bf-942c-36e9adab6cc3	135231	Yên Nhân	10202	\N	20.030129	105.126118	\N	\N
45128704-13b8-492e-9da9-4142105af4c0	430001	Hòa Phát	2393	\N	16.041387	108.183313	\N	\N
8b13b6a0-0655-4197-985b-4580438a4469	430002	Hòa Xuân	2396	\N	15.995435	108.211311	\N	\N
50b09715-e173-4521-96ad-939748b1ddd9	48855	Đà Nẵng	2405	\N	16.043333	108.206667	\N	\N
5dd12cf4-2913-4607-b9be-68c673712a30	306474	Kênh Nguyễn Đình Tựu	2405	\N	16.054174	108.188345	\N	\N
fcbb290e-6b6f-4192-ac96-c62332730428	074775	Trạm bơm An Trạch	2421	\N	15.953628	108.154946	\N	\N
1d427609-db78-4338-a4b4-9b5903501ea1	480537	Đại học Bách Khoa Đà Nẵng	2424	\N	16.077385	108.153458	\N	\N
55d5fa41-2b5d-4dda-82ed-a3f7bf5b345e	430022	Hòa Hải	2427	\N	15.982778	108.268056	\N	\N
1866086d-2f5f-40d3-81ec-638c87d1beed	430003	Hòa Quý	2428	\N	15.985556	108.240833	\N	\N
62ccf19f-6d35-418e-b0ab-98cb4091bfc0	1021110207	Ẳng Tở	2498	\N	21.536948	103.256124	\N	\N
74104d24-7111-4b5a-9a74-d02e594ed03a	657263	Mường Ảng	2500	\N	21.51916	103.222296	\N	\N
a3fc2d02-c80b-41c9-8045-16193ae61259	270007	Mường Chà	2510	\N	21.753889	103.089444	\N	\N
aefb1de4-3318-4c54-829f-36312f1350e0	1021109701	Pa Ham	2512	\N	21.851787	103.286906	\N	\N
9afbc0b1-841a-4e02-affc-1672f61c450e	260117	Pa Ham (Mường Chà, Điện Biên)	2513	\N	21.929115295410156	103.24112701416016	\N	\N
26a01f24-6394-4a0e-aa83-cd44ed78bf87	1021109503	P. Na Lay	2555	\N	22.032153	103.151528	\N	\N
3f1bb400-9f33-4cca-a70c-bd7b0ef15fe4	1021109903	Mường Thín	2561	\N	21.62952	103.353462	\N	\N
fbeffe99-06d7-413f-a136-b40b34266238	1021109902	Nà Sáy	2563	\N	21.576799	103.359902	\N	\N
50d4edd2-256d-4b07-ad73-73d38519cf67	48867	An Khê	2576	\N	13.949999809265137	108.6500015258789	\N	\N
c029f544-6993-4569-b25b-bfeaa2b1cd73	71708	An Khê	2577	\N	13.95	108.667	\N	\N
94440d40-b5c4-4848-80e6-b1dc4025a271	091968	Khu trồng cỏ Hoàng Anh	2613	\N	13.843333	107.988611	\N	\N
bd6dc816-1b49-4374-a066-126c3fa643c0	1020202804	Ngam La 2	3874	\N	23.031137	105.20131	\N	\N
17ae6e48-3216-40ea-944b-10533d14c180	1020202805	Ngam La 1	3874	\N	23.067058	105.187108	\N	\N
12446d8f-9bd6-4bb0-aa38-094ebfb732b9	620201	Nhơn Hòa	2638	\N	13.547222	108.098611	\N	\N
1787b91c-f269-489a-80ca-0058b693575e	837151	Chư Sê	2644	\N	13.695564	108.076154	\N	\N
899f92f2-5a60-4e0a-a151-9ac079e1d03f	1026463401	Tân An 2	2686	\N	13.959444	108.614167	\N	\N
1245fbc8-9664-4d9c-8058-585cf1e88984	954252	Krông Pa	2751	\N	13.202722	108.684225	\N	\N
80b0e8d1-ee5e-4fa0-bce2-38e025a8d0b6	622713	Kon Dơng	2762	\N	14.0425	108.2575	\N	\N
64979bf0-77a8-4153-8d89-048fdb00366f	1020203401	Vĩnh Phúc	3718	\N	22.250833	104.791944	\N	\N
fe71aa49-1d42-4228-9d56-3badec8985a6	1022018302	Tân Thành	5653	\N	21.76497	106.6731652	\N	\N
7c6896cc-6212-4789-8fa6-9d4ed753f454	148245	Trà Kót	7909	\N	15.356583	108.3825	\N	\N
cdf12c4f-15b5-46b9-9d7d-db8d354fbf14	875090	Đảo Hòn Lớn	5436	\N	9.693611	104.356944	\N	\N
d01c2da7-7fcc-46b4-8677-f69bfef9891e	1021715511	Tử Lê	5035	\N	20.587222	105.296111	\N	\N
922b2414-e6df-467d-ae52-47eea37f7046	1026462201	Ia Kênh	2787	\N	13.901389	107.986111	\N	\N
79e51278-8d88-4588-9909-302131242376	760083	Hồ Nước Trong	8263	\N	15.077778	108.414722	\N	\N
eac4fd46-269f-44b3-8b0d-1c6a06eb5fa9	760015	Sơn Cao	8264	\N	14.990731	108.548508	\N	\N
4342bb2a-047c-426a-a308-2540b7bbf694	760016	Sơn Thành	8272	\N	15.081175	108.534768	\N	\N
9c7c0e45-4469-4c5b-8b1c-ef6e7e1b0921	71506	Gia Vòng	8640	\N	16.933	106.933	\N	\N
06336b6c-d274-4dbb-a8ba-ed06c9d510d6	040742	Vĩnh Khê	8643	\N	17.077392	106.863583	\N	\N
dba86100-a685-4e3d-ba62-7cb27c480826	740011	Đầu mối hồ Bảo Đài	8646	\N	17.058056	106.927778	\N	\N
50e3f2b3-9d32-48a7-8f7c-647034ae7e31	1021411920	Chiềng Nơi 6	8933	\N	21.487222	103.606944	\N	\N
086616db-67e8-4732-aed2-c8e5ced3b6b1	1021411906	Phỏng Lái 2	8934	\N	21.56884	103.61178	\N	\N
4f678683-fe2b-4142-92f3-6694c0e919a7	1021411907	Phỏng Lái 1	8934	\N	21.53759	103.63054	\N	\N
8f362b5c-d39e-4e2b-a51e-4459aa8d874e	891157	Chiềng Khoa	8941	\N	20.83404	104.81228	\N	\N
2885acc6-52c3-4fda-a41e-e4ee1991d4bb	1023839602	Tân Thành 1	10191	\N	19.748548	105.40253	\N	\N
d1bac057-a617-4b7e-908a-289f92333952	1021210609	Sơn Bình 2	5904	\N	22.351944	103.691667	\N	\N
ca8863ac-02c3-45c1-be2d-c01387982406	875112	Sơn Bình	5904	\N	22.321111	103.666111	\N	\N
f4b5b97f-db48-4f9f-846b-80a70f9585e4	760075	Trà Xinh	8303	\N	15.133475	108.366042	\N	\N
67a87122-fd99-4a42-99b2-461f5d40a516	750023	Quảng Phú (Quảng Điền)	9210	\N	16.530833	107.491944	\N	\N
40cbe3fb-1410-4468-951a-3de135583515	760058	Hồ Sình Kiến	8304	\N	15.2375	108.596944	\N	\N
0463a29c-d644-4aca-85d3-a9493aac21f2	360010	Hồ Hố Chu (xã Cán Khê, Như Thanh)	9914	\N	19.76817	105.499556	\N	\N
7ce9a19b-06ce-4f52-a139-ddea4084ae6e	750015	Hồ Tà Rinh (Nam Đông)	9150	\N	16.113471	107.679079	\N	\N
9317e71e-2c79-4246-b63c-34d1e13a2bf1	71519	Thượng Nhật	9150	\N	16.117	107.683	\N	\N
85eb4621-fdf2-4513-b0f0-35338a37d644	750029	Thượng Quảng (Nam Đông)	9151	\N	16.122946	107.630705	\N	\N
3e9596be-2440-48d5-8d8b-d665ff4a0841	598553	Thạch Lâm	1648	\N	22.863056	105.386944	\N	\N
64f15244-b7af-424b-8ea9-0238e665f2f5	143422	Thái Ninh	9428	\N	20.509148	106.474581	\N	\N
bc67d9fa-cf80-4ffc-a802-13956d412457	1020404207	Vĩnh Phong	1651	\N	22.8612859	105.5800838	\N	\N
f63a953b-6d9e-4ee7-bdb0-c0a67fef767d	1020404504	Nội Thôn	1686	\N	22.9236755	106.1757971	\N	\N
9e94860b-1124-468d-baab-8842a52a834e	1020405302	Thái Cường	1778	\N	22.4801647	106.3581025	\N	\N
f21443a4-66ce-4370-bdd1-b68d7ac7fb9f	1021715504	Mỹ Hòa	5022	\N	20.646111	105.226667	\N	\N
432ef7c0-a045-45d2-9eae-4e06c601c803	567613	Hồ Trọng	5029	\N	20.647222	105.201111	\N	\N
2c86825c-3a94-4a2e-b721-7b6a4b64439e	1021412105	Tà Xùa 2	8780	\N	21.260556	104.486667	\N	\N
00cfdbf8-3d47-43cb-a34f-b18e9417560a	782509	Xím Vàng	8781	\N	21.32843	104.37709	\N	\N
1386b3bc-3f4d-420e-8dde-c498397a1beb	1024042005	Nam Sơn 1	6949	\N	19.22331	105.02396	\N	\N
2addc58a-491c-4e01-9150-643005df1a0b	690003	Tân Thành	1537	\N	9.192987	105.230524	\N	\N
d47c3a50-db03-48e3-a38e-9137e37d09f1	682554	Cẩm Phúc	2823	\N	20.935996	106.204509	\N	\N
4b7476c8-45f1-4ca1-8fa6-8c1dba85b667	930008	Minh Lập	1238	\N	11.517592	106.748695	\N	\N
25db6e7a-6f8f-4ebd-9561-0097b6a72b53	390201	Ô Môn	1481	\N	10.05416	105.647505	\N	\N
577db15d-db68-4a77-a87c-29aa9f05a851	893025	Tam Thôn Hiệp	3414	\N	10.597706	106.859726	\N	\N
aabb2085-80c9-49f3-8ef9-47c01eec5380	1021715902	Đồng Môn	4961	\N	20.484167	105.701389	\N	\N
6a4d7887-0b38-4f85-aa8a-707430766987	1021715903	Đồng Tâm	4962	\N	20.481111	105.800556	\N	\N
22bc4ecd-4274-4fa0-84a1-266c92c9dd4f	1021715904	Hưng Thi	4963	\N	20.513056	105.671111	\N	\N
14e329cd-d7b6-4e11-8392-6294c0099974	1021715905	Liên Hòa	4966	\N	20.507222	105.731111	\N	\N
a754309c-11d7-4d90-bc3e-8c6d86377f79	184635	Ban Hàng Đồi	4970	\N	20.594823	105.678026	\N	\N
9e042b79-25ef-4056-99aa-7e9ebbee0c01	340001	Tứ Minh, Hải Dương	2830	\N	20.928611	106.255	\N	\N
dc8f7c4b-648b-4ead-b56e-83c0e9493737	1024244410	Hương Xuân	4694	\N	18.158437	105.690573	\N	\N
0198b11a-4386-4d36-94c1-a83367ed604e	1024244408	Lộc Yên	4695	\N	18.184212	105.753565	\N	\N
a6c7c39c-87ce-49cd-a8bf-c1babd27ac7d	039401	Đồn Biên phòng 571	4696	\N	18.180556	105.583222	\N	\N
584b9db0-3c62-4463-8637-7ca80b0a219e	487121	Hồ Mạc Khê	4696	\N	18.18006	105.66119	\N	\N
12be7bef-588d-4189-ae84-a3bc10bf9089	1024243910	Sơn Kim 2	4714	\N	18.440109	105.298884	\N	\N
3383838b-e3ab-470a-82bc-468a8a6c0642	356172	Hồ Xuân Hoa	4714	\N	18.440361	105.297972	\N	\N
77f7f01a-a1a2-4948-82e1-0ea665a4ce09	920003	Đại Sơn	7928	\N	15.818889	107.902222	\N	\N
0ab8dafa-faec-4575-ae36-bf20e41d0a0e	355827	Điện Hồng	7934	\N	15.888333	108.149722	\N	\N
1f2212c7-f64a-4a28-9174-66ca982378e4	430020	Đập Hà Thanh	7935	\N	15.953153	108.195375	\N	\N
10ba5248-0aa8-4a05-85f0-270a15d72ee2	617877	Hồ Suối Hành, lưu vực Măng Dai	5235	\N	11.932222	109.036667	\N	\N
e4da9f49-7218-4835-8943-0c2b0782ee03	675344	Hồ Suối Hành, Đập đầu mối	5235	\N	11.93251	109.06279	\N	\N
d6a4d456-c203-4d72-abb2-e1469fd71cee	927364	Trung tâm hành chính - Đà Lạt	6009	\N	11.936389	108.431944	\N	\N
7bf45640-85b9-4d3b-abff-52c967311e00	977834	Ninh Giang	2977	\N	20.708288	106.326503	\N	\N
1c0f3927-d3c4-446c-86ae-3b1366c5d9b5	1024244401	Hà Linh	4681	\N	18.302726	105.647461	\N	\N
9757a30d-16e2-4dfa-85b6-9d6a7f64d371	1024244402	Hà Linh 1	4681	\N	18.293396	105.67517	\N	\N
ad182fa1-307a-4f0c-8bd9-2c8eab0bcb4f	076221	Nuông Dăm	4919	\N	20.555118	105.610034	\N	\N
685b70d2-55fb-4492-ae08-2ec5e4d2df9b	548042	Tứ Kỳ	3015	\N	20.825965	106.350353	\N	\N
29c747d1-6a08-42d5-ad76-2d07cee1188b	079364	Phù Lưu	10632	\N	22.166195	105.014541	\N	\N
c128d333-7ab6-4e08-826f-94a2fb49c734	1020404309	Sơn Lộ 1	1637	\N	22.7254746	105.6867019	\N	\N
78966953-a122-4a16-b7ed-f0bd0b4d3945	110012	Sơn Lộ	1637	\N	22.725376	105.689114	\N	\N
0c50eee6-77b3-4697-8977-8b4ebf08da6b	1020404312	Thượng Hà 2	1638	\N	22.9893862	105.6527374	\N	\N
e4135efc-663d-4d1e-b588-0fce4d4004f0	1020404311	Thượng Hà 1	1638	\N	22.9651773	105.6679139	\N	\N
b352a91d-1407-47db-81ed-b14fdecadb3e	1020404804	Vinh Quý	1678	\N	22.6581717	106.6550595	\N	\N
0cfe2583-c1c8-4f3a-a286-22cd5dadf7d5	1020405303	Lê Lai	1773	\N	22.4424617	106.4208645	\N	\N
eafc134b-75f2-4844-8799-ca5936fb1fb5	861851	Cổ Ngựa	3062	\N	20.705742	106.256509	\N	\N
e784791f-525f-4ca2-84ba-94b86626d685	228922	Khâu Tinh	10652	\N	22.474444	105.436667	\N	\N
9c5781c9-ea09-4257-a7e3-ce8d9842530e	030056	Nhà đỉnh Đập	10653	\N	22.361962	105.397824	\N	\N
f72e3c2c-9eed-49a5-ac92-959b1706923c	075787	Nhà phao tiêu	10653	\N	22.363814	105.402267	\N	\N
1f8e348d-c757-41bd-a22b-83276ab8e621	228923	Sinh Long	10655	\N	22.546389	105.406389	\N	\N
56d7fc04-9985-4f12-9c96-035a76e5eca6	220018	Sơn Phú	10656	\N	22.405	105.502222	\N	\N
90b68206-c6ca-4c0c-bc9e-162aec89b51b	861185	Thanh Tương	10657	\N	22.314722	105.392778	\N	\N
00867808-620f-462e-9f0a-6587b0f09938	1023838702	Sơn Điện	10031	\N	20.272803	104.819071	\N	\N
5a0f51be-d87e-416c-a0e7-e5c7cd4fad6f	1021008710	Nghĩa Đô	6101	\N	22.399542	104.460354	\N	\N
3d621ad4-5891-4404-991b-bff3b2cc87de	848316	Nghĩa Đô	6101	\N	22.388611	104.465	\N	\N
3799d02e-470d-4659-8c98-5e3278443bc4	00206BBB	Hai Phong - Do Son - Hat Do Son	3112	\N	20.72173309326172	106.79879760742188	\N	\N
bd07e079-8c27-40a8-878a-0ffe35d13af3	1024042212	Thạch Ngàn	6702	\N	19.065802	104.977452	\N	\N
4eb8ceac-d9b4-49ab-86e7-0de9cb748329	1021008705	Lương Sơn	6099	\N	22.19144	104.50318	\N	\N
13b3d688-7c52-41e9-bf2c-2f59af302016	240027	Lương Sơn	6099	\N	22.182222	104.500556	\N	\N
71053861-1809-4089-b14b-9a8d9a6aa882	1021008708	Minh Tân	6100	\N	22.257095	104.395884	\N	\N
d44c1df0-7d2d-438a-a4ed-15594f0b2d25	534602	Thường Tín	4460	\N	20.879021	105.864954	\N	\N
00df2524-5fef-40e9-9e9e-24a03d4e462e	1021008903	Nậm Xé	6235	\N	22.03471	104.025689	\N	\N
50be0f32-fcfa-4106-b135-828659617e88	839811	Nậm Xé	6235	\N	22.032778	104.027222	\N	\N
efef6f65-d87f-4406-88e1-08fa2d109349	0120BD48	Lao Cai - Van Ban - Xa Nam Xe - Chot bao ve rung	6235	\N	22.03543472290039	103.9716567993164	\N	\N
ffc7c1c4-0233-4533-bdb8-65741758354c	1021008702	Vĩnh Yên	6107	\N	22.35389	104.49149	\N	\N
6624ffea-941d-4116-9efb-fc905c7cc2ca	0120BD49	Lao Cai - Bac Ha - UBND TT Bac Ha	6154	\N	22.658126831054688	103.61394500732422	\N	\N
24fd8ae4-2bb8-487b-a6fe-8cbbc739af3f	875223	Ý Tý	6154	\N	22.658284	103.613875	\N	\N
5f61ac4f-8617-4d75-a9de-5728ee255732	430019	Suối Đá	2437	\N	16.108611	108.261667	\N	\N
48174bc7-8acf-4fde-9a4d-d3be98a357c4	430008	Chùa Linh Ứng	2437	\N	16.1	108.279444	\N	\N
8709d041-8ca7-4ca9-b1e4-82f75d20b4cf	1021110011	Thanh Nưa 1	2470	\N	21.42654	103.00459	\N	\N
39f01791-6675-48aa-adc4-e3a9f73ac4f9	105273	Hóc Môn	3455	\N	10.88819	106.598219	\N	\N
27f076d8-1a46-4b92-a748-48fdb6e4f558	1020203105	Giáp Trung	3687	\N	22.783347	105.289205	\N	\N
c366dd59-059d-4daa-b97a-ef2e79004be7	1020203205	Bản Phùng	3752	\N	22.785016	104.582148	\N	\N
44ec2911-f76d-48ca-9f20-b931814d9abf	1020203206	Chiến Phố	3753	\N	22.777645	104.627047	\N	\N
3e8f226a-b6d9-4b04-a4a5-4e45ca74e52c	53765	Vĩnh Bảo	3282	\N	20.697657	106.468901	\N	\N
aab273fa-f62d-4c28-af05-b62d2244fe14	950007	Mái Dầm	3291	\N	9.945941	105.871051	\N	\N
3e046f0c-6aed-4a63-9c0a-23b26749dedd	25893	Rạch Gòi	3300	\N	9.897724	105.668058	\N	\N
fda90739-9800-401f-850c-eef66f5b78d2	950009	Tân Phú Thạnh	3302	\N	9.949436	105.721521	\N	\N
144e7e74-16dd-4b27-b497-450ab77a67a4	950015	Long Phú	3316	\N	9.64681	105.61705	\N	\N
d4dd7ddd-19d1-45a6-b104-ce7bd608f276	950010	Hiệp Hưng	3332	\N	9.757018	105.751279	\N	\N
4f7b1345-0c60-43c3-9917-0a4a88959203	950012	Hòa Mỹ	3334	\N	9.82286	105.70695	\N	\N
a5b3d735-f641-46b1-b4da-e4c59c67ef87	950014	Khu bảo tồn Lung Ngọc Hoàng	3338	\N	9.725556	105.698333	\N	\N
03b23abb-051b-4f80-a95e-95abb53ab141	878074	Bình Chánh	3376	\N	10.691111	106.5725	\N	\N
4a93455d-253a-44cf-a073-37581b8456ee	950001	Hỏa Tiến	3345	\N	9.694179	105.336284	\N	\N
23eac8b0-10cb-4f45-9f8f-4f596dd7e40d	950017	Vĩnh Thuận Tây	3360	\N	9.704275	105.483179	\N	\N
9e56c59a-1cac-412e-9b66-48f48c078608	854084	Cần Giờ	3411	\N	10.409755	106.964243	\N	\N
9ac031ca-2500-44f1-a804-e9e2851544df	729806	An Phú	3417	\N	11.111667	106.506667	\N	\N
a587a07a-b914-475d-bef9-b52b31bd6f2d	782600	Phạm Văn Cội	3422	\N	11.038056	106.522222	\N	\N
de40d537-5d6f-437b-a966-08b9b83ca635	00204985	Ho Chi Minh - Cu Chi	3422	\N	11.019092559814453	106.52328491210938	\N	\N
4e6fad8b-4080-4a70-ac8d-9ad298659404	740001	TT Phòng tránh và Giảm nhẹ thiên tai	8541	\N	16.790278	107.100278	\N	\N
b83ff00e-4d56-4fb2-a660-517374812bfa	344845	Linh Thượng	8564	\N	16.919769	106.961779	\N	\N
22810e85-b917-47e1-af3b-780cd984a96c	312609	Củ Chi	3432	\N	10.955556	106.512778	\N	\N
f4e8a108-bb88-464a-a4a9-b8c71a39a100	1021513508	Minh Tiến	10994	\N	22.064444	104.855278	\N	\N
e775e1dd-15e5-4925-bf42-1e6f2710f59b	1021513515	Mường Lai	10996	\N	22.139262	104.836242	\N	\N
f8f8864e-1523-49b5-8268-eafc9e8411e1	1021513517	Phan Thanh	10997	\N	22.020845	104.773308	\N	\N
04aaa5ff-695c-4ccb-8073-0a8030dacb4a	501508	Nhà Bè	3469	\N	10.678056	106.753889	\N	\N
3d6b0ba6-e003-45a7-827c-669ad1e46d78	285827	Tĩnh Túc	1735	\N	22.654471	105.883602	\N	\N
2085ad5d-b512-4b9b-87ca-d5fae8582f82	850010	Phước Chiến	7343	\N	11.836915	109.051142	\N	\N
e9c289ac-27ca-4e93-9e34-071abbd2899b	850011	Phước Kháng	7344	\N	11.745556	109.023889	\N	\N
513478e3-f0c9-4bc3-bae0-1285d9cfa3e3	405173	Thủy điện Hòa Thuận	1742	\N	22.541389	106.496389	\N	\N
bee4ebfc-ad7d-41b0-9708-c2bcc127a9d8	315542	Bình Xuyên	10850	\N	21.276656	105.650125	\N	\N
1fd8cd3e-c0f4-40cd-b6d4-5c1dc2fd0696	470026	Ea Pal	1898	\N	12.72687	108.55442	\N	\N
a2cddf81-98c6-4e6a-97f4-6b5f810c0535	1021109906	Quài Tở	2570	\N	21.563378	103.443003	\N	\N
acc7a6a5-27d4-4ec3-b8f3-5cb998e3f9ca	1024042601	Công Thành	7106	\N	18.920825	105.438524	\N	\N
4772abfe-32ad-4af5-9bc8-daa064d56189	740018	Húc	8600	\N	16.599167	106.760556	\N	\N
9f1b2e3c-8a7f-460b-9ff4-daac96947934	1021715007	Tân Minh	4867	\N	20.919167	105.166944	\N	\N
a0610397-13ef-4926-92c5-6270119b78c9	1022018001	Quốc Khánh 1	5770	\N	22.3596023	106.5219839	\N	\N
83c8110f-1769-4029-b70e-be8c5c50c3c0	1021210805	Phìn Hồ 3	5888	\N	22.475278	103.281667	\N	\N
6925fab9-8dc7-43b8-85e9-63b46ecbfc6e	354943	Kỳ Thượng	4750	\N	18.019972	106.126111	\N	\N
0375c319-d074-491b-a7d8-b21ea6c3face	356211	Hồ chứa nước Kim Sơn	4756	\N	18.011583	106.271694	\N	\N
5c386fff-7fab-44f8-8532-7145b496d8a3	1024244902	Kỳ Thịnh	4764	\N	18.037492	106.377003	\N	\N
b91e3c82-9013-4892-a1af-45dd252ee2fa	953782	Hồ Thượng Sông Trí	4764	\N	18.036944	106.376389	\N	\N
be194ebd-928c-4701-b4f6-cb72b12dba7c	1021008917	Nậm Tha	11097	\N	22.0699	104.38322	\N	\N
8b81601d-1439-4b32-9f08-d27bf7e8aacf	918892	Châu Quế Thượng	11097	\N	22.088623	104.442547	\N	\N
3e64b629-5369-437a-b420-e19cc9981b4b	935170	Lâm Giang	11103	\N	22.064181	104.479287	\N	\N
16d2a278-fd1a-4357-b94e-db85488a37dc	180165	Thanh Thuỷ	3835	\N	22.917825	104.860962	\N	\N
59190ce2-402c-4a4c-8cd6-2c412418ef97	1020202806	Ngọc Long	3873	\N	22.993834	105.315462	\N	\N
91861216-76ea-47db-9c83-99f960ebec26	012057C2	Ha Giang - Quang Binh - Thuy Dien Song Chung	3851	\N	22.520418167114258	104.50424194335938	\N	\N
be31bf97-a24e-44aa-9281-563589738de1	490035	Đạ Đờn - Lâm Hà	6062	\N	11.809241	108.22375	\N	\N
deb22842-28ce-4d82-912b-5e6e7d5f9a1c	1021715308	Nuông Dăm (Cuối Hạ)	4903	\N	20.593611	105.548889	\N	\N
0e99ea0b-213c-4273-af60-e50cef857ed2	937617	Tiên Lương	7375	\N	21.479167	105.035	\N	\N
8d38c33e-577f-4283-847b-c8495add4d1c	740019	Triệu Hòa	8625	\N	16.802222	107.191944	\N	\N
a67eb58e-a905-48ad-8cc5-8687cd6202e2	172153	Thạch Thất	4379	\N	21.062346	105.57818	\N	\N
e5b3906e-6803-411c-8a5e-45631dddd11e	1021513201	Minh Bảo	11126	\N	21.746667	104.909167	\N	\N
49077761-341c-4d6a-9237-f9ae00301883	003647	Bản Bà Khốm	7078	\N	19.40187701	104.70642101	\N	\N
ac3ce8c0-bf23-4a6f-9e3b-e9a6448f78e3	730009	Hồ Troóc Trâu	7844	\N	17.400757	106.587735	\N	\N
4b8406b9-7dfc-498f-be7c-5841921785f5	641728	Trường Thủy	7813	\N	17.149444	106.786944	\N	\N
fbd9f529-eac7-44e2-949e-86e42d78366b	930007	Minh Tâm	1268	\N	11.633468	106.542982	\N	\N
86b89149-f060-4880-a95e-8c68910a1ec2	1020202401	Phương Độ	3744	\N	22.840969	104.943818	\N	\N
e3b40d9a-42c4-48cd-ad48-eba38660882e	498349	Mỹ Lộc	4611	\N	18.379722	105.745833	\N	\N
91842697-3441-45a4-8179-2677bd4f8d76	1021715901	An Lạc	4958	\N	20.451667	105.722778	\N	\N
6032fc0f-208f-4150-ab5b-7fbf64457d3e	1021715906	Phú Lão	4959	\N	20.526111	105.734444	\N	\N
eaedd8b1-1ea1-4ae5-b243-00feb748fead	1020203208	Bản Nhùng	3750	\N	22.702254	104.745483	\N	\N
523e4392-86a7-40c2-b5bc-c7e9956ba0b4	1020203209	Bản Péo	3751	\N	22.648545	104.736521	\N	\N
76f9b6ac-df83-4f1f-8ead-28bba962e867	1024041501	Châu Kim 1	6910	\N	19.59331	104.897418	\N	\N
ee246dc2-22b3-4771-80af-e9f2a3d33c9b	1024041505	Nậm Giải	6916	\N	19.65936	104.82119	\N	\N
d15ef163-727c-42b3-8157-e02532d7242c	370003	Nậm Giải	6916	\N	19.659444	104.821111	\N	\N
ed2d2c3b-19c1-472b-9475-65db76d31934	957752	Bằng Luân	7385	\N	21.678056	105.0675	\N	\N
0fa97da4-bbd2-4567-a49d-6d1eba9b8b1f	175655	Thạch Kiệt	7518	\N	21.239006	104.974899	\N	\N
e641e35b-a0b9-4ebe-a1df-86f47da2643b	951316	Tân Minh	7563	\N	21.068056	105.1725	\N	\N
2b4112fd-4cf7-4ae0-88a5-d734315c6c26	1020203210	Nậm Dịch	3756	\N	22.655812	104.705541	\N	\N
e04f1a4c-f15e-430b-8d89-68e3dff1805c	760019	Long Môn	8223	\N	14.926055	108.614255	\N	\N
061b4d17-78af-4a38-8857-048aa7313694	036618	Hồ C - TĐ Vĩnh Sơn	2712	\N	14.424164	108.444031	\N	\N
7e9e4434-c8a7-4872-b566-6121c5fae561	760082	Sơn Nham	8270	\N	15.090278	108.62	\N	\N
d930c895-23a4-419b-b3ad-9f9ae6ad9f8e	1020203204	Nàng Đôn	3760	\N	22.721667	104.598333	\N	\N
f00b41ab-30de-475c-a93e-6e671ffc2c06	916047	Chư PRông	2612	\N	13.753751	107.890325	\N	\N
4db7a971-8147-4e63-85bf-163b71ce0c28	091967	Đập thị trấn Chư Prông	2612	\N	13.758611	107.896389	\N	\N
fe531b59-e6d8-4f60-b018-4c8c85eeed26	1026463201	Ia Me	2620	\N	13.704167	107.893056	\N	\N
61f89297-2db9-432a-a8b8-d482573d005d	1026463202	Ia Mơ 2	2621	\N	13.495833	107.748333	\N	\N
75947d38-8db1-40c3-b895-d7b7e4007c5b	950004	Vĩnh Viễn	3311	\N	9.665915	105.463741	\N	\N
7cbd6cb8-1c4b-47a9-8f23-4e30e2c9cc68	969703	Km22	8943	\N	20.770079	104.963605	\N	\N
2fb3e9ad-679a-4876-a15d-6223a4ec6d8c	919057	Km46	8945	\N	20.772865	104.872763	\N	\N
e598c794-94fd-4fed-82fd-eed991b35add	1021412801	Mường Men	8946	\N	20.82964	104.9162	\N	\N
913270c0-b53f-451f-a7de-f4c8b3a0ea5a	626493	Chiềng On	8958	\N	20.982223	104.165996	\N	\N
966d9f35-6ddb-42d7-83e8-579eb4264047	1021412404	Xập Vạt (Sập Vạt)	8965	\N	21.046715	104.332376	\N	\N
144b5faf-0f8a-4ccc-905b-8a5cf7f7650f	1026867902	Sơn Điền	6040	\N	11.360833	108.019167	\N	\N
37e1ceb1-bfac-4e87-bf3e-26e1344594ab	760076	Hương Trà	8296	\N	15.19095	108.408517	\N	\N
7acca2d7-5988-4d85-a43a-1e7ff40e5bac	760074	Sơn Trà	8295	\N	15.205143	108.32757	\N	\N
9c42292d-f930-4e90-ba7c-4c3e6e5de74a	075778	Sơn Lập	8288	\N	14.848287	108.415468	\N	\N
27e91b5e-fa13-40e1-8e8d-13bd6a89f3bb	760009	Sơn Long	8290	\N	14.931553	108.343735	\N	\N
a8f70296-0b35-44b7-9a67-063fb571e4fb	075771	Sơn Bua	8292	\N	15.06824	108.30071	\N	\N
bf41daa4-6739-443c-b7d2-8ee79cb05613	760080	Sơn Mùa	8292	\N	15.017767	108.326673	\N	\N
2e2be360-2390-486e-b3fa-f3cb65ef50a1	760081	Sơn Tân	8293	\N	15.012242	108.396805	\N	\N
064902d5-d9cf-4812-84a1-ecc3d9b3b673	008371	Trà Hiệp	8307	\N	15.276408	108.380253	\N	\N
89f6826a-6de6-4dc7-b51e-47cbd277ddfe	760008	Trà Thanh	8301	\N	15.271111	108.351944	\N	\N
c3b80ab4-ae4c-47db-bd51-3e1a67c19ddc	760079	Trà Tây 2	8302	\N	15.143844	108.454877	\N	\N
3496198c-0015-4f95-99fb-986dc833e29c	509537	Sở Sao	1180	\N	11.070278	106.670833	\N	\N
57f8794b-ee03-4f53-9662-40def603c9aa	958573	Đập Thủy điện Rào Trăng 3 (Phong Điền)	9167	\N	16.409444	107.249444	\N	\N
2efaa4b9-ee91-4ed1-8644-cd3b1f9fc18c	959428	Đập Thủy điện Rào Trăng 4 (Phong Điền)	9167	\N	16.397222	107.298056	\N	\N
dbda6243-66a7-4f98-89c0-2e1b35208731	750065	Xuân Lộc (Phú Lộc)	9185	\N	16.2619	107.70329	\N	\N
73f68899-4ff6-457e-89a7-25c099451dbc	930006	Thanh An	1275	\N	11.738859	106.722475	\N	\N
51df0e23-9165-45b9-986c-067a112ba29d	1021411602	Chiềng Cọ	8882	\N	21.311821	103.862608	\N	\N
f1946990-167f-414f-8a54-b2854f47342d	226711	Nà Ớt	8814	\N	21.05001	103.98947	\N	\N
b8278c7d-1aee-4d75-9db2-ce81921a541b	260004	Chiềng Ngần	8886	\N	21.314167	103.974444	\N	\N
c438ba57-b059-4e9c-9615-1697a64a0908	260024	Chiềng Sinh 1	8887	\N	21.2825	103.950556	\N	\N
ab7336e3-9146-463d-b25e-5e45c03b1e0a	295482	La Dạ 2	1363	\N	11.2111548	107.9055	\N	\N
c3654518-8ba1-475a-ae8b-aa744e03db85	1021715502	Đông Lai 2 (Thanh Hối)	5018	\N	20.570278	105.3475	\N	\N
5dcd1090-7584-488c-b5e3-9b08ed1695e0	1026261502	Đăk Ui	5512	\N	14.577139	108.0065	\N	\N
88e8e1b8-afa1-4636-bcab-99e99e6f33ae	253581	Mèo Vạc	3778	\N	23.166667	105.406111	\N	\N
69e5c157-e558-47e7-9735-17ff9321b89f	1021412304	Chiềng Hắc	8782	\N	20.897744	104.558067	\N	\N
4109e7cc-cc31-447f-bae5-b7cf6b64918d	1021412301	Chiềng Khừa	8783	\N	20.832345	104.442922	\N	\N
d93a98b0-322d-42d0-bc67-61b647f6139d	730090	Chiềng Khừa	8783	\N	20.83636	104.45629	\N	\N
bf1e603d-efb7-412e-b56c-53f83c8e0f34	1021412302	Lóng Sập 1 (Chiềng Sơn)	8784	\N	20.755679	104.604272	\N	\N
4e0ef7bc-8b19-4e77-aebc-60bb6b30f0a0	1021412305	Hua Păng	8786	\N	20.915736	104.74976	\N	\N
e62aae6b-c29a-4691-a8c5-4ce53461a347	1020606201	Thượng Quan	556	\N	22.383621	106.017062	\N	\N
c9660179-1944-411b-97b8-91ed969e79dc	129901	Thượng Quan	556	\N	22.369167	106.008333	\N	\N
4a3f2bf9-d216-4d06-a8cd-34bea8a6120e	095173	Lộc Thịnh	9868	\N	20.094444	105.481111	\N	\N
2c1a3ee4-9e88-4b37-8a25-9fd067430742	855458	Đầm Dơi	1550	\N	8.991944	105.1975	\N	\N
ecda00f1-194e-4c2c-b446-4bccae9670b7	694570	Quản Bạ	3800	\N	23.066667	104.989167	\N	\N
c3f4c2ed-2650-465a-adae-8c50d254394b	312419	Văn Bàn	6223	\N	22.08902	104.249264	\N	\N
ac46aa8e-16e3-4c14-a9e9-e47d6ae55d15	1021008907	Khánh Yên	6223	\N	22.08856	104.25347	\N	\N
7e5a04e5-8b93-4ee6-ac22-e879d9edc85e	1020203507	Bản Rịa	3804	\N	22.443889	104.490833	\N	\N
1e722ddd-c41f-46c1-b206-0dee275d0bef	1020404509	Lương Thông 1	1786	\N	22.8592404	105.9476016	\N	\N
c543e1c0-d6a4-4c59-ad26-e4780d55e2da	1020404510	Ngọc Đông 	1787	\N	22.7916211	105.9585336	\N	\N
d0c573d7-feef-4bae-94b5-7e04aeded77a	1020404511	Cần Yên 2	1790	\N	22.9220851	105.9375062	\N	\N
3ce34e36-ca5e-44d8-a1fb-7e2f4e82fdb4	1020404701	Cao Chương	1792	\N	22.8063211	106.3295828	\N	\N
0daf439e-b9f3-45fa-a31b-0f3dc9fb0d08	1026766601	Đăk Sin	2026	\N	11.868333	107.493333	\N	\N
5485a800-5922-4ae8-8b6f-f00d2b22b5a4	091959	Hưng Bình, Đăk R'lấp	2026	\N	11.861667	107.491389	\N	\N
f995482e-3827-4d1b-96b4-cfccdf6b2100	1021008908	Khánh Yên Hạ	6224	\N	22.05562	104.3135	\N	\N
23eb6cdc-2c29-4aa8-b311-a17c0beff9fc	1021008909	Khánh Yên Thượng	6225	\N	22.08321	104.26542	\N	\N
b67b19b5-d817-44d2-b260-e6c56a4bca5e	572335	Dĩ An	1149	\N	10.890833	106.785278	\N	\N
a62d1f90-2f38-4d12-b9bd-e81de917d8ee	408434	Song An	2582	\N	13.979295	108.708091	\N	\N
6a2ed46d-3408-46bc-b957-43414122c82d	206752	Việt Lâm	3829	\N	22.626596	104.958345	\N	\N
db8e628c-07ff-405e-a2f0-113b3fbf9462	1020203002	Thanh Đức	3834	\N	22.887886	104.817934	\N	\N
0aa48e8c-5a77-445d-8fe3-0b14f876650d	1020203103	Minh Sơn 1	3690	\N	22.82157	105.20213	\N	\N
9f310a53-1902-472f-8130-e30e2af6d351	1020203102	Minh Sơn 2	3690	\N	22.836757	105.247624	\N	\N
dcef154b-0b99-4fd1-b9a4-4ef79eb9c619	1020203306	Bản Díu	3843	\N	22.740751	104.557742	\N	\N
2b5cf0b5-e8a6-43e4-af72-d6bba3f305a0	1020203303	Bản Ngò	3844	\N	22.632443	104.453585	\N	\N
dcf17581-e297-43bc-bb31-f2cc532d63d5	906221	Đầu mối hồ Trung Lộc	8029	\N	15.712101	108.081572	\N	\N
cb920b13-4d84-4b15-8f84-1472a1aed368	577172	Phước Thành	8069	\N	15.286044	107.891364	\N	\N
9929951a-a508-4ed1-bc0d-3d118d29bbae	1020203304	Cốc Rế	3846	\N	22.681473	104.516742	\N	\N
62a562b0-1f0e-488c-9e69-ac41d9f3585a	1021513706	Hồ Bốn	11012	\N	21.876111	103.918333	\N	\N
1c664624-32fd-4a62-9f7e-f02fc8a863ea	1021513707	Khao Mang	11013	\N	21.875719	103.988819	\N	\N
873df1b4-ff76-45dd-b272-08d87048ce96	740002	Nam Thạch Hãn	8612	\N	16.694444	107.146389	\N	\N
b837d5da-6708-4471-a4e5-452a06a2f6b4	317420	Triệu Ái	8617	\N	16.758044	107.135221	\N	\N
7fb24327-23a9-45d0-8200-8c11ec8fda36	780001	Xuân Phước	7635	\N	13.297778	109.064722	\N	\N
3bac7c86-b0af-4bc1-8de9-3867145f1569	074771	Đập - HCN Phú Xuân	7635	\N	13.290611	109.035361	\N	\N
50b642a0-86aa-4394-80f0-1fc5332ac692	860015	Phan Dũng	1430	\N	11.408705	108.655387	\N	\N
7448c63b-d63c-4660-8647-f43e3a536712	1020203305	Chế Là	3847	\N	22.62663	104.52785	\N	\N
aabca8b2-f1ff-4b38-bacd-de397e36b8fd	1021109709	Mường Mươn	2	\N	21.628675	103.048992	\N	\N
46d8d9b9-6816-4127-afa9-7ef904312cf5	1021109708	Mường Mơn	2	\N	21.651512	103.063907	\N	\N
4e9821a3-8db1-48c7-afca-b4eb50168fbb	1026261501	Đăk Pxi	5515	\N	14.465944	107.910778	\N	\N
eef5655d-56fa-4120-90aa-5c4a2d2e31b4	041564	Ngọc Réo	5516	\N	14.486389	108.039167	\N	\N
5835fcaf-88a0-43c6-97cb-eb2a8da8731c	1026261504	Ngok Wang	5517	\N	14.507194	108.007194	\N	\N
abccba26-674b-4b8b-a5ad-7835aa413f50	69702	Kon Tum	5517	\N	14.5	108.017	\N	\N
e54e9856-d9a1-45e3-8a86-3650c2832429	1026260804	Đắk Rơ Wa	5549	\N	14.338111	108.038306	\N	\N
f8cd150d-ac47-451f-a1fc-7c7a59a3f113	1020404906	Tự Do 	1764	\N	22.6444293	106.4037223	\N	\N
6f44838a-3d08-457a-8790-91bc990170ce	930003	Đồng Nai	1214	\N	11.810413	107.330495	\N	\N
104f674e-c2fc-4e4c-ba17-84c8bf84dfcc	930005	Nghĩa Trung	1223	\N	11.653415	107.055971	\N	\N
1a9bb497-c918-4b9d-a13f-fd345c6535e2	994631	Hội An	20	\N	10.432962	105.550859	\N	\N
596edee9-00b7-4ae1-a154-ade8f790dbe0	650005	Giai Xuân	1482	\N	10.027414	105.688664	\N	\N
b635f0d3-e8d6-4f0e-89f2-42375cc1c819	488446	Yên Minh	3879	\N	23.116658	105.144006	\N	\N
4453ceed-dd49-4988-9d0f-e91dcc8af069	557640	Hồ Cam Ranh, lưu vực	5224	\N	12.0741	109.07239	\N	\N
caa2a2b0-9d92-4f7a-adf5-ccda1c8ed01c	900206	Hồ Suối Dầu, Đập đầu mối	5225	\N	12.167184	109.05352	\N	\N
a76a58ee-0518-4a67-8bb7-d454007b70f8	262160	Thành Sơn	5267	\N	12.039076	108.843228	\N	\N
a8226152-0248-4643-958d-e1ecf6561d7f	954544	Đại Phạm	7417	\N	21.651111	105.0025	\N	\N
9d4cdf80-83bd-4b6e-b896-fa9fa881d9e3	876928	La Khê	4691	\N	18.095788	105.793504	\N	\N
47fa13cf-b414-473d-aa2d-5bc09cf8194b	1024244413	Hương Trạch 1	4691	\N	18.072563	105.813349	\N	\N
87d4f7cc-2f7c-49d2-9b0d-c8f5619f08a3	002040D4	Ha Tinh - Huong Khe	4692	\N	18.14794158935547	105.72297668457031	\N	\N
738962f5-419c-44fa-9e1a-13f7e5f84576	1024244415	Hương Vĩnh	4693	\N	18.150915	105.642561	\N	\N
0f9098fd-22c7-46cb-9ffc-30ef6d032317	489817	Hồ Sông Rác	4693	\N	18.163889	105.642222	\N	\N
11921019-1cfe-4697-97ea-d9e5a23be924	871154	Liên Mạc	3913	\N	21.083159	105.749217	\N	\N
53f004ee-109c-4c47-96b4-58cfad2a006b	1022523801	Cự Thắng 2	7553	\N	21.135682	105.214517	\N	\N
3fc02599-0084-440b-9670-ec13d730c2a8	423987	Đông Cửu	7555	\N	21.026652	105.091632	\N	\N
83ccfacc-25c5-45b0-a0eb-474afa22d693	780034	Diêm Trường	7679	\N	13.613889	109.215833	\N	\N
e79cfd86-be6b-4fa7-9905-c454f5cd4486	061851	Xuân Lộc	7679	\N	13.590995	109.196644	\N	\N
2fbf7ccc-8e6e-482d-bd0c-4a14f8a17fee	074772	Xuân Lâm	7680	\N	13.467935	109.194749	\N	\N
2e30e4df-fd60-4be7-8853-0d6974a19f87	780012	Xuân Thịnh	7683	\N	13.508056	109.275278	\N	\N
10b8075c-8579-48bf-a87f-00e9dc926395	354412	Ea Bá	7690	\N	13.025	108.840556	\N	\N
f48b2fa1-a20e-4227-b3f0-69c5f1bd605b	780007	Ea Bar	7692	\N	12.97283	108.806784	\N	\N
c28ced10-ab83-42d6-b567-2edebb1efc78	061841	Ea Ly	7694	\N	12.97942	108.767588	\N	\N
ec1c9269-f86c-4e57-befb-2da2e736cadf	036604	Đập Tràn	7695	\N	12.92684	108.946392	\N	\N
4bca0381-b378-437f-90a1-acea8cb1a372	012045A2	Quang Binh - Ho Ho - Dap Thuy Dien	7886	\N	18.046302795410156	105.83354187011719	\N	\N
79ee8530-c5ac-41a0-a7e3-62a139e64023	730016	Lâm Hóa	7888	\N	17.930833	105.812778	\N	\N
4ebf413f-3f4e-4d4a-9791-b96e5cd506fc	804318	Đại Chánh	7916	\N	15.809722	108.038056	\N	\N
0a2d4317-9589-42b9-b165-aa39666442d2	228927	Đại Đồng	7918	\N	15.851667	108.010556	\N	\N
9053ce78-ee06-4600-a772-3eed8eb52097	909143	Cầu Hà Tân	7923	\N	15.847026	107.934573	\N	\N
6ec8ba27-b4a6-4917-b76d-1b8fd232a01a	920012	Thủy điện Tr'Hy	8107	\N	15.800833	107.355278	\N	\N
ffbbe8c7-df36-4e13-b93d-cf9765a65277	174840	Vân Đình	3906	\N	20.73393	105.770256	\N	\N
c3b96991-e62c-4d70-9586-3c26dd94ff21	220002	Đội Bình	10711	\N	21.678831	105.209772	\N	\N
25b879c4-9ad7-4423-b440-97b4cee2189d	329635	Bù Đốp	1211	\N	11.984818	106.804237	\N	\N
b856c4be-b4cc-434e-b873-37d442a9377b	930004	Bom Bo	1213	\N	11.917612	107.189412	\N	\N
7ce99b29-edc3-4f29-b9a5-3ddb4f9e4f09	162205	Mỹ Lâm	10722	\N	21.769167	105.140278	\N	\N
7969c3d4-f825-48a0-b817-f9fc5eed5cb4	1024244404	Hòa Hải 1	4682	\N	18.261291	105.616947	\N	\N
81fd7206-4f6c-4a23-8d55-2d913647a1d3	061852	Hồ Đá Hàn	4682	\N	18.264833	105.582472	\N	\N
f8e04a2a-7130-4f11-8627-58424a9a1d1c	1024244407	Hương Giang 1	4685	\N	18.20108	105.716724	\N	\N
89040fe1-1159-482e-bdb0-4ca28c419994	1024244406	Hương Giang	4685	\N	18.231734	105.719714	\N	\N
60bbbe75-df69-45e2-a6e6-2054a4d74a29	495830	Hồ Khe Xai	4685	\N	18.219722	105.725	\N	\N
597a5b7c-6bdd-41e3-9a40-1962f4c93171	012045A6	Quang Binh - Ho Ho - 575	4687	\N	18.078811645507812	105.62346649169922	\N	\N
34ca4cae-07fd-426f-82e3-df4a2e920443	1024244412	Hương Lâm	4687	\N	18.08374	105.711372	\N	\N
3eed4336-c809-4881-abfa-d874509393f6	1024244411	Hương Lâm 1	4687	\N	18.105422	105.688391	\N	\N
cd15ee1c-bb8b-4d80-8873-54fb0aacd0ad	1024244414	Hương Long	4689	\N	18.196024	105.678919	\N	\N
7cab394b-9451-44b8-b19f-c5b2b035edf8	1024244409	Phú Gia	4689	\N	18.196505	105.650024	\N	\N
0e381635-d584-430e-834a-33639b1bac6a	1024244405	Hương Thủy	4690	\N	18.238813	105.677441	\N	\N
e860de42-96a5-4a19-811f-c43126faa3d9	1024243902	Sơn Hàm	4711	\N	18.49082	105.409184	\N	\N
b54d4ea0-4811-42d9-9d1b-ad2de6db7533	195805	Bất Bạt	3954	\N	21.1784	105.305149	\N	\N
b31b0e13-564e-44e6-989d-a6d6f5793e63	904892	Quảng Oai (Tây Đằng)	3961	\N	21.180777	105.432184	\N	\N
62b6b105-cd90-4df4-93a8-44519f4eb49d	277905	Chúc Sơn	3975	\N	20.92	105.7125	\N	\N
f6f87eb4-46d8-4717-81d0-06f1e0cac8c7	320831	Đập Đáy	4028	\N	21.08099	105.653537	\N	\N
9a44e84d-233c-4201-9f04-0b78bfad8bff	1024243701	Đậu Liêu	4659	\N	18.509507	105.725728	\N	\N
b4cbf499-6775-4ae7-a7dc-ea8ac6d1c2b1	962724	Hồ Khe Hao	4659	\N	18.511111	105.722222	\N	\N
4664d99b-072a-4266-9f57-ca894707ef5e	1021715307	Mi Hòa	4916	\N	20.577222	105.643333	\N	\N
2a183658-e363-4859-a2b2-17254f13f6c5	1021008901	Sơn Thủy	6236	\N	22.123928	104.28116	\N	\N
fd39002e-b474-4591-9dbc-5d8c8e40d956	240028	Sơn Thủy	6236	\N	22.153441	104.272984	\N	\N
be95dded-76db-4736-b9d3-30de433ef4e5	1021008919	Thẳm Dương 1	6239	\N	22.04822	104.112224	\N	\N
61cb9713-aaec-4ab7-9bed-a58ef7d2ae6a	1021008915	Nậm Miện	6239	\N	22.020693	104.126278	\N	\N
d5b5fcce-38d2-4d55-9954-904b2d2d9a73	1021008920	Thẳm Dương 2	6239	\N	22.028842	104.101661	\N	\N
bfdfa983-96ce-49dd-b48c-4542675bbb43	341077	Võ Lao	6241	\N	22.201111	104.207222	\N	\N
eb26a867-02cf-435f-9735-6d5e1a77dece	0120BD3E	Lao Cai - Van Ban - Vo Lao - THCS so 2	6241	\N	22.233768463134766	104.19620513916016	\N	\N
96499d83-23cc-4c7b-af01-d793027b8bb9	1021008806	Lao Chải	11200	\N	22.308228	103.875909	\N	\N
3a39eb4e-7f71-4864-b8f1-92befe69834f	925721	Hồ Cam Ranh, Đập đầu mối	5220	\N	12.0987	109.09618	\N	\N
914e3766-545b-4835-afda-bd7e68499c99	613990	Hồ Tà Rục, lưu vực Suối Tà Nĩa	5221	\N	12.00904	109.05726	\N	\N
0ff5657c-981d-416c-9b70-1e3be628eef9	916792	Hồ Tà Rục, Đập đầu mối	5221	\N	11.984444	109.07	\N	\N
c90507dd-00f4-422d-af65-dd3b2ab40053	612303	Hồ Tà Rục, lưu vực Suối Tà Rục	5221	\N	11.983333	109.030278	\N	\N
a0489ddc-27a9-482e-8bec-db5bf9b43976	760068	Hồ Hóc Sầm	8216	\N	14.925556	108.840278	\N	\N
68f94792-6587-477a-b858-05d545f3b785	472622	Đức Phú	8216	\N	14.945278	108.836667	\N	\N
ecb0cd64-ced0-4643-8304-c0ed73a51561	760066	Hồ Mạch Điểu	8216	\N	14.943333	108.822778	\N	\N
249e7b05-b73d-426a-8905-06c2f38f33ba	760070	Hồ Đá Bàn	8217	\N	14.930556	108.872778	\N	\N
fd93f4cc-54ad-48df-84a4-76ff9c6301d5	760052	Hồ Hố Cả	8222	\N	14.988056	108.765278	\N	\N
451b6684-58ce-405f-a06d-1558a0440959	373812	Trâu Quỳ	4084	\N	21.006624	105.939407	\N	\N
67e59a8c-223f-44a7-8fe8-ea04de644502	289205	An Khánh	4127	\N	21.002206	105.718334	\N	\N
84e96ca7-3d29-46fe-9a94-1916b05271e8	240025	Cốc Lầu	6117	\N	22.388599	104.285474	\N	\N
4bad4e6f-127a-41a0-8d22-843ec46d9d86	560090	Cốc Ly	6118	\N	22.508056	104.206944	\N	\N
744f4ebd-ee28-4a41-85a2-d7224f6a0adb	343043	Thủy điện Bắc Hà	6118	\N	22.507361	104.194944	\N	\N
4d7f17ba-7ab2-42a7-bb76-064ebb0b3de3	1021008811	TT Sa Pa	11204	\N	22.337329	103.848878	\N	\N
a7334df0-4211-427c-9159-deadbb018e16	760054	Hồ Cây Xoài	8201	\N	14.678611	109.042222	\N	\N
70ad213e-0265-43d9-88d7-cf92fa1db505	760069	Hồ Ông Tới	8212	\N	14.9075	108.882778	\N	\N
c8f152f0-5d30-4446-9a3b-1d61b3907821	750063	Phú Sơn (Hương Thủy)	9115	\N	16.33895	107.67101	\N	\N
96a339c2-263b-4cda-9846-7cfd19f0c3e2	750014	Hồ chứa nước Phú Bài (Hương Thủy)	9120	\N	16.350147	107.702324	\N	\N
bf78eec3-80cd-4ed1-a223-f1dc5d4d7b62	676454	Phú Xuyên	4246	\N	20.776643	105.882077	\N	\N
a59275c2-8783-4ca2-a7f6-46236a43322d	758013	Đạo Viện	10710	\N	21.856392	105.362479	\N	\N
7a1e6656-7ad5-49e3-b6e3-1b718ec89332	1023838510	Sông Luồng	10010	\N	20.428549	105.065796	\N	\N
bc7483d4-1598-4f4e-aa33-c97fcfa4df98	1023838512	Hiền Chung	10011	\N	20.454307	104.864402	\N	\N
62c057eb-1a4f-4e34-9f58-6710c17b7784	692253	Hiền Chung	10011	\N	20.420849	104.868152	\N	\N
d125de62-e270-4671-90b3-baf680a48c4f	1023838504	Phú Sơn 2	10018	\N	20.518307	104.9759	\N	\N
c5da85eb-00ed-45af-bc50-883642270e99	1023838505	Phú Sơn 1	10018	\N	20.527044	105.007298	\N	\N
d6d4f3ca-e485-4a88-a285-94a9ca74b9c7	1023838506	Thành Sơn	10022	\N	20.57764	104.938453	\N	\N
9b00f09b-0643-48b5-828f-e6f520ba590d	863546	Thanh Xuân	10023	\N	20.460063	105.03347	\N	\N
182dd16e-0420-4cee-b4d4-346f69ecd395	1023838508	Trung Sơn 1	10025	\N	20.603301	104.851276	\N	\N
fca91ab8-9bfa-414c-a488-5534e82d88b4	1023838509	Trung Sơn 2	10025	\N	20.627538	104.833764	\N	\N
23c8ec8c-4cfb-4eea-9e47-85efca6ad7a9	668617	Hồ thủy điện Trung Sơn	10025	\N	20.607222	104.854444	\N	\N
58b4443b-0ca9-4f37-b379-35ccfad58c10	1023838507	Trung Thành 2	10026	\N	20.552616	104.91581	\N	\N
845c371e-d1fa-46c8-a81a-c3b06658cb26	1023838515	Trung Thành 1	10026	\N	20.58549	104.90992	\N	\N
2d89f8e9-8cb9-4a27-b611-42e320ce599d	675219	Trung Thành	10026	\N	20.569722	104.925556	\N	\N
c700da76-40ce-4154-ae80-bf942e25774f	240018	Xuân Hòa	6108	\N	22.289628	104.528422	\N	\N
870b4ff0-9748-4661-8261-8da71672766e	1021008713	Xuân Thượng	6109	\N	22.222078	104.527738	\N	\N
8bffb530-c9f5-426f-9acd-80d96cb0ad72	240017	Xuân Thượng	6109	\N	22.235007	104.510791	\N	\N
391a635c-40d3-4b95-ba81-b67005d49dbe	1021008706	Yên Sơn	6110	\N	22.234219	104.450783	\N	\N
047c028a-5617-465a-b05c-9b158b79d8c2	240026	Bản Cái	6111	\N	22.338925	104.395122	\N	\N
461b9ead-fdf4-41be-8922-cadefcd566cf	1021008508	Bản Liền	6113	\N	22.51766	104.3981	\N	\N
8ac2f439-ba63-48e9-ba22-4353d0d95850	1021008207	Bản Xèo	6136	\N	22.538542	103.760199	\N	\N
752633b8-cc1e-4a14-be77-28b0ed950bc3	600003	Cống số 3 Sông Tra	10445	\N	10.410678	106.557355	\N	\N
37e6a911-8542-4fc2-aeb0-f5a55f36e22c	1021008008	Cốc San	6139	\N	22.464431	103.946126	\N	\N
f80344c2-8d38-4962-be26-8ab4a5d1c630	360008	Hồ Vũng Sú (xã Thành Minh, Thạch Thành)	10070	\N	20.241389	105.624444	\N	\N
40ed705b-acf1-4c78-a3d3-9bcf610d0f3e	379704	Phúc Thọ	4292	\N	21.130442	105.547214	\N	\N
3b002f33-edd3-44d2-bac1-d7c9079f1390	891069	Quốc Oai	4304	\N	20.972784	105.613976	\N	\N
1a3fbdb1-7b1c-4af8-830e-f97015185835	148374	Quất Đông	8446	\N	21.542049	107.880132	\N	\N
68bcfe76-b8e2-466a-87af-263c56bbc91a	140010	Lòng Dinh	8512	\N	20.928652	107.510611	\N	\N
a4896fb2-873f-47df-b7e1-ea58323b73e7	448710	Bảo Hà	6093	\N	22.175339	104.353685	\N	\N
36475257-3203-40b2-b1cd-8fbf1b5605d4	1021008714	Bảo Hà 2	6093	\N	22.14743	104.37826	\N	\N
3e52a6b9-6137-41b0-b76c-e2286835611a	1021008715	Cam Cọn	6094	\N	22.23703	104.27533	\N	\N
9e780531-5eb7-4b78-82a1-5fe5b8320b5b	341076	Kim Sơn	6096	\N	22.2435	104.311889	\N	\N
776da66b-3cd6-4cdb-9a6f-df3fa309e05e	1021008716	Kim Sơn	6096	\N	22.250592	104.326959	\N	\N
2e9e42aa-8a0f-4700-ada6-2c5c8beb3670	1021008704	Long Phúc	6097	\N	22.1888	104.54135	\N	\N
c01d7ecb-a875-4abf-b0c3-3379ff6a1266	1021008703	Long Khánh	6097	\N	22.15086	104.5618	\N	\N
c4168737-d08e-43d2-b9ce-ad5d5863dcd3	1021008711	Tân Dương 1	6103	\N	22.288431	104.471095	\N	\N
dc64f4da-5686-48a2-8abf-134ba7e8a91e	1021008712	Tân Dương 2	6103	\N	22.263548	104.485082	\N	\N
21c8e0eb-d921-44b1-a57a-76ded24e219d	240019	Tân Dương	6103	\N	22.280559	104.478892	\N	\N
b0b6ead2-00ee-4851-855e-19b79e72f856	1021008701	Tân Tiến	6104	\N	22.43159	104.42886	\N	\N
ef058bff-75e3-460a-bdd4-90da74f133c9	1021008707	Thượng Hà 2	6105	\N	22.292404	104.37518	\N	\N
bd1665a2-7263-4e91-a4c0-3f2136714e5b	1021008709	Thượng Hà 1	6105	\N	22.2803	104.41162	\N	\N
282de7b2-8e29-4f86-8dcf-b4d8123bb27e	240020	Thượng Hà	6105	\N	22.278292	104.400409	\N	\N
1920435d-ea25-4829-bc21-4482b10fcf7c	356463	Việt Tiến	6106	\N	22.196778	104.589861	\N	\N
3c4704e4-e79d-45c8-aacb-6e77876553e7	1021008504	Hoàng Thu Phố	6119	\N	22.56247	104.25584	\N	\N
0061d90a-a78a-4a75-8afd-4adea4d73de6	1021008506	Lùng Cải	6121	\N	22.64366	104.37199	\N	\N
736f1d26-2b58-4dd2-987d-733eab38494f	00206240	Lao Cai - Bac Ha - Truong mam non Lung Cai	6121	\N	22.642322540283203	104.3716049194336	\N	\N
e182ae7d-f2a7-451c-802e-72176bddf378	240009	Tả Củ Tỷ	6128	\N	22.599464	104.421191	\N	\N
854b0921-395e-4121-a56e-d4fb914a6e9e	1021008505	Tả Van Chư	6129	\N	22.60574	104.27485	\N	\N
4c168ac3-d0ec-4e6b-b1a6-57f971a0d6dd	1021008206	Bản Qua	6134	\N	22.562867	103.864251	\N	\N
3f3b85ef-e4b4-4b0f-ac36-3180b2a7aff2	468153	Bát Xát	6137	\N	22.536111	103.893333	\N	\N
fec7ed88-8076-4813-a121-5c23aa2c32a1	1021008201	Cốc Mỳ 2	6138	\N	22.63316	103.79261	\N	\N
59683142-6da8-4f95-8ff2-5a19359ddc30	1021008209	Dền Sáng	6140	\N	22.565041	103.671201	\N	\N
8a97fef3-5f83-45ae-a016-c25d8c8c17bb	00206246	Lao Cai - Bat Xat - UBND Den Sang	6140	\N	22.566753387451172	103.6702651977539	\N	\N
1bae0b31-7130-4e04-a04c-26c71e5a5d15	1021008210	Dền Thàng 	6141	\N	22.561285	103.698156	\N	\N
6031cf00-5410-48a2-8d27-a118e4cc6120	341078	Thủy điện Ngòi Phát	6141	\N	22.554361	103.74375	\N	\N
41b82a35-4ab1-4ff6-bec8-a6518f88234b	355886	Thủy điện Mường Hum	6141	\N	22.5404	103.714442	\N	\N
475ac65f-34e2-4859-9137-af22a1f64079	012062D2	Lao Cai - Bat Xat - UBND Den Thang	6141	\N	22.561426162719727	103.69801330566406	\N	\N
397d5305-6403-44f0-8bdb-dae9eb6b94e2	742691	Mường Vi	6143	\N	22.559288	103.799412	\N	\N
52ddc6cb-9378-4d21-b011-61188e9b3a78	240022	Nậm Chạc	6144	\N	22.720278	103.701944	\N	\N
db594241-2dc9-4b51-8fd8-9f4abf38c7d2	1021008212	Pa Cheo	6147	\N	22.500887	103.740997	\N	\N
df616b3e-21e0-4adc-bcaa-7e856c4c4de5	1021008213	Phìn Ngan	6148	\N	22.478728	103.882155	\N	\N
1dc4c1c0-d388-460e-a755-2f5e9da4aa45	0120BD41	Lao Cai - Bat Xat - UBND Phin Ngan	6148	\N	22.478124618530273	103.87935638427734	\N	\N
5f6a5b86-8696-4b4e-b08b-3336774e5d48	0120BD44	Lao Cai - Bat Xat - UBND Tong Sanh	6151	\N	22.442108154296875	103.92804718017578	\N	\N
a3307e8c-af9f-42cc-8756-6e5024ae5133	1021008202	Trịnh Tường 1	6152	\N	22.6928	103.74532	\N	\N
c0248a17-99ea-47da-b3a2-ffc910d30fba	865706	Trịnh Tường	6152	\N	22.674167	103.735833	\N	\N
0128648a-043b-40e4-a88b-4ebeedb87abb	1021008205	Trung Lèng Hồ	6153	\N	22.501665	103.686862	\N	\N
2786211b-8a73-416a-a874-cebdb6c5d659	34077	Trung Lèng Hồ	6153	\N	22.503056	103.688611	\N	\N
454aa711-f55d-4a4a-a175-24e36b628a5e	753531	Cam Đường	6159	\N	22.407778	104.023333	\N	\N
6f9d5361-a355-4a8c-b2ac-aac5b66755e2	1021008001	Tả Phời	6168	\N	22.400893	103.977309	\N	\N
c323e0d0-f69d-4eb5-9bc9-eeef74666417	1021008002	Nam Cường	6165	\N	22.43835	103.9843	\N	\N
87b94305-9140-4061-af40-ce83e8f43cd6	240014	Nam Cường	6165	\N	22.447778	103.994167	\N	\N
ce8ffbe6-ce86-4700-a187-95a71e02f079	240003	Bản Xen	6173	\N	22.569722	104.086667	\N	\N
20edda34-8f6d-4828-9d32-954ffd58c1f9	1021008303	Cao Sơn	6174	\N	22.646992	104.144805	\N	\N
7263933c-6209-4da5-9802-44aa7dec4ccf	821546	Cao Sơn	6174	\N	22.646944	104.144167	\N	\N
a39db081-aeda-45d1-a8db-9bdd30218d86	240002	Nậm Chảy	6181	\N	22.713507	104.067661	\N	\N
c7bbb60f-e4fb-41d4-a6cf-4aac84f12d43	240001	Pha Long	6182	\N	22.816389	104.239444	\N	\N
0e210281-6cbc-43ac-91d9-c35a9acf6f04	240021	Tả Gia Khâu	6183	\N	22.762481	104.231533	\N	\N
55f2079d-f229-49bb-ac84-bbdb09a0d9b6	1021008805	Hầu Thào 	6191	\N	22.300794	103.903818	\N	\N
2ccf619f-9941-4efb-b407-548b99e17ac6	240011	Mường Hoa	6191	\N	22.294078	103.922565	\N	\N
807dcabb-1f2a-4ea9-b034-bad1e3b926bc	1021008801	Trung Chải	6205	\N	22.40176	103.89239	\N	\N
80eb03f8-ed4a-4ce7-aa16-7446dd207ef2	240007	Bản Mế	6206	\N	22.680177	104.230451	\N	\N
29f9d8f6-e6cd-4eb1-9090-1f08411448cb	825720	Nàn Sán	6212	\N	22.699444	104.260556	\N	\N
74fbf583-185b-40d1-a6e0-212a5fb38bf7	240008	Quan Hồ Thẩn	6215	\N	22.667222	104.289209	\N	\N
043e0385-f50c-48c6-a995-c0777bd972ad	1021008401	Si Ma Cai 1	6216	\N	22.69854	104.28765	\N	\N
8e72be09-9e45-4dd4-904e-ffdcdcfa2b6f	240006	Sín Chéng	6217	\N	22.648735	104.220068	\N	\N
2d4595fa-1f2e-4547-909d-7f4e2ab24d3b	1021008916	Nậm Rạng 	6232	\N	22.17476	104.200496	\N	\N
851a367d-3dd0-4df3-8ccb-7d8152325a14	0120BD3D	Lao Cai - Van Ban - UBND xa Nam Tha	6233	\N	22.0047664642334	104.38288116455078	\N	\N
7a81e91e-8bb1-4629-94f3-485c5ef41f06	1021008904	Nậm Xây 1	6234	\N	21.97975	104.07665	\N	\N
ad61cd1b-0466-4c5e-a922-77d7ea7337b4	1021008918	Nậm Xây 2	6234	\N	21.960481	104.121037	\N	\N
18a707e6-9d07-49f8-88a9-87abe6097481	240029	Nậm Xây	6234	\N	21.984444	104.067778	\N	\N
f31b3843-c4c9-4bd2-a880-82c1ef851f93	01206192	Lao Cai - Van Ban - Dap Thuy dien Nam Xay Luong 3	6234	\N	21.943283081054688	104.15274810791016	\N	\N
80130989-024c-4b61-bba7-7882d5231167	01206359	Lao Cai - Nam Xay Luong 3 - Bai Vang	6234	\N	21.934646606445312	104.18133544921875	\N	\N
cffb2d4f-40db-4f9d-bf80-a83d5ad0017f	653845	Ô Quý Hồ	11202	\N	22.365827	103.802517	\N	\N
e94f93f7-8579-4662-b63c-1945404b072f	1021008809	San Sả Hồ	11203	\N	22.33307	103.823533	\N	\N
358aad66-0b22-4150-992b-b0675e683a47	240005	Hoàng Liên	11203	\N	22.332912	103.823418	\N	\N
b4aef971-709f-42aa-8131-053ea4c771fc	240013	Ngũ Chỉ Sơn	11203	\N	22.332778	103.823611	\N	\N
46cebd66-ef9d-4512-ac75-0ef10ed66722	762624	Ba Sao	4501	\N	20.553431	105.816556	\N	\N
\.


--
-- TOC entry 5431 (class 0 OID 20323)
-- Dependencies: 291
-- Data for Name: sys_coquan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sys_coquan (cq_id, cq_ten, cq_mota, cq_diachi, cq_nguoidaidien, cq_dienthoai, cq_email, cq_ghichu, cq_active, cq_pid, cq_stt, cq_loai, cq_xaid, cq_tinhid) FROM stdin;
1	Mưa miền bắc	\N	Hà Nội	\N	\N	\N	\N	t	\N	\N	\N	\N	\N
\.


--
-- TOC entry 5440 (class 0 OID 20364)
-- Dependencies: 300
-- Data for Name: sys_danhmuc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sys_danhmuc (dm_id, dm_ten, dm_ldm_id, dm_ma, dm_pid, dm_stt, dm_mota, dm_icon_url, functionid) FROM stdin;
1	Quản lý hệ thống	1	QUAN_LY_HE_THONG	\N	1	\N	\N	\N
3	Quản lý chức năng	1	QUAN_LY_CHUC_NANG	\N	1	\N	\N	1
2	Quản lý menu 	1	QUAN_LY_MENU	1	1	\N	\N	4
4	Quản lý bản đồ	1	QUAN_LY_BAN_DO	1	2			5
6	Quản lý người dùng	1	QUAN_LY_USER	\N	1	none	\N	2
\.


--
-- TOC entry 5438 (class 0 OID 20355)
-- Dependencies: 298
-- Data for Name: sys_danhmuc_phanloai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sys_danhmuc_phanloai (ldm_id, ldm_ten, ldm_ma, ldm_mota, ldm_pid, ldm_stt, ldm_url) FROM stdin;
1	Phần mềm quan trắc dữ liệu mưa	PHAN_MEM_QUAN_TRAC_MUA	\N	\N	1	\N
\.


--
-- TOC entry 5446 (class 0 OID 20399)
-- Dependencies: 306
-- Data for Name: sys_function; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sys_function (fn_id, fn_thutu, fn_ten, fn_mota, fn_ma, fn_active, fn_ngaytao, fn_ngaycapnhat, fn_nguoitao, fn_dmid, fn_url) FROM stdin;
1	1	Chức năng	crud chức năng	ChucNangPage	t	\N	2025-05-18 21:49:03.138049	admin	\N	/admin/chuc-nang
4	3	Quản lý menu	crud chức năng menu	menupage	t	\N	2025-05-19 21:01:26.596682	admin	\N	/admin/menu
5	\N	Quản lý bản đồ		BanDoPage	t	\N	2025-05-24 21:25:40.780884	admin	\N	/admin/ban-do
2	2	Danh sách người dùng	quản lý và đăng ký tài khoản	AdminUserPage	t	\N	2025-06-20 10:10:23.408615	admin	\N	/admin/nguoi-dung
\.


--
-- TOC entry 5434 (class 0 OID 20339)
-- Dependencies: 294
-- Data for Name: sys_member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sys_member (mem_id, mem_username, mem_password, mem_hoten, mem_cq_id, mem_email, mem_active, mem_create_at, mem_update_at, mem_lastlogin_at, mem_delete_at, mem_delete_by, mem_update_by) FROM stdin;
32836713-0108-4238-920d-7c39a5f7a115	minhtri	AQAAAAIAAYagAAAAEJOxOfwldXqrDy3nrQDOQq0Xpz9Rxcn9t/jR7jgNt8vpEnR4h+px7iLCh11RGK0tQQ==	Minh Trí	1	test@gmail.com	t	2025-06-20 21:22:30.131765	\N	\N	\N	\N	\N
62b6c133-08be-4ff3-a6ef-9d75928daf70	admin	AQAAAAIAAYagAAAAEJOxOfwldXqrDy3nrQDOQq0Xpz9Rxcn9t/jR7jgNt8vpEnR4h+px7iLCh11RGK0tQQ==	Administrator	1	admin@example.com	t	\N	2025-06-21 15:31:06.849471	2025-06-21 16:11:38.53101	\N	\N	\N
13c146a1-035a-4047-8ec4-968200b63532	test	AQAAAAIAAYagAAAAEKF04/15UD+aVkL1vnB8MRMBuTR7Odo24/p01AsgsTtlXB0yiCGUWORs7wwj2QbPWA==	test	1	test@gmail.com	t	2025-06-21 15:26:25.655249	2025-06-21 16:52:10.298585	\N	\N	\N	admin
\.


--
-- TOC entry 5429 (class 0 OID 20316)
-- Dependencies: 289
-- Data for Name: sys_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sys_role (role_id, role_ten, role_stt, role_nguoitao, role_ma, role_type) FROM stdin;
2	Quản lý dữ liệu	2	admin	QUAN_LY_DU_LIEU	1
1	Quản trị hệ thống	1	admin	QUAN_TRI_HE_THONG	1
3	Quản lý người dùng	3	admin	QUAN_LY_NGUOI_DUNG	1
4	Toàn nước	4	admin	TOAN_NUOC	2
5	Đọc dữ liệu	5	admin	READ	2
6	Ghi dữ liệu	6	admin	CREATE	2
7	Xóa dữ liệu	7	admin	DELETE	2
\.


--
-- TOC entry 5433 (class 0 OID 20333)
-- Dependencies: 293
-- Data for Name: sys_role_coquan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sys_role_coquan (id, cq_id, role_id) FROM stdin;
\.


--
-- TOC entry 5436 (class 0 OID 20348)
-- Dependencies: 296
-- Data for Name: sys_role_member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sys_role_member (id, mem_id, role_id) FROM stdin;
1	62b6c133-08be-4ff3-a6ef-9d75928daf70	1
2	62b6c133-08be-4ff3-a6ef-9d75928daf70	4
\.


--
-- TOC entry 5442 (class 0 OID 20373)
-- Dependencies: 302
-- Data for Name: weather_stations_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weather_stations_report (id, name_file, file_ref, request_time, ngaybatdau, ngayketthuc, tansuat, email, trangthai, created_by, is_public, rp_type) FROM stdin;
25	Báo cáo lượng mưa từ 00:00:00 18/6/2025 đến 19:00:00 18/6/2025 tỉnh Quảng Ngãi.xlsx	Uploads\\Reports\\Bao_cao_luong_mua_tu_00_00_00_18_6_2025_den_19_00_00_18_6_2025_tinh_Quang_Ngai_I2FkNB.xlsx	2025-06-18 19:39:10	2025-06-18 00:00:00	2025-06-18 19:00:00	1h	dongtri567@gmail.com	2	62b6c133-08be-4ff3-a6ef-9d75928daf70	t	RAIN
26	Báo cáo lượng mưa từ 00:00:00 18/6/2025 đến 19:00:00 18/6/2025 tỉnh Quảng Ngãi.xlsx	Uploads\\Reports\\Bao_cao_luong_mua_tu_00_00_00_18_6_2025_den_19_00_00_18_6_2025_tinh_Quang_Ngai_q4aRXz.xlsx	2025-06-18 19:56:13	2025-06-18 00:00:00	2025-06-18 19:00:00	1h	dongtri567@gmail.com	2	62b6c133-08be-4ff3-a6ef-9d75928daf70	t	RAIN
27	Báo cáo lượng mưa từ 00:00:00 18/6/2025 đến 19:00:00 18/6/2025 tỉnh Quảng Ngãi.xlsx	Uploads\\Reports\\Bao_cao_luong_mua_tu_00_00_00_18_6_2025_den_19_00_00_18_6_2025_tinh_Quang_Ngai_7WVwpR.xlsx	2025-06-18 19:57:38	2025-06-18 00:00:00	2025-06-18 19:00:00	1h	dongtri567@gmail.com	2	62b6c133-08be-4ff3-a6ef-9d75928daf70	t	RAIN
20	Báo cáo lượng mưa từ 00:00:00 18/6/2025 đến 15:00:00 18/6/2025 tỉnh Cà Mau.xlsx	Uploads\\Reports\\Bao_cao_luong_mua_tu_00_00_00_18_6_2025_den_15_00_00_18_6_2025_tinh_Ca_Mau.xlsx	2025-06-18 15:58:30	2025-06-18 00:00:00	2025-06-18 15:00:00	1h	dongtri567@gmail.com	2	62b6c133-08be-4ff3-a6ef-9d75928daf70	t	RAIN
21	Báo cáo lượng mưa từ 00:00:00 18/6/2025 đến 16:00:00 18/6/2025 tỉnh Cà Mau.xlsx	\N	2025-06-18 16:01:18	2025-06-18 00:00:00	2025-06-18 16:00:00	1h	dongtri567@gmail.com	1	62b6c133-08be-4ff3-a6ef-9d75928daf70	t	RAIN
22	Báo cáo lượng mưa từ 00:00:00 18/6/2025 đến 16:00:00 18/6/2025 tỉnh Cà Mau.xlsx	Uploads\\Reports\\Bao_cao_luong_mua_tu_00_00_00_18_6_2025_den_16_00_00_18_6_2025_tinh_Ca_Mau_aj7yin.xlsx	2025-06-18 16:04:06	2025-06-18 00:00:00	2025-06-18 16:00:00	1h	dongtri567@gmail.com	2	62b6c133-08be-4ff3-a6ef-9d75928daf70	t	RAIN
23	Báo cáo lượng mưa từ 00:00:00 18/6/2025 đến 19:00:00 18/6/2025 tỉnh Cà Mau.xlsx	Uploads\\Reports\\Bao_cao_luong_mua_tu_00_00_00_18_6_2025_den_19_00_00_18_6_2025_tinh_Ca_Mau_Rez7wt.xlsx	2025-06-18 19:30:41	2025-06-18 00:00:00	2025-06-18 19:00:00	1h	dongtri567@gmail.com	2	62b6c133-08be-4ff3-a6ef-9d75928daf70	t	RAIN
24	Báo cáo lượng mưa từ 00:00:00 18/6/2025 đến 19:00:00 18/6/2025 tỉnh Quảng Ngãi.xlsx	Uploads\\Reports\\Bao_cao_luong_mua_tu_00_00_00_18_6_2025_den_19_00_00_18_6_2025_tinh_Quang_Ngai_5u7mNd.xlsx	2025-06-18 19:32:11	2025-06-18 00:00:00	2025-06-18 19:00:00	1h	dongtri567@gmail.com	2	62b6c133-08be-4ff3-a6ef-9d75928daf70	t	RAIN
28	Báo cáo lượng mưa từ 00:00:00 1/6/2025 đến 20:00:00 18/6/2025 tỉnh Đắk Lắk.xlsx	Uploads\\Reports\\Bao_cao_luong_mua_tu_00_00_00_1_6_2025_den_20_00_00_18_6_2025_tinh_Dak_Lak_FYBAZd.xlsx	2025-06-18 20:02:10	2025-06-01 00:00:00	2025-06-18 20:00:00	1h	dongtri567@gmail.com	2	62b6c133-08be-4ff3-a6ef-9d75928daf70	t	RAIN
29	Báo cáo lượng mưa từ 00:00:00 18/6/2025 đến 22:00:00 18/6/2025 tỉnh Đồng Nai.xlsx	Uploads\\Reports\\Bao_cao_luong_mua_tu_00_00_00_18_6_2025_den_22_00_00_18_6_2025_tinh_Dong_Nai_CiN3aB.xlsx	2025-06-18 22:01:57	2025-06-18 00:00:00	2025-06-18 22:00:00	1h	dongtri567@gmail.com	2	62b6c133-08be-4ff3-a6ef-9d75928daf70	t	RAIN
30	Báo cáo lượng mưa từ 00:00:00 19/6/2025 đến 14:00:00 19/6/2025 tỉnh Thái Nguyên.xlsx	Uploads\\Reports\\Bao_cao_luong_mua_tu_00_00_00_19_6_2025_den_14_00_00_19_6_2025_tinh_Thai_Nguyen_jq79aO.xlsx	2025-06-19 14:01:50	2025-06-19 00:00:00	2025-06-19 14:00:00	1h	dongtri567@gmail.com	2	62b6c133-08be-4ff3-a6ef-9d75928daf70	t	RAIN
31	Báo cáo lượng mưa từ 00:00:00 19/6/2025 đến 14:00:00 19/6/2025 tỉnh Lạng Sơn.xlsx	Uploads\\Reports\\Bao_cao_luong_mua_tu_00_00_00_19_6_2025_den_14_00_00_19_6_2025_tinh_Lang_Son_xoZJgL.xlsx	2025-06-19 14:22:24	2025-06-19 00:00:00	2025-06-19 14:00:00	1h	dongtri567@gmail.com	2	62b6c133-08be-4ff3-a6ef-9d75928daf70	t	RAIN
32	Báo cáo lượng mưa từ 00:00:00 19/6/2025 đến 17:00:00 19/6/2025 tỉnh Thái Nguyên.xlsx	Uploads\\Reports\\Bao_cao_luong_mua_tu_00_00_00_19_6_2025_den_17_00_00_19_6_2025_tinh_Thai_Nguyen_FPbTWn.xlsx	2025-06-19 17:15:20	2025-06-19 00:00:00	2025-06-19 17:00:00	1h	thucdong17@gmail.com	2	62b6c133-08be-4ff3-a6ef-9d75928daf70	t	RAIN
\.


--
-- TOC entry 5444 (class 0 OID 20390)
-- Dependencies: 304
-- Data for Name: weather_stations_report_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weather_stations_report_list (id, weather_stations_report_id, provine_id, station_id) FROM stdin;
68	20	4	690008
69	20	4	880549
70	21	4	169811
71	21	4	880549
72	21	4	690008
73	22	4	880549
74	22	4	690008
75	22	4	690005
76	23	4	690016
77	23	4	169811
78	23	4	880549
79	23	4	690008
80	24	16	820001
81	24	16	69704
82	24	16	1026261104
83	25	16	69704
84	25	16	1026261104
85	25	16	1026261401
86	25	16	1026261404
87	26	16	820001
88	26	16	1026261104
89	26	16	1026261401
90	27	16	820001
91	27	16	69704
92	28	32	470027
93	28	32	470010
94	28	32	470022
95	29	33	159846
96	29	33	23584
97	29	33	365004
98	29	33	930002
99	30	27	1020606406
100	30	27	1020606404
101	30	27	1020606402
102	31	12	1022018105
103	31	12	1022018104
104	31	12	1022018502
105	32	27	518523
106	32	27	1020606404
107	32	27	1020606402
\.


--
-- TOC entry 5482 (class 0 OID 0)
-- Dependencies: 281
-- Name: bgmap_commune_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bgmap_commune_gid_seq', 1, false);


--
-- TOC entry 5483 (class 0 OID 0)
-- Dependencies: 318
-- Name: bgmap_ogc_fid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bgmap_ogc_fid_seq', 34, true);


--
-- TOC entry 5484 (class 0 OID 0)
-- Dependencies: 284
-- Name: iw_thongsoquantrac_tskt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iw_thongsoquantrac_tskt_id_seq', 6419, true);


--
-- TOC entry 5485 (class 0 OID 0)
-- Dependencies: 309
-- Name: map_layer_coquan_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_layer_coquan_access_id_seq', 1, false);


--
-- TOC entry 5486 (class 0 OID 0)
-- Dependencies: 311
-- Name: map_layer_member_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_layer_member_access_id_seq', 1, false);


--
-- TOC entry 5487 (class 0 OID 0)
-- Dependencies: 307
-- Name: map_layers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_layers_id_seq', 13, true);


--
-- TOC entry 5488 (class 0 OID 0)
-- Dependencies: 315
-- Name: map_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_sources_id_seq', 5, true);


--
-- TOC entry 5489 (class 0 OID 0)
-- Dependencies: 313
-- Name: mapbox_apikeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapbox_apikeys_id_seq', 1, true);


--
-- TOC entry 5490 (class 0 OID 0)
-- Dependencies: 286
-- Name: monitoring_data_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monitoring_data_data_id_seq', 5825377, true);


--
-- TOC entry 5491 (class 0 OID 0)
-- Dependencies: 290
-- Name: sys_coquan_cq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_coquan_cq_id_seq', 1, true);


--
-- TOC entry 5492 (class 0 OID 0)
-- Dependencies: 299
-- Name: sys_danhmuc_dm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_danhmuc_dm_id_seq', 6, true);


--
-- TOC entry 5493 (class 0 OID 0)
-- Dependencies: 297
-- Name: sys_danhmuc_phanloai_ldm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_danhmuc_phanloai_ldm_id_seq', 1, true);


--
-- TOC entry 5494 (class 0 OID 0)
-- Dependencies: 305
-- Name: sys_function_fn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_function_fn_id_seq', 5, true);


--
-- TOC entry 5495 (class 0 OID 0)
-- Dependencies: 292
-- Name: sys_role_coquan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_role_coquan_id_seq', 1, false);


--
-- TOC entry 5496 (class 0 OID 0)
-- Dependencies: 295
-- Name: sys_role_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_role_member_id_seq', 2, true);


--
-- TOC entry 5497 (class 0 OID 0)
-- Dependencies: 288
-- Name: sys_role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_role_role_id_seq', 7, true);


--
-- TOC entry 5498 (class 0 OID 0)
-- Dependencies: 301
-- Name: weather_stations_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weather_stations_report_id_seq', 32, true);


--
-- TOC entry 5499 (class 0 OID 0)
-- Dependencies: 303
-- Name: weather_stations_report_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weather_stations_report_list_id_seq', 107, true);


--
-- TOC entry 5191 (class 2606 OID 20284)
-- Name: bgmap_commune bgmap_commune_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bgmap_commune
    ADD CONSTRAINT bgmap_commune_pkey PRIMARY KEY (gid);


--
-- TOC entry 5237 (class 2606 OID 40606)
-- Name: bgmap_province bgmap_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bgmap_province
    ADD CONSTRAINT bgmap_pk PRIMARY KEY (gid);


--
-- TOC entry 5199 (class 2606 OID 20304)
-- Name: iw_thongsoquantrac iw_thongsoquantrac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iw_thongsoquantrac
    ADD CONSTRAINT iw_thongsoquantrac_pkey PRIMARY KEY (tskt_id);


--
-- TOC entry 5229 (class 2606 OID 20426)
-- Name: map_layer_coquan_access map_layer_coquan_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_layer_coquan_access
    ADD CONSTRAINT map_layer_coquan_access_pkey PRIMARY KEY (id);


--
-- TOC entry 5231 (class 2606 OID 20433)
-- Name: map_layer_member_access map_layer_member_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_layer_member_access
    ADD CONSTRAINT map_layer_member_access_pkey PRIMARY KEY (id);


--
-- TOC entry 5227 (class 2606 OID 20417)
-- Name: map_layers map_layers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_layers
    ADD CONSTRAINT map_layers_pkey PRIMARY KEY (id);


--
-- TOC entry 5235 (class 2606 OID 40395)
-- Name: map_sources map_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_sources
    ADD CONSTRAINT map_sources_pkey PRIMARY KEY (id);


--
-- TOC entry 5233 (class 2606 OID 20444)
-- Name: mapbox_apikeys mapbox_apikeys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapbox_apikeys
    ADD CONSTRAINT mapbox_apikeys_pkey PRIMARY KEY (id);


--
-- TOC entry 5203 (class 2606 OID 40437)
-- Name: monitoring_data monitoring_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitoring_data
    ADD CONSTRAINT monitoring_data_pkey PRIMARY KEY (tskt_id, data_thoigian);


--
-- TOC entry 5194 (class 2606 OID 20292)
-- Name: monitoring_stations monitoring_stations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitoring_stations
    ADD CONSTRAINT monitoring_stations_pkey PRIMARY KEY (key);


--
-- TOC entry 5196 (class 2606 OID 20294)
-- Name: monitoring_stations monitoring_stations_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitoring_stations
    ADD CONSTRAINT monitoring_stations_station_id_key UNIQUE (station_id);


--
-- TOC entry 5207 (class 2606 OID 20331)
-- Name: sys_coquan sys_coquan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_coquan
    ADD CONSTRAINT sys_coquan_pkey PRIMARY KEY (cq_id);


--
-- TOC entry 5217 (class 2606 OID 20362)
-- Name: sys_danhmuc_phanloai sys_danhmuc_phanloai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_danhmuc_phanloai
    ADD CONSTRAINT sys_danhmuc_phanloai_pkey PRIMARY KEY (ldm_id);


--
-- TOC entry 5219 (class 2606 OID 20371)
-- Name: sys_danhmuc sys_danhmuc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_danhmuc
    ADD CONSTRAINT sys_danhmuc_pkey PRIMARY KEY (dm_id);


--
-- TOC entry 5225 (class 2606 OID 20406)
-- Name: sys_function sys_function_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_function
    ADD CONSTRAINT sys_function_pkey PRIMARY KEY (fn_id);


--
-- TOC entry 5211 (class 2606 OID 20346)
-- Name: sys_member sys_member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_member
    ADD CONSTRAINT sys_member_pkey PRIMARY KEY (mem_id);


--
-- TOC entry 5209 (class 2606 OID 20338)
-- Name: sys_role_coquan sys_role_coquan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_role_coquan
    ADD CONSTRAINT sys_role_coquan_pkey PRIMARY KEY (id);


--
-- TOC entry 5215 (class 2606 OID 20353)
-- Name: sys_role_member sys_role_member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_role_member
    ADD CONSTRAINT sys_role_member_pkey PRIMARY KEY (id);


--
-- TOC entry 5205 (class 2606 OID 20321)
-- Name: sys_role sys_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_role
    ADD CONSTRAINT sys_role_pkey PRIMARY KEY (role_id);


--
-- TOC entry 5213 (class 2606 OID 52750)
-- Name: sys_member unique_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_member
    ADD CONSTRAINT unique_username UNIQUE (mem_username);


--
-- TOC entry 5223 (class 2606 OID 20397)
-- Name: weather_stations_report_list weather_stations_report_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather_stations_report_list
    ADD CONSTRAINT weather_stations_report_list_pkey PRIMARY KEY (id);


--
-- TOC entry 5221 (class 2606 OID 20381)
-- Name: weather_stations_report weather_stations_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather_stations_report
    ADD CONSTRAINT weather_stations_report_pkey PRIMARY KEY (id);


--
-- TOC entry 5200 (class 1259 OID 40439)
-- Name: idx_monitoring_data_tsktid_thoigian; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_monitoring_data_tsktid_thoigian ON public.monitoring_data USING btree (tskt_id, data_thoigian DESC);


--
-- TOC entry 5192 (class 1259 OID 20587)
-- Name: idx_station_commune_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_station_commune_id ON public.monitoring_stations USING btree (commune_id);


--
-- TOC entry 5197 (class 1259 OID 40499)
-- Name: idx_tskt_station_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tskt_station_id ON public.iw_thongsoquantrac USING btree (station_id);


--
-- TOC entry 5201 (class 1259 OID 40438)
-- Name: monitoring_data_data_thoigian_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitoring_data_data_thoigian_idx ON public.monitoring_data USING btree (data_thoigian DESC);


--
-- TOC entry 5259 (class 2620 OID 20584)
-- Name: monitoring_data ts_insert_blocker; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.monitoring_data FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();


--
-- TOC entry 5238 (class 2606 OID 52693)
-- Name: bgmap_commune fk_commune_province; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bgmap_commune
    ADD CONSTRAINT fk_commune_province FOREIGN KEY (tinh_id) REFERENCES public.bgmap_province(gid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 5240 (class 2606 OID 40512)
-- Name: iw_thongsoquantrac fk_station_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iw_thongsoquantrac
    ADD CONSTRAINT fk_station_id FOREIGN KEY (station_id) REFERENCES public.monitoring_stations(station_id) ON DELETE CASCADE;


--
-- TOC entry 5247 (class 2606 OID 40343)
-- Name: sys_danhmuc fk_sys_danhmuc_function; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_danhmuc
    ADD CONSTRAINT fk_sys_danhmuc_function FOREIGN KEY (functionid) REFERENCES public.sys_function(fn_id);


--
-- TOC entry 5254 (class 2606 OID 20545)
-- Name: map_layer_coquan_access map_layer_coquan_access_cq_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_layer_coquan_access
    ADD CONSTRAINT map_layer_coquan_access_cq_id_fkey FOREIGN KEY (cq_id) REFERENCES public.sys_coquan(cq_id) ON DELETE CASCADE;


--
-- TOC entry 5255 (class 2606 OID 20550)
-- Name: map_layer_coquan_access map_layer_coquan_access_layer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_layer_coquan_access
    ADD CONSTRAINT map_layer_coquan_access_layer_id_fkey FOREIGN KEY (layer_id) REFERENCES public.map_layers(id) ON DELETE CASCADE;


--
-- TOC entry 5256 (class 2606 OID 20560)
-- Name: map_layer_member_access map_layer_member_access_layer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_layer_member_access
    ADD CONSTRAINT map_layer_member_access_layer_id_fkey FOREIGN KEY (layer_id) REFERENCES public.map_layers(id) ON DELETE CASCADE;


--
-- TOC entry 5257 (class 2606 OID 20555)
-- Name: map_layer_member_access map_layer_member_access_mem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_layer_member_access
    ADD CONSTRAINT map_layer_member_access_mem_id_fkey FOREIGN KEY (mem_id) REFERENCES public.sys_member(mem_id) ON DELETE CASCADE;


--
-- TOC entry 5252 (class 2606 OID 40418)
-- Name: map_layers map_layers_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_layers
    ADD CONSTRAINT map_layers_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.map_layers(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 5253 (class 2606 OID 40403)
-- Name: map_layers map_layers_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_layers
    ADD CONSTRAINT map_layers_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.map_sources(id) ON DELETE CASCADE;


--
-- TOC entry 5258 (class 2606 OID 40398)
-- Name: map_sources map_sources_apikey_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_sources
    ADD CONSTRAINT map_sources_apikey_id_fkey FOREIGN KEY (apikey_id) REFERENCES public.mapbox_apikeys(id) ON DELETE CASCADE;


--
-- TOC entry 5241 (class 2606 OID 20465)
-- Name: monitoring_data monitoring_data_tskt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitoring_data
    ADD CONSTRAINT monitoring_data_tskt_id_fkey FOREIGN KEY (tskt_id) REFERENCES public.iw_thongsoquantrac(tskt_id);


--
-- TOC entry 5239 (class 2606 OID 20455)
-- Name: monitoring_stations monitoring_stations_commune_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitoring_stations
    ADD CONSTRAINT monitoring_stations_commune_id_fkey FOREIGN KEY (commune_id) REFERENCES public.bgmap_commune(gid) ON DELETE CASCADE;


--
-- TOC entry 5248 (class 2606 OID 20495)
-- Name: sys_danhmuc sys_danhmuc_dm_ldm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_danhmuc
    ADD CONSTRAINT sys_danhmuc_dm_ldm_id_fkey FOREIGN KEY (dm_ldm_id) REFERENCES public.sys_danhmuc_phanloai(ldm_id) ON DELETE CASCADE;


--
-- TOC entry 5244 (class 2606 OID 20480)
-- Name: sys_member sys_member_mem_cq_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_member
    ADD CONSTRAINT sys_member_mem_cq_id_fkey FOREIGN KEY (mem_cq_id) REFERENCES public.sys_coquan(cq_id) ON DELETE CASCADE;


--
-- TOC entry 5242 (class 2606 OID 20470)
-- Name: sys_role_coquan sys_role_coquan_cq_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_role_coquan
    ADD CONSTRAINT sys_role_coquan_cq_id_fkey FOREIGN KEY (cq_id) REFERENCES public.sys_coquan(cq_id) ON DELETE CASCADE;


--
-- TOC entry 5243 (class 2606 OID 40313)
-- Name: sys_role_coquan sys_role_coquan_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_role_coquan
    ADD CONSTRAINT sys_role_coquan_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.sys_role(role_id) ON DELETE CASCADE;


--
-- TOC entry 5245 (class 2606 OID 20485)
-- Name: sys_role_member sys_role_member_mem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_role_member
    ADD CONSTRAINT sys_role_member_mem_id_fkey FOREIGN KEY (mem_id) REFERENCES public.sys_member(mem_id) ON DELETE CASCADE;


--
-- TOC entry 5246 (class 2606 OID 40325)
-- Name: sys_role_member sys_role_member_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_role_member
    ADD CONSTRAINT sys_role_member_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.sys_role(role_id) ON DELETE CASCADE;


--
-- TOC entry 5249 (class 2606 OID 20505)
-- Name: weather_stations_report weather_stations_report_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather_stations_report
    ADD CONSTRAINT weather_stations_report_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.sys_member(mem_id) ON DELETE CASCADE;


--
-- TOC entry 5250 (class 2606 OID 20520)
-- Name: weather_stations_report_list weather_stations_report_list_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather_stations_report_list
    ADD CONSTRAINT weather_stations_report_list_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.monitoring_stations(station_id) ON DELETE CASCADE;


--
-- TOC entry 5251 (class 2606 OID 20525)
-- Name: weather_stations_report_list weather_stations_report_list_weather_stations_report_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather_stations_report_list
    ADD CONSTRAINT weather_stations_report_list_weather_stations_report_id_fkey FOREIGN KEY (weather_stations_report_id) REFERENCES public.weather_stations_report(id) ON DELETE CASCADE;


-- Completed on 2025-06-26 21:50:35

--
-- PostgreSQL database dump complete
--

