@testrun @tr-17
Feature: ParaBank-20260612_120002_jziiea

  Background:
    * field project = ParaBank
    * field component = microservicio-4
    * field startDate = 2026-06-12
    * field endDate = 2026-06-19

  Rule: ParaBank/register_login.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

    Scenario: @tc-03
      * link status = pending

  Rule: ParaBank/transactions.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

  Rule: ParaBank/account_services.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending

  Rule: ParaBank/loan.case.feature

    Scenario: @tc-01
      * link status = pending

    Scenario: @tc-02
      * link status = pending