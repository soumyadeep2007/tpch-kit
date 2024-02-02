SET default_table_access_method=ao_row;
SET gp_default_storage_options='compresstype=zlib, compresslevel=1';

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
