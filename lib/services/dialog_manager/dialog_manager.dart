import 'package:etos_driver/main.dart';
import 'package:etos_driver/services/components/error_dialog.dart';
import 'package:etos_driver/services/components/notification_dialog.dart';
import 'package:etos_driver/services/components/success_dialog.dart';
import 'package:etos_driver/services/dialog.dart';
import 'package:flutter/material.dart';

class DialogManager extends StatefulWidget {
  final Widget? child;
  const DialogManager({super.key, this.child});
  @override
  // ignore: library_private_types_in_public_api
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService? dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    dialogService!.registerGetContextListener(getContext);
    dialogService!.registerSuccessDialogListener(
        SuccessDialog(context: context, dialogService: dialogService).show);
    dialogService!.registerErrorDialogListener(
        ErrorDialog(context: context, dialogService: dialogService).show);
    dialogService!.registerNotification(
        NotificationDialog(context: context, dialogService: dialogService)
            .show);
  }

  BuildContext getContext() {
    return context;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }
}
