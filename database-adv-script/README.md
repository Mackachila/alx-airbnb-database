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
