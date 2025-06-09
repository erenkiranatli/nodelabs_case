extension StringExtensions on String {
  String truncateByWord(int maxChars) {
    if (length <= maxChars) return this;

    final words = split(' ');
    final buffer = StringBuffer();
    int count = 0;

    for (var word in words) {
      if ((count + word.length + 1) > maxChars) {
        break;
      }
      buffer.write('$word ');
      count += word.length + 1;
    }

    return buffer.toString().trimRight();
  }
}
