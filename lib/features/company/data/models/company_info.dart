import 'package:flutter_projects/features/company/domain/entities/company_info.dart';

class CompanyInfoModel extends CompanyInfoEntity {
  const CompanyInfoModel({
    super.name,
    super.founder,
    super.founded,
    required super.links,
  });

  factory CompanyInfoModel.fromJson(Map<String, dynamic> map) {
    return CompanyInfoModel(
      name: map['name'] ?? "",
      founder: map['founder'] ?? "",
      founded: map['founded'].toString(),
      links: map['links'] ?? "",
    );
  }
}
