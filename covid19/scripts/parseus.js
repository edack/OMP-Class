#! /bin/env node
"use strict";
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
var fs = __importStar(require("fs"));
var https = require('https');
var data = '';
https.get('https://api.covidtracking.com/v1/us/daily.json', function (res) {
    res.on('data', function (chunk) {
        data += chunk;
        //    console.log('data', data);
    });
    res.on('end', function () {
        var getCovidData = JSON.parse(data);
        var date = getCovidData;
        var fields = Object.keys(date[0]);
        //    console.log(fields)
        var replacer = function (key, value) { return value === null ? '' : value; };
        var csv = date.map(function (row) {
            return fields.map(function (fieldName) {
                return JSON.stringify(row[fieldName], replacer);
            }).join(',');
        });
        csv.unshift(fields.join(','));
        var convertedCSV = csv.join('\r\n');
        // console.log(csv)
        fs.writeFileSync("./build/usahist.txt", convertedCSV);
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
