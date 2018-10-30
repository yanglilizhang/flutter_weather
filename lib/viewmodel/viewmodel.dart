import 'package:flutter_weather/commom_import.dart';

abstract class ViewModel {
  final rxHolder = RxHolder();

  final isLoading = StreamController<bool>();
  final error = StreamController<bool>();

  /// 调用该方法释放内存
  void dispose() {
    rxHolder.clear();

    isLoading.close();
    error.close();
  }

  void doError(DioError e) {
    if (CancelToken.isCancel(e)) return;

    debugPrint(e.message);
    debugPrint(e.response.toString());

    error.add(true);
  }
}
