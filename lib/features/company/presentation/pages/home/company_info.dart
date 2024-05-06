import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/features/company/presentation/bloc/company_info/remote/remote_company_info_bloc.dart';
import 'package:flutter_projects/features/company/presentation/bloc/company_info/remote/remote_company_info_state.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../style/company_info_style.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 167, 146, 183),
      title: const Text('Company Informations'),
      centerTitle: true,
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteCompanyInfosBloc, RemoteCompanyInfoState>(
      builder: (_, state) {
        if (state is RemoteCompanyInfosLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteCompanyInfosError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is RemoteCompanyInfosDone) {
          return ListView.builder(
            itemCount: state.companyInfos!.length,
            itemBuilder: (context, index) {
              final infosData = state.companyInfos![index];
              return Center(
                child: Column(
                  children: [
                    ListTile(
                        title: Text('Name : ${infosData.name}'),
                        titleTextStyle: listTileStyle),
                    ListTile(
                        title: Text('Founder : ${infosData.founder}'),
                        titleTextStyle: listTileStyle),
                    ListTile(
                        title: Text(' Founded : ${infosData.founded}'),
                        titleTextStyle: listTileStyle),
                    const ListTile(
                      title: Text(' Links :'),
                      titleTextStyle: listTileStyle,
                    ),
                    ...infosData.links.entries.map((link) {
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
                    }),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(launcheListRoute);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 225, 226, 255),
                        textStyle: const TextStyle(fontSize: 18.0),
                      ),
                      child: const Text('Launch List!'),
                    )
                  ],
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
