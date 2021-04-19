# Using OpenCV in swift without objectiveC++
Ref : [Qita : @treastrain, OpenCV が Objective-C / Swift で使えるようになります & 使ってみた](https://qiita.com/treastrain/items/0090d1103033b20de054)

### Procedure
Copy the remote repository to the local environment.
```
git clone https://github.com/opencv/opencv.git
```
For building oepncv, install cmake using homebrew command.
```
brew install cmake
cmake -version     #cmake version 3.20.1
```
then assuming that user name is "Alex", you can build it with the following command.
```
cd /Users/Alex/Desktop/opencv/platforms/ios
./build_framework.py .
```
Next, you need to apply the framework to your xcode project.
In the following, I assume that the project name is "testProject".
```
xcode Navigator Area > click "testProgect" > click Targets "testProgect" > General > Frameworks, Libraries, and Embebbed Content
=> add "libc++.tbd" and "opencv2.framework" using + button.
* "libc++.tbd" is prepared in advance at xcode.
* "opencv2.framework" is in /Users/Alex/Desktop/opencv/platforms/ios.
```
Also, you need to pass the opencv framework to the projects exectution environment.
```
xcode Navigator Area > click "testProgect" > click Targets "testProgect" > Build Settings (All Combined) > Serach Paths > Framework Serach Paths
=> add /Users/Alex/Desktop/opencv/platforms/ios
```
If you encontter a runtime error, the following tasks may help.
```
xcode Navigator Area > click "testProgect" > click Targets "testProgect" > Build Settings (All Combined) > Linking > Other Linker Flags
=> add -all_load
```
