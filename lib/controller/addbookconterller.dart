import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddbookConterller extends GetxController {
  var selectedimage = Rx<XFile>;
  FilePickerResult? result;
  var isimage = RxBool(false);

  void selectimage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
    isimage.value = false;
  }

  void selectebookpdf() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
  }
}
