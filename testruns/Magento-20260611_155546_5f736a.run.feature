@testrun @tr-1
Feature: Magento-20260611_155546_5f736a

  Background:
    * field project = Magento
    * field component = microservicio-1
    * field startDate = 2026-06-11
    * field endDate = 2026-06-11
    * field Status = skipped
  
  Rule: Magento/cart.case.feature

    Scenario: @tc-01
      * set status = passed

    Scenario: @tc-02
      * set status = passed

  Rule: Magento/catalog.case.feature

    Scenario: @tc-01
      * set status = passed

    Scenario: @tc-02
      * set status = passed

  Rule: Magento/checkout.case.feature

    Scenario: @tc-01
      * set status = passed

    Scenario: @tc-02
      * set status = passed

  Rule: Magento/customer.case.feature

    Scenario: @tc-01
      * set status = passed

    Scenario: @tc-02
      * set status = passed
