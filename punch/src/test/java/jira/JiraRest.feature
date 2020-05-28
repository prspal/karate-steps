Feature: Kung-fu with Jira using Karate

  Background: 
    * url jiraUrl
    * header Authorization =  GetAuth("prsp","prsp")
    * header Content-Type = 'application/json'

  Scenario: Create a New Jira Issue
    Given path '/issue'
    #And header Authorization =  GetAuth("prsp","prsp")
    #And header Content-Type = 'application/json'
      And request {'fields':{'project':{'key':'TES'},'summary':'Karate Jira Issue','description':'Issue created by Karate','issuetype':{'name':'Bug'}}}
     When method POST
     Then status 201
      And def resp = $
      And match resp.id == "#notnull"
      And match resp.key == "#notnull"
      And match resp.self == "#regex .*"+resp.id

  Scenario Outline: 
    Given path '/issue/<IssueKey>'
      And request {"fields": {"summary":<NewSummary>,}}
     When method PUT
     Then status 204
    Examples: 
      | IssueKey | NewSummary       |
      | TES-1    | asfasfdasfdasdf  |
      | TES-2    | sensible summary |

  Scenario Outline: 
    Given path '/issue/<IssueKey>'
     When method GET
     Then status 200
      And match $.fields.summary == "<Summary>"

    Examples: 
      | IssueKey | Summary          |
      | TES-1    | asfasfdasfdasdf  |
      | TES-2    | sensible summary |
