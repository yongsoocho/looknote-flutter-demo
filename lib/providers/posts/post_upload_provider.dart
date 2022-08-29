import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:looknote/app/constants/shared_preference_key.dart';
import 'package:looknote/domain/repository/post_api_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostUploadProvider with ChangeNotifier {
  final PostApiRepository postApiRepository;
  final SharedPreferences prefs;

  PostUploadProvider({
    required this.postApiRepository,
    required this.prefs,
  });

  File? imageFile;
  bool _isUploading = false;

  bool get isUploading => _isUploading;

  set isUploading(bool value) {
    _isUploading = value;
    notifyListeners();
  }

  void selectImage(File? _imageFile) {
    imageFile = _imageFile;
    notifyListeners();
  }

  Future<void> uploadPost() async {
    final response = await postApiRepository.uploadPost(
        'Bearer ${prefs.getString(SharedPreferenceKey.userToken)!}',
        images: imageFile!);

    response.when(success: (success) {}, error: (error) {});
    notifyListeners();
  }
}
