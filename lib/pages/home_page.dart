import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_codio_pokedex/ui/widgets/item_pokemon_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokemons = [];
  @override
  void initState() {
    super.initState();
    getDataPokemon();
  }

  //uri -- identifica y localiza el recurso
  getDataPokemon() async {
    Uri _uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> MyMap = json.decode(response.body);
      pokemons = MyMap["pokemon"];
      setState(() {});
      /*pokemons.forEach((element) {
        print(element["name"]);
        print(element["img"]);
        print(element["type"]);
      });*/

      //print(pokemons[0]["name"]);
    }
    //print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Pokedex",
                  style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                GridView.count(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 1.35,
                  children: pokemons
                      .map(
                        (e) => ItemPokemonWidget(
                          name: e["name"],
                          image: e["img"],
                          types:
                              List<String>.from(e["type"].map((item) => item)),
                          //types: e["type"],
                        ),
                      )
                      .toList(),
                  //ItemPokemonWidget(),
                ),
                ElevatedButton(
                    onPressed: () {
                      getDataPokemon();
                    },
                    child: Text("data")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
