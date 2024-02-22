import 'package:flutter/material.dart';
import 'package:shortly/logic/cubit/link_cubit.dart';
import 'package:shortly/utils/utils.dart';
import 'package:shortly/widgets/boost_link.dart';
import '../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  late final GlobalKey _linkFormKey;
  late final LinkCubit _linkCubit;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _linkFormKey = GlobalKey();
    _linkCubit = context.read<LinkCubit>();

    _linkCubit.getLinks();
  }

  void _animteToLinkForm() {
    final renderBox =
        _linkFormKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    _scrollController.animateTo(
      position.dy,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: BlocBuilder<LinkCubit, LinkState>(
          buildWhen: (previous, current) =>
              previous.getLinkstatus != current.getLinkstatus,
          builder: (context, state) {
            if (state.getLinkstatus.isFailure) {
              showCustomSnackBar(
                context,
                state.errorMessage!,
                type: SnackbarType.error,
              );
            }

            if (state.getLinkstatus.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Scaffold(
              drawer: const MainDrawer(),
              body: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        children: [
                          const NavBar(),
                          Overview(onRedirectToForm: _animteToLinkForm),
                          LinksForm(key: _linkFormKey),
                          const LinksList(),
                          const Statistics(),
                        ],
                      ),
                    ),
                    BoostLink(onRedirectToForm: _animteToLinkForm),
                    const Footer(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
