Feature: Kung-fu with Jira using Karate

  Background: 
    * def contextJson = callonce {}
    * url jiraXUrl
    * header Authorization =  GetAuth("mfuser@mailinator.com","vI2jQxpEhCxXMBb4XOCV9F62")
    * header Content-Type = 'application/json'

  Scenario: Create a New Jira Issue
    Given path '/issue'
    And header Authorization =  GetAuth("prsp","prsp")
    And header Content-Type = 'application/json'
      And request {'fields':{'project':{'key':'TEST'},'summary':'Karate Jira Issue','description':'Issue created by Karate','issuetype':{'name':'Bug'}}}
     When method POST
     Then status 201
      And def resp = $
      And match resp.id == "#notnull"
      And match resp.key == "#notnull"
      And match resp.self == "#regex .*"+resp.id


 #Scenario: 
    #Given  def contextJson = ReadOp('json')
    #And  path '/issue/'+ contextJson.key
      #And request {"fields": {"summary":"Edited by Karate summary",}}
     #When method PUT
     #Then status 204


  Scenario Outline: 
    Given path '/issue/<IssueKey>'
    And request {"fields": {"summary":<NewSummary>,}}
     When method PUT
     Then status 204
    Examples: 
      | IssueKey     | NewSummary       |
      | TEST-1        | sensible summary |
      | TEST-2        | sensible summary |
      | TEST-3        | sensible summary |
      | read('data.csv') |
      

  Scenario Outline: 
    Given path '/issue/<IssueKey>'
     When method GET
     Then status 200
     And match $.fields.summary == "<ExpSummary>"

    Examples: 
      | read('data.csv') |
      #| IssueKey | ExpSummary          |
      #| TEST-1    | sensible summary |
      #| TEST-2    | sensible summary |
      #| TEST-3    | sensible summary |
