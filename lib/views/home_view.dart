
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/views/payment_view.dart';
import 'package:shop/views/product_detail_view.dart';
import '../controllers/shop_controller.dart';
import '../models/shop_model.dart';
import '../widgets/bottomNavBar.dart';
import 'brand_view.dart';
import 'image_picker_screen.dart';


class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ShopController controller = ShopController();

  @override
  Widget build(BuildContext context) {
    final products =
        controller.getProducts();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: _buildAppBar(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                            hintText: 'What are you looking for?',
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    height: 40,
                    width: 54,
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)

                      )
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/filter.png',
                        height: 28,
                        width: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildAdBanner(size),
            _buildBrandSection(),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BrandView()),
                    );
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildProductGrid(size, products),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePickerScreen()));
        },
        iconPath: 'assets/fab.png',
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/location.png',
          height: 20,
          width: 20,
        ),
        SizedBox(width: 5),
        Text(
          'United Arab Emirates',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Icon(Icons.keyboard_arrow_down),
        Spacer(),
        Image.asset(
          'assets/bell.png',
          height: 70,
          width: 70,
        ),
      ],
    );
  }

  Widget _buildAdBanner(Size size) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: size.width,
        height: size.height * 0.195,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Stack(
          children: [
            Positioned(
              right: 10,
              top: 7,
              child:
                  Image.asset('assets/manOutline.png', width: 120, height: 130),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shop with us!',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff061023)
                      )),
                  SizedBox(height: 2),
                  Text('Get 40% Off for \nall items',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Color(0xff061023))),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        'Shop Now',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBrandLogo('assets/versace.png'),
          _buildBrandLogo('assets/zara.png'),
          _buildBrandLogo('assets/gucci.png'),
          _buildBrandLogo('assets/versace2.png'),
        ],
      ),
    );
  }

  Widget _buildBrandLogo(String asset) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Image.asset(asset, height: 70, width: 70),
    );
  }

  Widget _buildProductGrid(Size size, List<Product> products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: size.width > 600 ? 4 : 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsView(product: products[index]),
              ),
            );
          },
          child: _buildProductCard(products[index]),
        );
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10),
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height:
                    double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.price.toString(),
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
