@testrun @tr-15
Feature: ParaBank-20260612_120000_7l14q3

  Background:
    * field project = ParaBank
    * field component = microservicio-4
    * field startDate = 2026-06-12
    * field endDate = 2026-06-19

  Rule: ParaBank/register_login.case.feature

    Scenario: @tc-01
      * mark status = pending

    Scenario: @tc-02
      * mark status = pending

    Scenario: @tc-03
      * mark status = pending

  Rule: ParaBank/transactions.case.feature

    Scenario: @tc-01
      * mark status = pending

    Scenario: @tc-02
      * mark status = pending

  Rule: ParaBank/account_services.case.feature

    Scenario: @tc-01
      * mark status = pending

    Scenario: @tc-02
      * mark status = pending

  Rule: ParaBank/loan.case.feature

    Scenario: @tc-01
      * mark status = pending

    Scenario: @tc-02
      * mark status = pending