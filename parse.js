#! /bin/env node
"use strict";
exports.__esModule = true;
var fs = require("fs");
var https = require('https');
var data = '';
https.get('https://api.covid19api.com/summary', function (res) {
    res.on('data', function (chunk) {
        data += chunk;
        // console.log('data', data);
    });
    res.on('end', function () {
        var getCovidData = JSON.parse(data);
        // console.log(getCovidData);
        var countries = getCovidData.Countries;
        var fields = Object.keys(countries[0]);
        // console.log(fields);
        var replacer = function (key, value) { return value === null ? '' : value; };
        var csv = countries.map(function (row) {
            return fields.map(function (fieldName) {
                return JSON.stringify(row[fieldName], replacer);
            }).join(',');
        });
        csv.unshift(fields.join(','));
        var convertedCSV = csv.join('\r\n');
        // console.log(csv)
        fs.writeFileSync("./build/countries.txt", convertedCSV);
    });
});
// var json = fs.readFileSync("./data/summary.json").toString()
// console.log(getCovidData);
// var countries = getCovidData.Countries;
// var fields = Object.keys(countries[0])
// console.log(fields);
// var replacer = function(key: any, value: any) { return value === null ? '' : value } 
// var csv = countries.map(function(row: { [x: string]: any; }){
//   return fields.map(function(fieldName){
//     return JSON.stringify(row[fieldName], replacer)
//   }).join(',')
// })
// csv.unshift(fields.join(','))
// const convertedCSV = csv.join('\r\n');
// // console.log(csv)
// fs.writeFileSync("./build/countries.txt", convertedCSV)
