import 'package:dio/dio.dart';
import 'package:flutter_projects/features/company/data/data_sources/remote/company_info_api_service.dart';
import 'package:flutter_projects/features/company/data/repository/company_info_repository_impl.dart';
import 'package:flutter_projects/features/company/domain/repository/company_info_repository.dart';
import 'package:flutter_projects/features/company/domain/usecases/get_company_info.dart';
import 'package:flutter_projects/features/company/presentation/bloc/company_info/remote/remote_company_info_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<CompanyInfoApiService>(CompanyInfoApiService(sl()));
  sl.registerSingleton<CompanyInfoRepository>(CompanyInfoRepositoryImpl(sl()));
  sl.registerSingleton<GetCompanyInfoUseCase>(GetCompanyInfoUseCase(sl()));
  sl.registerSingleton<RemoteCompanyInfosBloc>(RemoteCompanyInfosBloc(sl()));
}
