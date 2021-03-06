function fn() {
	var env = karate.env; // get system property 'karate.env'
	karate.log('karate.env system property was:', env);
	if (!env) {
		env = 'dev';
	}
	var config = {
		env : env,
		draUrl : 'https://vlab007362.drdom030.lab/draclient/rest/RestProxy.svc',
		jiraUrl : 'http://164.99.103.135:9090/rest/api/latest',
		jiraXUrl : 'https://zeera.atlassian.net/rest/api/latest',
	}
	if (env == 'dev') {
		// customize
		// e.g. config.foo = 'bar';
	} else if (env == 'e2e') {
		// customize
	}
	return config;
}

function GetAuth(username, password) {
	var temp = username + ':' + password;
	var Base64 = Java.type('java.util.Base64');
	var encoded = Base64.getEncoder().encodeToString(temp.bytes);
	return 'Basic ' + encoded;
}

function WriteOp(json, name){
    var jsonPath =  java.lang.System.getenv('TEMP')+'/'+name+'.json';

    karate.write(json, jsonPath); 
    karate.log('saved json to:', jsonPath);
}
function ReadOp(name){
    var jsonPath =  name+'.json';

    var json = karate.read(json, jsonPath); 
    karate.log('json : ', json);
    return json;
}