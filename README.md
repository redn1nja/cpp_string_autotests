# cpp_string_autotests

How to use this tests:

*Copy contents of this repository into your cpp_string lab*
```
cp testing <lab_dir> -r
cp run_tests.sh <lab_dir>
```


*navigate to the lab directory and run tests*
```
cd <lab_dir>
./run_tests.sh
```

Windows users on WSL particularry may experience errors running testing scripts because of the newline character difference: `/usr/bin/env: 'bash\r': No such file or directory.`

Such problem is fixed using dos2unix utility which can be installed via package manager. Then:
```
dos2unix run_tests.sh
```
