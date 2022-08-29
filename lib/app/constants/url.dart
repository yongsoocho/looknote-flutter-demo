class RootNoteAPI {
  RootNoteAPI._();



  // Auth
  static const String localLogin = '/user/login';
  static const String localTokenLogin = '/user/relogin';
  static const String localSignUp = '/user/join';
  static const String appleLogin = '/user/apple/login';
  static const String appleSignUp = '/user/apple/join';
  static const String kakaoLogin = '/user/kakao/login';
  static const String kakaoSignUp = '/user/kakao/join';

  static const String checkEmailUrl = '/user/check/email';
  static const String checkNicknameUrl = '/user/check/nickname';
  static const String sendSignUpCode = '/user/code/send';
  static const String checkSignUpCode = '/user/code/check';
  static const String getNicknameFromId = '/user/search';

  //Posts
  static const String getPosts = '/post/search';
  static const String getPostsPopular = '/post/popular';
  static const String getPostDetail = '/post/search/detail';
  static const String upLoadPost = '/post/create';
  static const String deletePost = '/post/delete';


  //user
  static const String sendFindPasswordCode = '/user/password/code';
  static const String checkFindPasswordCode = '/user/password/check';
  static const String resetPassword = '/user/password/reset';
  static const String deleteAuth = '/user/delete/user';
  static const String checkDeleteAuth = '/user/delete/check';
  static const String user = '/user/user';
  static const String userSearch = '/user/search';
  static const String setFCM = '/user/fcm';


  // comment
  static const String comment = '/post/comment';


  //mynote
  static const String myNoteCoin = '/mynote/coin';
  static const String myNote = '/mynote';
  static const String scrap = '$myNote/scrap';
  static const String notifications = '/mynote/push';

  //version
  static const String version = '/version';


}

const String baseURL = 'https://api.looknote.co.kr';

class LookNoteUrl {
  LookNoteUrl._();

  static const String instagram = 'https://www.instagram.com/take_looknote/';
  static const String kakaoChannel = 'http://pf.kakao.com/_bEhxab';
  static const String appStore = 'https://apps.apple.com/kr/app/id1604553837';
}
