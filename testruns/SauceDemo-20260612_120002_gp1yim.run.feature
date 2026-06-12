@testrun @tr-20
Feature: SauceDemo-20260612_120002_gp1yim

  Background:
    * field project = SauceDemo
    * field component = microservicio-7
    * field startDate = 2026-06-12
    * field endDate = 2026-06-19

  Rule: SauceDemo/products.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

    Scenario: @tc-03
      * link status = pending

  Rule: SauceDemo/checkout.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

    Scenario: @tc-03
      * link status = pending

  Rule: SauceDemo/cart.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

    Scenario: @tc-03
      * link status = pending

  Rule: SauceDemo/login.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

    Scenario: @tc-03
      * link status = pending