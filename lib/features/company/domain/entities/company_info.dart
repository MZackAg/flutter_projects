import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class CompanyInfoEntity extends Equatable {
  final String? name;
  final String? founder;
  final String? founded;
  final Map<String, dynamic> links;

  const CompanyInfoEntity(
      {required this.name,
      required this.founder,
      required this.founded,
      required this.links});

  // factory CompanyInfoEntity.fromJson(Map<String, dynamic> json) {
  //   return CompanyInfoEntity(
  //     name: json['name'],
  //     founder: json['founder'],
  //     founded: json['founded'].toString(),
  //     links: json['links'],
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'founder': founder,
  //     'founded': founded,
  //     'links': links,
  //   };
  // }

  @override
  List<Object?> get props {
    return [
      name,
      founder,
      founded,
      links,
    ];
  }
}
