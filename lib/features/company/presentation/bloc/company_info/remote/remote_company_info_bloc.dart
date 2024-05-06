import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/resources/data_state.dart';
import 'package:flutter_projects/features/company/domain/usecases/get_company_info.dart';
import 'package:flutter_projects/features/company/presentation/bloc/company_info/remote/remote_company_info_event.dart';
import 'package:flutter_projects/features/company/presentation/bloc/company_info/remote/remote_company_info_state.dart';

class RemoteCompanyInfosBloc
    extends Bloc<RemoteCompanyInfoEvent, RemoteCompanyInfoState> {
  final GetCompanyInfoUseCase _companyInfoUseCase;

  RemoteCompanyInfosBloc(this._companyInfoUseCase)
      : super(const RemoteCompanyInfosLoading()) {
    on<GetCompanyInfo>(onGetCompanyInfo);
  }

  void onGetCompanyInfo(
      GetCompanyInfo event, Emitter<RemoteCompanyInfoState> emit) async {
    final dataState = await _companyInfoUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteCompanyInfosDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteCompanyInfosError(dataState.error!));
    }
  }
}
