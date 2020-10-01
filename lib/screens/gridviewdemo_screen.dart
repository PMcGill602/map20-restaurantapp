import 'package:flutter/material.dart';

class GridViewDemoScreen extends StatefulWidget {
  static const routeName = '/gridViewDemo';

  State<StatefulWidget> createState() {
    return _GridViewDemoState();
  }
}

class _GridViewDemoState extends State<GridViewDemoScreen> {
  _Controller con;
  int count = 0;
  List<bool> checked = [false, false, false, false, false, false];

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  void render(fn) => setState(fn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grid View Demo"),
          actions: <Widget>[
            Container(
              alignment: Alignment(0, 0),
                child: Text(
              "Selected " + count.toString(),
              style: TextStyle(fontSize: 20.0),
            )),
          ],
        ),
        body: GridView.extent(
          maxCrossAxisExtent: 150,
          padding: const EdgeInsets.all(4),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: con._buildGridTiles(6),
        ));
  }
}

class _Controller {
  _GridViewDemoState _state;
  _Controller(this._state);

  List<Stack> _buildGridTiles(int count) => List.generate(
      count,
      (i) => Stack(fit: StackFit.passthrough, children: [
            GridTile(
                child: Image.asset(
              'images/dog$i.jpg',
              fit: BoxFit.fill,
            )),
            Positioned(
              left: 1.0,
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor: Colors.black,
                ),
                child: Checkbox(
                  value: _state.checked[i],
                  onChanged: (bool value) {
                    _state.render(() {
                      _state.checked[i] = value;
                      if (value == true) {
                        _state.count++;
                      } else {
                        _state.count--;
                      }
                    });
                  },
                  checkColor: Colors.black,
                  activeColor: Colors.green,
                ),
              ),
            )
          ]));
  void delete() {}
}
