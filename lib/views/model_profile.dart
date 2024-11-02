import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Setup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/select-profile',
      routes: {
        '/select-profile': (context) => SelectProfileScreen(),
        '/body-size': (context) => BodySizeScreen(),
        '/image-style': (context) => ImageStyleScreen(),
        '/upload-image': (context) => UploadImageScreen(),
        '/product-choice': (context) => ProductChoiceScreen(),
      },
    );
  }
}

// Common AppBar widget for consistent styling
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const CommonAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 40,
      leading: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
      title: title != null ? Text(
        title!,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ) : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

// Select Profile Screen
class SelectProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE6E6E6),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 20),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFE8ECF4)),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom:  160,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:30),
                child: Image.asset(
                  'assets/model.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
           Padding(
             padding: const EdgeInsets.only(top: 430),
             child: Container(
               height: 255,
               width: 390,
               decoration: BoxDecoration(

                 borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                       ,color: Color(0xffFEFEFE)   ),
               child: Column(
                 children: [
                   SizedBox(height: 16,),
                  Row(
                    children: [
                      SizedBox(width: 15,),
                      ProfileOption(image: 'assets/profile1.png', isSelected: false),
                      SizedBox(width: 12),
                      ProfileOption(image: 'assets/profile2.png', isSelected: true),
                      SizedBox(width: 12),
                      NewProfileButton(),
                    ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 25,left: 03),
                        child: ProgressDots(currentIndex: 0),
                      ),
SizedBox(height: 20,),
GestureDetector(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => BodySizeScreen()));
  },
  child: Container(
    height: 50,
    width: 300,
    decoration: BoxDecoration(
      color: Color(0xff1E232C),
      borderRadius: BorderRadius.circular(40),
    ),child: Center(child: Text('Next',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
  ),),
),
                 ],
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}

// Body Size Screen
class BodySizeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE6E6E6),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 20),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFE8ECF4)),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom:  160,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:30),
                child: Image.asset(
                  'assets/model.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 430),
              child: Container(
                height: 255,
                width: 390,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                    ,color: Color(0xffFEFEFE)   ),
                child: Column(
                  children: [
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                          children: [

                            DropdownField(label: 'Country',),
                            SizedBox(width: 20,),
                            DropdownField(label: 'Height',),

                          ]),
                    ), SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                          children: [

                            DropdownField(label: 'Country',),
                            SizedBox(width: 20,),
                            DropdownField(label: 'Height',),

                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25,left: 03),
                      child: ProgressDots(currentIndex: 1),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ImageStyleScreen()));
                      },
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color(0xff1E232C),
                          borderRadius: BorderRadius.circular(40),
                        ),child: Center(child: Text('Next',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                      ),),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Image Style Screen
class ImageStyleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffE6E6E6),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 20),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFE8ECF4)),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom:  160,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:30),
                child: Image.asset(
                  'assets/model.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 430),
              child: Container(
                height: 255,
                width: 390,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                    ,color: Color(0xffFEFEFE)   ),
                child: Column(
                  children: [
                    SizedBox(height: 16,),
                    SingleChildScrollView(
                      child: Row(
                          children: [
                            SizedBox(width: 15,),
                            ProfileOption(image: 'assets/profile1.png', isSelected: false),
                            SizedBox(width: 12),
                            ProfileOption(image: 'assets/profile2.png', isSelected: true),
                            SizedBox(width: 12),
                            NewProfileButton(),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25,left: 03),
                      child: ProgressDots(currentIndex: 2),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UploadImageScreen()));
                      },
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color(0xff1E232C),
                          borderRadius: BorderRadius.circular(40),
                        ),child: Center(child: Text('Next',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                      ),),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Upload Image Screen
class UploadImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child:   Container(
            width: 300,
            height: 370,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // Photo Container
                Container(
                  width: 240,
                  height: 240,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/upload_image.png',
                          width: 240,
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 18,
                            color: Color(0xFF1E232C),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Upload Button
                SizedBox(
                  width: 174,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add upload functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E232C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Upload',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
                  ),),),

              SizedBox(height: 16),
      NextButton(
          onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => ProductChoiceScreen()))
      ),
            ],
          ),
        ),
      ),
    );
  }
}

// Product Choice Screen
class ProductChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            ProductCard(
              image: 'assets/yellow_hoodie.png',
              title: 'Grey Hoodie',
              price: '48.99',
              rating: '4.5',
              reviews: '42',
            ),
            SizedBox(height: 26),
            ProductCard(
              image: 'assets/purple_hoodie.png',
              title: 'Grey Hoodie',
              price: '48.99',
              rating: '4.5',
              reviews: '42',
            ),
          ],
        ),
      ),
    );
  }
}

// Common Widgets
class ProfileOption extends StatelessWidget {
  final String image;
  final bool isSelected;

  const ProfileOption({
    required this.image,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffD1DFC3),

      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class NewProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 85,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8),
      ),

        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(8)
                  ),child: Icon(Icons.add,color: Color(0xff98A2B3),),
                ),
              ),
            ),
            Text(
              'New Profile',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                height: 1.1,
              ),
              textAlign: TextAlign.center,
            ),
          ],

      ),
    );
  }
}

class ProgressDots extends StatelessWidget {
  final int currentIndex;

  const ProgressDots({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          width: 6,
          height: 6,
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? Colors.black : Colors.grey[300],
          ),
        );
      }),
    );
  }
}

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          'Next',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1E232C),
          minimumSize: Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}

class DropdownField extends StatelessWidget {
  final String label;


  const DropdownField({required this.label, });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 75,top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFFF7F8F9), // Background color #F7F8F9
        border: Border.all(
          color: Color(0xFFDADADA), // Border color #DADADA
          width: 1, // Border width
        ),
      ),
      child:
          Row(
            children: [
              Center(
                child: Text(label,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down, size: 20),

        ],
      ),
    );

  }
}

class StyleOption extends StatelessWidget {
  final String image;
  final bool isSelected;

  const StyleOption({
    required this.image,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(

      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String rating;
  final String reviews;

  const ProductCard({
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 150,
            height: 306,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '\$$price',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '/item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 4),
                    Text(
                      rating,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      ' ($reviews Reviews)',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // View Product Button
          Padding(
            padding: const EdgeInsets.only(top: 170),
            child: Container(
              width: 50,
              height: 40,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'View',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xf1E232C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}