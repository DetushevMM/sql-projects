# Online Store Database (PostgreSQL)
	
## Описание проекта

База данных имитирует интернет-магазин.  
Цель проекта: показать навыки работы с PostgreSQL, проектирования схем БД, написания SQL-запросов и наполнения тестовыми данными.

**Функции проекта:**
- Хранение информации о клиентах, товарах, заказах и их статусах
- Связь таблиц через внешние ключи
- Возможность выполнять аналитические запросы (JOIN, GROUP BY, агрегаты.

---

## Таблицы и связи

| Таблица       | Основные поля                                           | Связи                           |
|---------------|--------------------------------------------------------|---------------------------------|
| customer      | id, first_name, last_name, email, phone, registration_date | 1:M → orders                    |
| order_status  | id, status_name, description                            | 1:M → orders                    |
| orders        | id, customer_id, status_id, order_date, total_amount    | M:1 → customer, order_status; 1:M → order_item |
| category      | id, name, description                                   | 1:M → product                   |
| product       | id, name, description, category_id, price              | M:1 → category; 1:M → order_item |
| order_item    | id, order_id, product_id, quantity, price             | M:1 → orders, M:1 → product    |

Типы связей:

category (1) ────< product

product (1) ────< order_item

orders (1) ────< order_item

customer (1) ────< orders

order_status (1) ────< orders

---
	
## Структура проекта
	
online-store-database/

## SQL файлы
	
### schema.sql
Создаёт все таблицы, устанавливает первичные и внешние ключи, ограничения.

### seed.sql
Наполняет таблицы тестовыми данными.

### queries.sql
Примеры запросов:

- Список всех заказов с клиентами и статусом
- Подробности заказов с товарами
- Суммарные продажи по клиентам
- Суммарные продажи по категориям
- Топ 3 самых дорогих товаров в заказах
- Заказы, которые ещё не доставлены

Полная структура базы данных

Тестовые данные для проверки запросов
	
Примеры сложных SQL-запросов:
- ER-диаграмма для визуального представления

