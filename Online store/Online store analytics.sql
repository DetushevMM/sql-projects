CREATE TABLE IF NOT EXISTS "orders" (
	"id" serial NOT NULL,
	"customer_id" bigint NOT NULL,
	"status_id" smallint NOT NULL DEFAULT '1',
	"order_date" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updated_at" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"total_amount" numeric(12, 2) NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "order_status" (
	"id" serial NOT NULL,
	"status_name" varchar(50) NOT NULL UNIQUE,
	"description" varchar(255),
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "сustomer" (
	"id" serial NOT NULL UNIQUE,
	"first_name" varchar(100) NOT NULL,
	"last_name" varchar(100) NOT NULL,
	"email" varchar(255) NOT NULL UNIQUE,
	"phone" varchar(20),
	"registration_date" date NOT NULL,
	"created_at" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "category" (
	"id" serial NOT NULL,
	"name" varchar(100) NOT NULL UNIQUE,
	"description" varchar(255),
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "product" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"description" varchar(255),
	"category_id" smallint NOT NULL,
	"price" numeric(12, 2) NOT NULL,
	"created_at" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"update_at" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "order_item" (
	"id" serial NOT NULL UNIQUE,
	"order_id" bigint NOT NULL,
	"product_id" bigint NOT NULL,
	"quantity" bigint NOT NULL,
	"price" numeric(12, 2) NOT NULL,
	PRIMARY KEY ("id")
);

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk1" FOREIGN KEY ("customer_id") REFERENCES "сustomer"("id");

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk2" FOREIGN KEY ("status_id") REFERENCES "order_status"("id");



ALTER TABLE "product" ADD CONSTRAINT "product_fk3" FOREIGN KEY ("category_id") REFERENCES "category"("id");
ALTER TABLE "order_item" ADD CONSTRAINT "order_item_fk1" FOREIGN KEY ("order_id") REFERENCES "orders"("id");

ALTER TABLE "order_item" ADD CONSTRAINT "order_item_fk2" FOREIGN KEY ("product_id") REFERENCES "product"("id");