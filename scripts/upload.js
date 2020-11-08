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
var child_process_1 = require("child_process");
var fs_1 = require("fs");
var path_1 = require("path");
var hlq = config.get('settings.hlq');
var uploads = config.get('uploads');
Object.keys(uploads).forEach(function (key) {
    var dir = "./zossrc/" + key;
    var files = fs_1.readdirSync(dir);
    files.forEach(function (file) {
        var fileWOutExtension = path_1.basename(file, path_1.extname(file));
        var cmd = "zowe files upload ftds " +
            ("\"" + dir + "/" + file + "\" ") +
            ("\"" + hlq + "." + uploads[key] + "(" + fileWOutExtension + ")\"");
        console.log(cmd);
        child_process_1.exec(cmd, function (err, stdout, stderr) {
            if (err)
                console.log(err);
            if (stdout)
                console.log(stdout.toString());
            if (stderr)
                console.log(stderr.toString());
        });
    });
});
