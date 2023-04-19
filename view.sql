CREATE OR REPLACE VIEW  productsView AS
SELECT products.* , categories.* FROM products 
INNER JOIN  categories on  products.product_category_id = categories.category_id ; 


SELECT productsView.* , 1 as favorite FROM productsView 
INNER JOIN favorite ON favorite.favorite_product_id = productsView.product_id AND favorite.favorite_user_id =15
WHERE category_id =4
UNION ALL
SELECT * , 0 as favorite FROM productsView
WHERE  category_id =4 AND product_id NOT IN ( SELECT productsView.product_id FROM productsView
INNER JOIN favorite ON favorite.favorite_product_id = productsView.product_id AND favorite.favorite_user_id = 15)


CREATE OR REPLACE VIEW myFavourites AS
SELECT favorite.* , products.* , users.user_id FROM favorite 
INNER JOIN users ON users.user_id  = favorite.favorite_user_id
INNER JOIN products ON products.product_id  = favorite.favorite_product_id



CREATE OR REPLACE VIEW cartView AS
SELECT SUM(products.product_price - products.product_price * products.product_discount / 100) as priceItems , COUNT(cart_product_id) as countItems, cart.* , products.* FROM cart
INNER JOIN products ON products.product_id = cart.cart_product_id
WHERE cart_order = 0
GROUP BY cart.cart_product_id , cart.cart_user_id


-- SELECT SUM(priceItems) as totalPrice , SUM(countItems) as totalCount FROM cartView
-- WHERE cartView.cart_user_id = $user_id
-- GROUP BY cartView.cart_user_id