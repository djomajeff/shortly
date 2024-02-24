import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shortly/models/link.dart';
import 'package:shortly/repositories/link_repository.dart';
import 'package:shortly/utils/utils.dart';

part 'link_state.dart';

class LinkCubit extends Cubit<LinkState> {
  LinkCubit(LinkRepository linkRepository)
      : _linkRepository = linkRepository,
        super(const LinkState());

  final LinkRepository _linkRepository;

  Future<void> getLinks() async {
    emit(state.copyWith(getLinkstatus: Status.loading));
    try {
      final links = await _linkRepository.getShortedLinks();
      emit(state.copyWith(
        links: links,
        getLinkstatus: Status.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        getLinkstatus: Status.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void changeEnteredLink(String value) {
    emit(state.copyWith(enteredLink: value));
    if (state.inputError?.isNotEmpty ?? false) {
      validateEnteredLink();
    }
  }

  bool validateEnteredLink() {
    final link = state.enteredLink;
    if (link.isEmpty) {
      emit(state.copyWith(inputError: 'Please add a link'));
      return false;
    } else {
      emit(state.copyWith(inputError: ''));
      return true;
    }
  }

  Future<void> shortenLink() async {
    final isValid = validateEnteredLink();
    if (!isValid) return;

    emit(state.copyWith(shortenLinkStatus: Status.loading));
    try {
      final link = state.enteredLink;
      final shortedLink = await _linkRepository.shortenLink(link);
      emit(state.copyWith(
        links: [
          ...state.links,
          LinkModel(original: link, shorten: shortedLink),
        ],
        shortenLinkStatus: Status.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        shortenLinkStatus: Status.failure,
        errorMessage: e is DioException
            ? (e.message ?? 'Failed to shorten link')
            : e.toString(),
      ));
    }
  }
}
