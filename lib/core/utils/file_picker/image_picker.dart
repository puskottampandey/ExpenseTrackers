import 'dart:io';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_plus/image_picker_plus.dart';


// class ImagePickerUtils {
//   static final _picker = ImagePickerPlus(NavigationService.context);

//   static Future<File?> getCamera({
//     bool showOnlyFrontCamera = false,
//     bool multipleImage = false,
//   }) async {
//     final pickedFile = await _picker.pickImage(
//       source: ImageSource.camera,
//     );

//     return _returnFileHandler(pickedFile);
//   }

//   static Future<File?> getGallery({
//     bool multipleImage = false,
//   }) async {
//     final pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//       multiImages: multipleImage,
//     );
//     return _returnFileHandler(pickedFile);
//   }

//   static _returnFileHandler(SelectedImagesDetails? pickedFile) {
//     if (pickedFile != null && pickedFile.selectedFiles.isNotEmpty) {
//       return pickedFile.selectedFiles.first.selectedFile;
//     }
//     return null;
//   }
// }

class ImagePickerUtils {
  static final _picker = ImagePicker();

  static Future<File?> getCamera({bool showOnlyFrontCamera = false}) async {
    final pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice:
            showOnlyFrontCamera ? CameraDevice.front : CameraDevice.rear);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  static Future<File?> getGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return pickedFile != null ? File(pickedFile.path) : null;
  }
}
