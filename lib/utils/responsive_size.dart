class ResponsiveSize {
  static double _width = 360;
  static double _height = 640;
  static void init({required double height, required double width}) {
    _width = width;
    _height = height;
  }

  static double width(num value) {
    return value * (_width / 360);
  }

  static double height(num value) {
    return value * (_height / 630);
  }
}

extension ResponsiveOnNum on num {
  double get width => ResponsiveSize.width(this);
  double get height => ResponsiveSize.height(this);
}
