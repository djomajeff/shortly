import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortly/logic/cubit/link_cubit.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class LinksForm extends StatelessWidget {
  const LinksForm({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final linkCubit = context.read<LinkCubit>();

    return BlocListener<LinkCubit, LinkState>(
      listenWhen: (previous, current) =>
          previous.shortenLinkStatus != current.shortenLinkStatus,
      listener: (context, state) {
        final status = state.shortenLinkStatus;
        if (status.isSuccess || status.isFailure) {
          showCustomSnackBar(
            context,
            status.isFailure
                ? state.errorMessage!
                : 'Link successfully shorten !',
            type: status.isSuccess ? SnackbarType.success : SnackbarType.error,
          );
        }
      },
      child: renderRoundedBox(
        radius: 8,
        backgroundColor: AppColors.accent,
        margin: const EdgeInsets.symmetric(vertical: 42),
        child: Stack(
          children: [
            SvgPicture.asset(
              kbgShortenImage,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BlocBuilder<LinkCubit, LinkState>(
                    buildWhen: (previous, current) =>
                        previous.enteredLink != current.enteredLink ||
                        previous.inputError != current.inputError,
                    builder: (context, state) {
                      return MyInput(
                        hintText: 'Shorten a link here...',
                        radius: 4,
                        fillColor: Colors.white,
                        errorText: state.inputError,
                        onChanged: linkCubit.changeEnteredLink,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  BlocSelector<LinkCubit, LinkState, bool>(
                    selector: (state) => state.shortenLinkStatus.isLoading,
                    builder: (context, isLoading) {
                      return isLoading
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: renderSizedLoadingIndicator(size: 28),
                            )
                          : MyElevatedButton(
                              label: 'Shorten it!',
                              labelStyle: textTheme.bodyLarge!
                                  .copyWith(color: Colors.white),
                              onPressed: linkCubit.shortenLink,
                              primaryColor: AppColors.primary,
                              radius: 4,
                            );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
