@testrun @tr-2
Feature: OpenCart-20260611_155551_34d41d

  Background:
    * field project = OpenCart
    * field component = microservicio-3
    * field startDate = 2026-06-10
    * field endDate = 2026-06-18


  Rule: OpenCart/account.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

    Scenario: @tc-03
      * link status = pending

  Rule: OpenCart/cart.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

  Rule: OpenCart/checkout.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

  Rule: OpenCart/shopping.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending