class CurrencyModel {
  int id;
  String code;
  String ccy;
  String ccyRu;
  String ccyUz;
  String ccyUzc;
  String ccyEn;
  String nominal;
  num rate;
  String diff;
  String date;

  CurrencyModel({
    required this.id,
    required this.code,
    required this.ccy,
    required this.ccyRu,
    required this.ccyUz,
    required this.ccyUzc,
    required this.ccyEn,
    required this.nominal,
    required this.rate,
    required this.diff,
    required this.date,
  });

  factory CurrencyModel.fromJson(Map<String, Object?> map) {
    return CurrencyModel(
      id: map['id'] as int,
      code: map['Code'] as String,
      ccy: map['Ccy'] as String,
      ccyRu: map['CcyNm_RU'] as String,
      ccyUz: map['CcyNm_UZ'] as String,
      ccyUzc: map['CcyNm_UZC'] as String,
      ccyEn: map['CcyNm_EN'] as String,
      nominal: map['Nominal'] as String,
      rate: num.tryParse(map['Rate'] as String) ?? 0,
      diff: map['Diff'] as String,
      date: map['Date'] as String,
    );
  }

  @override
  String toString() {
    return 'CurrencyModel(id: $id, Code: $code, Ccy: $ccy, CcyNm_RU: $ccyRu, CcyNm_UZ: $ccyUz, CcyNm_UZC: $ccyUzc, CcyNm_EN: $ccyEn, Nominal: $nominal, Rate: $rate, Diff: $diff, Date: $date)';
  }

  @override
  bool operator ==(covariant CurrencyModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.code == code &&
        other.ccy == ccy &&
        other.ccyRu == ccyRu &&
        other.ccyUz == ccyUz &&
        other.ccyUzc == ccyUzc &&
        other.ccyEn == ccyEn &&
        other.nominal == nominal &&
        other.rate == rate &&
        other.diff == diff &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        code.hashCode ^
        ccy.hashCode ^
        ccyRu.hashCode ^
        ccyUz.hashCode ^
        ccyUzc.hashCode ^
        ccyEn.hashCode ^
        nominal.hashCode ^
        rate.hashCode ^
        diff.hashCode ^
        date.hashCode;
  }
}
