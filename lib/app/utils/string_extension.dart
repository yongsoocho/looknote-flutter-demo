extension StringExtension on String {
  String toHttp() {
    int index = indexOf(':');
    return 'http' + substring(index);
  }

  String dateFormat() {
    int index = indexOf('T');
    return substring(0, index).replaceAll(RegExp(r'-'), '/');
  }
}