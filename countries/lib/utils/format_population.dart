String formatNumberWithSpaces(String number) {
  final buffer = StringBuffer();
  int length = number.length;

  for (int i = 0; i < length; i++) {
    buffer.write(number[i]);

    int remaining = length - i - 1;
    if (remaining > 0 && remaining % 3 == 0) {
      buffer.write(' ');
    }
  }

  return buffer.toString();
}
