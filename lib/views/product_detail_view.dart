import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../models/shop_model.dart';

class ProductDetailsView extends StatelessWidget {
  final Product product;


  ProductDetailsView({required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              product.imagePath,
              fit: BoxFit.cover,
            ),
          ),


          Positioned(
            top: size.height * 0.05,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: size.height * 0.05,
            right: 16,
            child: IconButton(
              icon: Icon(Icons.favorite_border),
              color: Colors.white,
              onPressed: () {

              },
            ),
          ),


          DraggableScrollableSheet(
            initialChildSize: 0.35,
            minChildSize: 0.35,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.brand,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '${product.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 16),

                      Wrap(
                        spacing: 8,
                        children: product.sizes
                            .map((size) => _buildSizeOption(size))
                            .toList(),
                      ),
                      SizedBox(height: 16),

                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text(
                            ' (${product.rating})',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Text('${product.reviews} Reviews'),
                        ],
                      ),
                      SizedBox(height: 16),

                      Text(
                        'DESCRIPTION',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        product.description,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildQuantityControl(),
                          ElevatedButton.icon(
                            onPressed: () {

                            },
                            icon: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Add to Cart',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }


  Widget _buildSizeOption(String size) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        size,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }


  Widget _buildQuantityControl() {
    return Row(
      children: [
        IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.remove),
        ),
        Text(
          '1',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
