@tr-19 @testrun
Feature: SauceDemo-20260612_120001_ah4sw0

  Background:
    * field project = SauceDemo
    * field component = microservicio-7
    * field startDate = 2026-06-12
    * field endDate = 2026-06-19

  Rule: SauceDemo/products.case.feature

    Scenario: @tc-01
      * set status = ambiguous

  Rule: SauceDemo/checkout.case.feature

    Scenario: @tc-01
      * set status = pending

  Rule: SauceDemo/cart.case.feature

    Scenario: @tc-01
      * set status = pending

  Rule: SauceDemo/login.case.feature

    Scenario: @tc-01
      * set status = pending

