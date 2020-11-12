let handlebars = require('handlebars');
const querystring = require('querystring');

// Helper for check if two values are equals
handlebars.registerHelper('equals',function(value1,value2){
    return value1 == value2;
})


handlebars.registerHelper("equal", require("handlebars-helper-equal"));
// Helper for check if two values are equals with options
handlebars.registerHelper('ifEquals', function(arg1, arg2, options) {
	return arg1 != arg2 ? options.fn(this) : options.inverse(this);
});

// Helper for check if a string is a substring of a string
handlebars.registerHelper('endsWith', function(arg1, arg2, options) {
	return arg1.endsWith(arg2) ? options.fn(this) : options.inverse(this);
});
// Prepared helper for looping on object
handlebars.registerHelper('repeat', require('handlebars-helper-repeat'));

// Prepared helper for date format
handlebars.registerHelper('dateFormat', require('handlebars-dateformat'));

// Increment helper 
handlebars.registerHelper('inc', function(value , options) {
	return parseInt(value) + 1;
});

// Helper for check if two values are equals
handlebars.registerHelper('isEqual',function(val1,val2){
	return val1 == val2;
})
handlebars.registerHelper('isNotEqual',function(val1,val2){
	return val1 != val2;
})


// increment helper with limit
handlebars.registerHelper('incIfPossible',function(val,max){
	if ((val + 2) > max) return max;
	return val + 2;
})

// Decrement helper with limit
handlebars.registerHelper('decIfPossible',function(val,min){
	if ((val) < min) return min;
	return val ;
})
// Helper for url parsing
handlebars.registerHelper('parseLine',function (str) {
	let result = querystring.escape(str);
	return result;
});