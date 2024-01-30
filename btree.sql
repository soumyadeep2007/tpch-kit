DROP INDEX lineitem_l_shipdate_idx;
DROP INDEX lineitem_l_receiptdate_idx;
DROP INDEX orders_o_orderdate_idx;
DROP INDEX part_p_size_idx;



CREATE INDEX lineitem_l_shipdate_idx ON lineitem (l_shipdate) WITH (fillfactor = 100);
CREATE INDEX lineitem_l_receiptdate_idx ON lineitem (l_receiptdate) WITH (fillfactor = 100);
CREATE INDEX orders_o_orderdate_idx ON orders(o_orderdate) WITH (fillfactor = 100);
CREATE INDEX part_p_size_idx ON part (p_size) WITH (fillfactor = 100);
