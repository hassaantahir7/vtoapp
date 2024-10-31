import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/views/home_view.dart';
import 'package:shop/views/upload_image.dart';
import 'camera_instructions_screen.dart';
import 'image_picker_controller.dart';
import 'frame_camera_screen.dart';
import 'upload_screen.dart';

class ImagePickerScreen extends StatelessWidget {
  ImagePickerScreen({Key? key}) : super(key: key);

  final ImagePickerController controller = Get.put(ImagePickerController());

  void _showCameraInstructions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CameraInstructionsScreen(
        onGetStarted: () {
          Navigator.pop(context); // Close the instructions screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FrameCameraScreen(),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView())),
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
                  const Expanded(
                    child: Text(
                      'Select your option',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 40),

              // Take Photo Option
              GestureDetector(
                onTap: () => _showCameraInstructions(context),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F8F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 28,
                          color: Color(0xFF1E232C),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Take Photo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1E232C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // From Gallery Option
              Obx(() => GestureDetector(
                onTap: () => controller.getImage(ImageSource.gallery),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F8F9),
                    borderRadius: BorderRadius.circular(15),
                    image: controller.imagePath.isNotEmpty
                        ? DecorationImage(
                      image: FileImage(File(controller.imagePath.value)),
                      fit: BoxFit.cover,
                    )
                        : null,
                  ),
                  child: controller.imagePath.isEmpty
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.photo_library_outlined,
                          size: 28,
                          color: Color(0xFF1E232C),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'From Gallery',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1E232C),
                        ),
                      ),
                    ],
                  )
                      : Container(),
                ),
              )),

              const SizedBox(height: 20),

              // Virtual Try-on Option (New)
              // GestureDetector(
              //   onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const FrameCameraScreen()),
              //   ),
              //   child: Container(
              //     width: double.infinity,
              //     height: 120,
              //     decoration: BoxDecoration(
              //       color: const Color(0xFFF7F8F9),
              //       borderRadius: BorderRadius.circular(15),
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Container(
              //           padding: const EdgeInsets.all(12),
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(12),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.black.withOpacity(0.05),
              //                 blurRadius: 4,
              //                 offset: const Offset(0, 2),
              //               ),
              //             ],
              //           ),
              //           child: const Icon(
              //             Icons.checkroom_outlined,
              //             size: 28,
              //             color: Color(0xFF1E232C),
              //           ),
              //         ),
              //         const SizedBox(height: 8),
              //         const Text(
              //           'Virtual Try-on',
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w500,
              //             color: Color(0xFF1E232C),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              const Spacer(),

              // Next Button
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SizedBox(
                  width: 280,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: controller.imagePath.isNotEmpty
                        ? () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhotoUploadScreen(
                                imagePath: controller.imagePath.value)))
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E232C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}