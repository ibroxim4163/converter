// ignore_for_file: non_constant_identifier_names

class CityModel {
  int? id;
  String? code;
  String? ccy;
  String? ccyNm_RU;
  String? ccyNm_UZ;
  String? ccyNm_UZC;
  String? ccyNm_EN;
  String? nominal;
  num? rate;
  String? diff;
  String? date;

  CityModel({
    this.id,
    this.code,
    this.ccy,
    this.ccyNm_RU,
    this.ccyNm_UZ,
    this.ccyNm_UZC,
    this.ccyNm_EN,
    this.nominal,
    this.rate,
    this.diff,
    this.date,
  });

  Map<String, dynamic> toJson() {
    return <String, Object?>{
      'id': id,
      'Code': code,
      'Ccy': ccy,
      'CcyNm_RU': ccyNm_RU,
      'CcyNm_UZ': ccyNm_UZ,
      'CcyNm_UZC': ccyNm_UZC,
      'CcyNm_EN': ccyNm_EN,
      'Nominal': nominal,
      'Rate': rate,
      'Diff': diff,
      'Date': date,
    };
  }

  factory CityModel.fromJson(Map<String, Object?> map) {
    return CityModel(
      id: map['id'] != null ? map['id'] as int : null,
      code: map['Code'] != null ? map['Code'] as String : null,
      ccy: map['Ccy'] != null ? map['Ccy'] as String : null,
      ccyNm_RU: map['CcyNm_RU'] != null ? map['CcyNm_RU'] as String : null,
      ccyNm_UZ: map['CcyNm_UZ'] != null ? map['CcyNm_UZ'] as String : null,
      ccyNm_UZC: map['CcyNm_UZC'] != null ? map['CcyNm_UZC'] as String : null,
      ccyNm_EN: map['CcyNm_EN'] != null ? map['CcyNm_EN'] as String : null,
      nominal: map['Nominal'] != null ? map['Nominal'] as String : null,
      rate: map['Rate'] != null
          ? (num.tryParse(map['Rate'] as String) ?? 0)
          : null,
      diff: map['Diff'] != null ? map['Diff'] as String : null,
      date: map['Date'] != null ? map['Date'] as String : null,
    );
  }

  @override
  String toString() {
    return 'CityModel(id: $id, Code: $code, Ccy: $ccy, CcyNm_RU: $ccyNm_RU, CcyNm_UZ: $ccyNm_UZ, CcyNm_UZC: $ccyNm_UZC, CcyNm_EN: $ccyNm_EN, Nominal: $nominal, Rate: $rate, Diff: $diff, Date: $date)';
  }
}
