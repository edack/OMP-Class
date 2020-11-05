#! /bin/env node
import * as fs from "fs";

const https = require('https');
let data = '';

https.get('https://api.covidtracking.com/v1/us/daily.json', (res: any) => {

  res.on('data', (chunk: any) => {
    data += chunk;
//    console.log('data', data);
  });

  res.on('end', () => {
    const getCovidData = JSON.parse(data);
    var row = getCovidData.row;
//    console.log(getCovidData);
    var fields = Object.keys(getCovidData);
//    console.log(fields)

    console.log(getCovidData.row)
    var replacer = function(key: any, value: any) { return value === null ? '' : value };
    var csv = getCovidData.map(function(row: { [x: string]: any; }){
       return fields.map(function(fieldName){
         return JSON.stringify(row[fieldName], replacer)
      }).join(',')
    });
    csv.unshift(fields.join(','));
    const convertedCSV = csv.join('\r\n');
    // console.log(csv)

    fs.writeFileSync("./build/usahist.txt", convertedCSV);

  });

})

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