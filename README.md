# Using OpenCV in swift without objectiveC++
There is a possibility that the version of OpenCV I am using is 2.2, and since you are using OpenCV 4 or later when working with Python and other applications, the usage of OpenCV 2.2 seems to be old and difficult to use compared to that version. Also, I have not been able to even use the additional OpenCV ([opencv_contrib](https://github.com/opencv/opencv_contrib)) instead of the mainstream OpenCV. As a result, it is not possible to use the additional functions such as oil painting style image processing with [xPhoto](https://docs.opencv.org/master/de/daa/group__xphoto.html#gac050a6e876298cb9713cd2c09db9a027).

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

### Execution Result
I implemented a program to extract edge information from input image. The edge extraction is based on the Canny method.  
<p align="center">
  <img src="https://user-images.githubusercontent.com/27540739/115432297-2e66e000-a241-11eb-8594-3b3bfe15cd86.png" />
</p>
### Supplement

### Ref
Outline : [Qita : @treastrain, OpenCV が Objective-C / Swift で使えるようになります & 使ってみた](https://qiita.com/treastrain/items/0090d1103033b20de054)  
Robot Image : https://pixabay.com/ja/illustrations/%E3%83%AD%E3%83%9C%E3%83%83%E3%83%88-%E3%81%8A%E3%82%82%E3%81%A1%E3%82%83-%E9%87%91%E5%B1%9E-1797548/
