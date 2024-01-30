DROP INDEX lineitem_l_shipdate_idx;
DROP INDEX lineitem_l_receiptdate_idx;
DROP INDEX orders_o_orderdate_idx;
DROP INDEX part_p_size_idx;



CREATE INDEX lineitem_l_shipdate_idx ON lineitem USING BRIN (l_shipdate) WITH (pages_per_range=1024);
CREATE INDEX lineitem_l_receiptdate_idx ON lineitem USING BRIN (l_receiptdate) WITH (pages_per_range=1024);
CREATE INDEX orders_o_orderdate_idx ON orders USING BRIN (o_orderdate) WITH (pages_per_range=1024);
CREATE INDEX part_p_size_idx ON part USING BRIN (p_size) WITH (pages_per_range=1024);