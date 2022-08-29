extension ExtensionString on String {
  bool get isValidNickname {
    final nicknameRegExp = RegExp(r"^[a-z0-9_-]{2,10}$");
    return nicknameRegExp.hasMatch(this);
  }



}

RegExp emailRegex = RegExp(
  r"^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$",
);

RegExp passwordRegex = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$");

