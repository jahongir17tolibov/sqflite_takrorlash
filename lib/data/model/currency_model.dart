class CurrencyModel {
  // final int? entityId;
  final num id;
  final String code;
  final String ccyName;
  final String ccyNameRu;
  final String ccyNameUz;
  final String ccyNameKr;
  final String ccyNameEn;
  final String nominal;
  final String rate;
  final String diff;
  final String date;

  CurrencyModel({
    // this.entityId,
    required this.id,
    required this.code,
    required this.ccyName,
    required this.ccyNameRu,
    required this.ccyNameUz,
    required this.ccyNameKr,
    required this.ccyNameEn,
    required this.nominal,
    required this.rate,
    required this.diff,
    required this.date,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'Code': code,
        'Ccy': ccyName,
        'CcyNm_RU': ccyNameRu,
        'CcyNm_UZ': ccyNameUz,
        'CcyNm_UZC': ccyNameKr,
        'CcyNm_EN': ccyNameEn,
        'Nominal': nominal,
        'Rate': rate,
        'Diff': diff,
        'Date': date,
      };

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        id: json['id'],
        code: json['Code'],
        ccyName: json['Ccy'],
        ccyNameRu: json['CcyNm_RU'],
        ccyNameUz: json['CcyNm_UZ'],
        ccyNameKr: json['CcyNm_UZC'],
        ccyNameEn: json['CcyNm_EN'],
        nominal: json['Nominal'],
        rate: json['Rate'],
        diff: json['Diff'],
        date: json['Date'],
      );

  CurrencyModel copyWith({
    int? id,
    String? code,
    String? ccyName,
    String? ccyNameRu,
    String? ccyNameUz,
    String? ccyNameKr,
    String? ccyNameEn,
    String? nominal,
    String? rate,
    String? diff,
    String? date,
  }) =>
      CurrencyModel(
        id: id ?? this.id,
        code: code ?? this.code,
        ccyName: ccyName ?? this.ccyName,
        ccyNameRu: ccyNameRu ?? this.ccyNameRu,
        ccyNameUz: ccyNameUz ?? this.ccyNameUz,
        ccyNameKr: ccyNameKr ?? this.ccyNameKr,
        ccyNameEn: ccyNameEn ?? this.ccyNameEn,
        nominal: nominal ?? this.nominal,
        rate: rate ?? this.rate,
        diff: diff ?? this.diff,
        date: date ?? this.date,
      );
}
