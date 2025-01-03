// Mocks generated by Mockito 5.4.4 from annotations
// in tracking_stocks/test/features/data/portfolio_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:tracking_stocks/features/portfolio/data/market_simulator.dart'
    as _i5;
import 'package:tracking_stocks/features/portfolio/data/model/portfolio_response.dart'
    as _i2;
import 'package:tracking_stocks/features/portfolio/data/service/portfolio_service.dart'
    as _i3;
import 'package:tracking_stocks/features/portfolio/domain/model/portfolio.dart'
    as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePortfolioResponse_0 extends _i1.SmartFake
    implements _i2.PortfolioResponse {
  _FakePortfolioResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PortfolioService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPortfolioService extends _i1.Mock implements _i3.PortfolioService {
  MockPortfolioService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.PortfolioResponse> fetchPortfolio() => (super.noSuchMethod(
        Invocation.method(
          #fetchPortfolio,
          [],
        ),
        returnValue:
            _i4.Future<_i2.PortfolioResponse>.value(_FakePortfolioResponse_0(
          this,
          Invocation.method(
            #fetchPortfolio,
            [],
          ),
        )),
      ) as _i4.Future<_i2.PortfolioResponse>);
}

/// A class which mocks [MarketSimulator].
///
/// See the documentation for Mockito's code generation for more information.
class MockMarketSimulator extends _i1.Mock implements _i5.MarketSimulator {
  MockMarketSimulator() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i6.Portfolio> simulateMarket(_i6.Portfolio? portfolio) =>
      (super.noSuchMethod(
        Invocation.method(
          #simulateMarket,
          [portfolio],
        ),
        returnValue: _i4.Stream<_i6.Portfolio>.empty(),
      ) as _i4.Stream<_i6.Portfolio>);
}
