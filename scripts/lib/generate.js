#! /bin/env node
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const config = require("config");
const mustache = require("mustache");
const fs = require("fs");
const allocate_template = fs.readFileSync("./src/templates/AllocDat_Template.txt").toString();
const rendered_allocate_template = mustache.render(allocate_template, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/allocdata.bat", rendered_allocate_template);
console.log('Generated custom data allocation BAT to ./build/allocdata.bat');
const ulbatfile = fs.readFileSync("./src/templates/UloadDat_template.txt").toString();
const rendered_ulbatfile = mustache.render(ulbatfile, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/uploaddat.bat", rendered_ulbatfile);
console.log("Generated custom data upload BAT to ./build/uploaddat.bat");
const batfile = fs.readFileSync("./src/templates/UloadCbl_template.txt").toString();
const rendered_batfile = mustache.render(batfile, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/uploadcbl.bat", rendered_batfile);
console.log("Generated custom cbl upload BAT to ./build/uploadcbl.bat");
const clbat = fs.readFileSync("./src/templates/compile_template.txt").toString();
const rendered_clbat = mustache.render(clbat, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/compiler.bat", rendered_clbat);
const compiler = fs.readFileSync("./src/templates/cobcl_template.txt").toString();
const rendered_compiler = mustache.render(compiler, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/compiler.jcl", rendered_compiler);
console.log("Generated custom JCL to ./build/compiler.jcl");
const runjob1 = fs.readFileSync("./src/templates/jobrun_template.txt").toString();
const rendered_runjob1 = mustache.render(runjob1, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/runjob.bat", rendered_runjob1);
const runjob = fs.readFileSync("./src/templates/runjob_template.txt").toString();
const rendered_runjob = mustache.render(runjob, config);
if (!fs.existsSync("./build"))
    fs.mkdirSync("./build");
fs.writeFileSync("./build/runjob.jcl", rendered_runjob);
console.log("Generated custom JCL to ./build/runjob.jcl");
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZ2VuZXJhdGUuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi9nZW5lcmF0ZS50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7QUFDQSxpQ0FBaUM7QUFDakMscUNBQXFDO0FBQ3JDLHlCQUF5QjtBQUd6QixNQUFNLGlCQUFpQixHQUFHLEVBQUUsQ0FBQyxZQUFZLENBQUMsdUNBQXVDLENBQUMsQ0FBQyxRQUFRLEVBQUUsQ0FBQztBQUM5RixNQUFNLDBCQUEwQixHQUFHLFFBQVEsQ0FBQyxNQUFNLENBQUMsaUJBQWlCLEVBQUUsTUFBTSxDQUFDLENBQUM7QUFFOUUsSUFBSSxDQUFDLEVBQUUsQ0FBQyxVQUFVLENBQUMsU0FBUyxDQUFDO0lBQUUsRUFBRSxDQUFDLFNBQVMsQ0FBQyxTQUFTLENBQUMsQ0FBQztBQUN2RCxFQUFFLENBQUMsYUFBYSxDQUFDLHVCQUF1QixFQUFFLDBCQUEwQixDQUFDLENBQUM7QUFDdEUsT0FBTyxDQUFDLEdBQUcsQ0FBQywrREFBK0QsQ0FBQyxDQUFDO0FBRzdFLE1BQU0sU0FBUyxHQUFHLEVBQUUsQ0FBQyxZQUFZLENBQUMsdUNBQXVDLENBQUMsQ0FBQyxRQUFRLEVBQUUsQ0FBQztBQUN0RixNQUFNLGtCQUFrQixHQUFHLFFBQVEsQ0FBQyxNQUFNLENBQUMsU0FBUyxFQUFFLE1BQU0sQ0FBQyxDQUFDO0FBRTlELElBQUksQ0FBQyxFQUFFLENBQUMsVUFBVSxDQUFDLFNBQVMsQ0FBQztJQUFFLEVBQUUsQ0FBQyxTQUFTLENBQUMsU0FBUyxDQUFDLENBQUM7QUFDdkQsRUFBRSxDQUFDLGFBQWEsQ0FBQyx1QkFBdUIsRUFBRSxrQkFBa0IsQ0FBQyxDQUFDO0FBQzlELE9BQU8sQ0FBQyxHQUFHLENBQUMsMkRBQTJELENBQUMsQ0FBQztBQUd6RSxNQUFNLE9BQU8sR0FBRyxFQUFFLENBQUMsWUFBWSxDQUFDLHVDQUF1QyxDQUFDLENBQUMsUUFBUSxFQUFFLENBQUM7QUFDcEYsTUFBTSxnQkFBZ0IsR0FBRyxRQUFRLENBQUMsTUFBTSxDQUFDLE9BQU8sRUFBRSxNQUFNLENBQUMsQ0FBQztBQUUxRCxJQUFJLENBQUMsRUFBRSxDQUFDLFVBQVUsQ0FBQyxTQUFTLENBQUM7SUFBRSxFQUFFLENBQUMsU0FBUyxDQUFDLFNBQVMsQ0FBQyxDQUFDO0FBQ3ZELEVBQUUsQ0FBQyxhQUFhLENBQUMsdUJBQXVCLEVBQUUsZ0JBQWdCLENBQUMsQ0FBQztBQUM1RCxPQUFPLENBQUMsR0FBRyxDQUFDLDBEQUEwRCxDQUFDLENBQUM7QUFHeEUsTUFBTSxLQUFLLEdBQUcsRUFBRSxDQUFDLFlBQVksQ0FBQyxzQ0FBc0MsQ0FBQyxDQUFDLFFBQVEsRUFBRSxDQUFDO0FBQ2pGLE1BQU0sY0FBYyxHQUFHLFFBQVEsQ0FBQyxNQUFNLENBQUMsS0FBSyxFQUFFLE1BQU0sQ0FBQyxDQUFDO0FBRXRELElBQUksQ0FBQyxFQUFFLENBQUMsVUFBVSxDQUFDLFNBQVMsQ0FBQztJQUFFLEVBQUUsQ0FBQyxTQUFTLENBQUMsU0FBUyxDQUFDLENBQUM7QUFDdkQsRUFBRSxDQUFDLGFBQWEsQ0FBQyxzQkFBc0IsRUFBRSxjQUFjLENBQUMsQ0FBQztBQUd6RCxNQUFNLFFBQVEsR0FBRyxFQUFFLENBQUMsWUFBWSxDQUFDLG9DQUFvQyxDQUFDLENBQUMsUUFBUSxFQUFFLENBQUM7QUFDbEYsTUFBTSxpQkFBaUIsR0FBRyxRQUFRLENBQUMsTUFBTSxDQUFDLFFBQVEsRUFBRSxNQUFNLENBQUMsQ0FBQztBQUU1RCxJQUFJLENBQUMsRUFBRSxDQUFDLFVBQVUsQ0FBQyxTQUFTLENBQUM7SUFBRSxFQUFFLENBQUMsU0FBUyxDQUFDLFNBQVMsQ0FBQyxDQUFDO0FBQ3ZELEVBQUUsQ0FBQyxhQUFhLENBQUMsc0JBQXNCLEVBQUUsaUJBQWlCLENBQUMsQ0FBQztBQUM1RCxPQUFPLENBQUMsR0FBRyxDQUFDLDhDQUE4QyxDQUFDLENBQUM7QUFHNUQsTUFBTSxPQUFPLEdBQUcsRUFBRSxDQUFDLFlBQVksQ0FBQyxxQ0FBcUMsQ0FBQyxDQUFDLFFBQVEsRUFBRSxDQUFDO0FBQ2xGLE1BQU0sZ0JBQWdCLEdBQUcsUUFBUSxDQUFDLE1BQU0sQ0FBQyxPQUFPLEVBQUUsTUFBTSxDQUFDLENBQUM7QUFFMUQsSUFBSSxDQUFDLEVBQUUsQ0FBQyxVQUFVLENBQUMsU0FBUyxDQUFDO0lBQUUsRUFBRSxDQUFDLFNBQVMsQ0FBQyxTQUFTLENBQUMsQ0FBQztBQUN2RCxFQUFFLENBQUMsYUFBYSxDQUFDLG9CQUFvQixFQUFFLGdCQUFnQixDQUFDLENBQUM7QUFFekQsTUFBTSxNQUFNLEdBQUcsRUFBRSxDQUFDLFlBQVksQ0FBQyxxQ0FBcUMsQ0FBQyxDQUFDLFFBQVEsRUFBRSxDQUFDO0FBQ2pGLE1BQU0sZUFBZSxHQUFHLFFBQVEsQ0FBQyxNQUFNLENBQUMsTUFBTSxFQUFFLE1BQU0sQ0FBQyxDQUFDO0FBRXhELElBQUksQ0FBQyxFQUFFLENBQUMsVUFBVSxDQUFDLFNBQVMsQ0FBQztJQUFFLEVBQUUsQ0FBQyxTQUFTLENBQUMsU0FBUyxDQUFDLENBQUM7QUFDdkQsRUFBRSxDQUFDLGFBQWEsQ0FBQyxvQkFBb0IsRUFBRSxlQUFlLENBQUMsQ0FBQztBQUd4RCxPQUFPLENBQUMsR0FBRyxDQUFDLDRDQUE0QyxDQUFDLENBQUMifQ==