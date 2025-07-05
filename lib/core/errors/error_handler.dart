import 'package:client/helper/toast.dart';

void handleError(String errorTitle, dynamic error, ) {
  // display snackbar or toast
  ToastUtils.showError(title: errorTitle, subtitle: error.message);
}
