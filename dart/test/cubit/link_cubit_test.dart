import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";
import "package:bloc_test/bloc_test.dart";
import "package:shortly/logic/cubit/link_cubit.dart";
import "package:shortly/models/link.dart";
import "package:shortly/repositories/link_repository.dart";
import "package:shortly/utils/utils.dart";

class MockLinkRepository extends Mock implements LinkRepository {}

void main() {
  group("LinkCubit", () {
    late LinkRepository linkRepository;
    final mockLinks = [
      LinkModel(
          original: 'https://www.google.com',
          shorten: 'https://shorten.com/abc123'),
      LinkModel(
          original: 'https://www.facebook.com',
          shorten: 'https://shorten.com/def456'),
    ];

    const initialLink = 'https://www.google.com';
    const shortenLink = 'https://shorten.com/abc123';

    setUp(() {
      linkRepository = MockLinkRepository();
    });

    LinkCubit buildCubit() {
      return LinkCubit(linkRepository);
    }

    group('constructor', () {
      test("works properly", () {
        expect(buildCubit(), isA<LinkCubit>());
      });
      test('initial state is correct', () {
        expect(
          buildCubit().state,
          equals(const LinkState()),
        );
      });
    });

    group("changeEnteredLink", () {
      blocTest<LinkCubit, LinkState>(
        'emits new state when updated entered link.',
        build: buildCubit,
        act: (cubit) => cubit.changeEnteredLink(initialLink),
        expect: () => [
          const LinkState(enteredLink: initialLink),
        ],
      );

      blocTest<LinkCubit, LinkState>(
        'emits new state when updated link while inputError not empty.',
        build: buildCubit,
        seed: () => const LinkState(inputError: 'Please add a link'),
        act: (cubit) => cubit.changeEnteredLink(initialLink),
        expect: () => [
          const LinkState(
            enteredLink: initialLink,
            inputError: 'Please add a link',
          ),
          const LinkState(
            enteredLink: initialLink,
            inputError: '',
          ),
        ],
      );
    });

    group("validateEnteredLink", () {
      blocTest<LinkCubit, LinkState>(
        'emits new state when link is empty.',
        build: buildCubit,
        act: (cubit) => cubit.validateEnteredLink(),
        expect: () => [
          const LinkState(inputError: 'Please add a link'),
        ],
      );

      blocTest<LinkCubit, LinkState>(
        'emits new state when link is not empty and error is set.',
        build: buildCubit,
        seed: () => const LinkState(
          enteredLink: initialLink,
          inputError: 'Please enter a link',
        ),
        act: (cubit) => cubit.validateEnteredLink(),
        expect: () => [
          const LinkState(
            enteredLink: initialLink,
            inputError: '',
          ),
        ],
      );
    });

    group("getLinks", () {
      blocTest<LinkCubit, LinkState>(
        'retrieves links from repository and emits new state.',
        build: buildCubit,
        setUp: () {
          when(() => linkRepository.getShortedLinks())
              .thenAnswer((_) async => mockLinks);
        },
        act: (cubit) => cubit.getLinks(),
        expect: () => [
          const LinkState(getLinkstatus: Status.loading),
          LinkState(links: mockLinks, getLinkstatus: Status.success),
        ],
      );

      blocTest<LinkCubit, LinkState>(
        'emits new state with error if getLinks from repository fails',
        build: buildCubit,
        setUp: () {
          when(() => linkRepository.getShortedLinks())
              .thenThrow('failed to get links');
        },
        act: (cubit) => cubit.getLinks(),
        expect: () => [
          const LinkState(getLinkstatus: Status.loading),
          const LinkState(
            getLinkstatus: Status.failure,
            errorMessage: "failed to get links",
          ),
        ],
      );
    });

    group("shortenLink", () {
      blocTest<LinkCubit, LinkState>(
        'shortens link and emits new state.',
        build: buildCubit,
        seed: () => const LinkState(enteredLink: initialLink),
        setUp: () {
          when(() => linkRepository.shortenLink(initialLink))
              .thenAnswer((_) async => shortenLink);
        },
        act: (cubit) => cubit.shortenLink(),
        expect: () => [
          const LinkState(
              shortenLinkStatus: Status.loading, enteredLink: initialLink),
          LinkState(
            shortenLinkStatus: Status.success,
            enteredLink: initialLink,
            links: [
              LinkModel(
                original: initialLink,
                shorten: shortenLink,
              )
            ],
          ),
        ],
      );

      blocTest<LinkCubit, LinkState>(
        'emits new state with error if shortenLink from repository fails',
        build: buildCubit,
        seed: () => const LinkState(enteredLink: initialLink),
        setUp: () {
          when(() => linkRepository.shortenLink(initialLink))
              .thenThrow('failed to shorten link');
        },
        act: (cubit) => cubit.shortenLink(),
        expect: () => [
          const LinkState(
              shortenLinkStatus: Status.loading, enteredLink: initialLink),
          const LinkState(
            shortenLinkStatus: Status.failure,
            enteredLink: initialLink,
            errorMessage: "failed to shorten link",
          ),
        ],
      );
    });
  });
}
