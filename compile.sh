# check this page for information: https://dmerej.info/blog/post/chuck-norris-part-1-cmake-ninja/

APP_DIR="app"


cd "$APP_DIR/build/"
# cmake -GNinja ..

# build executable (if changes)
ninja

# run app
echo -e "\n#########################"
echo -e "#    Program Starting   #"
echo -e "#########################\n"

"./bin/$APP_DIR"

echo -e ""

