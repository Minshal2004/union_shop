// ...new file...
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/models/product.dart';

final List<Collection> sampleCollections = [
  Collection(
    id: 'c1',
    title: 'Campus Clothing',
    imageUrl: 'https://via.placeholder.com/800x400?text=Campus+Clothing',
    products: [
      Product(
        id: 'p1',
        name: 'Union Hoodie',
        price: '£25.00',
        imageUrl: 'https://via.placeholder.com/600x400?text=Union+Hoodie',
        description:
            'Comfortable cotton hoodie with embroidered union logo. Available in multiple sizes.',
      ),
      Product(
        id: 'p2',
        name: 'Union T-Shirt',
        price: '£12.00',
        imageUrl: 'https://via.placeholder.com/600x400?text=Union+T-Shirt',
        description: 'Soft jersey t-shirt printed with the union crest.',
      ),
    ],
  ),
  Collection(
    id: 'c2',
    title: 'Stationery',
    imageUrl: 'https://via.placeholder.com/800x400?text=Stationery',
    products: [
      Product(
        id: 'p3',
        name: 'Campus Notebook',
        price: '£4.50',
        imageUrl: 'https://via.placeholder.com/600x400?text=Notebook',
        description:
            'A5 notebook with 80 lined pages, perfect for lectures and notes.',
      ),
      Product(
        id: 'p4',
        name: 'Union Pen Pack',
        price: '£2.00',
        imageUrl: 'https://via.placeholder.com/600x400?text=Pen+Pack',
        description:
            'Set of 3 gel pens with smooth ink flow and ergonomic grip.',
      ),
    ],
  ),
  Collection(
    id: 'c3',
    title: 'Accessories',
    imageUrl: 'https://via.placeholder.com/800x400?text=Accessories',
    products: [
      Product(
        id: 'p5',
        name: 'Union Tote Bag',
        price: '£7.00',
        imageUrl: 'https://via.placeholder.com/600x400?text=Tote+Bag',
        description: 'Reusable cotton tote bag with union branding.',
      ),
    ],
  ),
];
