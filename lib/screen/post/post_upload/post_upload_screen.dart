import 'dart:async';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../app/constants/colors.dart';
import '../../../app/di/service_locator.dart';
import '../../../app/resource/resource.dart';
import '../../../providers/looknote_providers.dart';
import '../../../providers/posts/post_upload_provider.dart';
import 'components/post_upload_app_bar.dart';

class PostUploadScreen extends StatefulWidget {
  static const routeName = '/makePost';

  const PostUploadScreen({Key? key}) : super(key: key);

  @override
  State<PostUploadScreen> createState() => _PostUploadScreenState();
}

enum AppState {
  free,
  picked,
  cropped,
}

class _PostUploadScreenState extends State<PostUploadScreen> {
  late AppState state;
  File? imageFile;

  @override
  void initState() {
    super.initState();
    serviceLocator<FirebaseAnalytics>().logEvent(
      name: 'click_upload_board',
      parameters: context.read<AuthProvider>().userModel?.toJson(),
    );
    _pickImage();
    state = AppState.free;
  }

  Future<void> _pickImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    imageFile = pickedImage != null ? File(pickedImage.path) : null;
    if (imageFile != null) {
      setState(() {
        state = AppState.picked;
      });
    }
    _cropImage(imageFile?.path);
  }

  Future<void> _cropImage(filePath) async {
    if (filePath != null) {
      File? croppedFile = await ImageCropper().cropImage(
          sourcePath: filePath,
          aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.2),
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ]
          compressFormat: ImageCompressFormat.png,
          androidUiSettings: const AndroidUiSettings(
              toolbarTitle: '이미지 설정',
              toolbarColor: Colors.black,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: const IOSUiSettings(
            title: '이미지 설정',
            aspectRatioLockEnabled: true,

          ));
      if (croppedFile != null) {
        imageFile = croppedFile;
        context.read<PostUploadProvider>().selectImage(imageFile);
        setState(() {
          state = AppState.cropped;
        },
        );
      }
    }
  }

  void _clearImage() {
    setState(() {
      imageFile = null;
      state = AppState.free;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MakePostAppBar(),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              size16,
              SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: GestureDetector(
                    child: imageFile != null ?
                    Image.file(imageFile!) :
                    Container(
                      color: Colors.grey.withOpacity(0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/imagecrop/add@2x.png', width: 35,),
                          const SizedBox(height: 15,),
                          const Text(
                            '코디 이미지를 선택해주세요.', style: TextStyle(fontSize: 15,),)
                        ],),
                    ),
                    onTap: () {
                      if (state == AppState.free) {
                        _pickImage();
                      } else if (state == AppState.cropped) {
                        _clearImage();
                      } else if (state == AppState.picked) {
                        _clearImage();
                      }
                    },)
              ),
              const SizedBox(height: 104,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: LookNoteColors.blackNeutral
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16,),
                  child: Text(
                      '상/하의가 모두 보이는 전신샷의 경우에만 리워드가 지급되며,\n다른 사람의 사진을 무단 도용했을 경우\n별도의 안내 없이 게시물이 삭제될 수 있습니다.',
                      style: body2,
                      textAlign: TextAlign.center,),
                ),
              )
            ],
          ),

          Visibility(
            visible: context.watch<PostUploadProvider>().isUploading,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
