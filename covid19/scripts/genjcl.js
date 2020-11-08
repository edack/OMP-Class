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
var compiler = fs.readFileSync("./src/cntl/compiler_template.txt").toString();
var rendered_compiler = mustache.render(compiler, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/compiler.jcl", rendered_compiler);
console.log("Generated custom JCL to ./build/compiler.jcl");
/* Render Source Program Part 1*/
var source = fs.readFileSync("./src/source/helowrld.txt").toString();
var rendered_source = mustache.render(source, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/source.cbl", rendered_source);
console.log("Generated COBOL pgm to ./build/source.cbl");
/* Render Run JCL*/
var runjob = fs.readFileSync("./src/cntl/helotst.txt").toString();
var rendered_runjob = mustache.render(runjob, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/runjob.jcl", rendered_runjob);
console.log("Generated run job to ./build/runjob.jcl");
