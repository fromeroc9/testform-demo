@testrun @tr-1
Feature: Magento-20260611_155546_5f736a

  Background:
    * field project = Magento
    * field component = microservicio-1
    * field startDate = 2026-06-11
    * field endDate = 2026-06-11

  Rule: Magento/cart.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

  Rule: Magento/catalog.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

  Rule: Magento/checkout.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

  Rule: Magento/customer.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending