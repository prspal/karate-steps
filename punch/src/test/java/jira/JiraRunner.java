package jira;

import com.intuit.karate.junit5.Karate;

class JiraRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("JiraRest").relativeTo(getClass());
    }    

}
