  use ecommerce;
  
  CREATE TABLE brand (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  description TEXT
);

CREATE TABLE product_category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE product (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  brand_id INT,
  category_id INT,
  base_price DECIMAL(10,2),
  description TEXT,
  FOREIGN KEY (brand_id) REFERENCES brand(id),
  FOREIGN KEY (category_id) REFERENCES product_category(id)
);

CREATE TABLE product_image (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  image_url VARCHAR(255),
  FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE color (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  hex_code VARCHAR(7)
);

CREATE TABLE size_category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE size_option (
  id INT AUTO_INCREMENT PRIMARY KEY,
  size VARCHAR(20),
  size_category_id INT,
  FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

CREATE TABLE product_variation (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  color_id INT,
  size_id INT,
  stock_quantity INT,
  sku VARCHAR(100),
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (color_id) REFERENCES color(id),
  FOREIGN KEY (size_id) REFERENCES size_option(id)
);

CREATE TABLE product_item (
  id INT AUTO_INCREMENT PRIMARY KEY,
  variation_id INT,
  price DECIMAL(10,2),
  FOREIGN KEY (variation_id) REFERENCES product_variation(id)
);

CREATE TABLE attribute_category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE attribute_type (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) -- text, number, boolean
);

CREATE TABLE product_attribute (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  category_id INT,
  type_id INT,
  name VARCHAR(100),
  value VARCHAR(255),
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (category_id) REFERENCES attribute_category(id),
  FOREIGN KEY (type_id) REFERENCES attribute_type(id)
);

-- Brands
INSERT INTO brand (name, description) VALUES 
('Nike', 'Popular sportswear brand'),
('Adidas', 'Another global leader in sportswear');

-- Categories
INSERT INTO product_category (name) VALUES 
('Shoes'), 
('T-Shirts');

-- Products
INSERT INTO product (name, brand_id, category_id, base_price, description) VALUES 
('Air Max 90', 1, 1, 120.00, 'Nike Air Max 90 Running Shoes'),
('Ultraboost Tee', 2, 2, 45.00, 'Adidas Ultraboost Performance Tee');

-- Product Images
INSERT INTO product_image (product_id, image_url) VALUES 
(1, './images/nike air max.jpeg'),
(2, './images/adidas ultraboost.jpeg');

-- Colors
INSERT INTO color (name, hex_code) VALUES 
('Black', '#000000'),
('White', '#FFFFFF'),
('Red', '#FF0000');

-- Size Categories
INSERT INTO size_category (name) VALUES 
('Shoe Sizes'), 
('Shirt Sizes');

-- Size Options
INSERT INTO size_option (size, size_category_id) VALUES 
('8', 1), 
('9', 1), 
('M', 2), 
('L', 2);

-- Product Variations
INSERT INTO product_variation (product_id, color_id, size_id, stock_quantity, sku) VALUES 
(1, 1, 1, 10, 'NIKE-AM90-BLK-8'),  -- Black Air Max 90 Size 8
(1, 1, 2, 5, 'NIKE-AM90-BLK-9'),   -- Black Air Max 90 Size 9
(2, 2, 3, 8, 'ADIDAS-TEE-WHT-M'), -- White Ultraboost Tee Size M
(2, 3, 4, 4, 'ADIDAS-TEE-RED-L'); -- Red Ultraboost Tee Size L

-- Product Items
INSERT INTO product_item (variation_id, price) VALUES 
(1, 125.00), 
(2, 125.00), 
(3, 47.00), 
(4, 47.00);

-- Attribute Categories
INSERT INTO attribute_category (name) VALUES 
('Physical'), 
('Material');

-- Attribute Types
INSERT INTO attribute_type (name) VALUES 
('text'), 
('number');

-- Product Attributes
INSERT INTO product_attribute (product_id, category_id, type_id, name, value) VALUES 
(1, 1, 2, 'Weight', '0.9'), 
(1, 2, 1, 'Material', 'Mesh & Rubber'), 
(2, 2, 1, 'Material', 'Polyester');

