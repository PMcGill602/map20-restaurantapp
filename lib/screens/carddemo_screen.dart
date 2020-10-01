import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson2creative/model/restaurant.dart';
import 'package:url_launcher/url_launcher.dart';

class CardDemoScreen extends StatefulWidget {
  static const routeName = '/cardDemoScreen';

  @override
  State<StatefulWidget> createState() {
    return _CardDemoState();
  }
}

class _CardDemoState extends State<CardDemoScreen> {
  _Controller con;
  bool favorites = false;

  List<Restaurant> restaurants = [
    Restaurant(
      imageURL:
          'https://lh5.googleusercontent.com/p/AF1QipMxAyE9dE_hG7STKoG5mVmGOFaguym0I4TTvzSq=w408-h544-k-no',
      name: "Hideaway Pizza",
      description:
          "Local chain featuring build-your-own pies, a variety of Italian fare & a kids' menu.",
      address: "901 N Broadway Ave",
      website: "hideawaypizza.com",
      phone: "(405) 796-7777",
    ),
    Restaurant(
      imageURL:
          'https://lh5.googleusercontent.com/p/AF1QipOcGNKbMp46B-HMA5KN7yr4UQ3PD76ylfkmQoQs=w408-h306-k-no',
      name: "Iguana Mexican Grill",
      description:
          "Creative twists on Mexican fare plus classics, vegetarian options & 200+ tequilas in unfussy digs.",
      address: "9 NW 9th St",
      website: "iguanamexicangrill.com",
      phone: "(405) 606-7172",
    ),
    Restaurant(
      imageURL:
          'https://lh5.googleusercontent.com/p/AF1QipN36aEx3r-TRL9kF7Ka6NA6KhR7c0YZmGgOXx31=w426-h240-k-no',
      name: "Blu's BBQ and Burgers",
      description:
          "Chill, family-run joint doling out hearty platters & sandwiches with smoked meats & Southern sides.",
      address: "612 N Robinson Ave",
      website: "blusbbq.publishpath.com",
      phone: "(405) 602-2587",
    )
  ];

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
          title: Text("Card Demo"),
          actions: <Widget>[
            favorites
                ? IconButton(
                    icon: Icon(Icons.star), onPressed: con._showFavorites)
                : IconButton(
                    icon: Icon(Icons.star_border),
                    onPressed: con._showFavorites)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: con._buildRestaurantCards(3),
          ),
        ));
  }
}

class _Controller {
  _CardDemoState _state;
  _Controller(this._state);
  List<Stack> _buildRestaurantCards(int count) => List.generate(
      count,
      (i) => _state.favorites == true && _state.restaurants[i].favorite == false
          ? Stack(children: [
              SizedBox(width: 1.0, height: 1.0),
            ])
          : Stack(
              fit: StackFit.passthrough,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 300,
                          width: 500,
                          child: Image.network(_state.restaurants[i].imageURL,
                              fit: BoxFit.fill),
                        ),
                        ListTile(
                          title: Text(_state.restaurants[i].name),
                          subtitle: Text(_state.restaurants[i].description),
                        ),
                        ListTile(
                          leading: Icon(Icons.pin_drop),
                          title: Text(_state.restaurants[i].address),
                        ),
                        ListTile(
                          leading: Icon(Icons.link),
                          title: Text(_state.restaurants[i].website),
                          onTap: () => _openLink(_state.restaurants[i].website),
                        ),
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text(_state.restaurants[i].phone),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 15.0,
                  top: 15.0,
                  child: _state.restaurants[i].favorite
                      ? IconButton(
                          icon: Icon(Icons.star),
                          color: Colors.yellow,
                          onPressed: () => {_toggleFavorite(i)},
                        )
                      : IconButton(
                          icon: Icon(Icons.star_border),
                          color: Colors.yellow,
                          onPressed: () => {_toggleFavorite(i)},
                        ),
                )
              ],
            ));
  void _toggleFavorite(int i) {
    if (_state.restaurants[i].favorite) {
      _state.render(() {
        _state.restaurants[i].favorite = false;
      });
    } else {
      _state.render(() {
        _state.restaurants[i].favorite = true;
      });
    }
  }

  void _showFavorites() {
    _state.render(() {
      _state.favorites = !_state.favorites;
    });
  }

  void _openLink(String url) async {
    Uri formattedURL = Uri(
      scheme: 'http',
      path: url,
    );
    
    if (await canLaunch(formattedURL.toString())) {
      await launch(formattedURL.toString());
    } else {
      throw 'Could not launch';
    }
  }
}
