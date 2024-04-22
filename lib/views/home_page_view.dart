import 'package:flutter/material.dart';
import 'package:flutter_projects/constants/routes.dart';
import 'package:flutter_projects/http_requests/get_company_info.dart';
import 'package:flutter_projects/models/company_info.dart';
import 'package:flutter_projects/style/company_info_style.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> infos = [];
  final bool isOnLoadingState = false;
  @override
  void initState() {
    super.initState();
    fetchCompanyInfo();
  }

  void fetchCompanyInfo() async {
    CompanyService companyService = CompanyService();
    var jsonData = await companyService.getCompanyInfo();
    setState(() {
      infos = jsonData;
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
              child: isOnLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : infos.isEmpty
                      ? const Center(child: Text('THERE IS NO DATA!!'))
                      : ListView.builder(
                          itemCount: infos.length,
                          itemBuilder: (context, index) {
                            final companyInfo =
                                CompanyInfo.fromJson(infos[index]);
                            return Center(
                              child: Column(
                                children: [
                                  ListTile(
                                      title: Text('Name : ${companyInfo.name}'),
                                      titleTextStyle: listTileStyle),
                                  ListTile(
                                      title: Text(
                                          'Founder : ${companyInfo.founder}'),
                                      titleTextStyle: listTileStyle),
                                  ListTile(
                                      title: Text(
                                          ' Founded : ${companyInfo.founded}'),
                                      titleTextStyle: listTileStyle),
                                  const ListTile(
                                    title: Text(' Links :'),
                                    titleTextStyle: listTileStyle,
                                  ),
                                  ...companyInfo.links.entries.map((link) {
                                    return ListTile(
                                      title: Text(link.key),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.link),
                                        onPressed: () async {
                                          final url = Uri.parse(link.value);
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url);
                                            return;
                                          }
                                        },
                                      ),
                                    );
                                  })
                                ],
                              ),
                            );
                          },
                        )),
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
