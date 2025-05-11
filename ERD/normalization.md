# Database Normalization Report

## Objective
Apply normalization principles to ensure the database is in **Third Normal Form (3NF)** to reduce redundancy, maintain data integrity, and optimize query performance.

---

## Step-by-Step Normalization

### 1️⃣ First Normal Form (1NF)
A relation is in 1NF if:
- All columns contain only **atomic (indivisible) values**.
- Each record is **unique** (has a primary key).
- No repeating groups or arrays.

✅ **All tables meet 1NF**:
- Each table has a primary key.
- All attributes are atomic (e.g., `phone_number`, `location`, `email`).
- No multivalued fields or repeating groups.

---

### 2️⃣ Second Normal Form (2NF)
A relation is in 2NF if:
- It is in 1NF.
- **All non-key attributes are fully functionally dependent on the entire primary key** (applies to composite keys).

✅ All tables use **single-column primary keys**, so 2NF is satisfied:
- For example, `booking_id` is the PK in `Booking`; all attributes depend only on `booking_id`.

---

### 3️⃣ Third Normal Form (3NF)
A relation is in 3NF if:
- It is in 2NF.
- **There are no transitive dependencies**, i.e., non-key attributes do not depend on other non-key attributes.

### ✅ 3NF Review of Each Table:

#### 🔹 `User`
- No derived or dependent values (e.g., full name is not stored).
- No transitive dependencies.

✅ In 3NF

---

#### 🔹 `Property`
- `location` is atomic; not broken into city/state/etc., but that's acceptable depending on application scope.
- `host_id` correctly refers to the `User` table.

✅ In 3NF

---

#### 🔹 `Booking`
- `total_price` is a derived attribute (`pricepernight × nights`), which could be computed on-the-fly.
  - However, storing it can be justified for performance and historical accuracy.
  - If strict 3NF is needed, consider removing it and computing via JOINs.
  
⚠️ Optional normalization: remove `total_price` and compute from `Property.pricepernight`.

✅ Acceptable in 3NF if justified for business needs.

---

#### 🔹 `Payment`
- No transitive dependencies.
- Each payment is directly tied to a `booking_id`.

✅ In 3NF

---

#### 🔹 `Review`
- Each review belongs to a user and property.
- No dependency between `rating` and `comment`.

✅ In 3NF

---

#### 🔹 `Message`
- `sender_id` and `recipient_id` refer to users.
- `message_body` is atomic.

✅ In 3NF

---

## Summary of Improvements (if needed)

| Table       | Issue (if any)             | Action Suggested                    |
|-------------|----------------------------|-------------------------------------|
| Booking     | `total_price` is derived   | Keep for performance or normalize   |
| Property    | `location` could be split  | Optional: Split into `city`, `state`, etc. |

---

