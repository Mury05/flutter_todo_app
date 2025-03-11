import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flip_card/flip_card.dart';

class SearchCountry extends StatefulWidget {
  const SearchCountry({super.key});

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  final String url = "https://restcountries.com/v3.1/name";
  final String urlAll = "https://restcountries.com/v3.1/all";

  TextEditingController pays = TextEditingController();
  late Future<dynamic> Ctry;
  late Future<dynamic> allCountries;

  @override
  void initState() {
    super.initState();
    Ctry = getCountry("benin"); // Chargement par défaut
    allCountries = getAllCountries();
  }

  Future<dynamic> getCountry(String country) async {
    final response = await http.get(Uri.parse("$url/$country?fullText=true"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Échec lors de la récupération");
    }
  }

  Future<dynamic> getAllCountries() async {
    final response = await http.get(Uri.parse(urlAll));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Échec lors de la récupération");
    }
  }

  void refreshCountry() {
    setState(() {
      Ctry = getCountry(pays.text.isNotEmpty ? pays.text : "benin");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rechercher un pays",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: pays,
                    decoration: InputDecoration(
                      hintText: "Entrez le nom du pays",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: refreshCountry,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("🔍",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: Ctry,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text(
                              "Aucun pays trouvé! veillez renseigner un bon nom"));
                    } else if (snapshot.hasData) {
                      final countryData = snapshot.data[0];
                      final flagUrl = countryData["flags"]["png"];
                      final countryName = countryData["name"]["common"];
                      final capital =
                          countryData["capital"]?[0] ?? "Non spécifiée";

                      return Center(
                        child: FlipCard(
                          front: Container(
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 4)
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(flagUrl,
                                    width: 150, height: 100, fit: BoxFit.cover),
                                const SizedBox(height: 10),
                                Text(
                                  countryName,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          back: Container(
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 4)
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Capitale : $capital",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Center(child: Text("Données non trouvées"));
                    }
                  },
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: allCountries,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text("Aucun pays trouvé!"));
              } else if (snapshot.hasData) {
                final List<dynamic> allCountriesData = snapshot.data;

                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allCountriesData.length,
                    itemBuilder: (context, index) {
                      final country = allCountriesData[index];
                      final countryName = country["name"]["common"];
                      final flagUrl = country["flags"]["png"];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Ctry = getCountry(country["name"]["common"]);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 4)
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(flagUrl,
                                    width: 150, height: 100, fit: BoxFit.cover),
                                const SizedBox(height: 10),
                                Text(
                                  countryName,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                      // return ListTile(
                      //   leading: Image.network(flagUrl, width: 50, height: 30),
                      //   title: Text(countryName),
                      // );
                    },
                  ),
                );
              } else {
                return const Center(child: Text("Données non trouvées"));
              }
            },
          ),
        ],
      ),
    );
  }
}
