// import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_projects/constants/routes.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> infos = [];
  @override
  void initState() {
    super.initState();
    getCompanyInfo();
  }

  Future getCompanyInfo() async {
    final response =
        await http.get(Uri.https('api.spacexdata.com', 'v4/company'));
    final jsonData = jsonDecode(response.body);
    setState(() {
      infos = [jsonData];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 167, 146, 183),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Company Informations'),
      ),
      body: Column(
        children: [
          Expanded(
            child: infos.isNotEmpty
                ? ListView.builder(
                    itemCount: infos.length,
                    itemBuilder: (context, index) {
                      final teamInfo = infos[index];
                      final name = teamInfo['name'];
                      final founder = teamInfo['founder'];
                      final founded = teamInfo['founded'].toString();
                      final links = teamInfo['links'];
                      const TextStyle listTileStyle = TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black87);
                      return Center(
                        child: Column(
                          children: [
                            ListTile(
                                title: Text('Name : $name'),
                                titleTextStyle: listTileStyle),
                            ListTile(
                                title: Text('Founder : $founder'),
                                titleTextStyle: listTileStyle),
                            ListTile(
                                title: Text(' Founded : $founded'),
                                titleTextStyle: listTileStyle),
                            const ListTile(
                              title: Text(' Links :'),
                              titleTextStyle: listTileStyle,
                            ),
                            ...links.entries.map((link) {
                              return ListTile(
                                title: Text(link.key),
                                trailing: IconButton(
                                  icon: const Icon(Icons.link),
                                  onPressed: () async {
                                    final url = Uri.parse(link.value);
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    } else {
                                      throw 'Could Not launch $url';
                                    }
                                  },
                                ),
                              );
                            }).toList()
                          ],
                        ),
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(launcheListRoute);
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 225, 226, 255),
              textStyle: const TextStyle(fontSize: 18.0),
            ),
            child: const Text('Launch List!'),
          )
        ],
      ),
    );
  }
}
