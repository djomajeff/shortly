part of 'link_cubit.dart';

final class LinkState extends Equatable {
  final List<LinkModel> links;
  final Status getLinkstatus, shortenLinkStatus;
  final String? errorMessage, inputError;
  final String enteredLink;

  const LinkState({
    this.links = const [],
    this.getLinkstatus = Status.init,
    this.shortenLinkStatus = Status.init,
    this.errorMessage,
    this.inputError,
    this.enteredLink = '',
  });

  LinkState copyWith({
    List<LinkModel>? links,
    Status? getLinkstatus,
    Status? shortenLinkStatus,
    String? errorMessage,
    String? inputError,
    String? enteredLink,
  }) {
    return LinkState(
      links: links ?? this.links,
      getLinkstatus: getLinkstatus ?? this.getLinkstatus,
      shortenLinkStatus: shortenLinkStatus ?? this.shortenLinkStatus,
      inputError: inputError ?? this.inputError,
      errorMessage: errorMessage ?? this.errorMessage,
      enteredLink: enteredLink ?? this.enteredLink,
    );
  }

  @override
  List<Object> get props => [
        links,
        getLinkstatus,
        shortenLinkStatus,
        errorMessage ?? '',
        enteredLink,
        inputError ?? '',
      ];
}
