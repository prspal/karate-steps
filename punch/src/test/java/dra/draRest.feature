Feature: DRA REST Testing
Background:
* configure ssl = true

Scenario: Verify login
Given url 'https://vlab007362.drdom030.lab/draclient/rest/RestProxy.svc/dra/login'
And header Content-Type = 'application/json'
And header restservername = 'vlab007362.drdom030.lab'
And header restserverport = 8755

And request {"infoCategories":["ServerInfo","IntegrationInfo","ExtraInfo","TenantsInfo"],"connectionParameters":"eyJ1c2VyTmFtZSI6ImRyZG9tMDMwXFxhZG1pbmlzdHJhdG9yIiwicGFzc3dvcmQiOiJDb250cm9sMTIzIiwiZHJhU2VydmVyTmFtZUFuZFBvcnQiOiJ2bGFiMDA3MzYyLmRyZG9tMDMwLmxhYjoxMTE5MiJ9"}
When method POST	
Then status 200
And match $.serverInfo == "#notnull"