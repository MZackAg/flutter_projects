class CompanyInfo {
  final String name;
  final String founder;
  final String founded;
  final Map<String, dynamic> links;

  CompanyInfo(
      {required this.name,
      required this.founder,
      required this.founded,
      required this.links});

  factory CompanyInfo.fromJson(Map<String, dynamic> json) {
    return CompanyInfo(
      name: json['name'],
      founder: json['founder'],
      founded: json['founded'].toString(),
      links: json['links'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'founder': founder,
      'founded': founded,
      'links': links,
    };
  }
}
