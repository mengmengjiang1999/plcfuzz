./build_plc_to_c.sh
cd static_analyse
python3 main.py
cd ..
./build_shared_library.sh
./build.sh
./buildfuzz.sh