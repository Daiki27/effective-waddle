# Using OpenCV in swift without objectiveC++
Ref : [Qita : @treastrain, OpenCV が Objective-C / Swift で使えるようになります & 使ってみた](https://qiita.com/treastrain/items/0090d1103033b20de054)

### Procedure

```
git clone https://github.com/opencv/opencv.git
```

```
brew install cmake
cmake -version     #cmake version 3.20.1
```
if User Name = "Alex"
```
cd /Users/Alex/Desktop/opencv/platforms/ios
./build_framework.py .
```

add below, if Project Name = "testProgect"
```
xcode Navigator Area > click "testProgect" > click Targets "testProgect" > General > Frameworks, Libraries, and Embebbed Content
=> add "libc++.tbd" and "opencv2.framework" using + button.
* "libc++.tbd" is prepared in advance at xcode.
* "opencv2.framework" is in /Users/Alex/Desktop/opencv/platforms/ios.
```

and add below
```
xcode Navigator Area > click "testProgect" > click Targets "testProgect" > Build Settings (All Combined) > Serach Paths > Framework Serach Paths
=> add /Users/Alex/Desktop/opencv/platforms/ios

xcode Navigator Area > click "testProgect" > click Targets "testProgect" > Build Settings (All Combined) > Linking > Other Linker Flags
=> add -all_load
```
