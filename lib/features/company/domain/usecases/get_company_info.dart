import 'package:flutter_projects/core/resources/data_state.dart';
import 'package:flutter_projects/core/usecases/usecase.dart';
import 'package:flutter_projects/features/company/domain/entities/company_info.dart';
import 'package:flutter_projects/features/company/domain/repository/company_info_repository.dart';

class GetCompanyInfoUseCase
    implements UseCase<DataState<List<CompanyInfoEntity>>, void> {
  final CompanyInfoRepository _companyInfoRepository;

  GetCompanyInfoUseCase(this._companyInfoRepository);
  @override
  Future<DataState<List<CompanyInfoEntity>>> call({void params}) {
    return _companyInfoRepository.getCompanyInfo();
  }
}
