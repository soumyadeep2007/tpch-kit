-- Clustering lineitem by l_shipdate, l_commitdate
begin;
create table lineitem_sorted (like lineitem);
insert into lineitem_sorted select * from lineitem order by l_shipdate, l_commitdate;
commit;
drop table lineitem;
alter table lineitem_sorted rename to lineitem;

-- Clustering orders by o_orderdate:
begin;
create table orders_sorted (like orders);
insert into orders_sorted select * from orders order by o_orderdate;
commit;
drop table orders;
alter table orders_sorted rename to orders;

-- Clustering part by p_size:
begin;
create table part_sorted (like part);
insert into part_sorted select * from part order by p_size;
commit;
drop table part;
alter table part_sorted rename to part;

-- Index creation follows:
CREATE INDEX customer_c_mktsegment_c_custkey_idx ON customer (c_mktsegment, c_custkey) WITH (fillfactor = 100);
CREATE INDEX customer_c_nationkey_c_custkey_idx ON customer (c_nationkey, c_custkey) WITH (fillfactor = 100);
CREATE INDEX customer_ios_test1 ON customer (substring(c_phone from 1 for 2), c_acctbal, c_custkey) WITH (fillfactor = 100);
CREATE UNIQUE INDEX pk_customer ON customer (c_custkey) WITH (fillfactor = 100);
CREATE INDEX lineitem_l_orderkey_l_suppkey_l_quantity_idx ON lineitem (l_orderkey, l_suppkey, l_quantity) WITH (fillfactor = 100);
CREATE INDEX lineitem_l_orderkey_idx_l_returnflag ON lineitem (l_orderkey) WITH (fillfactor = 100) WHERE l_returnflag = 'R';
CREATE INDEX lineitem_l_orderkey_idx_part1 ON lineitem (l_orderkey, l_suppkey) WITH (fillfactor = 100) WHERE l_commitdate < l_receiptdate; -- Q4,Q21
CREATE INDEX lineitem_l_orderkey_idx_part2 ON lineitem (l_orderkey) WITH (fillfactor = 100) WHERE l_commitdate < l_receiptdate AND l_shipdate < l_commitdate;
CREATE INDEX lineitem_l_partkey_l_quantity_l_shipmode_idx ON lineitem (l_partkey, l_quantity, l_shipmode) WITH (fillfactor = 100);
CREATE INDEX lineitem_l_partkey_l_suppkey_l_shipdate_l_quantity_idx ON lineitem (l_partkey, l_suppkey, l_shipdate, l_quantity) WITH (fillfactor = 100);
CREATE INDEX lineitem_l_shipdate_idx ON lineitem (l_shipdate) WITH (fillfactor = 100);
CREATE INDEX lineitem_l_receiptdate_idx ON lineitem (l_receiptdate) WITH (fillfactor = 100);
CREATE UNIQUE INDEX pk_lineitem ON lineitem (l_orderkey, l_linenumber) WITH (fillfactor = 100);
CREATE UNIQUE INDEX pk_nation ON nation (n_nationkey) WITH (fillfactor = 100);
CREATE INDEX orders_o_custkey_idx ON orders (o_custkey) WITH (fillfactor = 100);
CREATE INDEX orders_o_orderkey_o_orderdate_idx ON orders (o_orderkey, o_orderdate) WITH (fillfactor = 100);
CREATE INDEX orders_o_orderdate_idx ON orders(o_orderdate) WITH (fillfactor = 100);
CREATE UNIQUE INDEX pk_orders ON orders (o_orderkey) WITH (fillfactor = 100);
CREATE INDEX part_ios_test1 ON part USING btree (p_size, p_partkey, p_brand, p_type) WITH (fillfactor = 100);
CREATE INDEX part_p_container_p_brand_p_partkey_idx ON part(p_container, p_brand, p_partkey) WITH (fillfactor = 100);
CREATE INDEX part_p_size_idx ON part (p_size) WITH (fillfactor = 100);
CREATE INDEX part_p_type_p_partkey_idx ON part(p_type, p_partkey) WITH (fillfactor = 100);
CREATE UNIQUE INDEX pk_part ON part (p_partkey) WITH (fillfactor = 100);
CREATE INDEX partsupp_ps_suppkey_idx ON partsupp (ps_suppkey) WITH (fillfactor = 100);
CREATE UNIQUE INDEX pk_partsupp ON partsupp (ps_partkey, ps_suppkey) WITH (fillfactor = 100);
CREATE UNIQUE INDEX pk_region ON region (r_regionkey) WITH (fillfactor = 100);
CREATE UNIQUE INDEX pk_supplier ON supplier (s_suppkey) WITH (fillfactor = 100);
CREATE INDEX supplier_s_nationkey_s_suppkey_idx ON supplier (s_nationkey, s_suppkey) WITH (fillfactor = 100);
CREATE INDEX supplier_s_suppkey_idx_like ON supplier (s_suppkey) WITH (fillfactor = 100) WHERE s_comment LIKE '%Customer%Complaints%';
