const {src, dest, series, parallel} = require('gulp');
const cmd = require('node-cmd');
const argv = require('yargs').argv;
const rename = require("gulp-rename");
const output_path = 'C:/Users/Lasse/Documents/Dagsordenskabelon/';
const deployment_path = 'Z:/Rusture/2019 Sommer/Formandsgruppen/Dagsordener/';

let pdf;

if (argv.name == undefined) {
  console.log("Angiv navn på mødet med '--name <name>'");
  process.exit();
}

const name = 'Dagsorden_'+argv.name;

function latex(cb){
  cmd.run('latexmk -pdf main.tex');
  cb();
};

function copyLatex() {
  return src('*.tex')
    .pipe(dest(output_path+name+'/'));
};

function copy(){
  if (argv.recompile == undefined) {
    pdf = "main.pdf";
  } else {
    pdf = output_path+name+'/' + name + '.pdf';
  }

  return src(pdf, {base: './'})
    .pipe(rename(name+".pdf"))
    .pipe(dest(output_path+name+'/'))
    .pipe(dest(deployment_path));
};

function recompile(cb) {
  cmd.run('latexmk -pdf ' + output_path + name + '/main.tex');
  cb();
}

function help(cb) {
  console.log("Følgende tasks er tilgængelige:");
  console.log("gulp --name <name>\tbygger projektet");
  console.log("gulp --name <name> --recompile\trecompiler et eksisterende projekt");

  cb()
};

exports.help = help;
exports.deploy = parallel(copy, copyLatex)
exports.default = latex;
exports.latex = latex;
exports.copy = copy;
exports.copyLatex = copyLatex;
exports.recompile = recompile;
