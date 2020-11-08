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
/* Append all 3 Cobol Parts into 1*/
var template = fs.readFileSync("./src/templates/initialize.cbl").toString();
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/source.cbl", template);
console.log('Created COBOL Template');
var process = fs.readFileSync("./src/templates/process.cbl").toString();
fs.appendFile("./build/source.cbl", process, function (err) {
    if (err)
        throw err;
    console.log('Added Process');
});
var closing = fs.readFileSync("./src/templates/closing.cbl").toString();
fs.appendFile("./build/source.cbl", closing, function (err) {
    if (err)
        throw err;
    console.log('Added Closing');
});
