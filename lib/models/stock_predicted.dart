class StockPrediction {
  String? s0;

  StockPrediction({required this.s0});

  StockPrediction.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['0'] = s0;
    return data;
  }
}
