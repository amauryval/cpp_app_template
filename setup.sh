APP_DIR="app"

rm -rf "$APP_DIR/build/"
rm -f "$APP_DIR/CMakeCache.txt"
rm -f "$APP_DIR/.ycm_extra_conf.py"
rm -f "$APP_DIR/.ycm_flags.json"
rm -f "$APP_DIR/compile_commands.json"

mkdir "$APP_DIR/build/" && cd "$APP_DIR/build/"
conan install ..

# Use Ninja generator to create MakeFiles ; it should not be re-run (only ninja command is useful)
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. -G Ninja

# ln -s "$APP_DIR/compile_commands.json" ../compile_commands.json # link compile_commands.json to home dir
# ln -s "$APP_DIR/conan_ycm_extra_conf.py" ../.ycm_extra_conf.py
# ln -s "$APP_DIR/conan_ycm_flags.json" ../.ycm_flags.json