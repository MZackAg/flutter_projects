import 'package:dio/dio.dart';
import 'package:flutter_projects/core/constants/constants.dart';
import 'package:flutter_projects/features/company/data/models/company_info.dart';
import 'package:retrofit/retrofit.dart';

part 'company_info_api_service.g.dart';

@RestApi(baseUrl: companyInfoApiBaseUrl)
abstract class CompanyInfoApiService {
  factory CompanyInfoApiService(Dio dio) = _CompanyInfoApiService;

  @GET('company')
  Future<HttpResponse<List<CompanyInfoModel>>> getCompanyInfo();
}
