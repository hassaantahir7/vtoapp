import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/views/about_view.dart';
import 'package:shop/views/delivery_location_view.dart';
import 'package:shop/views/notifications_view.dart';
import 'package:shop/views/order_history_view.dart';
import 'package:shop/views/payment_methods_view.dart';
import '../controllers/user_controller.dart';
import 'edit_profile_view.dart';
import 'help_view.dart';

class ProfileView extends StatelessWidget {
  final UserController controller = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: _buildProfileDrawer(context),
      body: _buildProfileDrawer(context),
    );
  }

  Widget _buildProfileDrawer(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: isSmallScreen ? screenWidth * 0.85 : 400,
        height: 650,
        decoration: BoxDecoration(
          color: Color(0xFF1A1F38),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),

          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(

                right: 20,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/profile.png',
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Nadeem Khan",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 50),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfileView(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.mode_edit_outline_outlined,
                                color: Colors.white,
                                size: 23,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "nadeem.khan@outlook.com",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildDrawerItem(
                      context,
                      Icons.shopping_bag_outlined,
                      "Orders",
                      OrderHistoryView(),
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.location_on_outlined,
                      "Delivery Address",
                      DeliveryLocationEditView(),
                    ),
                    _buildDrawerItem(
                      context,
                      CupertinoIcons.creditcard,
                      "Payment Methods",
                      PaymentMethodView(),
                    ),
                    _buildDrawerItem(
                      context,
                      CupertinoIcons.bell,
                      "Notifications",
                      NotificationsView(),
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.help_outline,
                      "Help",
                      HelpView(),
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.info_outlined,
                      "About",
                      AboutAppView(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Divider(
                color: Color(0xff737373),
                thickness: 0.8,
              ),
            ),
            _buildLogoutButton(context),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 29),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context,
      IconData icon,
      String title,
      Widget page,
      ) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 24),
      leading: Icon(
        icon,
        color: Colors.white,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        CupertinoIcons.chevron_forward,
        color: Colors.white,
        size: 16,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 24),
      leading: Icon(
        Icons.logout,
        color: Colors.white,
        size: 24,
      ),
      title: Text(
        "LOG OUT",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        // Add logout functionality here
      },
    );
  }
}