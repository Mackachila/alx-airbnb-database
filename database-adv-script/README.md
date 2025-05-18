1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
2. Explanation

3. This query joins the Booking table with the User table using an INNER JOIN, ensuring only bookings that are linked to existing users are shown.

4. 2. LEFT JOIN: Retrieve all properties and their reviews, including properties with no reviews
   3. Explanation
   4. The LEFT JOIN ensures all properties are shown, even those without reviews. If a property has no review, review_id, rating, and comment will be NULL.
  
   5. 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
     
      4. Explanation
     
      5. This UNION of LEFT JOIN and RIGHT JOIN mimics a FULL OUTER JOIN, giving:

All users (with or without bookings),

All bookings (with or without a linked user).


Subqueries

Non-Correlated Subquery

Explanation:

The subquery calculates the average rating per property.

The outer query filters properties where property_id appears in the list of those with an average rating > 4.0.

This is non-correlated because the subquery runs independently of the outer query.

Correlated Subquery

Explanation:

The subquery counts bookings per user by referencing the outer query (u.user_id).

Only users with more than 3 bookings are returned.

This is a correlated subquery because it depends on the outer query for each row.


Total Number of Bookings Per User (Using COUNT + GROUP BY)

Explanation:

This counts all bookings per user.

LEFT JOIN ensures even users with zero bookings are included.

 Rank Properties by Total Bookings (Using RANK window function)

Explanation:

Uses RANK() to rank properties based on booking counts.

LEFT JOIN ensures properties with zero bookings are considered.

GROUP BY aggregates bookings per property.


