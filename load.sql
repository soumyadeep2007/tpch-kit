COPY customer FROM '/home/pivotal/workspace/tpch-kit/dbgen/output/customer.tbl' CSV DELIMITER '|';
COPY lineitem FROM '/home/pivotal/workspace/tpch-kit/dbgen/output/lineitem.tbl' CSV  DELIMITER '|';
COPY nation FROM '/home/pivotal/workspace/tpch-kit/dbgen/output/nation.tbl' CSV  DELIMITER '|';
COPY orders FROM '/home/pivotal/workspace/tpch-kit/dbgen/output/orders.tbl' CSV  DELIMITER '|';
COPY partsupp FROM '/home/pivotal/workspace/tpch-kit/dbgen/output/partsupp.tbl' CSV  DELIMITER '|';
COPY part FROM '/home/pivotal/workspace/tpch-kit/dbgen/output/part.tbl' CSV  DELIMITER '|';
COPY region FROM '/home/pivotal/workspace/tpch-kit/dbgen/output/region.tbl' CSV  DELIMITER '|';
COPY supplier FROM '/home/pivotal/workspace/tpch-kit/dbgen/output/supplier.tbl' CSV  DELIMITER '|';