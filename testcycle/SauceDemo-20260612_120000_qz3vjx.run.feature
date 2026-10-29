@testrun @tr-18
Feature: SauceDemo-20260612_120000_qz3vjx

  Background:
    * field project = SauceDemo
    * field component = microservicio-7
    * field startDate = 2026-06-12
    * field endDate = 2026-06-19

  Rule: SauceDemo/products.case.feature

    Scenario: @tc-01
      * mark status = pending

    Scenario: @tc-02
      * mark status = pending

    Scenario: @tc-03
      * mark status = pending

  Rule: SauceDemo/checkout.case.feature

    Scenario: @tc-01
      * mark status = pending

    Scenario: @tc-02
      * mark status = pending

    Scenario: @tc-03
      * mark status = pending

  Rule: SauceDemo/cart.case.feature

    Scenario: @tc-01
      * mark status = pending

    Scenario: @tc-02
      * mark status = pending

    Scenario: @tc-03
      * mark status = pending

  Rule: SauceDemo/login.case.feature

    Scenario: @tc-01
      * mark status = pending

    Scenario: @tc-02
      * mark status = pending

    Scenario: @tc-03
      * mark status = pending