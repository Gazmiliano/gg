import 'dart:ui' as ui;

double screenWidth;
double screenHeight;

void main() {
  // Convert from physical pixels to Flutter's logical pixels.
  screenWidth = ui.window.physicalSize.width / ui.window.devicePixelRatio;
  screenHeight = ui.window.physicalSize.height / ui.window.devicePixelRatio;
  print(screenWidth);
  print(screenHeight);
}