import 'package:flutter_test/flutter_test.dart';
import 'package:shortly/logic/cubit/link_cubit.dart';
import 'package:shortly/models/link.dart';
import 'package:shortly/utils/utils.dart';

void main() {
  group("LinkState", () {
    final mockLinks = [
      LinkModel(
          original: 'https://www.google.com',
          shorten: 'https://shorten.com/abc123'),
      LinkModel(
          original: 'https://www.facebook.com',
          shorten: 'https://shorten.com/def456'),
    ];

    LinkState createSubject({
      List<LinkModel>? links,
      Status? getLinkstatus,
      Status? shortenLinkStatus,
      String? errorMessage,
      String? inputError,
      String? enteredLink,
    }) {
      return LinkState(
        links: links ?? [],
        getLinkstatus: getLinkstatus ?? Status.init,
        shortenLinkStatus: shortenLinkStatus ?? Status.init,
        errorMessage: errorMessage,
        inputError: inputError,
        enteredLink: enteredLink ?? '',
      );
    }

    test("supports value equality", () {
      expect(
        createSubject(),
        equals(createSubject()),
      );
    });

    test("props are correct", () {
      expect(
        createSubject(
          enteredLink: 'https://www.google.com',
          errorMessage: 'error',
          inputError: 'inputError',
          links: mockLinks,
        ).props,
        equals(
          <Object>[
            mockLinks,
            Status.init,
            Status.init,
            'error',
            'https://www.google.com',
            'inputError',
          ],
        ),
      );
    });

    group("copyWith", () {
      test("returns the same object if not arguments are provided", () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });

      test("retains the old value for every parameter if null is provided", () {
        expect(
          createSubject().copyWith(
            links: null,
            getLinkstatus: null,
            shortenLinkStatus: null,
            errorMessage: null,
            inputError: null,
            enteredLink: null,
          ),
          equals(createSubject()),
        );
      });

      test("replaces every non-null parameter", () {
        expect(
          createSubject().copyWith(
            links: mockLinks,
            getLinkstatus: Status.loading,
            shortenLinkStatus: Status.success,
            errorMessage: 'error',
            inputError: 'inputError',
            enteredLink: 'https://www.google.com',
          ),
          equals(
            createSubject(
              links: mockLinks,
              getLinkstatus: Status.loading,
              shortenLinkStatus: Status.success,
              errorMessage: 'error',
              inputError: 'inputError',
              enteredLink: 'https://www.google.com',
            ),
          ),
        );
      });
    });
  });
}
