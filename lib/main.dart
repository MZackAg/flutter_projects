import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/constants/routes.dart';
import 'package:flutter_projects/features/company/presentation/bloc/company_info/remote/remote_company_info_bloc.dart';
import 'package:flutter_projects/features/company/presentation/bloc/company_info/remote/remote_company_info_event.dart';
import 'package:flutter_projects/features/company/presentation/pages/home/company_info.dart';
import 'package:flutter_projects/injection_container.dart';
import 'package:flutter_projects/features/company/presentation/pages/launch_list/launches_list_view.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteCompanyInfosBloc>(
      create: (context) => sl()..add(const GetCompanyInfo()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          launcheListRoute: (context) => const LauchesList(),
        },
        home: const CompanyInfo(),
      ),
    );
  }
}
