import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerController extends GetxController {
  var imagePath = ''.obs;
  final ImagePicker _picker = ImagePicker();

  Future<void> checkAndRequestPermissions(ImageSource source) async {
    if (source == ImageSource.camera) {
      final status = await Permission.camera.request();
      if (status.isDenied) {
        return;
      }
    } else {
      final status = await Permission.photos.request();
      if (status.isDenied) {
        return;
      }
    }
  }

  Future<void> getImage(ImageSource source) async {
    await checkAndRequestPermissions(source);

    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 85,
        preferredCameraDevice: CameraDevice.rear,
      );

      if (image != null) {
        imagePath.value = image.path;
        // You can add navigation or other logic here
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}