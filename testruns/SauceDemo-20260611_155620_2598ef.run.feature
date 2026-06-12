@testrun @tr-5
Feature: SauceDemo-20260611_155620_2598ef

  Background:
    * field project = SauceDemo
    * field component = microservicio-7
    * field startDate = 2026-06-15
    * field endDate = 2026-06-18


  Rule: SauceDemo/cart.case.feature

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

  Rule: SauceDemo/login.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

    Scenario: @tc-03
      * link status = pending

  Rule: SauceDemo/products.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

    Scenario: @tc-03
      * link status = pending