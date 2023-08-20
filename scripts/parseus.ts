#! /bin/env node
import * as fs from "fs";

const https = require('https');
let data = '';

// https.get('https://api.covidtracking.com/v1/us/daily.json', (res: any) => {
https.get('https://data.cdc.gov/resource/9mfq-cb36.json?$limit=65000', (res: any) => {

  res.on('data', (chunk: any) => {
    data += chunk;
//    console.log('data', data);
  });

  res.on('end', () => {c
    const getCovidData = JSON.parse(data);
    var date = getCovidData;
    var fields = Object.keys(date[0]);
//    console.log(fields)
    var replacer = function(key: any, value: any) { return value === null ? '' : value };
    var csv = date.map(function(row: { [x: string]: any; }){
       return fields.map(function(fieldName){
         return JSON.stringify(row[fieldName], replacer)
      }).join(',')
    });
    csv.unshift(fields.join(','));
    const convertedCSV = csv.join('\r\n');
    // console.log(csv)

    fs.writeFileSync("./build/usafile.txt", convertedCSV);

  });

})
