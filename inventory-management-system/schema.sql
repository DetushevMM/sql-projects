CREATE TABLE IF NOT EXISTS "supplier" (
	"id" serial NOT NULL UNIQUE,
	"name" varchar(100) NOT NULL DEFAULT 'NOT NULL',
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

 CREATE TABLE IF NOT EXISTS "stock_movement" (
 	"id" serial NOT NULL UNIQUE,
	"product_id" bigint NOT NULL,
	"supplier_id" bigint NOT NULL,
	"movement_type" varchar(10) NOT NULL CHECK (movement_type IN ('IN', 'OUT')),
 	"quantity" bigint NOT NULL,
	"movement_date" timestamp with time zone NOT NULL DEFAULT NOW(),
 	PRIMARY KEY ("id")
 )


ALTER TABLE "product" ADD CONSTRAINT "product_fk3" FOREIGN KEY ("category_id") REFERENCES "category"("id");
ALTER TABLE "stock_movement" ADD CONSTRAINT "stock_movement_fk1" FOREIGN KEY ("product_id") REFERENCES "product"("id");

ALTER TABLE "stock_movement" ADD CONSTRAINT "stock_movement_fk2" FOREIGN KEY ("supplier_id") REFERENCES "supplier"("id");