CREATE TABLE IF NOT EXISTS "customer" (
	"id" serial NOT NULL UNIQUE,
	"first_name" varchar(50) NOT NULL DEFAULT 'NOT NULL',
	"last_name" varchar(50) NOT NULL DEFAULT 'NOT NULL',
	"email" varchar(100) UNIQUE,
	"phone" varchar(20),
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "category" (
	"id" serial NOT NULL UNIQUE,
	"name" varchar(50) NOT NULL UNIQUE DEFAULT 'NOT NULL',
	"description" varchar(255),
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "product" (
	"id" serial NOT NULL UNIQUE,
	"name" varchar(100) NOT NULL DEFAULT 'NOT NULL',
	"description" varchar(255),
	"category_id" bigint NOT NULL,
	"unit_price" numeric(10,2) NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "order_status" (
	"id" serial NOT NULL UNIQUE,
	"status_name" varchar(50) NOT NULL UNIQUE DEFAULT 'NOT NULL',
	"description" varchar(255),
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "orders" (
	"id" serial NOT NULL UNIQUE,
	"customer_id" bigint NOT NULL,
	"status_id" bigint NOT NULL,
	"order_date" timestamp with time zone NOT NULL DEFAULT NOW(),
	"total_amount" numeric(10,2) NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "order_item" (
	"id" serial NOT NULL UNIQUE,
	"order_id" bigint NOT NULL,
	"product_id" bigint NOT NULL,
	"quantity" bigint NOT NULL,
	"price" numeric(10,2) NOT NULL,
	PRIMARY KEY ("id")
);



ALTER TABLE "product" ADD CONSTRAINT "product_fk3" FOREIGN KEY ("category_id") REFERENCES "category"("id");

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk1" FOREIGN KEY ("customer_id") REFERENCES "customer"("id");

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk2" FOREIGN KEY ("status_id") REFERENCES "order_status"("id");
ALTER TABLE "order_item" ADD CONSTRAINT "order_item_fk1" FOREIGN KEY ("order_id") REFERENCES "orders"("id");

ALTER TABLE "order_item" ADD CONSTRAINT "order_item_fk2" FOREIGN KEY ("product_id") REFERENCES "product"("id");