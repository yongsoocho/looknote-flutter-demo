

class DateFormatUtils {

  DateFormatUtils._();

  static String createdTime(DateTime createdAt) {
    final now = DateTime.now();

    final difference = now.difference(createdAt);

    if (difference.inMinutes <= 1) {
      return '방금';
    } else if (difference.inMinutes <= 60) {
      return '${difference.inMinutes}분';
    } else if (difference.inHours <= 24) {
      return '${difference.inHours}시간';
    } else if (difference.inDays <= 6) {
      return '${difference.inDays}일';
    } else {
      return '${difference.inDays ~/ 7}주';
    }
  }
}