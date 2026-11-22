@tr-20 @testrun
Feature: SauceDemo-20260612_120002_gp1yim

  Background:
    * field project = SauceDemo
    * field startDate = 2026-06-12
    * field endDate = 2026-06-19
    * field component = microservicio-7

  Rule: SauceDemo/products.case.feature

    Scenario: @tc-01
      * set status = failed

    Scenario: @tc-02
      * set status = pending

    Scenario: @tc-03
      * set status = skipped

  Rule: SauceDemo/checkout.case.feature

    Scenario: @tc-01
      * set status = passed

    Scenario: @tc-02
      * set status = failed

    Scenario: @tc-03
      * set status = passed

  Rule: SauceDemo/cart.case.feature

    Scenario: @tc-01
      * set status = passed

    Scenario: @tc-02
      * set status = passed

    Scenario: @tc-03
      * set status = skipped

  Rule: SauceDemo/login.case.feature

    Scenario: @tc-01
      * set status = skipped

    Scenario: @tc-02
      * set status = blocked

    Scenario: @tc-03
      * set status = skipped
