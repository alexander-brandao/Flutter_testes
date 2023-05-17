import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_http.mocks.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {

  final MockBankHttp httpMock = MockBankHttp();


  //test for text "Spent" in the widget
  testWidgets('My widget has a text "Spent"', (widgetTester) async {
    when(httpMock.dolarToReal())
        .thenAnswer((realInvocation) async => ('5'));
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
          child: Home(
        api: httpMock.dolarToReal(),
      )),
    ));
    final spentFinder = find.text('Spent');
    expect(spentFinder, findsOneWidget);
  });
  // test for a full widget "LinearProgressIndicator"
  testWidgets('finds a LinearProgressIndicator', (widgetTester) async {

    when(httpMock.dolarToReal())
        .thenAnswer((realInvocation) async => ('5'));
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
          child: Home(
        api: httpMock.dolarToReal(),
      )),
    ));
    final widgetFinder = find.byType(LinearProgressIndicator);
    expect(widgetFinder, findsOneWidget);
  });
  // test for a widget by key
  testWidgets('finds a AccountStatus', (widgetTester) async {
    when(httpMock.dolarToReal())
        .thenAnswer((realInvocation) async => ('5'));
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
          child: Home(
        api: httpMock.dolarToReal(),
      )),
    ));
    final widgetFinder = find.byKey(const Key('testKey'));
    expect(widgetFinder, findsOneWidget);
  });
  //test for find 5 widgets BoxCards
  testWidgets('finds 5 BoxCards', (widgetTester) async {
    when(httpMock.dolarToReal())
        .thenAnswer((realInvocation) async => ('5'));
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
          child: Home(
        api: httpMock.dolarToReal(),
      )),
    ));
    expect(find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      } else {
        return false;
      }
    }), findsNWidgets(5));
  });

  testWidgets('Testing MockHttp dolarToReal', (widgetTester) async {
    when(httpMock.dolarToReal())
        .thenAnswer((realInvocation) async => ('5'));
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
          child: Home(
            api: httpMock.dolarToReal(),
          )),
    ));
    verify(httpMock.dolarToReal()).called(5);
  });

}
