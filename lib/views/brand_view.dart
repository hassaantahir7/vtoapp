import 'package:flutter/material.dart';
import '../controllers/brand_controller.dart';
import '../models/brand_model.dart';
import '../widgets/bottomNavBar.dart';

class BrandView extends StatelessWidget {
  final BrandController controller = BrandController();

  @override
  Widget build(BuildContext context) {
    final brands = controller.getBrands();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: _buildAppBar(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildSearchBar(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Looking for favorite brand',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _buildBrandGrid(size, brands),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {

        },
        iconPath: 'assets/fab.png',
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: Colors.black),
            SizedBox(width: 5),
            Text(
              'United Arab Emirates',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
        Icon(Icons.notifications_outlined, color: Colors.black),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'What are you looking for...',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildBrandGrid(Size size, List<Brand> brands) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: brands.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return _buildBrandItem(brands[index]);
        },
      ),
    );
  }

  Widget _buildBrandItem(Brand brand) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              brand.logoUrl,
              height: 40,
              width: 40,
            ),
            SizedBox(height: 8),
            Text(
              brand.name,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
