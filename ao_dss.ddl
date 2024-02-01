SET default_table_access_method=ao_row;
SET gp_default_storage_options='compresstype=zlib, compresslevel=1';

CREATE TABLE customer (
    c_custkey integer,
    c_name character varying(25),
    c_address character varying(40),
    c_nationkey integer,
    c_phone character(15),
    c_acctbal numeric(15,2),
    c_mktsegment character(10),
    c_comment character varying(117)
) DISTRIBUTED BY (c_custkey);


--
-- TOC entry 405 (class 1259 OID 18344)
-- Name: lineitem; Type: TABLE; Schema: tpch; Owner: -
--

CREATE TABLE lineitem (
    l_orderkey bigint,
    l_partkey integer,
    l_suppkey integer,
    l_linenumber integer,
    l_quantity numeric(15,2),
    l_extendedprice numeric(15,2),
    l_discount numeric(15,2),
    l_tax numeric(15,2),
    l_returnflag character(1),
    l_linestatus character(1),
    l_shipdate date,
    l_commitdate date,
    l_receiptdate date,
    l_shipinstruct character(25),
    l_shipmode character(10),
    l_comment character varying(44)
) DISTRIBUTED BY (l_orderkey, l_linenumber);


--
-- TOC entry 393 (class 1259 OID 17211)
-- Name: nation; Type: TABLE; Schema: tpch; Owner: -
--

CREATE TABLE nation (
    n_nationkey integer,
    n_name character(25),
    n_regionkey integer,
    n_comment character varying(152)
) DISTRIBUTED BY (n_nationkey);


--
-- TOC entry 406 (class 1259 OID 18347)
-- Name: orders; Type: TABLE; Schema: tpch; Owner: -
--

CREATE TABLE orders (
    o_orderkey bigint,
    o_custkey integer,
    o_orderstatus character(1),
    o_totalprice numeric(15,2),
    o_orderdate date,
    o_orderpriority character(15),
    o_clerk character(15),
    o_shippriority integer,
    o_comment character varying(79)
) DISTRIBUTED BY (o_orderkey);


--
-- TOC entry 407 (class 1259 OID 18350)
-- Name: part; Type: TABLE; Schema: tpch; Owner: -
--

CREATE TABLE part (
    p_partkey integer,
    p_name character varying(55),
    p_mfgr character(25),
    p_brand character(10),
    p_type character varying(25),
    p_size integer,
    p_container character(10),
    p_retailprice numeric(15,2),
    p_comment character varying(23)
) DISTRIBUTED BY (p_partkey);


--
-- TOC entry 394 (class 1259 OID 17481)
-- Name: partsupp; Type: TABLE; Schema: tpch; Owner: -
--

CREATE TABLE partsupp (
    ps_partkey integer,
    ps_suppkey integer,
    ps_availqty integer,
    ps_supplycost numeric(15,2),
    ps_comment character varying(199)
) DISTRIBUTED BY (ps_partkey, ps_suppkey);


--
-- TOC entry 395 (class 1259 OID 17484)
-- Name: region; Type: TABLE; Schema: tpch; Owner: -
--

CREATE TABLE region (
    r_regionkey integer,
    r_name character(25),
    r_comment character varying(152)
) DISTRIBUTED BY (r_regionkey);


--
-- TOC entry 396 (class 1259 OID 17487)
-- Name: supplier; Type: TABLE; Schema: tpch; Owner: -
--

CREATE TABLE supplier (
    s_suppkey integer,
    s_name character(25),
    s_address character varying(40),
    s_nationkey integer,
    s_phone character(15),
    s_acctbal numeric(15,2),
    s_comment character varying(101)
) DISTRIBUTED BY (s_suppkey);