@testrun @tr-10
Feature: OpenCart-20260612_120001_lcte3d

  Background:
    * field project = OpenCart
    * field component = microservicio-3
    * field startDate = 2026-06-12
    * field endDate = 2026-06-19

  Rule: OpenCart/account.case.feature

    Scenario: @tc-01
      * link status = pending

  Rule: OpenCart/checkout.case.feature

    Scenario: @tc-01
      * link status = pending

  Rule: OpenCart/shopping.case.feature

    Scenario: @tc-01
      * link status = pending

  Rule: OpenCart/cart.case.feature

    Scenario: @tc-01
      * link status = pending

