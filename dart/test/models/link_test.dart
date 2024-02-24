import 'package:flutter_test/flutter_test.dart';
import 'package:shortly/models/link.dart';

void main() {
  group("LinkModel", () {
    group("fromJson", () {
      test("should return a valid model when the JSON is valid", () {
        final json = {
          "original": "https://www.google.com",
          "shorten": "https://shorten.com/abc123"
        };
        final result = LinkModel.fromJson(json);
        expect(
          result,
          isA<LinkModel>()
              .having(
                (l) => l.original,
                'original link',
                'https://www.google.com',
              )
              .having(
                (l) => l.shorten,
                'shortened link',
                'https://shorten.com/abc123',
              ),
        );
      });

      test("should return a valid model when the JSON is empty", () {
        final json = <String, dynamic>{};
        final result = LinkModel.fromJson(json);
        expect(
          result,
          isA<LinkModel>()
              .having(
                (l) => l.original,
                'original link',
                '',
              )
              .having(
                (l) => l.shorten,
                'shortened link',
                '',
              ),
        );
      });
    });

    group("toJson", () {
      test("should return a JSON map containing the proper data", () {
        // arrange
        final link = LinkModel(
          original: "https://www.google.com",
          shorten: "https://shorten.com/abc123",
        );
        // act
        final result = link.toJson();
        // assert
        expect(
          result,
          isA<Map<String, dynamic>>()
              .having(
                (l) => l['original'],
                'original link',
                'https://www.google.com',
              )
              .having(
                (l) => l['shorten'],
                'shortened link',
                'https://shorten.com/abc123',
              ),
        );
      });
    });
  });
}
