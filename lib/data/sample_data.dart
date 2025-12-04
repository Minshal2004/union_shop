import 'package:union_shop/models/collection.dart';
import 'package:union_shop/models/product.dart';

// Example clothing images (hardcoded for static demo)
const hoodieImage = 'https://shop.upsu.net/media/catalog/product/h/o/hoodie_charcoal.jpg';
const tshirtImage = 'https://shop.upsu.net/media/catalog/product/t/s/tshirt_white.jpg';
const trousersImage = 'https://shop.upsu.net/media/catalog/product/t/r/trousers_grey.jpg';

/// Hardcoded sample data for development and testing.
final sampleCollections = [
  Collection(
    id: 'c1',
    title: 'Hoodies',
    category: 'Clothing',
    imageUrl: hoodieImage,
    description: 'Official union hoodies and warm layers.',
    products: [
      Product(
        id: 'p1',
        name: 'Union Hoodie - Charcoal',
        price: '£35.00',
        imageUrl: hoodieImage,
        description: 'Comfortable fleece-lined hoodie with embroidered logo.',
      ),
      Product(
        id: 'p2',
        name: 'Union Hoodie - Navy',
        price: '£35.00',
        imageUrl: hoodieImage,
        description: 'Navy pullover hoodie, classic fit.',
      ),
    ],
  ),
  Collection(
    id: 'c2',
    title: 'T-Shirts',
    category: 'Clothing',
    imageUrl: tshirtImage,
    description: 'Casual tees and branded T-shirts.',
    products: [
      Product(
        id: 'p3',
        name: 'Union T-Shirt - White',
        price: '£12.00',
        imageUrl: tshirtImage,
        description: 'Soft cotton tee with printed logo.',
      ),
      Product(
        id: 'p4',
        name: 'Union T-Shirt - Black',
        price: '£12.00',
        imageUrl: tshirtImage,
        description: 'Black crew neck tee, unisex.',
      ),
    ],
  ),
  Collection(
    id: 'c3',
    title: 'Trousers',
    category: 'Clothing',
    imageUrl: trousersImage,
    description: 'Comfortable trousers and joggers.',
    products: [
      Product(
        id: 'p5',
        name: 'Union Joggers - Grey',
        price: '£25.00',
        imageUrl: trousersImage,
        description: 'Relaxed joggers with elastic cuff.',
      ),
      Product(
        id: 'p6',
        name: 'Union Chinos - Khaki',
        price: '£30.00',
        imageUrl: trousersImage,
        description: 'Smart-casual chinos, slim fit.',
      ),
    ],
  ),
  Collection(
    id: 'c4',
    title: 'Accessories',
    category: 'Accessories',
    imageUrl: tshirtImage,
    description: 'Caps, bags and small accessories.',
    products: [
      Product(
        id: 'p7',
        name: 'Union Cap',
        price: '£10.00',
        imageUrl: tshirtImage,
        description: 'Adjustable cap with embroidered logo.',
      ),
      Product(
        id: 'p8',
        name: 'Union Tote Bag',
        price: '£8.00',
        imageUrl: tshirtImage,
        description: 'Canvas tote bag for everyday use.',
      ),
    ],
  ),
  Collection(
    id: 'c5',
    title: 'Gifts',
    category: 'Gifts',
    imageUrl: hoodieImage,
    description: 'Souvenirs and gift items.',
    products: [
      Product(
        id: 'p9',
        name: 'Union Mug',
        price: '£6.00',
        imageUrl: hoodieImage,
        description: 'Ceramic mug with logo print.',
      ),
      Product(
        id: 'p10',
        name: 'Union Keyring',
        price: '£4.00',
        imageUrl: hoodieImage,
        description: 'Metal keyring with Union emblem.',
      ),
    ],
  ),
  Collection(
    id: 'c6',
    title: 'Campus Essentials',
    category: 'Clothing',
    imageUrl: tshirtImage,
    description: 'Stationery and everyday essentials (styled with clothing images).',
    products: [
      Product(
        id: 'p11',
        name: 'Union Notebook',
        price: '£3.00',
        imageUrl: tshirtImage,
        description: 'A5 notebook for lectures and notes.',
      ),
      Product(
        id: 'p12',
        name: 'Union Pen',
        price: '£1.50',
        imageUrl: tshirtImage,
        description: 'Ballpoint pen with logo branding.',
      ),
    ],
  ),
];
