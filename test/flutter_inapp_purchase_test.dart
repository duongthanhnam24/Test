import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:flutter_test/flutter_test.dart';
<<<<<<< HEAD
import 'package:platform/platform.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final MethodChannel channel = FlutterInappPurchase.channel;
=======
import 'package:http/http.dart';
import 'package:platform/platform.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
>>>>>>> new-version

  group('FlutterInappPurchase', () {
    group('showInAppMessageAndroid', () {
      group('for Android', () {
        final List<MethodCall> log = <MethodCall>[];
        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "android")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return "ready";
          });
        });
        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.showInAppMessageAndroid();
          expect(log, <Matcher>[
            isMethodCall('showInAppMessages', arguments: null),
          ]);
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('returns correct result', () async {
          final result =
              await FlutterInappPurchase.instance.showInAppMessageAndroid();
          expect(result, "ready");
        });
      });
    });
    group('consumeAllItems', () {
      group('for Android', () {
        final List<MethodCall> log = <MethodCall>[];
        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "android")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return "All items have been consumed";
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.consumeAll();
          expect(log, <Matcher>[
            isMethodCall('consumeAllItems', arguments: null),
          ]);
        });

        test('returns correct result', () async {
          expect(await FlutterInappPurchase.instance.consumeAll(),
              "All items have been consumed");
        });
      });

      group('for iOS', () {
        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "ios")));
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('returns correct result', () async {
          expect(await FlutterInappPurchase.instance.consumeAll(),
              "no-ops in ios");
        });
      });
    });

    group('initConnection', () {
      group('for Android', () {
        final List<MethodCall> log = <MethodCall>[];
        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "android")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return "Billing client ready";
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.initialize();
          expect(log, <Matcher>[
            isMethodCall('initConnection', arguments: null),
          ]);
        });

        test('returns correct result', () async {
          expect(await FlutterInappPurchase.instance.initialize(),
              "Billing client ready");
        });
      });

      group('for iOS', () {
        final List<MethodCall> log = <MethodCall>[];
        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "ios")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return "true";
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.initialize();
          expect(log, <Matcher>[
            isMethodCall('canMakePayments', arguments: null),
          ]);
        });

        test('returns correct result', () async {
          expect(await FlutterInappPurchase.instance.initialize(), "true");
        });
      });
    });

    group('getProducts', () {
      group('for Android', () {
        final List<MethodCall> log = <MethodCall>[];
<<<<<<< HEAD
        List<String> productIds = []..add("testsku");
=======
        List<String> skus = []..add("testsku");
>>>>>>> new-version

        final dynamic result = """[
          {
            "productId": "com.cooni.point1000",
            "price": "120",
            "currency": "JPY",
            "localizedPrice": "¥120",
            "title": "1,000",
            "description": "1000 points 1000P",
            "introductoryPrice": "1001",
            "introductoryPricePaymentModeIOS": "1002",
            "introductoryPriceNumberOfPeriodsIOS": "1003",
            "introductoryPriceSubscriptionPeriodIOS": "1004",
            "subscriptionPeriodUnitIOS": "1",
            "subscriptionPeriodAndroid": "2",
            "subscriptionPeriodNumberIOS": "3",
            "introductoryPriceCyclesAndroid": 4,
            "introductoryPricePeriodAndroid": "5",
<<<<<<< HEAD
            "freeTrialPeriodAndroid": "6",
            "subscriptionOffers": [
              {
                "offerId": "123",
                "basePlanId": "null",
                "offerToken": "1234",
                "pricingPhases": [
                  {
                    "price": "120",
                    "formattedPrice": "¥120",
                    "billingPeriod": "p1m",
                    "currencyCode": "JPY",
                    "recurrenceMode": 1,
                    "billingCycleCount": 2
                  }
                ]
              }
            ]
=======
            "freeTrialPeriodAndroid": "6"
>>>>>>> new-version
          }
        ]""";

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "android")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return result;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
<<<<<<< HEAD
          await FlutterInappPurchase.instance.getProducts(productIds);
=======
          await FlutterInappPurchase.instance.getProducts(skus);
>>>>>>> new-version
          expect(log, <Matcher>[
            isMethodCall(
              'getProducts',
              arguments: <String, dynamic>{
<<<<<<< HEAD
                'productIds': productIds,
=======
                'skus': skus,
>>>>>>> new-version
              },
            ),
          ]);
        });

        test('returns correct result', () async {
          List<IAPItem> products =
<<<<<<< HEAD
              await FlutterInappPurchase.instance.getProducts(productIds);
=======
              await FlutterInappPurchase.instance.getProducts(skus);
>>>>>>> new-version
          List<IAPItem> expected = (json.decode(result) as List)
              .map<IAPItem>(
                (product) => IAPItem.fromJSON(product as Map<String, dynamic>),
              )
              .toList();
          for (var i = 0; i < products.length; ++i) {
            var product = products[i];
            var expectedProduct = expected[i];
            expect(product.productId, expectedProduct.productId);
            expect(product.price, expectedProduct.price);
            expect(product.currency, expectedProduct.currency);
            expect(product.localizedPrice, expectedProduct.localizedPrice);
            expect(product.title, expectedProduct.title);
            expect(product.description, expectedProduct.description);
            expect(
                product.introductoryPrice, expectedProduct.introductoryPrice);
            expect(product.subscriptionPeriodNumberIOS,
                expectedProduct.subscriptionPeriodNumberIOS);
            expect(product.introductoryPricePaymentModeIOS,
                expectedProduct.introductoryPricePaymentModeIOS);
            expect(product.introductoryPriceNumberOfPeriodsIOS,
                expectedProduct.introductoryPriceNumberOfPeriodsIOS);
            expect(product.introductoryPriceSubscriptionPeriodIOS,
                expectedProduct.introductoryPriceSubscriptionPeriodIOS);
            expect(product.subscriptionPeriodAndroid,
                expectedProduct.subscriptionPeriodAndroid);
<<<<<<< HEAD
=======
            expect(product.introductoryPriceCyclesAndroid,
                expectedProduct.introductoryPriceCyclesAndroid);
            expect(product.introductoryPricePeriodAndroid,
                expectedProduct.introductoryPricePeriodAndroid);
            expect(product.freeTrialPeriodAndroid,
                expectedProduct.freeTrialPeriodAndroid);
>>>>>>> new-version
          }
        });
      });

      group('for iOS', () {
        final List<MethodCall> log = <MethodCall>[];
        List<String> skus = []..add("testsku");

        final dynamic result = [
          {
            "productId": "com.cooni.point1000",
            "price": "120",
            "currency": "JPY",
            "localizedPrice": "¥120",
            "title": "1,000",
            "description": "1000 points 1000P",
            "introductoryPrice": "1001",
            "introductoryPricePaymentModeIOS": "1002",
            "introductoryPriceNumberOfPeriodsIOS": "1003",
            "introductoryPriceSubscriptionPeriodIOS": "1004",
            "subscriptionPeriodUnitIOS": "1",
            "subscriptionPeriodAndroid": "2",
            "subscriptionPeriodNumberIOS": "3",
            "introductoryPriceCyclesAndroid": 4,
            "introductoryPricePeriodAndroid": "5",
<<<<<<< HEAD
            "freeTrialPeriodAndroid": "6",
            "discounts": [
              {
                "identifier": "123",
                "type": "test",
                "numberOfPeriods": "3",
                "price": 100.toDouble(),
                "localizedPrice": "¥100",
                "paymentMode": "test",
                "subscriptionPeriod": "123"
              }
            ]
=======
            "freeTrialPeriodAndroid": "6"
>>>>>>> new-version
          }
        ];

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "ios")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return result;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.getProducts(skus);
          expect(log, <Matcher>[
            isMethodCall(
              'getItems',
              arguments: <String, dynamic>{
                'skus': skus,
              },
            ),
          ]);
        });

        test('returns correct result', () async {
          List<IAPItem> products =
              await FlutterInappPurchase.instance.getProducts(skus);
          List<IAPItem>? expected = result
              .map<IAPItem>(
                (product) => IAPItem.fromJSON(product as Map<String, dynamic>),
              )
              .toList();
          for (var i = 0; i < products.length; ++i) {
            var product = products[i];
            var expectedProduct = expected![i];
            expect(product.productId, expectedProduct.productId);
            expect(product.price, expectedProduct.price);
            expect(product.currency, expectedProduct.currency);
            expect(product.localizedPrice, expectedProduct.localizedPrice);
            expect(product.title, expectedProduct.title);
            expect(product.description, expectedProduct.description);
            expect(
                product.introductoryPrice, expectedProduct.introductoryPrice);
            expect(product.subscriptionPeriodNumberIOS,
                expectedProduct.subscriptionPeriodNumberIOS);
            expect(product.introductoryPricePaymentModeIOS,
                expectedProduct.introductoryPricePaymentModeIOS);
            expect(product.introductoryPriceNumberOfPeriodsIOS,
                expectedProduct.introductoryPriceNumberOfPeriodsIOS);
            expect(product.introductoryPriceSubscriptionPeriodIOS,
                expectedProduct.introductoryPriceSubscriptionPeriodIOS);
            expect(product.subscriptionPeriodAndroid,
                expectedProduct.subscriptionPeriodAndroid);
<<<<<<< HEAD
            // expect(product.introductoryPriceCyclesAndroid,
            //     expectedProduct.introductoryPriceCyclesAndroid);
            // expect(product.introductoryPricePeriodAndroid,
            //     expectedProduct.introductoryPricePeriodAndroid);
            // expect(product.freeTrialPeriodAndroid,
            //     expectedProduct.freeTrialPeriodAndroid);
=======
            expect(product.introductoryPriceCyclesAndroid,
                expectedProduct.introductoryPriceCyclesAndroid);
            expect(product.introductoryPricePeriodAndroid,
                expectedProduct.introductoryPricePeriodAndroid);
            expect(product.freeTrialPeriodAndroid,
                expectedProduct.freeTrialPeriodAndroid);
>>>>>>> new-version
          }
        });
      });
    });

    group('getSubscriptions', () {
      group('for Android', () {
        final List<MethodCall> log = <MethodCall>[];
<<<<<<< HEAD
        List<String> productIds = []..add("testsku");
=======
        List<String> skus = []..add("testsku");
>>>>>>> new-version

        final dynamic result = """[
          {
            "productId": "com.cooni.point1000",
            "price": "120",
            "currency": "JPY",
            "localizedPrice": "¥120",
            "title": "1,000",
            "description": "1000 points 1000P",
            "introductoryPrice": "1001",
            "introductoryPricePaymentModeIOS": "1002",
            "introductoryPriceNumberOfPeriodsIOS": "1003",
            "introductoryPriceSubscriptionPeriodIOS": "1004",
            "subscriptionPeriodUnitIOS": "1",
            "subscriptionPeriodAndroid": "2",
            "subscriptionPeriodNumberIOS": "3",
            "introductoryPriceCyclesAndroid": 4,
            "introductoryPricePeriodAndroid": "5",
            "freeTrialPeriodAndroid": "6"
          }
        ]""";

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "android")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return result;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
<<<<<<< HEAD
          await FlutterInappPurchase.instance.getSubscriptions(productIds);
=======
          await FlutterInappPurchase.instance.getSubscriptions(skus);
>>>>>>> new-version
          expect(log, <Matcher>[
            isMethodCall(
              'getSubscriptions',
              arguments: <String, dynamic>{
<<<<<<< HEAD
                'productIds': productIds,
=======
                'skus': skus,
>>>>>>> new-version
              },
            ),
          ]);
        });
        test('returns correct result', () async {
          List<IAPItem> products =
<<<<<<< HEAD
              await FlutterInappPurchase.instance.getSubscriptions(productIds);
=======
              await FlutterInappPurchase.instance.getSubscriptions(skus);
>>>>>>> new-version
          List<IAPItem> expected = (json.decode(result) as List)
              .map<IAPItem>(
                (product) => IAPItem.fromJSON(product as Map<String, dynamic>),
              )
              .toList();
          for (var i = 0; i < products.length; ++i) {
            var product = products[i];
            var expectedProduct = expected[i];
            expect(product.productId, expectedProduct.productId);
            expect(product.price, expectedProduct.price);
            expect(product.currency, expectedProduct.currency);
            expect(product.localizedPrice, expectedProduct.localizedPrice);
            expect(product.title, expectedProduct.title);
            expect(product.description, expectedProduct.description);
            expect(
                product.introductoryPrice, expectedProduct.introductoryPrice);
            expect(product.subscriptionPeriodNumberIOS,
                expectedProduct.subscriptionPeriodNumberIOS);
            expect(product.introductoryPricePaymentModeIOS,
                expectedProduct.introductoryPricePaymentModeIOS);
            expect(product.introductoryPriceNumberOfPeriodsIOS,
                expectedProduct.introductoryPriceNumberOfPeriodsIOS);
            expect(product.introductoryPriceSubscriptionPeriodIOS,
                expectedProduct.introductoryPriceSubscriptionPeriodIOS);
            expect(product.subscriptionPeriodAndroid,
                expectedProduct.subscriptionPeriodAndroid);
<<<<<<< HEAD
            // expect(product.introductoryPriceCyclesAndroid,
            //     expectedProduct.introductoryPriceCyclesAndroid);
            // expect(product.introductoryPricePeriodAndroid,
            //     expectedProduct.introductoryPricePeriodAndroid);
            // expect(product.freeTrialPeriodAndroid,
            //     expectedProduct.freeTrialPeriodAndroid);
=======
            expect(product.introductoryPriceCyclesAndroid,
                expectedProduct.introductoryPriceCyclesAndroid);
            expect(product.introductoryPricePeriodAndroid,
                expectedProduct.introductoryPricePeriodAndroid);
            expect(product.freeTrialPeriodAndroid,
                expectedProduct.freeTrialPeriodAndroid);
>>>>>>> new-version
          }
        });
      });

      group('for iOS', () {
        final List<MethodCall> log = <MethodCall>[];
        List<String> skus = []..add("testsku");

        final dynamic result = [
          {
            "productId": "com.cooni.point1000",
            "price": "120",
            "currency": "JPY",
            "localizedPrice": "¥120",
            "title": "1,000",
            "description": "1000 points 1000P",
            "introductoryPrice": "1001",
            "introductoryPricePaymentModeIOS": "1002",
            "introductoryPriceNumberOfPeriodsIOS": "1003",
            "introductoryPriceSubscriptionPeriodIOS": "1004",
            "subscriptionPeriodUnitIOS": "1",
            "subscriptionPeriodAndroid": "2",
            "subscriptionPeriodNumberIOS": "3",
            "introductoryPriceCyclesAndroid": 4,
            "introductoryPricePeriodAndroid": "5",
            "freeTrialPeriodAndroid": "6"
          }
        ];

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "ios")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return result;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.getSubscriptions(skus);
          expect(log, <Matcher>[
            isMethodCall(
              'getItems',
              arguments: <String, dynamic>{
                'skus': skus,
              },
            ),
          ]);
        });

        test('returns correct result', () async {
          List<IAPItem> products =
              await FlutterInappPurchase.instance.getSubscriptions(skus);
          List<IAPItem>? expected = result
              .map<IAPItem>(
                (product) => IAPItem.fromJSON(product as Map<String, dynamic>),
              )
              .toList();
          for (var i = 0; i < products.length; ++i) {
            var product = products[i];
            var expectedProduct = expected![i];
            expect(product.productId, expectedProduct.productId);
            expect(product.price, expectedProduct.price);
            expect(product.currency, expectedProduct.currency);
            expect(product.localizedPrice, expectedProduct.localizedPrice);
            expect(product.title, expectedProduct.title);
            expect(product.description, expectedProduct.description);
            expect(
                product.introductoryPrice, expectedProduct.introductoryPrice);
            expect(product.subscriptionPeriodNumberIOS,
                expectedProduct.subscriptionPeriodNumberIOS);
            expect(product.introductoryPricePaymentModeIOS,
                expectedProduct.introductoryPricePaymentModeIOS);
            expect(product.introductoryPriceNumberOfPeriodsIOS,
                expectedProduct.introductoryPriceNumberOfPeriodsIOS);
            expect(product.introductoryPriceSubscriptionPeriodIOS,
                expectedProduct.introductoryPriceSubscriptionPeriodIOS);
            expect(product.subscriptionPeriodAndroid,
                expectedProduct.subscriptionPeriodAndroid);
<<<<<<< HEAD
            // expect(product.introductoryPriceCyclesAndroid,
            //     expectedProduct.introductoryPriceCyclesAndroid);
            // expect(product.introductoryPricePeriodAndroid,
            //     expectedProduct.introductoryPricePeriodAndroid);
            // expect(product.freeTrialPeriodAndroid,
            //     expectedProduct.freeTrialPeriodAndroid);
=======
            expect(product.introductoryPriceCyclesAndroid,
                expectedProduct.introductoryPriceCyclesAndroid);
            expect(product.introductoryPricePeriodAndroid,
                expectedProduct.introductoryPricePeriodAndroid);
            expect(product.freeTrialPeriodAndroid,
                expectedProduct.freeTrialPeriodAndroid);
>>>>>>> new-version
          }
        });
      });
    });

    group('getPurchaseHistory', () {
      group('for Android', () {
        final List<MethodCall> log = <MethodCall>[];

        final String resultInapp = """[{
            "transactionDate":"1552824902000",
            "transactionId":"testTransactionId",
            "productId":"com.cooni.point1000",
            "transactionReceipt":"testTransactionReciept",
            "purchaseToken":"testPurchaseToken",
            "autoRenewingAndroid":true,
            "dataAndroid":"testDataAndroid",
            "signatureAndroid":"testSignatureAndroid",
            "originalTransactionDateIOS":"1552831136000",
            "originalTransactionIdentifierIOS":"testOriginalTransactionIdentifierIOS"
          }]""";
        final String resultSubs = """[{
            "transactionDate":"1552824902000",
            "transactionId":"testSubsTransactionId",
            "productId":"com.cooni.point1000.subs",
            "transactionReceipt":"testSubsTransactionReciept",
            "purchaseToken":"testSubsPurchaseToken",
            "autoRenewingAndroid":true,
            "dataAndroid":"testSubsDataAndroid",
            "signatureAndroid":"testSubsSignatureAndroid",
            "originalTransactionDateIOS":"1552831136000",
            "originalTransactionIdentifierIOS":"testSubsOriginalTransactionIdentifierIOS"
          }]""";

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "android")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
            log.add(methodCall);
            var m = methodCall.arguments as Map<dynamic, dynamic>;

=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
            log.add(methodCall);
            var m = methodCall.arguments as Map<dynamic, dynamic>;
>>>>>>> new-version
            if (m['type'] == 'inapp') {
              return resultInapp;
            } else if (m['type'] == 'subs') {
              return resultSubs;
            }
<<<<<<< HEAD

=======
>>>>>>> new-version
            return null;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.getPurchaseHistory();
          expect(log, <Matcher>[
            isMethodCall(
              'getPurchaseHistoryByType',
              arguments: <String, dynamic>{
                'type': 'inapp',
              },
            ),
            isMethodCall(
              'getPurchaseHistoryByType',
              arguments: <String, dynamic>{
                'type': 'subs',
              },
            ),
          ]);
        });

        test('returns correct result', () async {
          List<PurchasedItem>? actualList =
              await (FlutterInappPurchase.instance.getPurchaseHistory()) ?? [];
          List<PurchasedItem> expectList = ((json.decode(resultInapp) as List) +
                  (json.decode(resultSubs) as List))
              .map((item) => PurchasedItem.fromJSON(item))
              .toList();

          for (var i = 0; i < actualList.length; ++i) {
            PurchasedItem actual = actualList[i];
            PurchasedItem expected = expectList[i];

            expect(actual.transactionDate, expected.transactionDate);
            expect(actual.transactionId, expected.transactionId);
            expect(actual.productId, expected.productId);
            expect(actual.transactionReceipt, expected.transactionReceipt);
            expect(actual.purchaseToken, expected.purchaseToken);
            expect(actual.autoRenewingAndroid, expected.autoRenewingAndroid);
            expect(actual.dataAndroid, expected.dataAndroid);
            expect(actual.signatureAndroid, expected.signatureAndroid);
            expect(actual.originalTransactionDateIOS,
                expected.originalTransactionDateIOS);
            expect(actual.originalTransactionIdentifierIOS,
                expected.originalTransactionIdentifierIOS);
          }
        });
      });

      group('for iOS', () {
        final List<MethodCall> log = <MethodCall>[];

        final dynamic result = [
          {
            "transactionDate": "1552824902000",
            "transactionId": "testTransactionId",
            "productId": "com.cooni.point1000",
            "transactionReceipt": "testTransactionReciept",
            "purchaseToken": "testPurchaseToken",
            "autoRenewingAndroid": true,
            "dataAndroid": "testDataAndroid",
            "signatureAndroid": "testSignatureAndroid",
            "originalTransactionDateIOS": "1552831136000",
            "originalTransactionIdentifierIOS":
                "testOriginalTransactionIdentifierIOS"
          },
          {
            "transactionDate": "1552824902000",
            "transactionId": "testSubsTransactionId",
            "productId": "com.cooni.point1000.subs",
            "transactionReceipt": "testSubsTransactionReciept",
            "purchaseToken": "testSubsPurchaseToken",
            "autoRenewingAndroid": true,
            "dataAndroid": "testSubsDataAndroid",
            "signatureAndroid": "testSubsSignatureAndroid",
            "originalTransactionDateIOS": "1552831136000",
            "originalTransactionIdentifierIOS":
                "testSubsOriginalTransactionIdentifierIOS"
          }
        ];

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "ios")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return result;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.getPurchaseHistory();
          expect(log, <Matcher>[
            isMethodCall(
              'getAvailableItems',
              arguments: null,
            ),
          ]);
        });

        test('returns correct result', () async {
          List<PurchasedItem>? actualList =
              await (FlutterInappPurchase.instance.getPurchaseHistory()) ?? [];
          List<PurchasedItem>? expectList = result
              .map<PurchasedItem>((item) => PurchasedItem.fromJSON(item))
              .toList();

          for (var i = 0; i < actualList.length; ++i) {
            PurchasedItem actual = actualList[i];
            PurchasedItem expected = expectList![i];

            expect(actual.transactionDate, expected.transactionDate);
            expect(actual.transactionId, expected.transactionId);
            expect(actual.productId, expected.productId);
            expect(actual.transactionReceipt, expected.transactionReceipt);
            expect(actual.purchaseToken, expected.purchaseToken);
            expect(actual.autoRenewingAndroid, expected.autoRenewingAndroid);
            expect(actual.dataAndroid, expected.dataAndroid);
            expect(actual.signatureAndroid, expected.signatureAndroid);
            expect(actual.originalTransactionDateIOS,
                expected.originalTransactionDateIOS);
            expect(actual.originalTransactionIdentifierIOS,
                expected.originalTransactionIdentifierIOS);
          }
        });
      });
    });

    group('getAvailablePurchases', () {
      group('for Android', () {
        final List<MethodCall> log = <MethodCall>[];

        final String resultInapp = """[{
            "transactionDate":"1552824902000",
            "transactionId":"testTransactionId",
            "productId":"com.cooni.point1000",
            "transactionReceipt":"testTransactionReciept",
            "purchaseToken":"testPurchaseToken",
            "autoRenewingAndroid":true,
            "dataAndroid":"testDataAndroid",
            "signatureAndroid":"testSignatureAndroid",
            "originalTransactionDateIOS":"1552831136000",
            "originalTransactionIdentifierIOS":"testOriginalTransactionIdentifierIOS"
          }]""";
        final String resultSubs = """[{
            "transactionDate":"1552824902000",
            "transactionId":"testSubsTransactionId",
            "productId":"com.cooni.point1000.subs",
            "transactionReceipt":"testSubsTransactionReciept",
            "purchaseToken":"testSubsPurchaseToken",
            "autoRenewingAndroid":true,
            "dataAndroid":"testSubsDataAndroid",
            "signatureAndroid":"testSubsSignatureAndroid",
            "originalTransactionDateIOS":"1552831136000",
            "originalTransactionIdentifierIOS":"testSubsOriginalTransactionIdentifierIOS"
          }]""";

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "android")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
            log.add(methodCall);

=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
            log.add(methodCall);
>>>>>>> new-version
            var m = methodCall.arguments as Map<dynamic, dynamic>;
            if (m['type'] == 'inapp') {
              return resultInapp;
            } else if (m['type'] == 'subs') {
              return resultSubs;
            }
            return null;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.getAvailablePurchases();
          expect(log, <Matcher>[
            isMethodCall(
              'getAvailableItemsByType',
              arguments: <String, dynamic>{
                'type': 'inapp',
              },
            ),
            isMethodCall(
              'getAvailableItemsByType',
              arguments: <String, dynamic>{
                'type': 'subs',
              },
            ),
          ]);
        });

        test('returns correct result', () async {
          List<PurchasedItem>? actualList =
              await (FlutterInappPurchase.instance.getAvailablePurchases()) ??
                  [];
          List<PurchasedItem> expectList = ((json.decode(resultInapp) as List) +
                  (json.decode(resultSubs) as List))
              .map((item) => PurchasedItem.fromJSON(item))
              .toList();

          for (var i = 0; i < actualList.length; ++i) {
            PurchasedItem actual = actualList[i];
            PurchasedItem expected = expectList[i];

            expect(actual.transactionDate, expected.transactionDate);
            expect(actual.transactionId, expected.transactionId);
            expect(actual.productId, expected.productId);
            expect(actual.transactionReceipt, expected.transactionReceipt);
            expect(actual.purchaseToken, expected.purchaseToken);
            expect(actual.autoRenewingAndroid, expected.autoRenewingAndroid);
            expect(actual.dataAndroid, expected.dataAndroid);
            expect(actual.signatureAndroid, expected.signatureAndroid);
            expect(actual.originalTransactionDateIOS,
                expected.originalTransactionDateIOS);
            expect(actual.originalTransactionIdentifierIOS,
                expected.originalTransactionIdentifierIOS);
          }
        });
      });

      group('for iOS', () {
        final List<MethodCall> log = <MethodCall>[];

        final dynamic result = [
          {
            "transactionDate": "1552824902000",
            "transactionId": "testTransactionId",
            "productId": "com.cooni.point1000",
            "transactionReceipt": "testTransactionReciept",
            "purchaseToken": "testPurchaseToken",
            "autoRenewingAndroid": true,
            "dataAndroid": "testDataAndroid",
            "signatureAndroid": "testSignatureAndroid",
            "originalTransactionDateIOS": "1552831136000",
            "originalTransactionIdentifierIOS":
                "testOriginalTransactionIdentifierIOS"
          },
          {
            "transactionDate": "1552824902000",
            "transactionId": "testSubsTransactionId",
            "productId": "com.cooni.point1000.subs",
            "transactionReceipt": "testSubsTransactionReciept",
            "purchaseToken": "testSubsPurchaseToken",
            "autoRenewingAndroid": true,
            "dataAndroid": "testSubsDataAndroid",
            "signatureAndroid": "testSubsSignatureAndroid",
            "originalTransactionDateIOS": "1552831136000",
            "originalTransactionIdentifierIOS":
                "testSubsOriginalTransactionIdentifierIOS"
          }
        ];

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "ios")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return result;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.getAvailablePurchases();
          expect(log, <Matcher>[
            isMethodCall(
              'getAvailableItems',
              arguments: null,
            ),
          ]);
        });

        test('returns correct result', () async {
          List<PurchasedItem>? actualList =
              await (FlutterInappPurchase.instance.getAvailablePurchases()) ??
                  [];
          List<PurchasedItem>? expectList = result
              .map<PurchasedItem>((item) =>
                  PurchasedItem.fromJSON(item as Map<String, dynamic>))
              .toList();

          for (var i = 0; i < actualList.length; ++i) {
            PurchasedItem actual = actualList[i];
            PurchasedItem expected = expectList![i];

            expect(actual.transactionDate, expected.transactionDate);
            expect(actual.transactionId, expected.transactionId);
            expect(actual.productId, expected.productId);
            expect(actual.transactionReceipt, expected.transactionReceipt);
            expect(actual.purchaseToken, expected.purchaseToken);
            expect(actual.autoRenewingAndroid, expected.autoRenewingAndroid);
            expect(actual.dataAndroid, expected.dataAndroid);
            expect(actual.signatureAndroid, expected.signatureAndroid);
            expect(actual.originalTransactionDateIOS,
                expected.originalTransactionDateIOS);
            expect(actual.originalTransactionIdentifierIOS,
                expected.originalTransactionIdentifierIOS);
          }
        });
      });
    });

    group('requestPurchase', () {
      group('for iOS', () {
        final List<MethodCall> log = <MethodCall>[];
        /*
        final dynamic result = {
          "transactionDate": "1552824902000",
          "transactionId": "testTransactionId",
          "productId": "com.cooni.point1000",
          "transactionReceipt": "testTransactionReciept",
          "purchaseToken": "testPurchaseToken",
          "autoRenewingAndroid": true,
          "dataAndroid": "testDataAndroid",
          "signatureAndroid": "testSignatureAndroid",
          "originalTransactionDateIOS": "1552831136000",
          "originalTransactionIdentifierIOS":
              "testOriginalTransactionIdentifierIOS"
        };
         */

        final String sku = "testsku";
        final String forUser = "testObfuscatedUser";

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "ios")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return null;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.requestPurchase(
            sku,
            obfuscatedAccountId: forUser,
          );
          expect(log, <Matcher>[
            isMethodCall(
              'buyProduct',
              arguments: <String, dynamic>{
                'sku': sku,
                'forUser': forUser,
              },
            ),
          ]);
        });

        test('returns correct result', () async {
          expect(
              await FlutterInappPurchase.instance.requestPurchase(sku), null);
        });
      });

      group('for Android', () {
        final List<MethodCall> log = <MethodCall>[];
<<<<<<< HEAD
        final String productId = "testsku";
=======
        final String sku = "testsku";
>>>>>>> new-version
        /*
        final dynamic result = {
          "transactionDate": "1552824902000",
          "transactionId": "testTransactionId",
          "productId": "com.cooni.point1000",
          "transactionReceipt": "testTransactionReciept",
          "purchaseToken": "testPurchaseToken",
          "autoRenewingAndroid": true,
          "dataAndroid": "testDataAndroid",
          "signatureAndroid": "testSignatureAndroid",
          "originalTransactionDateIOS": "1552831136000",
          "originalTransactionIdentifierIOS":
              "testOriginalTransactionIdentifierIOS"
        };
         */

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "android")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return null;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
<<<<<<< HEAD
          await FlutterInappPurchase.instance.requestPurchase(productId);
=======
          await FlutterInappPurchase.instance.requestPurchase(sku);
>>>>>>> new-version
          expect(log, <Matcher>[
            isMethodCall(
              'buyItemByType',
              arguments: <String, dynamic>{
                'type': 'inapp',
<<<<<<< HEAD
                'productId': productId,
=======
                'sku': sku,
>>>>>>> new-version
                'prorationMode': -1,
                'obfuscatedAccountId': null,
                'obfuscatedProfileId': null,
                'purchaseToken': null,
<<<<<<< HEAD
                'offerTokenIndex': null
=======
>>>>>>> new-version
              },
            ),
          ]);
        });

        test('returns correct result', () async {
<<<<<<< HEAD
          expect(await FlutterInappPurchase.instance.requestPurchase(productId),
              null);
=======
          expect(
              await FlutterInappPurchase.instance.requestPurchase(sku), null);
>>>>>>> new-version
        });
      });
    });

    group('requestSubscription', () {
      group('for Android', () {
        final List<MethodCall> log = <MethodCall>[];

<<<<<<< HEAD
        final String productId = "testsku";
=======
        final String sku = "testsku";
>>>>>>> new-version
        /*
        final String result = """{
          "transactionDate":"1552824902000",
          "transactionId":"testTransactionId",
          "productId":"com.cooni.point1000",
          "transactionReceipt":"testTransactionReciept",
          "purchaseToken":"testPurchaseToken",
          "autoRenewingAndroid":true,
          "dataAndroid":"testDataAndroid",
          "signatureAndroid":"testSignatureAndroid",
          "originalTransactionDateIOS":"1552831136000",
          "originalTransactionIdentifierIOS":"testOriginalTransactionIdentifierIOS"
        }""";
         */

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "android")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return null;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
<<<<<<< HEAD
          await FlutterInappPurchase.instance.requestSubscription(productId);
=======
          await FlutterInappPurchase.instance.requestSubscription(sku);
>>>>>>> new-version
          expect(log, <Matcher>[
            isMethodCall(
              'buyItemByType',
              arguments: <String, dynamic>{
                'type': 'subs',
<<<<<<< HEAD
                'productId': productId,
=======
                'sku': sku,
>>>>>>> new-version
                'prorationMode': -1,
                'obfuscatedAccountId': null,
                'obfuscatedProfileId': null,
                'purchaseToken': null,
<<<<<<< HEAD
                'offerTokenIndex': null
=======
>>>>>>> new-version
              },
            ),
          ]);
        });

        test('returns correct result', () async {
<<<<<<< HEAD
          expect(
              await FlutterInappPurchase.instance
                  .requestSubscription(productId),
=======
          expect(await FlutterInappPurchase.instance.requestSubscription(sku),
>>>>>>> new-version
              null);
        });
      });

      group('for iOS', () {
        final List<MethodCall> log = <MethodCall>[];
        final String sku = "testsku";
        final String forUser = "testObfuscatedUser";
        /*
        final dynamic result = {
          "transactionDate": "1552824902000",
          "transactionId": "testTransactionId",
          "productId": "com.cooni.point1000",
          "transactionReceipt": "testTransactionReciept",
          "purchaseToken": "testPurchaseToken",
          "autoRenewingAndroid": true,
          "dataAndroid": "testDataAndroid",
          "signatureAndroid": "testSignatureAndroid",
          "originalTransactionDateIOS": "1552831136000",
          "originalTransactionIdentifierIOS":
              "testOriginalTransactionIdentifierIOS"
        };
         */

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "ios")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return null;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.requestPurchase(
            sku,
            obfuscatedAccountId: forUser,
          );
          expect(log, <Matcher>[
            isMethodCall(
              'buyProduct',
              arguments: <String, dynamic>{
                'sku': sku,
                'forUser': forUser,
              },
            ),
          ]);
        });

        test('returns correct result', () async {
          expect(await FlutterInappPurchase.instance.requestSubscription(sku),
              null);
        });
      });
    });

    group('acknowledgePurchaseAndroid', () {
      group('for Android', () {
        final List<MethodCall> log = <MethodCall>[];
        final String token = "testToken";

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "android")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return null;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.acknowledgePurchaseAndroid(token);
          expect(log, <Matcher>[
            isMethodCall(
              'acknowledgePurchase',
              arguments: <String, dynamic>{
                'token': token,
              },
            ),
          ]);
        });

        test('returns correct result', () async {
          expect(
              await FlutterInappPurchase.instance
                  .acknowledgePurchaseAndroid(token),
              null);
        });
      });
    });

    group('consumePurchaseAndroid', () {
      group('for Android', () {
        final List<MethodCall> log = <MethodCall>[];
        final String token = "testToken";

        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "android")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return null;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.consumePurchaseAndroid(token);
          expect(log, <Matcher>[
            isMethodCall('consumeProduct', arguments: <String, dynamic>{
              'token': token,
            }),
          ]);
        });

        test('returns correct result', () async {
          expect(
              await FlutterInappPurchase.instance.consumePurchaseAndroid(token),
              null);
        });
      });
    });

    group('endConnection', () {
      group('for Android', () {
        final List<MethodCall> log = <MethodCall>[];
        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "android")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return "Billing client has ended.";
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.finalize();
          expect(log, <Matcher>[
            isMethodCall('endConnection', arguments: null),
          ]);
        });

        test('returns correct result', () async {
          expect(await FlutterInappPurchase.instance.finalize(),
              "Billing client has ended.");
        });
      });

      group('for iOS', () {
        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "ios")));
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('returns correct result', () async {
          expect(await FlutterInappPurchase.instance.finalize(),
              "Billing client has ended.");
        });
      });
    });

    group('finishTransactionIOS', () {
      group('for iOS', () {
        final List<MethodCall> log = <MethodCall>[];
        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "ios")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return null;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance
              .finishTransactionIOS('purchase_token_111');
          expect(log, <Matcher>[
            isMethodCall('finishTransaction', arguments: <String, dynamic>{
              'transactionIdentifier': 'purchase_token_111',
            }),
          ]);
        });

        test('returns correct result', () async {
          expect(
            await FlutterInappPurchase.instance
                .finishTransactionIOS('purchase_token_111'),
            null,
          );
        });
      });
    });
    group('getAppStoreInitiatedProducts', () {
      group('for Android', () {
        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "android")));
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('returns correct result', () async {
          expect(
              await FlutterInappPurchase.instance
                  .getAppStoreInitiatedProducts(),
              <IAPItem>[]);
        });
      });

      group('for iOS', () {
        final List<MethodCall> log = <MethodCall>[];

        final dynamic result = [
          {
            "productId": "com.cooni.point1000",
            "price": "120",
            "currency": "JPY",
            "localizedPrice": "¥120",
            "title": "1,000",
            "description": "1000 points 1000P",
            "introductoryPrice": "1001",
            "introductoryPricePaymentModeIOS": "1002",
            "introductoryPriceNumberOfPeriodsIOS": "1003",
            "introductoryPriceSubscriptionPeriodIOS": "1004",
            "subscriptionPeriodUnitIOS": "1",
            "subscriptionPeriodAndroid": "2",
            "subscriptionPeriodNumberIOS": "3",
            "introductoryPriceCyclesAndroid": 4,
            "introductoryPricePeriodAndroid": "5",
            "freeTrialPeriodAndroid": "6"
          }
        ];
        setUp(() {
          FlutterInappPurchase(FlutterInappPurchase.private(
              FakePlatform(operatingSystem: "ios")));

<<<<<<< HEAD
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
=======
          FlutterInappPurchase.channel
              .setMockMethodCallHandler((MethodCall methodCall) async {
>>>>>>> new-version
            log.add(methodCall);
            return result;
          });
        });

        tearDown(() {
          FlutterInappPurchase.channel.setMethodCallHandler(null);
        });

        test('invokes correct method', () async {
          await FlutterInappPurchase.instance.getAppStoreInitiatedProducts();
          expect(log, <Matcher>[
            isMethodCall('getAppStoreInitiatedProducts', arguments: null),
          ]);
        });

        test('returns correct result', () async {
          List<IAPItem> products = await FlutterInappPurchase.instance
              .getAppStoreInitiatedProducts();
          List<IAPItem>? expected = result
              .map<IAPItem>(
                (product) => IAPItem.fromJSON(product as Map<String, dynamic>),
              )
              .toList();
          for (var i = 0; i < products.length; ++i) {
            var product = products[i];
            var expectedProduct = expected![i];
            expect(product.productId, expectedProduct.productId);
            expect(product.price, expectedProduct.price);
            expect(product.currency, expectedProduct.currency);
            expect(product.localizedPrice, expectedProduct.localizedPrice);
            expect(product.title, expectedProduct.title);
            expect(product.description, expectedProduct.description);
            expect(
                product.introductoryPrice, expectedProduct.introductoryPrice);
            expect(product.subscriptionPeriodNumberIOS,
                expectedProduct.subscriptionPeriodNumberIOS);
            expect(product.introductoryPricePaymentModeIOS,
                expectedProduct.introductoryPricePaymentModeIOS);
            expect(product.introductoryPriceNumberOfPeriodsIOS,
                expectedProduct.introductoryPriceNumberOfPeriodsIOS);
            expect(product.introductoryPriceSubscriptionPeriodIOS,
                expectedProduct.introductoryPriceSubscriptionPeriodIOS);
<<<<<<< HEAD
            // expect(product.subscriptionPeriodAndroid,
            //     expectedProduct.subscriptionPeriodAndroid);
            // expect(product.introductoryPriceCyclesAndroid,
            //     expectedProduct.introductoryPriceCyclesAndroid);
            // expect(product.introductoryPricePeriodAndroid,
            //     expectedProduct.introductoryPricePeriodAndroid);
            // expect(product.freeTrialPeriodAndroid,
            //     expectedProduct.freeTrialPeriodAndroid);
=======
            expect(product.subscriptionPeriodAndroid,
                expectedProduct.subscriptionPeriodAndroid);
            expect(product.introductoryPriceCyclesAndroid,
                expectedProduct.introductoryPriceCyclesAndroid);
            expect(product.introductoryPricePeriodAndroid,
                expectedProduct.introductoryPricePeriodAndroid);
            expect(product.freeTrialPeriodAndroid,
                expectedProduct.freeTrialPeriodAndroid);
>>>>>>> new-version
          }
        });
      });
    });
    group('checkSubscribed', () {
      // FIXME
      // This method can't be tested, because this method calls static methods internally.
      // To test, it needs to change static method to non-static method.
    });

    group('validateReceiptAndroid', () {
      setUp(() {
<<<<<<< HEAD
        FlutterInappPurchase(FlutterInappPurchase.private(
            FakePlatform(operatingSystem: "android")));
=======
        http.Client mockClient = MockClient((request) async {
          return Response(json.encode({}), 200);
        });

        FlutterInappPurchase(FlutterInappPurchase.private(
            FakePlatform(operatingSystem: "android"),
            client: mockClient));
>>>>>>> new-version
      });

      tearDown(() {
        FlutterInappPurchase.channel.setMethodCallHandler(null);
      });

      test('returns correct http request url, isSubscription is true',
          () async {
        final String packageName = "testpackege";
        final String productId = "testProductId";
        final String productToken = "testProductToken";
        final String accessToken = "testAccessToken";
        final String type = "subscriptions";
        final response = await FlutterInappPurchase.instance
            .validateReceiptAndroid(
                packageName: packageName,
                productId: productId,
                productToken: productToken,
                accessToken: accessToken,
                isSubscription: true);
        expect(response.request!.url.toString(),
            "https://www.googleapis.com/androidpublisher/v3/applications/$packageName/purchases/$type/$productId/tokens/$productToken?access_token=$accessToken");
      });
      test('returns correct http request url, isSubscription is false',
          () async {
        final String packageName = "testpackege";
        final String productId = "testProductId";
        final String productToken = "testProductToken";
        final String accessToken = "testAccessToken";
        final String type = "products";
        final response = await FlutterInappPurchase.instance
            .validateReceiptAndroid(
                packageName: packageName,
                productId: productId,
                productToken: productToken,
                accessToken: accessToken,
                isSubscription: false);
        expect(response.request!.url.toString(),
            "https://www.googleapis.com/androidpublisher/v3/applications/$packageName/purchases/$type/$productId/tokens/$productToken?access_token=$accessToken");
      });
    });

    group('validateReceiptIos', () {
      final receiptBody = {
        'receipt-data': 'purchasedItem.transactionReceipt',
        'password': 'apple_password'
      };

      setUp(() {
<<<<<<< HEAD
        FlutterInappPurchase(FlutterInappPurchase.private(
          FakePlatform(operatingSystem: "ios"),
=======
        http.Client mockClient = MockClient((request) async {
          return Response(json.encode({'status': 0}), 200);
        });

        FlutterInappPurchase(FlutterInappPurchase.private(
          FakePlatform(operatingSystem: "ios"),
          client: mockClient,
>>>>>>> new-version
        ));
      });

      tearDown(() {
        FlutterInappPurchase.channel.setMethodCallHandler(null);
      });

      test('returns correct http request url in sandbox', () async {
        final response = await FlutterInappPurchase.instance.validateReceiptIos(
          receiptBody: receiptBody,
          isTest: true,
        );

        expect(
          response.request!.url.toString(),
          "https://sandbox.itunes.apple.com/verifyReceipt",
        );
<<<<<<< HEAD
=======
        expect(response.statusCode, 200);
        final data = jsonDecode(response.body);
        expect(data['status'], 0);
>>>>>>> new-version
      });

      test('returns correct http request url in production', () async {
        final response = await FlutterInappPurchase.instance.validateReceiptIos(
          receiptBody: receiptBody,
          isTest: false,
        );

        expect(
          response.request!.url.toString(),
          "https://buy.itunes.apple.com/verifyReceipt",
        );
<<<<<<< HEAD
=======
        expect(response.statusCode, 200);
        final data = jsonDecode(response.body);
        expect(data['status'], 0);
>>>>>>> new-version
      });
    });
  });
}
