# flutter clean 
flutter build web 

# root@45.153.231.45      - РФ
# root@194.116.172.240    - Фин

# копирование файлов flutter сборки и nginx на сервер
# scp -r ~/Projects/Algo_RnD/flutter/AlgoLoad-flutter-3/build/web/* root@45.153.231.45:/root/flutter-build-web
# scp -r ~/Projects/Algo_RnD/flutter/AlgoLoad-flutter-3/nginx-virtual-server/* root@45.153.231.45:/root/nginx-files


# msu
scp -i ~/.ssh/id_rsa -P 65187 -r ~/Projects/Algo_RnD/flutter/AlgoLoad-flutter-3/build/web/* algoload@93.180.9.28:~/www/flutter-build-web
# scp -i ~/.ssh/id_rsa -P 65187 -r ~/Projects/Algo_RnD/flutter/AlgoLoad-flutter-3/nginx-virtual-server/* algoload@93.180.9.28:~/www/nginx-files
