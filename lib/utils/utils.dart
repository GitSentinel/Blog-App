import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<String> pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: source);
      return image?.path ?? '';
    } catch (e) {
      return '';
    }
  }
}
