import 'package:flutter/cupertino.dart';
import 'package:looknote/screen/auth/login/login_screens.dart';
import 'package:looknote/screen/auth/sign_up/apple/apple_sign_up_screen.dart';
import 'package:looknote/screen/auth/sign_up/kakao/kakao_sign_up_screen.dart';
import 'package:looknote/screen/auth/sign_up/local/sign_up_screen.dart';
import 'package:looknote/screen/auth/terms_of_use/terms_of_use_screens.dart';
import 'package:looknote/screen/auth/update/update_screen.dart';
import 'package:looknote/screen/bottom_navigation/bottom_navigation_view.dart';
import 'package:looknote/screen/mynote/drawer/contact_screen.dart';
import 'package:looknote/screen/mynote/drawer/delete_user_screen.dart';
import 'package:looknote/screen/mynote/drawer/edit_profile_screen.dart';
import 'package:looknote/screen/mynote/mypoint/mypoint_view.dart';
import 'package:looknote/screen/post/post_detail/comment_screen.dart';
import 'package:looknote/screen/post/post_main/notification/notification_view.dart';
import 'package:looknote/screen/post/post_main/post_screen.dart';
import 'package:looknote/screen/user/others/other_user_screen.dart';
import 'package:looknote/screen/user/user_search/user_search_screen.dart';
import 'package:looknote/screen/post/post_upload/post_upload_screen.dart';
import 'package:looknote/screen/post/post_detail/post_detail_screen.dart';
import '../../../screen/screens.dart';



final Map<String, WidgetBuilder> routes = {
  LookNoteRouteNames.home: (context) => const BottomNavigationView(),
  LookNoteRouteNames.update: (context) => const UpdateScreen(),
  LookNoteRouteNames.workThrough: (context) => const WorkThroughScreen(),
  LookNoteRouteNames.login: (context) {
    final args = (ModalRoute.of(context)!.settings.arguments ?? {}) as Map;
    return LoginScreen(
      isFromPreview: args['isFromPreview'] ?? false,
    );
  },
  LookNoteRouteNames.emailLogin: (context) => const EmailLoginScreen(),
  LookNoteRouteNames.termsOfUse: (context) {
    final args = (ModalRoute.of(context)!.settings.arguments ?? {}) as Map;
    return TermsMainScreen(
      loginType: args['loginType'] ?? LoginType.kakao,
    );
  },
  LookNoteRouteNames.terms: (context) {
    final args = (ModalRoute.of(context)!.settings.arguments ?? {}) as Map;
    return TermsScreen(
      title: args['title'],
      url: args['url'],
    );
  },
  LookNoteRouteNames.signUp: (context) {
    final args = (ModalRoute.of(context)!.settings.arguments ?? {}) as Map;
    return SignUpScreen(
      isMarketingChecked: args['isMarketingChecked'],
    );
  },
  LookNoteRouteNames.kakaoSignUp: (context) {
    final args = (ModalRoute.of(context)!.settings.arguments ?? {}) as Map;
    return KakaoSignUpScreen(
      isMarketingChecked: args['isMarketingChecked'],
    );
  },
  LookNoteRouteNames.appleSignUp: (context) {
    final args = (ModalRoute.of(context)!.settings.arguments ?? {}) as Map;
    return AppleSignUpScreen(
      isMarketingChecked: args['isMarketingChecked'],
    );
  },
  LookNoteRouteNames.resetPassword: (context) => const ResetPasswordScreen(),
  LookNoteRouteNames.feedView: (context) => const PostScreen(),
  LookNoteRouteNames.communityScreen: (context) => const PostDetailScreen(),
  LookNoteRouteNames.commentScreen: (context) {
    final args = (ModalRoute.of(context)!.settings.arguments ?? {}) as Map;
    return CommentScreen(postId: args['postId']);
  },
  LookNoteRouteNames.myPointView: (context) => const MyPointView(),
  LookNoteRouteNames.notificationView: (context) => const NotificationView(),
  LookNoteRouteNames.searchPost: (context) => const UserSearchScreen(),
  LookNoteRouteNames.searchResultPost: (context) {
    final args = (ModalRoute.of(context)!.settings.arguments ?? {}) as Map;
    return OtherUserScreen(userModel: args['userModel'],);
  },
  LookNoteRouteNames.contact: (context) => const ContactScreen(),
  LookNoteRouteNames.editProfile: (context) => const EditProfileScreen(),
  LookNoteRouteNames.deleteUser: (context) => const DeleteUserScreen(),
  LookNoteRouteNames.makePost: (context) => const PostUploadScreen()
};

class LookNoteRouteNames {
  LookNoteRouteNames._();

  static const home = '/home';
  static const update = '/update';

  static const workThrough = '/work_through';
  static const signUp = '/signUp';
  static const appleSignUp = '/appleSignUp';
  static const kakaoSignUp = '/kakaoSignUp';
  static const termsOfUse = '/terms_of_use';
  static const terms = '/terms';
  static const login = '/login';
  static const emailLogin = '/emailLogin';
  static const resetPassword = '/resetPassword';

  static const feedView = '/feedview';
  static const makePost = '/MakePost';
  static const searchPost = '/searchPost';
  static const searchResultPost = '/searchResultPost';

  static const communityScreen = '/community';
  static const commentScreen = '/comment';
  static const myPointView = '/mypointview';
  static const notificationView = '/notificationview';

  static const contact = '/contact';
  static const editProfile = '/editProfile';
  static const deleteUser = '/deleteUser';
}
