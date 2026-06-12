@testrun @tr-11
Feature: OpenCart-20260612_120002_88b60u

  Background:
    * field project = OpenCart
    * field component = microservicio-3
    * field startDate = 2026-06-12
    * field endDate = 2026-06-19

  Rule: OpenCart/account.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

    Scenario: @tc-03
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

  Rule: OpenCart/cart.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending