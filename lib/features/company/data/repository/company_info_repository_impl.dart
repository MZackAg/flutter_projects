import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_projects/core/resources/data_state.dart';
import 'package:flutter_projects/features/company/data/data_sources/remote/company_info_api_service.dart';
import 'package:flutter_projects/features/company/data/models/company_info.dart';
import 'package:flutter_projects/features/company/domain/repository/company_info_repository.dart';

class CompanyInfoRepositoryImpl implements CompanyInfoRepository {
  final CompanyInfoApiService _companyInfoApiService;

  CompanyInfoRepositoryImpl(this._companyInfoApiService);

  @override
  Future<DataState<List<CompanyInfoModel>>> getCompanyInfo() async {
    try {
      final httpResponse = await _companyInfoApiService.getCompanyInfo();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
