import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class CharacterProvider extends ChangeNotifier {
  List<Offset> points = [];

  addPoints(BuildContext context, DragUpdateDetails details) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    points.add(renderBox.globalToLocal(details.globalPosition));
  }

  addOffset(Offset offset) {
    points.add(offset);
    notifyListeners();
  }

  clearPoints() {
    points = [];
    notifyListeners();
  }
}
