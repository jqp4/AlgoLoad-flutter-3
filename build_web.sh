flutter clean
flutter build web --base-href="/AlgoLoad-flutter-3/"
rm build/web/flutter_service_worker.js

rm -rf docs
mkdir docs
cp -r build/web/* docs/
cp docs/index.html docs/404.html
