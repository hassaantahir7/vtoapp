import '../models/photo_model.dart';
import 'package:image_picker/image_picker.dart';

class PhotoController {
  final picker = ImagePicker();
  PhotoModel? selectedPhoto;

  // Method to pick photo from camera
  Future<void> pickFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedPhoto =
          PhotoModel(photoPath: pickedFile.path, isFromGallery: false);
    }
  }

  // Method to pick photo from gallery
  Future<void> pickFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedPhoto =
          PhotoModel(photoPath: pickedFile.path, isFromGallery: true);
    }
  }

  // Method to upload photo
  Future<void> uploadPhoto() async {
    if (selectedPhoto != null) {
      // Add logic to upload the photo
    }
  }

  // Method to get instructions based on photo type (gallery/camera)
  String getCameraInstructions() {
    return selectedPhoto != null && selectedPhoto!.isFromGallery
        ? 'Upload a straight-on face picture.'
        : 'Make sure lighting is good and face is visible.';
  }
}
