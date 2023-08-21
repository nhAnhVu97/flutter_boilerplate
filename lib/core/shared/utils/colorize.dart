enum Styles {
  request,
  yellow,
  green,
  red,
  reset,
}

class Colorize {
  Colorize([this.initial = '']);
  static const String esc = '\u{1B}';

  String initial = '';

  Colorize apply(Styles style, [String? text]) {
    text ??= initial;

    initial = _applyStyle(style, text);
    return this;
  }

  String buildEscSeq(Styles style) {
    return '$esc[${getStyle(style)}m';
  }

  Colorize call(String text) {
    initial = text;
    return this;
  }

  Colorize green() {
    return apply(Styles.green);
  }

  Colorize red() {
    return apply(Styles.red);
  }

  @override
  String toString() {
    return initial;
  }

  Colorize yellow() {
    return apply(Styles.yellow);
  }

  String _applyStyle(Styles style, String text) {
    return buildEscSeq(style) + text + buildEscSeq(Styles.reset);
  }

  static String getStyle(Styles style) {
    switch (style) {
      case Styles.red:
        return '91';
      case Styles.green:
        return '92';
      case Styles.yellow:
        return '93';
      case Styles.reset:
        return '0';
      case Styles.request:
        return '95';
    }
  }
}
