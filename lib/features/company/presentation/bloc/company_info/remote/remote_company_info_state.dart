import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_projects/features/company/domain/entities/company_info.dart';

abstract class RemoteCompanyInfoState extends Equatable {
  final List<CompanyInfoEntity>? companyInfos;
  final DioException? error;

  const RemoteCompanyInfoState({this.companyInfos, this.error});
  @override
  List<Object> get props => [companyInfos!, error!];
}

class RemoteCompanyInfosLoading extends RemoteCompanyInfoState {
  const RemoteCompanyInfosLoading() : super(companyInfos: null, error: null);
}

class RemoteCompanyInfosDone extends RemoteCompanyInfoState {
  const RemoteCompanyInfosDone(List<CompanyInfoEntity> companyInfos)
      : super(companyInfos: companyInfos);
}

class RemoteCompanyInfosError extends RemoteCompanyInfoState {
  const RemoteCompanyInfosError(DioException error) : super(error: error);
}
