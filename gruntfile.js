module.exports = function (grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON("package.json"),
        clean: ["output/"],

        haxe: {
            project: {
                hxml: "build.hxml"
            }
        },

        uglify: {
            options: {
             mangle: true,
             beautify: false,
             compress: {
                drop_console: true
             },
             sourceMap: false,
             report: "min",
             banner: "/*\n" +
                     " * <%= pkg.name %>\n" +
                     " * v<%= pkg.version %>\n" +
                     " * <%= grunt.template.today('yyyy-mm-dd') %>\n" +
                     " **/\n"
            },
            target: {
             files: {
                 "js/matching-cards.min.js": ["js/matching-cards.min.js"]
             }
            }
        },

        copy: {
            main_copy: {
                src: ["assets/**/*.*", "libs/**/*.*", "js/matching-cards.min.js", "index.html"],
                dest: "./output/"
            }
        }
    });

    grunt.loadNpmTasks("grunt-exec");
    grunt.loadNpmTasks("grunt-haxe");
    grunt.loadNpmTasks("grunt-contrib-uglify");
    grunt.loadNpmTasks("grunt-contrib-copy");
    grunt.registerTask("default", ["haxe", "uglify", "copy"]);
};