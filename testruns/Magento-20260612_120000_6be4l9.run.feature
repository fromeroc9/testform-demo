@testrun @tr-6
Feature: Magento-20260612_120000_6be4l9

  Background:
    * field project = Magento
    * field component = microservicio-1
    * field startDate = 2026-06-12
    * field endDate = 2026-06-19

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

  Rule: Magento/cart.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

  Rule: Magento/customer.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending