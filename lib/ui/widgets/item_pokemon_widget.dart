import 'package:flutter/material.dart';
import 'package:flutter_codio_pokedex/ui/widgets/item_type_widget.dart';

class ItemPokemonWidget extends StatelessWidget {
  String name;
  String image;
  List<String> types;
  ItemPokemonWidget(
      {required this.name, required this.image, required this.types});
  @override
  Widget build(BuildContext context) {
    //print(types);
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff8DC7B2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -22,
            right: -22,
            child: Image.asset(
              "assets/images/pokeball.png",
              height: 120.0,
              color: Colors.white.withOpacity(0.27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                /*Column(
                  children: types.map((e) => ItemTypeWindget()).toList(),
                ),*/
                ...types
                    .map((e) => ItemTypeWindget(
                          typeText: e,
                        ))
                    .toList(),

                //ItemTypeWindget(),
              ],
            ),
          ),
          Positioned(
            bottom: -10,
            right: -10,
            child: Image.network(image),
          ),
        ],
      ),
    );
  }
}
