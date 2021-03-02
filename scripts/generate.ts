#! /bin/env node
import * as config from "config";
import * as mustache from "mustache";
import * as fs from "fs";

/* Render Data alloc template */
const allocate_template = fs.readFileSync("./src/templates/AllocDat_Template.txt").toString();
const rendered_allocate_template = mustache.render(allocate_template, config);

if (!fs.existsSync("./build")) fs.mkdirSync("./build");
fs.writeFileSync("./build/allocdata.bat", rendered_allocate_template);
console.log('Generated custom data allocation BAT to ./build/allocdata.bat');

/* Render UloadDat_template */
const ulbatfile = fs.readFileSync("./src/templates/UloadDat_template.txt").toString();
const rendered_ulbatfile = mustache.render(ulbatfile, config);

if (!fs.existsSync("./build")) fs.mkdirSync("./build");
fs.writeFileSync("./build/uploaddat.bat", rendered_ulbatfile);
console.log("Generated custom data upload BAT to ./build/uploaddat.bat");

/* Render UloadCbl_template */
const batfile = fs.readFileSync("./src/templates/UloadCbl_template.txt").toString();
const rendered_batfile = mustache.render(batfile, config);

if (!fs.existsSync("./build")) fs.mkdirSync("./build");
fs.writeFileSync("./build/uploadcbl.bat", rendered_batfile);
console.log("Generated custom cbl upload BAT to ./build/uploadcbl.bat");

/* Render Compiler.JCL including BAT file*/
const clbat = fs.readFileSync("./src/templates/compile_template.txt").toString();
const rendered_clbat = mustache.render(clbat, config);

if (!fs.existsSync("./build")) fs.mkdirSync("./build");
fs.writeFileSync("./build/compiler.bat", rendered_clbat);

const compiler = fs.readFileSync("./src/templates/cobcl_template.txt").toString();
const rendered_compiler = mustache.render(compiler, config);

if (!fs.existsSync("./build")) fs.mkdirSync("./build");
fs.writeFileSync("./build/compiler.jcl", rendered_compiler);
console.log("Generated custom JCL to ./build/compiler.jcl");

/* Render Run JCL including BAT file*/
const runjob1 = fs.readFileSync("./src/templates/jobrun_template.txt").toString();
const rendered_runjob1 = mustache.render(runjob1, config);

if (!fs.existsSync("./build")) fs.mkdirSync("./build");
fs.writeFileSync("./build/runjob.bat", rendered_runjob1);

const runjob = fs.readFileSync("./src/templates/runjob_template.txt").toString();
const rendered_runjob = mustache.render(runjob, config);

if (!fs.existsSync("./build")) fs.mkdirSync("./build");
fs.writeFileSync("./build/runjob.jcl", rendered_runjob);
console.log("Generated custom JCL to ./build/runjob.jcl");

/* Render Source Program first part */
const source = fs.readFileSync("./cbl/skeleton.cbl").toString();
const rendered_source = mustache.render(source, config);
fs.writeFileSync("./build/source.cbl", rendered_source);

/* Render Source Program second part */
const source2 = fs.readFileSync("./build/source.cbl").toString();
const rendered_cobol = mustache.render(source2, config);
fs.writeFileSync("./build/source.cbl", rendered_cobol);

console.log("Generated COBOL program to ./build/source.cbl");
/* */
