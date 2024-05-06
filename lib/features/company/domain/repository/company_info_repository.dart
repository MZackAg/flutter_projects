import 'package:flutter_projects/core/resources/data_state.dart';
import 'package:flutter_projects/features/company/domain/entities/company_info.dart';

abstract class CompanyInfoRepository {
  Future<DataState<List<CompanyInfoEntity>>> getCompanyInfo();
}
