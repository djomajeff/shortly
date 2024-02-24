import 'package:flutter/material.dart';
import './utils.dart';

enum SnackbarType { error, success, info }

enum Status { loading, success, failure, init }

extension XStatus on Status {
  bool get isLoading => this == Status.loading;
  bool get isSuccess => this == Status.success;
  bool get isFailure => this == Status.failure;
  bool get isInitial => this == Status.init;
}

extension XSnackbarType on SnackbarType {
  bool get isInfo => this == SnackbarType.info;
  bool get isSuccess => this == SnackbarType.success;
  bool get isError => this == SnackbarType.error;
}

final deviceSize = MediaQueryData.fromView(
  WidgetsBinding.instance.platformDispatcher.views.first,
).size;

void showCustomSnackBar(
  BuildContext context,
  String message, {
  SnackbarType type = SnackbarType.error,
  duration = const Duration(seconds: 5),
}) {
  final textTheme = Theme.of(context).textTheme;
  if (message.isEmpty) return;
  Future.delayed(Duration.zero, () async {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          showCloseIcon: false,
          action: SnackBarAction(
            label: 'Close',
            textColor: Colors.lightBlueAccent[100],
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
          elevation: 0,
          backgroundColor: type.isError
              ? Theme.of(context).colorScheme.error
              : type.isSuccess
                  ? AppColors.success
                  : Theme.of(context).snackBarTheme.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: Row(
            children: [
              Icon(
                type.isError
                    ? Icons.error_rounded
                    : type.isSuccess
                        ? Icons.check_circle_rounded
                        : Icons.info_outline,
                size: 24,
                color: Colors.white,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        message,
                        textAlign: TextAlign.start,
                        style: textTheme.bodyMedium!.copyWith(
                          fontSize: 12.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  });
}
