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
var config = __importStar(require("config"));
var mustache = __importStar(require("mustache"));
var fs = __importStar(require("fs"));
/* Render Compiler.JCL */
var compiler = fs.readFileSync("./src/templates/compiler_template.txt").toString();
var rendered_compiler = mustache.render(compiler, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/compiler.jcl", rendered_compiler);
console.log("Generated custom JCL to ./build/compiler.jcl");
/* Render Source Program Part 1*/
var source = fs.readFileSync("./build/source.cbl").toString();
var rendered_source = mustache.render(source, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/source.cbl", rendered_source);
var source2 = fs.readFileSync("./build/source.cbl").toString();
var rendered_cobol = mustache.render(source2, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/source.cbl", rendered_cobol);
console.log("Generated COBOL program to ./build/source.cbl");
/* Render Run JCL */
var runjob = fs.readFileSync("./src/templates/runjob_template.txt").toString();
var rendered_runjob = mustache.render(runjob, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/runjob.jcl", rendered_runjob);
console.log("Generated custom JCL to ./build/runjob.jcl");
