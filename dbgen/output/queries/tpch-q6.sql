-- TPC TPC-H Parameter Substitution (Version 2.17.3 build 0)
-- using 1692737934 as a seed to the RNG
-- $ID$
-- TPC-H/TPC-R Forecasting Revenue Change Query (Q6)
-- Functional Query Definition
-- Approved February 1998

explain
select
	sum(l_extendedprice * l_discount) as revenue
from
	lineitem
where
	l_shipdate >= date '1995-01-01'
	and l_shipdate < date '1995-01-01' + interval '1' year
	and l_discount between 0.04 - 0.01 and 0.04 + 0.01
	and l_quantity < 25;
