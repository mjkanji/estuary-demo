CREATE USER flow_capture WITH PASSWORD 'secret' REPLICATION;

GRANT pg_read_all_data TO flow_capture;

CREATE TABLE "public"."orders" (
  "id" int PRIMARY KEY,
  "user_id" varchar,
  "amount" int,
  "delivered" boolean,
  "created_at" timestamp DEFAULT (now())
);


CREATE TABLE IF NOT EXISTS public.flow_watermarks (slot TEXT PRIMARY KEY, watermark TEXT);
GRANT ALL PRIVILEGES ON TABLE public.flow_watermarks TO flow_capture;
CREATE PUBLICATION flow_publication;
ALTER PUBLICATION flow_publication SET (publish_via_partition_root = true);
ALTER PUBLICATION flow_publication ADD TABLE public.flow_watermarks, public.orders;
